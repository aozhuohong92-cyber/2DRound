slot1 = ArenaManyPeopleController:getInstance():getModel()
slot2 = string.format
slot3 = table.sort
ArenaManyPeopleMatchingWindow = ArenaManyPeopleMatchingWindow or BaseClass(BaseView)

function ArenaManyPeopleMatchingWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("arenampmatch", "arenampmatch_bg"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("arenampmatch", "arenampmatch"),
			type = ResourcesType.plist
		}
	}
	slot0.layout_name = "arenamanypeople/amp_matching_window"
	slot0.is_match = false
	slot0.is_matching = false
	slot0.left_panel_list = {}
	slot0.right_panel_list = {}
	slot0.role_vo = RoleController:getInstance():getRoleVo()
end

function ArenaManyPeopleMatchingWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.container = slot0.root_wnd:getChildByName("main_container")
	slot0.left_btn = slot0.container:getChildByName("left_btn")

	slot0.left_btn:getChildByName("label"):setString(TI18N("重新匹配"))

	slot0.left_tips = createRichLabel(22, cc.c4b(255, 238, 172, 255), cc.p(0.5, 0.5), cc.p(80, -20), nil, nil, 600)

	slot0.left_btn:addChild(slot0.left_tips)

	slot0.right_btn = slot0.container:getChildByName("right_btn")

	slot0.right_btn:getChildByName("label"):setString(TI18N("确 定"))

	slot0.tips_lab = slot0.container:getChildByName("tips_lab")

	slot0.tips_lab:setString(TI18N("匹配中"))

	slot0.effect_panel = slot0.container:getChildByName("effect_panel")
	slot0.vs_img = slot0.container:getChildByName("vs_img")

	slot0.vs_img:setVisible(false)

	slot0.big_bg = slot0.container:getChildByName("big_bg")

	slot0.big_bg:setVisible(true)
	loadSpriteTexture(slot0.big_bg, PathTool.getPlistImgForDownLoad("arenampmatch", "arenampmatch_bg"), LOADTEXT_TYPE)

	slot5 = cc.p(0.5, 0.5)
	slot0.step_time = createRichLabel(22, cc.c4b(255, 238, 172, 255), slot5, cc.p(360, 223), nil, nil, 600)

	slot0.container:addChild(slot0.step_time)

	function slot1(slot0, slot1, slot2)
		slot3 = {
			fight_panel = uv0.container:getChildByName(slot0)
		}

		slot3.fight_panel:setVisible(false)

		slot3.role_name = slot3.fight_panel:getChildByName("role_name")
		slot3.score_num = slot3.fight_panel:getChildByName("score_num")
		slot3.power_num = slot3.fight_panel:getChildByName("power_num")
		slot3.lev_icon = slot3.fight_panel:getChildByName("lev_icon")
		slot4 = PlayerHead.new(PlayerHead.type.circle)

		slot4:setHeadLayerScale(0.9)
		slot4:setPosition(125, 65)
		slot3.fight_panel:addChild(slot4)

		slot3.head_icon = slot4

		if slot1 and slot1 == true then
			slot4:addCallBack(function ()
				uv0:onClickHead(uv1)
			end)
		end

		return slot3
	end

	for slot5 = 1, 3 do
		slot0.left_panel_list[slot5] = slot1("left_" .. slot5, true, slot5)
		slot0.right_panel_list[slot5] = slot1("right_" .. slot5, false, slot5)
	end
end

function ArenaManyPeopleMatchingWindow.register_event(slot0)
	registerButtonEventListener(slot0.left_btn, function ()
		uv0:onLeftBtn()
	end, true)
	registerButtonEventListener(slot0.right_btn, function ()
		uv0:onRightBtn()
	end, true)
	slot0:addGlobalEvent(ArenaManyPeopleEvent.ARENAMANYPOEPLE_MATCH_OTHER_EVENT, function (slot0)
		if slot0 then
			uv0:setData(false)
		end
	end)
end

function ArenaManyPeopleMatchingWindow.onLeftBtn(slot0)
	if not slot0.data then
		return
	end

	if slot0.is_matching then
		message(TI18N("匹配中..."))

		return
	end

	if Config.HolidayArenaTeamData.data_const.team_refresh_num and slot1.val < slot0.data.ref_count + 1 then
		message(TI18N("已达到今日刷新次数上限"))

		return
	end

	slot0.right_btn:setVisible(false)
	slot0.left_btn:setVisible(false)
	slot0.vs_img:setVisible(false)
	slot0:playMatchEffect(true)
	slot0:playMatchEffect2(false)

	slot0.is_matching = true
	slot0.is_data_back = false
	slot0.is_time_out = false

	slot0:setBtnTime()
	slot0.step_time:stopAllActions()

	slot5 = ""

	slot0.step_time:setString(slot5)

	for slot5, slot6 in ipairs(slot0.left_panel_list) do
		if slot6 and slot6.fight_panel then
			slot6.fight_panel:setVisible(false)
		end
	end

	for slot5, slot6 in ipairs(slot0.right_panel_list) do
		if slot6 and slot6.fight_panel then
			slot6.fight_panel:setVisible(false)
		end
	end

	uv0:sender29017()
	delayRun(slot0.container, 2, function ()
		uv0.is_time_out = true

		uv0:setDataByCondition()
	end)
end

function ArenaManyPeopleMatchingWindow.onRightBtn(slot0)
	uv0:sender29018()
	uv0:openArenaManyPeopleMatchingWindow(false)
	uv0:openArenaManyPeopleFightTips(true)
end

function ArenaManyPeopleMatchingWindow.onClickHead(slot0, slot1)
	if slot0.left_panel_list and slot2[slot1] and slot2[slot1].head_icon:getData() then
		slot3 = slot2[slot1].head_icon:getData()

		if slot0.role_vo and slot3.rid == slot0.role_vo.rid and slot3.sid == slot0.role_vo.srv_id then
			message(TI18N("这是你自己~"))

			return
		end

		FriendController:getInstance():openFriendCheckPanel(true, {
			srv_id = slot3.sid,
			rid = slot3.rid
		})
	end
end

function ArenaManyPeopleMatchingWindow.openRootWnd(slot0)
	slot0.is_time_out = false
	slot0.is_matching = false

	slot0:setData(true)
end

function ArenaManyPeopleMatchingWindow.setData(slot0, slot1)
	if not uv0:getMatchInfo() then
		return
	end

	slot0.data = slot2

	if slot1 == true then
		slot0.right_btn:setVisible(false)
		slot0.left_btn:setVisible(false)
		slot0.vs_img:setVisible(false)
		slot0:playMatchEffect(true)
		slot0:playMatchEffect2(false)

		slot0.is_matching = true
		slot0.is_data_back = false

		slot0.step_time:stopAllActions()

		slot6 = ""

		slot0.step_time:setString(slot6)
		slot0:setBtnTime()

		for slot6, slot7 in ipairs(slot0.left_panel_list) do
			if slot7 and slot7.fight_panel then
				slot7.fight_panel:setVisible(false)
			end
		end

		for slot6, slot7 in ipairs(slot0.right_panel_list) do
			if slot7 and slot7.fight_panel then
				slot7.fight_panel:setVisible(false)
			end
		end

		delayRun(slot0.container, 2, function ()
			uv0.is_time_out = true

			uv0:setDataByCondition()
		end)
	end

	if #slot0.data.atk_team_members > 0 and #slot0.data.def_team_members > 0 then
		slot0.is_data_back = true

		slot0:setDataByCondition()
	end
end

function ArenaManyPeopleMatchingWindow.setDataByCondition(slot0)
	if slot0.is_time_out and slot0.is_data_back then
		slot0.tips_lab:stopAllActions()
		slot0.tips_lab:setString("")

		slot0.is_match = true

		slot0:playMatchEffect(false)
		slot0:playMatchEffect2(true)
		slot0:updateLeftInfo()
		slot0:updateRightInfo()
		slot0:actionVs()

		slot0.is_matching = false

		if slot0.data then
			if slot0.data.end_time - GameNet:getInstance():getTime() < 0 then
				slot1 = 0
			end

			slot0:setStepTime(slot1)
		end
	end
end

function ArenaManyPeopleMatchingWindow.updateLeftInfo(slot0)
	if slot0.data then
		slot1 = slot0.data.atk_team_members
		slot5 = SortTools.KeyUpperSorter

		uv0(slot1, slot5("is_leader"))

		for slot5, slot6 in ipairs(slot1) do
			if slot0.left_panel_list[slot5] then
				slot7 = slot0.left_panel_list[slot5]

				slot7.role_name:setString(slot6.name)
				slot7.score_num:setString(uv1(TI18N("积分：%d"), slot6.score))
				slot7.power_num:setString(tostring(slot6.power))

				slot7.item_load = loadSpriteTextureFromCDN(slot7.lev_icon, PathTool.getPlistImgForDownLoad("arenampmatch/arenampmatch_icon", "amp_icon_" .. slot6.score_lev), ResourcesType.single, slot7.item_load)

				if slot7.head_icon then
					slot7.head_icon:setHeadData(slot6)
					slot7.head_icon:setHeadRes(slot6.face_id, false, LOADTEXT_TYPE, slot6.face_file, slot6.face_update_time)
					slot7.head_icon:setLev(slot6.lev)

					if slot6.is_leader == 1 then
						slot7.head_icon:showLeader(true)
					else
						slot7.head_icon:showLeader(false)
					end

					slot9 = slot6.avatar_bid

					if slot7.head_icon.record_res_bid == nil or slot7.head_icon.record_res_bid ~= slot9 then
						slot7.head_icon.record_res_bid = slot9

						if Config.AvatarData.data_avatar[slot9] then
							slot7.head_icon:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot10.res_id or 1), false, false), nil, false, slot10.offy)
						else
							slot7.head_icon:showBg(PathTool.getResFrame("common", "common_1031"), nil, true)
						end
					end
				end

				doStopAllActions(slot7.fight_panel)
				delayOnce(function ()
					if uv0 and uv0.fight_panel and not tolua.isnull(uv0.fight_panel) then
						uv0.fight_panel:setPositionX(86 - (uv1 - 1) * 68)

						slot1, slot2 = uv0.fight_panel:getPosition()

						uv0.fight_panel:setPosition(slot1 - 580, slot2)
						uv0.fight_panel:setVisible(true)
						uv0.fight_panel:runAction(cc.EaseBackOut:create(cc.MoveBy:create(0.2, cc.p(580, 0))))
					end

					if uv1 == 1 and uv2.vs_img and not tolua.isnull(uv2.vs_img) then
						uv2.vs_img:setVisible(true)
					end
				end, (3 - slot5) * 0.2)
			end
		end
	end
end

function ArenaManyPeopleMatchingWindow.updateRightInfo(slot0)
	if slot0.data then
		slot1 = slot0.data.def_team_members
		slot7 = "is_leader"

		uv0(slot1, SortTools.KeyUpperSorter(slot7))

		slot2 = uv1:getHideIndex()

		for slot6, slot7 in ipairs(slot1) do
			if slot0.right_panel_list[slot6] then
				slot8 = slot0.right_panel_list[slot6]

				slot8.role_name:setString(slot7.name)
				slot8.score_num:setString(uv2(TI18N("积分：%d"), slot7.score))

				if slot2 and slot6 == slot2 then
					slot8.power_num:setString("?")
				else
					slot8.power_num:setString(tostring(slot7.power))
				end

				slot8.item_load = loadSpriteTextureFromCDN(slot8.lev_icon, PathTool.getPlistImgForDownLoad("arenampmatch/arenampmatch_icon", "amp_icon_" .. slot7.score_lev), ResourcesType.single, slot8.item_load)

				if slot8.head_icon then
					slot8.head_icon:setHeadRes(slot7.face_id, false, LOADTEXT_TYPE, slot7.face_file, slot7.face_update_time)
					slot8.head_icon:setLev(slot7.lev)

					if slot7.is_leader == 1 then
						slot8.head_icon:showLeader(true)
					else
						slot8.head_icon:showLeader(false)
					end

					slot10 = slot7.avatar_bid

					if slot8.head_icon.record_res_bid == nil or slot8.head_icon.record_res_bid ~= slot10 then
						slot8.head_icon.record_res_bid = slot10

						if Config.AvatarData.data_avatar[slot10] then
							slot8.head_icon:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot11.res_id or 1), false, false), nil, false, slot11.offy)
						else
							slot8.head_icon:showBg(PathTool.getResFrame("common", "common_1031"), nil, true)
						end
					end
				end

				doStopAllActions(slot8.fight_panel)
				delayOnce(function ()
					if uv0 and uv0.fight_panel and not tolua.isnull(uv0.fight_panel) then
						uv0.fight_panel:setPositionX(253 - (uv1 - 1) * 68)

						slot1, slot2 = uv0.fight_panel:getPosition()

						uv0.fight_panel:setPosition(slot1 + 580, slot2)
						uv0.fight_panel:setVisible(true)
						uv0.fight_panel:runAction(cc.EaseBackOut:create(cc.MoveBy:create(0.2, cc.p(-580, 0))))
					end
				end, (slot6 - 1) * 0.2)
			end
		end
	end
end

function ArenaManyPeopleMatchingWindow.actionVs(slot0)
	doStopAllActions(slot0.vs_img)
	delayOnce(function ()
		if Config.HolidayArenaTeamData.data_const.team_refresh_num and uv0.data and slot0.val >= uv0.data.ref_count + 1 then
			if uv0.left_tips and not tolua.isnull(uv0.left_tips) then
				uv0.left_tips:setString(uv1(TI18N("剩余刷新次数：%d"), slot0.val - uv0.data.ref_count))
			end

			if uv0.left_btn and not tolua.isnull(uv0.left_btn) then
				uv0.left_btn:setVisible(true)
			end

			if uv0.right_btn and not tolua.isnull(uv0.right_btn) then
				uv0.right_btn:setPositionX(540)
				uv0.right_btn:setVisible(true)
			end
		else
			if uv0.right_btn and not tolua.isnull(uv0.right_btn) then
				uv0.right_btn:setPositionX(360)
				uv0.right_btn:setVisible(true)
			end

			if uv0.left_btn and not tolua.isnull(uv0.left_btn) then
				uv0.left_btn:setVisible(false)
			end
		end
	end, 0.6)
end

function ArenaManyPeopleMatchingWindow.setStepTime(slot0, slot1)
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

function ArenaManyPeopleMatchingWindow.setStepTimeFormatString(slot0, slot1)
	slot0.step_time:setString(string.format(TI18N("<div fontcolor=#75ec51 >%s</div>秒后自动进入战斗"), slot1))
end

function ArenaManyPeopleMatchingWindow.setBtnTime(slot0)
	if tolua.isnull(slot0.tips_lab) then
		return
	end

	slot0.tips_lab:stopAllActions()
	slot0:setBtnTimeFormatString(1)
	slot0.tips_lab:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(0.5), cc.CallFunc:create(function ()
		uv0 = uv0 + 1

		if uv0 > 4 then
			uv0 = 1
		end

		uv1:setBtnTimeFormatString(uv0)
	end))))
end

function ArenaManyPeopleMatchingWindow.setBtnTimeFormatString(slot0, slot1)
	if slot1 == 1 then
		slot0.tips_lab:setString(TI18N("匹配中."))
	elseif slot1 == 2 then
		slot0.tips_lab:setString(TI18N("匹配中.."))
	elseif slot1 == 3 then
		slot0.tips_lab:setString(TI18N("匹配中..."))
	else
		slot0.tips_lab:setString(TI18N("匹配中"))
	end
end

function ArenaManyPeopleMatchingWindow.playMatchEffect(slot0, slot1)
	if slot1 == true then
		if not tolua.isnull(slot0.effect_panel) and slot0.bg_effect == nil then
			slot0.bg_effect = createEffectSpine(Config.EffectData.data_effect_info[1771], cc.p(slot0.effect_panel:getContentSize().width / 2, slot0.effect_panel:getContentSize().height / 2), cc.p(0.5, 0.5), true, PlayerAction.action)

			slot0.effect_panel:addChild(slot0.bg_effect)
		end
	elseif slot0.bg_effect then
		slot0.bg_effect:clearTracks()
		slot0.bg_effect:removeFromParent()

		slot0.bg_effect = nil
	end
end

function ArenaManyPeopleMatchingWindow.playMatchEffect2(slot0, slot1)
	if slot1 == true then
		if not tolua.isnull(slot0.effect_panel) and slot0.bg_effect_2 == nil then
			slot0.bg_effect_2 = createEffectSpine(Config.EffectData.data_effect_info[1772], cc.p(slot0.effect_panel:getContentSize().width / 2, slot0.effect_panel:getContentSize().height / 2), cc.p(0.5, 0.5), false, PlayerAction.action, function ()
			end)

			slot0.effect_panel:addChild(slot0.bg_effect_2)
		end
	elseif slot0.bg_effect_2 then
		slot0.bg_effect_2:clearTracks()
		slot0.bg_effect_2:removeFromParent()

		slot0.bg_effect_2 = nil
	end
end

function ArenaManyPeopleMatchingWindow.close_callback(slot0)
	for slot4, slot5 in ipairs(slot0.left_panel_list) do
		if slot5 and slot5.head_icon then
			slot5.head_icon:DeleteMe()

			slot5.head_icon = nil
		end

		if slot5.fight_panel then
			doStopAllActions(slot5.fight_panel)
		end

		if slot5.item_load then
			slot5.item_load:DeleteMe()

			slot5.item_load = nil
		end
	end

	for slot4, slot5 in ipairs(slot0.right_panel_list) do
		if slot5 and slot5.head_icon then
			slot5.head_icon:DeleteMe()

			slot5.head_icon = nil
		end

		if slot5.fight_panel then
			doStopAllActions(slot5.fight_panel)
		end

		if slot5.item_load then
			slot5.item_load:DeleteMe()

			slot5.item_load = nil
		end
	end

	doStopAllActions(slot0.tips_lab)
	doStopAllActions(slot0.step_time)
	doStopAllActions(slot0.vs_img)
	slot0:playMatchEffect(false)
	slot0:playMatchEffect2(false)
	uv0:openArenaManyPeopleMatchingWindow(false)
end
