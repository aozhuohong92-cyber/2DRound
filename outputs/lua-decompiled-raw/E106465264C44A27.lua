VoyageDispatchWindow = VoyageDispatchWindow or BaseClass(BaseView)
slot1 = VoyageController:getInstance():getModel()
slot2 = table.insert
slot3 = table.sort
slot4 = table.remove

function VoyageDispatchWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "voyage/voyage_order_info"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("voyage", "voyage"),
			type = ResourcesType.plist
		}
	}
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.camp_btns = {}
	slot0.cur_camp = HeroConst.CampType.eNone
	slot0.need_hero_num = 0
	slot0.chose_heros = {}
	slot0.hero_boxs = {}
	slot0.hero_icons = {}
	slot0.camp_icons = {}
	slot0.conditions = {}
	slot0.con_status = false
	slot0.con_tips = TI18N("不满足派遣条件")
end

function VoyageDispatchWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1

	slot0:playEnterAnimatianByObj(slot1, 1)
	slot1:getChildByName("win_title"):setString(TI18N("任务详情"))

	slot7 = "img_select"
	slot0.img_select = slot1:getChildByName("camp_node"):getChildByName(slot7)

	for slot7 = 0, 5 do
		slot0.camp_btns[slot7] = slot3:getChildByName("camp_btn" .. slot7)

		if slot7 == 0 then
			slot9, slot10 = slot8:getPosition()

			slot0.img_select:setPosition(cc.p(slot9, slot10))
		end
	end

	slot0.no_hero_image = slot1:getChildByName("no_hero_image")

	slot0.no_hero_image:getChildByName("label"):setString(TI18N("暂无该阵营英雄"))

	slot0.quick_btn = slot1:getChildByName("quick_btn")

	slot0.quick_btn:getChildByName("label"):setString(TI18N("一键调遣"))

	slot0.dispatch_btn = slot1:getChildByName("dispatch_btn")

	slot0.dispatch_btn:getChildByName("label"):setString(TI18N("派出"))

	slot0.item_num_label = slot1:getChildByName("num_bg_1"):getChildByName("item_num_label")
	slot0.time_label = slot1:getChildByName("num_bg_2"):getChildByName("time_label")
	slot0.status_label = slot1:getChildByName("status_label")

	slot0.status_label:setString(TI18N("达成条件"))

	slot0.condition_layout = slot1:getChildByName("condition_layout")
	slot0.hero_layout = slot1:getChildByName("hero_layout")
	slot6 = slot1:getChildByName("lay_scrollview")
	slot7 = slot6:getContentSize()
	slot0.hero_scrollview = CommonScrollViewLayout.new(slot6, cc.p(10, 10), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot7.width - 20, slot7.height - 20), {
		start_y = 0,
		need_dynamic = true,
		start_x = 0,
		space_x = 22,
		space_y = 17,
		col = 5,
		scale = 0.9,
		item_class = HeroExhibitionItem,
		item_width = HeroExhibitionItem.Width * 0.9,
		item_height = HeroExhibitionItem.Height * 0.9
	})
end

function VoyageDispatchWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0._onClickCloseBtn), false, 2)
	registerButtonEventListener(slot0.quick_btn, handler(slot0, slot0._onClickQuickChoseBtn), true)

	slot4 = handler(slot0, slot0._onClickDispatchBtn)

	registerButtonEventListener(slot0.dispatch_btn, slot4, true)

	for slot4 = 0, 5 do
		registerButtonEventListener(slot0.camp_btns[slot4], handler(slot0, slot0._onClickCampBtn), true, nil, slot4)
	end

	if slot0.role_assets_event == nil then
		if slot0.role_vo == nil then
			slot0.role_vo = RoleController:getInstance():getRoleVo()
		end

		slot0.role_assets_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "energy" then
				uv0:refreshItemNum()
			end
		end)
	end

	slot0:addGlobalEvent(VoyageEvent.UpdateActivityStatusEvent, function ()
		uv0:refreshItemNum()
	end)
end

function VoyageDispatchWindow.openRootWnd(slot0, slot1)
	slot0:refreshCampHeroList()
	slot0:showBaseInfo(slot1)
end

function VoyageDispatchWindow.refreshCampHeroList(slot0)
	slot1 = Array.New()
	slot2 = HeroController:getInstance():getModel():getAllHeroArray()
	slot6 = slot2

	for slot6 = 1, slot2.GetSize(slot6) do
		slot7 = slot2:Get(slot6 - 1)

		if slot0.cur_camp == HeroConst.CampType.eNone or slot0.cur_camp == slot7.camp_type then
			if slot7.in_task == nil then
				slot7.in_task = uv0:checkHeroIsInTaskById(slot7.partner_id)
			end

			slot1:PushBack(slot7)
		end
	end

	if slot1:GetSize() <= 0 then
		slot0.no_hero_image:setVisible(true)
		slot0.hero_scrollview:setData({})

		return
	else
		slot0.no_hero_image:setVisible(false)
	end

	slot4 = slot1.items

	uv1(slot4, function (slot0, slot1)
		if slot0.in_task and not slot1.in_task then
			return false
		elseif not slot0.in_task and slot1.in_task then
			return true
		elseif slot0.camp_type ~= slot1.camp_type then
			return slot0.camp_type < slot1.camp_type
		elseif slot0.star ~= slot1.star then
			return slot1.star < slot0.star
		else
			return slot1.lev < slot0.lev
		end
	end)
	slot0.hero_scrollview:setData(slot4, function (slot0, slot1)
		uv0:_onClickHero(slot0, slot1)
	end, nil, {
		scale = 0.9,
		click_delay = 0.5,
		can_click = true,
		from_type = HeroConst.ExhibitionItemType.eVoyage
	})
end

function VoyageDispatchWindow.refreshItemNum(slot0)
	if slot0.role_vo and slot0.config then
		slot1 = slot0.role_vo.energy
		slot2 = 0

		if slot0.config.expend[1] then
			if uv0:getActivityStatus() == 1 and Config.ShippingData.data_const.discount then
				slot2 = (slot0.config.expend[1][2] or 0) * slot3.val / 1000
			end
		end

		slot0.item_num_label:setString(slot1 .. "/" .. slot2)
	end
end

function VoyageDispatchWindow.showBaseInfo(slot0, slot1)
	slot0.data = slot1 or {}
	slot2 = slot0.data.config or {}
	slot0.config = slot2

	slot0:refreshItemNum()
	slot0.time_label:setString(TimeTool.GetTimeFormat(slot2.need_time))

	for slot6, slot7 in pairs(slot0.hero_boxs or {}) do
		slot7:setVisible(false)
	end

	slot3 = slot2.limit_num
	slot0.need_hero_num = slot3
	slot4 = VoyageConst.Chose_Hero_PosX[slot3]

	for slot8 = 1, slot3 do
		if slot0.hero_boxs[slot8] == nil then
			slot9 = createImage(slot0.hero_layout, PathTool.getResFrame("common", "common_1005"), 0, 0, cc.p(0.5, 0.5), true)

			slot9:setScale(0.9)

			slot0.hero_boxs[slot8] = slot9
		end

		slot9:setVisible(true)

		if slot4[slot8] then
			slot9:setPosition(cc.p(slot10, 54))
		end
	end

	slot0:initConditionData()

	slot5 = {}
	slot6 = 0
	slot7 = 1
	slot8 = {}

	for slot12, slot13 in pairs(slot0.conditions or {}) do
		if slot13.star_num then
			slot6 = slot13.need_num
			slot7 = slot13.star_num
		elseif slot13.camp_type then
			uv0(slot8, slot13.camp_type)
		end
	end

	if slot6 > 0 then
		slot0.star_icon = createImage(slot0.condition_layout, PathTool.getResFrame("voyage", "voyage_1009"), 0, 0, cc.p(0.5, 0.5), true)
		slot9 = createLabel(22, 1, cc.c3b(132, 65, 0), 22, 23, slot7, slot0.star_icon, nil, cc.p(0.5, 0.5))

		slot0.star_icon:setTouchEnabled(true)
		registerButtonEventListener(slot0.star_icon, function ()
			message(string.format(TI18N("需要一个%d星英雄"), uv0))
		end, false)
		setChildUnEnabled(true, slot0.star_icon)
		uv0(slot5, slot0.star_icon)
	end

	for slot12, slot13 in pairs(slot0.camp_icons or {}) do
		slot13:setVisible(false)
	end

	for slot12, slot13 in ipairs(slot8) do
		if slot0.camp_icons[slot12] == nil then
			slot14 = createImage(slot0.condition_layout, PathTool.getHeroCampTypeIcon(slot13), 0, 0, cc.p(0.5, 0.5), true)

			slot14:setScale(0.8)
			slot14:setTouchEnabled(true)
			registerButtonEventListener(slot14, function ()
				message(string.format(TI18N("需要一个%s英雄"), HeroConst.CampAttrName[uv0]))
			end, false)
			setChildUnEnabled(true, slot14)

			slot0.camp_icons[slot12] = slot14
		end

		slot14.camp_type = slot13

		slot14:setVisible(true)
		uv0(slot5, slot14)
	end

	for slot13, slot14 in ipairs(slot5) do
		if VoyageConst.Condition_Icon_PosX[#slot5][slot13] then
			slot14:setPosition(cc.p(slot15, 0))
		end
	end
end

function VoyageDispatchWindow.getCampIconByCampType(slot0, slot1)
	for slot5, slot6 in pairs(slot0.camp_icons or {}) do
		if slot6.camp_type == slot1 then
			return slot6
		end
	end
end

function VoyageDispatchWindow.initConditionData(slot0)
	slot0.conditions = {}

	if slot0.config then
		for slot5, slot6 in pairs(slot0.config.condition or {} or {}) do
			if ((Config.ShippingData.data_condition[slot6] or {}).conition or {})[1] then
				if slot8[1][1] == "partner_star" then
					-- Nothing
				elseif slot8[1][1] == "partner_camp_type" then
					slot9.camp_type = slot8[1][2]
					slot9.need_num = slot8[1][3]
				end

				if next({
					star_num = slot8[1][2],
					need_num = slot8[1][3]
				}) ~= nil then
					uv0(slot0.conditions, slot9)
				end
			end
		end
	end
end

function VoyageDispatchWindow.refreshConditionStatus(slot0)
	slot0.con_status = true

	for slot4, slot5 in pairs(slot0.conditions or {}) do
		slot6 = false

		if slot5.star_num then
			setChildUnEnabled(not slot0:checkIsMeetCondition(1, slot5.star_num, slot5.need_num), slot0.star_icon)
		elseif slot5.camp_type then
			setChildUnEnabled(not slot0:checkIsMeetCondition(2, slot5.camp_type, slot5.need_num), slot0:getCampIconByCampType(slot5.camp_type))
		end

		if slot6 == false and slot0.con_status then
			if slot5.star_num then
				slot0.con_tips = string.format(TI18N("需要一个%d星英雄"), slot5.star_num)
			elseif slot5.camp_type then
				slot0.con_tips = string.format(TI18N("需要一个%s系英雄"), HeroConst.CampName[slot5.camp_type])
			end

			slot0.con_status = false
		end
	end

	if slot0.con_status then
		slot0.status_label:setTextColor(cc.c3b(36, 144, 3))
	else
		slot0.status_label:setTextColor(cc.c3b(201, 38, 6))
	end
end

function VoyageDispatchWindow.checkIsMeetCondition(slot0, slot1, slot2, slot3)
	for slot8, slot9 in pairs(slot0.chose_heros or {}) do
		if slot1 == 1 and slot2 <= slot9.star then
			slot4 = 0 + 1
		elseif slot1 == 2 and slot9.camp_type == slot2 then
			slot4 = slot4 + 1
		end
	end

	return slot3 <= slot4
end

function VoyageDispatchWindow.checkIsMeetAllCondition(slot0)
	slot1 = true

	for slot5, slot6 in pairs(slot0.conditions or {}) do
		slot7 = false

		if slot6.star_num then
			slot7 = slot0:checkIsMeetCondition(1, slot6.star_num, slot6.need_num)
		elseif slot6.camp_type then
			slot7 = slot0:checkIsMeetCondition(2, slot6.camp_type, slot6.need_num)
		end

		if slot7 == false then
			slot1 = false

			break
		end
	end

	return slot1
end

function VoyageDispatchWindow._onClickHero(slot0, slot1, slot2)
	if slot2.in_task then
		return
	end

	if slot2.is_ui_select then
		for slot6, slot7 in pairs(slot0.hero_icons or {}) do
			if slot7:getData().partner_id == slot2.partner_id then
				slot11 = slot7:getParent():convertToNodeSpace(slot1:convertToWorldSpace(cc.p(0, 0)))

				slot7:runAction(cc.Sequence:create(cc.MoveTo:create(0.07, cc.p(slot11.x + 59.5, slot11.y + 59.5)), cc.CallFunc:create(function ()
					uv0:checkDeleteSameHeroIcon(uv1.partner_id)
				end)))

				break
			end
		end

		slot2.is_ui_select = false

		slot1:setSelected(false)
		slot0:updateChoseHeroList(slot2, 2)
	else
		if slot0.need_hero_num <= #slot0.chose_heros then
			message(TI18N("已达英雄数量上限"))

			return
		end

		slot0:createChoseHeroIcon(slot2, slot1)

		slot2.is_ui_select = true

		slot1:setSelected(true)
		slot0:updateChoseHeroList(slot2, 1)
	end

	slot0:refreshConditionStatus()
end

function VoyageDispatchWindow.createChoseHeroIcon(slot0, slot1, slot2)
	slot0:checkDeleteSameHeroIcon(slot1.partner_id)

	slot3 = HeroExhibitionItem.new(1, true, 0.5)

	slot3:setData(slot1)
	slot3:addCallBack(function ()
		slot2 = nil

		for slot6, slot7 in pairs(uv1.hero_scrollview:getItemList() or {}) do
			if slot7:getData().partner_id == uv0:getData().partner_id then
				slot2 = slot7
			end
		end

		if slot2 then
			uv1:_onClickHero(slot2, slot2:getData())
		else
			for slot6, slot7 in pairs(uv1.hero_icons or {}) do
				if slot7:getData().partner_id == slot0.partner_id then
					slot9 = slot7:getParent()

					slot7:stopAllActions()
					slot7:DeleteMe()
					uv2(uv1.hero_icons, slot6)

					break
				end
			end

			slot0.is_ui_select = false

			uv1:updateChoseHeroList(slot0, 2)
			uv1:refreshConditionStatus()
		end
	end)

	if slot0:getMastLeftEmptyBox() then
		slot3:setName("hero_icon")
		slot4:addChild(slot3)
		uv1(slot0.hero_icons, slot3)

		if slot2 then
			slot6 = slot4:convertToNodeSpace(slot2:convertToWorldSpace(cc.p(0, 0)))

			slot3:setPosition(cc.p(slot6.x + 59.5, slot6.y + 59.5))
			slot3:runAction(cc.MoveTo:create(0.07, cc.p(59.5, 59.5)))
		else
			slot3:setPosition(cc.p(59.5, 59.5))
		end
	end
end

function VoyageDispatchWindow.checkDeleteSameHeroIcon(slot0, slot1)
	for slot5, slot6 in pairs(slot0.hero_icons or {}) do
		if slot6:getData().partner_id == slot1 then
			slot6:stopAllActions()
			slot6:DeleteMe()
			uv0(slot0.hero_icons, slot5)

			break
		end
	end
end

function VoyageDispatchWindow.getMastLeftEmptyBox(slot0)
	slot1 = nil

	for slot5, slot6 in ipairs(slot0.hero_boxs) do
		if not slot6:getChildByName("hero_icon") then
			slot1 = slot6

			break
		end
	end

	return slot1
end

function VoyageDispatchWindow.updateChoseHeroList(slot0, slot1, slot2)
	if slot2 == 1 then
		uv0(slot0.chose_heros, slot1)
	elseif slot2 == 2 then
		for slot6, slot7 in pairs(slot0.chose_heros or {}) do
			if slot7.partner_id == slot1.partner_id then
				uv1(slot0.chose_heros, slot6)

				break
			end
		end
	end
end

function VoyageDispatchWindow._onClickCampBtn(slot0, slot1, slot2)
	if slot0.cur_camp == slot1 then
		return
	end

	slot0.cur_camp = slot1
	slot3, slot4 = slot2:getPosition()

	slot0.img_select:setPosition(cc.p(slot3, slot4))
	slot0:refreshCampHeroList()
end

function VoyageDispatchWindow._onClickQuickChoseBtn(slot0)
	for slot4, slot5 in pairs(slot0.hero_icons or {}) do
		slot5:stopAllActions()
		slot5:DeleteMe()
	end

	slot0.hero_icons = {}

	for slot4, slot5 in pairs(slot0.chose_heros or {}) do
		slot5.is_ui_select = false
	end

	slot0.chose_heros = {}

	for slot5, slot6 in pairs(slot0.hero_scrollview:getItemList() or {}) do
		slot6:setSelected(false)
	end

	slot2 = HeroController:getInstance():getModel():getHeroList()
	slot3 = 0
	slot4 = 0
	slot5 = {}

	for slot9, slot10 in pairs(slot0.conditions or {}) do
		if slot10.star_num then
			slot3 = slot10.star_num
			slot4 = slot10.need_num
		elseif slot10.camp_type then
			slot5[slot10.camp_type] = slot10.need_num
		end
	end

	slot6 = {}
	slot7 = {}
	slot8 = {}

	for slot12, slot13 in pairs(slot2 or {}) do
		slot14 = false

		if slot3 <= slot13.star and not uv0:checkHeroIsInTaskById(slot13.partner_id) then
			slot14 = true

			uv1(slot6, slot13)
		end

		for slot18, slot19 in pairs(slot0.conditions or {}) do
			if slot19.camp_type and slot19.camp_type == slot13.camp_type and not uv0:checkHeroIsInTaskById(slot13.partner_id) then
				if not slot7[slot19.camp_type] then
					slot7[slot19.camp_type] = {}
				end

				uv1(slot7[slot19.camp_type], slot13)

				if slot14 then
					uv1(slot8, slot13)
				end
			end
		end
	end

	function slot9(slot0, slot1)
		if slot0.star ~= slot1.star then
			return slot0.star < slot1.star
		elseif slot0.lev ~= slot1.lev then
			return slot0.lev < slot1.lev
		else
			return slot0.camp_type < slot1.camp_type
		end
	end

	uv2(slot6, slot9)
	uv2(slot8, slot9)

	for slot13, slot14 in pairs(slot7 or {}) do
		uv2(slot14, slot9)
	end

	for slot13, slot14 in ipairs(slot8) do
		if slot4 > #slot0.chose_heros then
			uv1(slot0.chose_heros, slot14)
		elseif slot0:checkIsMeetAllCondition() then
			for slot18, slot19 in pairs(slot5 or {}) do
				if slot14.camp_type == slot18 and slot0:checkChoseHeroNumByCamp(slot18) < slot19 then
					uv1(slot0.chose_heros, slot14)
				end
			end
		else
			break
		end
	end

	if slot0:checkIsMeetAllCondition() then
		slot0:afterQuickChoseHero()

		return
	end

	if slot4 - #slot0.chose_heros > 0 then
		for slot15, slot16 in ipairs(slot6) do
			if not slot0:checkIsChoseHeroById(slot16.partner_id) then
				uv1(slot0.chose_heros, slot16)

				slot11 = 0 + 1
			end

			if slot10 <= slot11 then
				break
			end
		end
	end

	if slot0:checkIsMeetAllCondition() then
		slot0:afterQuickChoseHero()

		return
	end

	for slot14, slot15 in pairs(slot7 or {}) do
		if slot5[slot14] - slot0:checkChoseHeroNumByCamp(slot14) > 0 then
			for slot23, slot24 in ipairs(slot15) do
				if not slot0:checkIsChoseHeroById(slot24.partner_id) then
					uv1(slot0.chose_heros, slot24)

					slot19 = 0 + 1
				end

				if slot18 <= slot19 then
					break
				end
			end
		end
	end

	slot0:afterQuickChoseHero()
end

function VoyageDispatchWindow.checkIsChoseHeroById(slot0, slot1)
	slot2 = false

	for slot6, slot7 in pairs(slot0.chose_heros or {}) do
		if slot7.partner_id == slot1 then
			slot2 = true

			break
		end
	end

	return slot2
end

function VoyageDispatchWindow.checkChoseHeroNumByCamp(slot0, slot1)
	for slot6, slot7 in pairs(slot0.chose_heros or {}) do
		if slot7.camp_type == slot1 then
			slot2 = 0 + 1
		end
	end

	return slot2
end

function VoyageDispatchWindow.afterQuickChoseHero(slot0)
	for slot4, slot5 in ipairs(slot0.chose_heros) do
		slot5.is_ui_select = true

		for slot10, slot11 in pairs(slot0.hero_scrollview:getItemList() or {}) do
			if slot11:getData().partner_id == slot5.partner_id then
				slot11:setSelected(true)
			end
		end

		slot0:createChoseHeroIcon(slot5)
	end

	slot0:refreshConditionStatus()
end

function VoyageDispatchWindow._onClickDispatchBtn(slot0)
	if slot0.con_status == true then
		for slot5, slot6 in pairs(slot0.chose_heros or {}) do
			uv0({}, {
				partner_id = slot6.partner_id
			})
		end

		if slot0.data then
			uv1:requestReceiveOrder(slot0.data.order_id, slot1)
		end
	else
		slot0.con_tips = slot0.con_tips or TI18N("不满足派遣条件")

		message(slot0.con_tips)
	end
end

function VoyageDispatchWindow._onClickCloseBtn(slot0)
	uv0:openVoyageDispatchWindow(false)
end

function VoyageDispatchWindow.close_callback(slot0)
	if slot0.hero_scrollview then
		slot0.hero_scrollview:DeleteMe()

		slot0.hero_scrollview = nil
	end

	for slot5, slot6 in pairs(HeroController:getInstance():getModel():getHeroList() or {}) do
		slot6.is_ui_select = nil
		slot6.in_task = nil
	end

	if slot0.role_assets_event then
		if slot0.role_vo then
			slot0.role_vo:UnBind(slot0.role_assets_event)
		end

		slot0.role_assets_event = nil
		slot0.role_vo = nil
	end

	for slot5, slot6 in pairs(slot0.hero_icons or {}) do
		slot6:stopAllActions()
		slot6:DeleteMe()
	end

	uv0:openVoyageDispatchWindow(false)
end
