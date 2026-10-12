ElitematchMatchingWindow = ElitematchMatchingWindow or BaseClass(BaseView)
slot1 = ElitematchController:getInstance():getModel()
slot3 = HeroController:getInstance():getModel()
slot4 = string.format
slot5 = table.sort

function ElitematchMatchingWindow.__init(slot0)
	slot0.win_type = WinType.Full
	slot0.is_full_screen = true
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("elitematch_matching", "elitematch_matching"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/elitematch", "elitematch_matching_bg", true),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/elitematch", "elitematch_matching_head", false),
			type = ResourcesType.single
		}
	}
	slot0.layout_name = "elitematch/elitematch_matching_window"
	slot0.is_match = false
	slot0.is_matching = false
end

function ElitematchMatchingWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg/elitematch", "elitematch_matching_bg", true), LOADTEXT_TYPE)
	slot0.background:setScale(display.getMaxScale())

	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot0.container, 1)

	slot0.container_size = slot0.container:getContentSize()
	slot0.close_btn = slot0.container:getChildByName("close_btn")
	slot0.matching_14 = slot0.container:getChildByName("matching_14")
	slot0.matching_14_1 = slot0.matching_14:getChildByName("matching_14_1")
	slot0.title_name = slot0.container:getChildByName("title_name")
	slot0.vs_node = slot0.container:getChildByName("vs_node")

	function slot1(slot0, slot1)
		slot2 = {
			bg = slot0,
			panel = slot1,
			form_icon = slot1:getChildByName("form_bg"):getChildByName("form_icon")
		}

		slot2.form_icon:setScale(1.5)

		slot2.fight_label = CommonNum.new(20, slot1:getChildByName("fight_bg"), 0, -2, cc.p(0, 0.5))
		slot8 = 65

		slot2.fight_label:setPosition(slot8, 36)

		slot2.pos_list = {}
		slot2.hero_item_list = {}

		for slot8 = 1, 9 do
			slot10, slot11 = slot1:getChildByName("item_bg_" .. slot8):getPosition()
			slot2.pos_list[slot8] = cc.p(slot10, slot11)
		end

		return slot2
	end

	slot2 = slot0.container:getChildByName("up_panel")
	slot0.up_base_info = {
		name = slot2:getChildByName("name")
	}
	slot0.up_base_info.elite_name = slot0.up_base_info.name:getChildByName("elite_name")
	slot0.up_base_info.sex_icon = slot2:getChildByName("sex_icon")
	slot0.up_base_info.level_icon = slot2:getChildByName("level_icon")
	slot0.up_base_info.level_icon_1 = slot2:getChildByName("level_icon_1")
	slot0.up_base_info.half_head = slot2:getChildByName("half_head")
	slot0.up_left_team_info = slot1(slot2:getChildByName("bg_02_left"), slot2:getChildByName("left_panel"))
	slot0.up_right_team_info = slot1(slot2:getChildByName("bg_02_right"), slot2:getChildByName("right_panel"))
	slot7 = slot0.container:getChildByName("down_panel")
	slot0.down_base_info = {
		name = slot7:getChildByName("name"),
		elite_name = slot7:getChildByName("elite_name")
	}

	slot0.down_base_info.elite_name:setString("")

	slot0.down_base_info.sex_icon = slot0.down_base_info.name:getChildByName("sex_icon")
	slot0.down_base_info.level_icon = slot7:getChildByName("level_icon")
	slot0.down_base_info.level_icon_1 = slot7:getChildByName("level_icon_1")
	slot0.down_base_info.half_head = slot7:getChildByName("half_head")
	slot0.down_left_team_info = slot1(slot7:getChildByName("bg_02_left"), slot7:getChildByName("left_panel"))
	slot0.down_right_team_info = slot1(slot7:getChildByName("bg_02_right"), slot7:getChildByName("right_panel"))
	slot0.miss_half_head = slot7:getChildByName("miss_half_head")
	slot0.left_btn = slot0.container:getChildByName("left_btn")

	slot0.left_btn:getChildByName("label"):setString(TI18N("调整阵容"))

	slot0.right_btn = slot0.container:getChildByName("right_btn")
	slot0.right_btn_label = slot0.right_btn:getChildByName("label")

	slot0.right_btn_label:setString(TI18N("匹配对手"))

	slot0.checkbox = slot0.container:getChildByName("checkbox")

	slot0.checkbox:getChildByName("name"):setString(TI18N("跳过战前布阵"))
	slot0.checkbox:setSelected(false)

	slot0.cool_time = createRichLabel(20, cc.c4b(255, 248, 191, 255), cc.p(0.5, 0.5), cc.p(560, 182), nil, nil, 600)

	slot0.container:addChild(slot0.cool_time)

	slot0.step_time = createRichLabel(28, cc.c4b(255, 248, 191, 255), cc.p(0.5, 0.5), cc.p(360, 223), nil, nil, 600)

	slot0.container:addChild(slot0.step_time)

	slot12 = slot0.container:getChildByName("buy_panel")

	slot12:getChildByName("key"):setString(TI18N("匹配次数:"))

	slot0.buy_count = slot12:getChildByName("label")
	slot0.buy_btn = slot12:getChildByName("add_btn")
	slot0.buy_tips = createRichLabel(20, cc.c4b(255, 248, 191, 255), cc.p(0.5, 0.5), cc.p(578.41, 126), nil, nil, 600)

	slot0.container:addChild(slot0.buy_tips)
	slot0:adaptationScreen()
end

function ElitematchMatchingWindow.adaptationScreen(slot0)
	slot0.close_btn:setPositionY(display.getBottom(slot0.container) + slot0.close_btn:getPositionY())
end

function ElitematchMatchingWindow.reloadAudioEffect(slot0)
	slot4 = AudioManager.AUDIO_TYPE.COMMON
	slot5 = "c_scroll"
	slot0.audio_list = {
		PathTool.getSound(AudioManager.AUDIO_TYPE.COMMON, "c_vs"),
		PathTool.getSound(slot4, slot5)
	}

	for slot4, slot5 in pairs(slot0.audio_list) do
		AudioManager:getInstance():preLoadEffectByPath(v)
	end
end

function ElitematchMatchingWindow.configShowUI(slot0)
	if slot0.step_time then
		slot0.step_time:setString("")
	end

	slot1 = nil

	if slot0.match_type == ElitematchConst.MatchType.eNormalMatch then
		slot0.title_name_str = TI18N("常规赛 匹配")

		slot0.title_name:setString(slot0.title_name_str)

		slot1 = PathTool.getResFrame("elitematch_matching", "elitematch_matching_14")

		slot0.up_left_team_info.bg:setPositionX(155)
		slot0.up_left_team_info.panel:setPositionX(155)
		slot0.down_base_info.name:setVisible(false)
		slot0.down_base_info.level_icon:setVisible(false)
		slot0.down_base_info.level_icon_1:setVisible(false)
		slot0.down_base_info.sex_icon:setVisible(false)
		slot0.down_base_info.half_head:setVisible(false)
		slot0.down_right_team_info.bg:setVisible(false)
		slot0.down_right_team_info.panel:setVisible(false)

		slot0.half_head_x = slot0.down_base_info.half_head:getPositionX()
		slot0.down_right_x = slot0.down_right_team_info.panel:getPositionX()
		slot0.down_y = slot0.down_right_team_info.panel:getPositionY()
	else
		slot0.title_name_str = TI18N("常规赛 匹配")

		slot0.title_name:setString(slot0.title_name_str)

		slot1 = PathTool.getResFrame("elitematch_matching", "elitematch_matching_15")

		slot0.up_left_team_info.bg:setPositionX(196)
		slot0.up_left_team_info.panel:setPositionX(196)
		slot0.up_right_team_info.bg:setVisible(true)
		slot0.up_right_team_info.panel:setVisible(true)
		slot0.down_base_info.name:setVisible(false)
		slot0.down_base_info.level_icon:setVisible(false)
		slot0.down_base_info.level_icon_1:setVisible(false)
		slot0.down_base_info.sex_icon:setVisible(false)
		slot0.down_base_info.half_head:setVisible(false)
		slot0.down_right_team_info.bg:setPositionX(530)
		slot0.down_right_team_info.panel:setPositionX(530)
		slot0.down_right_team_info.bg:setVisible(false)
		slot0.down_right_team_info.panel:setVisible(false)
		slot0.down_left_team_info.bg:setVisible(false)
		slot0.down_left_team_info.panel:setVisible(false)

		slot0.down_right_x = slot0.down_right_team_info.panel:getPositionX()
		slot0.down_left_x = slot0.down_left_team_info.panel:getPositionX()
		slot0.down_y = slot0.down_right_team_info.panel:getPositionY()
	end

	loadSpriteTexture(slot0.miss_half_head, PathTool.getPlistImgForDownLoad("bigbg/elitematch", "elitematch_matching_head", false), LOADTEXT_TYPE)

	if slot1 then
		loadSpriteTexture(slot0.matching_14, slot1, LOADTEXT_TYPE_PLIST)
		loadSpriteTexture(slot0.matching_14_1, slot1, LOADTEXT_TYPE_PLIST)
	end
end

function ElitematchMatchingWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), true, 2)
	registerButtonEventListener(slot0.left_btn, handler(slot0, slot0.onClickLeftBtn), true, 1)
	registerButtonEventListener(slot0.buy_btn, handler(slot0, slot0.onClickBuyCountBtn), true, 1)
	slot0.checkbox:addEventListener(function (slot0, slot1)
		playButtonSound2()

		if not uv0.scdata then
			return
		end

		if uv0.checkbox:isSelected() then
			uv0.scdata.is_skip = 1
		else
			uv0.scdata.is_skip = 0
		end
	end)
	slot0.right_btn:addTouchEventListener(function (slot0, slot1)
		if uv0.unenble_right_btn then
			return
		end

		customClickAction(slot0, slot1, scale)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:onClickRightBtn()
		end
	end)
	slot0:addGlobalEvent(ElitematchEvent.Get_Elite_Enemy_Info_Event, function (slot0)
		if not slot0 then
			return
		end

		uv0:setData(slot0)
	end)
	slot0:addGlobalEvent(ElitematchEvent.Update_Elite_Fun_Form, function (slot0)
		if not slot0 then
			return
		end

		if uv0.match_type == slot0.type then
			if uv0.match_type == ElitematchConst.MatchType.eKingMatch and #slot0.formations == 1 then
				uv0:updateMyTeamInfo({
					formation_type = 1,
					pos_info = {}
				}, 2)
			end

			for slot4, slot5 in ipairs(slot0.formations) do
				uv0:updateMyTeamInfo(slot5, slot5.order)
			end
		end
	end)
	slot0:addGlobalEvent(ElitematchEvent.Update_Elite_Save_Form, function (slot0)
		if not slot0 then
			return
		end

		uv0:sender24920(uv1.match_type)
	end)
	slot0:addGlobalEvent(ElitematchEvent.Elite_buy_count_Event, function (slot0)
		if not slot0 then
			return
		end

		uv0.scdata.day_buy_count = slot0.day_buy_count
		uv0.scdata.day_combat_count = slot0.day_combat_count

		if uv0.enemy_scdata then
			uv0.enemy_scdata.day_combat_count = slot0.day_combat_count
		end

		uv0:updateBuyCount(slot0.day_combat_count)

		if uv0.is_send_matching then
			uv0.is_send_matching = false

			uv0:onClickRightBtn()
		end
	end)
	slot0:addGlobalEvent(ElitematchEvent.Elite_Fight_Fail_Event, function ()
		uv0.is_send24903 = false
	end)
	slot0:addGlobalEvent(ElitematchEvent.Elite_Fight_Result_Event, function ()
		uv0:reloadMatchUI()
	end)
	slot0:addGlobalEvent(ElitematchEvent.Get_Elite_Main_Info_Event, function (slot0)
		if not slot0 then
			return
		end

		uv0:updateLevelUpInfo()
		uv0:updateHeadInfo(uv0.up_base_info, nil, slot0.lev, nil)

		if uv0.enemy_scdata then
			uv0.enemy_scdata.day_combat_count = slot0.day_combat_count
		end

		uv0:updateBuyCount(slot0.day_combat_count)

		uv0.is_send24903 = false
	end)
end

function ElitematchMatchingWindow.onClickCloseBtn(slot0)
	uv0:openElitematchMatchingWindow(false)
end

function ElitematchMatchingWindow.onClickBuyCountBtn(slot0, slot1)
	if not slot0.scdata then
		return
	end

	if slot0.scdata.state == 0 then
		return
	end

	if Config.ArenaEliteData.data_elite_const.match_count then
		if Config.ArenaEliteData.data_elite_buy[slot0.scdata.day_buy_count + 1] == nil then
			if slot1 then
				message(TI18N("已达到今日挑战次数上限"))
			else
				message(TI18N("购买次数已达上限"))
			end

			return
		end

		if slot3.need_vip > 0 then
			if RoleController:getInstance():getRoleVo() and slot4.vip_lev < slot3.need_vip then
				message(uv0(TI18N("需要vip%s才能购买"), slot3.need_vip))

				return
			end

			if slot4 == nil then
				return
			end
		end

		slot5 = slot3.cost[1][2]
		slot6 = PathTool.getItemRes(Config.ItemData.data_get_data(slot3.cost[1][1]).icon)
		slot7 = nil

		CommonAlert.show((not slot1 or uv0(TI18N("匹配次数不足, 是否花费 <img src='%s' scale=0.3 /> %s购买一次匹配次数？"), slot6, slot5, slot2.val)) and uv0(TI18N("是否花费 <img src='%s' scale=0.3 /> %s购买一次匹配次数？"), slot6, slot5, slot2.val), TI18N("确定"), function ()
			uv0.is_send_matching = uv1

			uv2:sender24904()
		end, TI18N("取消"), nil, CommonAlert.type.rich)
	end
end

function ElitematchMatchingWindow.onClickLeftBtn(slot0)
	if not slot0.enemy_scdata then
		return
	end

	if slot0.is_match then
		if slot0.enemy_scdata.to_combat_time - GameNet:getInstance():getTime() <= 0 then
			return
		end

		HeroController:getInstance():openFormMainWindow(true, PartnerConst.Fun_Form.EliteMatch, {
			match_type = slot0.match_type,
			end_time = slot0.enemy_scdata.to_combat_time
		})
	else
		HeroController:getInstance():openFormMainWindow(true, PartnerConst.Fun_Form.EliteMatch, {
			match_type = slot0.match_type
		})
	end
end

function ElitematchMatchingWindow.onClickRightBtn(slot0)
	if not slot0.enemy_scdata then
		return
	end

	if slot0.is_matching then
		message(TI18N("匹配中..."))

		return
	end

	if slot0.is_match then
		if slot0.is_send24903 then
			return
		end

		slot0.is_match = false
		slot0.is_send24903 = true

		uv0:sender24903()
	else
		if slot0.enemy_scdata.day_combat_count == 0 then
			slot0:onClickBuyCountBtn(true)

			return
		end

		if GameNet:getInstance():getTime() < slot0.enemy_scdata.match_cd_time then
			return
		end

		slot0.is_matching = true

		uv0:sender24902(slot0.scdata.is_skip)

		if slot0.miss_half_head then
			slot0.miss_half_head:setVisible(false)
		end

		slot0:playMatchEffect(true)
		slot0.checkbox:setVisible(false)

		slot0.is_time_out = false
		slot0.is_data_back = false

		slot0:setBtnTime()
		delayRun(slot0.container, 1, function ()
			uv0.is_time_out = true

			uv0:setDataByCondition()
		end)
	end
end

function ElitematchMatchingWindow.reloadMatchUI(slot0)
	slot0.is_match = false

	if slot0.miss_half_head then
		slot0.miss_half_head:setVisible(true)
	end

	slot0.checkbox:setVisible(true)
	slot0.step_time:stopAllActions()
	slot0.step_time:setString("")
	slot0.right_btn_label:stopAllActions()
	slot0.right_btn_label:setString(TI18N("匹配对手"))
	slot0:playVsEffect(false)

	if slot0.match_type == ElitematchConst.MatchType.eNormalMatch then
		slot0.down_base_info.half_head:setVisible(false)
	else
		slot0.down_left_team_info.bg:setVisible(false)
		slot0.down_left_team_info.panel:setVisible(false)
	end

	slot0.down_right_team_info.bg:setVisible(false)
	slot0.down_right_team_info.panel:setVisible(false)
	slot0.down_base_info.name:setVisible(false)
	slot0.down_base_info.level_icon:setVisible(false)
	slot0.down_base_info.level_icon_1:setVisible(false)
	slot0.down_base_info.sex_icon:setVisible(false)
	slot0.down_base_info.elite_name:setString("")
	slot0.left_btn:setVisible(true)
	slot0.right_btn:setVisible(true)
end

function ElitematchMatchingWindow.setDataByCondition(slot0, slot1)
	if slot0.is_time_out and slot0.is_data_back then
		slot0.left_btn:setVisible(true)
		slot0.right_btn:setVisible(true)
		slot0.right_btn_label:stopAllActions()
		slot0.right_btn_label:setString(TI18N("立刻挑战"))
		slot0.checkbox:setVisible(false)

		slot0.is_match = true

		slot0:updateMatchBtn(false)
		slot0:playMatchEffect(false)

		if slot0.miss_half_head then
			slot0.miss_half_head:setVisible(false)
		end

		if slot0.enemy_scdata then
			for slot6, slot7 in ipairs(slot0.enemy_scdata.rand_list[1].defense) do
				if slot7.type == slot0.match_type then
					function slot11(slot0, slot1)
						return slot0.order < slot1.order
					end

					uv0(slot7.defense_info, slot11)

					for slot11, slot12 in ipairs(slot7.defense_info) do
						slot0:updateEnemyTeamInfo(slot12, slot12.order, slot2)
					end

					if slot0.match_type == ElitematchConst.MatchType.eKingMatch and #slot7.defense_info == 1 then
						slot0:updateEnemyTeamInfo({
							formation_type = 1,
							partner_infos = {}
						}, 2)
					end
				end
			end

			slot0:updateHeadInfo(slot0.down_base_info, uv1("[%s]%s", getServerName(slot2.srv_id), slot2.name), slot2.elite_lev, slot2.look_id, slot2.sex)
		end

		slot0.is_matching = false

		slot0:setStepTime(slot1 or 5)
	end
end

function ElitematchMatchingWindow.openRootWnd(slot0, slot1)
	slot2 = slot1 or {}
	slot3 = slot2.match_type or ElitematchConst.MatchType.eNormalMatch
	slot0.scdata = slot2.scdata

	if not slot0.scdata then
		return
	end

	slot0.is_time_out = true
	slot0.is_matching = false
	slot0.match_type = slot3
	slot0.level_id = slot0.scdata.lev

	slot0:configShowUI()

	if slot0.scdata.is_skip and slot0.scdata.is_skip == 1 then
		slot0.checkbox:setSelected(true)
	else
		slot0.checkbox:setSelected(false)
	end

	slot0.checkbox:setVisible(false)
	uv0:sender24920(slot0.match_type)
	uv0:sender24901()
end

function ElitematchMatchingWindow.setData(slot0, slot1)
	slot0.enemy_scdata = slot1

	slot0:updateBuyCount(slot0.enemy_scdata.day_combat_count)
	GlobalEvent:getInstance():Fire(ElitematchEvent.Elite_Challenge_count_Event, slot1)
	slot0:updateLevelUpInfo()

	if slot0.enemy_scdata.is_match == 1 then
		slot0.right_btn_label:setString(TI18N("匹配对手"))
		slot0.checkbox:setVisible(false)
		slot0:updateMatchBtn(true)
		slot0:playMatchEffect(true)

		slot0.is_matching = true
		slot0.is_data_back = false

		slot0:setBtnTime()

		if slot0.miss_half_head then
			slot0.miss_half_head:setVisible(false)
		end

		return
	end

	slot0.checkbox:setVisible(true)

	if #slot0.enemy_scdata.rand_list > 0 then
		slot0.is_data_back = true

		if slot1.to_combat_time - GameNet:getInstance():getTime() < 0 then
			slot2 = 0
		end

		slot0:setDataByCondition(slot2)
	else
		slot0:playMatchEffect(false)
		slot0:updateMatchBtn(true)

		slot0.is_matching = false

		slot0:reloadMatchUI()
	end
end

function ElitematchMatchingWindow.updateLevelUpInfo(slot0)
	if not slot0.scdata then
		return
	end

	if #slot0.scdata.promoted_info > 0 then
		slot0.title_name:setString(slot0.title_name_str .. TI18N("(升段赛)"))
	else
		slot0.title_name:setString(slot0.title_name_str)
	end
end

function ElitematchMatchingWindow.updateMatchBtn(slot0, slot1)
	if not slot0.enemy_scdata then
		return
	end

	if slot1 then
		if GameNet:getInstance():getTime() < slot0.enemy_scdata.match_cd_time then
			slot0.right_btn_label:disableEffect(cc.LabelEffect.OUTLINE)
			setChildUnEnabled(true, slot0.right_btn)

			slot0.unenble_right_btn = true

			slot0:setCoolTime(slot0.enemy_scdata.match_cd_time - slot2)
		end
	else
		slot0.cool_time:stopAllActions()
		slot0.cool_time:setString("")

		slot0.unenble_right_btn = false

		setChildUnEnabled(false, slot0.right_btn)
		slot0.right_btn_label:enableOutline(Config.ColorData.data_color4[264], 2)
	end
end

function ElitematchMatchingWindow.setCoolTime(slot0, slot1)
	if tolua.isnull(slot0.cool_time) then
		return
	end

	slot0.cool_time:stopAllActions()

	if (slot1 or 0) > 0 then
		slot0:setCoolTimeFormatString(slot2)
		slot0.cool_time:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				uv1.cool_time:stopAllActions()
			else
				uv1:setCoolTimeFormatString(uv0)
			end
		end))))
	else
		slot0:setCoolTimeFormatString(slot2)
	end
end

function ElitematchMatchingWindow.setCoolTimeFormatString(slot0, slot1)
	if slot1 > 0 then
		slot0.cool_time:setString(string.format(TI18N("<div outline=2,#000000>冷却时间:</div><div fontcolor=#3df424 outline=2,#000000>%s</div>"), TimeTool.GetTimeDayOrTime(slot1)))
	else
		slot0:updateMatchBtn(false)
	end
end

function ElitematchMatchingWindow.setStepTime(slot0, slot1)
	slot2 = slot1 or 0

	if tolua.isnull(slot0.step_time) then
		return
	end

	slot0.step_time:stopAllActions()

	if slot2 > 0 then
		slot0:setStepTimeFormatString(slot2)
		slot0.step_time:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				uv1.step_time:stopAllActions()
				uv1.step_time:setString("")
			else
				uv1:setStepTimeFormatString(uv0)
			end
		end))))
	else
		slot0:setStepTimeFormatString(slot2)
	end
end

function ElitematchMatchingWindow.setStepTimeFormatString(slot0, slot1)
	slot0.step_time:setString(string.format(TI18N("<div fontcolor=#3df424 outline=2,#000000>%s</div><div outline=2,#000000> 秒后进入战斗</div>"), slot1))
end

function ElitematchMatchingWindow.setBtnTime(slot0)
	if tolua.isnull(slot0.right_btn_label) then
		return
	end

	slot0.right_btn_label:stopAllActions()
	slot0:setBtnTimeFormatString(1)
	slot0.right_btn_label:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(0.5), cc.CallFunc:create(function ()
		uv0 = uv0 + 1

		if uv0 > 4 then
			uv0 = 1
		end

		uv1:setBtnTimeFormatString(uv0)
	end))))
end

function ElitematchMatchingWindow.setBtnTimeFormatString(slot0, slot1)
	if slot1 == 1 then
		slot0.right_btn_label:setString(TI18N("匹配中."))
	elseif slot1 == 2 then
		slot0.right_btn_label:setString(TI18N("匹配中.."))
	elseif slot1 == 3 then
		slot0.right_btn_label:setString(TI18N("匹配中..."))
	else
		slot0.right_btn_label:setString(TI18N("匹配中"))
	end
end

function ElitematchMatchingWindow.updateMyTeamInfo(slot0, slot1, slot2)
	slot3 = nil

	if slot0.match_type == ElitematchConst.MatchType.eNormalMatch then
		if slot2 == 1 then
			slot3 = slot0.up_left_team_info
			slot0.my_team_left_scdata = slot1
		else
			return
		end
	elseif slot0.match_type == ElitematchConst.MatchType.eKingMatch then
		if slot2 == 1 then
			slot3 = slot0.up_left_team_info
			slot0.my_team_left_scdata = slot1
		elseif slot2 == 2 then
			slot3 = slot0.up_right_team_info
			slot0.my_team_right_scdata = slot1
		else
			return
		end
	end

	slot0:updateFormIcon(slot3, slot1.formation_type)
	slot0:updateHeroInfo(slot3, slot1.pos_info, slot1.formation_type)

	if slot2 == 1 then
		slot4 = RoleController:getInstance():getRoleVo()

		slot0:updateHeadInfo(slot0.up_base_info, uv0("[%s]%s", getServerName(slot4.srv_id), slot4.name), slot0.level_id, slot4.look_id, slot4.sex)
	end
end

function ElitematchMatchingWindow.updateEnemyTeamInfo(slot0, slot1, slot2, slot3)
	slot4 = nil
	slot5 = 360

	if slot0.match_type == ElitematchConst.MatchType.eNormalMatch then
		if slot2 == 1 then
			slot4 = slot0.down_right_team_info
			slot0.enemy_team_right_scdata = slot1

			slot0:playVsEffect(true)
			slot0:playFireEffect(true)
			slot0:runDownAction(slot0.down_base_info.half_head, slot0.half_head_x - slot5, slot0.half_head_x)
			slot0:runDownAction(slot0.down_right_team_info.bg, slot0.down_right_x + slot5, slot0.down_right_x)
			slot0:runDownAction(slot0.down_right_team_info.panel, slot0.down_right_x + slot5, slot0.down_right_x)
			slot0.down_base_info.name:setVisible(true)
			slot0.down_base_info.level_icon:setVisible(true)
			slot0.down_base_info.level_icon_1:setVisible(true)
			slot0.down_base_info.sex_icon:setVisible(true)
			slot0.down_base_info.half_head:setVisible(true)
		else
			return
		end
	elseif slot0.match_type == ElitematchConst.MatchType.eKingMatch then
		if slot2 == 1 then
			slot4 = slot0.down_left_team_info
			slot0.enemy_team_left_scdata = slot1

			slot0:playVsEffect(true)
			slot0:playFireEffect(true)
			slot0:runDownAction(slot0.down_left_team_info.bg, slot0.down_left_x - slot5, slot0.down_left_x)
			slot0:runDownAction(slot0.down_left_team_info.panel, slot0.down_left_x - slot5, slot0.down_left_x)
			slot0.down_base_info.name:setVisible(true)
			slot0.down_base_info.level_icon:setVisible(true)
			slot0.down_base_info.level_icon_1:setVisible(true)
			slot0.down_base_info.sex_icon:setVisible(true)
		elseif slot2 == 2 then
			slot4 = slot0.down_right_team_info
			slot0.enemy_team_right_scdata = slot1

			slot0:runDownAction(slot0.down_right_team_info.bg, slot0.down_right_x + slot5, slot0.down_right_x)
			slot0:runDownAction(slot0.down_right_team_info.panel, slot0.down_right_x + slot5, slot0.down_right_x)
		else
			return
		end
	end

	slot4.bg:setVisible(true)
	slot4.panel:setVisible(true)
	slot0:updateFormIcon(slot4, slot1.formation_type)
	slot0:updateHeroInfo(slot4, slot1.partner_infos, slot1.formation_type, true, slot3)
end

function ElitematchMatchingWindow.runDownAction(slot0, slot1, slot2, slot3)
	slot4 = 360

	slot1:setPositionX(slot2)
	slot1:runAction(cc.EaseSineOut:create(cc.MoveTo:create(0.4, cc.p(slot3, slot0.down_y))))
end

function ElitematchMatchingWindow.updateHeadInfo(slot0, slot1, slot2, slot3, slot4, slot5)
	if not slot1 then
		return
	end

	if slot5 then
		slot6 = nil

		loadSpriteTexture(slot1.sex_icon, (slot5 ~= 1 or PathTool.getResFrame("common", "common_sex1")) and PathTool.getResFrame("common", "common_sex0"), LOADTEXT_TYPE_PLIST)
	end

	if slot2 then
		slot1.name:setString(slot2)
	end

	if slot3 and Config.ArenaEliteData.data_elite_level[slot3] then
		slot1.elite_name:setString(slot6.name)

		if slot6.little_ico == nil or slot7 == "" then
			slot7 = "icon_iron"
		end

		slot1.little_item_load = loadSpriteTextureFromCDN(slot1.level_icon, PathTool.getPlistImgForDownLoad("elitematch/elitematch_icon", slot7, false), ResourcesType.single, slot1.little_item_load)

		if slot6.little_name_ico == nil or slot7 == "" then
			slot7 = "num_2_2"
		end

		slot1.little_item_load_1 = loadSpriteTextureFromCDN(slot1.level_icon_1, PathTool.getPlistImgForDownLoad("elitematch/elitematch_icon", slot7, false), ResourcesType.single, slot1.little_item_load_1)
	end

	if slot0.match_type == ElitematchConst.MatchType.eNormalMatch then
		if slot4 then
			if Config.LooksData.data_data[slot4] == nil then
				slot6 = Config.LooksData.data_data[110401]
			end

			if slot6 then
				slot1.item_load = loadSpriteTextureFromCDN(slot1.half_head, PathTool.getPartnerBustRes(slot6.mvp_res), ResourcesType.single, slot1.item_load)
			end
		end
	else
		slot1.half_head:setVisible(false)
	end
end

function ElitematchMatchingWindow.updateFormIcon(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	if slot2 then
		if slot2 < 1 then
			slot2 = 1
		end

		if slot2 > 6 then
			slot2 = 6
		end

		loadSpriteTexture(slot1.form_icon, PathTool.getResFrame("elitematch_matching", "elitematch_form_icon_" .. slot2), LOADTEXT_TYPE_PLIST)
	end
end

function ElitematchMatchingWindow.updateTeamPower(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	if slot2 then
		slot1.fight_label:setNum(slot2)
	end
end

function ElitematchMatchingWindow.updateHeroInfo(slot0, slot1, slot2, slot3, slot4, slot5)
	if not slot1 then
		return
	end

	if Config.FormationData.data_form_data[slot3] then
		slot7 = {
			[slot12.pos] = slot12
		}

		for slot11, slot12 in pairs(slot2) do
			-- Nothing
		end

		for slot11, slot12 in pairs(slot1.hero_item_list) do
			slot12:setVisible(false)
		end

		slot8 = 0

		for slot12, slot13 in ipairs(slot6.pos) do
			slot15 = slot13[2]
			slot16 = nil

			if slot4 then
				if slot7[slot13[1]] and slot16.extra then
					for slot20, slot21 in ipairs(slot16.extra) do
						if slot21.key == 5 then
							slot16.use_skin = slot21.val
						end
					end
				end
			elseif slot7[slot14] then
				slot16 = uv0:getHeroById(slot7[slot14].id)
			end

			if slot16 then
				slot8 = slot8 + (slot16.power or 0)
			end

			if slot1.hero_item_list[slot14] == nil then
				slot1.hero_item_list[slot14] = HeroExhibitionItem.new(0.7, false)

				slot1.panel:addChild(slot1.hero_item_list[slot14])
			else
				slot1.hero_item_list[slot14]:setVisible(true)
			end

			slot1.hero_item_list[slot14]:setPosition(slot1.pos_list[slot15])

			if slot16 then
				slot1.hero_item_list[slot14]:setData(slot16)
				slot1.hero_item_list[slot14]:addCallBack(function ()
					if not uv0 then
						HeroController:getInstance():openHeroTipsPanel(true, uv1)
					end
				end)
			else
				slot1.hero_item_list[slot14]:setData(nil)
			end
		end

		slot0:updateTeamPower(slot1, slot8)
	end
end

function ElitematchMatchingWindow.playMatchEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end

		if slot0.scroll_audio_effect then
			AudioManager:getInstance():removeEffectBySoundId(slot0.scroll_audio_effect)

			slot0.scroll_audio_effect = nil
		end
	else
		if slot0.scroll_audio_effect == nil then
			slot0.scroll_audio_effect = AudioManager:getInstance():playEffectForHandAudoRemove(AudioManager.AUDIO_TYPE.COMMON, "c_scroll", true)
		end

		slot0.play_effect = createEffectSpine("E24161", cc.p(7, -261), cc.p(0.5, 0.5), true, PlayerAction.action)

		slot0.vs_node:addChild(slot0.play_effect, 1)
	end
end

function ElitematchMatchingWindow.playVsEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect1 then
			slot0.play_effect1:clearTracks()
			slot0.play_effect1:removeFromParent()

			slot0.play_effect1 = nil
		end
	else
		slot0.vs_audio_effect = AudioManager:getInstance():playEffect(AudioManager.AUDIO_TYPE.COMMON, "c_vs")
		slot0.play_effect1 = createEffectSpine("E24162", cc.p(0, -10), cc.p(0.5, 0.5), false, PlayerAction.action)

		slot0.vs_node:addChild(slot0.play_effect1, 1)
	end
end

function ElitematchMatchingWindow.playFireEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect2 then
			slot0.play_effect2:clearTracks()
			slot0.play_effect2:removeFromParent()

			slot0.play_effect2 = nil
		end
	else
		slot0.play_effect2 = createEffectSpine("E24163", cc.p(-231, -398), cc.p(0.5, 0.5), false, PlayerAction.action)

		slot0.vs_node:addChild(slot0.play_effect2, 1)
	end
end

function ElitematchMatchingWindow.updateBuyCount(slot0, slot1)
	if not slot0.scdata then
		return
	end

	if Config.ArenaEliteData.data_elite_const.match_count then
		slot0.buy_count:setString(uv0("%s/%s", slot1 or 1, slot3.val))
	end

	if slot0.scdata.day_max_buy_count - (slot0.scdata.day_buy_count or 1) < 0 then
		slot5 = 0
	end

	slot0.buy_tips:setString(string.format(TI18N("<div outline=2,#000000>%s</div><div fontcolor=#3df424 outline=2,#000000>%s</div>"), TI18N("剩余购买次数:"), slot5))
end

function ElitematchMatchingWindow.close_callback(slot0)
	BattleController:getInstance():openBattleView(false)
	MainuiController:getInstance():resetUIFightType()

	if slot0.role_vo ~= nil and slot0.role_assets_event ~= nil then
		slot0.role_vo:UnBind(slot0.role_assets_event)

		slot0.role_assets_event = nil
	end

	if slot0.up_base_info.item_load then
		slot0.up_base_info.item_load:DeleteMe()
	end

	slot0.up_base_info.item_load = nil

	if slot0.down_base_info.item_load then
		slot0.down_base_info.item_load:DeleteMe()
	end

	slot0.down_base_info.item_load = nil

	if slot0.up_base_info.little_item_load then
		slot0.up_base_info.little_item_load:DeleteMe()
	end

	slot0.up_base_info.little_item_load = nil

	if slot0.down_base_info.little_item_load then
		slot0.down_base_info.little_item_load:DeleteMe()
	end

	slot0.down_base_info.little_item_load = nil

	if slot0.up_base_info.little_item_load_1 then
		slot0.up_base_info.little_item_load_1:DeleteMe()
	end

	slot0.up_base_info.little_item_load_1 = nil

	if slot0.down_base_info.little_item_load_1 then
		slot0.down_base_info.little_item_load_1:DeleteMe()
	end

	slot0.down_base_info.little_item_load_1 = nil

	if slot0.up_left_team_info and slot0.up_left_team_info.fight_label then
		slot0.up_left_team_info.fight_label:DeleteMe()

		slot0.up_left_team_info.fight_label = nil
	end

	if slot0.up_right_team_info and slot0.up_right_team_info.fight_label then
		slot0.up_right_team_info.fight_label:DeleteMe()

		slot0.up_right_team_info.fight_label = nil
	end

	slot0:playMatchEffect(false)
	slot0:playVsEffect(false)
	slot0:playFireEffect(false)
	slot0.container:stopAllActions()
	slot0.cool_time:stopAllActions()
	slot0.right_btn_label:stopAllActions()
	uv0:openElitematchMatchingWindow(false)
end
