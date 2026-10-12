-- Fixed replay view for the first drama stage (D stage).
-- Left: Luffy (testing stand-in) plays the recovered 普通攻击 + Jet.枪 presentation steps.
-- Right: a clearly marked placeholder card, because the enemy model H30012 is not in
-- the local resource set. Hit events only drive presentation; nothing is calculated.
local R = require('offline.resources')
local Player = require('offline.skill_player')
local Skills = require('offline.luffy_skills')
local M = {}

M.skill_ids = {520001, 520101}
M.placeholder_text = '敌方占位 · 海贼1号\n(H30012 资源未到位)'

-- Concatenated presentation steps for the fixed replay.
function M.steps()
    local steps = {}
    for _, id in ipairs(M.skill_ids) do
        for _, step in ipairs(assert(Skills[id], 'missing skill ' .. id).steps) do
            steps[#steps + 1] = step
        end
    end
    return steps
end

function M.new(canvas, size, trace, options)
    local view = {}
    local base_y = options and options.base_y or size.height * 0.5
    local ally_x, enemy_x = size.width * 0.28, size.width * 0.74
    local actor, effects, destroyed, player = nil, {}, false, nil

    local card = cc.LayerColor:create({r = 20, g = 30, b = 30, a = 175}, 230, 100)
    card:setPosition(enemy_x - 115, base_y)
    canvas:addChild(card, 6)
    local card_label = cc.Label:createWithSystemFont(M.placeholder_text, 'sans-serif', 20)
    card_label:setPosition(115, 50)
    card:addChild(card_label)

    local function defer(fn, delay)
        canvas:runAction(cc.Sequence:create(cc.DelayTime:create(delay or .001), cc.CallFunc:create(function()
            if not destroyed then fn() end
        end)))
    end
    local function sound(name)
        if name == '' then return end
        local ok, err = pcall(function()
            cc.SimpleAudioEngine:getInstance():playEffect('sound/battle/' .. name .. '.mp3', false)
        end)
        if not ok then trace('AUDIO_ERROR ' .. tostring(err)) end
    end
    local function set_actor(resource, animation, loop)
        local node = R.skeleton(resource)
        node:setPosition(ally_x, base_y)
        canvas:addChild(node, 6)
        if actor then actor:removeFromParent() end
        actor = node
        if animation then actor:setAnimation(0, animation, loop) end
        return node
    end
    local function clear_effects()
        for node in pairs(effects) do node:removeFromParent() end
        effects = {}
    end
    local function visual(spec, at_enemy)
        local path = 'v9o8qm1Y40cbOAlh6LDp0kMDi5CzXlsO/' .. spec.model .. '/' .. spec.file
        local node = assert(sp.SkeletonAnimation:createBinary(path .. '.skel', path .. '.atlas', 1, 8))
        effects[node] = true
        node:setPosition((at_enemy and enemy_x or ally_x) + spec.x, base_y + 42 + spec.y)
        node:setScale(spec.scale)
        canvas:addChild(node, 9)
        local function remove()
            if effects[node] then effects[node] = nil; node:removeFromParent() end
        end
        node:registerSpineEventHandler(function() defer(remove) end, 2)
        node:setAnimation(0, spec.animation, false)
        defer(remove, 5)
    end
    local function flash_card()
        card:stopAllActions()
        card:setOpacity(255)
        card:runAction(cc.Sequence:create(cc.FadeTo:create(0.08, 90), cc.FadeTo:create(0.2, 175)))
    end

    player = Player.new({
        start = function(step, callbacks, index, total)
            local alive = true
            local node = set_actor(step.resource)
            local function guarded(fn) defer(function() if alive then fn() end end) end
            node:registerSpineEventHandler(function(event)
                local data = {animation = event.animation, eventData = {name = event.eventData and event.eventData.name}}
                guarded(function() callbacks.event(data) end)
            end, 3)
            node:registerSpineEventHandler(function(event)
                local data = {animation = event.animation}
                guarded(function() callbacks.complete(data) end)
            end, 2)
            trace('DRAMA_REPLAY_STEP ' .. index .. '/' .. total .. ' ' .. step.effect_id)
            for _, spec in ipairs(step.caster_effects) do visual(spec, false) end
            sound(step.ready_sound)
            node:setAnimation(0, step.animation, false)
            defer(function() if alive then callbacks.fail('animation timeout: ' .. step.animation) end end, 8)
            return function() alive = false end
        end,
        hit = function(step)
            if step.hit then flash_card() end
            sound(step.attack_sound); sound(step.hit_sound)
            for _, spec in ipairs(step.hit_effects) do visual(spec, true) end
        end,
        done = function()
            if view.on_done then view.on_done() end
        end,
        failed = function(err)
            if view.on_fail then view.on_fail(err) end
        end,
    })

    -- on_done()/on_fail(err) are one-shot per play(); they are cleared by stop().
    function view:play(on_done, on_fail)
        self:stop()
        self.on_done, self.on_fail = on_done, on_fail
        local ok, err = pcall(function()
            clear_effects()
            player:play(M.steps())
        end)
        if not ok then
            self.on_done, self.on_fail = nil, nil
            return nil, tostring(err)
        end
        return true
    end

    function view:stop()
        self.on_done, self.on_fail = nil, nil
        player:stop()
        clear_effects()
        if actor then actor:removeFromParent(); actor = nil end
    end

    function view:destroy()
        self:stop()
        destroyed = true
    end

    return view
end

return M
