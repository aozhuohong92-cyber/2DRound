GuildBossMainWindow = GuildBossMainWindow or BaseClass(BaseView)
slot0 = GuildbossController:getInstance()
slot1 = GuildbossController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.remove

function GuildBossMainWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.is_full_screen = false
	slot0.layout_name = "guildboss/guildboss_main_window"
	slot0.monster_list = {}
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0._doubleRewardList = {}
	slot0._currentPassNum = {}
	slot0._doublePassNum = {}
	slot0.item_pool = {}
	slot0.item_list = {}
	slot0.rank_list = {}
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("guildboss", "guildboss"),
			type = ResourcesType.plist
		}
	}
end

function GuildBossMainWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 1)

	slot2 = slot1:getChildByName("main_panel")

	slot2:getChildByName("win_title"):setString(TI18N("公会副本"))
	slot2:getChildByName("challenge_times_title"):setString(TI18N("剩余次数:"))
	slot2:getChildByName("notice_desc"):setString(TI18N("点击选择将要挑战的BOSS"))
	slot2:getChildByName("mail_notice"):setString(TI18N("击杀奖励通过邮件发放"))
	slot2:getChildByName("dps_reward_title"):setString(TI18N("伤害\n奖励"))
	slot2:getChildByName("kill_reward_title"):setString(TI18N("击杀\n奖励"))
	slot2:getChildByName("mail_notice"):setColor(cc.c3b(144, 93, 56))

	slot0.close_btn = slot2:getChildByName("close_btn")
	slot0.explain_btn = slot2:getChildByName("explain_btn")
	slot0.add_btn = slot2:getChildByName("add_btn")
	slot0.rank_btn = slot2:getChildByName("rank_btn")

	slot0.rank_btn:getChildByName("label"):setString(TI18N("排行奖励"))

	slot0.challenge_btn = slot2:getChildByName("challenge_btn")
	slot0.mopup_btn = slot2:getChildByName("mopup_btn")
	slot0.challenge_btn_label = slot0.challenge_btn:getChildByName("label")
	slot0.mopup_btn_label = slot0.mopup_btn:getChildByName("label")

	slot0.challenge_btn_label:setString(TI18N("挑战"))
	slot0.mopup_btn_label:setString(TI18N("扫荡"))

	slot0.muster_btn = slot2:getChildByName("muster_btn")
	slot0.muster_btn_tips = slot0.muster_btn:getChildByName("label")

	slot0.muster_btn_tips:setString(TI18N(""))

	slot0.musterImage = slot2:getChildByName("musterImage")

	slot0.musterImage:setPositionY(slot0.muster_btn:getPositionY() - 43)
	slot0.musterImage:setVisible(false)

	slot0.muster_btn_label = slot0.musterImage:getChildByName("label")
	slot0._doubleReward = slot2:getChildByName("doubleReward")

	slot0._doubleReward:setVisible(false)

	slot0.reset_time_value = createRichLabel(22, 1, cc.p(0, 0.5), cc.p(27, 212))

	slot2:addChild(slot0.reset_time_value)

	slot0.challenge_times_value = slot2:getChildByName("challenge_times_value")
	slot0.chapter_name = slot2:getChildByName("chapter_name")
	slot0.chapter_boss_container = slot2:getChildByName("chapter_boss_container")
	slot0.guild_boss_view = GuildBossPreviewWindow.new()

	slot0.chapter_boss_container:addChild(slot0.guild_boss_view)

	slot0.buff_container = slot2:getChildByName("buff_container")
	slot0.buff_container_pos_x = slot0.buff_container:getPositionX()
	slot0.buff_container_pos_y = slot0.buff_container:getPositionY()
	slot0.buff_name = slot0.buff_container:getChildByName("buff_name")

	slot0.buff_name:setString("")

	slot0.buff_icon = slot0.buff_container:getChildByName("buff_icon")
	slot0.buff_acitive_label = createRichLabel(20, 1, cc.p(0, 0.5), cc.p(215, 22), nil, nil)

	slot0.buff_container:addChild(slot0.buff_acitive_label)

	slot0.comfirm_btn = createButton(slot2, TI18N("激活"), slot0.buff_container_pos_x + 400, slot0.buff_container_pos_y + 22, cc.size(88, 44), PathTool.getResFrame("common", "common_1027"), 24)

	slot0.comfirm_btn:enableOutline(Config.ColorData.data_color4[264], 2)
	slot0.comfirm_btn:setScale(0.9)
	slot0.comfirm_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:checkBuff()
		end
	end)
	slot2:getChildByName("Text_1"):setString(TI18N("剩余购买次数："))

	slot0.remain_buy = slot2:getChildByName("remain_buy")

	slot0.remain_buy:setString("")

	slot0.rank_container = slot2:getChildByName("rank_container")
	slot0.rank_info_btn = slot0.rank_container:getChildByName("rank_btn")
	slot0.rank_btn_label = slot0.rank_btn:getChildByName("label")
	slot6 = "bg"
	slot0.bg = slot2:getChildByName(slot6)

	for slot6 = 1, 1 do
		slot7 = {
			container = slot2:getChildByName("monster_container_" .. slot6)
		}
		slot7.model = slot7.container:getChildByName("monster_model")
		slot7.pass_icon = slot7.container:getChildByName("pass_icon")
		slot7.monster_name = slot7.container:getChildByName("monster_name")
		slot7.progress_container = slot7.container:getChildByName("progress_container")
		slot7.progress = slot7.progress_container:getChildByName("progress")
		slot7.hp_value = slot7.progress_container:getChildByName("hp_value")
		slot7.boss_icon = PlayerHead.new(PlayerHead.type.circle)

		slot7.boss_icon:setAnchorPoint(0.5, 0.5)
		slot7.boss_icon:setScale(0.55)
		slot7.boss_icon:setPosition(45, 330)
		slot7.container:addChild(slot7.boss_icon)

		slot0.monster_conatiner = slot7
	end

	slot0.main_panel = slot2
end

function GuildBossMainWindow.checkBuff(slot0)
	if slot0.base_info then
		if tableLen(Config.GuildDunData.data_buff_data) <= slot0.base_info.buff_lev then
			message(TI18N("buff已满级"))

			return
		end

		slot1 = Config.GuildDunData.data_const.buff_item.val
		slot3 = Config.GuildDunData.data_const.buff_cost.val
		slot4 = Config.ItemData.data_get_data(slot1).icon
		slot6 = Config.GuildDunData.data_buff_data[math.min(slot0.base_info.buff_lev + 1, tableLen(Config.GuildDunData.data_buff_data))].desc
		slot7 = ""
		slot8 = ""

		CommonAlert.show(BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot1) > 0 and (slot0.base_info.buff_lev == 0 and string.format(TI18N("是否使用<img src=%s visible=true scale=0.5 /><div fontColor=#289b14 fontsize= 24>%s</div><div fontColor=#794900>(拥有:</div><div fontColor=#289b14 fontsize= 24>%s</div><div fontColor=#794900>)激活全会伤害提升Buff\n</div>"), PathTool.getItemRes(slot4), 1, slot2) .. string.format(TI18N("<div fontColor=#794900>(激活后效果为</div><div fontColor=#289b14 fontsize= 24>%s</div><div fontColor=#794900>)</div>"), slot6) or string.format(TI18N("是否使用<img src=%s visible=true scale=0.5 /><div fontColor=#289b14 fontsize= 24>%s</div><div fontColor=#794900>(拥有:</div><div fontColor=#289b14 fontsize= 24>%s</div><div fontColor=#794900>)提升全会伤害提升Buff\n</div>"), PathTool.getItemRes(slot4), 1, slot2) .. string.format(TI18N("<div fontColor=#794900>(激活后效果为</div><div fontColor=#289b14 fontsize= 24>%s</div><div fontColor=#794900>)</div>"), slot6)) or slot0.base_info.buff_lev == 0 and string.format(TI18N("是否消耗<img src=%s visible=true scale=0.5 /><div fontColor=#289b14 fontsize= 24>%s</div><div fontColor=#794900>激活全会伤害提升Buff\n</div>"), PathTool.getItemRes(Config.ItemData.data_assets_label2id.gold), slot3, slot2) .. string.format(TI18N("<div fontColor=#794900>(激活后效果为</div><div fontColor=#289b14 fontsize= 24>%s</div><div fontColor=#794900>)</div>"), slot6) or string.format(TI18N("是否消耗<img src=%s visible=true scale=0.5 /><div fontColor=#289b14 fontsize= 24>%s</div><div fontColor=#794900>提升全会伤害提升Buff\n</div>"), PathTool.getItemRes(Config.ItemData.data_assets_label2id.gold), slot3, slot2) .. string.format(TI18N("<div fontColor=#794900>(激活后效果为</div><div fontColor=#289b14 fontsize= 24>%s</div><div fontColor=#794900>)</div>"), slot6), TI18N("确认"), function ()
			uv0:send21305()
		end, TI18N("取消"), nil, CommonAlert.type.rich, nil, nil, nil, true)
	end
end

function GuildBossMainWindow.updateMusterCoolTimeTicket(slot0)
	slot0.remainTime = slot0.remainTime - 1

	if slot0.remainTime <= 0 then
		slot0.musterImage:setVisible(false)
		slot0.muster_btn_tips:setVisible(true)
		slot0.muster_btn_label:stopAllActions()
	end

	slot0.muster_btn_label:setString(string.format(TI18N("%s\n后可集结"), TimeTool.GetTimeFormat(slot0.remainTime)))
end

function GuildBossMainWindow.musterCoolCountTime(slot0, slot1)
	if tolua.isnull(slot0.muster_btn_label) then
		return
	end

	slot0.remainTime = slot1

	slot0.muster_btn_label:stopAllActions()

	if slot0.remainTime > 0 then
		slot0.musterImage:setVisible(true)
		slot0.muster_btn_label:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0.remainTime = uv0.remainTime - 1

			if uv0.remainTime <= 0 then
				uv0.musterImage:setVisible(false)
				uv0.muster_btn_tips:setVisible(true)
				uv0.muster_btn_label:stopAllActions()
			else
				uv0.musterImage:setVisible(true)
				uv0.muster_btn_tips:setVisible(false)
				uv0.muster_btn_label:setString(string.format(TI18N("%s\n后可集结"), TimeTool.GetTimeFormat(uv0.remainTime)))
			end
		end))))
		slot0:updateMusterCoolTimeTicket()
	else
		slot0.musterImage:setVisible(false)
		slot0.muster_btn_label:stopAllActions()
		slot0.muster_btn_tips:setString(TI18N("集结号角"))
	end
end

function GuildBossMainWindow.register_event(slot0)
	slot0.role_vo = RoleController:getInstance():getRoleVo()

	if slot0.role_vo ~= nil and slot0.role_assets_event == nil then
		slot0.role_assets_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "position" then
				-- Nothing
			end
		end)
	end

	if slot0.muster_btn then
		slot0.muster_btn:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()

				if uv0.role_vo.position == 1 or uv0.role_vo.position == 2 then
					CommonAlert.show(string.format(TI18N("发出集结后将会提醒所有会友，且有1小时内不可再发出集结（全会），是否确定发出集结？")), TI18N("确定"), function ()
						uv0:send21323()
					end, TI18N("取消"), nil, CommonAlert.type.common, nil, nil, 24)
				else
					message(TI18N("只有会长、副会长可发出集结"))
				end
			end
		end)
	end

	if slot0._musterCoolTimeEvent == nil then
		slot0._musterCoolTimeEvent = GlobalEvent:getInstance():Bind(GuildbossEvent.MusterCoolTime, function (slot0)
			if uv0.role_vo.position == 1 or uv0.role_vo.position == 2 then
				uv0:musterCoolCountTime(slot0)
			else
				uv0.muster_btn_tips:setString(TI18N("集结号角"))
			end
		end)
	end

	if slot0._doubleTimeEvent == nil then
		slot0._doubleTimeEvent = GlobalEvent:getInstance():Bind(GuildbossEvent.BossActivityDoubleTime, function (slot0)
			uv0:doubleTimeAction(slot0)
		end)
	end

	if slot0.buff_container then
		slot0.buff_container:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0:checkBuff()
			end
		end)
	end

	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openMainWindow(false)
		end
	end)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openMainWindow(false)
		end
	end)
	registerButtonEventListener(slot0.explain_btn, function (slot0, slot1, slot2)
		TipsManager:getInstance():showCommonTips(Config.GuildDunData.data_const.game_rule.desc, slot1:getTouchBeganPosition(), nil, nil, 500)
	end, true, 1)
	slot0.add_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:requestBuyChallengeTimes(FALSE)
		end
	end)
	slot0.rank_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			slot2 = nil

			if uv0.guild_boss_view then
				slot2 = uv0.guild_boss_view:getCurSelect()
			end

			if slot2 and slot2.data then
				uv1:openGuildBossRankWindow(true, slot2.data)
			end
		end
	end)

	if slot0.rank_info_btn then
		slot0.rank_info_btn:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()

				slot2 = nil

				if uv0.guild_boss_view then
					slot2 = uv0.guild_boss_view:getCurSelect()
				end

				uv1:openGuildbossRankRoleWindow(true, slot2)
			end
		end)
	end

	slot0.challenge_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.cur_selected_object and uv0.cur_selected_object.config and uv0.base_info then
				if uv0.base_info.count > 0 then
					HeroController:getInstance():openFormGoFightPanel(true, PartnerConst.Fun_Form.GuildDun_AD, {
						boss_id = uv0.cur_selected_object.config.boss_id
					})
				else
					uv1:requestBuyChallengeTimes(TRUE)
				end
			end
		end
	end)
	slot0.mopup_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.cur_selected_object and uv0.cur_selected_object.config and uv0.base_info then
				uv0:requestMopupMonster()
			end
		end
	end)

	if slot0.update_baseinfo_event == nil then
		slot0.update_baseinfo_event = GlobalEvent:getInstance():Bind(GuildbossEvent.UpdateGuildDunBaseInfo, function ()
			if uv0.guild_boss_view and not tolua.isnull(uv0.guild_boss_view) then
				uv0.guild_boss_view:updateScrollViewList()
			end

			uv0:updateDunBaseInfo()
		end)
	end

	if slot0.update_change_event == nil then
		slot0.update_change_event = GlobalEvent:getInstance():Bind(GuildbossEvent.UpdateChangeStatus, function (slot0)
			uv0:updateChangeStatus(slot0)
		end)
	end

	if slot0.update_rank_event == nil then
		slot0.update_rank_event = GlobalEvent:getInstance():Bind(GuildbossEvent.UpdateGuildDunRank, function ()
			if uv0:getModel():getRaknRoleTopThreeList() and next(slot0 or {}) ~= nil then
				for slot4, slot5 in ipairs(slot0) do
					if not uv1.rank_list[slot4] then
						slot6 = uv1:createSingleRankItem(slot4, slot5)

						uv1.rank_container:addChild(slot6)

						uv1.rank_list[slot4] = slot6
					end

					if uv1.rank_list[slot4] then
						slot6:setPosition(-5, 200 - (slot4 - 1) * slot6:getContentSize().height)
						slot6.label:setString(slot5.name)

						if slot5.all_dps then
							slot6.value:setString("[" .. MoneyTool.GetMoneyString(slot5.all_dps, false) .. TI18N("伤害") .. "]")
						else
							slot6.value:setString("")
						end
					end
				end
			end
		end)
	end

	if slot0.update_challenge_times_event == nil then
		slot0.update_challenge_times_event = GlobalEvent:getInstance():Bind(GuildbossEvent.UpdateGuildBossChallengeTimes, function (slot0)
			if uv0.base_info ~= nil then
				uv0:remainBuyCount(uv0.base_info.buy_count)
				uv0.challenge_times_value:setString(uv0.base_info.count)
			elseif uv1:getBaseInfo() ~= nil then
				uv0:remainBuyCount(slot1.buy_count)
				uv0.challenge_times_value:setString(slot1.count)
			end

			if slot0 == TRUE then
				uv0:autoOpenChallengeWindow()
			end
		end)
	end

	if slot0.update_red_status_event == nil then
		slot0.update_red_status_event = GlobalEvent:getInstance():Bind(GuildEvent.UpdateGuildRedStatus, function (slot0, slot1)
			uv0:updateSomeRedStatus(slot0, slot1)
		end)
	end
end

function GuildBossMainWindow.updateChangeStatus(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = 0
	slot3 = uv0:getBaseInfo()
	slot4 = slot0.monster_conatiner
	slot5 = nil

	if slot1.status == FALSE then
		slot2 = slot3.fid

		if slot3 ~= nil and slot3.info ~= nil then
			slot6 = 0

			for slot10, slot11 in ipairs(slot3.info) do
				if Config.GuildDunData.data_guildboss_list[slot11.boss_id] and slot4 ~= nil then
					slot4.config = slot12
					slot5 = slot11
				end
			end

			if slot3.combat_info then
				for slot10, slot11 in ipairs(slot3.combat_info) do
					if slot4 and slot4.config and slot11.boss_id == slot4.config.boss_id then
						slot4.dps = slot11.dps
					end
				end
			end
		end

		slot0.buff_container:setVisible(true)
		slot0.comfirm_btn:setVisible(true)
	else
		slot2 = slot1.config.id
		slot4.config = slot1.config
		slot5 = {
			hp = 0,
			boss_id = slot1.config.boss_id
		}
		slot4.dps = 0

		slot0.buff_container:setVisible(false)
		slot0.comfirm_btn:setVisible(false)
	end

	if slot2 then
		slot6 = Config.GuildDunData.data_chapter_reward[slot2]
		slot7 = Config.GuildDunData.data_guildboss_list[slot6.show_id]

		if slot6 ~= nil then
			slot0.chapter_name:setString(slot6.chapter_name .. " " .. slot6.chapter_desc)
		end

		slot0:updateBg(slot7.bg_res)
	end

	if slot5 then
		slot0:updateMonsterHPStatus(slot4, slot5)
	end

	if slot4 then
		slot0:updateMonsterInfo(slot4)
		slot0:updateSelectedBtnStatus()
	end
end

function GuildBossMainWindow.createSingleRankItem(slot0, slot1, slot2)
	slot3 = ccui.Layout:create()

	slot3:setAnchorPoint(cc.p(0, 1))
	slot3:setContentSize(cc.size(200, 55))

	slot4 = createSprite(PathTool.getResFrame("common", "common_300" .. slot1), 10, 55, slot3)

	slot4:setAnchorPoint(cc.p(0, 1))
	slot4:setScale(0.5)

	slot3.sp = slot4
	slot5 = createLabel(20, 1, nil, 62, 41, "", slot3)

	slot5:setAnchorPoint(cc.p(0, 0.5))
	slot5:setTextColor(cc.c4b(137, 237, 255, 255))

	slot6 = createLabel(20, 1, nil, 62, 17, TI18N("[45万伤害]"), slot3)

	slot6:setAnchorPoint(cc.p(0, 0.5))
	slot6:setTextColor(cc.c4b(71, 44, 30, 255))

	slot3.label = slot5
	slot3.value = slot6

	return slot3
end

function GuildBossMainWindow.requestMopupMonster(slot0)
	if slot0.base_info == nil then
		return
	end

	if slot0.base_info.count > 0 then
		CommonAlert.show(uv0(TI18N("确定按照上次挑战的伤害量<div fontcolor=#249003>%s</div>扫荡一次吗？"), slot0.cur_selected_object.dps), TI18N("确定"), function ()
			uv0:requestMopupMonster(uv1.cur_selected_object.config.boss_id)
		end, TI18N("取消"), nil, CommonAlert.type.rich)
	elseif Config.GuildDunData.data_buy_count[slot1.buy_count + 1] == nil then
		message(TI18N("当前没有扫荡次数，且购买次数已到达本日上限！"))
	elseif RoleController:getInstance():getRoleVo() then
		if slot4.vip_lev < slot3.vip_lev then
			CommonAlert.show(uv0(TI18N("挑战次数不足，提升至<div fontcolor='#289b14'>vip%s</div>，可增加<div fontcolor='#289b14'>1</div>点次数购买上限！"), slot3.vip_lev), TI18N("我要提升"), function ()
				VipController:getInstance():openVipMainWindow(true, VIPTABCONST.CHARGE)
			end, TI18N("取消"), nil, CommonAlert.type.rich)
		else
			if slot3.expend == nil or #slot5 < 2 then
				return
			end

			if Config.ItemData.data_get_data(slot5[1]) then
				CommonAlert.show(uv0(TI18N("挑战次数不足，是否花费 <img src=%s visible=true scale=0.5 />%s 购买<div fontcolor='#289b14'>1</div>点挑战次数并扫荡？\n(扫荡根据上次的伤害量<div fontcolor=#249003>%s</div>进行结算)"), PathTool.getItemRes(slot6.icon), slot5[2], slot0.cur_selected_object.dps), TI18N("确定"), function ()
					uv0:requestMopupMonster(uv1.cur_selected_object.config.boss_id)
				end, TI18N("取消"), nil, CommonAlert.type.rich)
			end
		end
	end
end

function GuildBossMainWindow.openRootWnd(slot0)
	uv0:requestGuildDunBaseInfo()
	ActivityController:getInstance():setFirstComeGuild(false)
	slot0:updateSomeRedStatus()

	if ActivityController:getInstance():getBossActivityDoubleTime() == true then
		slot0._doubleReward:setVisible(true)
	end
end

function GuildBossMainWindow.updateBuffTime(slot0, slot1)
	if slot1 and slot1 then
		slot0.buff_second = slot1

		if slot0.buff_second <= 0 then
			slot0:clearBuffTimeTicket()
		else
			if slot0.buff_time_ticket == nil then
				slot0.buff_time_ticket = GlobalTimeTicket:getInstance():add(function ()
					uv0:updateBuffTimeTicket()
				end, 1)
			end

			slot0:updateBuffTimeTicket()
		end
	end
end

function GuildBossMainWindow.clearBuffTimeTicket(slot0)
	if slot0.buff_time_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.buff_time_ticket)

		slot0.buff_time_ticket = nil
	end
end

function GuildBossMainWindow.updateBuffTimeTicket(slot0)
	slot0.buff_second = slot0.buff_second - 1

	if slot0.buff_second <= 0 then
		slot0:clearBuffTimeTicket()
	end

	slot0.buff_acitive_label:setString(uv0(TI18N("<div fontcolor=#35ff14>(%s后失效)</div>"), TimeTool.GetTimeFormat(slot0.buff_second)))
	slot0.comfirm_btn:setPositionX(slot0.buff_container_pos_x + slot0.buff_acitive_label:getPositionX() + slot0.buff_acitive_label:getSize().width + slot0.comfirm_btn:getContentSize().width * 0.5 + 10)
end

function GuildBossMainWindow.updateResetTime(slot0, slot1)
end

function GuildBossMainWindow.clearTimeTicket(slot0)
end

function GuildBossMainWindow.updateTimeTicket(slot0)
end

function GuildBossMainWindow.autoOpenChallengeWindow(slot0)
	if slot0.cur_selected_object and slot0.cur_selected_object.config and slot0.base_info and slot0.base_info.count > 0 then
		HeroController:getInstance():openFormGoFightPanel(true, PartnerConst.Fun_Form.GuildDun_AD, {
			boss_id = slot0.cur_selected_object.config.boss_id
		})
	end
end

function GuildBossMainWindow.updateDunBaseInfo(slot0)
	slot0.base_info = uv0:getBaseInfo()

	if slot0.base_info ~= nil and slot1.info ~= nil then
		slot0:remainBuyCount(slot1.buy_count)

		slot2 = 0

		for slot6, slot7 in ipairs(slot1.info) do
			if Config.GuildDunData.data_guildboss_list[slot7.boss_id] and slot0.monster_conatiner ~= nil then
				slot9.config = slot8

				slot0:updateMonsterHPStatus(slot9, slot7)
			end
		end

		if slot1.combat_info then
			for slot6, slot7 in ipairs(slot0.base_info.combat_info) do
				if slot0.monster_conatiner and slot0.monster_conatiner.config and slot7.boss_id == slot0.monster_conatiner.config.boss_id then
					slot0.monster_conatiner.dps = slot7.dps
				end
			end
		end

		slot0.challenge_times_value:setString(slot1.count)

		if slot0.cur_fid ~= slot1.fid then
			slot0.cur_fid = slot1.fid

			if Config.GuildDunData.data_chapter_reward[slot1.fid] ~= nil then
				if slot0.monster_conatiner and slot0.monster_conatiner.boss_icon and Config.GuildDunData.data_guildboss_list[slot3.show_id] then
					slot0.monster_conatiner.boss_icon:setHeadRes(slot4.head_icon)
					slot0:updateBg(slot4.bg_res)
				end

				slot0.chapter_name:setString(slot3.chapter_name .. " " .. slot3.chapter_desc)
				slot0:updateFillRewardsItems(slot3.dps_awrard, slot3.award, slot3.guild_exp)
			end
		end

		delayRun(slot0.main_panel, 8 / display.DEFAULT_FPS, function ()
			uv0:updateMonsterInfo(uv0.monster_conatiner)
		end)
		slot0:selecetMonsterContainer()

		if slot1 ~= nil and slot1.buff_end_time ~= 0 then
			if Config.GuildDunData.data_buff_data[slot1.buff_lev] then
				slot0.buff_name:setString(slot3.desc)
				slot0.buff_acitive_label:setPositionX(slot0.buff_name:getSize().width + slot0.buff_name:getPositionX() + 10)
			end

			if tableLen(Config.GuildDunData.data_buff_data) <= slot1.buff_lev then
				slot0.comfirm_btn:setGrayAndUnClick(true, false)

				if slot0.comfirm_btn:getLabel() then
					slot4:disableEffect(cc.LabelEffect.OUTLINE)
				end
			end

			setChildUnEnabled(false, slot0.buff_container)
			slot0:updateBuffTime(slot1.buff_end_time)
			slot0.buff_container:setVisible(true)
			slot0.comfirm_btn:setVisible(true)
		else
			setChildUnEnabled(true, slot0.buff_container)
			slot0.buff_name:setString(Config.GuildDunData.data_const.des_nobuff.desc)
			slot0.buff_acitive_label:setString("")
			slot0.comfirm_btn:setPositionX(slot0.buff_container_pos_x + slot0.buff_name:getSize().width + slot0.buff_name:getPositionX() + slot0.comfirm_btn:getContentSize().width * 0.5 + 10)
		end

		slot0:updateResetTime(slot1.ref_time)
	end
end

function GuildBossMainWindow.remainBuyCount(slot0, slot1)
	if RoleController:getInstance():getRoleVo() == nil then
		return
	end

	if slot0.remain_buy then
		slot3 = 0

		if Config.GuildDunData.data_buy_count[Config.GuildDunData.data_buy_count_length] then
			slot3 = slot5.count - (slot1 or 0)
		end

		slot0.remain_buy:setString(slot3)
	end
end

function GuildBossMainWindow.updateBg(slot0, slot1)
	if slot0.res_id ~= PathTool.getPlistImgForDownLoad("bigbg/guildboss", slot1) then
		slot0.res_id = slot2
		slot0.item_load = createResourcesLoad(slot0.res_id, ResourcesType.single, function ()
			if not tolua.isnull(uv0.bg) then
				loadSpriteTexture(uv0.bg, uv0.res_id, LOADTEXT_TYPE)
			end
		end, slot0.item_load)
	end
end

function GuildBossMainWindow.updateMonsterInfo(slot0, slot1)
	if slot1 == nil or slot1.config == nil then
		return
	end

	if slot1.boss_id ~= slot1.config.boss_id then
		slot1.boss_id = slot2.boss_id

		slot1.monster_name:setString(slot2.item_name)

		if slot1.spine then
			slot1.spine:DeleteMe()

			slot1.spine = nil
		end

		slot1.spine = BaseRole.new(BaseRole.type.unit, slot2.combat_id, nil, {
			scale = 0.6
		})

		slot1.spine:setAnimation(0, PlayerAction.show, true)
		slot1.spine:setCascade(true)
		slot1.spine:setPosition(90, 0)
		slot1.spine:setAnchorPoint(cc.p(0.5, 0.5))
		slot1.model:addChild(slot1.spine)
	end
end

function GuildBossMainWindow.selecetMonsterContainer(slot0, slot1)
	slot0.cur_selected_object = slot0.monster_conatiner

	slot0:updateSelectedBtnStatus()
end

function GuildBossMainWindow.updateSelectedBtnStatus(slot0)
	if slot0.cur_selected_object == nil then
		return
	end

	if slot0.cur_selected_object.hp == nil or slot0.cur_selected_object.dps == nil then
		return
	end

	if slot0.cur_selected_object.hp == 0 then
		slot0.challenge_btn:setTouchEnabled(false)
		setChildUnEnabled(true, slot0.challenge_btn)
		slot0.challenge_btn_label:disableEffect()
		slot0.mopup_btn:setTouchEnabled(false)
		setChildUnEnabled(true, slot0.mopup_btn)
		slot0.mopup_btn_label:disableEffect()
	elseif slot0.cur_selected_object.dps == 0 then
		slot0.mopup_btn:setTouchEnabled(false)
		slot0.mopup_btn_label:disableEffect()
		setChildUnEnabled(true, slot0.mopup_btn)
		slot0.challenge_btn:setTouchEnabled(true)
		slot0.challenge_btn_label:enableOutline(Config.ColorData.data_color4[264], 2)
		setChildUnEnabled(false, slot0.challenge_btn)
	else
		slot0.mopup_btn:setTouchEnabled(true)
		slot0.challenge_btn_label:enableOutline(Config.ColorData.data_color4[264], 2)
		setChildUnEnabled(false, slot0.mopup_btn)
		slot0.challenge_btn:setTouchEnabled(true)
		slot0.challenge_btn_label:enableOutline(Config.ColorData.data_color4[264], 2)
		setChildUnEnabled(false, slot0.challenge_btn)
		slot0.mopup_btn_label:enableOutline(Config.ColorData.data_color4[263], 2)
	end
end

function GuildBossMainWindow.updateMonsterHPStatus(slot0, slot1, slot2)
	if slot1 == nil or slot2 == nil or slot1.config == nil then
		return
	end

	if slot2.hp <= 0 then
		slot0:doubleTimeAction(false)
	elseif ActivityController:getInstance():getBossActivityDoubleTime() == true then
		slot0:doubleTimeAction(true)
	end

	slot4 = math.ceil(100 * slot2.hp / slot1.config.hp)

	slot1.hp_value:setString(slot4 .. "%")
	slot1.progress:setPercent(slot4)

	slot1.hp = slot2.hp

	slot1.pass_icon:setVisible(slot2.hp == 0)
	slot1.boss_icon:setVisible(slot2.hp ~= 0)
	slot1.monster_name:setVisible(slot2.hp ~= 0)
	slot1.progress_container:setVisible(slot2.hp ~= 0)
end

function GuildBossMainWindow.doubleTimeAction(slot0, slot1)
	if slot1 == false then
		slot0._doubleReward:setVisible(slot1)
		slot0._doubleReward:stopAllActions()

		if next(slot0._doubleRewardList) ~= nil then
			for slot5, slot6 in pairs(slot0._doubleRewardList) do
				slot6:setSpecialColor()
				slot6:setSpecialNum(slot0._currentPassNum[slot5])
				slot6:setDoubleIcon(false)
			end
		end

		return
	end

	slot0._doubleReward:setVisible(slot1)
	slot0._doubleReward:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.FadeOut:create(1), cc.FadeIn:create(1), cc.DelayTime:create(0.3))))

	if next(slot0._doubleRewardList) ~= nil then
		for slot6, slot7 in pairs(slot0._doubleRewardList) do
			slot7:setSpecialColor(true)
			slot7:setSpecialNum(slot0._doublePassNum[slot6])
			slot7:setDoubleIcon(true)
		end
	end
end

function GuildBossMainWindow.updateFillRewardsItems(slot0, slot1, slot2, slot3)
	slot1 = slot1 or {}

	uv0(DeepCopy(slot2 or {}), {
		Config.ItemData.data_assets_label2id.guild_exp,
		slot3 or 0
	})

	for slot8, slot9 in ipairs(slot0.item_list) do
		slot9:setVisible(false)
		uv0(slot0.item_pool, slot9)
	end

	slot0.item_list = {}
	slot5 = nil
	slot6 = 1
	slot7 = nil
	slot8 = 0
	slot9 = 120
	slot10 = 0.8
	slot11 = nil

	for slot15, slot16 in ipairs(slot1) do
		if #slot0.item_pool == 0 then
			slot0.main_panel:addChild(BackPackItem.new(false, true, false, slot10, false))
		else
			uv1(slot0.item_pool, 1):setVisible(true)
		end

		slot7:setDefaultTip()
		slot7:setPosition(100 + (slot6 - 1) * (BackPackItem.Width * slot10 + 14) + BackPackItem.Width * slot10 * 0.5, slot9)
		slot7:setBaseData(slot16[1], 0)

		slot11 = (slot16[2] < 1000 or uv2("%sK", math.floor(slot16[2] * 0.001))) and slot16[2]

		if slot16[3] then
			slot11 = (slot16[3] < 1000 or uv2("%s", slot11)) and uv2("%s", slot11)
		end

		slot7:setSpecialNum(slot11)
		slot7:setSpecialColor()

		slot0._currentPassNum[slot15] = slot11

		if not slot0._doubleRewardList[slot15] then
			slot0._doubleRewardList[slot15] = slot7
			slot17 = nil
			slot17 = (slot16[2] * 2 < 1000 or uv2("%sK", math.floor(slot16[2] * 2 * 0.001))) and slot16[2] * 2

			if slot16[3] then
				slot17 = (slot16[3] * 2 < 1000 or uv2("%s", slot17)) and uv2("%s", slot17)
			end

			slot0._doublePassNum[slot15] = slot17
		end

		uv0(slot0.item_list, slot7)

		slot6 = slot6 + 1
	end

	if ActivityController:getInstance():getBossActivityDoubleTime() == true then
		slot0:doubleTimeAction(true)
	end

	slot6 = 1

	for slot15, slot16 in ipairs(slot4) do
		if type(slot16) == "table" and slot16[1] and slot16[2] then
			if #slot0.item_pool == 0 then
				slot0.main_panel:addChild(BackPackItem.new(false, true, false, slot10, false))
			else
				uv1(slot0.item_pool, 1):setVisible(true)
			end

			slot7:setDefaultTip()
			slot7:setPosition(415 + (slot6 - 1) * (BackPackItem.Width * slot10 + 14) + BackPackItem.Width * slot10 * 0.5, slot9)
			slot7:setBaseData(slot16[1], slot16[2])
			uv0(slot0.item_list, slot7)

			slot6 = slot6 + 1
		end
	end
end

function GuildBossMainWindow.updateSomeRedStatus(slot0, slot1, slot2)
	slot3 = false

	if slot1 == nil then
		-- Nothing
	elseif slot1 == GuildConst.red_index.boss_times then
		-- Nothing
	end
end

function GuildBossMainWindow.getType(slot0, slot1)
	if slot1 == 1 then
		return GuildBossConst.type.physics
	else
		return GuildBossConst.type.magic
	end
end

function GuildBossMainWindow.close_callback(slot0)
	if next(slot0._doubleRewardList) ~= nil then
		for slot4, slot5 in ipairs(slot0._doubleRewardList) do
			if slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end

		slot0._doubleRewardList = nil
	end

	slot0:clearTimeTicket()
	slot0:clearBuffTimeTicket()

	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	for slot4, slot5 in ipairs(slot0.monster_list) do
		if slot5.spine then
			slot5.spine:DeleteMe()

			slot5.spine = nil
		end
	end

	slot0.monster_list = nil

	for slot4, slot5 in pairs(slot0.item_list) do
		if slot5.DeleteMe then
			slot5:DeleteMe()
		end
	end

	slot0.item_list = nil

	for slot4, slot5 in ipairs(slot0.item_pool) do
		slot5:DeleteMe()
	end

	if slot0.guild_boss_view and not tolua.isnull(slot0.guild_boss_view) then
		slot0.guild_boss_view:DeleteMe()
	end

	slot0.item_pool = nil

	if slot0.role_vo ~= nil then
		if slot0.role_assets_event ~= nil then
			slot0.role_vo:UnBind(slot0.role_assets_event)

			slot0.role_assets_event = nil
		end

		slot0.role_vo = nil
	end

	if slot0.update_baseinfo_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_baseinfo_event)

		slot0.update_baseinfo_event = nil
	end

	if slot0.update_challenge_times_event then
		GlobalEvent:getInstance():UnBind(slot0.update_challenge_times_event)

		slot0.update_challenge_times_event = nil
	end

	if slot0.update_red_status_event then
		GlobalEvent:getInstance():UnBind(slot0.update_red_status_event)

		slot0.update_red_status_event = nil
	end

	if slot0.update_change_event then
		GlobalEvent:getInstance():UnBind(slot0.update_change_event)

		slot0.update_change_event = nil
	end

	if slot0.update_rank_event then
		GlobalEvent:getInstance():UnBind(slot0.update_rank_event)

		slot0.update_rank_event = nil
	end

	if slot0._musterCoolTimeEvent then
		GlobalEvent:getInstance():UnBind(slot0._musterCoolTimeEvent)

		slot0._musterCoolTimeEvent = nil
	end

	if slot0._doubleTimeEvent then
		GlobalEvent:getInstance():UnBind(slot0._doubleTimeEvent)

		slot0._doubleTimeEvent = nil
	end

	uv0:openMainWindow(false)
end
