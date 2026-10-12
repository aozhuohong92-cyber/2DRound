BattleFailView = BattleFailView or BaseClass(BaseView)

function BattleFailView.__init(slot0, slot1, slot2, slot3)
	slot0.result = slot2
	slot0.data = slot3
	slot0.x = 100
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.fight_type = slot1
	slot0.is_running = false
	slot0.layout_name = "battle/battle_fail_view"
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.win_type = WinType.Tips
	slot0.effect_list = {}
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("battlefail", "battlefail"),
			type = ResourcesType.plist
		}
	}
end

function BattleFailView.openRootWnd(slot0)
end

function BattleFailView.open_callback(slot0)
	AudioManager:getInstance():playMusic(AudioManager.AUDIO_TYPE.BATTLE, "b_lose", false)

	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.source_container = slot0.root_wnd:getChildByName("container")
	slot0.title_container = slot0.source_container:getChildByName("title_container")
	slot0.title_width = slot0.title_container:getContentSize().width
	slot0.title_height = slot0.title_container:getContentSize().height

	slot0.source_container:runAction(cc.Sequence:create(cc.FadeIn:create(0.2), cc.CallFunc:create(function ()
		uv0:createButton()

		uv0.is_running = false
	end)))

	if slot0.fight_type == BattleConst.Fight_Type.Adventrue then
		createLabel(24, cc.c4b(104, 199, 75, 255), nil, 360, 60, string.format(TI18N("已连续挑战%s场"), AdventureController:getInstance():getUiModel():getFightSkipCount()), slot0.source_container, nil, cc.p(0.5, 0.5))
	end

	slot0.fight_text = createLabel(24, cc.c4b(255, 238, 172, 255), nil, 360, 410, "", slot0.source_container, nil, cc.p(0.5, 0.5))

	if Config.BattleBgData.data_fight_name[slot0.fight_type] then
		slot0.fight_text:setString(TI18N("当前战斗：") .. slot1)
	end

	slot0.comfirm_btn = createButton(slot0.source_container, TI18N("确定"), 620, 580, cc.size(162, 62), PathTool.getResFrame("common", "common_1017"), 24, Config.ColorData.data_color4[1])

	slot0.comfirm_btn:setPosition(slot0.source_container:getContentSize().width / 2 - 230, -80)
	slot0.comfirm_btn:enableOutline(Config.ColorData.data_color4[264], 2)
	slot0.comfirm_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			BattleController:getInstance():openFailFinishView(false, uv0.fight_type)
		end
	end)

	slot0.help_btn = createButton(slot0.source_container, TI18N("变强小助手"), slot0.source_container:getContentSize().width / 2, -80, cc.size(162, 62), PathTool.getResFrame("common", "common_1017"), 24)

	slot0.help_btn:setRichText(TI18N("<div fontColor=#ffffff fontsize=24 outline=2,#020019>变强小助手</div>"))

	if RoleController:getInstance():getRoleVo() and (Config.BattleBgData.data_back_limit[slot0.fight_type] or 0) <= slot3.lev then
		slot0.cancel_btn = createButton(slot0.source_container, TI18N("返回玩法"), 620, 580, cc.size(162, 62), PathTool.getResFrame("common", "common_1018"), 24, Config.ColorData.data_color4[1])

		slot0.cancel_btn:setPosition(slot0.source_container:getContentSize().width / 2 + 230, -80)
		slot0.cancel_btn:enableOutline(Config.ColorData.data_color4[263], 2)
		slot0.cancel_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				BattleResultReturnMgr:returnByFightType(uv0.fight_type)
				BattleController:getInstance():openFailFinishView(false, uv0.fight_type)
			end
		end)
	else
		slot0.help_btn:setPositionX(slot0.source_container:getContentSize().width / 2 + 230)
	end

	slot0.time_label = createRichLabel(22, 1, cc.p(0.5, 0.5), cc.p(slot0.source_container:getContentSize().width / 2 + 5, 20), nil, , 1000)

	slot0.time_label:setString(TI18N("10秒后关闭"))
	slot0.source_container:addChild(slot0.time_label)

	slot0.harm_btn = slot0.source_container:getChildByName("harm_btn")

	if slot0.data and (slot0.data.hurt_statistics or slot0.data.all_hurt_statistics) then
		slot0.harm_btn:setVisible(true)
	else
		slot0.harm_btn:setVisible(false)
	end

	slot0.harm_btn:getChildByName("harm_lab"):setString(TI18N("数据统计"))
	slot0:handleEffect(true)
	slot0:updateBattleAgainBtn()
end

function BattleFailView.updateHelpBtn(slot0, slot1)
end

function BattleFailView.updateBattleAgainBtn(slot0)
	if slot0.fight_type == BattleConst.Fight_Type.Adventrue and slot0.data.adventure_end_hp and slot0.data.adventure_end_hp > 0 then
		if not slot0.left_hp_txt then
			slot0.left_hp_txt = createRichLabel(22, cc.c4b(255, 125, 39, 255), cc.p(0.5, 0.5), cc.p(slot0.source_container:getContentSize().width / 2, 95))

			slot0.source_container:addChild(slot0.left_hp_txt)
		end

		slot0.left_hp_txt:setString(string.format(TI18N("出战英雄剩余血量为:<div fontColor=#68c74b>%d%%</div>"), slot0.data.adventure_end_hp / 10))

		slot1 = Config.AdventureData.data_adventure_const.botton_appear

		if slot0.data.room_id and slot1 and slot1.val <= slot0.data.adventure_end_hp / 10 and not slot0.battle_again_btn then
			slot0.battle_again_btn = createButton(slot0.source_container, TI18N("再次挑战"), slot0.source_container:getContentSize().width / 2, -80, cc.size(162, 62), PathTool.getResFrame("common", "common_1017"), 24)

			slot0.battle_again_btn:setRichText(TI18N("<div fontColor=#ffffff fontsize=24 outline=2,#6C2B00>再次挑战</div>"))
		end

		slot0.help_btn:setPosition(slot0.source_container:getContentSize().width / 2 - 230, -80)
		slot0.comfirm_btn:setPosition(slot0.source_container:getContentSize().width / 2 + 230, -80)

		if slot0.cancel_btn then
			slot0.cancel_btn:setVisible(false)
		end
	end
end

function BattleFailView.createButton(slot0)
	slot0.desc_fail_label = createRichLabel(20, 1, cc.p(0.5, 0.5), cc.p(SCREEN_WIDTH / 2, 345), 15)

	slot0.desc_fail_label:setString(string.format(TI18N("<div outline=2,#020019>     失败，不要气馁，\n可通过以下方式提升实力！</div>")))
	slot0.source_container:addChild(slot0.desc_fail_label)

	slot1 = {}
	slot2 = BattleDramaController:getInstance():getModel():getDramaData()

	if Config.BattleActData.data_get_fail_data and slot2 then
		for slot7, slot8 in ipairs(Config.BattleActData.data_get_fail_data) do
			if slot8.open_dungeon <= slot2.max_dun_id then
				table.insert(slot1, slot8)
			end
		end
	end

	if slot0.items_list == nil then
		slot0.items_list = {}
	end

	slot0:clearItems()

	slot3 = 110
	slot4 = 65
	slot5 = cc.size(105, 100)
	slot7 = slot0.source_container:getContentSize()

	for slot11 = 1, math.min(4, #slot1) do
		if slot1[slot11] then
			if not slot0.items_list[slot11] then
				slot0.items_list[slot11] = {}
				slot13 = ccui.Layout:create()

				slot13:setContentSize(slot5)
				slot13:setAnchorPoint(cc.p(0.5, 0.5))
				slot0.source_container:addChild(slot13)

				slot14 = CustomButton.New(slot13, PathTool.getResFrame("battlefail", slot12.icon), nil, , LOADTEXT_TYPE_PLIST)

				slot14:setPosition(slot5.width / 2, slot5.height / 2)

				slot15 = createRichLabel(22, cc.c3b(255, 238, 209), cc.p(0.5, 0), cc.p(slot5.width / 2, 0))

				slot13:addChild(slot15)
				slot15:setString(string.format("<div fontcolor=ffeed1 outline=2,#020019>%s</div>", slot12.icon_name))

				slot13.btn = slot14
				slot13.label = slot15
				slot0.items_list[slot11] = slot13
			end

			slot0.items_list[slot11]:setPosition(slot3 + (slot11 - 1) * (slot5.width + slot4), slot7.height / 2 - 40)

			slot15 = slot0.items_list[slot11].label

			if slot0.items_list[slot11].btn then
				slot14:setVisible(true)
				slot14:addTouchEventListener(function (slot0, slot1)
					if slot1 == ccui.TouchEventType.ended then
						uv0:openPanelByConfig(uv1)
						uv0:close()
					end
				end)
			end

			if slot15 then
				slot15:setString(string.format("<div fontcolor=ffeed1 outline=2,#020019>%s</div>", slot12.icon_name))
			end
		end
	end

	slot0:updateTimer()
end

function BattleFailView.updateTimer(slot0)
	slot1 = 10

	GlobalTimeTicket:getInstance():add(function ()
		uv0 = uv0 - 1

		if uv1.time_label and not tolua.isnull(uv1.time_label) then
			uv1.time_label:setString(math.ceil(uv0) .. TI18N("秒后关闭"))
		end

		if slot0 <= 0 then
			BattleController:getInstance():openFailFinishView(false, uv1.fight_type)
		end
	end, 1, 0, "fail_result_timer" .. slot0.fight_type)
end

function BattleFailView.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	elseif not tolua.isnull(slot0.title_container) and slot0.play_effect == nil then
		slot0.play_effect = createEffectSpine(PathTool.getEffectRes(104), cc.p(slot0.title_width * 0.5, slot0.title_height * 0.5), cc.p(0.5, 0.5), false, PlayerAction.action)

		slot0.title_container:addChild(slot0.play_effect, 1)
	end
end

function BattleFailView.register_event(slot0)
	if slot0.help_btn then
		slot0.help_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				BattleController:getInstance():openFailFinishView(false, uv0.fight_type)
				StrongerController:getInstance():openMainWin(true)
			end
		end)
	end

	if slot0.battle_again_btn then
		slot0.battle_again_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				uv0:_onClickBattleAgainBtn()
			end
		end)
	end

	registerButtonEventListener(slot0.harm_btn, handler(slot0, slot0._onClickHarmBtn), true)
end

function BattleFailView._onClickHarmBtn(slot0)
	if slot0.data and next(slot0.data) ~= nil then
		if slot0.data.hurt_statistics then
			BattleController:getInstance():openBattleHarmInfoView(true, slot0.data, {
				fight_type = slot0.fight_type
			})
		elseif slot0.data.all_hurt_statistics and slot0.fight_type == BattleConst.Fight_Type.HeavenWar then
			table.sort(slot0.data.all_hurt_statistics, function (slot0, slot1)
				return slot0.type < slot1.type
			end)

			slot7 = slot0.data.order_id

			for slot7, slot8 in ipairs(slot0.data.all_hurt_statistics) do
				if HeavenController:getInstance():getModel():getCustomsIsBossType(slot0.data.id, slot7) then
					slot8.atk_name = string.format("%s(队伍%s)", RoleController:getInstance():getRoleVo().name, slot8.a_round)
					slot8.target_role_name = string.format("%s(队伍%s)", slot8.target_role_name, slot8.b_round)
				else
					slot8.atk_name = slot2
				end
			end

			BattleController:getInstance():openBattleHarmInfoView(true, slot0.data.all_hurt_statistics)
		end
	end
end

function BattleFailView._onClickBattleAgainBtn(slot0)
	if slot0.fight_type == BattleConst.Fight_Type.Adventrue and slot0.data.room_id then
		slot1 = {}

		for slot5, slot6 in pairs(slot0.data.ext_list) do
			table.insert(slot1, {
				type = slot6.ext_type,
				val = slot6.ext_val
			})
		end

		AdventureController:getInstance():send20620(slot0.data.room_id, AdventureEvenHandleType.handle, slot1)
	end

	BattleController:getInstance():openFailFinishView(false, slot0.fight_type)
end

function BattleFailView.clearItems(slot0)
	if slot0.items_list then
		for slot4, slot5 in pairs(slot0.items_list) do
			if slot5.btn and slot5.label and not tolua.isnull(slot5.label) then
				slot5.btn:setVisible(false)
				slot5.label:setVisible(false)
			end
		end
	end
end

function BattleFailView.openPanelByConfig(slot0, slot1)
	if slot1.val_key == BattleConst.JumpType.Summon then
		StrongerController:getInstance():clickCallBack(120)
	elseif slot1.val_key == BattleConst.JumpType.HeroBag then
		StrongerController:getInstance():clickCallBack(200)
	elseif slot1.val_key == BattleConst.JumpType.Forge then
		StrongerController:getInstance():clickCallBack(154)
	elseif slot1.val_key == BattleConst.JumpType.Hallows then
		StrongerController:getInstance():clickCallBack(201)
	end
end

function BattleFailView.close_callback(slot0)
	if slot0.fight_type == BattleConst.Fight_Type.GuildWar and slot0.data and slot0.data.item_rewards then
		slot1 = {
			[slot5] = {}
		}

		for slot5, slot6 in pairs(slot0.data.item_rewards) do
			slot1[slot5].bid = slot6.bid
			slot1[slot5].num = slot6.num
		end

		MainuiController:getInstance():openGetItemView(true, slot1, 0, {
			is_backpack = true
		})
	end

	BattleController:getInstance():openFailFinishView(false, slot0.fight_type)
	GlobalTimeTicket:getInstance():remove("fail_result_timer" .. slot0.fight_type)
	GlobalEvent:getInstance():Fire(BattleEvent.CLOSE_RESULT_VIEW, slot0.fight_type)
	slot0:handleEffect(false)

	if BattleController:getInstance():getModel():getBattleScene() and BattleController:getInstance():getIsSameBattleType(slot0.fight_type) then
		BattleController:getInstance():getModel():result({
			combat_type = slot0.fight_type,
			result = slot0.result
		}, slot0.is_leave_self)
	end
end
