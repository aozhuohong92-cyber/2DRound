RoleTitlePanel = class("RoleTitlePanel", function ()
	return ccui.Widget:create()
end)
slot0 = BackpackController:getInstance():getModel()
slot1 = table.insert

function RoleTitlePanel.ctor(slot0)
	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()

	slot0.cur_touch_index = nil
	slot0.have_list = {}
end

function RoleTitlePanel.config(slot0)
	slot0.ctrl = RoleController:getInstance()
	slot0.size = cc.size(624, 660)

	slot0:setContentSize(slot0.size)

	slot0.role_vo = slot0.ctrl:getRoleVo()
	slot0.use_id = 0
	slot0.title_list = {}

	slot0:initItemConfigList()
end

function RoleTitlePanel.layoutUI(slot0)
	slot0.main_panel = ccui.Widget:create()

	slot0.main_panel:setContentSize(slot0.size)
	slot0.main_panel:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.main_panel:setPosition(cc.p(slot0.size.width / 2, slot0.size.height / 2))
	slot0:addChild(slot0.main_panel)

	slot1 = createImage(slot0.main_panel, PathTool.getResFrame("common", "common_1034"), 0, 0, cc.p(0, 0), true)

	slot1:setScale9Enabled(true)
	slot1:setContentSize(slot0.size)

	slot2 = cc.size(slot0.size.width - 12, slot0.size.height - 10)
	slot0.scroll_view = CommonScrollViewLayout.new(slot0.main_panel, cc.p(6, 5), nil, , slot2, {
		start_y = 0,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 127,
		space_y = 0,
		col = 1,
		need_dynamic = true,
		item_class = TitleItem,
		item_width = slot2.width
	})
	slot4 = PathTool.getResFrame("common", "common_1017")
	slot0.use_btn = createButton(slot0.main_panel, TI18N("更 换"), slot0.size.width / 2, -36, cc.size(161, 62), slot4, 26, Config.ColorData.data_color4[1])

	slot0.use_btn:enableOutline(Config.ColorData.data_color4[264], 2)

	slot0.upgrade_btn = createButton(slot0.main_panel, TI18N("升 级"), slot0.size.width / 2 + 100, -36, cc.size(161, 62), slot4, 26, Config.ColorData.data_color4[1])

	slot0.upgrade_btn:enableOutline(Config.ColorData.data_color4[264], 2)
	slot0.upgrade_btn:setVisible(false)
	slot0.ctrl:sender23300()
end

function RoleTitlePanel.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1
end

function RoleTitlePanel.registerEvents(slot0)
	if slot0.use_btn then
		slot0.use_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				if uv0.select_data == nil then
					return
				end

				slot2 = uv0.select_data
				slot3 = slot2.loss[1][1]
				slot4 = slot2.loss[1][2]

				if slot2 and slot2.base_id then
					if slot2.has == 0 then
						uv0.ctrl:sender23303(slot2.base_id)
					elseif slot2.has == 3 then
						if slot2.source and slot2.source ~= 0 then
							uv0:SourceClick(slot2.source)
						end
					else
						uv0.ctrl:sender23301(slot2.base_id)
					end
				end
			end
		end)
	end

	if slot0.updateList == nil then
		slot0.updateList = GlobalEvent:getInstance():Bind(RoleEvent.GetTitleList, function (slot0)
			uv0.current_list = slot0.honor

			for slot4, slot5 in pairs(slot0.honor) do
				if slot0.base_id == slot5.base_id then
					uv0.honor_data = slot5
				end
			end

			uv0.use_id = slot0.base_id

			uv0:updateHaveList(slot0)
			uv0:createItemList()
		end)
	end

	if slot0.updateHaveList_event == nil then
		slot0.updateHaveList_event = GlobalEvent:getInstance():Bind(RoleEvent.UpdataTitleList, function (slot0)
			uv0:updateHaveList(slot0, true)
			uv0:createItemList()
		end)
	end

	if slot0.use_event == nil then
		slot0.use_event = GlobalEvent:getInstance():Bind(RoleEvent.UseTitle, function (slot0)
			if slot0 then
				uv0.use_id = slot0

				uv0:createItemList()
			end
		end)
	end

	if slot0.upgrade_btn then
		slot0.upgrade_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				ForgeHouseController:getInstance():openForgeHouseView(true, ForgeHouseConst.Tab_Index.Role_Title, uv0.honor_data)
			end
		end)
	end
end

function RoleTitlePanel.updateHaveList(slot0, slot1, slot2)
	if slot1 and slot1.honor then
		for slot6, slot7 in pairs(slot1.honor) do
			if slot7 and slot7.base_id then
				slot0.have_list[slot7.base_id] = slot7
			end
		end
	end
end

function RoleTitlePanel.initItemConfigList(slot0)
	slot0.title_list = {}

	for slot4, slot5 in pairs(Config.HonorData.data_title) do
		if slot5.is_show == 1 then
			uv0(slot0.title_list, slot5)
		end
	end
end

function RoleTitlePanel.createItemList(slot0)
	if slot0.title_list == nil or next(slot0.title_list) == nil then
		return
	end

	for slot5, slot6 in ipairs(slot0.title_list) do
		slot6.has = 3
		slot6.auto_click = false

		if slot0.have_list[slot6.base_id] == nil then
			if slot6.loss[1][2] <= uv0:getBackPackItemNumByBid(slot6.loss[1][1]) then
				slot6.has = 0

				if false == false then
					slot6.auto_click = true
					slot1 = true
				end
			end
		else
			if slot0.have_list[slot6.base_id] then
				slot6.expire_time = slot7.expire_time
				slot6.has = 2
			end

			if slot6.base_id == slot0.use_id then
				slot6.has = 1

				if slot1 == false then
					slot6.auto_click = true
					slot1 = true
				end
			end
		end
	end

	slot2 = {}

	for slot6, slot7 in pairs(slot0.title_list) do
		if slot7.is_show_title == 1 then
			if slot7.has ~= 3 then
				uv1(slot2, slot7)
			end
		else
			uv1(slot2, slot7)
		end
	end

	table.sort(slot2, SortTools.tableLowerSorter({
		"has",
		"base_id"
	}))

	if slot1 == false and slot2[1] then
		slot4.auto_click = true
	end

	function slot4(slot0, slot1)
		uv0:titleItemClick(slot0, slot1)
	end

	for slot8, slot9 in pairs(slot0.current_list) do
		for slot13, slot14 in pairs(slot2) do
			if slot9.base_id == slot14.base_id then
				slot14.lev = slot9.lev
			end
		end
	end

	function tab_one(slot0)
		for slot4, slot5 in pairs(slot0) do
			return slot0[slot4]
		end
	end

	for slot8, slot9 in pairs(Config.HonorData.data_artifact_compound) do
		for slot13, slot14 in ipairs(slot2) do
			if slot8 == slot14.base_id and slot14.lev then
				slot14.attr = tab_one(slot9[slot14.lev]).attr
			end
		end
	end

	slot0.scroll_view:setData(slot2, slot4)
end

function RoleTitlePanel.titleItemClick(slot0, slot1, slot2)
	if slot0.select_item then
		slot0.select_item:setSelected(false)
	end

	if slot0.select_data then
		slot0.select_data.auto_click = false
	end

	slot0.select_item = slot1

	slot0.select_item:setSelected(true)

	slot0.select_data = slot0.select_item:getData()

	if slot0.select_data == nil then
		return
	end

	if slot0.cur_touch_index == slot0.select_data.base_id then
		return
	end

	slot0.cur_touch_index = slot0.select_data.base_id

	if slot0.select_data.has == 3 then
		slot0.use_btn:setPositionX(slot0.size.width / 2)
		slot0.upgrade_btn:setVisible(false)
		slot0.use_btn:setBtnLabel(TI18N("前往获取"))
	elseif slot3 == 0 then
		slot0.use_btn:setPositionX(slot0.size.width / 2)
		slot0.upgrade_btn:setVisible(false)
		slot0.use_btn:setBtnLabel(TI18N("激 活"))
	else
		function IsInTable(slot0, slot1)
			for slot5, slot6 in ipairs(slot1) do
				if slot6.base_id == slot0 then
					return true
				end
			end

			return false
		end

		if Config.HonorData.data_artifact_data[slot2.base_id] then
			for slot8, slot9 in pairs(slot0.current_list) do
				if slot0.select_data.base_id == slot9.base_id then
					slot0.honor_data = slot9
				elseif not IsInTable(slot0.select_data.base_id, slot0.current_list) then
					slot0.honor_data = {
						lev = 1,
						base_id = slot0.select_data.base_id
					}
				end
			end

			if slot0.honor_data.lev < slot4.max_lev then
				slot0.use_btn:setPositionX(slot0.size.width / 2 - 100)
				slot0.upgrade_btn:setVisible(true)
				slot0.use_btn:setBtnLabel("更 换")
				slot0.upgrade_btn:setBtnLabel("升 级")
			else
				slot0.use_btn:setBtnLabel("更 换")
				slot0.use_btn:setPositionX(slot0.size.width / 2)
				slot0.upgrade_btn:setVisible(false)
			end
		else
			slot0.upgrade_btn:setVisible(false)
			slot0.use_btn:setPositionX(slot0.size.width / 2 - 100)
			slot0.use_btn:setBtnLabel(TI18N("更 换"))
		end
	end
end

function RoleTitlePanel.isSameGroup(slot0, slot1, slot2)
	if not Config.HonorData.data_title[slot1] then
		return false
	end

	if not Config.HonorData.data_title[slot2] then
		return false
	end

	if slot3.group and slot3.group == slot4.group then
		return true
	end

	return false
end

function RoleTitlePanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)

	if slot1 == true then
		-- Nothing
	end
end

function RoleTitlePanel.SourceClick(slot0, slot1)
	if Config.SourceData.data_source_data[slot1].evt_type and slot2.extend then
		BackpackController:getInstance():gotoItemSources(slot2.evt_type, slot2.extend)
	end
end

function RoleTitlePanel.DeleteMe(slot0)
	if slot0.updateList ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.updateList)

		slot0.updateList = nil
	end

	if slot0.updateHaveList_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.updateHaveList_event)

		slot0.updateHaveList_event = nil
	end

	if slot0.use_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.use_event)

		slot0.use_event = nil
	end

	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()
	end

	slot0.scroll_view = nil
end

TitleItem = class("TitleItem", function ()
	return ccui.Widget:create()
end)

function TitleItem.ctor(slot0)
	slot0.width = 605
	slot0.height = 127
	slot0.is_lock = false
	slot0.is_use = false
	slot0.is_can_active = false
	slot0.ctrl = RoleController:getInstance()

	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(slot0.width, slot0.height))
	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:configUI()
end

function TitleItem.addCallBack(slot0, slot1)
	slot0.call_fun = slot1
end

function TitleItem.clickHandler(slot0, ...)
	if slot0.call_fun then
		slot0:call_fun(slot0.vo)
	end
end

function TitleItem.setTouchFunc(slot0, slot1)
	slot0.call_fun = slot1
end

function TitleItem.getTouchPos(slot0)
	return slot0.touchPos or nil
end

function TitleItem.configUI(slot0, ...)
	slot0.back = ccui.Widget:create()

	slot0.back:setCascadeOpacityEnabled(true)
	slot0.back:setContentSize(cc.size(slot0.width, slot0.height))
	slot0.back:setAnchorPoint(cc.p(0, 0))
	slot0.back:setTouchEnabled(true)
	slot0:addChild(slot0.back)

	slot0.background = createScale9Sprite(PathTool.getResFrame("common", "common_1029"), slot0.width / 2, slot0.height / 2, LOADTEXT_TYPE_PLIST, slot0.back)

	slot0.background:setContentSize(cc.size(slot0.width, slot0.height))
	slot0.back:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0.touchPos = slot0:getTouchBeganPosition()

			uv0:clickHandler()
		end
	end)

	slot0.face_icon = createImage(slot0, nil, 110, 75, cc.p(0.5, 0.5), false, 1, false)
	slot0.attr_label = createRichLabel(22, 58, cc.p(0, 0.5), cc.p(slot0.width / 2 - 50, 80), 2, 0, 320)

	slot0.attr_label:setString(TI18N("无属性加成"))
	slot0:addChild(slot0.attr_label)

	slot0.get_label = createRichLabel(20, 186, cc.p(0, 0.5), cc.p(slot0.width / 2 - 50, 35), 0, 0, 320)

	slot0.get_label:setString(TI18N("获得条件"))
	slot0:addChild(slot0.get_label)

	slot0.time_label = createRichLabel(24, 175, cc.p(0.5, 0.5), cc.p(105, 35))

	slot0.time_label:setString(TI18N("未获得"))
	slot0:addChild(slot0.time_label)

	slot0.use_icon = createImage(slot0, PathTool.getResFrame("face", "txt_cn_face_use"), 35, 105, cc.p(0.5, 0.5), true, 1, false)

	slot0.use_icon:setVisible(false)

	slot0.active = createSprite(PathTool.getResFrame("common", "txt_cn_common_30017"), 35, 105, slot0)

	slot0.active:setLocalZOrder(99)
	slot0.active:setScale(0.7)
	slot0.active:setVisible(false)
	slot0:showLock(true)
end

function TitleItem.showActive(slot0, slot1)
	if slot0.active then
		slot0.active:setVisible(slot1)
	end
end

function TitleItem.updateAttr(slot0)
	if slot0.vo == nil then
		return
	end

	slot2 = ""
	slot3 = {}

	if slot0.vo.attr and next(slot1.attr) then
		for slot7, slot8 in ipairs(slot1.attr) do
			uv0(slot3, slot8)
		end
	end

	if slot1.add_exp ~= 0 then
		uv0(slot3, {
			"_add_exp",
			slot1.add_exp
		})
	end

	if next(slot3) ~= nil then
		for slot7, slot8 in pairs(slot3) do
			if slot8[1] == "_add_exp" then
				slot2 = slot2 .. TI18N("挂机经验: ") .. slot8[2] * 0.1 .. "%"
			else
				if PartnerCalculate.isShowPerByStr(slot9) then
					slot10 = slot10 * 0.1 .. "%"
				end

				slot2 = slot2 .. Config.AttrData.data_key_to_name[slot9] .. ": " .. slot10
			end

			slot2 = slot7 % 2 == 0 and slot2 .. "\n" or slot2 .. "       "
		end
	else
		slot2 = slot2 .. TI18N("无")
	end

	slot0.attr_label:setString(slot2)
end

function TitleItem.setData(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot0.vo = slot1

	slot0:updateAttr()

	if slot1.res_id and slot0.title_res_id ~= PathTool.getTargetRes("honor", "txt_cn_honor_" .. slot1.res_id, false, false) then
		slot0.title_res_id = slot2
		slot0.item_load = loadImageTextureFromCDN(slot0.face_icon, slot2, ResourcesType.single, slot0.item_load)
	end

	slot0.get_label:setString(TI18N("获得条件：") .. slot1.desc)

	if slot1.has == 0 then
		slot0:showActive(true)
		slot0:showLock(true)
		slot0:showUseIcon(false)
	elseif slot1.has == 1 then
		slot0:showUseIcon(true)
		slot0:showActive(false)
		slot0:showLock(false)
	elseif slot1.has == 2 then
		slot0:showUseIcon(false)
		slot0:showLock(false)
		slot0:showActive(false)
	else
		slot0:showUseIcon(false)
		slot0:showActive(false)
		slot0:showLock(true)
	end

	if slot1.auto_click == true then
		slot0:clickHandler()
	else
		slot0:setSelected(false)
	end
end

function TitleItem.setSelected(slot0, slot1)
	if slot1 then
		slot0.vo.auto_click = true

		loadScale9SpriteTexture(slot0.background, PathTool.getResFrame("common", "common_1020"), LOADTEXT_TYPE_PLIST)
	else
		loadScale9SpriteTexture(slot0.background, PathTool.getResFrame("common", "common_1029"), LOADTEXT_TYPE_PLIST)
	end

	slot0.background:setContentSize(cc.size(slot0.width, slot0.height))
end

function TitleItem.showLock(slot0, slot1)
	slot0.is_can_active = false
	slot0.is_lock = slot1
	slot2 = ""

	if slot0.vo then
		slot2 = (not slot0.is_lock or TI18N("未激活")) and (slot0.vo.expire_time <= 0 or TimeTool.GetTimeFormatDay(slot0.vo.expire_time - GameNet:getInstance():getTime())) and TI18N("永久")
	end

	slot0.time_label:setString(slot2)
end

function TitleItem.showUseIcon(slot0, slot1)
	slot0.is_use = slot1

	slot0.use_icon:setVisible(slot1)
end

function TitleItem.reset(slot0)
	slot0.vo = nil
end

function TitleItem.isHaveData(slot0)
	if slot0.vo then
		return true
	end

	return false
end

function TitleItem.getData(slot0)
	return slot0.vo
end

function TitleItem.getIsLock(slot0)
	return slot0.is_lock
end

function TitleItem.getIsActive(slot0)
	return slot0.is_can_active
end

function TitleItem.getIsUse(slot0)
	return slot0.is_use
end

function TitleItem.suspendAllActions(slot0)
	slot0.vo = nil
end

function TitleItem.DeleteMe(slot0)
	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()

	slot0.vo = nil
end
