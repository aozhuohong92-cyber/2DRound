RoleFacePanel = class("RoleFacePanel", function ()
	return ccui.Widget:create()
end)

function RoleFacePanel.ctor(slot0, slot1)
	if slot1 then
		slot0.show_item_id = slot1.id
	end

	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()

	slot0.is_first = true
end

function RoleFacePanel.config(slot0)
	slot0.ctrl = RoleController:getInstance()
	slot0.size = cc.size(624, 660)

	slot0:setContentSize(slot0.size)

	slot0.item_list = {}
	slot0.group_list = {}
	slot0.have_list = {}
	slot0.role_vo = slot0.ctrl:getRoleVo()
end

function RoleFacePanel.layoutUI(slot0)
	slot0.main_panel = ccui.Widget:create()

	slot0.main_panel:setContentSize(slot0.size)
	slot0.main_panel:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.main_panel:setPosition(cc.p(slot0.size.width / 2, slot0.size.height / 2))
	slot0:addChild(slot0.main_panel)

	slot0.scroll_view = createScrollView(slot0.size.width - 30, slot0.size.height - 12, 15, 6, slot0.main_panel, ccui.ScrollViewDir.vertical)
	slot0.scroll_view_size = slot0.scroll_view:getContentSize()
	slot1 = createImage(slot0.main_panel, PathTool.getResFrame("common", "common_90024"), slot0.size.width / 2, slot0.size.height / 2, cc.p(0.5, 0.5), true, -1)

	slot1:setScale9Enabled(true)
	slot1:setContentSize(slot0.size)

	slot0.use_btn = createButton(slot0.main_panel, TI18N("更 换"), slot0.size.width / 2, -36, cc.size(161, 62), PathTool.getResFrame("common", "common_1017"), 26, Config.ColorData.data_color4[1])

	slot0.use_btn:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.use_btn:enableOutline(Config.ColorData.data_color4[264], 2)
	slot0.ctrl:sender21500()
end

function RoleFacePanel.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1
end

function RoleFacePanel.registerEvents(slot0)
	if slot0.use_btn then
		slot0.use_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended and uv0.select_item and uv0.select_item:getData() and uv0.select_item:getData() and slot2.base_id then
				if (uv0.select_item:getIsLock() or false) == true then
					uv0.ctrl:sender21503(slot2.base_id)

					return
				end

				slot4 = slot2.base_id

				if slot2.group == 110 then
					for slot8, slot9 in pairs(uv0.have_list) do
						if uv0:isSameGroup(slot9.base_id, slot2.base_id) then
							slot4 = slot9.base_id
						end
					end
				end

				uv0.ctrl:sender21501(slot4)
			end
		end)
	end

	if not slot0.open_view_event then
		slot0.open_view_event = GlobalEvent:getInstance():Bind(RoleEvent.GetFaceList, function (slot0)
			if slot0 and slot0.avatar_frame then
				for slot4, slot5 in pairs(slot0.avatar_frame) do
					if slot5 and slot5.base_id then
						uv0.have_list[slot5.base_id] = slot5

						if Config.AvatarData.data_avatar[slot5.base_id] and slot6.group then
							uv0.group_list[slot6.group] = slot6
						end
					end
				end
			end

			uv0:createItemList()
		end)
	end

	if slot0.role_vo ~= nil and slot0.role_assets_event == nil then
		slot0.role_assets_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "avatar_base_id" and uv0.role_vo and uv0.role_vo.avatar_base_id then
				for slot5, slot6 in pairs(uv0.item_list) do
					if slot6 and slot6:getData() then
						slot6:showUseIcon(false)

						if slot6:getData() and slot7.base_id == uv0.role_vo.avatar_base_id or slot7 and uv0:isSameGroup(slot7.base_id, uv0.role_vo.avatar_base_id) == true and uv0:getGroupByBid(slot7.base_id) == 110 then
							slot6:showUseIcon(true)
						end
					end
				end
			end
		end)
	end
end

function RoleFacePanel.createItemList(slot0)
	slot1 = Config.AvatarData.data_avatar_length or 0

	if not Config.AvatarData.data_avatar then
		return
	end

	slot3 = 1
	slot4 = Array.New()

	for slot8, slot9 in pairs(slot2) do
		if slot9.is_show == 1 then
			slot9.has = 3

			if slot9.loss and next(slot9.loss or {}) ~= nil then
				if not slot0.have_list[slot9.base_id] and slot9.loss[1][2] <= BackpackController:getModel():getBackPackItemNumByBid(slot9.loss[1][1]) then
					slot9.has = 0
				end
			else
				slot9.has = 1
			end

			slot4:PushBack(slot9)
		end
	end

	slot8 = slot4

	for slot8 = 1, slot4.GetSize(slot8) do
		if slot0.have_list[slot4:Get(slot8 - 1).base_id] then
			slot9.has = 2
		end
	end

	slot4:LowerSortByParams("has", "base_id")

	slot5 = slot0.scroll_view_size.width / 4

	slot0.scroll_view:setInnerContainerSize(cc.size(slot0.scroll_view_size.width, math.max(slot0.scroll_view_size.height, math.ceil(slot4:GetSize() / 4) * 175)))

	slot12 = slot4

	for slot12 = 1, slot4.GetSize(slot12) do
		if not slot0.item_list[slot4:Get(slot12 - 1).base_id] then
			slot14 = RoleFaceItem.new()

			slot0.scroll_view:addChild(slot14)

			slot0.item_list[slot13.base_id] = slot14

			slot14:setTouchFunc(function (slot0, slot1)
				if uv0.select_item then
					uv0.select_item:setSelected(false)
				end

				uv0.select_item = slot0

				uv0.select_item:setSelected(true)

				if (uv0.select_item:getIsLock() or false) == true then
					uv0.use_btn:setBtnLabel(TI18N("激 活"))
				else
					uv0.use_btn:setBtnLabel(TI18N("更 换"))
				end

				if uv0.is_first == false then
					slot3 = uv0.select_item:convertToWorldSpace(cc.p(0, 0))

					TipsManager:getInstance():showFaceTips(2, slot0:getData(), cc.p(slot3.x, slot3.y + 100))
				else
					uv0.is_first = false
				end
			end)
		end

		slot0.item_list[slot13.base_id]:setData(slot13)

		if slot0.have_list[slot13.base_id] then
			slot0.item_list[slot13.base_id]:showLock(false)
		end

		if slot0.group_list[slot13.group] and slot13.group == 110 then
			slot0.item_list[slot13.base_id]:showLock(false)
		end

		if slot0.show_item_id ~= nil and (slot13.base_id == slot0.role_vo.avatar_base_id or slot0:isSameGroup(slot13.base_id, slot0.role_vo.avatar_base_id) == true and slot0:getGroupByBid(slot13.base_id) == 110) then
			slot0.item_list[slot13.base_id]:showUseIcon(true)
		end

		if not slot0.select_item then
			if slot0.show_item_id ~= nil then
				if slot13.loss and slot13.loss[1] and slot13.loss[1][1] and slot13.loss[1][1] == slot0.show_item_id then
					slot0.item_list[slot13.base_id]:clickHandler()
				end
			elseif slot0.role_vo and slot0.role_vo.avatar_base_id and slot0.role_vo.avatar_base_id ~= 0 and (slot13.base_id == slot0.role_vo.avatar_base_id or slot0:isSameGroup(slot13.base_id, slot0.role_vo.avatar_base_id) == true and slot0:getGroupByBid(slot13.base_id) == 110) then
				slot0.item_list[slot13.base_id]:showUseIcon(true)
				slot0.item_list[slot13.base_id]:clickHandler()
			end
		elseif slot0.select_item and slot0.select_item:getData() then
			slot15 = slot0.select_item:getData()

			if (slot0.select_item:getIsLock() or false) == true then
				slot0.use_btn:setBtnLabel(TI18N("激 活"))
			else
				slot0.use_btn:setBtnLabel(TI18N("更 换"))
			end
		end

		slot0.item_list[slot13.base_id]:setPosition(cc.p(slot5 * ((slot12 - 1) % slot7) + slot5 * 0.5, slot8 - math.ceil(slot12 / slot7) * slot6 + 100))
	end
end

function RoleFacePanel.isSameGroup(slot0, slot1, slot2)
	if not Config.AvatarData.data_avatar[slot1] then
		return false
	end

	if not Config.AvatarData.data_avatar[slot2] then
		return false
	end

	if slot3.group and slot3.group == slot4.group then
		return true
	end

	return false
end

function RoleFacePanel.getGroupByBid(slot0, slot1)
	if not Config.AvatarData.data_avatar[slot1] then
		return 0
	end

	return slot2.group or 0
end

function RoleFacePanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)

	if slot1 == true then
		-- Nothing
	end
end

function RoleFacePanel.createTimer(slot0, slot1)
	slot1 = slot1 or 0

	if slot0.timer then
		GlobalTimeTicket:getInstance():remove(slot0.timer)

		slot0.timer = nil
	end

	slot2 = slot1

	if not slot0.timer then
		slot0.timer = GlobalTimeTicket:getInstance():add(function ()
			uv1.use_time:setString(string.format(TI18N("使用期限：<div fontcolor=#289b14>%s</div>"), TimeTool.GetTimeFormatDay(uv0)))

			uv0 = uv0 - 1

			if uv0 == 0 and uv1.timer then
				GlobalTimeTicket:getInstance():remove(uv1.timer)

				uv1.timer = nil
			end
		end, 1, slot1)
	end
end

function RoleFacePanel.DeleteMe(slot0)
	if slot0.timer then
		GlobalTimeTicket:getInstance():remove(slot0.timer)

		slot0.timer = nil
	end

	if slot0.open_view_event then
		GlobalEvent:getInstance():UnBind(slot0.open_view_event)

		slot0.open_view_event = nil
	end

	if slot0.head_icon then
		slot0.head_icon:DeleteMe()
	end

	if slot0.role_vo ~= nil and slot0.role_assets_event ~= nil then
		slot0.role_vo:UnBind(slot0.role_assets_event)

		slot0.role_assets_event = nil
	end

	for slot4, slot5 in pairs(slot0.item_list) do
		if slot5 and slot5.DeleteMe then
			slot5:DeleteMe()
		end
	end

	slot0.item_list = nil
end

RoleFaceItem = class("RoleFaceItem", function ()
	return ccui.Widget:create()
end)

function RoleFaceItem.ctor(slot0, slot1)
	slot0.width = 138
	slot0.height = 138
	slot0.index = slot1 or 1
	slot0.is_lock = false
	slot0.is_use = false
	slot0.is_can_active = false
	slot0.ctrl = RoleController:getInstance()

	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(slot0.width, slot0.height))
	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:configUI()
end

function RoleFaceItem.clickHandler(slot0)
	if slot0.call_fun then
		slot0:call_fun(slot0.vo)
	end
end

function RoleFaceItem.setTouchFunc(slot0, slot1)
	slot0.call_fun = slot1
end

function RoleFaceItem.getTouchPos(slot0)
	return slot0.touchPos or nil
end

function RoleFaceItem.configUI(slot0, ...)
	slot0.back = ccui.Widget:create()

	slot0.back:setCascadeOpacityEnabled(true)
	slot0.back:setContentSize(cc.size(slot0.width, slot0.height))
	slot0.back:setAnchorPoint(cc.p(0, 0))
	slot0.back:setTouchEnabled(true)
	slot0:addChild(slot0.back)

	slot0.icon_bg = createImage(slot0.back, PathTool.getResFrame("common", "common_1032"), slot0.width / 2, 69, cc.p(0.5, 0.5), true, 0, false)

	slot0.back:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0.touchPos = slot0:getTouchBeganPosition()

			uv0:clickHandler()
		end
	end)

	slot0.select = ccui.ImageView:create(PathTool.getResFrame("common", "txt_cn_face_using"), LOADTEXT_TYPE_PLIST)

	slot0.select:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.select:setPosition(cc.p(slot0.width / 2, 65))
	slot0.select:setVisible(false)
	slot0:addChild(slot0.select)

	slot0.select_light = ccui.ImageView:create(PathTool.getResFrame("face", "face_05"), LOADTEXT_TYPE_PLIST)

	slot0.select_light:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.select_light:setPosition(cc.p(slot0.width / 2, 65))
	slot0.select_light:setVisible(false)
	slot0:addChild(slot0.select_light, -1)

	slot0.face_icon = createImage(slot0.back, nil, slot0.width / 2, 70, cc.p(0.5, 0.5), false, 1, false)
	slot0.face_name_bg = createImage(slot0.back, PathTool.getResFrame("common", "common_90003"), slot0.width / 2, -27, cc.p(0.5, 0), true)

	slot0.face_name_bg:setScale9Enabled(true)
	slot0.face_name_bg:setContentSize(cc.size(109, 33))

	slot0.face_name = createLabel(22, Config.ColorData.data_color4[1], nil, slot0.width / 2 - 2, -23, "", slot0.back, 0, cc.p(0.5, 0))
	slot0.red_point = createImage(slot0.back, PathTool.getResFrame("common", "common_1014"), 110, 135, cc.p(0, 0), true, 3, false)

	slot0.red_point:setVisible(false)

	slot0.active = createSprite(PathTool.getResFrame("common", "txt_cn_common_30017"), 80, 35, slot0)

	slot0.active:setLocalZOrder(99)
	slot0.active:setScale(0.7)
	slot0.active:setVisible(false)
	slot0:showLock(true)
end

function RoleFaceItem.showActive(slot0, slot1)
	if slot0.active then
		slot0.active:setVisible(slot1)
	end
end

function RoleFaceItem.setFaceNameBgY(slot0, slot1)
	slot0.face_name_bg:setPositionY(slot1)
	slot0.face_name:setPositionY(slot1 + 6)
end

function RoleFaceItem.setData(slot0, slot1, slot2)
	if slot1 == nil then
		return
	end

	if next(slot1) == nil then
		slot0:reset()

		return
	end

	slot0.index = slot2

	slot0:reset()

	slot0.vo = slot1

	if slot1.has ~= 0 then
		slot0.active:setVisible(false)
	else
		slot0.active:setVisible(true)
	end

	slot3 = slot1.res_id or 1
	slot4 = PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. slot3, false, false)
	slot0.scale = 1

	if slot3 == 0 then
		slot0.scale = 0.8547008547008547

		slot0.face_icon:setScale(slot0.scale)
	else
		slot0.scale = 0.811965811965812

		slot0.face_icon:setScale(slot0.scale)
	end

	if not slot0.item_load then
		slot0.item_load = createResourcesLoad(slot4, ResourcesType.single, function ()
			if not tolua.isnull(uv0.face_icon) then
				uv0.face_icon:loadTexture(uv1, LOADTEXT_TYPE)
			end
		end, slot0.item_load)
	end

	if Config.AvatarData.data_avatar[slot1.base_id] then
		slot0.icon_bg:setPositionY(slot0.icon_bg:getPositionY() - slot5.offy)
	end

	slot6 = slot1.name or ""

	slot0.face_name:setString(slot6)

	if StringUtil.SubStringGetTotalIndex(slot6) >= 5 then
		slot0.face_name_bg:setContentSize(cc.size(slot0.face_name:getContentSize().width + 20, 33))
	end

	slot0:updateRedPoint()
end

function RoleFaceItem.showBgEffect(slot0, slot1, slot2, slot3)
	if not slot0.icon_bg then
		return
	end

	if slot1 == false then
		if slot0.bg_effect then
			slot0.bg_effect:clearTracks()
			slot0.bg_effect:removeFromParent()

			slot0.bg_effect = nil
		end
	else
		if slot2.is_only_effect == 1 then
			slot0.face_icon:setVisible(false)
		else
			slot0.face_icon:setVisible(true)
		end

		if slot0.bg_effect == nil then
			slot4, slot5 = nil
			slot0.bg_effect = createEffectSpine(slot2.effect_id, cc.p(slot2.effect_pos_x == 0 and 69 or slot2.effect_pos_x + 15, slot2.effect_pos_y == 0 and 69 or slot2.effect_pos_y + 15), cc.p(0.5, 0.5), true, PlayerAction.action)

			slot0.bg_effect:setScale(slot3 or 1)
			slot0.back:addChild(slot0.bg_effect, 1)
		else
			slot0.bg_effect:setVisible(true)
		end
	end
end

function RoleFaceItem.setSelected(slot0, slot1)
	slot0.select:setVisible(slot1)
	slot0.select_light:setVisible(slot1)
end

function RoleFaceItem.showLock(slot0, slot1)
	slot0.red_point:setVisible(false)

	slot0.is_can_active = false
	slot0.is_lock = slot1

	setChildUnEnabled(slot1, slot0.back, cc.c4b(255, 255, 255, 255))
	setChildUnEnabled(false, slot0.select)
	setChildUnEnabled(false, slot0.select_light)
	setChildUnEnabled(false, slot0.icon_bg)

	if slot1 == true then
		slot0:updateRedPoint()
	end

	if not slot1 and slot0.vo and Config.AvatarData.data_avatar_effect[slot0.vo.res_id or 1] and slot3.effect_id ~= "" then
		slot0:showBgEffect(true, slot3, slot0.scale)
	end
end

function RoleFaceItem.updateRedPoint(slot0)
	if slot0.vo and slot0.vo.loss and slot0.vo.loss[1] and slot0.vo.loss[1][1] and slot0.vo.loss[1][2] then
		if BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot0.vo.loss[1][1]) and slot0.vo.loss[1][2] < slot3 then
			slot0.is_can_active = true

			slot0.red_point:setVisible(true)
		end
	end
end

function RoleFaceItem.showUseIcon(slot0, slot1)
	slot0.is_use = slot1

	if not slot0.use_icon and slot1 == false then
		return
	end

	if not slot0.use_icon then
		slot0.use_icon = createImage(slot0, PathTool.getResFrame("face", "txt_cn_face_use"), 79, 30, cc.p(0.5, 0.5), true, 1, false)
	end

	slot0.use_icon:setVisible(slot1)
end

function RoleFaceItem.reset(slot0)
	slot0.vo = nil
end

function RoleFaceItem.isHaveData(slot0)
	if slot0.vo then
		return true
	end

	return false
end

function RoleFaceItem.getData(slot0)
	return slot0.vo
end

function RoleFaceItem.getIsLock(slot0)
	return slot0.is_lock
end

function RoleFaceItem.getIsActive(slot0)
	return slot0.is_can_active
end

function RoleFaceItem.getIsUse(slot0)
	return slot0.is_use
end

function RoleFaceItem.DeleteMe(slot0)
	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	slot0:showBgEffect(false)
	slot0:removeAllChildren()
	slot0:removeFromParent()

	slot0.vo = nil
end
