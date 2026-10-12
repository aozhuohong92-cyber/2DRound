local R = require('offline.resources')
local DR = require('offline.drama_resources')
local DefaultFixture = require('offline.drama_fixture')
local Preview = require('offline.drama_preview')
local Challenge = require('offline.drama_challenge')
local Reference = require('offline.drama_reference')
local ReferenceView = require('offline.drama_reference_view')
local Replay = require('offline.drama_replay')
local Record = require('offline.drama_record')
local BattleView = require('offline.drama_battle_view')

local M = {}

-- Set per attach(): the stage shown, and whether the reference-screenshot layout is on.
local Fixture = DefaultFixture
local reference_mode = false

local function find_node(root, name)
    if not root then
        return nil
    end
    if root:getName() == name then
        return root
    end
    for _, child in ipairs(root:getChildren()) do
        local found = find_node(child, name)
        if found then
            return found
        end
    end
end

local function sprite(path, x, y, parent, z)
    local node = assert(cc.Sprite:create(path), 'sprite create failed: ' .. tostring(path))
    node:setAnchorPoint(0, 0)
    node:setPosition(x, y)
    parent:addChild(node, z or 0)
    return node
end

local function add_background(canvas, size, trace)
    local paths = DR.map_background(Fixture.map_id)
    local world = cc.Node:create()
    world:setName('drama_world')
    canvas:addChild(world, 1)

    -- The source foreground includes village artwork intended to sit behind
    -- the original reward panel. Crop that unused lower area in preview mode.
    local near = sprite(paths.near, 0, 0, world, 1)
    local near_size = near:getContentSize()
    local landscape_height = near_size.height - 380
    near:setTextureRect({x = 0, y = 0, width = near_size.width, height = landscape_height})
    local near_copy = sprite(paths.near, near_size.width, 0, world, 1)
    near_copy:setTextureRect({x = 0, y = 0, width = near_size.width, height = landscape_height})

    -- Foreground has transparent sky: overlap the far layer below its rocks.
    local far_y = 300
    local far = sprite(paths.far, 0, far_y, world, 0)
    local far_size = far:getContentSize()
    local far_scale = math.max(1, (size.height - far_y) / far_size.height)
    far:setScale(far_scale)
    local far_step = far_size.width * far_scale
    sprite(paths.far, far_step, far_y, world, 0):setScale(far_scale)

    trace(string.format(
        'DRAMA_BG map=%s far=%.0fx%.0f near=%.0fx%.0f far_scale=%.3f',
        Fixture.map_id, far_size.width, far_size.height,
        near_size.width, near_size.height, far_scale))
    return world, {far = far_size, near = near_size, far_scale = far_scale}
end

local function add_preview_banner(canvas, size, trace)
    local text = Preview.banner_text()
    local label = cc.Label:createWithSystemFont(text, 'sans-serif', reference_mode and 18 or 22)
    label:setName('drama_preview_banner')
    label:setPosition(size.width / 2, reference_mode and size.height - 30 or size.height - 96)
    canvas:addChild(label, 20)
    trace('DRAMA_PREVIEW_BANNER text=' .. text)
    return label
end

local function add_notice(canvas, size, trace)
    local notice = {}
    local label = cc.Label:createWithSystemFont('', 'sans-serif', 22)
    label:setName('drama_preview_notice')
    label:setPosition(size.width / 2, size.height - 178)
    label:setVisible(false)
    canvas:addChild(label, 30)
    notice.label = label

    function notice:show(message)
        label:stopAllActions()
        label:setString(message)
        label:setVisible(true)
        label:runAction(cc.Sequence:create(
            cc.DelayTime:create(1.8),
            cc.CallFunc:create(function()
                label:setVisible(false)
            end)))
        trace('DRAMA_PREVIEW_NOTICE ' .. message)
    end

    return notice
end

local function add_unavailable_region(canvas, size, panel, trace)
    if reference_mode then return end
    local strip = cc.LayerColor:create({r = 25, g = 39, b = 30, a = 190}, size.width - 64, 58)
    strip:setPosition(32, 180)
    canvas:addChild(strip, 6)
    local text = Preview.title(Fixture) .. '    ·    ' .. Preview.region_title .. Preview.region_detail
    local label = cc.Label:createWithSystemFont(text, 'sans-serif', 22)
    label:setName('drama_reward_unavailable')
    label:setPosition(size.width / 2, 209)
    canvas:addChild(label, 7)
    trace('DRAMA_PREVIEW_REGION ' .. Preview.region_title .. '/' .. Preview.region_detail)
end

local function apply_preview_state(panel, trace)
    local hidden = reference_mode and Preview.reference_hidden_nodes or Preview.hidden_nodes
    for _, name in ipairs(hidden) do
        local node = find_node(panel, name)
        if node then
            node:setVisible(false)
            trace('DRAMA_PREVIEW_HIDE ' .. name)
        end
    end

    local title = find_node(panel, 'title_pass')
    if title and title.setString then
        title:setString(Preview.title(Fixture))
        title:setVisible(reference_mode)
        trace('DRAMA_PREVIEW_TITLE ' .. Preview.title(Fixture))
    end
end

local function add_button_list(canvas, size, bottom_height, trace, notice, session, refresh, begin_replay)
    local panel = R.node(DR.button_list)
    panel:setName('drama_button_list')
    panel:setAnchorPoint(0.5, 0)
    -- BttleTopDramaView.createDramaButton(): btn_layout at
    -- bottom_height + 32 and the CSB at -bottom_height - 65.
    panel:setPosition(size.width / 2, -33)
    -- Keep the original bottom navigation above the battle panel. In the
    -- original view hierarchy BttleTopDramaView is on the UI layer below the
    -- persistent mainui bottom container, so its large panel must not cover
    -- the seven bottom icons.
    canvas:addChild(panel, 5)

    local panel_size = panel:getContentSize()
    trace(string.format('DRAMA_BUTTON_LIST size=%.0fx%.0f children=%d',
        panel_size.width, panel_size.height, panel:getChildrenCount()))

    local challenge = find_node(panel, 'guildsign_battle_boss_btn')
    local challenge_item = find_node(panel, 'challenge_item')
    local challenge_label = challenge_item and find_node(challenge_item, 'label')
    if challenge_label and challenge_label.setString then
        challenge_label:setString(Preview.challenge_text)
    end
    local last_challenge_tap = 0
    local function handle_challenge(event)
        -- The bundled Cocos runtime does not expose ccui.TouchEventType as a
        -- complete Lua table; on-device tracing confirms ended == 2.
        if event ~= 2 then
            return
        end
        local now = os.clock()
        if now - last_challenge_tap < 0.2 then
            return
        end
        last_challenge_tap = now
        local request, status = session:request(Fixture.dun_id)
        trace('DRAMA_GATE ' .. status .. ' created=' .. tostring(request ~= nil))
        notice:show(Challenge.messages[status])
        if request then
            begin_replay()
        end
        refresh()
    end
    if challenge and challenge.setTouchEnabled and challenge.addTouchEventListener then
        challenge:setTouchEnabled(true)
        challenge:addTouchEventListener(function(_, event) handle_challenge(event) end)
    end
    if challenge_item and challenge_item.setTouchEnabled and challenge_item.addTouchEventListener then
        challenge_item:setTouchEnabled(true)
        challenge_item:addTouchEventListener(function(_, event) handle_challenge(event) end)
    end
    if challenge then
        local hit = ccui.Button:create()
        hit:setName('drama_challenge_hit')
        hit:setContentSize(challenge:getContentSize())
        hit:setPosition(challenge:getContentSize().width / 2, challenge:getContentSize().height / 2)
        hit:setOpacity(0)
        hit:setTouchEnabled(true)
        hit:addClickEventListener(function()
            handle_challenge(2)
        end)
        challenge:addChild(hit, 1000)
    end

    apply_preview_state(panel, trace)

    local root = find_node(panel, 'root_wnd') or panel
    local function walk(node, depth)
        if depth > 3 then
            return
        end
        local cs = node:getContentSize()
        local text = ''
        if type(node.getString) == 'function' then
            local ok, value = pcall(node.getString, node)
            if ok and value then text = tostring(value) end
        end
        local touch = ''
        if type(node.isTouchEnabled) == 'function' then
            local ok, value = pcall(node.isTouchEnabled, node)
            if ok then touch = tostring(value) end
        end
        trace(string.format('DRAMA_CSB %sname=%s size=%.0fx%.0f vis=%s pos=%.0f,%.0f text=%s touch=%s',
            string.rep(' ', depth), tostring(node:getName()),
            cs.width, cs.height, tostring(node:isVisible()),
            node:getPositionX(), node:getPositionY(), text, touch))
        for _, child in ipairs(node:getChildren()) do
            walk(child, depth + 1)
        end
    end
    walk(root, 0)
    return panel
end

function M.attach(canvas, size, trace, options)
    options = options or {}
    reference_mode = options.reference == true
    Fixture = options.stage or DefaultFixture
    DR.load(trace)
    local world, geometry = add_background(canvas, size, trace)
    add_preview_banner(canvas, size, trace)
    local notice = add_notice(canvas, size, trace)
    local session = Challenge.new(options.state_snapshot, {unlocked = Fixture.dun_id})
    local record_path = options.record_path
        or (cc.FileUtils:getInstance():getWritablePath() .. 'drama-replay-test')
    local records = Record.new(record_path)
    local replay = Replay.new(function(entry)
        local ok, err = records:append(entry)
        trace('DRAMA_REPLAY_RECORD ' .. entry.outcome .. ' run=' .. entry.run_id .. ' ok=' .. tostring(ok ~= nil and ok ~= false))
        return ok and true or nil, err
    end)
    local view = BattleView.new(canvas, size, trace,
        {base_y = reference_mode and (size.height - 1130 * 0.8) or nil})
    local result_label = cc.Label:createWithSystemFont('', 'sans-serif', 21)
    result_label:setName('drama_replay_result')
    result_label:setPosition(size.width / 2, 440)
    canvas:addChild(result_label, 7)
    local refresh
    local function conclude(record)
        if not record then return end
        session:cancel()
        result_label:setString(Replay.summary(record))
        trace('DRAMA_REPLAY_' .. record.outcome:upper() .. ' run=' .. record.run_id)
        refresh()
    end
    local function begin_replay()
        local run, why = replay:start(Fixture.dun_id)
        if not run then
            trace('DRAMA_REPLAY_REJECTED ' .. tostring(why))
            return
        end
        result_label:setString('固定演出进行中 · 我方为测试角色路飞，敌方为占位')
        trace('DRAMA_REPLAY_START run=' .. run)
        local ok, err = view:play(function() conclude(replay:finish(run)) end,
                                  function(e) conclude(replay:fail(run, e)) end)
        if not ok then conclude(replay:fail(run, err)) end
    end
    local function stop_replay()
        view:stop()
        conclude(replay:cancel())
    end
    local debug = cc.Node:create()
    debug:setName('drama_debug_controls')
    debug:setVisible(not reference_mode)
    canvas:addChild(debug, 7)
    local state_label = cc.Label:createWithSystemFont('', 'sans-serif', 21)
    state_label:setPosition(size.width / 2, 385)
    debug:addChild(state_label, 7)
    refresh = function()
        local status = session:status(Fixture.dun_id)
        local names = {empty='队伍为空', ready='可检查挑战入口', busy=replay:playing() and '演出进行中' or '入口已就绪', unavailable='存档不可用', level='等级不足'}
        state_label:setString('首关已开放（独立预览） · ' .. (names[status] or status))
    end
    local function control(text, x, y, width, action)
        local b = ccui.Button:create()
        b:ignoreContentAdaptWithSize(false)
        b:setContentSize({width=width, height=48})
        b:setTitleText(text); b:setTitleFontSize(22); b:setPosition(x,y)
        b:addClickEventListener(action); debug:addChild(b,7)
        return b
    end
    local team_button
    team_button = control('使用测试队伍', size.width/2-150, 325, 260, function()
        stop_replay()
        session:set_test_team(not session.test_team)
        team_button:setTitleText(session.test_team and '取消测试队伍' or '使用测试队伍')
        trace('DRAMA_TEST_TEAM ' .. tostring(session.test_team))
        notice:show(session.test_team and '测试队伍：路飞（不写存档）' or '已恢复存档队伍快照')
        refresh()
    end)
    control('下一关 · 锁定', size.width/2+150, 325, 260, function()
        local _, status = session:request(Fixture.next_id)
        trace('DRAMA_NEXT_GATE ' .. status)
        notice:show(Challenge.messages[status])
    end)
    control('取消入口准备', size.width/2, 270, 260, function()
        session:cancel(); stop_replay(); refresh(); notice:show('已取消入口准备')
    end)
    if reference_mode then
        local toggle = ccui.Button:create()
        toggle:setName('drama_debug_toggle')
        toggle:ignoreContentAdaptWithSize(false)
        toggle:setContentSize({width = 84, height = 44})
        toggle:setTitleText('调试'); toggle:setTitleFontSize(20)
        toggle:setPosition(50, size.height * 0.52)
        toggle:addClickEventListener(function() debug:setVisible(not debug:isVisible()) end)
        canvas:addChild(toggle, 8)
    end
    canvas:registerScriptHandler(function(event)
        if event == 'exit' then
            view:stop()
            replay:close()
            view:destroy()
            session:close()
            trace('DRAMA_GATE_CLOSED')
        end
    end)
    refresh()
    local panel = add_button_list(canvas, size, options.bottom_height or 108, trace, notice, session, refresh, begin_replay)
    add_unavailable_region(canvas, size, panel, trace)
    if reference_mode then
        ReferenceView.attach(canvas, size, Reference, trace)
    end
    M.world = world
    M.button_list = panel
    M.preview_notice = notice
    M.geometry = geometry
    M.fixture = Fixture
    return {world = world, button_list = panel, geometry = geometry}
end

return M
