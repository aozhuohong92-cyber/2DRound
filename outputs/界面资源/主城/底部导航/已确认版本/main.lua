-- Offline client entry. Stage 2 target flow: main city -> naming -> summon -> formation.
-- The stage-1 Luffy skill playtest stays reachable through a debug button.
local function trace(s)
    local f = io.open(cc.FileUtils:getInstance():getWritablePath() .. 'probe.txt', 'a')
    if f then f:write(tostring(s) .. '\n'); f:close() end
end
DEBUG = 1
CC_USE_FRAMEWORK = false
CC_SHOW_FPS = false
CC_DISABLE_GLOBAL = false
CC_DESIGN_RESOLUTION = {width = 720, height = 1280, autoscale = 'FIXED_WIDTH'}

local function newScene()
    local director = cc.Director:getInstance()
    director:getOpenGLView():setDesignResolutionSize(720, 1280, 4)
    local size = director:getVisibleSize()
    local origin = director:getVisibleOrigin()
    local scene = cc.Scene:create()
    local canvas = cc.Node:create()
    canvas:setPosition(origin.x, origin.y)
    scene:addChild(canvas)
    canvas:addChild(cc.LayerColor:create({r = 18, g = 32, b = 50, a = 255}))
    return scene, canvas, size, origin
end

local function button(canvas, title, x, y, fn, width, height)
    local b = ccui.Button:create()
    b:setTitleText(title); b:setTitleFontSize(22)
    b:ignoreContentAdaptWithSize(false)
    b:setContentSize({width = width or 150, height = height or 60})
    b:setPosition(x, y)
    b:addClickEventListener(function()
        local ok, err = pcall(fn)
        if not ok then trace('UI_ERROR ' .. tostring(err)) end
    end)
    canvas:addChild(b, 40)
    return b
end

local function label(canvas, message, y, font_size)
    local l = cc.Label:createWithSystemFont(message, 'sans-serif', font_size or 20)
    l:setPosition(cc.Director:getInstance():getVisibleSize().width / 2, y)
    canvas:addChild(l, 30)
    return l
end

local function openSkillPlaytest()
    local scene, canvas, size = newScene()
    cc.Director:getInstance():replaceScene(scene)
    require('offline.presentation').attach(canvas, size, trace)
    trace('SCENE SKILL_PLAYTEST')
end

local function openAtlasViewer()
    local scene, canvas, size = newScene()
    cc.Director:getInstance():replaceScene(scene)
    require('offline.atlas_viewer').attach(canvas, size, trace)
    trace('SCENE ATLAS_VIEWER')
end

local ok, err = xpcall(function()
    trace('BOOT STAGE2')
    require('offline.device_checks').run(cc.FileUtils:getInstance():getWritablePath(), trace)
    local Resources = require('offline.resources')
    local Events = require('offline.events')
    local Store = require('offline.store')
    local State = require('offline.state')
    local bus = Events.new(function(topic, problem) trace('EVENT_ERROR ' .. topic .. ' ' .. tostring(problem)) end)
    local store = Store.new(cc.FileUtils:getInstance():getWritablePath() .. 'offline-state', State.validate)
    local state, state_error = State.new(store, bus)
    local director = cc.Director:getInstance()
    local scene, canvas, size = newScene()
    -- Show a scene before optional native loaders, retaining diagnostic output on Lua errors.
    director:runWithScene(scene)

    local missing = Resources.check()
    assert(#missing == 0, 'Missing assets: ' .. table.concat(missing, ', '))
    trace('ASSETS_OK')
    local city_ok, city_err = pcall(function()
        require('offline.main_city').attach(canvas, size, trace)
    end)
    if not city_ok then trace('MAINCITY_ERROR ' .. tostring(city_err)); label(canvas, '主城 CSB 加载失败，详见 probe.txt', size.height - 100, 20) end
    button(canvas, '技能调试', 95, size.height - 32, openSkillPlaytest, 200)
    button(canvas, '图集调试', size.width - 95, size.height - 32, openAtlasViewer, 200)
    if state then

        trace('STATE_OK ' .. state.status)
    else
        label(canvas, '存档读取失败，已保留原文件', 110, 18)
        trace('STATE_ERROR ' .. tostring(state_error))
    end

    trace('READY STAGE2 ' .. size.width .. 'x' .. size.height)
end, debug.traceback)
if not ok then trace('ERROR ' .. tostring(err)) end
