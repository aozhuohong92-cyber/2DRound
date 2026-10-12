slot1 = SeerpalaceController:getInstance():getModel()
slot2 = table.insert
slot3 = table.sort
SeerpalaceChangePanel = class("SeerpalaceChangePanel", function ()
	return ccui.Widget:create()
end)

function SeerpalaceChangePanel.ctor(slot0)
	slot0.camp_list = {}
	slot0.cur_role_vo = {}
	slot0.cur_role_item = nil
	slot0.cur_camp_type = HeroConst.CampType.eNone
	slot0.left_stars_1 = {}
	slot0.left_stars_2 = {}
	slot0.right_stars_1 = {}
	slot0.right_stars_2 = {}
	slot0.is_first_open = true
	slot0.change_partner_id = 0
	slot0.change_new_partner_bid = 0
	slot0.lock_partner_ids = {}
	slot0.cancel_partner_id = 0

	slot0:configUI()
	slot0:register_event()
end

function SeerpalaceChangePanel.addToParent(slot0, slot1)
	slot0:setVisible(slot1 or false)

	if slot0.is_first_open then
		uv0:requestSeerpalaceChangeInfo()

		slot0.is_first_open = false
	end
end

function SeerpalaceChangePanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("seerpalace/seerpalace_change_panel"))

	slot0.root_wnd:setPosition(0, 0)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.change_btn = slot1:getChildByName("change_btn")

	slot0.change_btn:setVisible(false)

	slot2 = slot0.change_btn:getContentSize()
	slot0.change_btn_label = createRichLabel(24, cc.c4b(255, 255, 255, 255), cc.p(0.5, 0.5), cc.p(slot2.width / 2, slot2.height / 2))

	slot0.change_btn:addChild(slot0.change_btn_label)
	slot0.change_btn_label:setString(TI18N("转换"))

	slot0.cancel_btn = slot1:getChildByName("cancel_btn")

	slot0.cancel_btn:getChildByName("label"):setString(TI18N("取消"))
	slot0.cancel_btn:setVisible(false)

	slot0.save_btn = slot1:getChildByName("save_btn")

	slot0.save_btn:getChildByName("label"):setString(TI18N("保存"))
	slot0.save_btn:setVisible(false)

	slot0.left_panel = slot1:getChildByName("left_panel")

	slot0.left_panel:setVisible(false)

	slot0.left_lv_label = slot0.left_panel:getChildByName("left_lv_label")
	slot0.right_panel = slot1:getChildByName("right_panel")

	slot0.right_panel:setVisible(false)

	slot0.right_lv_label = slot0.right_panel:getChildByName("right_lv_label")
	slot0.left_effect_node = slot1:getChildByName("left_effect_node")
	slot0.right_effect_node = slot1:getChildByName("right_effect_node")
	slot8 = "role_layout"
	slot0.role_layout = slot1:getChildByName(slot8)

	for slot8 = 1, 4 do
		if slot0.role_layout:getChildByName("camp_btn_" .. slot8) then
			slot10 = {
				camp_btn = slot9,
				select_image = slot9:getChildByName("select_image")
			}

			slot10.select_image:setVisible(false)

			slot0.camp_list[slot8] = slot10
		end
	end

	slot6 = 0.9
	slot0.role_scrollview = CommonScrollViewLayout.new(slot0.role_layout, cc.p(40, 128), ScrollViewDir.horizontal, ScrollViewStartPos.top, cc.size(slot0.role_layout:getContentSize().width - 80, 108), {
		start_y = 0,
		start_x = 0,
		space_x = 15,
		row = 1,
		space_y = 0,
		col = 0,
		item_class = HeroExhibitionItem,
		item_width = 119 * slot6,
		item_height = 119 * slot6,
		scale = slot6
	})

	slot0.role_scrollview:setSwallowTouches(false)
end

function SeerpalaceChangePanel.register_event(slot0)
	registerButtonEventListener(slot0.change_btn, handler(slot0, slot0._onClickChangeBtn), true)
	registerButtonEventListener(slot0.cancel_btn, handler(slot0, slot0._onClickCancelBtn), true)

	slot5 = true

	registerButtonEventListener(slot0.save_btn, handler(slot0, slot0._onClickSaveBtn), slot5)
	registerButtonEventListener(slot0.left_panel, handler(slot0, slot0._onClickLeftHero))

	slot4 = handler

	registerButtonEventListener(slot0.right_panel, slot4(slot0, slot0._onClickRightHero))

	for slot4, slot5 in ipairs(slot0.camp_list) do
		if slot5.camp_btn then
			registerButtonEventListener(slot5.camp_btn, handler(slot0, slot0._onClickCampBtn), nil, , slot4)
		end
	end

	if not slot0.role_change_info_event then
		slot0.role_change_info_event = GlobalEvent:getInstance():Bind(SeerpalaceEvent.Change_Role_Info_Event, function (slot0)
			uv0:setData(slot0)
		end)
	end

	if not slot0.change_success_event then
		slot0.change_success_event = GlobalEvent:getInstance():Bind(SeerpalaceEvent.Change_Role_Success, function ()
			uv0:handleRightChangeEffect(true)
		end)
	end
end

function SeerpalaceChangePanel._onClickChangeBtn(slot0)
	if slot0.cur_role_vo and slot0.cur_role_vo.id then
		uv0:requestSeerpalaceChangeRole(slot0.cur_role_vo.id, 1)
	else
		message(TI18N("请先选择一位英雄"))
	end
end

function SeerpalaceChangePanel._onClickCancelBtn(slot0)
	if slot0.change_partner_id and slot0.change_partner_id ~= 0 then
		slot0.cancel_partner_id = slot0.change_partner_id

		uv0:requestSeerpalaceChangeRole(slot0.change_partner_id, 0)
	end
end

function SeerpalaceChangePanel._onClickSaveBtn(slot0)
	if slot0.change_partner_id and slot0.change_partner_id ~= 0 then
		uv0:requestSeerpalaceChangeRole(slot0.change_partner_id, 2)
	end
end

function SeerpalaceChangePanel._onClickLeftHero(slot0)
	if slot0.cur_role_vo and next(slot0.cur_role_vo) ~= nil then
		HeroController:getInstance():openHeroTipsPanel(true, slot0.cur_role_vo)
	end
end

function SeerpalaceChangePanel._onClickRightHero(slot0)
	if slot0.change_new_partner_bid then
		-- Nothing
	end
end

function SeerpalaceChangePanel.setData(slot0, slot1)
	slot0.data = slot1 or {}
	slot0.change_partner_id = slot1.partner_id or 0
	slot0.change_new_partner_bid = slot1.new_partner_bid or 0
	slot0.lock_partner_ids = slot1.partner_ids or {}

	slot0.role_layout:setVisible(slot0.change_partner_id == 0)
	slot0.cancel_btn:setVisible(slot0.change_partner_id ~= 0)
	slot0.save_btn:setVisible(slot0.change_partner_id ~= 0)

	for slot5, slot6 in pairs(slot0.camp_list) do
		if slot6 and slot6.select_image then
			slot6.select_image:setVisible(false)
		end
	end

	slot0.cur_role_vo = {}

	if slot0.change_partner_id == 0 then
		slot0.cur_index = slot0.cur_index or 1

		slot0:_onClickCampBtn(slot0.cur_index, true)
	else
		slot0.cur_camp_type = HeroConst.CampType.eNone

		if slot0.cur_role_item then
			slot0.cur_role_item:setSelected(false)

			slot0.cur_role_item = nil
		end
	end

	slot0:refreshRoleSpine()
end

function SeerpalaceChangePanel.refreshRoleList(slot0)
	slot0.cur_role_data = {}
	slot1 = HeroController:getInstance():getModel():getAllHeroArray()
	slot2 = HeroConst.CampType.eNone

	if slot0.cur_index == SeerpalaceConst.Change_Index_Camp.All then
		slot2 = HeroConst.CampType.eNone
	elseif slot0.cur_index == SeerpalaceConst.Change_Index_Camp.Water then
		slot2 = HeroConst.CampType.eWater
	elseif slot0.cur_index == SeerpalaceConst.Change_Index_Camp.Fire then
		slot2 = HeroConst.CampType.eFire
	elseif slot0.cur_index == SeerpalaceConst.Change_Index_Camp.Wind then
		slot2 = HeroConst.CampType.eWind
	end

	slot0.cur_camp_type = slot2

	for slot6, slot7 in pairs(slot1.items or {}) do
		if slot7.star == 4 or slot7.star == 5 then
			if slot2 == HeroConst.CampType.eNone then
				if slot7.camp_type == HeroConst.CampType.eWater or slot7.camp_type == HeroConst.CampType.eFire or slot7.camp_type == HeroConst.CampType.eWind then
					slot9 = deepCopy(slot7)
					slot9.is_locked = slot0:checkIsLockedRole(slot7.id)

					uv0(slot0.cur_role_data, slot9)
				end
			elseif slot7.camp_type == slot2 then
				slot9 = deepCopy(slot7)
				slot9.is_locked = slot8

				uv0(slot0.cur_role_data, slot9)
			end
		end
	end

	uv1(slot0.cur_role_data, function (slot0, slot1)
		if uv0:checkIsLockedRole(slot0.id) and not uv0:checkIsLockedRole(slot1.id) then
			return false
		elseif not slot2 and slot3 then
			return true
		elseif slot0.star == slot1.star then
			if slot0.camp_type == slot1.camp_type then
				return slot1.lev < slot0.lev
			else
				return slot0.camp_type < slot1.camp_type
			end
		else
			return slot1.star < slot0.star
		end
	end)

	if slot0.cur_role_item then
		slot0.cur_role_item:setSelected(false)
	end

	slot0.role_scrollview:setData(slot0.cur_role_data, handler(slot0, slot0._onClickPartner), nil, {
		scale = 0.85,
		can_click = true,
		from_type = HeroConst.ExhibitionItemType.eHeroChange
	})
	slot0.role_scrollview:addEndCallBack(function ()
		if uv0.cur_role_vo and next(uv0.cur_role_vo) ~= nil and uv0.cur_camp_type then
			if uv0.cur_role_vo.camp_type == uv0.cur_camp_type or uv0.cur_camp_type == HeroConst.CampType.eNone then
				for slot4, slot5 in pairs(uv0.role_scrollview:getItemList()) do
					if slot5:getData().id == uv0.cur_role_vo.id then
						uv0:_onClickPartner(slot5, slot6)

						break
					end
				end
			end
		elseif uv0.cancel_partner_id and uv0.cancel_partner_id ~= 0 then
			for slot4, slot5 in pairs(uv0.role_scrollview:getItemList()) do
				if slot5:getData().id == uv0.cancel_partner_id then
					uv0:_onClickPartner(slot5, slot6)
					uv0.role_scrollview:jumpToMove(cc.p(-(slot4 - 3) * 116.14999999999999, 0), 0.01)

					break
				end
			end

			uv0.cancel_partner_id = 0
		end
	end)
end

function SeerpalaceChangePanel.checkIsLockedRole(slot0, slot1)
	slot2 = false

	for slot6, slot7 in pairs(slot0.lock_partner_ids) do
		if slot7.id and slot7.id == slot1 then
			slot2 = true

			break
		end
	end

	return slot2
end

function SeerpalaceChangePanel._onClickPartner(slot0, slot1, slot2)
	if slot2:checkHeroLockTips(true) then
		return
	end

	if slot0.cur_role_item then
		slot0.cur_role_item:setSelected(false)
	end

	slot1:setSelected(true)

	slot0.cur_role_item = slot1
	slot0.cur_role_vo = slot2
	slot4 = ""

	if Config.RecruitHighData.data_seerpalace_const["hero_change" .. slot2.star] and slot5.val then
		if Config.ItemData.data_get_data(slot5.val[1][1]) then
			slot4 = string.format("<img src=%s visible=true scale=0.3 /><div fontColor=#ffffff fontsize=26 outline=2,#020019>%d 转换</div>", PathTool.getItemRes(slot8.icon), slot5.val[1][2])
		end
	end

	slot0.change_btn_label:setString(TI18N(slot4))
	slot0:refreshRoleSpine()
end

function SeerpalaceChangePanel.refreshRoleSpine(slot0)
	if slot0.right_role then
		slot0.right_role:DeleteMe()

		slot0.right_role = nil
	end

	if slot0.cur_role_vo and next(slot0.cur_role_vo) ~= nil or slot0.change_partner_id ~= 0 then
		slot1 = {}

		if slot0.change_partner_id == 0 then
			slot1 = slot0.cur_role_vo

			slot0.change_btn:setVisible(true)
			slot0:handleRightRandomEffect(true)
		else
			slot1 = HeroController:getInstance():getModel():getHeroById(slot0.change_partner_id)

			slot0.change_btn:setVisible(false)
			slot0:handleRightRandomEffect(false)
		end

		if slot1 and next(slot1) ~= nil then
			slot0.cur_role_vo = slot1
			slot2 = PathTool.getHeroCampTypeIcon(slot1.camp_type)

			if not slot0.left_role_bid or not slot0.left_role_star or slot0.left_role_bid ~= slot1.bid or slot0.left_role_star ~= slot1.star then
				slot0.left_role_bid = slot1.bid
				slot0.left_role_star = slot1.star

				if slot0.left_role then
					slot0.left_role:DeleteMe()

					slot0.left_role = nil
				end

				slot0.left_role = BaseRole.new(BaseRole.type.partner, slot1, nil, {
					skin_id = slot1.use_skin
				})

				slot0.left_role:setCascade(true)
				slot0.left_role:setAnchorPoint(cc.p(0, 0))
				slot0.left_role:setPosition(cc.p(100, 95))
				slot0.left_role:setScale(0.45)
				slot0.left_role:setAnimation(0, PlayerAction.show, true)
				slot0.left_panel:addChild(slot0.left_role)

				if not slot0.left_name_label then
					slot0.left_name_label = createRichLabel(20, 1, cc.p(0.5, 0.5), cc.p(100, 372))

					slot0.left_panel:addChild(slot0.left_name_label)
				end

				slot0.left_name_label:setString(string.format("<img src='%s' scale=0.5 />    <div fontcolor=#ffffff outline=2,#000000>    %s</div>", slot2, slot1.name))
				slot0.left_lv_label:setString(slot1.lev)
			end

			slot0.right_lv_label:setString(slot1.lev)

			slot3 = ""

			if slot0.change_new_partner_bid ~= 0 then
				slot0.right_role = BaseRole.new(BaseRole.type.partner, {
					bid = slot0.change_new_partner_bid,
					star = slot1.star
				})

				slot0.right_role:setCascade(true)
				slot0.right_role:setAnchorPoint(cc.p(0, 0))
				slot0.right_role:setPosition(cc.p(100, 95))
				slot0.right_role:setScale(0.45)
				slot0.right_role:setAnimation(0, PlayerAction.show, true)
				slot0.right_panel:addChild(slot0.right_role)

				if Config.PartnerData.data_partner_base[slot0.change_new_partner_bid] and slot4.name then
					slot3 = string.format("<img src='%s' scale=0.5 /><div fontcolor=#ffffff outline=2,#000000>    %s</div>", slot2, slot4.name)
				end
			else
				slot3 = string.format("<img src='%s' scale=0.5 /><div fontcolor=#ffffff outline=2,#000000>    ????</div>", slot2)
			end

			if not slot0.right_name_label then
				slot0.right_name_label = createRichLabel(20, 1, cc.p(0.5, 0.5), cc.p(100, 372))

				slot0.right_panel:addChild(slot0.right_name_label)
			end

			slot7 = slot3

			slot0.right_name_label:setString(slot7)

			for slot7, slot8 in pairs(slot0.left_stars_1) do
				slot8:setVisible(false)
			end

			for slot7, slot8 in pairs(slot0.left_stars_2) do
				slot8:setVisible(false)
			end

			for slot7, slot8 in pairs(slot0.right_stars_1) do
				slot8:setVisible(false)
			end

			for slot7, slot8 in pairs(slot0.right_stars_2) do
				slot8:setVisible(false)
			end

			if slot0.left_star10 then
				slot0.left_star10:setVisible(false)
			end

			if slot0.right_star10 then
				slot0.right_star10:setVisible(false)
			end

			function slot5(slot0, slot1, slot2, slot3)
				slot4 = SeerpalaceConst.Change_Pos_X[slot0] or {}

				for slot8 = 1, slot0 do
					if not slot2[slot8] then
						slot2[slot8] = createImage(slot3, slot1, 0, 338, cc.p(0.5, 0.5), true)
					end

					slot2[slot8]:setVisible(true)

					if slot4[slot8] then
						slot2[slot8]:setPositionX(slot9)
					end
				end
			end

			if slot1.star > 0 and slot4 <= 5 then
				slot6 = PathTool.getResFrame("common", "common_90074")

				slot5(slot4, slot6, slot0.left_stars_1, slot0.left_panel)
				slot5(slot4, slot6, slot0.right_stars_1, slot0.right_panel)
			elseif slot4 >= 6 and slot4 <= 9 then
				slot6 = PathTool.getResFrame("common", "common_90075")
				slot7 = slot4 - 5

				slot5(slot7, slot6, slot0.left_stars_2, slot0.left_panel)
				slot5(slot7, slot6, slot0.right_stars_2, slot0.right_panel)
			elseif slot4 >= 10 then
				if slot0.left_star10 == nil then
					slot0.left_star10 = createImage(slot0.left_panel, PathTool.getResFrame("common", "common_90073"), 100, 338, cc.p(0.5, 0.5), true, 0, false)

					slot0.left_star10:setScale(1.2)
				else
					slot0.left_star10:setVisible(true)
				end

				if slot0.right_star10 == nil then
					slot0.right_star10 = createImage(slot0.right_panel, slot6, 100, 338, cc.p(0.5, 0.5), true, 0, false)

					slot0.right_star10:setScale(1.2)
				else
					slot0.right_star10:setVisible(true)
				end
			end
		end

		slot0.left_panel:setVisible(true)
		slot0.right_panel:setVisible(true)
		slot0:handleLeftEmptyEffect(false)
	else
		slot0.left_panel:setVisible(false)
		slot0.right_panel:setVisible(false)
		slot0.change_btn:setVisible(false)
		slot0:handleLeftEmptyEffect(true)
		slot0:handleRightRandomEffect(false)

		slot0.left_role_bid = nil
		slot0.left_role_star = nil

		if slot0.left_role then
			slot0.left_role:DeleteMe()

			slot0.left_role = nil
		end
	end
end

function SeerpalaceChangePanel._onClickCampBtn(slot0, slot1, slot2)
	if slot0.cur_index == slot1 and not slot2 then
		return
	end

	if slot0.cur_index and slot0.camp_list[slot0.cur_index] and slot3.select_image then
		slot3.select_image:setVisible(false)
	end

	if slot0.camp_list[slot1] and slot3.select_image then
		slot3.select_image:setVisible(true)
	end

	slot0.cur_index = slot1

	slot0:refreshRoleList()
end

function SeerpalaceChangePanel.handleLeftEmptyEffect(slot0, slot1)
	if slot1 == false then
		if slot0.left_empty_effect then
			slot0.left_empty_effect:clearTracks()
			slot0.left_empty_effect:removeFromParent()

			slot0.left_empty_effect = nil
		end
	elseif not tolua.isnull(slot0.left_effect_node) and slot0.left_empty_effect == nil then
		slot0.left_empty_effect = createEffectSpine(Config.EffectData.data_effect_info[620], cc.p(0, 0), cc.p(0.5, 0), true, PlayerAction.action)

		slot0.left_effect_node:addChild(slot0.left_empty_effect)
	end
end

function SeerpalaceChangePanel.handleRightRandomEffect(slot0, slot1)
	if slot1 == false then
		if slot0.right_random_effect then
			slot0.right_random_effect:clearTracks()
			slot0.right_random_effect:removeFromParent()

			slot0.right_random_effect = nil
		end
	elseif not tolua.isnull(slot0.right_effect_node) and slot0.right_random_effect == nil then
		slot0.right_random_effect = createEffectSpine(Config.EffectData.data_effect_info[621], cc.p(0, 0), cc.p(0.5, 0), true, PlayerAction.action)

		slot0.right_effect_node:addChild(slot0.right_random_effect)
	end
end

function SeerpalaceChangePanel.handleRightChangeEffect(slot0, slot1)
	if slot1 == false then
		if slot0.right_change_effect then
			slot0.right_change_effect:clearTracks()
			slot0.right_change_effect:removeFromParent()

			slot0.right_change_effect = nil
		end
	elseif not tolua.isnull(slot0.right_effect_node) and slot0.right_change_effect == nil then
		slot0.right_change_effect = createEffectSpine(Config.EffectData.data_effect_info[622], cc.p(0, 0), cc.p(0.5, 0), false, PlayerAction.action)

		slot0.right_effect_node:addChild(slot0.right_change_effect)
	elseif slot0.right_change_effect then
		slot0.right_change_effect:setAnimation(0, PlayerAction.action, false)
	end
end

function SeerpalaceChangePanel.DeleteMe(slot0)
	slot0:handleLeftEmptyEffect(false)
	slot0:handleRightRandomEffect(false)
	slot0:handleRightChangeEffect(true)

	if slot0.role_scrollview then
		slot0.role_scrollview:DeleteMe()

		slot0.role_scrollview = nil
	end

	if slot0.left_role then
		slot0.left_role:DeleteMe()

		slot0.left_role = nil
	end

	if slot0.right_role then
		slot0.right_role:DeleteMe()

		slot0.right_role = nil
	end

	if slot0.left_name_label then
		slot0.left_name_label:DeleteMe()

		slot0.left_name_label = nil
	end

	if slot0.right_name_label then
		slot0.right_name_label:DeleteMe()

		slot0.right_name_label = nil
	end

	if slot0.change_btn_label then
		slot0.change_btn_label:DeleteMe()

		slot0.change_btn_label = nil
	end

	if slot0.role_change_info_event then
		GlobalEvent:getInstance():UnBind(slot0.role_change_info_event)

		slot0.role_change_info_event = nil
	end

	if slot0.change_success_event then
		GlobalEvent:getInstance():UnBind(slot0.change_success_event)

		slot0.change_success_event = nil
	end
end
