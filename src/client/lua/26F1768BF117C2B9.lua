ElementEctypeWindow = ElementEctypeWindow or BaseClass(BaseView)
slot1 = ElementController:getInstance():getModel()
slot2 = table.insert

function ElementEctypeWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.layout_name = "element/element_ectype_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("element", "element"),
			type = ResourcesType.plist
		}
	}
	slot0.count_is_full = false
	slot0.skill_items = {}
end

function ElementEctypeWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.con_layout = slot0.main_container:getChildByName("con_layout")
	slot0.title_bg = slot0.con_layout:getChildByName("title_bg")

	slot0.title_bg:ignoreContentAdaptWithSize(true)

	slot0.hero_bg = slot0.con_layout:getChildByName("hero_bg")

	slot0.hero_bg:ignoreContentAdaptWithSize(true)

	slot0.icon_type = slot0.con_layout:getChildByName("icon_type")
	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.add_count_btn = slot0.main_container:getChildByName("add_count_btn")
	slot0.title_txt = slot0.con_layout:getChildByName("title_txt")
	slot0.attr_desc = slot0.con_layout:getChildByName("attr_desc")
	slot0.time_txt = slot0.main_container:getChildByName("time_txt")
	slot0.sp_time = slot0.main_container:getChildByName("sp_time")
	slot0.count_txt = slot0.main_container:getChildByName("count_txt")

	slot0.con_layout:getChildByName("title_attr"):setString(TI18N("属性克制"))
	slot0.con_layout:getChildByName("title_skill"):setString(TI18N("BOSS特点"))
	slot0.main_container:getChildByName("title_count"):setString(TI18N("挑战次数:"))

	slot0.offset_y = display.getTop(slot0.main_container) - CC_DESIGN_RESOLUTION.height

	slot0.con_layout:setPositionY(slot0.offset_y)

	slot2 = slot0.con_layout:getChildByName("item_list")
	slot3 = slot2:getContentSize()
	slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot2, cc.p(0, -slot0.offset_y), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot3.width, slot3.height + slot0.offset_y), {
		start_y = 0,
		row = 0,
		start_x = 0,
		space_x = 0,
		item_width = 720,
		item_height = 132,
		space_y = 20,
		col = 1,
		need_dynamic = true
	})

	slot0.item_scrollview:setSwallowTouches(false)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
end

function ElementEctypeWindow._createNewCell(slot0)
	return ElementEctypeItem.new()
end

function ElementEctypeWindow._numberOfCells(slot0)
	if not slot0.show_customs_data then
		return 0
	end

	return #slot0.show_customs_data
end

function ElementEctypeWindow._updateCellByIndex(slot0, slot1, slot2)
	if not slot0.show_customs_data then
		return
	end

	slot1.index = slot2

	if not slot0.show_customs_data[slot2] then
		return
	end

	slot1:setExtendData({
		customs_id = slot0.customs_id,
		ele_type = slot0.ele_type
	})
	slot1:setData(slot3)
end

function ElementEctypeWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openElementEctypeWindow(false)
	end, false, 2)
	registerButtonEventListener(slot0.add_count_btn, handler(slot0, slot0._onClickAddCountBtn), true)
	slot0:addGlobalEvent(ElementEvent.Update_Element_Count_Event, function ()
		uv0.element_data = uv1:getElementData()

		uv0:refreshChallengeCountInfo()
		uv0:updateLeftBuyCount()
	end)
	slot0:addGlobalEvent(ElementEvent.Update_Element_Customs_Event, function ()
		if uv0.ele_type then
			uv0.customs_id = uv1:getElementCustomsIdByType(uv0.ele_type)

			uv0:updateShowCustomsData()
			uv0.item_scrollview:reloadData(uv0:getDefaultItemIndex())
		end
	end)
end

function ElementEctypeWindow.updateShowCustomsData(slot0)
	slot1 = Config.ElementTempleData.data_customs[slot0.unit_group]
	slot0.show_customs_data = {}

	if slot0.customs_id and slot1 then
		for slot5, slot6 in ipairs(slot1) do
			if slot6.limit_dun_id and slot6.limit_dun_id <= slot0.customs_id then
				uv0(slot0.show_customs_data, slot6)
			end
		end
	end
end

function ElementEctypeWindow.getDefaultItemIndex(slot0)
	slot1 = nil

	if slot0.customs_id and slot0.show_customs_data then
		for slot5, slot6 in ipairs(slot0.show_customs_data) do
			if slot6.id == slot0.customs_id then
				slot1 = slot5

				break
			end
		end
	end

	return slot1
end

function ElementEctypeWindow.openRootWnd(slot0, slot1)
	slot0:setData(slot1)
end

function ElementEctypeWindow.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.ele_type = slot1.type
	slot0.unit_group = slot1.group
	slot0.customs_id = slot1.boss_id
	slot0.base_cfg = Config.ElementTempleData.data_base[slot0.ele_type]
	slot0.monster_cfg = Config.ElementTempleData.data_monster[slot0.unit_group]
	slot0.element_data = uv0:getElementData()

	if not slot0.base_cfg or not slot0.monster_cfg then
		return
	end

	slot0:updateShowCustomsData()

	if slot0.ele_res_load then
		slot0.ele_res_load:DeleteMe()

		slot0.ele_res_load = nil
	end

	slot2 = slot0.base_cfg.res_id
	slot3 = {}

	uv1(slot3, {
		path = PathTool.getPlistImgForDownLoad("bigbg/element", string.format("element_bg_%d", slot2), true),
		type = ResourcesType.single
	})
	uv1(slot3, {
		path = PathTool.getPlistImgForDownLoad("partner", slot0.monster_cfg.bust_id),
		type = ResourcesType.single
	})

	slot0.ele_res_load = ResourcesLoad.New()

	slot0.ele_res_load:addAllList(slot3, function ()
		uv0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg/element", string.format("element_bg_%d", uv1), true))
		uv0.hero_bg:loadTexture(PathTool.getPlistImgForDownLoad("partner", uv0.monster_cfg.bust_id))
	end)
	slot0.title_bg:loadTexture(PathTool.getResFrame("element", "element_title_bg_" .. slot2), LOADTEXT_TYPE_PLIST)
	slot0.title_txt:setString(slot0.base_cfg.name .. "  " .. slot0.monster_cfg.name)
	slot0.attr_desc:setString(slot0.monster_cfg.attr_desc)

	if ElementConst.Icon_Type[slot0.ele_type] then
		slot0.icon_type:loadTexture(PathTool.getResFrame("element", ElementConst.Icon_Type[slot0.ele_type]), LOADTEXT_TYPE_PLIST)
	end

	for slot7, slot8 in pairs(slot0.skill_items) do
		slot8:setVisible(false)
	end

	slot4 = 58
	slot5 = 15
	slot6 = 0.7

	for slot10, slot11 in ipairs(slot0.monster_cfg.skill_list) do
		if slot0.skill_items[slot10] == nil then
			slot12 = SkillItem.new(true, true, true, slot6)

			slot12:setTipsHideFlag(true)
			slot0.main_container:addChild(slot12)

			slot0.skill_items[slot10] = slot12
		end

		slot12:setVisible(true)
		slot12:setPosition(cc.p(slot4 + (slot10 - 1) * (slot5 + SkillItem.Width * slot6), 877 + slot0.offset_y))

		if Config.SkillData.data_get_skill(slot11) then
			slot12:setData(slot13)
		end
	end

	slot0.item_scrollview:reloadData(slot0:getDefaultItemIndex())
	slot0:refreshChallengeCountInfo()
	slot0:updateLeftBuyCount()
end

function ElementEctypeWindow.refreshChallengeCountInfo(slot0)
	if slot0.element_data and next(slot0.element_data) ~= nil then
		slot1 = Config.ElementTempleData.data_const.refresh_number

		slot0.count_txt:setString(slot0.element_data.num .. "/" .. slot1.val)

		slot0.count_is_full = slot1.val <= slot0.element_data.num

		if slot0.element_data.refresh_time < GameNet:getInstance():getTime() then
			slot0:setLessTime(0)
			slot0.time_txt:setVisible(false)
			slot0.sp_time:setVisible(false)
		else
			slot0:setLessTime(slot0.element_data.refresh_time - slot2)
			slot0.time_txt:setVisible(true)
			slot0.sp_time:setVisible(true)
		end
	end
end

function ElementEctypeWindow.updateLeftBuyCount(slot0)
	if not slot0.left_buy_count then
		slot0.left_buy_count = createRichLabel(20, 1, cc.p(0.5, 0.5), cc.p(590, 116))

		slot0.main_container:addChild(slot0.left_buy_count)
	end

	slot0.left_buy_count:setString(string.format(TI18N("<div fontcolor=#fff8bf outline=2,#000000>(剩余购买次数:</div><div fontcolor=#39e522 outline=2,#000000>%d</div><div fontcolor=#fff8bf outline=2,#000000>)</div>"), uv0:getTodayLeftBuyCount()))
end

function ElementEctypeWindow.setLessTime(slot0, slot1)
	if tolua.isnull(slot0.time_txt) then
		return
	end

	slot0.time_txt:stopAllActions()

	if slot1 > 0 then
		slot0.time_txt:setString(TimeTool.GetTimeFormat(slot1))
		slot0.time_txt:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				uv1.time_txt:stopAllActions()
			else
				uv1.time_txt:setString(TimeTool.GetTimeFormat(uv0))
			end
		end))))
	else
		slot0.time_txt:setString(TimeTool.GetTimeFormat(slot1))
	end
end

function ElementEctypeWindow._onClickAddCountBtn(slot0)
	if slot0.element_data then
		if not slot0.count_is_full then
			slot2 = RoleController:getInstance():getModel():checkPrivilegeStatus(4)

			if Config.ElementTempleData.data_buy_count[slot0.element_data.buy_num + 1] or slot2 == true then
				if slot1 and slot1.vip <= RoleController:getInstance():getRoleVo().vip_lev then
					slot4 = string.format(TI18N([[








               是否消耗<img src=%s visible=true scale=0.3 />%d购买一次挑战次数？











<div fontsize=22>领地挑战特权:每日免费挑战2次，额外购买%d次</div><div href=privilege fontcolor=#289b14>前往激活</div>]]), PathTool.getItemRes(3), slot1.cost, Config.ElementTempleData.data_privilege_length or 0)

					if slot2 == true then
						slot4 = string.format(TI18N([[








               是否消耗<img src=%s visible=true scale=0.3 />%d购买一次挑战次数？











<div fontsize=22>领地挑战特权:每日免费挑战2次，额外购买%d次</div><div fontcolor=#289b14>(已激活)</div>]]), PathTool.getItemRes(3), slot1.cost, Config.ElementTempleData.data_privilege_length or 0)
					end

					CommonAlert.show(slot4, TI18N("确定"), function ()
						uv0:sender25003()
					end, TI18N("取消"), nil, CommonAlert.type.rich)
				elseif slot2 == true then
					if Config.ElementTempleData.data_privilege[uv1:getPrivilegeBuyCount() + 1] then
						slot6 = string.format(TI18N([[








               是否消耗<img src=%s visible=true scale=0.3 />%d购买一次挑战次数？











<div fontsize=22>领地挑战特权:每日免费挑战2次，额外购买%d次</div><div href=privilege fontcolor=#289b14>前往激活</div>]]), PathTool.getItemRes(3), slot5, Config.ElementTempleData.data_privilege_length or 0)

						if slot2 == true then
							slot6 = string.format(TI18N([[








               是否消耗<img src=%s visible=true scale=0.3 />%d购买一次挑战次数？











<div fontsize=22>领地挑战特权:每日免费挑战2次，额外购买%d次</div><div fontcolor=#289b14>(已激活)</div>]]), PathTool.getItemRes(3), slot5, Config.ElementTempleData.data_privilege_length or 0)
						end

						CommonAlert.show(slot6, TI18N("确定"), function ()
							uv0:sender25003()
						end, TI18N("取消"), nil, CommonAlert.type.rich)
					else
						message(TI18N("购买次数已用完"))
					end
				else
					message(TI18N("购买次数已用完"))
				end
			else
				message(TI18N("购买次数已用完"))
			end
		else
			message(TI18N("当前挑战次数已满"))
		end
	end
end

function ElementEctypeWindow.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.ele_res_load then
		slot0.ele_res_load:DeleteMe()

		slot0.ele_res_load = nil
	end

	for slot4, slot5 in pairs(slot0.skill_items) do
		slot5:DeleteMe()

		slot5 = nil
	end

	uv0:openElementEctypeWindow(false)
end
