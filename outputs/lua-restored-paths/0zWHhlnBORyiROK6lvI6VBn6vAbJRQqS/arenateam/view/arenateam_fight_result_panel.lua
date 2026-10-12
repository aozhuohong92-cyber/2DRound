ArenateamFightResultPanel = ArenateamFightResultPanel or BaseClass(BaseView)
slot0 = ArenateamController:getInstance()
slot1 = string.format
slot2 = table.sort

function ArenateamFightResultPanel.__init(slot0, slot1)
	slot0.win_type = WinType.Tips
	slot0.layout_name = "arenateam/arenateam_fight_result_panel"
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("battle", "battle"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("arenateam", "arenateam"),
			type = ResourcesType.plist
		}
	}
	slot0.result = slot1
	slot0.fight_type = BattleConst.Fight_Type.Arean_Team
end

function ArenateamFightResultPanel.open_callback(slot0)
	slot1 = ""
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.title_container = slot0.container:getChildByName("title_container")
	slot0.title_width = slot0.title_container:getContentSize().width
	slot0.title_height = slot0.title_container:getContentSize().height

	slot0:handleEffect(true)

	if slot0.result == 1 then
		playOtherSound("b_win", AudioManager.AUDIO_TYPE.BATTLE)
	else
		slot0.container:getChildByName("Sprite_1"):setVisible(false)
		slot0.container:getChildByName("Sprite_2"):setVisible(false)
		AudioManager:getInstance():playMusic(AudioManager.AUDIO_TYPE.BATTLE, "b_lose", false)
	end

	slot0.fight_text = slot0.container:getChildByName("fight_text")

	if slot0.fight_text and Config.BattleBgData.data_fight_name[slot0.fight_type] then
		slot0.fight_text:setString(TI18N("当前战斗：") .. slot2)
	end

	slot0.harm_btn = slot0.container:getChildByName("harm_btn")

	slot0.harm_btn:setVisible(false)
	slot0.harm_btn:getChildByName("harm_lab"):setString(TI18N("数据统计"))

	slot0.my_arrow_1 = slot0.container:getChildByName("my_arrow_1")
	slot0.my_arrow_2 = slot0.container:getChildByName("my_arrow_2")
	slot0.enemy_arrow_1 = slot0.container:getChildByName("enemy_arrow_1")
	slot0.enemy_arrow_2 = slot0.container:getChildByName("enemy_arrow_2")
	slot0.my_team_name = slot0.container:getChildByName("my_team_name")
	slot0.my_team_score = slot0.container:getChildByName("my_team_score")
	slot0.my_team_change_score = slot0.container:getChildByName("my_team_change_score")
	slot0.my_team_rank = slot0.container:getChildByName("my_team_rank")
	slot0.my_team_change_rank = slot0.container:getChildByName("my_team_change_rank")
	slot0.enemy_team_name = slot0.container:getChildByName("enemy_team_name")
	slot0.enemy_team_score = slot0.container:getChildByName("enemy_team_score")
	slot0.enemy_team_change_score = slot0.container:getChildByName("enemy_team_change_score")
	slot0.enemy_team_rank = slot0.container:getChildByName("enemy_team_rank")
	slot0.enemy_team_change_rank = slot0.container:getChildByName("enemy_team_change_rank")
	slot0.my_head_node = slot0.container:getChildByName("my_head_node")
	slot5 = "enemy_head_node"
	slot0.enemy_head_node = slot0.container:getChildByName(slot5)
	slot0.my_head_list = {}

	for slot5 = 1, 3 do
		slot0.my_head_list[slot5] = PlayerHead.new(PlayerHead.type.circle)

		slot0.my_head_list[slot5]:setSwallowTouches(false)
		slot0.my_head_list[slot5]:setHeadLayerScale(0.95)
		slot0.my_head_list[slot5]:setPosition(110 * (slot5 - 1), 0)
		slot0.my_head_node:addChild(slot0.my_head_list[slot5])
	end

	slot0.enemy_head_list = {}

	for slot5 = 1, 3 do
		slot0.enemy_head_list[slot5] = PlayerHead.new(PlayerHead.type.circle)

		slot0.enemy_head_list[slot5]:setSwallowTouches(false)
		slot0.enemy_head_list[slot5]:setHeadLayerScale(0.95)
		slot0.enemy_head_list[slot5]:setPosition(110 * (slot5 - 1), 0)
		slot0.enemy_head_node:addChild(slot0.enemy_head_list[slot5])
	end

	slot0.cancel_btn = slot0.container:getChildByName("cancel_btn")

	slot0.cancel_btn:getChildByName("label"):setString(TI18N("回到竞技场"))

	slot0.comfirm_btn = slot0.container:getChildByName("comfirm_btn")

	slot0.comfirm_btn:getChildByName("label"):setString(TI18N("确 定"))
end

function ArenateamFightResultPanel.register_event(slot0)
	registerButtonEventListener(slot0.harm_btn, handler(slot0, slot0._onClickHarmBtn), true)
	registerButtonEventListener(slot0.cancel_btn, handler(slot0, slot0.onClickCancelBtn), true)
	registerButtonEventListener(slot0.comfirm_btn, handler(slot0, slot0.onClickComfirmBtn), true)
end

function ArenateamFightResultPanel._onClickHarmBtn(slot0)
	if slot0.data and slot0.data.all_hurt_statistics then
		table.sort(slot0.data.all_hurt_statistics, function (slot0, slot1)
			return slot0.type < slot1.type
		end)

		slot2 = RoleController:getInstance():getRoleVo().name
		slot3 = {
			[slot9.pos] = slot9
		}
		slot4 = {}

		for slot8, slot9 in ipairs(slot0.data.a_team_members) do
			-- Nothing
		end

		for slot8, slot9 in ipairs(slot0.data.b_team_members) do
			slot4[slot9.pos] = slot9
		end

		for slot8, slot9 in ipairs(slot0.data.all_hurt_statistics) do
			if slot3[slot9.a_round] then
				slot9.atk_name = slot3[slot9.a_round].name
			else
				slot9.atk_name = TI18N("未知")
			end

			if slot4[slot9.b_round] then
				slot9.target_role_name = slot4[slot9.b_round].name
			else
				slot9.target_role_name = TI18N("未知")
			end
		end

		BattleController:getInstance():openBattleHarmInfoView(true, slot0.data.all_hurt_statistics)
	end
end

function ArenateamFightResultPanel.onClickCancelBtn(slot0)
	BattleResultReturnMgr:returnByFightType(slot0.fight_type)
	uv0:openArenateamFightResultPanel(false)
end

function ArenateamFightResultPanel.onClickComfirmBtn(slot0)
	uv0:openArenateamFightResultPanel(false)
end

function ArenateamFightResultPanel.openRootWnd(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	slot0.data = slot1

	if slot0.data and slot0.data.all_hurt_statistics then
		slot0.harm_btn:setVisible(true)
	else
		slot0.harm_btn:setVisible(false)
	end

	slot0.my_team_name:setString(slot1.a_team_name or "")
	slot0.my_team_score:setString(uv0(TI18N("积分: %s"), slot1.a_new_score))
	slot0:updateChangeInfo(slot0.my_team_change_score, slot1.a_new_score - slot1.a_score, slot0.my_arrow_1)

	if slot1.a_new_rank > 0 then
		slot0.my_team_rank:setString(uv0(TI18N("排名: %s"), slot1.a_new_rank))
	else
		slot0.my_team_rank:setString(TI18N("排名: 未上榜"))
	end

	slot4 = 0

	slot0:updateChangeInfo(slot0.my_team_change_rank, (slot1.a_rank ~= 0 or slot1.a_new_rank) and slot1.a_rank - slot1.a_new_rank, slot0.my_arrow_2)
	slot0.enemy_team_name:setString(slot1.b_team_name or "")
	slot0.enemy_team_score:setString(uv0(TI18N("积分: %s"), slot1.b_new_score))
	slot0:updateChangeInfo(slot0.enemy_team_change_score, slot1.b_new_score - slot1.b_score, slot0.enemy_arrow_1)

	if slot1.b_new_rank > 0 then
		slot0.enemy_team_rank:setString(uv0(TI18N("排名: %s"), slot1.b_new_rank))
	else
		slot0.enemy_team_rank:setString(TI18N("排名: 未上榜"))
	end

	slot0:updateChangeInfo(slot0.enemy_team_change_rank, slot1.b_rank - slot1.b_new_rank, slot0.enemy_arrow_2)
	slot0:updateHeadList(slot0.my_head_list, slot1.a_team_members)
	slot0:updateHeadList(slot0.enemy_head_list, slot1.b_team_members)
end

function ArenateamFightResultPanel.updateChangeInfo(slot0, slot1, slot2, slot3)
	if slot2 > 0 then
		slot3:setVisible(true)
		slot1:setString(slot2)
		slot1:setTextColor(cc.c4b(138, 247, 123, 255))
		loadSpriteTexture(slot3, PathTool.getResFrame("common", "common_1086"), LOADTEXT_TYPE_PLIST)
	elseif slot2 < 0 then
		slot3:setVisible(true)
		slot1:setString(slot2)
		slot1:setTextColor(cc.c4b(255, 78, 78, 255))
		loadSpriteTexture(slot3, PathTool.getResFrame("common", "common_1087"), LOADTEXT_TYPE_PLIST)
	else
		slot1:setString("")
		slot3:setVisible(false)
	end
end

function ArenateamFightResultPanel.updateHeadList(slot0, slot1, slot2)
	if not slot2 then
		return
	end

	for slot6, slot7 in ipairs(slot2) do
		slot7.is_leader = 0

		for slot11, slot12 in ipairs(slot7.ext) do
			if slot12.extra_key == 1 then
				if slot12.extra_val == 1 then
					slot7.is_leader = 1
				else
					slot7.is_leader = -slot7.pos
				end
			end
		end
	end

	function slot6(slot0, slot1)
		return slot1.is_leader < slot0.is_leader
	end

	uv0(slot2, slot6)

	for slot6, slot7 in ipairs(slot1) do
		if slot2[slot6] then
			slot7:setHeadRes(slot8.face_id, false, LOADTEXT_TYPE, slot8.face_file, slot8.face_update_time)
			slot7:setLev(slot8.lev)
			slot7:showLeader(false)

			if slot8.is_leader == 1 then
				slot7:showLeader(true)
			else
				slot7:showLeader(false)
			end

			slot9 = slot8.avatar_bid

			if slot7.record_res_bid == nil or slot7.record_res_bid ~= slot9 then
				slot7.record_res_bid = slot9

				if Config.AvatarData.data_avatar[slot9] then
					slot7:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot10.res_id or 1), false, false), nil, false, slot10.offy)
				else
					slot7:showBg(PathTool.getResFrame("common", "common_1031"), nil, true)
				end
			end
		else
			slot7:clearHead()
			slot7:closeLev()
			slot7:showLeader(false)
			slot7:showBg(PathTool.getResFrame("common", "common_1031"), nil, true)
		end
	end
end

function ArenateamFightResultPanel.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	elseif not tolua.isnull(slot0.title_container) and slot0.play_effect == nil then
		if slot0.result == 1 then
			slot0.play_effect = createEffectSpine(PathTool.getEffectRes(103), cc.p(slot0.title_width * 0.5, slot0.title_height * 0.5 - 10), cc.p(0.5, 0.5), false, PlayerAction.action_2)
		else
			slot0.play_effect = createEffectSpine(PathTool.getEffectRes(104), cc.p(slot0.title_width * 0.5, slot0.title_height * 0.5 + 10), cc.p(0.5, 0.5), false, PlayerAction.action)
		end

		slot0.title_container:addChild(slot0.play_effect, 1)
	end
end

function ArenateamFightResultPanel.updateTimer(slot0)
	slot1 = 10

	GlobalTimeTicket:getInstance():add(function ()
		uv0 = uv0 - 1

		if uv1.time_label and not tolua.isnull(uv1.time_label) then
			uv1.time_label:setString(math.ceil(uv0) .. TI18N("秒后关闭"))
		end

		if slot0 <= 0 then
			BattleController:getInstance():openFinishView(false, uv1.fight_type)
		end
	end, 1, 0, "result_timer" .. slot0.fight_type)
end

function ArenateamFightResultPanel.close_callback(slot0)
	HeroController:getInstance():openEquipTips(false)
	TipsManager:getInstance():hideTips()
	BattleController:getInstance():openFinishView(false, slot0.fight_type)
	GlobalEvent:getInstance():Fire(BattleEvent.CLOSE_RESULT_VIEW, slot0.fight_type)
	GlobalTimeTicket:getInstance():remove("result_timer" .. slot0.fight_type)
	slot0:handleEffect(false)

	if BattleController:getInstance():getModel():getBattleScene() and BattleController:getInstance():getIsSameBattleType(slot0.fight_type) then
		BattleController:getInstance():getModel():result(slot0.data, slot0.is_leave_self)
	end
end
