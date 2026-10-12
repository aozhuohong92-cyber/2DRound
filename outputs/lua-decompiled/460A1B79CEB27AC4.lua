ActionWarriorLevel = ActionWarriorLevel or BaseClass(BaseView)

function ActionWarriorLevel.__init(slot0)
	slot0.ctrl = ActionController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.layout_name = "action/action_warrior_level"
	slot0.is_full_screen = true
	slot0.win_type = WinType.Tips
	slot0.res_list = {}
end

function ActionWarriorLevel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")
	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.btn_rule = slot0.main_container:getChildByName("btn_rule")

	slot0.btn_rule:getChildByName("lab"):setString("规则说明")

	slot0.btn_music = slot0.main_container:getChildByName("btn_music")

	slot0.btn_music:getChildByName("lab"):setString("音乐/开")

	slot0.btn_close = slot0.main_container:getChildByName("btn_close")

	slot0.btn_close:getChildByName("lab"):setString("返回")

	slot0.scroll_container = slot0.main_container:getChildByName("scroll_container")

	slot0:adaptationScreen()
	WarriorTool:intBtnMusic(slot0.btn_music)

	slot0.scroll_view = CommonScrollViewLayout.new(slot0.scroll_container, nil, nil, nil, slot0.scroll_container:getContentSize(), {
		start_y = 0,
		item_width = 147,
		start_x = 0,
		space_x = 15,
		row = 5,
		item_height = 135,
		space_y = 30,
		col = 4,
		need_dynamic = false,
		item_class = WarriorLevelItem
	}, cc.p(0, 0))

	slot0:createLevelData()
	slot0.scroll_view:setData(slot0.level_data)
end

function ActionWarriorLevel.createLevelData(slot0)
	slot0.level_data = {}

	for slot5, slot6 in pairs(Action_Warrior_Event.data_mapinformation) do
		slot1 = 0 + 1
	end

	for slot5 = 1, slot1 do
		table.insert(slot0.level_data, {
			slot5
		})
	end

	WarriorTool.All_Level = #slot0.level_data
end

function ActionWarriorLevel.adaptationScreen(slot0)
	slot1 = display.getTop(slot0.main_container)
	slot2 = display.getBottom(slot0.main_container)
	slot3 = display.getLeft(slot0.main_container)
	slot4 = display.getRight(slot0.main_container)

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot5 = slot1 - slot2

	slot0.btn_close:setPositionY(slot0.scroll_container:getPositionY() - slot0.scroll_container:getContentSize().height * 0.5 - 80)
	slot0.btn_close:setPositionX(slot0.btn_close:getPositionX() + slot4 - slot0.main_container:getContentSize().width)
end

function ActionWarriorLevel.register_event(slot0)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0.ctrl:openActionWarriorLevel(false)
	end, true, 2)
	registerButtonEventListener(slot0.btn_music, function ()
		WarriorTool:setMusic(uv0.btn_music)
	end, true, 2)
	registerButtonEventListener(slot0.btn_rule, function ()
		print("暂无规则")
	end, true, 2)
end

function ActionWarriorLevel.close_callback(slot0)
	slot0.ctrl:openActionWarriorLevel(false)
end

WarriorLevelItem = class("WarriorLevelItem", function ()
	return ccui.Layout:create()
end)

function WarriorLevelItem.ctor(slot0)
	slot0.root_wnd = createImage(slot0, PathTool.getResFrame("action_warrior", "warrior_6"), 0, 0, cc.p(0, 0), true, 3, true)
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:registerEvent()
end

function WarriorLevelItem.registerEvent(slot0)
	slot0.root_wnd:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			WarriorTool.MaxWidth = 525
			WarriorTool.Cur_Level = uv0.root_wnd.tag

			ActionController:getInstance():openActionWarriorLevel(false)
			ActionController:getInstance():openActionWarriorWorld(true)
		end
	end)
end

function WarriorLevelItem.setData(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		slot0.root_wnd.tag = slot6

		if WarriorTool.Max_Level < slot6 then
			slot0:createLock()
			slot0.root_wnd:setTouchEnabled(false)
		elseif slot6 == WarriorTool.Max_Level then
			slot0:createLevelNum(slot6)
			slot0.root_wnd:setTouchEnabled(true)
		else
			slot0:createStar()
			slot0:createLevelNum(slot6)
			slot0.root_wnd:setTouchEnabled(true)
		end
	end
end

function WarriorLevelItem.createLevelNum(slot0, slot1)
	slot0.level_num = CommonNum.new(35, slot0.root_wnd, slot1, -2, cc.p(0.5, 0.5))

	slot0.level_num:setPosition(cc.p(slot0.size.width * 0.45, slot0.size.height * 0.85))
end

function WarriorLevelItem.createLock(slot0)
	slot0._lock = createImage(slot0, PathTool.getResFrame("action_warrior", "warrior_8"), 74, 72, cc.p(0.5, 0.5), true, 4, true)
end

function WarriorLevelItem.createStar(slot0)
	slot1 = {
		cc.p(30, 35),
		cc.p(73, 27),
		cc.p(115, slot5)
	}
	slot5 = 35

	for slot5 = 1, 3 do
		slot0._star = createImage(slot0, PathTool.getResFrame("action_warrior", "warrior_7"), slot1[slot5].x, slot1[slot5].y, cc.p(0.5, 0.5), true, 5, true)

		slot0._star:setScale(0.35)
	end
end

function WarriorLevelItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
