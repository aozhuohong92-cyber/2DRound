ActionFundAwardWindow = ActionFundAwardWindow or BaseClass(BaseView)
slot0 = ActionController:getInstance()

function ActionFundAwardWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "action/action_fund_award_window"
end

function ActionFundAwardWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot0.container, 2)
	slot0.container:getChildByName("win_title"):setString(TI18N("奖励预览"))

	slot2 = slot0.container:getChildByName("list_panel")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 15,
		once_num = 5,
		start_x = 0,
		item_width = 115,
		space_x = 10,
		row = 0,
		item_height = 129,
		space_y = 25,
		col = 5,
		item_class = FuncAwardItem
	})
end

function ActionFundAwardWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0._onClickCloseBtn), false, 2)
end

function ActionFundAwardWindow._onClickCloseBtn(slot0)
	uv0:openActionFundAwardWindow(false)
end

function ActionFundAwardWindow.openRootWnd(slot0, slot1, slot2)
	slot4 = {}

	for slot8, slot9 in ipairs(Config.MonthFundData.data_fund_award[slot1] or {}) do
		table.insert(slot4, {
			day = slot8,
			award = slot9,
			fund_id = slot2
		})
	end

	slot0.item_scrollview:setData(slot4)
end

function ActionFundAwardWindow.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	uv0:openActionFundAwardWindow(false)
end

FuncAwardItem = class("FuncAwardItem", function ()
	return ccui.Widget:create()
end)

function FuncAwardItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function FuncAwardItem.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_fund_item"))

	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(115, 129))
	slot0:setAnchorPoint(0, 0)

	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0.container:getChildByName("image_bg"):loadTexture(PathTool.getResFrame("actionfund", "actionfund_1002"), LOADTEXT_TYPE_PLIST)

	slot0.txt_time = slot0.container:getChildByName("txt_time")

	slot0.txt_time:setTextColor(cc.c3b(100, 50, 35))
end

function FuncAwardItem.register_event(slot0)
end

function FuncAwardItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.txt_time:setString(string.format(TI18N("累计%d天"), slot1.day or 1))

	slot2 = slot1.award[1][1]
	slot3 = slot1.award[1][2]

	if not slot0.item_node then
		slot0.item_node = BackPackItem.new(false, true, false, 0.9, false, true, false)

		slot0.item_node:setDefaultTip(true, false)
		slot0.item_node:setPosition(cc.p(slot0.container:getContentSize().width / 2, 88))
		slot0.container:addChild(slot0.item_node)
	end

	slot0.item_node:setBaseData(slot2, slot3)
end

function FuncAwardItem.DeleteMe(slot0)
	if slot0.item_node then
		slot0.item_node:DeleteMe()

		slot0.item_node = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
