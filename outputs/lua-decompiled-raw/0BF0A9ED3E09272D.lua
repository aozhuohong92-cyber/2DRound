ProblemPanel = class("ProblemPanel", function ()
	return ccui.Widget:create()
end)
slot0 = 5

function ProblemPanel.ctor(slot0)
	slot0.ctrl = StrongerController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.item_list = {}
	slot0.cur_select = nil
	slot0.cur_index = 1

	slot0:configUI()
	slot0:register_event()
end

function ProblemPanel.configUI(slot0)
	slot0.root_wnd = ccui.Layout:create()

	slot0.root_wnd:setContentSize(cc.size(620, 770))
	slot0.root_wnd:setAnchorPoint(0, 0)
	slot0:addChild(slot0.root_wnd)

	slot0.bg = createScale9Sprite(PathTool.getResFrame("common", "common_1034"), slot0.root_wnd:getContentSize().width / 2, slot0.root_wnd:getContentSize().height / 2, LOADTEXT_TYPE_PLIST, slot0.root_wnd)

	slot0.bg:setContentSize(cc.size(617, 772))
	slot0.bg:setAnchorPoint(0.5, 0.5)

	slot0.scroll = createScrollView(slot0.bg:getContentSize().width, slot0.bg:getContentSize().height - 15, 1, 10, slot0.bg, ccui.ScrollViewDir.vertical)

	slot0:createItemList()
end

function ProblemPanel.createItemList(slot0)
	slot1 = deepCopy(Config.StrongerData.data_problem)

	table.sort(slot1, SortTools.KeyLowerSorter("sort"))

	slot0.max_height = math.max((133 + uv0) * #slot1, slot0.scroll:getContentSize().height)
	slot5 = cc.size

	slot0.scroll:setInnerContainerSize(slot5(slot0.scroll:getContentSize().width, slot0.max_height))

	for slot5, slot6 in pairs(slot1) do
		delayRun(slot0.scroll, 0.05 * slot5, function ()
			slot0 = ProblemItem.new()

			slot0:setData(uv0)
			uv1.scroll:addChild(slot0)
			slot0:setPosition(5, uv1.max_height - 3 - (slot0:getContentSize().height + uv2) * (uv3 - 1))

			uv1.item_list[uv3] = slot0

			slot0:setBtnCallBack(function (slot0)
				uv0.cur_index = uv1

				uv0:clickCallBack(slot0)
			end)
		end)
	end
end

function ProblemPanel.clickCallBack(slot0, slot1)
	if slot0.cur_select ~= nil and slot0.cur_select:getData().id ~= slot1:getData().id then
		slot0.cur_select:setSelect(false)
		slot0.cur_select:showMessagePanel(false)
	end

	slot0.cur_select = slot1

	if slot0.cur_select:getIsShow() then
		slot8 = slot0.scroll:getContentSize().width

		slot0.scroll:setInnerContainerSize(cc.size(slot8, slot0.max_height))

		for slot7, slot8 in pairs(slot0.item_list) do
			slot8:setPosition(5, slot0.max_height - 3 - (slot8:getContentSize().height + uv0) * (slot7 - 1))
		end

		slot0.cur_select:setSelect(false)
		slot0.cur_select:showMessagePanel(false)
	else
		slot0.cur_select:setSelect(true)
		slot0.cur_select:showMessagePanel(true)
		slot0:adjustPos()
	end

	if slot0.cur_select then
		slot4 = (slot0.cur_index - 1) * 136 / slot0.max_height * 100

		if slot0.height then
			slot4 = (slot0.cur_index - 1) * 270 / (slot0.max_height + slot0.height) * 100
		end

		slot0.scroll:jumpToPercentVertical(math.ceil(slot4))
	end
end

function ProblemPanel.adjustPos(slot0)
	if slot0.cur_select ~= nil then
		slot0.height = slot0.cur_select.msg_panel:getContentSize().height or 310

		slot0.scroll:setInnerContainerSize(cc.size(slot0.scroll:getContentSize().width, slot0.max_height + slot0.height))

		for slot5, slot6 in pairs(slot0.item_list) do
			if slot5 <= slot0.cur_index then
				slot6:setPosition(5, slot0.max_height + slot0.height - 3 - (133 + uv0) * (slot5 - 1))
			else
				slot6:setPosition(5, slot1 - 3 - slot0.height - (133 + uv0) * (slot5 - 1))
			end
		end
	end
end

function ProblemPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function ProblemPanel.register_event(slot0)
end

function ProblemPanel.DeleteMe(slot0)
	doStopAllActions(slot0.scroll)

	if slot0.item_list and slot0.item_list ~= nil then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end
	end
end

ProblemItem = class("ProblemItem", function ()
	return ccui.Widget:create()
end)

function ProblemItem.ctor(slot0)
	slot0.ctrl = StrongerController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.item_list = {}
	slot0.is_show = false

	slot0:configUI()
	slot0:register_event()
end

function ProblemItem.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("stronger/problem_item"))

	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 1)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(604, 133))
	slot0:setTouchEnabled(true)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.name = slot0.main_container:getChildByName("name")
	slot0.bg = slot0.main_container:getChildByName("bg")
	slot0.btn = slot0.main_container:getChildByName("btn")

	slot0.btn:setTitleText(TI18N("查看"))
	UITool.SetTitleColor(slot0.name)

	slot0.btn.label = slot0.btn:getTitleRenderer()

	if slot0.btn.label ~= nil then
		slot0.btn.label:enableOutline(cc.c4b(41, 74, 21, 255), 2)
	end
end

function ProblemItem.register_event(slot0)
	slot0.btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.btn_callback then
				uv0:btn_callback()
			end
		end
	end)
	slot0:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0.touch_end = slot0:getTouchEndPosition()
			slot2 = true

			if uv0.touch_began ~= nil then
				slot2 = math.abs(uv0.touch_end.x - uv0.touch_began.x) <= 20 and math.abs(uv0.touch_end.y - uv0.touch_began.y) <= 20
			end

			if slot2 == true then
				playButtonSound2()

				if uv0.callback then
					uv0:callback()
				end
			end
		elseif slot1 == ccui.TouchEventType.moved then
			-- Nothing
		elseif slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()
		elseif slot1 == ccui.TouchEventType.canceled then
			-- Nothing
		end
	end)
end

function ProblemItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function ProblemItem.setBtnCallBack(slot0, slot1)
	slot0.btn_callback = slot1
end

function ProblemItem.setData(slot0, slot1)
	slot0.data = slot1

	slot0.name:setString(slot1.name)
end

function ProblemItem.getData(slot0)
	return slot0.data
end

function ProblemItem.getIsShow(slot0)
	return slot0.is_show
end

function ProblemItem.setSelect(slot0, slot1)
	slot2 = nil

	slot0.bg:loadTexture((not slot1 or PathTool.getResFrame("common", "common_1020")) and PathTool.getResFrame("common", "common_1029"), LOADTEXT_TYPE_PLIST)
end

function ProblemItem.showMessagePanel(slot0, slot1)
	slot0.is_show = slot1

	if slot1 then
		if slot0.msg_panel == nil then
			slot0:createMessagePanel()
		end

		slot0.btn:setTitleText(TI18N("收起"))
	else
		slot0.btn:setTitleText(TI18N("查看"))
	end

	slot0.msg_panel:setVisible(slot1)
end

function ProblemItem.createMessagePanel(slot0)
	if slot0.msg_panel == nil then
		slot0.msg_panel = createScale9Sprite(PathTool.getResFrame("common", "common_2008"), 10, -5, LOADTEXT_TYPE_PLIST, slot0.main_container)

		slot0.msg_panel:setContentSize(cc.size(585, 210))
		slot0.msg_panel:setAnchorPoint(0, 1)
	end

	slot0.desc = createRichLabel(22, 175, cc.p(0, 1), cc.p(17, slot0.msg_panel:getContentSize().height - 15), 0, 0, 550)

	slot0.msg_panel:addChild(slot0.desc)
	slot0.desc:setString(slot0.data.desc)
	slot0.msg_panel:setContentSize(cc.size(585, slot0.desc:getSize().height + 20))
	slot0.desc:setPosition(17, slot0.msg_panel:getContentSize().height - 7)
end

function ProblemItem.DeleteMe(slot0)
end
