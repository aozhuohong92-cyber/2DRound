package.path=arg[1]..'/src/?.lua;'..package.path
local Player=require('offline.skill_player')
local Skills=require('offline.luffy_skills')
local callbacks,played,hits,last_source,done={}, {},0,nil,0
local player=Player.new({start=function(step,cb) played[#played+1]=step.animation;callbacks[#callbacks+1]=cb;return function() end end,
 hit=function(step,index,source) hits=hits+1;last_source=source end,done=function() done=done+1 end})
player:play(Skills[520101].steps)
for i=1,5 do
 local cb=callbacks[i]
 cb.complete({animation='wrong'});assert(#played==i)
 cb.event({animation='action'..i,eventData={name='attack'}});assert(hits==i-1)
 cb.event({animation='action'..i,eventData={name='hit'}})
 cb.event({animation='action'..i,eventData={name='hit'}})
 cb.complete({animation='action'..i})
 cb.complete({animation='action'..i})
end
assert(table.concat(played,',')=='action1,action2,action3,action4,action5')
assert(hits==5 and done==1 and not player.active)
assert(last_source=='spine-event','hit timing must come from the spine hit event, got '..tostring(last_source))
print('PASS five sequential steps, named events, deduplicated hit and completion')
player:play(Skills[520001].steps);local old=callbacks[#callbacks]
player:play(Skills[520301].steps);local current=callbacks[#callbacks]
old.complete({animation='action1'});old.event({name='attack'});assert(player.active and hits==5)
current.complete({animation='action9'});assert(not player.active and hits==5 and done==2)
print('PASS superseded callbacks ignored; passive presentation adds no damage hit')
player:play(Skills[520001].steps);callbacks[#callbacks].complete({animation='action1'})
assert(hits==6 and done==3 and last_source=='completion-fallback')
print('PASS missing hit event produces one explicitly labeled fallback')
player:play(Skills[520001].steps);local cb=callbacks[#callbacks];player:stop();cb.complete({});assert(done==3)
local failures=0
local failing=Player.new({start=function() error('native load failure') end,failed=function() failures=failures+1 end})
failing:play(Skills[520001].steps);assert(failures==1 and not failing.active)
print('PASS cancel and renderer failure terminate safely')

local hitcb
local failed=0
local bad=Player.new({start=function(s,cb) hitcb=cb end,hit=function() error('bad effect') end,failed=function() failed=failed+1 end})
bad:play(Skills[520001].steps);hitcb.event({name='Hit'});assert(not bad.active and failed==1)
bad:play(Skills[520001].steps);hitcb.complete({animation='action1'});assert(not bad.active and failed==2)
print('PASS effect failure terminates both event and fallback paths')
