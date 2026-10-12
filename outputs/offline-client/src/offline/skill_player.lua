-- Presentation sequencer only: never changes HP, rewards, buffs or persisted state.
local Player = {}; Player.__index = Player
function Player.new(adapter)
    assert(type(adapter.start) == 'function')
    return setmetatable({adapter=adapter, generation=0, active=false},Player)
end
function Player:stop()
    self.generation=self.generation+1; self.active=false
    local cancel=self.cancel; self.cancel=nil
    if cancel then cancel() end
end
function Player:play(steps)
    assert(type(steps)=='table' and #steps>0,'animation steps required')
    for _,s in ipairs(steps) do assert(type(s.resource)=='string' and s.resource~='' and type(s.animation)=='string' and s.animation~='') end
    self:stop(); self.active=true
    local generation=self.generation
    local function advance(index)
        if generation~=self.generation then return end
        local cancel=self.cancel;self.cancel=nil;if cancel then cancel() end
        if index>#steps then
            self.active=false
            if self.adapter.done then self.adapter.done() end
            return
        end
        self.index=index
        local step=steps[index];local finished=false;local hit=false
        local function valid() return self.active and generation==self.generation and self.index==index and not finished end
        local callbacks={}
        function callbacks.event(event)
            if not valid() or (event.animation and event.animation~=step.animation) then return end
            local name=event.eventData and event.eventData.name or event.name
            if type(name)=='string' then name=name:lower() end
            -- Original battle code (battle/new_view/skill_act.lua setAnimationWithEvent) fires the
            -- damage/hurt callback from the spine "hit" event (counted against hit_num); the "attack"
            -- event only marks attackPoint/area hit, so it must not drive the impact timing here.
            if name=='hit' and not hit then
                hit=true
                if self.adapter.hit then
                    local ok,err=pcall(self.adapter.hit,step,index,'spine-event')
                    if not ok then callbacks.fail(err) end
                end
            end
        end
        function callbacks.complete(event)
            if not valid() or (event.animation and event.animation~=step.animation) then return end
            if not hit and step.hit and self.adapter.hit then
                local ok,err=pcall(self.adapter.hit,step,index,'completion-fallback')
                if not ok then callbacks.fail(err);return end
            end
            finished=true
            advance(index+1)
        end
        function callbacks.fail(message)
            if not valid() then return end
            self:stop()
            if self.adapter.failed then self.adapter.failed(message) end
        end
        local ok,result=pcall(self.adapter.start,step,callbacks,index,#steps)
        if not ok then callbacks.fail(result)
        elseif valid() then self.cancel=result
        elseif result then result() end
    end
    advance(1)
end
return Player
