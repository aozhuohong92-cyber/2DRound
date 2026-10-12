GuildsecretareaMainWindow = GuildsecretareaMainWindow or BaseClass(BaseView)
slot1 = GuildsecretareaController:getInstance():getModel()
slot2 = string.format
slot3 = table.sort
slot4 = table.insert

function GuildsecretareaMainWindow.__init(slot0)
	slot0.win_type = WinType.Full
	slot0.is_full_screen = true
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("guildsecretarea", "guildsecretarea"),
			type = ResourcesType.plist
		}
	}
	slot0.layout_name = "guildsecretarea/guildsecretarea_main_window"
	slot0.box_list = {}
	slot0.skill_item_list = {}
	slot0.rank_list = {}
	slot0.my_guild_info = GuildController:getInstance():getModel():getMyGuildInfo()
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.boss_reset_interval = 172800

	if Config.GuildSecretAreaData.data_const.boss_reset_interval then
		slot0.boss_reset_interval = slot1.val
	end

	slot0.player_reset_interval = 172800

	if Config.GuildSecretAreaData.data_const.player_reset_interval then
		slot0.player_reset_interval = slot2.val
	end
end

function GuildsecretareaMainWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale() or 1)

	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot0.container, 1)

	slot0.container_size = slot0.container:getContentSize()
	slot0.close_btn = slot0.container:getChildByName("close_btn")
	slot0.top_panel = slot0.container:getChildByName("top_panel")
	slot0.bottom_panel = slot0.container:getChildByName("bottom_panel")
	slot0.rank_container = slot0.top_panel:getChildByName("rank_container")
	slot0.rank_info_btn = createRichLabel(22, cc.c4b(131, 231, 115, 255), cc.p(0.5, 0.5), cc.p(104, 16))

	slot0.rank_info_btn:setString(uv0("<div outline=2,#220101 href=xxx>%s</div>", TI18N("查看详情")))
	slot0.rank_info_btn:addTouchLinkListener(function (slot0, slot1, slot2, slot3)
		uv0:onClickRankBtn()
	end, {
		"click",
		"href"
	})
	slot0.rank_container:addChild(slot0.rank_info_btn)
	slot0.rank_container:getChildByName("rank_desc_label"):setString(TI18N("伤害排行前三"))

	slot0.look_btn = slot0.top_panel:getChildByName("look_btn")
	slot0.name = slot0.top_panel:getChildByName("name")
	slot0.hand_key = slot0.top_panel:getChildByName("hand_key")

	slot0.hand_key:setString(TI18N("当前难度:"))

	slot0.hand_value = slot0.top_panel:getChildByName("hand_value")
	slot0.hero_icon = slot0.bottom_panel:getChildByName("hero_icon")

	slot0.hero_icon:setPositionY(slot0.hero_icon:getPositionY() - 50)

	slot0.bottom_bg = slot0.bottom_panel:getChildByName("bottom_bg")
	slot0.action_btn = slot0.bottom_panel:getChildByName("action_btn")
	slot0.box_btn = createRichLabel(22, cc.c4b(71, 44, 30, 255), cc.p(0.5, 0.5), cc.p(630, 360))

	slot0.box_btn:setString(uv0("<div href=xxx>%s</div>", TI18N("查看全部")))
	slot0.box_btn:addTouchLinkListener(function (slot0, slot1, slot2, slot3)
		uv0:onClickBoxBtn()
	end, {
		"click",
		"href"
	})
	slot0.bottom_panel:addChild(slot0.box_btn)

	slot0.left_btn = slot0.bottom_panel:getChildByName("left_btn")
	slot0.right_btn = slot0.bottom_panel:getChildByName("right_btn")
	slot0.progress_container = slot0.bottom_panel:getChildByName("progress_container")
	slot0.progress = slot0.progress_container:getChildByName("progress")
	slot0.progress_container_size = slot0.progress_container:getContentSize()
	slot0.skill_container = slot0.bottom_panel:getChildByName("skill_container")
	slot0.skill_container_size = slot0.skill_container:getContentSize()

	slot0.skill_container:setScrollBarEnabled(false)

	slot0.item_container = slot0.bottom_panel:getChildByName("item_container")

	slot0.item_container:setScrollBarEnabled(false)

	slot0.less_time = createRichLabel(22, cc.c4b(71, 44, 30, 255), cc.p(0.5, 0.5), cc.p(132, 224), nil, nil, 720)

	slot0.bottom_panel:addChild(slot0.less_time)

	slot0.cost_label = createRichLabel(22, cc.c4b(71, 44, 30, 255), cc.p(0.5, 0.5), cc.p(360, 308), nil, nil, 720)

	slot0.bottom_panel:addChild(slot0.cost_label)

	slot2 = slot0.bottom_panel:getChildByName("buy_panel")

	slot2:getChildByName("key"):setString(TI18N("挑战次数:"))

	slot0.buy_count = slot2:getChildByName("label")
	slot0.buy_btn = slot2:getChildByName("add_btn")
	slot0.buy_tips = createRichLabel(20, cc.c4b(255, 248, 191, 255), cc.p(0.5, 0.5), cc.p(0, -20), nil, nil, 600)

	slot2:addChild(slot0.buy_tips)

	slot0.checkbox = slot0.bottom_panel:getChildByName("checkbox")

	slot0.checkbox:getChildByName("name"):setString(TI18N("跳过战斗"))
	slot0.checkbox:setSelected(false)
	slot0.checkbox:setVisible(false)

	slot0.reward_tips = slot0.bottom_panel:getChildByName("reward_tips")

	slot0.reward_tips:setString(TI18N([[
玩
法
奖
励]]))

	slot0.fight_btn = slot0.bottom_panel:getChildByName("fight_btn")
	slot0.fight_btn_label = slot0.fight_btn:getChildByName("label")

	slot0:adaptationScreen()
end

function GuildsecretareaMainWindow.adaptationScreen(slot0)
	slot2 = display.getBottom(slot0.container)
	slot3 = display.getLeft(slot0.container)
	slot4 = display.getRight(slot0.container)

	slot0.top_panel:setPositionY(display.getTop(slot0.container) - (slot0.container_size.height - slot0.top_panel:getPositionY()))
	slot0.bottom_panel:setPositionY(slot2 + slot0.bottom_panel:getPositionY())
	slot0.close_btn:setPositionY(slot2 + slot0.close_btn:getPositionY())
end

function GuildsecretareaMainWindow.setBackgroundImg(slot0, slot1)
	if not slot1 then
		return
	end

	slot3 = PathTool.getPlistImgForDownLoad("bigbg/guildsecretarea", "secret_area_boss_" .. slot1, true)

	if slot0.record_hero_res == nil or slot0.record_hero_res ~= slot3 then
		slot0.record_hero_res = slot3
		slot0.item_load_icon = loadSpriteTextureFromCDN(slot0.hero_icon, slot3, ResourcesType.single, slot0.item_load_icon)
	end

	slot5 = PathTool.getPlistImgForDownLoad("bigbg/guildsecretarea", "secret_area_boss_bottom_" .. slot1, true)

	if slot0.record_bottom_bg_res == nil or slot0.record_bottom_bg_res ~= slot5 then
		slot0.record_bottom_bg_res = slot5
		slot0.item_load_bg = loadSpriteTextureFromCDN(slot0.bottom_bg, slot5, ResourcesType.single, slot0.item_load_bg)
	end
end

function GuildsecretareaMainWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), true, 2)
	registerButtonEventListener(slot0.look_btn, handler(slot0, slot0.onClickRuleBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.action_btn, handler(slot0, slot0.onClickActionBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.left_btn, handler(slot0, slot0.onClickLeftBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.right_btn, handler(slot0, slot0.onClickRigthBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.buy_btn, handler(slot0, slot0.onClickBuyCountBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.fight_btn, function ()
		uv0.is_show_continue_tips = false

		uv0:onClickFightBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	slot0.checkbox:addEventListener(function (slot0, slot1)
		playButtonSound2()

		if not uv0.scdata then
			return
		end

		if uv0.scdata.hp > 0 then
			if uv0.checkbox:isSelected() then
				uv0.fight_btn_label:setString(TI18N("扫 荡"))
			else
				uv0.fight_btn_label:setString(TI18N("挑 战"))
			end
		else
			uv0.fight_btn_label:setString(TI18N("追 击"))
		end
	end)
	slot0:addGlobalEvent(GuildsecretareaEvent.GUILD_SECRET_AREA_MAIN_EVENT, function (slot0)
		if not slot0 then
			return
		end

		uv0:setScData(slot0)
	end)
	slot0:addGlobalEvent(GuildsecretareaEvent.GUILD_SECRET_AREA_RANK_COUNT_EVENT, function (slot0)
		if not slot0 then
			return
		end

		if not uv0.boss_config then
			return
		end

		if uv0.boss_config.id == slot0.boss_id then
			uv0:updateRankInfo()
		end
	end)
	slot0:addGlobalEvent(GuildsecretareaEvent.TERM_BEGINS_RECEIVE_REWARD_EVENT, function (slot0)
		if not slot0 then
			return
		end

		if not uv0.scdata then
			return
		end

		if not uv0.select_pass_id then
			return
		end

		uv0.dic_progress_reward[slot0.number] = true

		if uv0.scdata.bid ~= 0 and uv0.select_pass_id == uv0.pass_id then
			uv0:updateProgressInfo(uv0.scdata.hp * 100 / uv0.scdata.max_hp, uv0.dic_progress_reward)
		end
	end)
	slot0:addGlobalEvent(GuildsecretareaEvent.GUILD_SECRET_AREA_REFRESH_RANK_EVENT, function ()
		if not uv0.scdata then
			return
		end

		uv1:sender26806(uv0.scdata.bid, 0)
	end)
	slot0:addGlobalEvent(GuildsecretareaEvent.GUILD_SECRET_AREA_BUY_COUNT_EVENT, function (slot0)
		if not slot0 then
			return
		end

		if not uv0.scdata then
			return
		end

		uv0.scdata.count = slot0.count
		uv0.scdata.last_buy_time = slot0.last_buy_time

		uv0:updateBuyCount()

		if uv0.is_send_matching then
			uv0.is_send_matching = false

			uv0:onClickFightBtn(true)
		end
	end)
	slot0:addGlobalEvent(GuildEvent.UpdataGuildGoalSingleTaskData, function (slot0)
		GuildsecretareaController:getInstance():sender26810()
	end)

	if slot0.my_guild_info ~= nil and slot0.my_guild_info ~= nil and slot0.update_guild_event == nil then
		slot0.update_guild_event = slot0.my_guild_info:Bind(GuildEvent.UpdateMyInfoEvent, function (slot0, slot1)
			if slot0 == "vitality" then
				uv0:updateActiveInfo()
			end
		end)
	end
end

function GuildsecretareaMainWindow.onClickCloseBtn(slot0)
	uv0:openGuildsecretareaMainWindow(false)
end

function GuildsecretareaMainWindow.onClickRuleBtn(slot0)
	MainuiController:getInstance():openCommonExplainView(true, Config.GuildSecretAreaData.data_explain)
end

function GuildsecretareaMainWindow.onClickActionBtn(slot0)
	GuildController:getInstance():openGuildActionGoalWindow(true)
end

function GuildsecretareaMainWindow.onClickBoxBtn(slot0)
	if not slot0.select_boss_id then
		return
	end

	uv0:openGuildsecretareaRewardWindow(true, slot0.select_boss_id)
end

function GuildsecretareaMainWindow.onClickLeftBtn(slot0)
	if not slot0.boss_list then
		return
	end

	if not slot0.select_boss_index then
		return
	end

	if #slot0.boss_list == 0 then
		return
	end

	slot0.select_boss_index = slot0.select_boss_index - 1

	if slot0.select_boss_index <= 0 then
		slot0.select_boss_index = #slot0.boss_list
	end

	slot0:updateBossInfoByBossID(slot0.select_boss_index)
end

function GuildsecretareaMainWindow.onClickRigthBtn(slot0)
	if not slot0.boss_list then
		return
	end

	if not slot0.select_boss_index then
		return
	end

	if #slot0.boss_list == 0 then
		return
	end

	slot0.select_boss_index = slot0.select_boss_index + 1

	if slot0.select_boss_index > #slot0.boss_list then
		slot0.select_boss_index = 1
	end

	slot0:updateBossInfoByBossID(slot0.select_boss_index)
end

function GuildsecretareaMainWindow.onClickRankBtn(slot0)
	if not slot0.boss_config then
		return
	end

	RankController:getInstance():openSingleRankMainWindow(true, {
		rank_type = RankConstant.RankType.guild_secretarea,
		title_name = TI18N("排行榜"),
		background_path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_2", true),
		boss_id = slot0.boss_config.id
	})
end

function GuildsecretareaMainWindow.onClickBuyCountBtn(slot0, slot1)
	if not slot0.scdata then
		return
	end

	if slot0.scdata.bid == 0 then
		message(TI18N("该boss还未开启哦~"))

		return
	end

	if slot0.scdata.end_time < GameNet:getInstance():getTime() then
		if slot0.fight_config then
			if slot0.player_reset_interval - slot0.fight_config.time + slot0.scdata.end_time - GameNet:getInstance():getTime() < 0 then
				slot2 = 0
			end

			message(uv0(TI18N("距离讨伐机会重置还有%s，请耐心等待"), TimeTool.GetTimeFormatDayIIIIII(slot2)))
		end

		return
	end

	if slot0.scdata.last_buy_time <= 0 then
		if slot1 then
			message(TI18N("已达到本次讨伐挑战次数上限"))
		else
			message(TI18N("购买次数已达上限"))
		end

		return
	end

	if slot0.scdata.loss_list and next(slot0.scdata.loss_list) ~= nil then
		slot5 = nil

		if slot1 then
			if slot0.scdata.dps > 0 and slot0.checkbox:isSelected() then
				if slot0.scdata.hp > 0 then
					slot5 = uv0(TI18N("挑战次数不足, 是否花费 <img src='%s' scale=0.3 /> %s购买一次挑战次数？并扫荡根据上次的伤害量<div fontcolor=#249003>%s</div>进行结算"), PathTool.getItemRes(Config.ItemData.data_get_data(slot0.scdata.loss_list[1].loss_id).icon), slot0.scdata.loss_list[1].num, slot0.scdata.dps)
				else
					if slot0:isShowContinueTips() then
						return
					end

					slot5 = uv0(TI18N("挑战次数不足, 是否花费 <img src='%s' scale=0.3 /> %s购买一次挑战次数？并追击根据上次的伤害量<div fontcolor=#249003>%s</div>进行结算"), slot4, slot3, slot0.scdata.dps)
				end
			else
				if slot0.scdata.hp <= 0 and slot0:isShowContinueTips() then
					return
				end

				slot5 = uv0(TI18N("挑战次数不足, 是否花费 <img src='%s' scale=0.3 /> %s购买一次挑战次数？"), slot4, slot3)
			end
		else
			slot5 = uv0(TI18N("是否花费 <img src='%s' scale=0.3 /> %s购买一次挑战次数？"), slot4, slot3)
		end

		CommonAlert.show(slot5, TI18N("确定"), function ()
			if uv0.scdata.bid ~= 0 then
				uv0.is_send_matching = uv1

				uv2:sender26803(uv0.scdata.bid)
			end
		end, TI18N("取消"), nil, CommonAlert.type.rich)
	end
end

function GuildsecretareaMainWindow.onClickFightBtn(slot0, slot1)
	if not slot0.scdata then
		return
	end

	if not slot0.select_pass_id then
		return
	end

	if not slot0.my_guild_info then
		return
	end

	if not slot0.role_vo then
		return
	end

	if not slot0.boss_config then
		return
	end

	if slot0.scdata.bid == 0 or slot0.is_start_fight then
		if slot0.role_vo.position == GuildConst.post_type.member then
			message(TI18N("需要会长或者副会长消耗公会活跃开启"))

			return
		end

		if slot0.my_guild_info.vitality < slot0.boss_config.active then
			message(TI18N("所需公会活跃不足"))

			return
		end

		CommonAlert.show(uv0(TI18N("确定消耗<div fontcolor=#249003>%s</div>点公会活跃开始讨伐<div fontcolor=#249003>%s</div>吗？"), slot0.boss_config.active, slot0.boss_config.name), TI18N("确定"), function ()
			uv0:sender26801(uv1.select_boss_id)
		end, TI18N("取消"), nil, CommonAlert.type.rich, nil, {
			extend_offy = -5,
			off_y = 43,
			title = TI18N("开始讨伐"),
			extend_str = TI18N("(直到讨伐时间结束都无法讨伐其他boss)"),
			extend_aligment = cc.TEXT_ALIGNMENT_CENTER
		}, nil, nil)
	else
		if slot0.scdata.end_time < GameNet:getInstance():getTime() then
			if slot0.fight_config then
				if slot0.player_reset_interval - slot0.fight_config.time + slot0.scdata.end_time - GameNet:getInstance():getTime() < 0 then
					slot2 = 0
				end

				message(uv0(TI18N("距离讨伐机会重置还有%s，请耐心等待"), TimeTool.GetTimeFormatDayIIIIII(slot2)))
			end

			return
		elseif slot0.scdata.bid ~= 0 and slot0.select_pass_id ~= slot0.pass_id and not slot0.is_start_fight then
			message(TI18N("讨伐其他boss中"))

			return
		end

		if slot0.scdata.count <= 0 then
			slot0:onClickBuyCountBtn(true)

			return
		end

		if slot0.scdata.dps > 0 and slot0.checkbox:isSelected() then
			if slot1 then
				uv1:sender26805(slot0.select_boss_id)
			else
				slot3 = nil

				if slot0.scdata.hp > 0 then
					slot3 = uv0(TI18N("确定按照上次挑战的伤害量<div fontcolor=#249003>%s</div>扫荡一次吗？"), slot0.scdata.dps)
				else
					if slot0:isShowContinueTips() then
						return
					end

					slot3 = uv0(TI18N("确定按照上次挑战的伤害量<div fontcolor=#249003>%s</div>追击一次吗？"), slot0.scdata.dps)
				end

				CommonAlert.show(slot3, TI18N("确定"), function ()
					uv0:sender26805(uv1.select_boss_id)
				end, TI18N("取消"), nil, CommonAlert.type.rich)
			end
		else
			if slot0.scdata.hp <= 0 and slot0:isShowContinueTips() then
				return
			end

			HeroController:getInstance():openFormGoFightPanel(true, PartnerConst.Fun_Form.GuildSecretArea, {
				boss_id = slot0.select_boss_id
			})
		end
	end
end

function GuildsecretareaMainWindow.isShowContinueTips(slot0)
	return false
end

function GuildsecretareaMainWindow.openRootWnd(slot0, slot1)
	slot2 = slot1 or {}

	uv0:sender26800()
	uv0:sender26810()
end

function GuildsecretareaMainWindow.setScData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.scdata = slot1
	slot0.boss_list = slot0.scdata.boss_list

	if next(slot0.boss_list) == nil then
		return
	end

	slot5 = SortTools.KeyLowerSorter

	uv0(slot0.boss_list, slot5("boss_id"))

	for slot5, slot6 in ipairs(slot0.boss_list) do
		if Config.GuildSecretAreaData.data_boss_info(slot6.boss_id) then
			slot6.config = slot7
			slot6.pass_id = slot7.pass_id
		end
	end

	if slot0.scdata.bid ~= 0 then
		slot0.fight_config = Config.GuildSecretAreaData.data_boss_info(slot0.scdata.bid)

		if slot0.fight_config then
			slot0.pass_id = slot0.fight_config.pass_id
		else
			slot0.pass_id = 1
		end
	end

	if slot0.select_boss_index == nil then
		if slot0.scdata.bid == 0 then
			slot0.select_boss_index = 1
		else
			for slot5, slot6 in ipairs(slot0.boss_list) do
				if slot0.pass_id == slot6.pass_id then
					slot0.select_boss_index = slot5

					break
				end
			end
		end

		if slot0.select_boss_index == nil then
			slot0.select_boss_index = 1
		end
	end

	slot0.dic_progress_reward = {}

	for slot5, slot6 in ipairs(slot0.scdata.progress_reward) do
		slot0.dic_progress_reward[slot6.order] = true
	end

	slot0:checkBossStatus()
	slot0:updateBossInfoByBossID(slot0.select_boss_index)
	slot0:updateBuyCount()
end

function GuildsecretareaMainWindow.updateBuyCount(slot0)
	if not slot0.scdata then
		return
	end

	if Config.GuildSecretAreaData.data_const.guild_secret_free_time then
		slot0.buy_count:setString(uv0("%s/%s", slot0.scdata.count or 1, slot2.val))
	end

	slot0.buy_tips:setString(string.format(TI18N("<div outline=2,#000000>%s</div><div fontcolor=#3df424 outline=2,#000000>%s</div>"), TI18N("剩余购买次数:"), slot0.scdata.last_buy_time or 0))
end

function GuildsecretareaMainWindow.updateBossInfoByBossID(slot0, slot1)
	if not slot0.scdata then
		return
	end

	if not slot1 then
		return
	end

	if not slot0.boss_list[slot1] then
		return
	end

	slot0.select_boss_id = slot0.boss_list[slot1].boss_id
	slot0.select_pass_id = slot0.boss_list[slot1].pass_id
	slot0.boss_config = Config.GuildSecretAreaData.data_boss_info(slot0.select_boss_id)

	if not slot0.boss_config then
		return
	end

	slot0:updateSkillInfo()
	slot0:updateRankInfo()

	slot0.item_list = commonShowSingleRowItemList(slot0.item_container, slot0.item_list, slot0.boss_config.boss_reward or {}, {
		scale = 0.9,
		max_count = 4,
		is_center = true
	})

	slot0.name:setString(slot0.boss_config.name)
	slot0.hand_value:setString(slot0.boss_config.difficulty)
	slot0:setBackgroundImg(slot0.boss_config.pass_id)

	if slot0.scdata.bid ~= 0 and slot0.select_pass_id == slot0.pass_id then
		slot0.cost_label:setVisible(false)
		slot0:updateProgressInfo(slot0.scdata.hp * 100 / slot0.scdata.max_hp, slot0.dic_progress_reward)

		if slot0.is_start_fight then
			doStopAllActions(slot0.less_time)
			slot0.cost_label:setVisible(true)
			slot0:updateActiveInfo()
			slot0:setTimeFormatString(slot0.boss_config.time)
			slot0.checkbox:setVisible(false)
			slot0.fight_btn_label:setString(TI18N("开始讨伐"))
			setChildUnEnabled(false, slot0.fight_btn)
			slot0.fight_btn_label:enableOutline(cc.c4b(2, 0, 25, 255), 2)
		else
			if slot0.scdata.end_time - GameNet:getInstance():getTime() <= 0 then
				slot5 = 0
			end

			if slot5 > 0 then
				commonCountDownTime(slot0.less_time, slot5, {
					callback = function (slot0)
						uv0:setTimeFormatString(slot0)
					end
				})

				if slot0.scdata.dps and slot0.scdata.dps > 0 then
					slot0.checkbox:setVisible(true)
				else
					slot0.checkbox:setVisible(false)
				end

				if slot0.scdata.hp > 0 then
					if slot0.checkbox:isSelected() then
						slot0.fight_btn_label:setString(TI18N("扫 荡"))
					else
						slot0.fight_btn_label:setString(TI18N("挑 战"))
					end
				else
					slot0.fight_btn_label:setString(TI18N("追 击"))
				end

				setChildUnEnabled(false, slot0.fight_btn)
				slot0.fight_btn_label:enableOutline(cc.c4b(2, 0, 25, 255), 2)
			else
				if slot0.fight_config then
					if slot0.boss_reset_interval - slot0.fight_config.time + slot0.scdata.end_time - GameNet:getInstance():getTime() < 0 then
						slot6 = 0
					end

					commonCountDownTime(slot0.less_time, slot6, {
						callback = function (slot0)
							uv0:setTimeFormatString(slot0, 2)
						end
					})
				end

				slot0.cost_label:setVisible(true)
				slot0:updateActiveInfo()
				slot0.fight_btn_label:setString(TI18N("开始讨伐"))
				slot0.fight_btn_label:disableEffect(cc.LabelEffect.OUTLINE)
				setChildUnEnabled(true, slot0.fight_btn)
			end
		end
	else
		doStopAllActions(slot0.less_time)
		slot0.checkbox:setVisible(false)
		slot0.cost_label:setVisible(true)
		slot0:updateActiveInfo()
		slot0:updateProgressInfo(100)

		if slot0.scdata.bid ~= 0 and not slot0.is_start_fight then
			slot0.fight_btn_label:disableEffect(cc.LabelEffect.OUTLINE)
			setChildUnEnabled(true, slot0.fight_btn)

			if slot0.scdata.end_time < GameNet:getInstance():getTime() then
				if slot0.fight_config then
					if slot0.boss_reset_interval - slot0.fight_config.time + slot0.scdata.end_time - GameNet:getInstance():getTime() < 0 then
						slot4 = 0
					end

					commonCountDownTime(slot0.less_time, slot4, {
						callback = function (slot0)
							uv0:setTimeFormatString(slot0, 2)
						end
					})
				end
			else
				slot0:setTimeFormatString(slot0.boss_config.time)
			end
		else
			setChildUnEnabled(false, slot0.fight_btn)
			slot0.fight_btn_label:enableOutline(cc.c4b(2, 0, 25, 255), 2)
			slot0:setTimeFormatString(slot0.boss_config.time)
		end

		slot0.fight_btn_label:setString(TI18N("开始讨伐"))
	end
end

function GuildsecretareaMainWindow.checkBossStatus(slot0)
	if not slot0.scdata then
		return
	end

	slot0.is_start_fight = true

	if slot0.fight_config and slot0.boss_reset_interval - slot0.fight_config.time + slot0.scdata.end_time - GameNet:getInstance():getTime() > 0 then
		slot0.is_start_fight = false
	end
end

function GuildsecretareaMainWindow.checkSameDay(slot0, slot1, slot2)
	if TimeTool.getMD3(slot1) == TimeTool.getMD3(slot2) then
		return true
	end

	return false
end

function GuildsecretareaMainWindow.setTimeFormatString(slot0, slot1, slot2)
	slot4 = nil

	if slot1 > 0 then
		slot0.less_time:setString(string.format(TI18N("%s:<div fontcolor=#157e22>%s</div>"), ((slot2 or 1) ~= 2 or TI18N("讨伐重置时间")) and TI18N("讨伐时间"), TimeTool.GetTimeFormatDayIIIIII(slot1)))
	else
		slot0.less_time:setString(slot4 .. ":<div fontcolor=#157e22>00:00</div>")
		doStopAllActions(slot0.less_time)
		slot0:checkBossStatus()
		slot0:updateBossInfoByBossID(slot0.select_boss_index)
	end
end

function GuildsecretareaMainWindow.updateActiveInfo(slot0)
	if not slot0.scdata then
		return
	end

	if not slot0.select_pass_id then
		return
	end

	if not slot0.my_guild_info then
		return
	end

	if not slot0.boss_config then
		return
	end

	slot1 = PathTool.getResFrame("guildsecretarea", "guildsecretarea_10")
	slot2 = nil

	slot0.cost_label:setString((slot0.boss_config.active >= slot0.my_guild_info.vitality or uv0(TI18N("需要消耗公会活跃: <img src='%s' scale=1 /> %s/%s"), slot1, slot0.boss_config.active, slot3)) and uv0(TI18N("需要消耗公会活跃: <img src='%s' scale=1 /> <div fontcolor=#FF0000>%s</div>/%s"), slot1, slot0.boss_config.active, slot3))
end

function GuildsecretareaMainWindow.updateProgressInfo(slot0, slot1, slot2)
	if not slot0.scdata then
		return
	end

	if not slot0.select_boss_id then
		return
	end

	if not slot0.box_list then
		return
	end

	slot0.progress:setPercent(slot1)

	if Config.GuildSecretAreaData.data_box_reward[slot0.select_boss_id] and next(slot3) ~= nil then
		uv0(slot3, function (slot0, slot1)
			return slot0.number < slot1.number
		end)

		slot0.max_num = slot3[#slot3].number

		for slot9, slot10 in ipairs(slot3) do
			slot11 = slot0.box_list[slot9]
			slot12 = slot10.progress / 10
			slot13 = slot0.progress_container_size.width / 100 * slot12 - 5
			slot14 = slot12 .. "%"

			if slot10.progress == 0 then
				slot14 = TI18N("击杀")
			end

			if slot11 == nil then
				slot16 = createEffectSpine(PathTool.getEffectRes(slot10.effect_id or 110), cc.p(slot13, 0), cc.p(0.5, 0.5), true, PlayerAction.action_1)

				slot0.progress_container:addChild(slot16)

				slot11 = {
					box = slot16,
					label = createLabel(18, cc.c4b(255, 255, 255, 255), cc.c4b(34, 1, 1, 255), slot13, -18, slot14, slot0.progress_container, 2, cc.p(0.5, 0.5)),
					btn = createButton(slot0.progress_container, "", slot13, slot0.progress_container_size.height * 0.5, cc.size(52, 70), PathTool.getResFrame("common", "common_99998"))
				}
				slot18 = createImage(slot0.progress_container, PathTool.getResFrame("guildsecretarea", "guildsecretarea_08"), slot13 + 2, -18, cc.p(0.5, 0.5), true, 0, true)

				slot18:setContentSize(cc.size(50, 26))
				slot18:setCapInsets(cc.rect(8, 8, 1, 1))
				slot11.btn:addTouchEventListener(function (slot0, slot1)
					if slot1 == ccui.TouchEventType.ended then
						uv0:onClickBoxItemBtn(uv1, slot0)
					end
				end)

				slot0.box_list[slot9] = slot11
			else
				slot11.box:setPositionX(slot13)
				slot11.btn:setPositionX(slot13)
				slot11.label:setPositionX(slot13)
				slot11.label:setString(slot14)
			end

			slot11.is_receive = false

			if slot2 then
				if slot2[slot10.number] then
					slot0:updateBoxAnimation(slot11.box, 3)
				elseif slot1 <= slot12 and slot0.scdata.is_reward == 1 then
					slot11.is_receive = true

					slot0:updateBoxAnimation(slot11.box, 2)
				else
					slot0:updateBoxAnimation(slot11.box, 1)
				end
			else
				slot0:updateBoxAnimation(slot11.box, 1)
			end

			slot11.config = slot10
			slot11.pos = slot0.container:convertToNodeSpace(slot0.progress_container:convertToWorldSpace(cc.p(slot13, slot0.progress_container_size.height * 0.5)))
		end
	end
end

function GuildsecretareaMainWindow.updateBoxAnimation(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	if slot2 == 1 then
		slot1:setAnimation(0, PlayerAction.action_1, true)
	elseif slot2 == 2 then
		slot1:setAnimation(0, PlayerAction.action_2, true)
	else
		slot1:setAnimation(0, PlayerAction.action_3, true)
	end
end

function GuildsecretareaMainWindow.onClickBoxItemBtn(slot0, slot1, slot2)
	if not slot0.box_list then
		return
	end

	if not slot0.box_list[slot1] then
		return
	end

	if not slot0.scdata then
		return
	end

	if slot0.box_list[slot1].is_receive then
		uv0:sender26804(slot0.scdata.bid, slot0.box_list[slot1].config.number)
	else
		slot0:showRewardItems(slot3.reward, slot1)
	end
end

function GuildsecretareaMainWindow.showRewardItems(slot0, slot1, slot2)
	if not slot0.tips_layer then
		slot0.tips_layer = ccui.Layout:create()

		slot0.tips_layer:setContentSize(slot0.container:getContentSize())
		slot0.container:addChild(slot0.tips_layer)
		slot0.tips_layer:setTouchEnabled(true)
		registerButtonEventListener(slot0.tips_layer, function ()
			uv0.tips_bg:removeFromParent()

			uv0.tips_bg = nil

			uv0.tips_layer:removeFromParent()

			uv0.tips_layer = nil
		end, false, 1)
	end

	slot4 = {}

	if not slot0.tips_bg then
		slot0.tips_bg = createImage(slot0.tips_layer, PathTool.getResFrame("common", "common_1056"), slot3.width * 0.5, 100, cc.p(0, 0), true, 10, true)

		slot0.tips_bg:setTouchEnabled(true)
	end

	if slot0.tips_bg then
		slot0.tips_bg:setContentSize(cc.size(BackPackItem.Width * #slot1 + 50, BackPackItem.Height + 50))

		slot6 = cc.p(0.5, 0)

		if slot0.tips_bg:getContentSize().width * 0.5 + slot0.box_list[slot2].pos.x >= 720 then
			slot6 = cc.p(0.86, 0)
		elseif slot5.x - slot7 * 0.5 < 0 then
			slot6 = cc.p(0.3, 0)
		end

		slot0.tips_bg:setAnchorPoint(slot6)
		slot0.tips_bg:setPosition(slot0.box_list[slot2].pos.x, slot0.box_list[slot2].pos.y - 190)
	end

	slot5 = slot0.tips_bg:getContentSize()

	for slot10, slot11 in pairs(slot1) do
		if not slot4[slot10] then
			slot4[slot10] = BackPackItem.new(nil, true, nil, 0.8)

			slot4[slot10]:setAnchorPoint(cc.p(0.5, 0.5))
			slot0.tips_bg:addChild(slot4[slot10])
			slot4[slot10]:setBaseData(slot11[1])
			slot4[slot10]:setPosition(cc.p(25 + BackPackItem.Width * 0.5 + (slot10 - 1) * BackPackItem.Width, 100))
			slot4[slot10]:setDefaultTip()

			slot0.text_num = createLabel(22, cc.c4b(255, 238, 221, 255), nil, 60, -25, "", slot4[slot10], nil, cc.p(0.5, 0.5))

			slot0.text_num:setString("x" .. slot11[2])
		else
			slot4[slot10]:setBaseData(slot11[1])
			slot4[slot10]:setPosition(cc.p(slot6 + (slot10 - 1) * BackPackItem.Width, 100))
			slot0.text_num:setString("x" .. slot11[2])
		end
	end
end

function GuildsecretareaMainWindow.updateSkillInfo(slot0)
	if not slot0.boss_config then
		return
	end

	slot0.skill_width = 100

	slot0.skill_container:setInnerContainerSize(cc.size(math.max(slot0.skill_container_size.width, (slot0.skill_width + 10) * #(slot0.boss_config.boss_skill_id or {})), slot0.skill_container_size.height))

	for slot8, slot9 in ipairs(slot0.skill_item_list) do
		slot9:setVisible(false)
	end

	slot5 = 0
	slot5 = slot0.skill_container_size.width < slot3 and 0 or (slot0.skill_container_size.width - slot3) * 0.5

	for slot9, slot10 in ipairs(slot1) do
		if Config.SkillData.data_get_skill(slot10) then
			if slot0.skill_item_list[slot9] == nil then
				slot0.skill_item_list[slot9] = {}
				slot0.skill_item_list[slot9] = SkillItem.new(true, true, true, 0.8, false)

				slot0.skill_container:addChild(slot0.skill_item_list[slot9])
			end

			slot0.skill_item_list[slot9]:setData(slot11)
			slot0.skill_item_list[slot9]:setVisible(true)
			slot0.skill_item_list[slot9]:setPosition(slot5 + slot2 * (slot9 - 1) + slot2 * 0.5, slot0.skill_width / 2 + 6)
		else
			print(uv0("技能表id: %s 没发现", tostring(slot10)))
		end
	end
end

function GuildsecretareaMainWindow.updateRankInfo(slot0)
	if not slot0.boss_config then
		return
	end

	if uv0:getBossRankInfoByBossID(slot0.boss_config.id) == nil then
		uv1:sender26806(slot0.boss_config.id, 0)

		return
	end

	uv2(slot1.dps_list, SortTools.KeyLowerSorter("rank"))

	slot2 = {}

	for slot6 = 1, 3 do
		if slot1.dps_list[slot6] then
			uv3(slot2, {
				name = slot7.name,
				all_dps = slot7.dps
			})
		else
			uv3(slot2, {
				name = TI18N("虚位以待")
			})
		end
	end

	if slot2 and next(slot2 or {}) ~= nil then
		for slot6, slot7 in ipairs(slot2) do
			if not slot0.rank_list[slot6] then
				slot8 = slot0:createSingleRankItem(slot6, slot7)

				slot0.rank_container:addChild(slot8)

				slot0.rank_list[slot6] = slot8
			end

			if slot8 then
				slot8:setPosition(0, 238 - (slot6 - 1) * slot8:getContentSize().height)
				slot8.label:setString(slot7.name)

				if slot7.all_dps then
					slot8.value:setString("[" .. MoneyTool.GetMoneyString(slot7.all_dps, false) .. TI18N("伤害") .. "]")
					slot8.label:setPositionY(40)
				else
					slot8.value:setString("")
					slot8.label:setPositionY(24)
				end
			end
		end
	end
end

function GuildsecretareaMainWindow.createSingleRankItem(slot0, slot1, slot2)
	slot3 = cc.size(208, 63)
	slot4 = ccui.Layout:create()

	slot4:setAnchorPoint(cc.p(0, 1))
	slot4:setContentSize(slot3)

	slot5 = createSprite(PathTool.getResFrame("common", "common_300" .. slot1), 10, slot3.height * 0.5, slot4)

	slot5:setAnchorPoint(cc.p(0, 0.5))
	slot5:setScale(0.6)

	slot4.sp = slot5
	slot4.label = createLabel(22, cc.c4b(236, 221, 204, 255), cc.c4b(2, 1, 25, 255), 67, 40, "", slot4, 2, cc.p(0, 0.5))
	slot4.value = createLabel(18, cc.c4b(200, 173, 131, 255), cc.c4b(2, 1, 25, 255), 67, 16, "", slot4, 2, cc.p(0, 0.5))

	return slot4
end

function GuildsecretareaMainWindow.close_callback(slot0)
	if slot0.my_guild_info ~= nil then
		if slot0.update_guild_event ~= nil then
			slot0.my_guild_info:UnBind(slot0.update_guild_event)

			slot0.update_guild_event = nil
		end

		slot0.my_guild_info = nil
	end

	if slot0.item_load then
		slot0.item_load:DeleteMe()
	end

	slot0.item_load = nil

	if slot0.item_load_icon then
		slot0.item_load_icon:DeleteMe()
	end

	slot0.item_load_icon = nil

	if slot0.item_load_bg then
		slot0.item_load_bg:DeleteMe()
	end

	slot0.item_load_bg = nil

	if slot0.item_list then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end

		slot0.item_list = nil
	end

	doStopAllActions(slot0.item_container)
	uv0:clearBossRankInfo()
	uv1:openGuildsecretareaMainWindow(false)
end
