StrongerItem = class("StrongerItem", function ()
	return ccui.Widget:create()
end)

function StrongerItem.ctor(slot0, slot1)
	slot0.ctrl = StrongerController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.item_list = {}
	slot0.scroe = {}
	slot0.max = {}

	slot0:configUI()
	slot0:register_event()
end

function StrongerItem.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("stronger/stronger_item"))

	slot0:setAnchorPoint(cc.p(0, 1))
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(606, 133))
	slot0:setTouchEnabled(true)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0.main_container:setTouchEnabled(true)
	slot0.main_container:setSwallowTouches(false)

	slot0.bg = slot0.main_container:getChildByName("bg")
	slot0.name = slot0.main_container:getChildByName("name")

	UITool.SetTitleColor(slot0.name)

	slot0.title = slot0.main_container:getChildByName("title")

	slot0.title:setString(TI18N("当前评分/本服最高："))
	slot0.title:setTextColor(cc.c4b(21, 184, 21, 255))

	slot0.btn = slot0.main_container:getChildByName("btn")

	slot0.btn:setTitleText(TI18N("展开"))

	slot0.btn.label = slot0.btn:getTitleRenderer()

	if slot0.btn.label ~= nil then
		slot0.btn.label:enableOutline(cc.c4b(2, 0, 25, 255), 2)
	end

	slot0.goods_icon = slot0.main_container:getChildByName("goods_icon")
end

function StrongerItem.setData(slot0, slot1)
	slot0.data = slot1

	slot0.name:setString(slot1.name)

	if slot1.icon then
		loadSpriteTexture(slot0.goods_icon, PathTool.getItemRes(slot1.icon), LOADTEXT_TYPE)
	end
end

function StrongerItem.register_event(slot0)
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

function StrongerItem.hideBg(slot0)
	slot0.title:setString(slot0.data.desc)
	slot0.btn:setPositionY(68)
end

function StrongerItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function StrongerItem.setBtnCallBack(slot0, slot1)
	slot0.btn_callback = slot1
end

function StrongerItem.getIsShow(slot0)
	return slot0.is_show
end

function StrongerItem.setSelect(slot0, slot1)
	slot2 = nil

	slot0.bg:loadTexture((not slot1 or PathTool.getResFrame("common", "common_1020")) and PathTool.getResFrame("common", "common_1029"), LOADTEXT_TYPE_PLIST)
end

function StrongerItem.showMessagePanel(slot0, slot1)
	slot0.is_show = slot1

	if slot1 then
		if slot0.msg_panel == nil then
			slot0:createMessagePanel()
		end

		slot0.btn:setTitleText(TI18N("收起"))
	else
		slot0.btn:setTitleText(TI18N("展开"))
	end

	slot0.msg_panel:setVisible(slot1)
end

function StrongerItem.createMessagePanel(slot0)
	if slot0.msg_panel == nil then
		slot0.msg_panel = ccui.Layout:create()

		slot0.msg_panel:setAnchorPoint(0, 1)
		slot0.main_container:addChild(slot0.msg_panel)
	end

	if slot0.data.final_sub_list and next(slot0.data.final_sub_list) ~= nil then
		slot0.msg_panel:setContentSize(cc.size(585, #slot0.data.final_sub_list * 123))

		slot5 = 10
		slot6 = 0

		slot0.msg_panel:setPosition(slot5, slot6)

		for slot5, slot6 in pairs(slot0.data.final_sub_list) do
			slot7 = StrongerSecItem.new()
			slot0.item_list[slot5] = slot7

			slot7:setData(Config.StrongerData.data_resource_two[slot6])
			slot0.msg_panel:addChild(slot7)
			slot7:setPosition(cc.p(0, slot0.msg_panel:getContentSize().height - 123 * (slot5 - 1)))
		end
	end
end

function StrongerItem.hideBgII(slot0)
	for slot4, slot5 in pairs(slot0.item_list) do
		slot5:hideBg()
	end
end

function StrongerItem.getMsgPanleSize(slot0)
	if slot0.msg_panel then
		return slot0.msg_panel:getContentSize()
	end
end

function StrongerItem.clearList(slot0)
end

function StrongerItem.DeleteMe(slot0)
	if slot0.item_list and slot0.item_list ~= nil then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end
	end
end
