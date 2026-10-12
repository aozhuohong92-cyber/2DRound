RoleBackgroundPanel = class("RoleBackgroundPanel", function ()
	return ccui.Widget:create()
end)
slot0 = RoleController:getInstance()

function RoleBackgroundPanel.ctor(slot0, slot1)
	if slot1 then
		slot0.show_item_id = slot1.id
	end

	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function RoleBackgroundPanel.config(slot0)
	slot0.size = cc.size(624, 660)

	slot0:setContentSize(slot0.size)

	slot0.item_list = {}
	slot0.items = {}
	slot0.role_vo = uv0:getRoleVo()
end

function RoleBackgroundPanel.layoutUI(slot0)
	slot0.main_panel = ccui.Widget:create()

	slot0.main_panel:setContentSize(slot0.size)
	slot0.main_panel:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.main_panel:setPosition(cc.p(slot0.size.width / 2, slot0.size.height / 2))
	slot0:addChild(slot0.main_panel)

	slot1 = createImage(slot0.main_panel, PathTool.getResFrame("common", "common_90024"), 0, 0, cc.p(0, 0), true, -1)

	slot1:setScale9Enabled(true)
	slot1:setContentSize(slot0.size)

	slot0.use_btn = createButton(slot0.main_panel, TI18N("更 换"), slot0.size.width / 2, -36, cc.size(161, 62), PathTool.getResFrame("common", "common_1017"), 26, Config.ColorData.data_color4[1])

	slot0.use_btn:enableOutline(Config.ColorData.data_color4[264], 2)
	uv0:sender10328()
end

function RoleBackgroundPanel.registerEvents(slot0)
	if slot0.use_btn then
		slot0.use_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				uv0:onUseBtn()
			end
		end)
	end

	if slot0.role_vo ~= nil and slot0.role_assets_event == nil then
		slot0.role_assets_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if not uv0.show_list then
				return
			end

			if not uv0.list_view then
				return
			end

			if slot0 == "backdrop_id" then
				for slot5, slot6 in ipairs(uv0.show_list) do
					slot6.use = 3
				end

				for slot5, slot6 in ipairs(uv0.show_list) do
					if slot6.backdrop_id == slot1 then
						slot6.use = 1
					end
				end

				table.sort(uv0.show_list, SortTools.tableLowerSorter({
					"use",
					"backdrop_id"
				}))
				uv0.list_view:reloadData(1)
			end
		end)
	end

	if not slot0.background_list_event then
		slot0.background_list_event = GlobalEvent:getInstance():Bind(RoleEvent.ROLE_BACKGROUND_LIST_EVENT, function (slot0)
			if not slot0 then
				return
			end

			uv0:updateList(slot0.backdrop_list)
		end)
	end
end

function RoleBackgroundPanel.onUseBtn(slot0)
	if not slot0.role_vo then
		return
	end

	if slot0.select_backdrop_id and slot0.select_backdrop_id ~= slot0.role_vo.backdrop_id then
		uv0:sender10329(slot0.select_backdrop_id)
	else
		message(TI18N("已在使用中"))
	end
end

function RoleBackgroundPanel.updateList(slot0, slot1)
	if not slot1 then
		return
	end

	if not slot0.role_vo then
		return
	end

	if slot0.list_view == nil then
		slot2 = cc.size(slot0.size.width - 12, slot0.size.height - 10)
		slot0.list_view = CommonScrollViewSingleLayout.new(slot0.main_panel, cc.p(6, 5), ScrollViewDir.vertical, ScrollViewStartPos.top, slot2, {
			start_y = 0,
			row = 0,
			start_x = 0,
			space_x = 0,
			item_height = 190,
			space_y = 0,
			col = 1,
			need_dynamic = true,
			item_width = slot2.width
		}, cc.p(0, 0))

		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.onCellTouched), ScrollViewFuncType.OnCellTouched)
	end

	slot0.show_list = {}
	slot2 = table.insert

	for slot6, slot7 in ipairs(slot1) do
		slot8 = Config.ItemData.data_get_data(slot7.backdrop_id)

		if slot7.backdrop_id == 0 or slot8 then
			slot7.config = slot8

			if slot0.show_item_id and slot0.show_item_id == slot7.backdrop_id then
				slot7.use = 2
			elseif slot7.backdrop_id == slot0.role_vo.backdrop_id then
				slot7.use = 1
			else
				slot7.use = 3
			end

			slot2(slot0.show_list, slot7)
		end
	end

	table.sort(slot0.show_list, SortTools.tableLowerSorter({
		"use",
		"backdrop_id"
	}))
	slot0.list_view:reloadData(1)
end

function RoleBackgroundPanel.createNewCell(slot0, slot1, slot2)
	slot3 = RoleBackgroundItem.new(slot1, slot2)

	slot3:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot3
end

function RoleBackgroundPanel.numberOfCells(slot0)
	return #slot0.show_list
end

function RoleBackgroundPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	slot1:setData(slot0.show_list[slot2])

	if slot0.select_backdrop_id then
		if slot0.select_backdrop_id == slot3.backdrop_id then
			slot1:setSelected(true)
		else
			slot1:setSelected(false)
		end
	elseif slot3.use == 1 then
		slot1:setSelected(true)
	else
		slot1:setSelected(false)
	end
end

function RoleBackgroundPanel.onCellTouched(slot0, slot1)
	slot3 = slot0.show_list[slot1.index]

	if slot0.select_item ~= nil then
		slot0.select_item:setSelected(false)
	end

	slot0.select_backdrop_id = slot3.backdrop_id
	slot0.select_item = slot1

	slot0.select_item:setSelected(true)
end

function RoleBackgroundPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function RoleBackgroundPanel.DeleteMe(slot0)
	if slot0.list_view then
		slot0.list_view:DeleteMe()

		slot0.list_view = nil
	end

	slot0.select_item = nil

	if slot0.set_background_event then
		GlobalEvent:getInstance():UnBind(slot0.set_background_event)

		slot0.set_background_event = nil
	end

	if slot0.background_list_event then
		GlobalEvent:getInstance():UnBind(slot0.background_list_event)

		slot0.background_list_event = nil
	end

	if slot0.role_vo ~= nil and slot0.role_assets_event ~= nil then
		slot0.role_vo:UnBind(slot0.role_assets_event)

		slot0.role_assets_event = nil
	end
end

RoleBackgroundItem = class("RoleBackgroundItem", function ()
	return ccui.Widget:create()
end)

function RoleBackgroundItem.ctor(slot0, slot1, slot2)
	slot0.width = slot1 or 600
	slot0.height = slot2 or 180

	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(slot0.width, slot0.height))
	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:configUI()
end

function RoleBackgroundItem.addCallBack(slot0, slot1)
	slot0.call_fun = slot1
end

function RoleBackgroundItem.configUI(slot0)
	slot0.back = ccui.Widget:create()

	slot0.back:setCascadeOpacityEnabled(true)
	slot0.back:setContentSize(cc.size(slot0.width, slot0.height))
	slot0.back:setAnchorPoint(cc.p(0, 0))
	slot0.back:setTouchEnabled(true)
	slot0.back:setSwallowTouches(false)
	slot0:addChild(slot0.back)
	slot0.back:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended and uv0.call_fun then
			uv0.call_fun()
		end
	end)

	slot0.icon = createSprite(nil, slot0.width * 0.5, slot0.height * 0.5, slot0, cc.p(0.5, 0.5), ResourcesType.single)

	slot0.icon:setScale(0.95)
end

function RoleBackgroundItem.setData(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot0.data = slot1

	slot0:showUseIcon(slot1.use == 1)

	slot2 = nil
	slot2 = (not slot0.data.config or PathTool.getPlistImgForDownLoad("rolepersonalspace/rolepersonalspace_head", slot0.data.config.icon)) and PathTool.getPlistImgForDownLoad("rolepersonalspace/rolepersonalspace_head", "100000")

	if slot0.record_res_id == nil or slot0.record_res_id ~= slot2 then
		slot0.record_res_id = slot2
		slot0.item_load = loadSpriteTextureFromCDN(slot0.icon, slot2, ResourcesType.single, slot0.item_load, 60)
	end
end

function RoleBackgroundItem.setSelected(slot0, slot1)
	if slot1 then
		if slot0.select == nil then
			slot0.select = createImage(slot0, PathTool.getResFrame("common", "common_90019"), slot0.width * 0.5, slot0.height * 0.5, cc.p(0.5, 0.5), true, nil, true)

			slot0.select:setContentSize(cc.size(598, 187))
		end

		slot0.select:setVisible(slot1)
		slot0.select:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.FadeIn:create(0.7), cc.FadeOut:create(0.7))))
	elseif slot0.select then
		doStopAllActions(slot0.select)
		slot0.select:setVisible(slot1)
	end
end

function RoleBackgroundItem.showUseIcon(slot0, slot1)
	if not slot0.use_icon and not slot1 then
		return
	end

	if not slot0.use_icon then
		slot0.use_icon = createImage(slot0, PathTool.getResFrame("face", "txt_cn_face_use"), 557, 23, cc.p(0.5, 0.5), true, 1, false)
	end

	slot0.use_icon:setVisible(slot1)
end

function RoleBackgroundItem.DeleteMe(slot0)
	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
