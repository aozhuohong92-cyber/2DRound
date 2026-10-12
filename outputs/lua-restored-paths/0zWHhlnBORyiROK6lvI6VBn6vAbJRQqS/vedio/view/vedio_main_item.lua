VedioMainItem = class("VedioMainItem", function ()
	return ccui.Widget:create()
end)
slot0 = table.insert
slot2 = VedioController:getInstance():getModel()
slot3 = string.format

function VedioMainItem.ctor(slot0, slot1)
	slot0.is_share = slot1 or false

	slot0:configUI()
	slot0:register_event()
end

function VedioMainItem.configUI(slot0)
	slot0.size = cc.size(620, 452)

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("vedio/vedio_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot2 = slot0.container:getChildByName("image_panel")
	slot0.image_atk_left = slot2:getChildByName("image_atk_left")
	slot0.image_atk_right = slot2:getChildByName("image_atk_right")
	slot0.image_rank_left = slot2:getChildByName("image_rank_left")
	slot0.image_rank_right = slot2:getChildByName("image_rank_right")
	slot0.result_win = slot2:getChildByName("result_win")
	slot0.result_loss = slot2:getChildByName("result_loss")
	slot0.name_left = slot0.container:getChildByName("name_left")
	slot0.name_right = slot0.container:getChildByName("name_right")
	slot0.tree_lv_left = slot0.container:getChildByName("tree_lv_left")
	slot0.tree_lv_right = slot0.container:getChildByName("tree_lv_right")
	slot0.challenge_left = slot0.container:getChildByName("challenge_left")
	slot0.challenge_right = slot0.container:getChildByName("challenge_right")
	slot0.atk_label_left = slot0.container:getChildByName("atk_label_left")
	slot0.atk_label_right = slot0.container:getChildByName("atk_label_right")
	slot0.rank_label_left = slot0.container:getChildByName("rank_label_left")
	slot0.rank_label_right = slot0.container:getChildByName("rank_label_right")
	slot0.rank_title_left = slot0.container:getChildByName("rank_title_left")
	slot0.rank_title_right = slot0.container:getChildByName("rank_title_right")

	slot0.rank_title_left:setString(TI18N("排行"))
	slot0.rank_title_right:setString(TI18N("排行"))

	slot0.round_txt = slot0.container:getChildByName("round_txt")
	slot0.type_txt = slot0.container:getChildByName("type_txt")
	slot0.time_txt = slot0.container:getChildByName("time_txt")
	slot0.level_left = slot0.container:getChildByName("level_left")
	slot0.level_right = slot0.container:getChildByName("level_right")
	slot0.play_btn = slot2:getChildByName("play_btn")
	slot0.share_btn = slot2:getChildByName("share_btn")
	slot0.info_btn = slot2:getChildByName("info_btn")
	slot0.collect_btn = slot2:getChildByName("collect_btn")

	slot0.collect_btn:ignoreContentAdaptWithSize(true)

	slot0.like_btn = slot2:getChildByName("like_btn")

	slot0.like_btn:ignoreContentAdaptWithSize(true)

	slot0.play_num = slot0.container:getChildByName("play_num")

	slot0.play_num:setString(0)

	slot0.share_num = slot0.container:getChildByName("share_num")

	slot0.share_num:setString(0)

	slot0.like_num = slot0.container:getChildByName("like_num")

	slot0.like_num:setString(0)

	slot0.left_item_list = {}
	slot0.right_item_list = {}
	slot0.panel_role_left = slot0.container:getChildByName("panel_role_left")
	slot0.panel_role_right = slot0.container:getChildByName("panel_role_right")
	slot0.left_elfin_list = {}
	slot0.right_elfin_list = {}
	slot0.panel_elfin_left = slot0.container:getChildByName("panel_elfin_left")
	slot0.panel_elfin_right = slot0.container:getChildByName("panel_elfin_right")
	slot3 = slot0.panel_role_left:getContentSize()
	slot4 = 60
	slot5 = 60
	slot6 = 8
	slot7 = 10
	slot0.postion_list = {}

	for slot11 = 1, 3 do
		for slot15 = 1, 3 do
			slot0.postion_list[(slot11 - 1) * 3 + slot15] = cc.p((slot4 + slot6) * (slot15 - 1) + slot4 * 0.5, (slot5 + slot7) * (3 - slot11) + slot5 * 0.5)
		end
	end
end

function VedioMainItem.register_event(slot0)
	registerButtonEventListener(slot0.play_btn, function ()
		if uv0.data then
			if uv0.data.combat_type == BattleConst.Fight_Type.CrossChampion then
				if uv0.data.ext and next(uv0.data.ext) ~= nil then
					slot0 = nil

					for slot4, slot5 in pairs(uv0.data.ext) do
						if slot5.key == 1 then
							slot0 = slot5.str

							break
						end
					end

					if slot0 then
						BattleController:getInstance():csRecordBattle(uv0.data.id, slot0)
					end
				end
			elseif uv0.vedioType == VedioConst.Tab_Index.Ladder or uv0.is_share == true then
				BattleController:getInstance():csRecordBattle(uv0.data.id, uv0.data.a_srv_id)
			else
				BattleController:getInstance():csRecordBattle(uv0.data.id, RoleController:getInstance():getRoleVo().srv_id)
			end

			uv0.play_num:setString(uv0.data.play + 1)

			if uv0.is_myself or uv0.is_collect then
				GlobalEvent:getInstance():Fire(VedioEvent.UpdateVedioDataEvent, uv1:updateVedioData(uv0.vedioType, uv0.data.id, "play", uv0.data.play + 1))
			end

			if uv0._playCallBack then
				uv0._playCallBack()
			end
		end
	end, true, 1)
	registerButtonEventListener(slot0.share_btn, function (slot0, slot1)
		if uv0.data.channel and uv0.data.channel == ChatConst.Channel.Cross then
			message(TI18N("抱歉，跨服分享的录像无法收藏、点赞和分享"))

			return
		end

		if uv0._shareCallBack and slot1 then
			slot2 = slot1:convertToWorldSpace(cc.p(0.5, 0))
			slot3 = nil

			if uv0.data.combat_type == BattleConst.Fight_Type.CrossChampion and uv0.data.ext and next(uv0.data.ext) ~= nil then
				for slot7, slot8 in pairs(uv0.data.ext) do
					if slot8.key == 1 then
						slot3 = slot8.str or uv0.data.a_srv_id

						break
					end
				end
			else
				slot3 = uv0.data.a_srv_id
			end

			uv0._shareCallBack(slot2, uv0.data.id, uv0.data.share + 1, slot3, uv0.data.combat_type)
		end
	end, true, 1)
	registerButtonEventListener(slot0.info_btn, function ()
		uv0:_onClickInfoBtn()
	end, true, 1)
	registerButtonEventListener(slot0.collect_btn, function ()
		if uv0.data then
			if uv0.data.channel and uv0.data.channel == ChatConst.Channel.Cross then
				message(TI18N("抱歉，跨服分享的录像无法收藏、点赞和分享"))

				return
			end

			slot0 = nil

			if uv0.data.combat_type == BattleConst.Fight_Type.CrossChampion and uv0.data.ext and next(uv0.data.ext) ~= nil then
				for slot4, slot5 in pairs(uv0.data.ext) do
					if slot5.key == 1 then
						slot0 = slot5.str or uv0.data.a_srv_id

						break
					end
				end
			else
				slot0 = uv0.data.a_srv_id
			end

			if uv0.data.is_collect == TRUE then
				uv0.data.is_collect = 0

				uv0.collect_btn:loadTexture(PathTool.getResFrame("vedio", "txt_cn_vedio_collect"), LOADTEXT_TYPE_PLIST)
				uv1:requestCollectVedio(uv0.data.id, 0, slot0, uv0.data.combat_type)

				if uv0.is_myself or uv0.is_collect then
					GlobalEvent:getInstance():Fire(VedioEvent.UpdateVedioDataEvent, uv2:updateVedioData(uv0.vedioType, uv0.data.id, "is_collect", 0))
				end
			else
				uv1:requestCollectVedio(uv0.data.id, 1, slot0, uv0.data.combat_type, uv0.vedioType)
			end
		end
	end, true, 1)
	registerButtonEventListener(slot0.like_btn, function ()
		if uv0.data then
			if uv0.data.channel and uv0.data.channel == ChatConst.Channel.Cross then
				message(TI18N("抱歉，跨服分享的录像无法收藏、点赞和分享"))

				return
			end

			if uv1:checkTodayLikeIsFull() then
				message(TI18N("今日点赞次数已用完"))

				return
			end

			uv0.data.flag = 1

			if uv0.data.combat_type == BattleConst.Fight_Type.CrossChampion then
				if uv0.data.ext and next(uv0.data.ext) ~= nil then
					slot0 = nil

					for slot4, slot5 in pairs(uv0.data.ext) do
						if slot5.key == 1 then
							slot0 = slot5.str or uv0.data.a_srv_id

							break
						end
					end

					uv2:requestLikeVedio(uv0.data.id, slot0, uv0.data.combat_type)
				end
			else
				uv2:requestLikeVedio(uv0.data.id, uv0.data.a_srv_id, uv0.data.combat_type)
			end

			uv0.like_btn:setTouchEnabled(false)
			setChildUnEnabled(true, uv0.like_btn)
			uv0.like_btn:loadTexture(PathTool.getResFrame("vedio", "txt_cn_vedio_like_2"), LOADTEXT_TYPE_PLIST)
			addRedPointToNodeByStatus(uv0.like_btn, false)

			if uv0.data.like then
				uv0.like_num:setString(uv0.data.like + 1)
			end

			uv1:updateVedioData(uv0.vedioType, uv0.data.id, "flag", 1)

			if uv0.is_myself or uv0.is_collect then
				GlobalEvent:getInstance():Fire(VedioEvent.UpdateVedioDataEvent, uv1:updateVedioData(uv0.vedioType, uv0.data.id, "like", uv0.data.like + 1))
			end
		end
	end, true, 1)

	if not slot0.update_self_event then
		slot0.update_self_event = GlobalEvent:getInstance():Bind(VedioEvent.UpdateVedioDataEvent, function (slot0)
			if uv0.data and slot0 and uv0.data.id == slot0.id then
				uv0:setData(slot0)
			end
		end)
	end

	if not slot0.update_like_num_event then
		slot0.update_like_num_event = GlobalEvent:getInstance():Bind(VedioEvent.UpdateTodayLikeNum, function (slot0)
			if uv0.vedioType == VedioConst.Tab_Index.Hot or uv0.vedioType == VedioConst.Tab_Index.Newhero then
				uv0:updateLikeBtnRedStatus()
			end
		end)
	end
end

function VedioMainItem._onClickInfoBtn(slot0)
	if slot0.data then
		slot1 = {
			atk_name = slot0.data.a_name,
			target_role_name = slot0.data.b_name,
			hurt_statistics = {},
			vedio_id = slot0.data.id
		}

		if slot0.data.combat_type == BattleConst.Fight_Type.CrossChampion and slot0.data.ext and next(slot0.data.ext) ~= nil then
			for slot5, slot6 in pairs(slot0.data.ext) do
				if slot6.key == 1 then
					slot1.srv_id = slot6.str

					break
				end
			end
		end

		slot1.srv_id = slot1.srv_id or slot0.data.a_srv_id
		slot1.combat_type = slot0.data.combat_type

		if slot0.data.ret == 1 then
			slot1.result = 1
		elseif slot0.data.ret == 2 then
			slot1.result = 2
		end

		for slot5 = 1, 2 do
			slot6 = {
				type = slot5,
				partner_hurts = {}
			}

			if slot5 == 1 then
				for slot10, slot11 in ipairs(slot0.data.a_plist) do
					slot11.rid = slot0.data.a_rid
					slot11.srvid = slot0.data.a_srv_id

					uv0(slot6.partner_hurts, slot11)
				end
			else
				for slot10, slot11 in ipairs(slot0.data.b_plist) do
					slot11.rid = slot0.data.b_rid
					slot11.srvid = slot0.data.b_srv_id

					uv0(slot6.partner_hurts, slot11)
				end
			end

			table.insert(slot1.hurt_statistics, slot6)
		end

		BattleController:getInstance():openBattleHarmInfoView(true, slot1)
	end
end

function VedioMainItem.updateLikeBtnRedStatus(slot0)
	slot1 = false

	if slot0.default_index and slot0.vedioType and slot0.default_index == slot0.vedioType and not slot0.is_myself and slot0.data and slot0.data.flag ~= TRUE and not uv0:checkTodayLikeIsFull() then
		slot1 = true
	end

	addRedPointToNodeByStatus(slot0.like_btn, slot1, 5, 5)
end

function VedioMainItem.addCallBack(slot0, slot1)
	slot0._shareCallBack = slot1
end

function VedioMainItem.addPlayCallBack(slot0, slot1)
	slot0._playCallBack = slot1
end

function VedioMainItem.setExtendData(slot0, slot1)
	if slot1 then
		slot0.is_myself = slot1.is_myself or false
		slot0.is_collect = slot1.is_collect or false
		slot0.is_hot = slot1.is_hot or false
		slot0.is_newhero = slot1.is_newhero or false
		slot0.default_index = slot1.default_index or VedioConst.Tab_Index.Hot
	end
end

function VedioMainItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1
	slot2 = 0
	slot3 = 0
	slot4 = {}
	slot5 = {}
	slot6 = 0
	slot7 = 0
	slot10 = slot0.data.ext or {}

	for slot11, slot12 in pairs(slot10) do
		if slot12.key == 2 then
			slot2 = slot12.val or 0
		elseif slot12.key == 3 then
			slot4 = slot12.ext_list or {}
		elseif slot12.key == 4 then
			slot3 = slot12.val or 0
		elseif slot12.key == 5 then
			slot5 = slot12.ext_list or {}
		elseif slot12.key == 6 then
			slot6 = slot12.val or 0
		elseif slot12.key == 7 then
			slot7 = slot12.val or 0
		end
	end

	slot0.type_txt:setString(slot1.name)

	slot8 = 0
	slot9 = slot1.combat_type

	if Config.CombatTypeData.data_fight_list and slot10[slot9] then
		slot8 = slot10[slot9].max_action_count or 0
	end

	slot0.round_txt:setString(string.format(TI18N("%d/%d回合"), slot1.round or 0, slot8))
	slot0.time_txt:setString(TimeTool.getYMDHM(slot1.time))
	slot0.play_num:setString(slot1.play)
	slot0.share_num:setString(slot1.share)
	slot0.like_num:setString(slot1.like)

	if slot1.is_collect == TRUE then
		slot0.collect_btn:loadTexture(PathTool.getResFrame("vedio", "txt_cn_vedio_un_collect"), LOADTEXT_TYPE_PLIST)
	else
		slot0.collect_btn:loadTexture(PathTool.getResFrame("vedio", "txt_cn_vedio_collect"), LOADTEXT_TYPE_PLIST)
	end

	if slot0.is_myself then
		slot0.like_btn:setTouchEnabled(false)
		setChildUnEnabled(true, slot0.like_btn)
		slot0.like_btn:loadTexture(PathTool.getResFrame("vedio", "txt_cn_vedio_like"), LOADTEXT_TYPE_PLIST)
	elseif slot1.flag == TRUE then
		slot0.like_btn:setTouchEnabled(false)
		setChildUnEnabled(false, slot0.like_btn)
		slot0.like_btn:loadTexture(PathTool.getResFrame("vedio", "txt_cn_vedio_like_2"), LOADTEXT_TYPE_PLIST)
	else
		slot0.like_btn:setTouchEnabled(true)
		setChildUnEnabled(false, slot0.like_btn)
		slot0.like_btn:loadTexture(PathTool.getResFrame("vedio", "txt_cn_vedio_like"), LOADTEXT_TYPE_PLIST)
	end

	if slot0.data.channel and slot0.data.channel == ChatConst.Channel.Cross then
		setChildUnEnabled(true, slot0.collect_btn)
		setChildUnEnabled(true, slot0.like_btn)
		setChildUnEnabled(true, slot0.share_btn)
	else
		setChildUnEnabled(false, slot0.collect_btn)
		setChildUnEnabled(false, slot0.share_btn)

		if not slot0.is_myself then
			setChildUnEnabled(false, slot0.like_btn)
		end
	end

	if slot0.is_hot then
		slot0.vedioType = VedioConst.Tab_Index.Hot
	elseif slot0.is_newhero then
		slot0.vedioType = VedioConst.Tab_Index.Newhero
	elseif slot1.combat_type == BattleConst.Fight_Type.Arena then
		slot0.vedioType = VedioConst.Tab_Index.Arena
	elseif slot1.combat_type == BattleConst.Fight_Type.Champion then
		slot0.vedioType = VedioConst.Tab_Index.Champion
	elseif slot1.combat_type == BattleConst.Fight_Type.PK then
		slot0.vedioType = VedioConst.Tab_Index.Solo
	elseif slot1.combat_type == BattleConst.Fight_Type.GuildWar then
		slot0.vedioType = VedioConst.Tab_Index.Guildwar
	elseif slot1.combat_type == BattleConst.Fight_Type.LadderWar then
		slot0.vedioType = VedioConst.Tab_Index.Ladder
	elseif slot1.combat_type == BattleConst.Fight_Type.EliteMatchWar or slot1.combat_type == BattleConst.Fight_Type.EliteKingMatchWar then
		slot0.vedioType = VedioConst.Tab_Index.Elite
	elseif slot1.combat_type == BattleConst.Fight_Type.CrossChampion then
		slot0.vedioType = VedioConst.Tab_Index.Crosschampion
	end

	slot0.result_win:setVisible(true)
	slot0.result_loss:setVisible(true)

	if slot1.ret == 1 then
		slot0.result_win:setPosition(cc.p(27, 431))
		slot0.result_loss:setPosition(cc.p(593, 431))
	elseif slot1.ret == 2 then
		slot0.result_win:setPosition(cc.p(593, 431))
		slot0.result_loss:setPosition(cc.p(27, 431))
	else
		slot0.result_win:setVisible(false)
		slot0.result_loss:setVisible(false)
	end

	slot0:updateLikeBtnRedStatus()
	slot0.name_left:setString(transformNameByServ(slot1.a_name, slot1.a_srv_id))

	if slot1.combat_type == BattleConst.Fight_Type.Champion then
		slot0.challenge_left:setVisible(false)
	else
		slot0.challenge_left:setVisible(true)
		slot0.challenge_left:setString(TI18N("挑战方"))
		slot0.challenge_left:setTextColor(VedioConst.Color.Atk)
	end

	slot0:showPvpArrowUI(1, slot6)
	slot0.atk_label_left:setString(slot1.a_power + slot6)
	slot0.level_left:setString(slot1.a_lev .. TI18N("级"))
	slot0.level_left:setPositionX(slot0.name_left:getPositionX() + slot0.name_left:getContentSize().width + 10)

	if slot1.combat_type == BattleConst.Fight_Type.Arena then
		if slot1.a_rank > 0 then
			slot0.rank_label_left:setString(slot1.a_rank)
		else
			slot0.rank_label_left:setString(TI18N("暂无"))
		end

		slot0:showPvpText(false, 1)
		slot0.image_rank_left:setVisible(true)
		slot0.rank_title_left:setVisible(true)
		slot0.rank_label_left:setVisible(true)
	else
		slot0:showPvpText(true, 1, slot6)
		slot0.image_rank_left:setVisible(false)
		slot0.rank_title_left:setVisible(false)
		slot0.rank_label_left:setVisible(false)
	end

	slot12 = {}

	for slot16 = 1, 9 do
		slot19 = slot0.left_item_list[slot16]

		if slot0:getRoleInfoByIndex(VedioConst.Left_Role_Battle_Index[slot16], slot1.a_plist) then
			if slot19 == nil then
				slot0.left_item_list[slot16] = slot0:createHeroExhibitionItemByIndex(slot16, slot0.panel_role_left)
			else
				slot19:setVisible(true)
			end

			slot19:setData(slot18)
			slot19:addCallBack(function ()
				uv0:_onClickRoleHead(uv1, 1)
			end)
		elseif slot19 then
			slot19:setVisible(false)
		end
	end

	slot0.name_right:setString(transformNameByServ(slot1.b_name, slot1.b_srv_id))

	if slot1.combat_type == BattleConst.Fight_Type.Champion then
		slot0.challenge_right:setVisible(false)
	else
		slot0.challenge_right:setVisible(true)
		slot0.challenge_right:setString(TI18N("防守方"))
		slot0.challenge_right:setTextColor(VedioConst.Color.Def)
	end

	slot0:showPvpArrowUI(2, slot7)
	slot0.atk_label_right:setString(slot1.b_power + slot7)
	slot0.level_right:setString(slot1.b_lev .. TI18N("级"))
	slot0.level_right:setPositionX(slot0.name_right:getPositionX() - slot0.name_right:getContentSize().width - 10)

	if slot1.combat_type == BattleConst.Fight_Type.Arena then
		if slot1.b_rank > 0 then
			slot0.rank_label_right:setString(slot1.b_rank)
		else
			slot0.rank_label_right:setString(TI18N("暂无"))
		end

		slot0:showPvpText(false, 2)
		slot0.image_rank_right:setVisible(true)
		slot0.rank_label_right:setVisible(true)
		slot0.rank_title_right:setVisible(true)
	else
		slot0:showPvpText(true, 2, slot7)
		slot0.image_rank_right:setVisible(false)
		slot0.rank_label_right:setVisible(false)
		slot0.rank_title_right:setVisible(false)
	end

	slot14 = {}

	for slot18 = 1, 9 do
		slot21 = slot0.right_item_list[slot18]

		if slot0:getRoleInfoByIndex(VedioConst.Right_Role_Battle_Index[slot18], slot1.b_plist) then
			if slot21 == nil then
				slot0.right_item_list[slot18] = slot0:createHeroExhibitionItemByIndex(slot18, slot0.panel_role_right)
			else
				slot21:setVisible(true)
			end

			slot21:setData(slot20)
			slot21:addCallBack(function ()
				uv0:_onClickRoleHead(uv1, 2)
			end)
		elseif slot21 then
			slot21:setVisible(false)
		end
	end

	slot0.tree_lv_left:setString(uv0(TI18N("佩罗娜：%d级"), slot2))

	slot18 = uv0

	slot0.tree_lv_right:setString(slot18(TI18N("佩罗娜：%d级"), slot3))

	for slot18 = 1, 4 do
		if not slot0.left_elfin_list[slot18] then
			slot19 = SkillItem.new(true, true, true, 0.4, true)

			slot19:setPosition(cc.p(22 + (slot18 - 1) * 54, 24))
			slot0.panel_elfin_left:addChild(slot19)

			slot0.left_elfin_list[slot18] = slot19
		end

		slot0:setElfinSkillItemData(slot19, slot4, slot18)

		if not slot0.right_elfin_list[slot18] then
			slot20 = SkillItem.new(true, true, true, 0.4, true)

			slot20:setPosition(cc.p(22 + (slot18 - 1) * 54, 24))
			slot0.panel_elfin_right:addChild(slot20)

			slot0.right_elfin_list[slot18] = slot20
		end

		slot0:setElfinSkillItemData(slot20, slot5, slot18)
	end
end

function VedioMainItem.showPvpArrowUI(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	if slot1 == 1 then
		if slot2 and slot2 > 0 then
			if slot0.left_pvp_arrow == nil then
				slot0.left_pvp_arrow = createImage(slot0.container, PathTool.getResFrame("common", "common_1086"), 170, 98, cc.p(0.5, 0.5), true)

				slot0.left_pvp_arrow:setScale(0.9)
			else
				slot0.left_pvp_arrow:setVisible(true)
			end
		elseif slot0.left_pvp_arrow then
			slot0.left_pvp_arrow:setVisible(false)
		end
	elseif slot1 == 2 then
		if slot2 and slot2 > 0 then
			if slot0.right_pvp_arrow == nil then
				slot0.right_pvp_arrow = createImage(slot0.container, PathTool.getResFrame("common", "common_1086"), 454, 98, cc.p(0.5, 0.5), true)

				slot0.right_pvp_arrow:setScale(0.9)
			else
				slot0.right_pvp_arrow:setVisible(true)
			end
		elseif slot0.right_pvp_arrow then
			slot0.right_pvp_arrow:setVisible(false)
		end
	end
end

function VedioMainItem.showPvpText(slot0, slot1, slot2, slot3)
	if not slot2 then
		return
	end

	if slot2 == 1 then
		if slot1 and slot3 and slot3 > 0 then
			if slot0.left_show_pvp_tips == nil then
				slot0.left_show_pvp_tips = createLabel(20, cc.c3b(36, 144, 3), nil, 107, 66, TI18N("（公会pvp）"), slot0.container, nil, cc.p(0.5, 0.5))
			else
				slot0.left_show_pvp_tips:setVisible(true)
			end
		elseif slot0.left_show_pvp_tips then
			slot0.left_show_pvp_tips:setVisible(false)
		end
	elseif slot2 == 2 then
		if slot1 and slot3 and slot3 > 0 then
			if slot0.right_show_pvp_tips == nil then
				slot0.right_show_pvp_tips = createLabel(20, cc.c3b(36, 144, 3), nil, 555, 66, TI18N("（公会pvp）"), slot0.container, nil, cc.p(0.5, 0.5))
			else
				slot0.right_show_pvp_tips:setVisible(true)
			end
		elseif slot0.right_show_pvp_tips then
			slot0.right_show_pvp_tips:setVisible(false)
		end
	end
end

function VedioMainItem.getElfinBidByPos(slot0, slot1, slot2)
	if not slot1 or next(slot1) == nil then
		return
	end

	for slot6, slot7 in pairs(slot1) do
		if slot7.ext_list_key == slot2 then
			return slot7.ext_list_val
		end
	end
end

function VedioMainItem.setElfinSkillItemData(slot0, slot1, slot2, slot3)
	if slot0:getElfinBidByPos(slot2, slot3) then
		slot1:showLockIcon(false)

		if slot4 == 0 or not Config.SpriteData.data_elfin_data(slot4) then
			slot1:setData()
			slot1:showLevel(false)
		elseif Config.SkillData.data_get_skill(slot5.skill) then
			slot1:showLevel(true)
			slot1:setData(slot6)
		end
	else
		slot1:setData()
		slot1:showLevel(false)
		slot1:showLockIcon(true)
	end
end

function VedioMainItem.createHeroExhibitionItemByIndex(slot0, slot1, slot2)
	slot3 = HeroExhibitionItem.new(0.5, true, nil, nil, true)

	slot3:setPosition(slot0.postion_list[slot1] or cc.p(0, 0))
	slot2:addChild(slot3)
	slot3:setVisible(true)

	return slot3
end

function VedioMainItem._onClickRoleHead(slot0, slot1, slot2)
	if not slot1 or not slot0.data then
		return
	end

	slot3 = nil

	if slot0.data.combat_type == BattleConst.Fight_Type.CrossChampion and slot0.data.ext and next(slot0.data.ext) ~= nil then
		for slot7, slot8 in pairs(slot0.data.ext) do
			if slot8.key == 1 then
				slot3 = slot8.str or slot0.data.a_srv_id

				break
			end
		end
	else
		slot3 = slot0.data.a_srv_id
	end

	uv0:requestVedioHeroData(slot0.data.id, slot1.id, slot2, slot3, slot0.data.combat_type)
end

function VedioMainItem.getRoleInfoByIndex(slot0, slot1, slot2)
	for slot6, slot7 in pairs(slot2) do
		if slot7.pos == slot1 then
			return slot7
		end
	end

	return nil
end

function VedioMainItem.DeleteMe(slot0)
	if slot0.left_item_list then
		for slot4, slot5 in pairs(slot0.left_item_list) do
			slot5:DeleteMe()
		end

		slot0.left_item_list = nil
	end

	if slot0.right_item_list then
		for slot4, slot5 in pairs(slot0.right_item_list) do
			slot5:DeleteMe()
		end

		slot0.right_item_list = nil
	end

	if slot0.left_elfin_list then
		for slot4, slot5 in pairs(slot0.left_elfin_list) do
			slot5:DeleteMe()

			slot5 = nil
		end
	end

	if slot0.right_elfin_list then
		for slot4, slot5 in pairs(slot0.right_elfin_list) do
			slot5:DeleteMe()

			slot5 = nil
		end
	end

	if slot0.update_self_event then
		GlobalEvent:getInstance():UnBind(slot0.update_self_event)

		slot0.update_self_event = nil
	end

	if slot0.update_like_num_event then
		GlobalEvent:getInstance():UnBind(slot0.update_like_num_event)

		slot0.update_like_num_event = nil
	end
end
