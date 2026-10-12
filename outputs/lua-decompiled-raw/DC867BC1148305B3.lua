ElfinFightPlanPanel = ElfinFightPlanPanel or BaseClass(BaseView)
slot1 = ElfinController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.sort

function ElfinFightPlanPanel.__init(slot0)
	slot0.is_full_screen = false
	slot0.layout_name = "elfin/elfin_fight_plan_panel"
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("elfin", "elfin"),
			type = ResourcesType.plist
		}
	}
	slot0.plan_data = nil
	slot0.cur_elfin_item_list = {}
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.is_change_name = false
end

function ElfinFightPlanPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.main_container_size = slot0.main_container:getContentSize()

	slot0.main_container:getChildByName("wnd_title"):setString(TI18N("方案管理"))
	UITool.SetTitleColor(slot0.main_container:getChildByName("wnd_title"))
	slot0.main_container:getChildByName("txt_tips"):setString(TI18N("点击方案中的幽灵技能可进行编辑"))
	UITool.SetLightColor(slot0.main_container:getChildByName("txt_tips"))

	slot0.txt_cur_name = slot0.main_container:getChildByName("txt_cur_name")

	slot0.txt_cur_name:setString(TI18N("无方案"))
	UITool.SetLightColor(slot0.txt_cur_name)

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.btn_save = slot0.main_container:getChildByName("btn_save")

	UITool.SetTitleColor(slot0.btn_save:getChildByName("label"))
	slot0.btn_save:getChildByName("label"):setString(TI18N("保存为方案"))

	slot0.btn_disarm = slot0.main_container:getChildByName("btn_disarm")

	slot0.btn_disarm:getChildByName("label"):setString(TI18N("调 整"))

	slot0.cost_txt = slot0.main_container:getChildByName("cost_txt")

	slot0.cost_txt:setString("")
	slot0:updateCostInfo()

	slot1 = 580

	for slot7 = 1, 4 do
		slot8 = SkillItem.new(true, true, false, 0.8, true)

		slot8:addCallBack(function ()
			uv0:onClikElfinItemIndex(uv1)
		end)
		slot8:setPosition((slot0.main_container_size.width - slot1) * 0.5 + slot1 / 4 * 0.5 + (slot7 - 1) * slot2, 795)
		slot8:showLevel(false)
		slot0.main_container:addChild(slot8)

		slot0.cur_elfin_item_list[slot7] = slot8
	end
end

function ElfinFightPlanPanel.updatePlanList(slot0)
	if slot0.plan_scrollview == nil then
		slot1 = slot0.main_container:getChildByName("plan_list")
		slot0.plan_scrollview = CommonScrollViewSingleLayout.new(slot1, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot1:getContentSize(), {
			start_y = 0,
			row = 0,
			start_x = 0,
			space_x = 0,
			item_width = 606,
			item_height = 170,
			space_y = 0,
			col = 1,
			need_dynamic = true
		}, cc.p(0, 0))

		slot0.plan_scrollview:setSwallowTouches(false)
		slot0.plan_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.plan_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.plan_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.plan_scrollview:reloadData(nil, , true)
end

function ElfinFightPlanPanel._createNewCell(slot0, slot1, slot2)
	return ElfinFightPlanItem.new(slot1, slot2, slot0)
end

function ElfinFightPlanPanel._numberOfCells(slot0)
	if not slot0.plan_data then
		return 0
	end

	return #slot0.plan_data
end

function ElfinFightPlanPanel._updateCellByIndex(slot0, slot1, slot2)
	if not slot0.plan_data then
		return
	end

	slot1.index = slot2

	if not slot0.plan_data[slot2] then
		return
	end

	slot1:setData(slot3)
end

function ElfinFightPlanPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openElfinFightPlanPanel(false)
	end, true, 2)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openElfinFightPlanPanel(false)
	end, true, 2)
	registerButtonEventListener(slot0.btn_save, handler(slot0, slot0.onSaveSuitsPlan), true, 1)
	registerButtonEventListener(slot0.btn_disarm, handler(slot0, slot0.onDisarmAllEquip), true, 1)
	slot0:addGlobalEvent(ElfinEvent.Elfin_Plan_Info_Event, function ()
		uv0:updateElfinPlanData()
	end)

	if slot0.role_vo_update_event == nil then
		slot0.role_vo_update_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "gold" then
				uv0:updateCostInfo(slot1)
			end
		end)
	end

	slot0:addGlobalEvent(ElfinEvent.Elfin_Plan_From_Info_Event, function (slot0)
		if uv0.fun_form_type == PartnerConst.Fun_Form.EliteMatch and uv0.match_type == 2 then
			slot1 = PartnerConst.Fun_Form.EliteKingMatch
		end

		if slot1 and slot1 == slot0.type then
			uv0.total_team_info = slot0.team_list

			for slot6, slot7 in ipairs(slot0.team_list) do
				if slot7.team == (uv0.team_index or 1) then
					uv0.cur_plan_data = slot7

					uv0:updatePlanzInfo()

					uv0.plan_id = slot7.plan_id

					uv0:updatePlanzInfo()
					uv0:initCurElfinName()
					uv0:updateCurElfinItemList()

					break
				end
			end

			uv0:initFilterInfo(slot0)
		end
	end)
	slot0:addGlobalEvent(ElfinEvent.Get_Elfin_Tree_Data_Event, function (slot0)
		uv0.cur_plan_data = uv1:getElfinTreeData()

		uv0:updateCurElfinItemList()
	end)
	slot0:addGlobalEvent(ElfinEvent.Elfin_Plan_Update_Event, function (slot0)
		if not slot0 then
			return
		end

		slot3 = Config.SpriteData.data_elfin_plan_length

		if uv1:_numberOfCells() == uv0:getPlanCount() then
			if slot1 == slot3 then
				if uv1.plan_data[slot3].is_open == nil then
					if uv1.plan_scrollview then
						uv1.plan_scrollview:resetItemByIndex(slot0.id)
					end
				else
					uv1:initElfinData()
					uv1:updatePlanList()
				end
			else
				uv1:initElfinData()
				uv1:updatePlanList()
			end
		elseif uv1.plan_scrollview then
			uv1.plan_scrollview:resetItemByIndex(slot0.id)
		end

		if uv1.fun_form_type then
			uv2:send26555(uv1.fun_form_type)
		end
	end)
end

function ElfinFightPlanPanel.updatePlanzInfo(slot0)
	if slot0.plan_scrollview and slot0.plan_id ~= nil and slot0.plan_id ~= 0 then
		slot0.plan_scrollview:resetItemByIndex(slot0.plan_id)
	end
end

function ElfinFightPlanPanel.updateCostInfo(slot0, slot1)
	if slot1 == nil then
		if slot0.role_vo and slot0.role_vo.gold then
			slot0.cost_txt:setString(MoneyTool.GetMoneyString(slot0.role_vo.gold))
		end
	elseif slot0.cost_txt then
		slot0.cost_txt:setString(MoneyTool.GetMoneyString(slot1))
	end
end

function ElfinFightPlanPanel.onSaveSuitsPlan(slot0)
	if not slot0.cur_plan_data then
		return
	end

	if not slot0.cur_plan_data.sprites then
		return
	end

	slot1 = true

	for slot5, slot6 in ipairs(slot0.cur_plan_data.sprites) do
		if slot6.item_bid ~= 0 then
			slot1 = false

			break
		end
	end

	if slot1 then
		message(TI18N("抱歉，列表为空不允许保存为方案"))

		return
	end

	uv0:openElfinFightPlanChooseTips(true, {
		sprites = slot0.cur_plan_data.sprites,
		plan_data = slot0.plan_data,
		fun_form_type = slot0.fun_form_type,
		team_index = slot0.team_index
	})
end

function ElfinFightPlanPanel.onClikElfinItemIndex(slot0)
	slot0:onDisarmAllEquip()
end

function ElfinFightPlanPanel.onDisarmAllEquip(slot0)
	if not slot0.cur_plan_data then
		return
	end

	if not slot0.cur_plan_data.sprites then
		return
	end

	slot1 = {
		from_type = 2
	}
	slot2 = {
		[slot7.pos] = slot7
	}

	for slot6, slot7 in ipairs(slot0.cur_plan_data.sprites) do
		-- Nothing
	end

	for slot6 = 1, 4 do
		if uv0:getElfinItemByPos(slot6) and slot2[slot6] == nil then
			slot2[slot6] = {
				item_bid = 0,
				pos = slot6
			}
		end
	end

	slot1.sprites = {}

	for slot6, slot7 in pairs(slot2) do
		uv1(slot1.sprites, slot7)
	end

	slot1.dic_filter_item_id = slot0.dic_filter_item_id

	function slot1.callback(slot0)
		uv0:saveElfinlist(slot0)
	end

	uv2:openElfinAdjustWindow(true, slot1)
end

function ElfinFightPlanPanel.saveElfinlist(slot0, slot1)
	if slot0.fun_form_type then
		slot2 = slot0.team_index or 1
		slot3 = slot0.fun_form_type

		if slot0.fun_form_type == PartnerConst.Fun_Form.EliteMatch and slot0.match_type == 2 then
			slot3 = PartnerConst.Fun_Form.EliteKingMatch
		end

		uv0:send26560(slot3, slot1, slot2)
	else
		uv0:sender26514(slot1)
	end
end

function ElfinFightPlanPanel.initFilterInfo(slot0, slot1)
	if slot0.fun_form_type == slot1.type then
		if slot0.fun_form_type == PartnerConst.Fun_Form.CrossArenaDef or slot0.fun_form_type == PartnerConst.Fun_Form.CrossArena or slot0.fun_form_type == PartnerConst.Fun_Form.ArenapeakchampionDef or slot0.fun_form_type == PartnerConst.Fun_Form.HeavenBoss then
			slot0.dic_filter_item_id = {}

			for slot5, slot6 in ipairs(slot1.team_list) do
				if slot6.team ~= slot0.team_index then
					for slot10, slot11 in ipairs(slot6.sprites) do
						if slot0.dic_filter_item_id[slot11.item_bid] == nil then
							slot0.dic_filter_item_id[slot11.item_bid] = 1
						else
							slot0.dic_filter_item_id[slot11.item_bid] = slot0.dic_filter_item_id[slot11.item_bid] + 1
						end
					end
				end
			end
		elseif slot0.fun_form_type == PartnerConst.Fun_Form.EliteMatch and slot0.match_type == 2 then
			slot0.dic_filter_item_id = {}

			for slot5, slot6 in ipairs(slot1.team_list) do
				if slot6.team ~= slot0.team_index then
					for slot10, slot11 in ipairs(slot6.sprites) do
						if slot0.dic_filter_item_id[slot11.item_bid] == nil then
							slot0.dic_filter_item_id[slot11.item_bid] = 1
						else
							slot0.dic_filter_item_id[slot11.item_bid] = slot0.dic_filter_item_id[slot11.item_bid] + 1
						end
					end
				end
			end
		end
	end
end

function ElfinFightPlanPanel.openRootWnd(slot0, slot1)
	slot0.setting = slot1 or {}
	slot0.cur_plan_data = slot0.setting.cur_plan_data or {}
	slot0.total_team_info = slot0.setting.total_team_info or {}
	slot0.plan_id = slot0.cur_plan_data.plan_id
	slot0.dic_filter_item_id = slot0.setting.dic_filter_item_id or {}
	slot0.fun_form_type = slot0.setting.fun_form_type
	slot0.team_index = slot0.setting.team_index
	slot0.match_type = slot0.setting.match_type

	uv0:send26556()
end

function ElfinFightPlanPanel.updateElfinPlanData(slot0, slot1)
	slot0:initElfinData(slot1)
	slot0:initCurElfinName()
	slot0:updateCurElfinItemList()
	slot0:updatePlanList()
end

function ElfinFightPlanPanel.initElfinData(slot0, slot1)
	if slot1 == nil then
		slot2 = uv0:getPlanData()
	end

	slot0.plan_data = {}

	for slot6, slot7 in pairs(slot2) do
		uv1(slot0.plan_data, slot7)
	end

	uv2(slot0.plan_data, SortTools.KeyLowerSorter("id"))

	if Config.SpriteData.data_elfin_plan[#slot0.plan_data + 1] then
		uv1(slot0.plan_data, {
			is_open = 0,
			config = slot4
		})
	end
end

function ElfinFightPlanPanel.initCurElfinName(slot0)
	if not slot0.plan_data then
		return
	end

	slot1 = TI18N("无方案")

	if slot0.cur_plan_data and slot0.cur_plan_data.plan_id then
		for slot5, slot6 in pairs(slot0.plan_data) do
			if slot6.id == slot0.cur_plan_data.plan_id then
				slot1 = uv0(TI18N("已使用方案【%s】"), slot6.name)
			end
		end
	end

	slot0.txt_cur_name:setString(slot1)
end

function ElfinFightPlanPanel.updateCurElfinItemList(slot0)
	if not slot0.cur_plan_data then
		return
	end

	if not slot0.cur_plan_data.sprites then
		return
	end

	slot1 = {
		[slot7.pos] = slot7.item_bid
	}
	slot2 = true

	for slot6, slot7 in ipairs(slot0.cur_plan_data.sprites) do
		if slot7.item_bid ~= 0 then
			slot2 = false
		end
	end

	for slot6, slot7 in ipairs(slot0.cur_elfin_item_list) do
		if uv0:getElfinItemByPos(slot6) then
			slot9 = slot1[slot6] or 0

			if slot9 == 0 or not Config.SpriteData.data_elfin_data(slot9) then
				slot7:setData()
				slot7:showLevel(false)
				slot7:showName(false)
			elseif Config.SkillData.data_get_skill(slot10.skill) then
				slot7:showLevel(true)
				slot7:setData(slot11)
				slot7:showName(true, slot11.name, nil, 20, true, cc.c4b(255, 240, 210, 255), PathTool.getResFrame("elfin", "elfin_1022"), cc.size(110, 26))
			end
		else
			slot7:setData()
			slot7:showLevel(false)
			slot7:showLockIcon(true)
			slot7:showName(false)
		end
	end

	if slot2 then
		if slot0.show_tips_label == nil then
			slot0.show_tips_label = createRichLabel(22, cc.c3b(149, 83, 34), cc.p(0.5, 0.5), cc.p(slot0.main_container_size.width * 0.5, 730))

			slot0.show_tips_label:setString(TI18N("请先上阵幽灵"))
			slot0.main_container:addChild(slot0.show_tips_label)
		else
			slot0.show_tips_label:setVisible(true)
		end
	elseif slot0.show_tips_label then
		slot0.show_tips_label:setVisible(false)
	end
end

function ElfinFightPlanPanel.close_callback(slot0)
	if slot0.role_vo_update_event ~= nil then
		if slot0.role_vo then
			slot0.role_vo:UnBind(slot0.role_vo_update_event)
		end

		slot0.role_vo_update_event = nil
	end

	if slot0.plan_scrollview then
		slot0.plan_scrollview:DeleteMe()

		slot0.plan_scrollview = nil
	end

	for slot4, slot5 in pairs(slot0.cur_elfin_item_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	uv0:openElfinFightPlanPanel(false)
end

ElfinFightPlanItem = class("ElfinFightPlanItem", function ()
	return ccui.Widget:create()
end)

function ElfinFightPlanItem.ctor(slot0, slot1, slot2, slot3)
	slot0.parent = slot3

	slot0:config(slot1, slot2)
	slot0:layoutUI()
	slot0:registerEvents()
end

function ElfinFightPlanItem.config(slot0, slot1, slot2)
	slot0.size = cc.size(slot1, slot2)

	slot0:setContentSize(slot0.size)

	slot0.equip_item_list = {}
end

function ElfinFightPlanItem.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("elfin/elfin_fight_plan_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.txt_title = slot0.main_container:getChildByName("txt_title")

	UITool.SetLightColor(slot0.txt_title)

	slot0.btn_write = slot0.main_container:getChildByName("btn_write")

	slot0.btn_write:setTouchEnabled(true)

	slot0.btn_load = slot0.main_container:getChildByName("btn_load")

	slot0.btn_load:setVisible(false)

	slot0.btn_load_lable = slot0.btn_load:getChildByName("label")

	slot0.btn_load_lable:setString(TI18N("装配"))

	slot0.btn_open = slot0.main_container:getChildByName("btn_open")
	slot2 = slot0.btn_open:getContentSize()
	slot0.btn_open_label = createRichLabel(26, cc.c3b(255, 255, 255), cc.p(0.5, 0.5), cc.p(slot2.width / 2, slot2.height / 2))

	slot0.btn_open:addChild(slot0.btn_open_label)

	slot0.txt_open_desc = slot0.main_container:getChildByName("txt_open_desc")

	UITool.SetLightColor(slot0.txt_open_desc)

	slot8 = "花费钻石开启此方案"

	slot0.txt_open_desc:setString(TI18N(slot8))

	slot0.elfin_item_list = {}

	for slot8 = 1, 4 do
		slot9 = SkillItem.new(true, true, false, 0.8, true)

		slot9:setPosition(75 + (slot8 - 1) * 112, 66)
		slot9:setClickInfo({
			clickScroll = true
		})
		slot9:addCallBack(function ()
			uv0:onClickSkillItem()
		end)
		slot0.main_container:addChild(slot9)

		slot0.elfin_item_list[slot8] = slot9
	end
end

function ElfinFightPlanItem.registerEvents(slot0)
	registerButtonEventListener(slot0.btn_write, handler(slot0, slot0.onChangePlanName), true, 1)
	registerButtonEventListener(slot0.btn_load, handler(slot0, slot0.onLoadSuitsPlan), true, 1)
	registerButtonEventListener(slot0.btn_open, handler(slot0, slot0.onOpenHolyPlan), true, 1)
end

function ElfinFightPlanItem.onChangePlanName(slot0)
	if isQingmingShield and isQingmingShield() then
		return
	end

	if not slot0.data then
		return
	end

	function slot1()
		if uv0.alert then
			uv0.alert:close()

			uv0.alert = nil
		end
	end

	slot0.alert = CommonAlert.showInputApply("", TI18N("方案名最多6个字"), TI18N("确 定"), function (slot0)
		if slot0 == nil or slot0 == "" then
			message(TI18N("方案名称不合法"))

			return
		end

		if string.gsub(slot0, "\n", "") then
			uv0:send26558(uv1.data.id, slot1)

			if uv1.alert then
				uv1.alert:close()

				uv1.alert = nil
			end
		end
	end, TI18N("取 消"), slot1, true, slot1, 22, CommonAlert.type.rich, FALSE, cc.size(307, 50), 6, {
		off_y = -15,
		off_x = 15
	})

	slot0.alert.line:setVisible(false)

	slot3 = createLabel(26, Config.ColorData.data_color4[175], nil, 55, 75, TI18N("方案名："), slot0.alert.alert_panel)
end

function ElfinFightPlanItem.onLoadSuitsPlan(slot0)
	if not slot0.parent then
		return
	end

	if slot0.parent.cur_plan_data and slot1.plan_id == slot0.data.id then
		message("该方案已装配")

		return
	end

	if slot0.is_gray then
		message("为空的方案不允许装配")

		return
	end

	if (slot0.parent.fun_form_type or 0) == 0 and (slot0.parent.team_index or 0) == 0 then
		uv0:sender26514(slot0.data.plan_sprites)
	elseif SysEnv:getInstance():getBool(SysEnv.keys.elfin_plan_save_tip, false) then
		slot0:sendSaveProto()
	else
		slot5, slot6 = slot0:checkSaveTips()

		if slot5 then
			uv0:openElfinFightPlanSaveTips(true, {
				same_list = slot6,
				callback = function ()
					uv0:sendSaveProto()
				end
			})
		else
			slot0:sendSaveProto()
		end
	end
end

function ElfinFightPlanItem.sendSaveProto(slot0)
	slot2 = slot0.parent.team_index or 0

	if (slot0.parent.fun_form_type or 0) == PartnerConst.Fun_Form.EliteMatch and slot0.parent.match_type == 2 then
		slot1 = PartnerConst.Fun_Form.EliteKingMatch
	end

	uv0:send26561(slot0.data.id, slot1, slot2, slot0.data.plan_sprites)
end

function ElfinFightPlanItem.checkSaveTips(slot0)
	slot2 = slot0.parent.team_index or 0

	if (slot0.parent.fun_form_type or 0) == PartnerConst.Fun_Form.CrossArenaDef or slot1 == PartnerConst.Fun_Form.CrossArena or slot1 == PartnerConst.Fun_Form.ArenapeakchampionDef or slot1 == PartnerConst.Fun_Form.HeavenBoss then
		if next(slot0:getCheckSameItemBid(slot0.parent.total_team_info or {}, slot0.parent.cur_plan_data or {})) ~= nil then
			return true, slot5
		end
	elseif slot1 == PartnerConst.Fun_Form.EliteMatch and (slot0.parent.match_type or 1) == 2 and next(slot0:getCheckSameItemBid(slot0.parent.total_team_info or {}, slot0.parent.cur_plan_data or {})) ~= nil then
		return true, slot6
	end

	return false
end

function ElfinFightPlanItem.getCheckSameItemBid(slot0, slot1, slot2)
	if not slot0.dic_item_pos then
		return {}
	end

	slot3 = {}
	slot4 = {}

	for slot8, slot9 in pairs(slot1) do
		uv0(slot4, slot9)
	end

	uv1(slot4, function (slot0, slot1)
		return slot0.team < slot1.team
	end)

	dic_item_use = {}
	slot5 = slot2.team

	for slot9, slot10 in pairs(slot0.dic_item_pos) do
		if slot10 ~= 0 then
			for slot14, slot15 in ipairs(slot4) do
				if slot5 ~= slot15.team then
					for slot19, slot20 in ipairs(slot15.sprites) do
						if slot20.item_bid == slot10 then
							if dic_item_use[slot10] == nil then
								dic_item_use[slot10] = 0
							end

							if uv2:getElfinTreeByBid(slot10) ~= nil then
								slot22 = (BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot10) or 0) + 1
							end

							if slot22 - dic_item_use[slot10] <= 1 then
								uv0(slot3, {
									team = slot15.team,
									item_bid = slot20.item_bid
								})
							else
								dic_item_use[slot10] = dic_item_use[slot10] + 1
							end
						end
					end
				end
			end
		end
	end

	return slot3
end

function ElfinFightPlanItem.onOpenHolyPlan(slot0)
	if not slot0.data then
		return
	end

	if not slot0.data.config then
		return
	end

	if not RoleController:getInstance():getRoleVo() then
		return
	end

	if slot0.data.config.expend and slot3[1] then
		slot4 = slot3[1][1]

		if slot3[1][2] <= slot1.gold then
			slot6 = Config.ItemData.data_get_data(slot4)

			CommonAlert.show(string.format(TI18N("是否花费<img src=%s visible=true scale=0.3 />%d开启<div fontColor=#d95014>【%s】</div>？"), PathTool.getItemRes(slot4), slot5, slot0.data.config.name), TI18N("确定"), function ()
				uv0:send26562(uv1.data.config.id)
			end, TI18N("取消"), nil, CommonAlert.type.rich)
		else
			slot6 = nil

			if (type(slot3[1][1]) ~= "number" or Config.ItemData.data_get_data(slot7)) and Config.ItemData.data_get_data(Config.ItemData.data_assets_label2id[slot7]) then
				if slot6.id == Config.ItemData.data_assets_label2id.gold then
					if FILTER_CHARGE then
						message(TI18N("钻石不足"))
					else
						CommonAlert.show(string.format(TI18N("%s不足，是否前往充值？"), slot6.name), TI18N("确定"), function ()
							VipController:getInstance():openVipMainWindow(true, VIPTABCONST.CHARGE)
						end, TI18N("取消"), nil, CommonAlert.type.rich, nil, , , true)
					end
				else
					BackpackController:getInstance():openTipsSource(true, slot6)
				end
			end
		end
	end
end

function ElfinFightPlanItem.onClickSkillItem(slot0)
	if not slot0.data then
		return
	end

	if not slot0.dic_item_pos then
		return
	end

	slot1 = {
		from_type = 2
	}
	slot2 = {}

	for slot6 = 1, 4 do
		if slot0.dic_item_pos[slot6] then
			uv0(slot2, {
				pos = slot6,
				item_bid = slot0.dic_item_pos[slot6]
			})
		elseif uv1:getElfinItemByPos(slot6) then
			uv0(slot2, {
				item_bid = 0,
				pos = slot6
			})
		end
	end

	slot1.sprites = slot2
	slot1.dic_filter_item_id = {}

	function slot1.callback(slot0)
		uv0:send26557(uv1.data.id, slot0, 0, 0)
	end

	uv2:openElfinAdjustWindow(true, slot1)
end

function ElfinFightPlanItem.updateName(slot0, slot1)
	if slot1 then
		slot0.txt_title:setString(uv0("【%s】", slot1))
	elseif slot0.data and slot0.data.config then
		slot0.txt_title:setString(uv0("【%s】", slot0.data.config.name))
	end
end

function ElfinFightPlanItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0:updateName(slot1.name)

	if slot1.is_open == 0 then
		slot0.btn_load:setVisible(false)
		slot0.btn_write:setVisible(false)
		slot0.btn_open:setVisible(true)
		slot0.txt_open_desc:setVisible(true)

		if slot1.config and slot1.config.expend and slot1.config.expend[1] then
			if Config.ItemData.data_get_data(slot1.config.expend[1][1]) then
				slot0.btn_open_label:setString(uv0(TI18N("<img src='%s' scale=0.3 /> %d  开启"), PathTool.getItemRes(slot4.icon), slot1.config.expend[1][2]))
			end
		end

		for slot5, slot6 in pairs(slot0.elfin_item_list) do
			slot6:setVisible(false)
		end
	else
		slot0.btn_load:setVisible(true)
		slot0.btn_write:setVisible(true)
		slot0.btn_open:setVisible(false)
		slot0.txt_open_desc:setVisible(false)

		slot7 = slot0.txt_title:getContentSize().width
		slot6 = slot0.txt_title:getPositionX() + slot7 + 10

		slot0.btn_write:setPositionX(slot6)

		slot0.is_gray = true
		slot0.dic_item_pos = {}

		for slot6, slot7 in ipairs(slot1.plan_sprites) do
			slot0.dic_item_pos[slot7.pos] = slot7.item_bid

			if slot7.item_bid ~= 0 then
				slot0.is_gray = false
			end
		end

		if slot0.parent and slot0.parent.cur_plan_data and slot0.parent.cur_plan_data.plan_id == slot0.data.id then
			setChildUnEnabled(true, slot0.btn_load)
			slot0.btn_load_lable:enableOutline(Config.ColorData.data_color4[2], 2)
			slot0.btn_load_lable:setString(TI18N("使用中"))
			slot0.btn_load:setTouchEnabled(false)
		else
			slot0.btn_load_lable:setString(TI18N("装配"))
			slot0.btn_load:setTouchEnabled(true)

			if slot0.is_gray then
				setChildUnEnabled(true, slot0.btn_load)
				slot0.btn_load_lable:enableOutline(Config.ColorData.data_color4[2], 2)
			else
				setChildUnEnabled(false, slot0.btn_load)
				slot0.btn_load_lable:enableOutline(Config.ColorData.data_color4[264], 2)
			end
		end

		for slot6, slot7 in ipairs(slot0.elfin_item_list) do
			slot7:setVisible(true)

			if uv1:getElfinItemByPos(slot6) then
				if slot0.dic_item_pos[slot6] == nil or slot0.dic_item_pos[slot6] == 0 or not Config.SpriteData.data_elfin_data(slot0.dic_item_pos[slot6]) then
					slot7:setData()
					slot7:showLevel(false)
				elseif Config.SkillData.data_get_skill(slot9.skill) then
					slot7:setData(slot10)
				end
			else
				slot7:setData()
				slot7:showLevel(false)
				slot7:showLockIcon(true)
			end
		end
	end
end

function ElfinFightPlanItem.DeleteMe(slot0)
	for slot4, slot5 in pairs(slot0.elfin_item_list) do
		slot5:DeleteMe()

		slot5 = nil
	end
end
