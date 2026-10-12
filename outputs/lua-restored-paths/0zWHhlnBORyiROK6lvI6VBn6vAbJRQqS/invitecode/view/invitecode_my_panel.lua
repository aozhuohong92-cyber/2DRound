InviteCodeMyPanel = class("InviteCodeMyPanel", function ()
	return ccui.Widget:create()
end)
slot0 = InviteCodeController:getInstance()
slot1 = Config.InviteCodeData.data_tesk_list
slot2 = string.format

function InviteCodeMyPanel.ctor(slot0)
	slot0.is_init = true

	slot0:layoutUI()
	slot0:registerEvents()
end

function InviteCodeMyPanel.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("invitecode/invitecode_my_panel"))

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(720, 640))

	slot2 = slot0.root_wnd:getChildByName("main_container"):getChildByName("good_cons")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 0,
		item_width = 690,
		start_x = 16,
		space_x = 0,
		row = 0,
		item_height = 147,
		space_y = 3,
		col = 1,
		need_dynamic = true,
		item_class = InviteCodeMyItem
	})

	slot0.item_scrollview:setSwallowTouches(false)
end

function InviteCodeMyPanel.registerEvents(slot0)
	if not slot0.invite_code_event then
		slot0.invite_code_event = GlobalEvent:getInstance():Bind(InviteCodeEvent.InviteCode_My_Event, function ()
			uv0:getTeskData()
		end)
	end
end

function InviteCodeMyPanel.getTeskData(slot0)
	slot1 = uv0:getModel():getInviteCodeTeskData()

	if slot0.item_scrollview and next(slot1) ~= nil then
		if slot0.is_init == true then
			slot0.is_init = false

			slot0.item_scrollview:setData(slot1)
		else
			slot0.item_scrollview:resetAddPosition(slot1)
		end
	end
end

function InviteCodeMyPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function InviteCodeMyPanel.DeleteMe(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	if slot0.invite_code_event then
		GlobalEvent:getInstance():UnBind(slot0.invite_code_event)

		slot0.invite_code_event = nil
	end
end

InviteCodeMyItem = class("InviteCodeMyItem", function ()
	return ccui.Widget:create()
end)

function InviteCodeMyItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function InviteCodeMyItem.configUI(slot0)
	slot0.rootWnd = createCSBNote(PathTool.getTargetCSB("invitecode/invitecode_my_item"))

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:addChild(slot0.rootWnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(690, 147))

	slot1 = slot0.rootWnd:getChildByName("main_container")
	slot0.btn_get = slot1:getChildByName("btn_get")

	slot0.btn_get:setVisible(false)
	slot0.btn_get:getChildByName("Text_1"):setString(TI18N("领取"))

	slot0.btn_goto = slot1:getChildByName("btn_goto")

	slot0.btn_goto:setVisible(false)
	slot0.btn_goto:getChildByName("Text_1"):setString(TI18N("未达成"))

	slot0.has_spr = slot1:getChildByName("has_spr")

	slot0.has_spr:setVisible(false)

	slot0.tesk_num = slot1:getChildByName("tesk_num")
	slot0.title_name = slot1:getChildByName("title_name")

	slot0.title_name:setString("")

	slot2 = slot1:getChildByName("good_cons")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 3,
		start_x = 0,
		need_dynamic = true,
		space_x = 10,
		row = 1,
		space_y = 0,
		col = 0,
		scale = 0.7,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.7,
		item_height = BackPackItem.Height * 0.7
	})

	slot0.item_scrollview:setSwallowTouches(false)
end

function InviteCodeMyItem.setData(slot0, slot1)
	if not slot1 or next(slot1) == nil then
		return
	end

	slot0.data = slot1

	if uv0[slot1.id] then
		slot0.title_name:setString(uv0[slot1.id].desc or "")
	end

	if uv1:getModel():getInviteCodeFinishData(slot1.id) and next(slot2) then
		slot0.btn_goto:setVisible(false)

		slot3 = slot2.num or 0

		slot0.tesk_num:setString(uv2("(%d/%d)", slot3, slot1.num))

		if slot3 > (slot2.had or 0) then
			slot0.has_spr:setVisible(false)
			slot0.btn_get:setVisible(true)
		else
			slot0.has_spr:setVisible(true)
			slot0.btn_get:setVisible(false)
		end
	else
		slot0.has_spr:setVisible(false)
		slot0.btn_goto:setVisible(true)
		slot0.tesk_num:setString(uv2("(%d/%d)", 0, slot1.num))
	end

	slot3 = {}

	if uv0[slot1.id] then
		slot7 = slot1.id

		for slot7, slot8 in pairs(uv0[slot7].items) do
			table.insert(slot3, {
				bid = slot8[1],
				quantity = slot8[2]
			})
		end
	end

	if #slot3 > 5 then
		slot0.item_scrollview:setClickEnabled(true)
	else
		slot0.item_scrollview:setClickEnabled(false)
	end

	slot0.item_scrollview:setData(slot3)
	slot0.item_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.item_scrollview:getItemList()) do
			slot5:setDefaultTip()
			slot5:setSwallowTouches(false)
		end
	end)
end

function InviteCodeMyItem.register_event(slot0)
	registerButtonEventListener(slot0.btn_get, function ()
		if uv0.data then
			uv1:sender19805(uv0.data.id)
		end
	end, true, 1)
	registerButtonEventListener(slot0.btn_goto, function ()
		message(TI18N("您邀请的用户还未达成目标哦~~~"))
	end, true, 1)
end

function InviteCodeMyItem.DeleteMe(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
