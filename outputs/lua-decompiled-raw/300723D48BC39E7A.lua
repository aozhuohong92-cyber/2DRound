HeroSacrificePanel = class("HeroSacrificePanel", function ()
	return ccui.Widget:create()
end)
slot1 = HeroController:getInstance():getModel()
slot2 = string.format
slot3 = table.sort
slot4 = table.insert
slot5 = Config.PartnerData.data_get_compound_info

function HeroSacrificePanel.ctor(slot0)
	slot0.dic_select_partner_vo = {}
	slot0.select_count = 0
	slot0.select_max_count = 15
	slot0.cur_chip_count = 0
	slot0.is_play_efffect = false
	slot0.setting = {
		y = -14
	}

	slot0:loadResources()
end

function HeroSacrificePanel.loadResources(slot0)
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/hero", "hero_reset_bg", true),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_3", false),
			type = ResourcesType.single
		}
	}
	slot0.resources_load = ResourcesLoad.New(true)

	slot0.resources_load:addAllList(slot0.res_list, function ()
		uv0:configUI()
		uv0:register_event()
		uv0:createRootWnd()
	end)
end

function HeroSacrificePanel.configUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("hero/hero_sacrifice_panel"))

	slot0:addChild(slot0.root_wnd)

	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg/hero", "hero_reset_bg", true), LOADTEXT_TYPE)
	slot0.background:setScale(display.getMaxScale())

	slot0.main_panel = slot0.root_wnd:getChildByName("main_container")
	slot0.reset_container = slot0.main_panel:getChildByName("reset_container")

	slot0.reset_container:setVisible(false)

	slot0.disband_container = slot0.main_panel:getChildByName("disband_container")
	slot0.spine_node = slot0.disband_container:getChildByName("spine_node")
	slot0.tip_btn = slot0.disband_container:getChildByName("tip_btn")
	slot0.partner_btn = slot0.disband_container:getChildByName("partner_btn")
	slot0.look_btn = slot0.disband_container:getChildByName("look_btn")
	slot0.putin_btn = slot0.disband_container:getChildByName("putin_btn")
	slot0.putin_btn_label = slot0.putin_btn:getChildByName("label")

	slot0.putin_btn_label:setString(TI18N("快速放入"))

	slot0.cancel_btn = slot0.disband_container:getChildByName("cancel_btn")
	slot0.cancel_btn_label = slot0.cancel_btn:getChildByName("label")

	slot0.cancel_btn_label:setString(TI18N("取消放入"))
	slot0.cancel_btn:setVisible(false)

	slot0.disband_btn = slot0.disband_container:getChildByName("disband_btn")
	slot0.disband_btn_lable = slot0.disband_btn:getChildByName("label")

	slot0.disband_btn_lable:setString(TI18N("献 祭"))

	slot0.item_bg_1 = slot0.disband_container:getChildByName("item_bg_1")
	slot0.max_btn = slot0.item_bg_1:getChildByName("max_btn")
	slot0.max_btn_label = slot0.max_btn:getChildByName("label")

	slot0.max_btn_label:setString(TI18N("max"))

	slot0.add_btn = slot0.item_bg_1:getChildByName("add_btn")
	slot0.add_btn_label = slot0.add_btn:getChildByName("label")
	slot0.redu_btn = slot0.item_bg_1:getChildByName("redu_btn")
	slot0.redu_btn_label = slot0.redu_btn:getChildByName("label")
	slot0.resolve_count = slot0.item_bg_1:getChildByName("resolve_count")
	slot0.lab_put_count = slot0.disband_container:getChildByName("lab_put_count")
	slot0.lab_have_count = slot0.disband_container:getChildByName("lab_have_count")
	slot0.text_bg = slot0.disband_container:getChildByName("text_bg")
	slot2 = slot0.disband_container:getChildByName("camp_node")
	slot0.camp_btn_list = {
		[0] = slot2:getChildByName("camp_btn0"),
		[HeroConst.CampType.eWater] = slot2:getChildByName("camp_btn1"),
		[HeroConst.CampType.eFire] = slot2:getChildByName("camp_btn2"),
		[HeroConst.CampType.eWind] = slot2:getChildByName("camp_btn3"),
		[HeroConst.CampType.eLight] = slot2:getChildByName("camp_btn4"),
		[HeroConst.CampType.eDark] = slot2:getChildByName("camp_btn5")
	}
	slot0.img_select = slot2:getChildByName("img_select")
	slot3, slot4 = slot0.camp_btn_list[0]:getPosition()

	slot0.img_select:setPosition(slot3 - 0.5, slot4 + 1)

	slot0.reset_effect = createEffectSpine("E24121", cc.p(360, 701), cc.p(0.5, 0.5), true, PlayerAction.action_1, function ()
		uv0:effectCompleteOnce()
	end)

	slot0.spine_node:addChild(slot0.reset_effect, 1)

	slot6 = createEditBox(slot0.item_bg_1, PathTool.getResFrame("common", "common_99998"), cc.size(90, 50), nil, 22, nil, 22, "", nil, , LOADTEXT_TYPE_PLIST)
	slot0.edit_content = slot6

	slot6:setAnchorPoint(cc.p(0.5, 0.5))
	slot6:setPlaceholderFontColor(cc.c4b(255, 246, 228, 255))
	slot6:setFontColor(cc.c4b(255, 246, 228, 255))
	slot6:setPosition(cc.p(114, 27))

	slot7 = false

	slot6:registerScriptEditBoxHandler(function (slot0, slot1)
		if slot0 == "return" or slot0 == "ended" then
			if uv0 then
				uv0 = false

				uv1.resolve_count:setVisible(true)
				slot1:setText("")

				if slot1:getText() ~= "" then
					if tonumber(slot2) ~= nil and slot3 > 0 then
						uv1:showEditNum(slot3)
					else
						uv1:showEditNum(0)
						message(TI18N("请输入数字"))
					end
				else
					uv1:showEditNum(0)
				end
			end
		elseif slot0 == "began" then
			if not uv0 then
				uv1.resolve_count:setVisible(false)

				uv0 = true
			end
		elseif slot0 == "changed" then
			-- Nothing
		end
	end)
end

function HeroSacrificePanel.setVisibleStatus(slot0, slot1)
	slot1 = slot1 or false

	slot0:setVisible(slot1)

	if slot1 == false then
		slot0.is_send_proto = nil

		slot0:onClickBtnShowByIndex(0, true)
		doStopAllActions(slot0.disband_container)
	end
end

function HeroSacrificePanel.register_event(slot0)
	registerButtonEventListener(slot0.tip_btn, function (slot0, slot1, slot2)
		TipsManager:getInstance():showCommonTips(Config.PartnerData.data_partner_const.game_rule1.desc, slot1:getTouchBeganPosition())
	end, true, 1)
	registerButtonEventListener(slot0.partner_btn, function ()
		MallController:getInstance():openMallPanel(true, MallConst.MallType.Recovery)
	end, true, 2)
	registerButtonEventListener(slot0.look_btn, handler(slot0, slot0._onClickBtnLook), true, 1)
	registerButtonEventListener(slot0.putin_btn, handler(slot0, slot0._onClickBtnPutIn), true, 1)
	registerButtonEventListener(slot0.cancel_btn, handler(slot0, slot0._onClickBtnCancel), true, 1)
	registerButtonEventListener(slot0.disband_btn, handler(slot0, slot0._onClickBtnDisband), true, 1)
	registerButtonEventListener(slot0.max_btn, handler(slot0, slot0.onClickBtnMax), true, 1)
	registerButtonEventListener(slot0.add_btn, handler(slot0, slot0.onClickBtnAdd), true, 1)

	slot4 = handler(slot0, slot0.onClickBtnRedu)
	slot5 = true

	registerButtonEventListener(slot0.redu_btn, slot4, slot5, 1)

	for slot4, slot5 in pairs(slot0.camp_btn_list) do
		registerButtonEventListener(slot5, function ()
			uv0:onClickBtnShowByIndex(uv1)
		end, true, 2)
	end

	if not slot0.del_hero_event then
		slot0.del_hero_event = GlobalEvent:getInstance():Bind(HeroEvent.Del_Hero_Event, function ()
			uv0.dic_select_partner_vo = {}

			uv0:setLookBtnEffect()

			uv0.select_count = 0

			uv0:updateHeroList(uv0.select_camp, true)

			uv0.is_send_proto = false

			uv0.lab_put_count:setString(uv1(TI18N("已放入英雄:%s/%s"), uv0.select_count, uv0.select_max_count))
		end)
	end

	if not slot0.add_good_event then
		slot0.add_good_event = GlobalEvent:getInstance():Bind(BackpackEvent.ADD_GOODS, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
				return
			end

			slot2 = false

			for slot6, slot7 in pairs(slot1) do
				if slot7.config and slot7.config.sub_type == BackPackConst.item_tab_type.HERO then
					slot2 = true

					break
				end
			end

			if slot2 == true then
				uv0:onClickBtnShowByIndex(uv0.select_camp, true)

				uv0.is_send_proto = false
			end
		end)
	end

	if not slot0.delete_good_event then
		slot0.delete_good_event = GlobalEvent:getInstance():Bind(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
				return
			end

			if slot1 == nil or next(slot1) == nil then
				return
			end

			slot2 = false

			for slot6, slot7 in pairs(slot1) do
				if slot7.config and slot7.config.sub_type == BackPackConst.item_tab_type.HERO then
					slot2 = true

					break
				end
			end

			if slot2 == true then
				uv0:onClickBtnShowByIndex(uv0.select_camp, true)

				uv0.is_send_proto = false
			end
		end)
	end

	if not slot0.modify_good_event then
		slot0.modify_good_event = GlobalEvent:getInstance():Bind(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
				return
			end

			if slot1 == nil or next(slot1) == nil then
				return
			end

			slot2 = false

			for slot6, slot7 in pairs(slot1) do
				if slot7.config and slot7.config.sub_type == BackPackConst.item_tab_type.HERO then
					slot2 = true

					break
				end
			end

			if slot2 == true then
				uv0:onClickBtnShowByIndex(uv0.select_camp, true)

				uv0.is_send_proto = false
			end
		end)
	end
end

function HeroSacrificePanel.onClickBtnMax(slot0)
	if not slot0.select_chip_data then
		return
	end

	slot0.cur_chip_count = slot0.select_chip_data.quantity

	slot0:updateLabelNum(slot0.cur_chip_count)
end

function HeroSacrificePanel.onClickBtnAdd(slot0)
	if not slot0.select_chip_data then
		return
	end

	slot0.cur_chip_count = slot0.cur_chip_count + 1

	if slot0.select_chip_data.quantity < slot0.cur_chip_count then
		slot0.cur_chip_count = slot0.select_chip_data.quantity
	end

	slot0:updateLabelNum(slot0.cur_chip_count)
end

function HeroSacrificePanel.onClickBtnRedu(slot0)
	if not slot0.select_chip_data then
		return
	end

	slot0.cur_chip_count = slot0.cur_chip_count - 1

	if slot0.cur_chip_count < 0 then
		slot0.cur_chip_count = 0
	end

	slot0:updateLabelNum(slot0.cur_chip_count)
end

function HeroSacrificePanel.updateLabelNum(slot0, slot1)
	if not slot0.select_chip_data then
		slot0:setTouchEnable_Redu(true)
		slot0:setTouchEnable_Add(true)
		slot0:setTouchEnable_Max(true)
		slot0.resolve_count:setString(0)
		slot0.edit_content:setVisible(false)

		return
	end

	slot0:setTouchEnable_Max(false)
	slot0.edit_content:setVisible(true)

	if slot1 == 0 then
		slot0:setTouchEnable_Redu(true)
		slot0:setTouchEnable_Add(false)
	elseif slot1 == slot0.select_chip_data.quantity then
		slot0:setTouchEnable_Redu(false)
		slot0:setTouchEnable_Add(true)
	else
		slot0:setTouchEnable_Redu(false)
		slot0:setTouchEnable_Add(false)
	end

	slot0.resolve_count:setString(slot1)
end

function HeroSacrificePanel.showEditNum(slot0, slot1)
	if not slot0.select_chip_data then
		return
	end

	slot0.cur_chip_count = slot1

	if slot0.select_chip_data.quantity < slot0.cur_chip_count then
		slot0.cur_chip_count = slot0.select_chip_data.quantity
	elseif slot0.cur_chip_count < 0 then
		slot0.cur_chip_count = 0
	end

	slot0:updateLabelNum(slot0.cur_chip_count)
end

function HeroSacrificePanel.setTouchEnable_Add(slot0, slot1)
	setChildUnEnabled(slot1, slot0.add_btn)
	slot0.add_btn:setTouchEnabled(not slot1)

	if slot1 then
		slot0.add_btn_label:disableEffect(cc.LabelEffect.OUTLINE)
	else
		slot0.add_btn_label:enableOutline(Config.ColorData.data_color4[264], 2)
	end
end

function HeroSacrificePanel.setTouchEnable_Redu(slot0, slot1)
	setChildUnEnabled(slot1, slot0.redu_btn)
	slot0.redu_btn:setTouchEnabled(not slot1)

	if slot1 then
		slot0.redu_btn_label:disableEffect(cc.LabelEffect.OUTLINE)
	else
		slot0.redu_btn_label:enableOutline(Config.ColorData.data_color4[264], 2)
	end
end

function HeroSacrificePanel.setTouchEnable_Max(slot0, slot1)
	setChildUnEnabled(slot1, slot0.max_btn)
	slot0.max_btn:setTouchEnabled(not slot1)

	if slot1 then
		slot0.max_btn_label:disableEffect(cc.LabelEffect.OUTLINE)
	else
		slot0.max_btn_label:enableOutline(Config.ColorData.data_color4[264], 2)
	end
end

function HeroSacrificePanel._onClickBtnLook(slot0)
	if not slot0.dic_select_partner_vo then
		return {}
	end

	slot1 = {}

	for slot5, slot6 in pairs(slot0.dic_select_partner_vo) do
		uv0(slot1, {
			partner_id = slot6.partner_id
		})
	end

	if #slot1 > 0 then
		uv1:openHeroResetReturnPanel(true, slot1)
	else
		message(TI18N("没有选中英雄"))
	end
end

function HeroSacrificePanel._onClickBtnCancel(slot0)
	for slot5, slot6 in pairs(slot0.dic_select_partner_vo) do
		slot6.is_ui_select = false
		slot1 = 0 + 1
	end

	if slot1 == 0 then
		message(TI18N("没有选中英雄"))

		return
	end

	slot0.dic_select_partner_vo = {}
	slot0.select_count = 0
	slot0.is_show_cancel_label = false

	if not slot0.list_view then
		return
	end

	slot0:setLookBtnEffect()
	slot0.list_view:resetCurrentItems()
	slot0.lab_put_count:setString(uv0(TI18N("已放入英雄:%s/%s"), slot0.select_count, slot0.select_max_count))
end

function HeroSacrificePanel._onClickBtnPutIn(slot0)
	if not slot0.show_list then
		return
	end

	if slot0.select_max_count <= slot0.select_count then
		message(uv0(TI18N("每次最多可献祭%s个英雄"), slot0.select_max_count))

		return
	end

	if slot0:checkAutoPutCount() == 0 then
		message(TI18N("快速放入只能放入1~3星英雄"))

		return
	end

	slot2 = slot0.select_max_count - slot0.select_count

	for slot6, slot7 in ipairs(slot0.show_list) do
		if slot7.star <= 3 and slot7.is_in_form <= 0 and not slot7.is_ui_select then
			if slot7:checkHeroLockTips(true, nil, true) then
				slot7.is_ui_select = false
			else
				slot7.is_ui_select = true
				slot0.dic_select_partner_vo[slot7.partner_id] = slot7
				slot0.select_count = slot0.select_count + 1

				if slot2 - 1 <= 0 then
					break
				end
			end
		end
	end

	if slot0.select_count <= 0 then
		message("暂时没有可放入的英雄")

		return
	end

	if not slot0.list_view then
		return
	end

	slot0:setLookBtnEffect()
	slot0.list_view:resetCurrentItems()
	slot0.lab_put_count:setString(uv0(TI18N("已放入英雄:%s/%s"), slot0.select_count, slot0.select_max_count))
end

function HeroSacrificePanel.checkAutoPutCount(slot0)
	for slot5, slot6 in ipairs(slot0.show_list) do
		if slot6 and slot6.star <= 3 and slot6.is_in_form <= 0 and not slot6.is_ui_select then
			slot1 = 0 + 1
		end
	end

	return slot1
end

function HeroSacrificePanel._onClickBtnDisband(slot0)
	if slot0.is_send_proto then
		return
	end

	slot0:disbandHero()
end

function HeroSacrificePanel.disbandHero(slot0)
	slot1 = {}

	for slot6, slot7 in pairs(slot0.dic_select_partner_vo) do
		uv0(slot1, {
			partner_id = slot7.partner_id
		})

		if not false and slot7.star >= 5 then
			slot2 = true
		end
	end

	if #slot1 > 0 then
		slot0.record_hero_list = slot1

		uv1:openHeroResetOfferPanel(true, slot1, slot2, function ()
			if uv0.reset_effect then
				uv0.is_play_efffect = true

				uv0.reset_effect:setAnimation(0, PlayerAction.action_2, false)
				uv0:playEffect(true)
			end

			uv0.is_send_proto = true

			delayRun(uv0.disband_container, 1.2, function ()
				uv0:senderOffer()
			end)
		end, HeroConst.ResetType.eHeroReset)
	else
		message(TI18N("没有放入英雄"))
	end
end

function HeroSacrificePanel.senderOffer(slot0)
	if not slot0.record_hero_list then
		return
	end

	uv0:sender11076(slot0.record_hero_list)

	slot0.record_hero_list = nil
end

function HeroSacrificePanel.effectCompleteOnce(slot0)
	if slot0.is_play_efffect then
		slot0.is_play_efffect = false

		slot0.reset_effect:setAnimation(0, PlayerAction.action_1, true)
	end
end

function HeroSacrificePanel.onClickBtnShowByIndex(slot0, slot1, slot2)
	if slot0.img_select and slot0.camp_btn_list[slot1] then
		slot3, slot4 = slot0.camp_btn_list[slot1]:getPosition()

		slot0.img_select:setPosition(slot3 - 0.5, slot4 + 1)
	end

	slot0.dic_select_partner_vo = {}
	slot0.select_count = 0

	slot0:updateHeroList(slot1, slot2)
	slot0.lab_put_count:setString(uv0(TI18N("已放入英雄:%s/%s"), slot0.select_count, slot0.select_max_count))
	slot0.cancel_btn:setVisible(false)
end

function HeroSacrificePanel.changeSelectedTab(slot0)
	slot0.reset_container:setVisible(false)
	slot0.disband_container:setVisible(true)
	slot0.item_bg_1:setVisible(false)
	slot0.text_bg:setVisible(true)
	slot0.putin_btn:setVisible(true)
	slot0.cancel_btn:setVisible(false)
	slot0.lab_put_count:setVisible(true)
	slot0.look_btn:setVisible(true)
	slot0.disband_btn_lable:setString(TI18N("献 祭"))
	slot0:onClickBtnShowByIndex(0, true)
end

function HeroSacrificePanel.createRootWnd(slot0)
	slot0.is_send_proto = nil

	slot0:changeSelectedTab()
end

function HeroSacrificePanel.getHeroListByCamp(slot0, slot1)
	slot3 = {}
	slot4 = {}

	for slot8, slot9 in pairs(uv0:getHeroList()) do
		if not slot9:isResonateHero() and (slot1 == 0 or slot1 == slot9.camp_type) then
			if slot9:isLock() or slot9.isInForm and slot9:isInForm() then
				uv1(slot4, slot9)
			else
				uv1(slot3, slot9)
			end

			slot9.is_ui_select = nil
		end
	end

	slot5 = SortTools.tableLowerSorter({
		"star",
		"lev",
		"camp_type",
		"bid",
		"sort_order"
	})

	uv2(slot4, slot5)

	slot9 = slot5

	uv2(slot3, slot9)

	for slot9, slot10 in ipairs(slot4) do
		uv1(slot3, slot10)
	end

	return slot3
end

function HeroSacrificePanel.updateHeroList(slot0, slot1, slot2)
	if not slot2 and (slot1 or 0) == slot0.select_camp then
		return
	end

	if not slot0.list_view then
		slot0.hero_setting = {
			start_y = 4,
			start_x = 0,
			delay = 1,
			space_x = 0,
			item_width = 128,
			item_height = 122,
			space_y = 0,
			col = 5,
			need_dynamic = true
		}
		slot6, slot7 = slot0.disband_container:getChildByName("img_box_0"):getPosition()
		slot0.list_view = CommonScrollViewSingleLayout.new(slot0.disband_container, cc.p(slot6, slot7), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(640, 330), slot0.hero_setting, cc.p(0.5, 0.5))

		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.onCellTouched), ScrollViewFuncType.OnCellTouched)
	end

	slot0.select_camp = slot3
	slot0.show_list = slot0:getHeroListByCamp(slot3)

	slot0.lab_have_count:setString(uv0(TI18N("可献祭英雄:%s"), #slot0.show_list))
	slot0.list_view:reloadData(nil, {
		item_height = 122
	})

	if #slot0.show_list == 0 then
		slot0:showEmptyIcon(true)
	else
		slot0:showEmptyIcon(false)
	end
end

function HeroSacrificePanel.showEmptyIcon(slot0, slot1)
	if not slot0.empty_con and slot1 == false then
		return
	end

	if not slot0.empty_con then
		slot3, slot4 = slot0.disband_container:getChildByName("img_box_0"):getPosition()
		slot5 = cc.size(200, 200)
		slot0.empty_con = ccui.Widget:create()

		slot0.empty_con:setContentSize(slot5)
		slot0.empty_con:setAnchorPoint(cc.p(0.5, 0.5))
		slot0.empty_con:setPosition(slot3, slot4)
		slot0.disband_container:addChild(slot0.empty_con, 10)

		slot7 = createImage(slot0.empty_con, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_3"), slot5.width / 2, slot5.height / 2, cc.p(0.5, 0.5), false)
		slot8 = LoginController:getInstance():getModel():getLoginData()
		slot0.empty_label = createLabel(26, Config.ColorData.data_color4[175], nil, slot5.width / 2, -10, "", slot0.empty_con, 0, cc.p(0.5, 0))
	end

	slot0.empty_label:setString(TI18N("暂无该类型英雄"))
	slot0.empty_con:setVisible(slot1)
end

function HeroSacrificePanel.createNewCell(slot0, slot1, slot2)
	slot3 = 122
	slot4 = ccui.Widget:create()
	slot5 = HeroExhibitionItem.new(0.9, true)

	slot5:setPosition(slot1 * 0.5, slot3 * 0.5)
	slot4:addChild(slot5)
	slot4:setCascadeOpacityEnabled(true)
	slot4:setAnchorPoint(0, 0)
	slot4:setContentSize(cc.size(slot1, slot3))

	slot4.hero_item = slot5

	slot4.hero_item:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot4
end

function HeroSacrificePanel.numberOfCells(slot0)
	return #slot0.show_list
end

function HeroSacrificePanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if slot0.show_list[slot2] then
		slot1.hero_item:setData(slot3)
		slot1.hero_item:setSelected(slot3.is_ui_select == true)

		if slot3.isLock and slot3:isLock() or slot3.isInForm and slot3:isInForm() then
			slot1.hero_item:showLockIcon(true)
		else
			slot1.hero_item:showLockIcon(false)
		end

		slot1.hero_item:setPositionY(slot0.hero_setting.item_height * 0.5)
		slot1.hero_item:showProgressbarStatus(false)
		slot1.hero_item:showChipIcon(false)
	end
end

function HeroSacrificePanel.onCellTouched(slot0, slot1)
	if slot0.is_send_proto then
		return
	end

	if slot0.show_list[slot1.index] then
		slot0:selectHero(slot1, slot3)
	end
end

function HeroSacrificePanel.selectHero(slot0, slot1, slot2)
	if not slot2 then
		return
	end

	if not slot1 then
		return
	end

	if slot2:checkHeroLockTips(true) then
		return
	end

	if slot0.dic_select_partner_vo[slot2.partner_id] == nil then
		if slot0.select_max_count <= slot0.select_count then
			message(uv0(TI18N("每次最多可献祭%s个英雄"), slot0.select_max_count))

			return
		end

		slot2.is_ui_select = true
		slot0.dic_select_partner_vo[slot2.partner_id] = slot2
		slot0.select_count = slot0.select_count + 1
	else
		slot2.is_ui_select = false
		slot0.dic_select_partner_vo[slot2.partner_id] = nil
		slot0.select_count = slot0.select_count - 1
	end

	slot1.hero_item:setSelected(slot2.is_ui_select)
	slot0.lab_put_count:setString(uv0(TI18N("已放入英雄:%s/%s"), slot0.select_count, slot0.select_max_count))
	slot0:setLookBtnEffect()
end

function HeroSacrificePanel.setLookBtnEffect(slot0)
	if next(slot0.dic_select_partner_vo) ~= nil then
		if not slot0.is_show_effect then
			slot0.is_show_effect = true

			doStopAllActions(slot0.look_btn)
			slot0.look_btn:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.ScaleTo:create(0.8, 1.1), cc.ScaleTo:create(0.8, 1))))
		end

		slot0.cancel_btn:setVisible(true)
	else
		slot0.is_show_effect = false

		doStopAllActions(slot0.look_btn)
		slot0.look_btn:runAction(cc.ScaleTo:create(0.5, 1))
		slot0.cancel_btn:setVisible(false)
	end
end

function HeroSacrificePanel.playEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect2 then
			slot0.play_effect2:clearTracks()
			slot0.play_effect2:removeFromParent()

			slot0.play_effect2 = nil
		end
	else
		AudioManager:getInstance():playEffect(AudioManager.AUDIO_TYPE.COMMON, "c_xianji")

		if slot0.play_effect2 == nil then
			slot0.play_effect2 = createEffectSpine("E24122", cc.p(580, 501), cc.p(0.5, 0.5), false, PlayerAction.action)

			slot0.spine_node:addChild(slot0.play_effect2, 1)
		else
			slot0.play_effect2:setAnimation(0, PlayerAction.action, false)
		end
	end
end

function HeroSacrificePanel.DeleteMe(slot0)
	if slot0.list_view then
		slot0.list_view:DeleteMe()

		slot0.list_view = nil
	end

	if slot0.reset_effect then
		slot0.reset_effect:clearTracks()
		slot0.reset_effect:removeFromParent()

		slot0.reset_effect = nil
	end

	if slot0.resources_load ~= nil then
		slot0.resources_load:DeleteMe()

		slot0.resources_load = nil
	end

	if slot0.modify_good_event then
		GlobalEvent:getInstance():UnBind(slot0.modify_good_event)

		slot0.modify_good_event = nil
	end

	if slot0.add_good_event then
		GlobalEvent:getInstance():UnBind(slot0.add_good_event)

		slot0.add_good_event = nil
	end

	if slot0.del_hero_event then
		GlobalEvent:getInstance():UnBind(slot0.del_hero_event)

		slot0.del_hero_event = nil
	end

	if slot0.delete_good_event then
		GlobalEvent:getInstance():UnBind(slot0.delete_good_event)

		slot0.delete_good_event = nil
	end

	for slot5, slot6 in pairs(uv0:getHeroList()) do
		slot6.is_ui_select = nil
	end

	slot0:playEffect(false)
	doStopAllActions(slot0.look_btn)
	doStopAllActions(slot0.disband_container)
	uv1:openHeroResetWindow(false)
end
