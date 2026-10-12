HolyequipmentPlanPanel = HolyequipmentPlanPanel or BaseClass(BaseView)
slot1 = HeroController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.sort

function HolyequipmentPlanPanel.__init(slot0)
	slot0.is_full_screen = false
	slot0.layout_name = "hero/hero_holy_equip_plan_panel"
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("hero", "hero"),
			type = ResourcesType.plist
		}
	}
	slot0.plan_data = {}
	slot0.cur_hero_item_list = {}
end

function HolyequipmentPlanPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)
	slot0.main_container:getChildByName("wnd_title"):setString(TI18N("套装管理"))
	slot0.main_container:getChildByName("txt_cur_cfg"):setString(TI18N("当前配置"))
	slot0.main_container:getChildByName("txt_plan_list"):setString(TI18N("方案一览"))
	slot0.main_container:getChildByName("txt_tips"):setString(TI18N("点击方案中的神装部位可编辑方案"))

	slot0.txt_cur_name = slot0.main_container:getChildByName("txt_cur_name")

	slot0.txt_cur_name:setString(TI18N("无方案"))

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.btn_save = slot0.main_container:getChildByName("btn_save")

	slot0.btn_save:getChildByName("label"):setString(TI18N("保存为方案"))

	slot0.btn_disarm = slot0.main_container:getChildByName("btn_disarm")

	slot0.btn_disarm:getChildByName("label"):setString(TI18N("一键卸下"))

	slot0.cost_txt = slot0.main_container:getChildByName("cost_txt")

	slot0.cost_txt:setString("")

	slot1 = slot0.main_container:getChildByName("plan_list")
	slot0.plan_scrollview = CommonScrollViewSingleLayout.new(slot1, cc.p(-4, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot1:getContentSize(), {
		start_y = 0,
		row = 0,
		start_x = 0,
		space_x = 0,
		item_width = 606,
		item_height = 203,
		space_y = 5,
		col = 1,
		need_dynamic = true
	})

	slot0.plan_scrollview:setSwallowTouches(false)
	slot0.plan_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.plan_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.plan_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
end

function HolyequipmentPlanPanel._createNewCell(slot0)
	slot1 = HolyequipmentPlanItem.new()

	slot1:setExtendData(slot0.hero_vo)

	return slot1
end

function HolyequipmentPlanPanel._numberOfCells(slot0)
	if not slot0.plan_data then
		return 0
	end

	return #slot0.plan_data
end

function HolyequipmentPlanPanel._updateCellByIndex(slot0, slot1, slot2)
	if not slot0.plan_data then
		return
	end

	slot1.index = slot2

	if not slot0.plan_data[slot2] then
		return
	end

	slot1:setData(slot3)
end

function HolyequipmentPlanPanel.openRootWnd(slot0, slot1)
	slot0.hero_vo = slot1

	slot0:initCurHeroHolyInfo()

	if uv0:getHolyEquipmentPlanData() then
		slot0:updateHolyPlanList(slot2)
	else
		uv1:sender25220()
	end
end

function HolyequipmentPlanPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openHolyequipmentPlanPanel(false)
	end, true, 2)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openHolyequipmentPlanPanel(false)
	end, true, 2)
	registerButtonEventListener(slot0.btn_save, handler(slot0, slot0.onSaveSuitsPlan), true, 1)
	registerButtonEventListener(slot0.btn_disarm, handler(slot0, slot0.onDisarmAllEquip), true, 1)
	slot0:addGlobalEvent(HeroEvent.Hero_Get_Holy_Equipment_Event, function (slot0)
		if not slot0 or not uv0.hero_vo then
			return
		end

		for slot4, slot5 in ipairs(slot0) do
			if slot5.partner_id == uv0.hero_vo.partner_id then
				uv0:updateCurHeroHolyItemList()
			end
		end
	end)
	slot0:addGlobalEvent(HeroEvent.Holy_Equipment_Update_Event, function (slot0)
		if not slot0 or not uv0.hero_vo then
			return
		end

		if slot0.partner_id == uv0.hero_vo.partner_id then
			uv0:updateCurHeroHolyItemList()
		end
	end)
	slot0:addGlobalEvent(HeroEvent.Hero_Get_Holy_Equipment_Plan_Event, function (slot0)
		if not slot0 then
			return
		end

		uv1:updateHolyPlanList(uv0:getHolyEquipmentPlanData())
	end)
	slot0:addGlobalEvent(HeroEvent.Hero_Open_Holy_Equipment_Cell_Event, function (slot0)
		if not slot0 then
			return
		end

		uv1:updateHolyPlanList(uv0:getHolyEquipmentPlanData())
	end)
	slot0:addGlobalEvent(HeroEvent.Del_Hero_Event, function (slot0)
		if uv0.hero_vo then
			for slot4, slot5 in ipairs(slot0) do
				if uv0.hero_vo.partner_id == slot5.partner_id then
					uv1:openHolyequipmentPlanPanel(false)
				end
			end
		end
	end)
end

function HolyequipmentPlanPanel.updateCostInfo(slot0)
	slot1 = 0

	if RoleController:getInstance():getRoleVo() then
		slot0.cost_txt:setString(MoneyTool.GetMoneyString(slot2.gold))
	end
end

function HolyequipmentPlanPanel.initCurHeroHolyName(slot0)
	slot1 = TI18N("无方案")

	if slot0.plan_data then
		for slot5, slot6 in pairs(slot0.plan_data) do
			if slot6 and slot6.partner_id and slot6.partner_id == slot0.hero_vo.partner_id then
				slot1 = uv0(TI18N("已使用方案【%s】"), slot6.name)
			end
		end
	end

	slot0.txt_cur_name:setString(slot1)
end

function HolyequipmentPlanPanel.getEquipList(slot0, slot1)
	if not slot1 then
		return
	end

	if #slot1 == 0 then
		return {}
	end

	for slot6, slot7 in ipairs(slot1) do
		if slot7.item_id then
			slot8 = nil

			if (slot7.partner_id ~= 0 or BackpackController:getModel():getBagItemById(BackPackConst.Bag_Code.EQUIPS, slot7.item_id)) and uv0:getHolyEquipById(slot7.item_id) and slot8.config then
				-- Nothing
			end
		end
	end

	return {
		[slot8.config.type] = slot8
	}
end

function HolyequipmentPlanPanel.updateHolyPlanList(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.plan_data = {}

	for slot7 = 1, uv0.holy_equip_plan_count do
		if slot1[Config.PartnerHolyEqmData.data_holy_suit_manage[slot7].id] then
			slot0.plan_data[slot7] = slot1[slot8.id]
			slot0.plan_data[slot7].equip_list = slot0:getEquipList(slot0.plan_data[slot7].list)
		else
			slot0.plan_data[slot7] = {
				name = uv1(TI18N("方案%s"), slot7),
				id = slot8.id
			}
		end

		slot0.plan_data[slot7].config = slot8
		slot0.plan_data[slot7].is_open = 1
	end

	if slot2 < Config.PartnerHolyEqmData.data_holy_suit_manage_length then
		uv2(slot0.plan_data, slot3[slot2 + 1])
	end

	uv3(slot0.plan_data, SortTools.KeyLowerSorter("id"))
	slot0:updateCostInfo()
	slot0:initCurHeroHolyName()
	slot0.plan_scrollview:reloadData(nil, , true)
end

function HolyequipmentPlanPanel.initCurHeroHolyInfo(slot0)
	if not slot0.hero_vo then
		return
	end

	if not slot0.cur_hero_head then
		slot0.cur_hero_head = HeroExhibitionItem.new(0.8, true, 0, false)

		slot0.cur_hero_head:setPosition(cc.p(575, 725))
		slot0.main_container:addChild(slot0.cur_hero_head)
	end

	slot0.cur_hero_head:setData(slot0.hero_vo)

	slot1 = 105

	for slot5, slot6 in ipairs(HeroConst.HolyequipmentPosList) do
		if not slot0.cur_hero_item_list[slot6] then
			slot7 = BackPackItem.new(false, true, nil, 0.8, false)

			slot7:addCallBack(function ()
				uv0:selectHolyByIndex(uv1)
			end)
			slot0.main_container:addChild(slot7)

			slot7.empty_icon = createImage(slot7:getRoot(), PathTool.getResFrame("hero", HeroConst.HolyEmptyIconName[slot6]), 60, 60, cc.p(0.5, 0.5), true, 10, false)
			slot0.cur_hero_item_list[slot6] = slot7
		end

		slot7:setPosition(cc.p(slot1 + (slot5 - 1) * (BackPackItem.Width * 0.8 + 15), 725))
	end

	if not slot0.holy_tips_label then
		slot0.holy_tips_label = createRichLabel(20, cc.c3b(100, 50, 35), cc.p(0.5, 0.5), cc.p(340, 652), nil, , 600)

		slot0.main_container:addChild(slot0.holy_tips_label)
	end

	slot0:updateCurHeroHolyItemList()
end

function HolyequipmentPlanPanel.selectHolyByIndex(slot0, slot1)
	if not slot0.hero_vo then
		return
	end

	if uv0:getHeroHolyEquipList(slot0.hero_vo.partner_id)[slot1] ~= nil then
		uv1:openEquipTips(true, slot3, PartnerConst.EqmTips.partner, slot0.hero_vo, {})
	else
		uv1:openHeroHolyEquipClothPanel(true, slot1, slot0.hero_vo.partner_id, {}, {}, nil, slot0.hero_vo)
	end
end

function HolyequipmentPlanPanel.updateCurHeroHolyItemList(slot0)
	if not slot0.hero_vo then
		return
	end

	for slot5, slot6 in ipairs(HeroConst.HolyequipmentPosList) do
		slot8 = slot0.cur_hero_item_list[slot6]

		if uv0:getHeroHolyEquipList(slot0.hero_vo.partner_id)[slot6] then
			slot8:setData(slot7)

			if slot8.empty_icon then
				slot8.empty_icon:setVisible(false)
			end

			slot8.equip_vo = slot7
		else
			slot8:setData()

			if slot8.empty_icon then
				slot8.empty_icon:setVisible(true)
			end

			slot8.equip_vo = nil
		end
	end

	if slot0.holy_tips_label then
		if next(uv0:getHolyEquipSuitDes(slot1)) ~= nil then
			for slot7, slot8 in ipairs(slot2) do
				slot3 = TI18N("已激活: ") .. uv1("<img src='%s' scale=0.8 /> %s ", slot8.icon_res, slot8.name)
			end

			slot0.holy_tips_label:setString(slot3)
		else
			slot0.holy_tips_label:setString(TI18N("暂无组合套装"))
		end
	end
end

function HolyequipmentPlanPanel.onSaveSuitsPlan(slot0)
	if not slot0.hero_vo then
		return
	end

	if next(uv0:getHeroHolyEquipList(slot0.hero_vo.partner_id)) == nil then
		message(TI18N("抱歉，穿戴神装为空不允许保存为方案"))

		return
	end

	uv1:openHolyequipmentChooseTips(true, slot0.hero_vo, slot0.plan_data)
end

function HolyequipmentPlanPanel.onDisarmAllEquip(slot0)
	if not slot0.hero_vo then
		return
	end

	if next(uv0:getHeroHolyEquipList(slot0.hero_vo.partner_id)) == nil then
		message(TI18N("暂无穿戴神装"))

		return
	end

	uv1:sender11093(slot0.hero_vo.partner_id, 0, 0)
end

function HolyequipmentPlanPanel.close_callback(slot0)
	if slot0.plan_scrollview then
		slot0.plan_scrollview:DeleteMe()

		slot0.plan_scrollview = nil
	end

	for slot4, slot5 in pairs(slot0.cur_hero_item_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	uv0:openHolyequipmentPlanPanel(false)
end

HolyequipmentPlanItem = class("HolyequipmentPlanItem", function ()
	return ccui.Widget:create()
end)

function HolyequipmentPlanItem.ctor(slot0)
	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function HolyequipmentPlanItem.config(slot0)
	slot0.size = cc.size(606, 203)

	slot0:setContentSize(slot0.size)

	slot0.equip_item_list = {}
end

function HolyequipmentPlanItem.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("hero/hero_holy_equip_plan_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.txt_open_desc = slot0.main_container:getChildByName("txt_open_desc")

	slot0.txt_open_desc:setString(TI18N("花费钻石开启此方案"))

	slot0.txt_title = slot0.main_container:getChildByName("txt_title")
	slot0.btn_write = slot0.main_container:getChildByName("btn_write")

	slot0.btn_write:setTouchEnabled(true)

	slot0.btn_load = slot0.main_container:getChildByName("btn_load")

	slot0.btn_load:setVisible(false)
	slot0.btn_load:getChildByName("label"):setString(TI18N("装配"))

	slot0.btn_open = slot0.main_container:getChildByName("btn_open")
	slot2 = slot0.btn_open:getContentSize()
	slot0.btn_open_label = createRichLabel(26, cc.c3b(37, 85, 5), cc.p(0.5, 0.5), cc.p(slot2.width / 2, slot2.height / 2))

	slot0.btn_open:addChild(slot0.btn_open_label)
end

function HolyequipmentPlanItem.registerEvents(slot0)
	registerButtonEventListener(slot0.btn_write, handler(slot0, slot0.onChangePlanName), true, 1)
	registerButtonEventListener(slot0.btn_load, handler(slot0, slot0.onLoadSuitsPlan), true, 1)
	registerButtonEventListener(slot0.btn_open, handler(slot0, slot0.onOpenHolyPlan), true, 1)
end

function HolyequipmentPlanItem.onChangePlanName(slot0)
	if isQingmingShield and isQingmingShield() then
		return
	end

	function slot1()
	end

	slot0.alert = CommonAlert.showInputApply("", TI18N("方案名最多6个字"), TI18N("确 定"), function (slot0)
		if slot0 == nil or slot0 == "" then
			message(TI18N("方案名称不合法"))

			return
		end

		if string.gsub(slot0, "\n", "") then
			slot2 = {}

			if uv0.data and uv0.data.list and next(uv0.data.list) ~= 0 then
				for slot6, slot7 in ipairs(uv0.data.list) do
					if slot7 and slot7.item_id then
						table.insert(slot2, {
							partner_id = slot7.partner_id,
							item_id = slot7.item_id
						})
					end
				end
			end

			uv1:sender25221(uv0.data.id, uv0.hero_vo.partner_id, slot1, slot2)
			uv0.alert:close()

			uv0.alert = nil
		end
	end, TI18N("取 消"), slot1, true, slot1, 22, CommonAlert.type.rich, FALSE, cc.size(307, 50), 6, {
		off_y = -15,
		off_x = 15
	})

	slot0.alert.line:setVisible(false)

	slot3 = createLabel(26, Config.ColorData.data_color4[175], nil, 55, 75, TI18N("方案名："), slot0.alert.alert_panel)
end

function HolyequipmentPlanItem.onLoadSuitsPlan(slot0)
	if slot0.data.partner_id == slot0.hero_vo.partner_id then
		message("该方案已装配")

		return
	end

	if not slot0.data.list or next(slot0.data.list) == nil then
		message("为空的方案不允许装配")

		return
	end

	slot1 = {
		id = slot0.data.id,
		name = slot0.data.name,
		hero_vo = slot0.hero_vo,
		item_list = {}
	}

	if not SysEnv:getInstance():getBool(SysEnv.keys.holy_plan_wear_tip, false) then
		for slot6, slot7 in ipairs(slot0.data.list) do
			if slot7.partner_id ~= 0 and slot7.partner_id ~= slot0.hero_vo.partner_id then
				for slot11, slot12 in pairs(slot0.data.equip_list) do
					if slot12.id == slot7.item_id then
						uv0(slot1.item_list, slot11, {
							item_vo = slot12,
							partner_id = slot7.partner_id
						})
					end
				end
			end
		end
	end

	if slot1 and next(slot1.item_list) ~= nil then
		uv1:openHolyequipmentWearTips(true, slot1)
	else
		uv1:sender25224(slot0.hero_vo.partner_id, slot0.data.id)
	end
end

function HolyequipmentPlanItem.onOpenHolyPlan(slot0)
	if not RoleController:getInstance():getRoleVo() then
		return
	end

	if slot0.data.open_cost and slot3[1] then
		slot4 = slot3[1][1]

		if slot3[1][2] <= slot1.gold then
			slot6 = Config.ItemData.data_get_data(slot4)

			CommonAlert.show(string.format(TI18N("是否花费<img src=%s visible=true scale=0.4 />%d开启<div fontColor=#d95014>【%s】</div>？"), PathTool.getItemRes(slot4), slot5, slot0.data.name), TI18N("确定"), function ()
				uv0:sender25223()
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

function HolyequipmentPlanItem.setExtendData(slot0, slot1)
	slot0.hero_vo = slot1
end

function HolyequipmentPlanItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0.txt_title:setString(uv0("【%s】", slot1.name))

	if slot1.is_open == 0 then
		slot0.btn_load:setVisible(false)
		slot0.btn_write:setVisible(false)
		slot0.btn_open:setVisible(true)
		slot0.txt_open_desc:setVisible(true)

		if slot1.open_cost and slot1.open_cost[1] then
			if Config.ItemData.data_get_data(slot1.open_cost[1][1]) then
				slot0.btn_open_label:setString(uv0(TI18N("<img src='%s' scale=0.3 /> %d  开启"), PathTool.getItemRes(slot4.icon), slot1.open_cost[1][2]))
			end
		end

		if slot0.use_hero_label then
			slot0.use_hero_label:setString(uv0(TI18N("使用者:无")))
		end

		if slot0.holy_effect_label then
			slot0.holy_effect_label:setVisible(false)
		end

		for slot5, slot6 in pairs(slot0.equip_item_list) do
			if slot6 then
				slot6:setVisible(false)
			end
		end
	else
		slot0.btn_load:setVisible(true)
		slot0.btn_write:setVisible(true)
		slot0.btn_open:setVisible(false)
		slot0.txt_open_desc:setVisible(false)
		slot0.btn_write:setPositionX(slot0.txt_title:getPositionX() + slot0.txt_title:getContentSize().width + 10)

		if not slot0.use_hero_label then
			slot0.use_hero_label = createRichLabel(24, 274, cc.p(1, 0.5), cc.p(583, 180))

			slot0.main_container:addChild(slot0.use_hero_label)
		end

		if slot1.partner_id and slot1.partner_id ~= 0 then
			if uv1:getHeroById(slot1.partner_id) then
				slot0.use_hero_label:setString(uv0(TI18N("使用者:<div fontcolor=249003 href=xxx>%s</div>"), slot3.name))
				slot0.use_hero_label:addTouchLinkListener(function (slot0, slot1, slot2, slot3)
					if slot0 == "href" then
						uv0:openHeroTipsPanel(true, uv1)
					end
				end, {
					"click",
					"href"
				})
			end
		else
			slot0.use_hero_label:setString(uv0(TI18N("使用者:无")))
		end

		for slot7, slot8 in ipairs(HeroConst.HolyequipmentPosList) do
			if not slot0.equip_item_list[slot8] then
				slot9 = BackPackItem.new(false, true, nil, 0.8, false, nil, false)

				slot9:addCallBack(function ()
					uv0:selectItemHolyByIndex(uv1)
				end)
				slot0.main_container:addChild(slot9)
				slot9:setPosition(cc.p(75 + (slot7 - 1) * (BackPackItem.Width * 0.8 + 15), 100))

				slot9.empty_icon = createImage(slot9:getRoot(), PathTool.getResFrame("hero", HeroConst.HolyEmptyIconName[slot8]), 60, 60, cc.p(0.5, 0.5), true, 10, false)
				slot0.equip_item_list[slot8] = slot9
			else
				slot9:setVisible(true)
			end

			if slot1.equip_list and slot1.equip_list[slot8] then
				slot9:setData(slot1.equip_list[slot8])

				if slot9.empty_icon then
					slot9.empty_icon:setVisible(false)
				end

				slot9.equip_vo = slot10
			else
				slot9:setData()

				if slot9.empty_icon then
					slot9.empty_icon:setVisible(true)
				end

				slot9.equip_vo = nil
			end
		end

		if not slot0.holy_effect_label then
			slot0.holy_effect_label = createRichLabel(20, 274, cc.p(0.5, 0.5), cc.p(303, 28), nil, , 600)

			slot0.main_container:addChild(slot0.holy_effect_label)
		end

		slot0.holy_effect_label:setVisible(true)

		if next(uv1:getHolyEquipSuitDes(slot1.equip_list)) ~= nil then
			for slot9, slot10 in ipairs(slot4) do
				slot5 = TI18N("已激活: ") .. uv0("<img src='%s' scale=0.8 /> %s ", slot10.icon_res, slot10.name)
			end

			slot0.holy_effect_label:setString(slot5)
		else
			slot0.holy_effect_label:setString(TI18N("暂无组合套装"))
		end
	end
end

function HolyequipmentPlanItem.selectItemHolyByIndex(slot0, slot1)
	slot2 = slot0.data.partner_id or 0

	if (slot0.data.equip_list or {})[slot1] ~= nil then
		slot5 = {}

		if slot2 and slot2 ~= 0 then
			slot5 = uv0:getHeroById(slot2)
		end

		uv1:openEquipTips(true, slot4, PartnerConst.EqmTips.partner, slot5, slot0.data)
	else
		uv1:openHeroHolyEquipClothPanel(true, slot1, slot2, {}, slot0.data, HeroConst.EnterType.eHolyPlan, nil, slot3)
	end
end

function HolyequipmentPlanItem.DeleteMe(slot0)
	for slot4, slot5 in pairs(slot0.equip_item_list) do
		slot5:DeleteMe()

		slot5 = nil
	end
end
