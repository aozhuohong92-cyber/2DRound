local R=require('offline.resources')
local Player=require('offline.skill_player')
local Skills=require('offline.luffy_skills')
local M={}
function M.attach(canvas,size,trace)
    local actor,target,player
    local status=cc.Label:createWithSystemFont('路飞技能演出 / 待真机验证','sans-serif',22)
    status:setPosition(size.width/2,size.height*.33);canvas:addChild(status,20)
    local function defer(fn,delay)
        canvas:runAction(cc.Sequence:create(cc.DelayTime:create(delay or .001),cc.CallFunc:create(fn)))
    end
    local function sound(name)
        if name=='' then return end
        local ok,err=pcall(function()
            local id=cc.SimpleAudioEngine:getInstance():playEffect('sound/battle/'..name..'.mp3',false)
            trace('AUDIO_REQUEST '..name..' '..tostring(id))
        end)
        if not ok then trace('AUDIO_ERROR '..tostring(err)) end
    end
    local function replace_actor(resource,animation,loop)
        local next_actor=R.skeleton(resource)
        next_actor:setPosition(size.width*.31,size.height*.46)
        canvas:addChild(next_actor,6)
        if actor then actor:removeFromParent() end
        actor=next_actor
        if animation then actor:setAnimation(0,animation,loop) end
        return actor
    end
    local effects={}
    local function clear_effects()
        for node in pairs(effects) do node:removeFromParent() end
        effects={}
    end
    local function visual(spec,is_target)
        local path='v9o8qm1Y40cbOAlh6LDp0kMDi5CzXlsO/'..spec.model..'/'..spec.file
        local n=assert(sp.SkeletonAnimation:createBinary(path..'.skel',path..'.atlas',1,8))
        effects[n]=true
        n:setPosition(size.width*(is_target and .74 or .31)+spec.x,size.height*.46+spec.y)
        n:setScale(spec.scale);canvas:addChild(n,9)
        local function remove()
            if effects[n] then effects[n]=nil;n:removeFromParent() end
        end
        n:registerSpineEventHandler(function() defer(remove) end,2)
        n:setAnimation(0,spec.animation,false)
        defer(remove,5)
        trace('VFX_PLAY '..spec.id..' '..spec.model..' '..spec.animation)
    end
    local target_generation=0
    local function target_pose(action)
        target_generation=target_generation+1
        local generation=target_generation
        local n=R.skeleton(action);n:setScaleX(-1)
        n:setPosition(size.width*.74,size.height*.46)
        canvas:addChild(n,6)
        if target then target:removeFromParent() end
        target=n
        if action=='hurt' then
            n:registerSpineEventHandler(function()
                defer(function() if generation==target_generation then target_pose('stand2') end end)
            end,2)
        end
        n:setAnimation(0,action,action=='stand2')
    end
    player=Player.new({
        start=function(step,callbacks,index,total)
            local n=replace_actor(step.resource)
            local alive=true
            local function guarded(fn) defer(function() if alive then fn() end end) end
            n:registerSpineEventHandler(function(event)
                -- Copy fields before leaving the native callback.
                local data={animation=event.animation,eventData={name=event.eventData and event.eventData.name}}
                trace('SPINE_EVENT '..step.effect_id..' '..tostring(data.animation)..' '..tostring(data.eventData.name))
                guarded(function() callbacks.event(data) end)
            end,3)
            n:registerSpineEventHandler(function(event)
                local data={animation=event.animation}
                guarded(function() callbacks.complete(data) end)
            end,2)
            status:setString('演出 '..index..'/'..total..' · '..step.resource..' / '..step.animation)
            trace('SKILL_STEP '..step.effect_id..' '..step.resource..' '..step.animation)
            for _,spec in ipairs(step.caster_effects) do visual(spec,false) end
            sound(step.ready_sound)
            n:setAnimation(0,step.animation,false)
            defer(function() if alive then callbacks.fail('animation timeout: '..step.animation) end end,8)
            return function() alive=false end
        end,
        hit=function(step,index,source)
            if step.hit then target_pose('hurt') end
            sound(step.attack_sound);sound(step.hit_sound)
            trace('SKILL_HIT '..step.effect_id..' '..source)
            for _,spec in ipairs(step.hit_effects) do visual(spec,true) end
        end,
        done=function()
            replace_actor('stand2','stand2',true)
            status:setString('演出完成 · 固定演示 / 不计算伤害')
            trace('SKILL_SEQUENCE_DONE')
        end,
        failed=function(err)
            status:setString('演出失败，详见日志');trace('SKILL_ERROR '..tostring(err))
            replace_actor('stand2','stand2',true)
        end
    })
    local function preview(action)
        player:stop();clear_effects();target_pose('stand2');replace_actor(action,action,true)
        status:setString('单动作预览 · '..action);trace('SPINE_OK '..action)
    end
    local function button(title,x,y,fn,width)
        local b=ccui.Button:create();b:setTitleText(title);b:setTitleFontSize(23)
        b:ignoreContentAdaptWithSize(false);b:setContentSize({width=width or 130,height=64})
        b:setPosition(x,y);b:addClickEventListener(function()
            local ok,err=pcall(fn);if not ok then player:stop();trace('PRESENTATION_ERROR '..tostring(err));status:setString('资源错误，详见日志') end
        end);canvas:addChild(b,30)
    end
    for i,entry in ipairs({{'待机','stand2'},{'普攻段','action1'},{'技能段','action2'},{'受击','hurt'},{'移动','run'}}) do
        local action=entry[2];button(entry[1],72+(i-1)*144,190,function() preview(action) end)
    end
    for i,id in ipairs({520001,520101,520301}) do
        local skill=Skills[id]
        button(skill.name,120+(i-1)*240,270,function() clear_effects();target_pose('stand2');player:play(skill.steps) end,220)
    end
    preview('stand2')
    canvas:registerScriptHandler(function(event) if event=='exit' then player:stop();clear_effects();target_generation=target_generation+1 end end)
end
return M
