HallowsMainWindow = HallowsMainWindow or BaseClass(BaseView)
slot0 = HallowsController:getInstance()
slot1 = HallowsController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.sort
slot5 = table.remove
slot6 = BackpackController:getInstance():getModel()
slot7 = Config.HallowsData.data_info
slot8 = Config.HallowsData.data_skill_up

function HallowsMainWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Full
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("hallows", "hallows"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_68", true),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "pattern/pattern_1"),
			type = ResourcesType.single
		}
	}
	slot0.layout_name = "hallows/hallows_main_window"
	slot0.skill_attr_list = {}
	slot0.is_in_advance = false
	slot0.hallows_list = {}
	slot0.hallows_sum = 0
	slot0.tab_list = {}
	slot0.attr_bgs = {}
	slot0.base_attr_list = {}
	slot0.is_max_hallows_lv = false
	slot0.is_max_skill_lv = false
	slot0.is_max_refine_lv = false
	slot0.cur_index = HallowsConst.Tab_Index.uplv
	slot0.hallows_uplv_cost_bid_1 = 0
	slot0.hallows_uplv_cost_num_1 = 0
	slot0.hallows_uplv_cost_bid_2 = 0
	slot0.hallows_uplv_cost_num_2 = 0
	slot0.skill_lvup_cost_bid_1 = 0
	slot0.skill_lvup_cost_num_1 = 0
	slot0.skill_lvup_cost_bid_2 = 0
	slot0.skill_lvup_cost_num_2 = 0
	slot0.refine_cost_bid_1 = 0
	slot0.refine_cost_num_1 = 0
	slot0.refine_cost_bid_2 = 0
	slot0.refine_cost_num_2 = 0
	slot0.is_can_refine_1 = true
	slot0.is_can_refine_2 = true
	slot0.is_can_refine_3 = true
	slot0.advance_const_config = Config.HallowsData.data_const.id_advanced_props
	slot0.auto_const_config = Config.HallowsData.data_const.price_advanced_props
	slot0.role_vo = RoleController:getInstance():getRoleVo()
end

function HallowsMainWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())
	slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_68", true), LOADTEXT_TYPE)

	slot1 = slot0.root_wnd:getChildByName("main_panel")

	slot0:playEnterAnimatianByObj(slot1, 1)

	slot2 = slot1:getChildByName("title_bg")
	slot0.skill_bg = slot1:getChildByName("skill_bg")

	slot0.skill_bg:getChildByName("skill_title"):setString(TI18N("技能加成"))

	slot0.bottom_bg = slot1:getChildByName("bottom_bg")

	if slot0.bottom_bg and PathTool.getPlistImgForDownLoad("bigbg", "pattern/pattern_1") ~= nil then
		createSprite(slot4, slot0.bottom_bg:getContentSize().width / 2, 15, slot0.bottom_bg, cc.p(0.5, 0.5), LOADTEXT_TYPE):setScaleX(2)

		slot6 = createSprite(slot4, slot0.bottom_bg:getContentSize().width / 2, slot0.bottom_bg:getContentSize().height - 20, slot0.bottom_bg, cc.p(0.5, 0.5), LOADTEXT_TYPE)

		slot6:setScaleX(2)
		slot6:setRotation(180)
	end

	slot0.trace_btn = slot1:getChildByName("trace_btn")

	slot0.trace_btn:getChildByName("label"):setString(TI18N("霸气附着"))

	slot0.trace_btn_tips = slot0.trace_btn:getChildByName("tips")

	slot0.trace_btn_tips:setVisible(false)

	slot0.reset_btn = slot1:getChildByName("reset_btn")

	slot0.reset_btn:getChildByName("label"):setString(TI18N("洗练"))
	slot0.reset_btn:setVisible(false)

	slot0.magic_btn = slot1:getChildByName("magic_btn")

	slot0.magic_btn:getChildByName("label"):setString(TI18N("转化"))

	slot0.magic_btn_tips = slot0.magic_btn:getChildByName("tips")

	slot0.magic_btn_tips:setVisible(false)

	slot0.artifact_btn = slot1:getChildByName("artifact_btn")

	slot0.artifact_btn:getChildByName("label"):setString(TI18N("终结技"))

	slot0.touch_layout = slot1:getChildByName("touch_layout")

	if Config.HallowsData.data_const.illusion_open and slot6.val <= RoleController:getInstance():getRoleVo().lev then
		slot0.magic_btn:setVisible(true)
		slot0.reset_btn:setPositionX(504)
	else
		slot0.magic_btn:setVisible(false)
		slot0.reset_btn:setPositionX(585)
	end

	slot0.left_btn = slot1:getChildByName("left_btn")
	slot0.right_btn = slot1:getChildByName("right_btn")
	slot0.explain_btn = slot1:getChildByName("explain_btn")
	slot0.hallows_name = slot2:getChildByName("hallows_name")
	slot0.step_container = slot1:getChildByName("step_container")
	slot10 = TI18N

	slot0.step_container:getChildByName("title_attr"):setString(slot10("全队基础属性"))

	for slot10 = 1, 2 do
		slot0.attr_bgs[slot10] = slot0.step_container:getChildByName("attr_bg_" .. slot10)
	end

	slot0.uplv_layout = slot0.step_container:getChildByName("uplv_layout")
	slot0.step_progress = slot0.uplv_layout:getChildByName("progress")

	slot0.step_progress:setScale9Enabled(true)

	slot0.step_progress_value = slot0.uplv_layout:getChildByName("progress_value")
	slot0.step_advanced_btn = slot0.uplv_layout:getChildByName("advanced_btn")
	slot0.step_auto_advanced_btn = slot0.uplv_layout:getChildByName("auto_advanced_btn")

	slot0.step_advanced_btn:getChildByName("label"):setString(TI18N("升级"))

	slot0.step_auto_advanced_btn_label = slot0.step_auto_advanced_btn:getChildByName("label")

	slot0.step_auto_advanced_btn_label:setString(TI18N("一键升级"))

	slot0.step_advanced_btn_tips = slot0.step_advanced_btn:getChildByName("tips")

	slot0.step_advanced_btn_tips:setVisible(false)

	slot7 = slot0.uplv_layout:getChildByName("lvup_cost_bg")
	slot0.lvup_cost_res_1 = slot7:getChildByName("res_icon")
	slot0.lvup_cost_label_1 = slot7:getChildByName("lvup_cost_label")
	slot8 = slot0.uplv_layout:getChildByName("auto_lvup_cost_bg")
	slot0.lvup_cost_res_2 = slot8:getChildByName("res_icon")
	slot0.lvup_cost_label_2 = slot8:getChildByName("auto_lvup_cost_label")
	slot0.skill_container = slot1:getChildByName("skill_container")
	slot0.skill_layout = slot0.skill_container:getChildByName("skill_layout")
	slot0.skill_lvup_btn = slot0.skill_layout:getChildByName("skill_lvup_btn")
	slot0.skill_lvup_btn_label = slot0.skill_lvup_btn:getChildByName("label")

	slot0.skill_lvup_btn_label:setString(TI18N("升级"))

	slot0.skill_cost_bg_1 = slot0.skill_layout:getChildByName("skill_cost_bg_1")
	slot0.skill_res_icon_1 = slot0.skill_cost_bg_1:getChildByName("skill_res_icon_1")
	slot0.skill_cost_label_1 = slot0.skill_cost_bg_1:getChildByName("skill_cost_label_1")
	slot0.skill_cost_bg_2 = slot0.skill_layout:getChildByName("skill_cost_bg_2")
	slot0.skill_res_icon_2 = slot0.skill_cost_bg_2:getChildByName("skill_res_icon_2")
	slot0.skill_cost_label_2 = slot0.skill_cost_bg_2:getChildByName("skill_cost_label_2")
	slot0.skill_lvup_tips = slot0.skill_layout:getChildByName("skill_lvup_tips")
	slot0.refine_container = slot1:getChildByName("refine_container")
	slot0.refine_layout = slot0.refine_container:getChildByName("refine_layout")
	slot0.refine_btn = slot0.refine_layout:getChildByName("refine_btn")
	slot0.refine_btn_tips = slot0.refine_btn:getChildByName("tips")
	slot0.refine_btn_label = slot0.refine_btn:getChildByName("label")

	slot0.refine_btn_label:setString(TI18N("贯通"))

	slot0.refine_tips = slot0.refine_layout:getChildByName("refine_tips")
	slot0.refine_lv_txt_1 = slot0.refine_layout:getChildByName("refine_lv_txt_1")
	slot0.refine_lv_txt_2 = slot0.refine_layout:getChildByName("refine_lv_txt_2")
	slot0.atk_txt_1 = slot0.refine_layout:getChildByName("atk_txt_1")
	slot0.total_atk_txt_1 = slot0.refine_layout:getChildByName("total_atk_txt_1")
	slot0.atk_txt_2 = slot0.refine_layout:getChildByName("atk_txt_2")
	slot0.total_atk_txt_2 = slot0.refine_layout:getChildByName("total_atk_txt_2")

	slot0.refine_layout:getChildByName("atk_title_1"):setString(TI18N("技能伤害增加:"))
	slot0.refine_layout:getChildByName("atk_title_2"):setString(TI18N("总伤害:"))
	slot0.refine_layout:getChildByName("atk_title_3"):setString(TI18N("技能伤害增加:"))
	slot0.refine_layout:getChildByName("atk_title_4"):setString(TI18N("总伤害:"))

	slot0.refine_cost_bg_1 = slot0.refine_layout:getChildByName("refine_cost_bg_1")
	slot0.refine_res_icon_1 = slot0.refine_cost_bg_1:getChildByName("refine_res_icon_1")
	slot0.refine_cost_label_1 = slot0.refine_cost_bg_1:getChildByName("refine_cost_label_1")
	slot0.refine_cost_bg_2 = slot0.refine_layout:getChildByName("refine_cost_bg_2")
	slot0.refine_res_icon_2 = slot0.refine_cost_bg_2:getChildByName("refine_res_icon_2")
	slot0.refine_cost_label_2 = slot0.refine_cost_bg_2:getChildByName("refine_cost_label_2")
	slot0.refine_max = slot0.refine_container:getChildByName("refine_max")
	slot0.refine_max_lv = slot0.refine_max:getChildByName("refine_max_lv")
	slot0.atk_max_txt = slot0.refine_max:getChildByName("atk_max_txt")
	slot0.total_atk_txt = slot0.refine_max:getChildByName("total_atk_txt")

	slot0.refine_max:getChildByName("atk_max_title_1"):setString(TI18N("技能伤害增加:"))
	slot0.refine_max:getChildByName("atk_max_title_2"):setString(TI18N("总伤害:"))

	slot0.maxlv_layout = slot1:getChildByName("maxlv_layout")
	slot0.max_lv_tips = slot0.maxlv_layout:getChildByName("max_lv_tips")

	for slot13 = 1, 3 do
		slot14 = {}

		if slot1:getChildByName("tab_container"):getChildByName("tab_btn_" .. slot13) then
			if slot13 == 1 then
				slot15:getChildByName("title"):setString(TI18N("升级"))
			elseif slot13 == 2 then
				slot16:setString(TI18N("技能"))
			elseif slot13 == 3 then
				slot16:setString(TI18N("贯通"))
			end

			slot14.tab_btn = slot15
			slot14.select_bg = slot15:getChildByName("select_img")

			slot14.select_bg:setVisible(false)

			slot14.label = slot16
			slot14.index = slot13
			slot14.tips = slot15:getChildByName("tips")
			slot0.tab_list[slot13] = slot14
		end
	end

	slot0:updateTabBtnStatus()

	slot0.main_panel = slot1
	slot10 = display.getTop(slot1)

	slot2:setPositionY(slot10 - 113)
	slot0.explain_btn:setPositionY(slot10 - 113)
end

function HallowsMainWindow.updateTabBtnStatus(slot0)
	for slot4, slot5 in pairs(slot0.tab_list) do
		slot6 = true

		if slot4 == 3 and RoleController:getInstance():getRoleVo().lev < Config.HallowsRefineData.data_const.open_lev.val then
			slot6 = false
		end

		slot5.tab_btn:setVisible(slot6)
	end
end

function HallowsMainWindow.checkShowRefineLv(slot0)
	if not slot0.refine_is_open and uv0:getHallowsRefineIsOpen() and slot0.select_hallows and slot0.select_hallows.vo then
		slot1 = slot0.select_hallows.vo
		slot0.refine_is_open = true

		slot0.hallows_name:setString(uv1(TI18N("%s+%d【贯通+%d级】"), slot0.select_hallows.name, slot1.step, slot1.refine_lev))

		if uv2(getNorKey(slot0.select_hallows.id, slot1.skill_lev)) and slot2.skill_bid ~= 0 and Config.SkillData.data_get_skill(slot2.skill_bid) then
			slot0.hallows_skill_name:setString(uv1(TI18N("%s+%d【贯通+%d级】"), slot3.name, slot1.skill_lev, slot1.refine_lev))
		end
	end
end

function HallowsMainWindow.register_event(slot0)
	slot0.step_advanced_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:changeAutoAdvanceStatus(false)

			if uv0.select_hallows then
				uv1:requestHallowsAdvance(uv0.select_hallows.id, false)
			end
		end
	end)
	slot0.step_auto_advanced_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if not uv0.is_in_advance == true and uv0.select_hallows then
				uv1:requestHallowsAdvance(uv0.select_hallows.id, false)
			end

			uv0:changeAutoAdvanceStatus(slot2)
		end
	end)
	slot0.left_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended and not uv0.in_refine_effect then
			playButtonSound2()

			if uv0.hallows_list and next(uv0.hallows_list) ~= nil then
				uv0:selectHallowsIndex((uv0.select_index > 1 or uv0.hallows_sum) and slot2 - 1)
			end
		end
	end)
	slot0.right_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended and not uv0.in_refine_effect then
			playButtonSound2()

			if uv0.hallows_list and next(uv0.hallows_list) ~= nil then
				uv0:selectHallowsIndex(uv0.hallows_sum <= uv0.select_index and 1 or slot2 + 1)
			end
		end
	end)
	registerButtonEventListener(slot0.explain_btn, function (slot0, slot1, slot2)
		TipsManager:getInstance():showCommonTips(Config.HallowsData.data_const.game_rule.desc, slot1:getTouchBeganPosition(), nil, nil, 500)
	end, true, 1)
	registerButtonEventListener(slot0.refine_btn, function ()
		if uv0.select_hallows and not uv0.in_refine_effect then
			if uv0.is_can_refine_1 and uv0.is_can_refine_2 and uv0.is_can_refine_3 then
				uv0:handleRefineEffect(true)
			else
				uv1:send24135(uv0.select_hallows.id)
			end
		end
	end, true)
	slot0.trace_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.select_hallows then
				if uv0.select_hallows.vo == nil then
					message(TI18N("该圣器暂未激活"))
				elseif Config.HallowsData.data_const.imprint_lowest then
					if uv0.select_hallows.vo.step < slot2.val then
						message(slot2.desc)
					else
						uv1:openHallowsTraceWindow(true, uv0.select_hallows)
					end
				end
			end
		end
	end)
	registerButtonEventListener(slot0.magic_btn, handler(slot0, slot0._onClickMagicBtn), true)
	registerButtonEventListener(slot0.reset_btn, handler(slot0, slot0._onClickResetBtn), true)
	registerButtonEventListener(slot0.skill_lvup_btn, handler(slot0, slot0._onClickSkillLvupBtn), true)

	slot5 = true

	registerButtonEventListener(slot0.artifact_btn, handler(slot0, slot0._onClickBtnArtifact), slot5)

	slot4 = handler

	registerButtonEventListener(slot0.touch_layout, slot4(slot0, slot0._onClickTouchLayout))

	for slot4, slot5 in pairs(slot0.tab_list) do
		if slot5.tab_btn then
			slot5.tab_btn:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended and not uv0.is_in_advance and not uv0.in_refine_effect then
					playTabButtonSound()
					uv0:changeSelectedTab(uv1.index)
				end
			end)
		end
	end

	slot0:addGlobalEvent(HallowsEvent.HallowsUpdateEvent, function (slot0, slot1)
		uv0:handleUpdateEvent(slot0, slot1)
	end)
	slot0:addGlobalEvent(HallowsEvent.HallowsAdvanceEvent, function (slot0, slot1)
		if uv0.select_hallows and uv0.select_hallows.id ~= slot0 then
			uv0:changeAutoAdvanceStatus(false)
		elseif slot1 == 0 or slot1 == 1 then
			uv0:changeAutoAdvanceStatus(false)
		end
	end)
	slot0:addGlobalEvent(HallowsEvent.UndateHallowsInfoEvent, function (slot0)
		if uv0.select_hallows and uv0.select_hallows.id ~= slot0 then
			uv0:selectHallowsIndex(uv0:getHallowsIndexById(slot0))
		end
	end)
	slot0:addGlobalEvent(HallowsEvent.HallowsRedStatus, function (slot0, slot1)
		if uv0.select_hallows then
			uv0:updateTabRedStatus()
		end
	end)
	slot0:addGlobalEvent(HallowsEvent.HallowsMagicActivityEvent, function ()
		if uv0.select_hallows then
			uv0:updateHallowsBaseInfo()
		end
	end)
	slot0:addGlobalEvent(BackpackEvent.ADD_GOODS, function (slot0, slot1)
		if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
			return
		end

		uv0:checkNeedUpdateItemNum(slot1)
	end)
	slot0:addGlobalEvent(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
		if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
			return
		end

		uv0:checkNeedUpdateItemNum(slot1)
	end)
	slot0:addGlobalEvent(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
		if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
			return
		end

		uv0:checkNeedUpdateItemNum(slot1)
	end)

	if not slot0.role_lev_event and slot0.role_vo then
		slot0.role_lev_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "coin" then
				uv0:updateCostItemNumByBid(1)
			elseif slot0 == "hallow_refine" then
				uv0:updateCostItemNumByBid(32)
			elseif slot0 == "lev" then
				uv0:updateTabBtnStatus()
				uv0:checkShowRefineLv()
			end
		end)
	end
end

function HallowsMainWindow._onClickResetBtn(slot0)
	if slot0.is_in_advance or slot0.in_refine_effect then
		return
	end

	CommonAlert.show(TI18N("洗练后神技将回到初始状态，同时返还除贝里外所有资源，是否洗练？"), TI18N("确定"), function ()
		if uv0.select_hallows then
			uv1:requestHallowsReset(uv0.select_hallows.id)
		end
	end, TI18N("取消"), nil, nil, nil, {
		timer = 5
	})
end

function HallowsMainWindow._onClickMagicBtn(slot0, slot1)
	if slot0.select_hallows then
		uv0:openHallowsMagicWindow(true, slot0.select_hallows, slot1)
	end
end

function HallowsMainWindow._onClickSkillLvupBtn(slot0)
	if slot0.select_hallows == nil then
		return
	end

	if slot0.select_hallows.vo then
		uv0:requestHallowsSkillUpgrade(slot1.id)
	end
end

function HallowsMainWindow._onClickBtnArtifact(slot0)
	uv0:openHallowsPreviewWindow(true)
end

function HallowsMainWindow._onClickTouchLayout(slot0)
	if slot0.select_hallows == nil then
		return
	end

	if slot0.select_hallows.vo then
		uv1:getInstance():openHallowsTips(true, uv0:makeHighestHallowVo(slot1.id))
	end
end

function HallowsMainWindow.changeSelectedTab(slot0, slot1)
	if slot0.tab_object ~= nil and slot0.tab_object.index == slot1 then
		return
	end

	if slot0.tab_object then
		slot0.tab_object.select_bg:setVisible(false)
		slot0.tab_object.label:setTextColor(cc.c3b(255, 255, 255))
		slot0.tab_object.label:enableOutline(cc.c4b(2, 0, 25, 255), 2)
		slot0.tab_object.label:setFontSize(24)

		slot0.tab_object = nil
	end

	slot0.tab_object = slot0.tab_list[slot1]

	if slot0.tab_object then
		slot0.tab_object.select_bg:setVisible(true)
		slot0.tab_object.label:setTextColor(cc.c3b(71, 44, 30))
		slot0.tab_object.label:disableEffect(cc.LabelEffect.OUTLINE)
		slot0.tab_object.label:setFontSize(26)
	end

	slot0.cur_index = slot1

	slot0.step_container:setVisible(slot1 == HallowsConst.Tab_Index.uplv)
	slot0.skill_container:setVisible(slot1 == HallowsConst.Tab_Index.skill)
	slot0.refine_container:setVisible(slot1 == HallowsConst.Tab_Index.refine)
	slot0:updateMaxLvTips()
end

function HallowsMainWindow.openRootWnd(slot0, slot1, slot2, slot3)
	slot0.hallows_list = {}
	slot0.hallows_sum = Config.HallowsData.data_base_length

	for slot8, slot9 in pairs(Config.HallowsData.data_base) do
		uv1(slot0.hallows_list, {
			id = slot9.id,
			name = slot9.name,
			effect = slot9.effect,
			item_id = slot9.item_id,
			open_desc = slot9.open_desc,
			vo = uv0:getHallowsById(slot9.id)
		})
	end

	if next(slot0.hallows_list) then
		uv2(slot0.hallows_list, function (slot0, slot1)
			return slot0.id < slot1.id
		end)
	end

	slot0:selectHallowsIndex(slot0:getDefaultHallowsIndex(slot1))
	slot0:changeSelectedTab(slot2 or HallowsConst.Tab_Index.uplv)

	if slot3 and slot0.select_hallows then
		delayRun(slot0.main_panel, 0.2, function ()
			uv0:openHallowsMagicWindow(true, uv1.select_hallows, uv2)
		end)
	end
end

function HallowsMainWindow.getDefaultHallowsIndex(slot0, slot1)
	slot2 = deepCopy(slot0.hallows_list)
	slot3 = 1

	if slot1 and slot1 ~= 0 then
		slot3 = slot0:getHallowsIndexById(slot1)
	else
		slot4 = {}

		uv0(slot2, function (slot0, slot1)
			return slot1.vo.step < slot0.vo.step
		end)

		for slot9, slot10 in ipairs(slot2) do
			if 0 <= slot10.vo.step then
				slot5 = slot10.vo.step

				uv1(slot4, slot10)
			end
		end

		if #slot4 == 1 then
			slot3 = slot0:getHallowsIndexById(slot4[1].id)
		else
			function slot10(slot0, slot1)
				return slot0.vo.lucky < slot1.vo.lucky
			end

			uv0(slot4, slot10)

			for slot10 = #slot4, 1, -1 do
				if 0 <= slot4[slot10].vo.lucky then
					slot6 = slot11.vo.lucky
				else
					uv2(slot4, slot10)
				end
			end

			if #slot4 == 1 then
				slot3 = slot0:getHallowsIndexById(slot4[1].id)
			else
				uv0(slot4, function (slot0, slot1)
					return slot1.id < slot0.id
				end)

				slot3 = slot0:getHallowsIndexById(slot4[1].id)
			end
		end
	end

	return slot3
end

function HallowsMainWindow.getHallowsIndexById(slot0, slot1)
	slot2 = 1

	for slot6, slot7 in pairs(slot0.hallows_list) do
		if slot7.id and slot7.id == slot1 then
			slot2 = slot6
		end
	end

	return slot2
end

function HallowsMainWindow.selectHallowsIndex(slot0, slot1, slot2, slot3)
	if slot0.select_index == slot1 and not slot2 then
		return
	end

	if not slot2 then
		slot0:changeAutoAdvanceStatus(false)
	elseif not slot3 then
		slot0:handleEffect(true)
	end

	slot0.select_index = slot1
	slot0.select_hallows = slot0.hallows_list[slot1]

	if slot0.select_hallows == nil then
		return
	end

	slot0.reset_btn:setVisible(slot0:checkIsShowResetBtn())

	slot0.is_max_hallows_lv = false
	slot0.is_max_skill_lv = false
	slot0.is_max_refine_lv = false
	slot0.is_can_refine_1 = true
	slot0.is_can_refine_2 = true
	slot0.is_can_refine_3 = true
	slot0.hallows_uplv_cost_bid_1 = 0
	slot0.hallows_uplv_cost_num_1 = 0
	slot0.hallows_uplv_cost_bid_2 = 0
	slot0.hallows_uplv_cost_num_2 = 0
	slot0.skill_lvup_cost_bid_1 = 0
	slot0.skill_lvup_cost_num_1 = 0
	slot0.skill_lvup_cost_bid_2 = 0
	slot0.skill_lvup_cost_num_2 = 0
	slot0.refine_cost_bid_1 = 0
	slot0.refine_cost_num_1 = 0
	slot0.refine_cost_bid_2 = 0
	slot0.refine_cost_num_2 = 0

	slot0:updateHallowsBaseInfo()
	slot0:updateSkillList()
	slot0:updateHallowStatusInfo()
	slot0:updateTabRedStatus()
end

function HallowsMainWindow.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	elseif not tolua.isnull(slot0.hallows_model) and slot0.play_effect == nil then
		slot0.play_effect = createEffectSpine(Config.EffectData.data_effect_info[185], cc.p(20, 50), cc.p(0.5, 0.5), false, PlayerAction.action)

		slot0.hallows_model:addChild(slot0.play_effect)
	elseif slot0.play_effect then
		slot0.play_effect:setAnimation(0, PlayerAction.action, false)
	end
end

function HallowsMainWindow.handleRefineEffect(slot0, slot1)
	if slot1 == false then
		if slot0.refine_effect then
			slot0.refine_effect:clearTracks()
			slot0.refine_effect:removeFromParent()

			slot0.refine_effect = nil
		end
	else
		slot0.in_refine_effect = true

		if not tolua.isnull(slot0.main_panel) and slot0.refine_effect == nil then
			slot0.refine_effect = createEffectSpine(Config.EffectData.data_effect_info[545], cc.p(360, 915), cc.p(0.5, 0.5), false, PlayerAction.action, handler(slot0, slot0._onRefineEffectEnd))

			slot0.refine_effect:registerSpineEventHandler(handler(slot0, slot0._onRefineEffectCallBack), sp.EventType.ANIMATION_EVENT)
			slot0.main_panel:addChild(slot0.refine_effect, 99)
		elseif slot0.refine_effect then
			slot0.refine_effect:setToSetupPose()
			slot0.refine_effect:setAnimation(0, PlayerAction.action, false)
		end
	end
end

function HallowsMainWindow._onRefineEffectCallBack(slot0, slot1)
	if slot1.eventData.name == "appear" and slot0.select_hallows then
		uv0:send24135(slot0.select_hallows.id)
	end
end

function HallowsMainWindow._onRefineEffectEnd(slot0)
	slot0.in_refine_effect = false
end

function HallowsMainWindow.updateHallowsBaseInfo(slot0)
	if slot0.select_hallows == nil then
		return
	end

	slot1 = PlayerAction.action_1
	slot2 = slot0.select_hallows.effect

	if slot0.select_hallows.vo ~= nil then
		if slot0.select_hallows.vo.look_id ~= 0 then
			slot2 = uv0:getHallowsEffectByMagicId(slot0.select_hallows.vo.look_id)
			slot1 = PlayerAction.action_2
		else
			slot2 = slot0.select_hallows.effect
			slot1 = PlayerAction.action_2
		end
	end

	if slot0.hallows_model_id ~= slot2 then
		slot0.hallows_model_id = slot2

		slot0:handleEffect(false)

		if slot0.hallows_model then
			slot0.hallows_model:clearTracks()
			slot0.hallows_model:removeFromParent()

			slot0.hallows_model = nil
		end

		slot0.cur_hallows_action = slot1
		slot3 = 0.5703125 * display.height
		slot0.hallows_model = createEffectSpine(slot0.hallows_model_id, cc.p(360, 730), cc.p(0, 0), true, slot1)

		slot0.hallows_model:setScale(slot0.hallows_model:getScale() * 1)
		slot0.hallows_model:setLocalZOrder(-1)
		slot0.main_panel:addChild(slot0.hallows_model)
	end

	if not slot0.cur_hallows_action or slot0.cur_hallows_action ~= slot1 then
		slot0.cur_hallows_action = slot1

		slot0.hallows_model:setAnimation(0, slot1, true)
	end

	if slot0.select_hallows.vo == nil then
		return
	end

	if uv0:getHallowsRefineIsOpen() then
		slot0.refine_is_open = true

		slot0.hallows_name:setString(uv1(TI18N("%s+%d【贯通+%d级】"), slot0.select_hallows.name, slot3.step, slot3.refine_lev))
	else
		slot0.refine_is_open = false

		slot0.hallows_name:setString(slot0.select_hallows.name .. "+" .. slot3.step)
	end

	slot4 = uv2(getNorKey(slot3.id, slot3.step))
	slot5 = uv2(getNorKey(slot3.id, slot3.step + 1)) or {}

	for slot9, slot10 in pairs(slot0.base_attr_list) do
		slot10:setVisible(false)
	end

	for slot9, slot10 in ipairs(slot4.attr) do
		if slot9 > 2 then
			break
		end

		slot11 = slot10[1]
		slot12 = slot10[2] or 0
		slot13 = 0

		if slot5.attr then
			for slot17, slot18 in pairs(slot5.attr) do
				if slot18[1] and slot18[1] == slot11 then
					slot13 = slot18[2] or 0
				end
			end
		end

		if Config.AttrData.data_key_to_name[slot11] then
			if slot0.base_attr_list[slot9] == nil then
				slot15 = createRichLabel(24, cc.c4b(100, 50, 35, 255), cc.p(0, 0.5), cc.p(20, 28), nil, nil, 380)

				slot15:setPosition(cc.p(10, 20))
				slot0.attr_bgs[slot9]:addChild(slot15)

				slot0.base_attr_list[slot9] = slot15
			end

			slot15:setVisible(true)

			slot16 = PathTool.getAttrIconByStr(slot11)

			if slot13 > 0 then
				slot12 = slot12 + GameMath.round(slot3.lucky / slot4.max_lucky * (slot13 - slot12) * ((Config.HallowsData.data_const.temporary_ratio or {}).val or 800) / 1000)
			end

			slot17 = PartnerCalculate.isShowPerByStr(slot11)
			slot18 = Config.HallowsData.data_const.stone_attribute

			if slot3.seal > 0 and slot18 then
				slot19 = 0

				for slot23, slot24 in pairs(slot18.val) do
					if slot24[1] and slot24[1] == slot11 then
						slot19 = slot24[2] or 0

						break
					end
				end

				slot12 = slot12 + slot19 * slot3.seal
			end

			if slot17 == true then
				slot12 = slot12 / 10 .. "%"
			end

			if uv0:checkIsHaveHallowsMagic() then
				if uv0:getHallowsMagicAttrByKey(slot11) <= 0 then
					slot19 = uv1("<img src='%s' scale=1 /> <div fontcolor=#023656> %s：</div><div fontcolor=#023656>%s</div>", PathTool.getResFrame("common", slot16), slot14, tostring(slot12)) .. uv1("<div fontcolor=#249003> +%s</div>", tostring(math.ceil(uv0:getHallowsMagicAttrByKey(slot11 .. "_per") / 1000 * slot12)))
				else
					if slot17 then
						slot20 = slot20 / 10 .. "%"
					end

					slot19 = slot19 .. uv1("<div fontcolor=#249003> +%s</div>", tostring(slot20))
				end
			end

			slot15:setString(slot19)
		end
	end

	if uv3(getNorKey(slot0.select_hallows.id, slot3.skill_lev)) and slot6.skill_bid ~= 0 then
		if not Config.SkillData.data_get_skill(slot6.skill_bid) or next(slot7) == nil then
			return
		end

		if not slot0.hallow_skill_icon then
			slot0.hallow_skill_icon = SkillItem.new(true, true, true, 0.9)

			slot0.hallow_skill_icon:setPosition(cc.p(75, 245))
			slot0.skill_container:addChild(slot0.hallow_skill_icon)
		end

		slot0.hallow_skill_icon:setData(slot7)

		if not slot0.hallows_skill_name then
			slot0.hallows_skill_name = createLabel(24, cc.c4b(155, 88, 37, 255), nil, 135, 267, "", slot0.skill_container, 1, cc.p(0, 0))
		end

		if uv0:getHallowsRefineIsOpen() then
			slot0.refine_is_open = true

			slot0.hallows_skill_name:setString(uv1(TI18N("%s+%d【贯通+%d级】"), slot7.name, slot3.skill_lev, slot3.refine_lev))
		else
			slot0.refine_is_open = false

			slot0.hallows_skill_name:setString(uv1(TI18N("%s+%d"), slot7.name, slot3.skill_lev))
		end

		if not slot0.hallows_skill_desc then
			slot0.hallows_skill_desc = createRichLabel(22, cc.c4b(71, 44, 30, 255), cc.p(0, 1), cc.p(135, 250), 10, nil, 550)

			slot0.skill_container:addChild(slot0.hallows_skill_desc)
		end

		slot8, slot9 = slot3:getHallowsSkillAndRefineAtkVal()

		slot0.hallows_skill_desc:setString(uv1(slot7.des, slot8 + slot9, slot9))
		slot0.hallow_skill_icon:setHallowsAtkVal(slot9)
	end
end

function HallowsMainWindow.updateSkillList(slot0)
	if slot0.select_hallows == nil then
		return
	end

	slot1 = slot0.select_hallows.vo
	slot2 = Config.HallowsData.data_skill_attr[slot0.select_hallows.id] or {}

	for slot6, slot7 in pairs(slot0.skill_attr_list) do
		slot7:setVisible(false)
	end

	for slot6, slot7 in ipairs(slot2) do
		if slot0.skill_attr_list[slot6] == nil then
			slot0.skill_attr_list[slot6] = createLabel(20, cc.c3b(255, 255, 255), nil, 0, 0, "", slot0.skill_bg, nil, cc.p(0, 0.5))
		end

		slot8:setVisible(true)
		slot8:setPosition(cc.p(10, 90 - (slot6 - 1) * 32))

		if slot7.lev_limit <= slot1.skill_lev then
			slot8:setTextColor(cc.c3b(247, 152, 68))
		else
			slot8:setTextColor(cc.c3b(255, 255, 255))
		end

		slot8:setString(string.format(TI18N("技能%d级:%s"), slot7.lev_limit, slot7.desc))
	end
end

function HallowsMainWindow.updateHallowStatusInfo(slot0)
	if slot0.select_hallows == nil then
		return
	end

	if slot0.select_hallows.vo == nil then
		return
	else
		if (Config.HallowsData.data_max_lev[slot1.id] or 100) <= slot1.step then
			slot0.is_max_hallows_lv = true

			slot0.uplv_layout:setVisible(false)
		else
			slot0.is_max_hallows_lv = false

			slot0.uplv_layout:setVisible(true)
		end

		if (Config.HallowsData.data_skill_max_lev[slot1.id] or 10) <= slot1.skill_lev then
			slot0.is_max_skill_lv = true

			slot0.skill_layout:setVisible(false)
		else
			slot0.is_max_skill_lv = false

			slot0.skill_layout:setVisible(true)
		end

		if (Config.HallowsRefineData.data_max_lev[slot1.id] or 9) <= slot1.refine_lev then
			slot0.is_max_refine_lv = true

			slot0.refine_layout:setVisible(false)
			slot0.refine_max:setVisible(true)
		else
			slot0.is_max_refine_lv = false

			slot0.refine_layout:setVisible(true)
			slot0.refine_max:setVisible(false)
		end

		if slot0.is_max_hallows_lv == false then
			slot0:updateStepInfo()
		end

		if slot0.is_max_skill_lv == false then
			slot0:updateSkillInfo()
		end

		if slot0.is_max_refine_lv == false then
			slot0:updateRefineInfo()
		else
			slot0:updateRefineMaxInfo()
		end

		slot0:updateMaxLvTips()
	end
end

function HallowsMainWindow.updateMaxLvTips(slot0)
	if slot0.cur_index == HallowsConst.Tab_Index.uplv and slot0.is_max_hallows_lv then
		slot0.max_lv_tips:setString(TI18N("神技已满级"))
		slot0.maxlv_layout:setVisible(true)
	elseif slot0.cur_index == HallowsConst.Tab_Index.skill and slot0.is_max_skill_lv then
		slot0.max_lv_tips:setString(TI18N("技能已满级"))
		slot0.maxlv_layout:setVisible(true)
	elseif slot0.cur_index == HallowsConst.Tab_Index.refine and slot0.is_max_refine_lv then
		slot0.max_lv_tips:setString(TI18N("神技贯通等级达到最高等级"))
		slot0.maxlv_layout:setVisible(true)
	else
		slot0.maxlv_layout:setVisible(false)
	end
end

function HallowsMainWindow.updateStepInfo(slot0)
	if slot0.select_hallows == nil then
		return
	end

	if slot0.select_hallows.vo == nil then
		return
	end

	if uv0(getNorKey(slot1.id, slot1.step)) then
		slot0.step_progress_value:setString(slot1.lucky .. "/" .. slot2.max_lucky)
		slot0.step_progress:setPercent(100 * slot1.lucky / slot2.max_lucky)

		slot4 = slot2.loss[2]

		if slot2.loss[1] then
			slot5 = slot3[1]
			slot6 = slot3[2]
			slot0.hallows_uplv_cost_bid_1 = slot5
			slot0.hallows_uplv_cost_num_1 = slot6

			slot0:setCostDataToNode(slot0.lvup_cost_res_1, slot0.lvup_cost_label_1, slot5, slot6)
		end

		if slot4 then
			slot5 = slot4[1]
			slot6 = slot4[2]
			slot0.hallows_uplv_cost_bid_2 = slot5
			slot0.hallows_uplv_cost_num_2 = slot6

			slot0:setCostDataToNode(slot0.lvup_cost_res_2, slot0.lvup_cost_label_2, slot5, slot6)
		end
	end
end

function HallowsMainWindow.updateSkillInfo(slot0)
	if slot0.select_hallows == nil then
		return
	end

	if slot0.select_hallows.vo == nil then
		return
	end

	if uv0(getNorKey(slot0.select_hallows.id, slot1.skill_lev)) and slot2.skill_bid ~= 0 then
		if slot1.step < slot2.lev_limit then
			slot0.skill_lvup_tips:setString(string.format(TI18N("神技%d级可继续升级"), slot2.lev_limit))
			slot0.skill_lvup_tips:setVisible(true)
			slot0.skill_cost_bg_1:setVisible(false)
			slot0.skill_cost_bg_2:setVisible(false)
			setChildUnEnabled(true, slot0.skill_lvup_btn)
			slot0.skill_lvup_btn:setTouchEnabled(false)
			slot0.skill_lvup_btn_label:disableEffect(cc.LabelEffect.OUTLINE)
		else
			setChildUnEnabled(false, slot0.skill_lvup_btn)
			slot0.skill_lvup_btn:setTouchEnabled(true)
			slot0.skill_lvup_btn_label:enableOutline(cc.c4b(41, 74, 21, 255), 2)
			slot0.skill_lvup_tips:setVisible(false)
			slot0.skill_cost_bg_1:setVisible(true)
			slot0.skill_cost_bg_2:setVisible(true)

			slot4 = slot2.lose[2]

			if slot2.lose[1] then
				slot5 = slot3[1]
				slot6 = slot3[2]
				slot0.skill_lvup_cost_bid_1 = slot5
				slot0.skill_lvup_cost_num_1 = slot6

				slot0:setCostDataToNode(slot0.skill_res_icon_1, slot0.skill_cost_label_1, slot5, slot6)
			end

			if slot4 then
				slot5 = slot4[1]
				slot6 = slot4[2]
				slot0.skill_lvup_cost_bid_2 = slot5
				slot0.skill_lvup_cost_num_2 = slot6

				slot0:setCostDataToNode(slot0.skill_res_icon_2, slot0.skill_cost_label_2, slot5, slot6)
			end
		end
	end
end

function HallowsMainWindow.updateRefineInfo(slot0)
	if slot0.select_hallows == nil then
		return
	end

	if slot0.select_hallows.vo == nil then
		return
	end

	slot2 = nil

	if Config.HallowsRefineData.data_refine[slot1.id] then
		slot2 = Config.HallowsRefineData.data_refine[slot1.id][slot1.refine_lev]
	end

	slot3 = nil

	if Config.HallowsRefineData.data_refine[slot1.id] then
		slot3 = Config.HallowsRefineData.data_refine[slot1.id][slot1.refine_lev + 1]
	end

	slot0.refine_lv_txt_1:setString(uv0(TI18N("贯通等级:%d"), slot1.refine_lev))

	if slot2 then
		slot0.atk_txt_1:setString(slot2.add_dps)
		slot0.total_atk_txt_1:setString(slot2.add_dps + slot1:getHallowsSkillAndRefineAtkVal())
	else
		slot0.atk_txt_1:setString(0)
		slot0.total_atk_txt_1:setString(slot4)
	end

	if slot3 then
		slot6 = slot3.expend[2]

		if slot3.expend[1] then
			slot7 = slot5[1]
			slot8 = slot5[2]
			slot0.refine_cost_bid_1 = slot7
			slot0.refine_cost_num_1 = slot8

			if not slot0:setCostDataToNode(slot0.refine_res_icon_1, slot0.refine_cost_label_1, slot7, slot8) then
				slot0.is_can_refine_2 = false
			end
		end

		if slot6 then
			slot7 = slot6[1]
			slot8 = slot6[2]
			slot0.refine_cost_bid_2 = slot7
			slot0.refine_cost_num_2 = slot8

			if not slot0:setCostDataToNode(slot0.refine_res_icon_2, slot0.refine_cost_label_2, slot7, slot8) then
				slot0.is_can_refine_3 = false
			end
		end

		if slot3.need_lev <= slot1.step then
			slot0.refine_btn:setTouchEnabled(true)
			setChildUnEnabled(false, slot0.refine_btn)
			slot0.refine_btn_label:enableOutline(cc.c4b(43, 97, 13, 255), 2)
			slot0.refine_tips:setVisible(false)
		else
			slot0.refine_btn:setTouchEnabled(false)
			setChildUnEnabled(true, slot0.refine_btn)
			slot0.refine_btn_label:disableEffect(cc.LabelEffect.OUTLINE)
			slot0.refine_tips:setString(uv0(TI18N("神技%d级可继续贯通"), slot3.need_lev))
			slot0.refine_tips:setVisible(true)

			slot0.is_can_refine_1 = false
		end

		slot0.refine_lv_txt_2:setString(uv0(TI18N("贯通等级:%d"), slot3.lev))
		slot0.atk_txt_2:setString(slot3.add_dps)
		slot0.total_atk_txt_2:setString(slot3.add_dps + slot4)
	end
end

function HallowsMainWindow.updateRefineMaxInfo(slot0)
	if slot0.select_hallows == nil then
		return
	end

	if slot0.select_hallows.vo == nil then
		return
	end

	slot2 = nil

	if Config.HallowsRefineData.data_refine[slot1.id] then
		slot2 = Config.HallowsRefineData.data_refine[slot1.id][slot1.refine_lev]
	end

	if not slot2 then
		return
	end

	slot0.refine_max_lv:setString(uv0(TI18N("贯通等级:%d"), slot1.refine_lev))
	slot0.atk_max_txt:setString(slot2.add_dps)

	slot3, slot4 = slot1:getHallowsSkillAndRefineAtkVal()

	slot0.total_atk_txt:setString(slot3 + slot4)
end

function HallowsMainWindow.updateTabRedStatus(slot0)
	if slot0.select_hallows == nil then
		return
	end

	if uv0:getRedHallowsId() and slot1 == slot0.select_hallows.id then
		for slot5, slot6 in pairs(slot0.tab_list) do
			if slot6.tips and slot6.index then
				slot7 = false

				if slot6.index == HallowsConst.Tab_Index.uplv then
					slot7 = uv0:checkRedIsShowByRedType(HallowsConst.Red_Index.hallows_lvup)
				elseif slot6.index == HallowsConst.Tab_Index.skill then
					slot7 = uv0:checkRedIsShowByRedType(HallowsConst.Red_Index.skill_lvup)
				elseif slot6.index == HallowsConst.Tab_Index.refine then
					slot7 = uv0:checkRedIsShowByRedType(HallowsConst.Red_Index.refine_lvup)
				end

				slot6.tips:setVisible(slot7)
			end
		end

		if slot0.trace_btn_tips then
			slot0.trace_btn_tips:setVisible(uv0:checkRedIsShowByRedType(HallowsConst.Red_Index.stone_use))
		end

		if slot0.magic_btn_tips then
			slot0.magic_btn_tips:setVisible(uv0:checkRedIsShowByRedType(HallowsConst.Red_Index.magic_task))
		end
	else
		for slot5, slot6 in pairs(slot0.tab_list) do
			if slot6.tips then
				slot6.tips:setVisible(false)
			end
		end

		if slot0.trace_btn_tips then
			slot0.trace_btn_tips:setVisible(false)
		end

		if slot0.magic_btn_tips then
			slot0.magic_btn_tips:setVisible(false)
		end
	end
end

function HallowsMainWindow.setCostDataToNode(slot0, slot1, slot2, slot3, slot4)
	slot5 = true

	if Config.ItemData.data_get_data(slot3) then
		slot1:loadTexture(PathTool.getItemRes(slot6.icon), LOADTEXT_TYPE)

		slot8 = BackpackController:getInstance():getModel():getItemNumByBid(slot3)

		slot2:setString(string.format("%s/%s", MoneyTool.GetMoneyString(slot8, false), MoneyTool.GetMoneyString(slot4, false)))

		if slot8 < slot4 then
			slot2:setTextColor(cc.c3b(255, 93, 93))

			slot5 = false
		else
			slot2:setTextColor(cc.c3b(255, 246, 228))
		end
	end

	return slot5
end

function HallowsMainWindow.checkNeedUpdateItemNum(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		return
	end

	for slot5, slot6 in pairs(slot1) do
		if slot6.config then
			slot0:updateCostItemNumByBid(slot6.config.id)
		end
	end
end

function HallowsMainWindow.updateCostItemNumByBid(slot0, slot1)
	if not slot1 then
		return
	end

	if slot1 == slot0.hallows_uplv_cost_bid_1 then
		slot0:setCostDataToNode(slot0.lvup_cost_res_1, slot0.lvup_cost_label_1, slot1, slot0.hallows_uplv_cost_num_1)
	end

	if slot1 == slot0.hallows_uplv_cost_bid_2 then
		slot0:setCostDataToNode(slot0.lvup_cost_res_2, slot0.lvup_cost_label_2, slot1, slot0.hallows_uplv_cost_num_2)
	end

	if slot1 == slot0.skill_lvup_cost_bid_1 then
		slot0:setCostDataToNode(slot0.skill_res_icon_1, slot0.skill_cost_label_1, slot1, slot0.skill_lvup_cost_num_1)
	end

	if slot1 == slot0.skill_lvup_cost_bid_2 then
		slot0:setCostDataToNode(slot0.skill_res_icon_2, slot0.skill_cost_label_2, slot1, slot0.skill_lvup_cost_num_2)
	end

	if slot1 == slot0.refine_cost_bid_1 then
		if slot0:setCostDataToNode(slot0.refine_res_icon_1, slot0.refine_cost_label_1, slot1, slot0.refine_cost_num_1) then
			slot0.is_can_refine_2 = true
		else
			slot0.is_can_refine_2 = false
		end
	end

	if slot1 == slot0.refine_cost_bid_2 then
		if slot0:setCostDataToNode(slot0.refine_res_icon_2, slot0.refine_cost_label_2, slot1, slot0.refine_cost_num_2) then
			slot0.is_can_refine_3 = true
		else
			slot0.is_can_refine_3 = false
		end
	end
end

function HallowsMainWindow.handleUpdateEvent(slot0, slot1, slot2)
	if slot1 and slot0.select_hallows and slot1 == slot0.select_hallows.id then
		slot0:selectHallowsIndex(slot0.select_index, true, slot2)
	end
end

function HallowsMainWindow.checkIsShowResetBtn(slot0)
	if slot0.select_hallows == nil then
		return false
	end

	if slot0.select_hallows.vo == nil then
		return slot1
	end

	if slot2.step > 1 or slot2.seal > 0 or slot2.skill_lev > 1 or slot2.refine_lev > 0 then
		slot1 = true
	end

	return slot1
end

function HallowsMainWindow.changeAutoAdvanceStatus(slot0, slot1)
	if slot1 == slot0.is_in_advance then
		return
	end

	slot0.is_in_advance = slot1

	if slot0.is_in_advance == true then
		slot0.step_auto_advanced_btn_label:setString(TI18N("停止"))

		if slot0.auto_time_ticket == nil then
			slot0.auto_time_ticket = GlobalTimeTicket:getInstance():add(function ()
				if uv0.is_in_advance == true then
					uv1:requestHallowsAdvance(uv0.select_hallows.id, false)
				end
			end, 0.5)
		end
	else
		slot0.step_auto_advanced_btn_label:setString(TI18N("一键升级"))
		slot0:clearAutoTimeticket()
	end
end

function HallowsMainWindow.clearAutoTimeticket(slot0)
	if slot0.auto_time_ticket then
		GlobalTimeTicket:getInstance():remove(slot0.auto_time_ticket)

		slot0.auto_time_ticket = nil
	end
end

function HallowsMainWindow.close_callback(slot0)
	slot0:clearAutoTimeticket()
	slot0:handleEffect(false)
	slot0:handleRefineEffect(false)

	if slot0.hallows_model then
		slot0.hallows_model:clearTracks()
		slot0.hallows_model:removeFromParent()

		slot0.hallows_model = nil
	end

	if slot0.hallow_skill_icon then
		slot0.hallow_skill_icon:DeleteMe()

		slot0.hallow_skill_icon = nil
	end

	if slot0.role_lev_event and slot0.role_vo then
		slot0.role_vo:UnBind(slot0.role_lev_event)

		slot0.role_lev_event = nil
	end

	uv0:openHallowsMainWindow(false)
end
