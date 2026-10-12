slot1 = ArenateamController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format
slot4 = table.sort
ArenateamFightTips = ArenateamFightTips or BaseClass(BaseView)

function ArenateamFightTips.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("arenateam_form", "arenateam_form"),
			type = ResourcesType.plist
		}
	}
	slot0.layout_name = "arenateam/arenateam_fight_tips"
	slot0.atk_name_list = {}
	slot0.atk_txt_list = {}
	slot0.hero_item_list = {}
	slot0.my_atk_name_list = {}
	slot0.my_atk_txt_list = {}
	slot0.my_hero_item_list = {}
end

function ArenateamFightTips.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot0.container, 1)

	slot0.btn_challenge = slot0.container:getChildByName("btn_challenge")

	slot0.btn_challenge:getChildByName("label"):setString(TI18N("挑 战"))

	slot0.txt_name = createRichLabel(26, cc.c4b(249, 215, 78, 255), cc.p(1, 0.5), cc.p(669, 958), nil, , 1000)

	slot0.container:addChild(slot0.txt_name)

	slot0.txt_score = slot0.container:getChildByName("txt_score")
	slot0.txt_total_atk = slot0.container:getChildByName("txt_total_atk")
	slot0.txt_my_name = createRichLabel(26, cc.c4b(249, 215, 78, 255), cc.p(1, 0.5), cc.p(669, 485), nil, , 1000)

	slot0.container:addChild(slot0.txt_my_name)

	slot0.txt_my_score = slot0.container:getChildByName("txt_my_score")
	slot0.txt_my_total_atk = slot0.container:getChildByName("txt_my_total_atk")
	slot0.skip_battle_btn = slot0.container:getChildByName("skip_battle_btn")

	slot0.skip_battle_btn:setVisible(true)

	slot0.is_skip_fight = SysEnv:getInstance():getBool(SysEnv.keys.arenateam_skip_fight, true)

	slot0.skip_battle_btn:setSelected(slot0.is_skip_fight)
	slot0.skip_battle_btn:getChildByName("name"):setString(TI18N("跳过战斗"))

	slot0.btn_form = slot0.container:getChildByName("btn_form")

	slot0.btn_form:getChildByName("label"):setString(TI18N("调整布阵"))

	slot0.change_pos_btn_1 = slot0.container:getChildByName("change_pos_btn_1")
	slot4 = "change_pos_btn_2"
	slot0.change_pos_btn_2 = slot0.container:getChildByName(slot4)

	for slot4 = 1, 3 do
		if slot0.container:getChildByName("title_team_" .. slot4) then
			slot5:setString(TI18N("队伍") .. StringUtil.numToChinese(slot4))

			slot0.atk_name_list[slot4] = slot5
		end

		if slot0.container:getChildByName("txt_atk_" .. slot4) then
			uv0(slot0.atk_txt_list, slot6)
		end

		if slot0.container:getChildByName("title_my_team_" .. slot4) then
			slot7:setString(TI18N("队伍") .. StringUtil.numToChinese(slot4))

			slot0.my_atk_name_list[slot4] = slot7
		end

		if slot0.container:getChildByName("txt_my_atk_" .. slot4) then
			uv0(slot0.my_atk_txt_list, slot8)
		end
	end

	slot0.txt_head_node = slot0.container:getChildByName("txt_head_node")
	slot4 = "txt_my_head_node"
	slot0.txt_my_head_node = slot0.container:getChildByName(slot4)
	slot0.role_head_list = {}
	slot0.my_head_list = {}

	for slot4 = 1, 3 do
		slot0.role_head_list[slot4] = PlayerHead.new(PlayerHead.type.circle)

		slot0.role_head_list[slot4]:setHeadLayerScale(0.8)
		slot0.role_head_list[slot4]:setPosition(95 * (slot4 - 1), 0)
		slot0.txt_head_node:addChild(slot0.role_head_list[slot4])

		slot0.my_head_list[slot4] = PlayerHead.new(PlayerHead.type.circle)

		slot0.my_head_list[slot4]:setHeadLayerScale(0.8)
		slot0.my_head_list[slot4]:setPosition(95 * (slot4 - 1), 0)
		slot0.txt_my_head_node:addChild(slot0.my_head_list[slot4])
	end
end

function ArenateamFightTips.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openArenateamFightTips(false)
	end, false, 2)
	registerButtonEventListener(slot0.btn_form, function ()
		uv0:openArenateamFormPanel(true, {
			from_type = 2
		})
	end, true)
	registerButtonEventListener(slot0.btn_challenge, function ()
		uv0:onChallengeBtn()
	end, true)
	registerButtonEventListener(slot0.change_pos_btn_1, function ()
		uv0:changeTeamDataOrder(1)
	end, true)
	registerButtonEventListener(slot0.change_pos_btn_2, function ()
		uv0:changeTeamDataOrder(2)
	end, true)
	slot0.skip_battle_btn:addEventListener(function (slot0, slot1)
		uv0.is_skip_fight = uv0.skip_battle_btn:isSelected()
	end)
	slot0:addGlobalEvent(ArenateamEvent.ARENATEAM_MY_TEAM_INFO_EVENT, function (slot0)
		if slot0 then
			uv0:updateMyselfInfo(slot0)
		end
	end)
	slot0:addGlobalEvent(ArenateamEvent.ARENATEAM_SAVE_FROM_EVENT, function (slot0)
		if uv0.is_on_fight then
			uv0.is_on_fight = false

			if uv0.data and uv0.data.tid and uv0.data.srv_id then
				slot1 = nil

				uv1:sender27252(uv0.data.tid, uv0.data.srv_id, uv0.is_skip_fight and 1 or 0)
				uv1:openArenateamFightTips(false)
			end
		end
	end)
end

function ArenateamFightTips.onChallengeBtn(slot0)
	if not slot0.scdata then
		return
	end

	if slot0.data and slot0.data.tid and slot0.data.srv_id then
		slot1 = {}

		for slot5, slot6 in ipairs(slot0.scdata.arena_team_member) do
			uv0(slot1, {
				rid = slot6.rid,
				sid = slot6.sid,
				pos = slot6.pos,
				is_hide = slot6.is_hide
			})
		end

		slot0.is_on_fight = true

		uv1:sender27242(slot1)
	end
end

function ArenateamFightTips.openRootWnd(slot0, slot1)
	if not (slot1 or {}).data then
		return
	end

	slot0:setData(slot3)

	if uv0:getMyTeamDetailsInfo() then
		delayRun(slot0.container, 0.1, function ()
			uv0:updateMyselfInfo(uv1)
		end)
	else
		uv1:sender27221()
	end
end

function ArenateamFightTips.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0.txt_name:setString(uv0(TI18N("敌方队伍名:<div fontcolor=#a9bad2>%s</div>"), transformNameByServ(slot1.team_name, slot1.sid)))
	slot0.txt_score:setString(uv0(TI18N("积分:%d"), slot1.team_score))
	slot0.txt_total_atk:setString(slot1.team_power)

	slot3 = slot1.team_members or {}

	for slot7, slot8 in ipairs(slot3) do
		slot8.is_leader = 0

		for slot12, slot13 in ipairs(slot8.ext) do
			if slot13.extra_key == 1 then
				if slot13.extra_val == 1 then
					slot8.is_leader = 1
				else
					slot8.is_leader = -slot8.pos
				end
			end
		end
	end

	uv1(slot3, function (slot0, slot1)
		return slot1.is_leader < slot0.is_leader
	end)
	slot0:updateHeadInfo(slot0.role_head_list, slot3)

	for slot8, slot9 in ipairs(slot1.team_members or {}) do
		if slot0.atk_txt_list[slot8] then
			if slot9.is_hide == 1 then
				slot10:setString("???")
			else
				slot10:setString(slot9.power or 0)
			end
		end

		if slot0.atk_name_list[slot8] then
			slot0.atk_name_list[slot8]:setString(slot9.name)
		end

		if slot9.is_hide == 1 or not slot9.team_partner or next(slot9.team_partner) == nil then
			for slot14 = 1, 5 do
				delayRun(slot0.container, slot14 * 2 / display.DEFAULT_FPS, function ()
					slot0 = HeroExhibitionItem.new(0.7, true)

					slot0:setPosition(cc.p(230 + (uv0 - 1) * (HeroExhibitionItem.Width * 0.7 + 10), 826 - (uv1 - 1) * 100))
					uv2.container:addChild(slot0)
					slot0:showUnknownIcon(true)
					uv3(uv2.hero_item_list, slot0)
				end)
			end
		elseif slot9.team_partner then
			slot14 = SortTools.KeyLowerSorter

			table.sort(slot9.team_partner, slot14("pos"))

			for slot14 = 1, 5 do
				delayRun(slot0.container, slot14 * 2 / display.DEFAULT_FPS, function ()
					slot1 = HeroExhibitionItem.new(0.7, true)

					slot1:setPosition(cc.p(230 + (uv1 - 1) * (HeroExhibitionItem.Width * 0.7 + 10), 826 - (uv2 - 1) * 100))
					uv3.container:addChild(slot1)
					uv4(uv3.hero_item_list, slot1)

					if uv0.team_partner[uv1] then
						slot2 = HeroVo.New()
						slot2.bid = slot0.bid
						slot2.lev = slot0.lev
						slot2.star = slot0.star
						slot2.use_skin = slot0.use_skin

						slot1:setData(slot2)
					end
				end)
			end
		end
	end
end

function ArenateamFightTips.updateHeadInfo(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	for slot6, slot7 in ipairs(slot1) do
		if (slot2 or {})[slot6] then
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

function ArenateamFightTips.updateMyselfInfo(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.scdata = slot1
	slot3 = 0

	if uv0:getMyTeamInfo() then
		slot3 = slot2.score
	end

	slot0.txt_my_name:setString(uv1(TI18N("我方队伍名:<div fontcolor=#a9bad2>%s</div>"), slot0.scdata.team_name))
	slot0.txt_my_score:setString(uv1(TI18N("积分:%d"), slot3))
	slot0.txt_my_total_atk:setString(slot0.scdata.team_power)

	slot5 = slot1.arena_team_member or {}

	for slot9, slot10 in ipairs(slot5) do
		slot10.is_leader = 0

		for slot14, slot15 in ipairs(slot10.ext) do
			if slot15.extra_key == 1 then
				if slot15.extra_val == 1 then
					slot10.is_leader = 1
				else
					slot10.is_leader = -slot10.pos
				end
			end
		end
	end

	uv2(slot5, function (slot0, slot1)
		return slot1.is_leader < slot0.is_leader
	end)

	slot10 = slot5

	slot0:updateHeadInfo(slot0.my_head_list, slot10)

	slot6 = {
		[slot11.pos] = slot11
	}

	for slot10, slot11 in ipairs(slot5) do
		-- Nothing
	end

	for slot10 = 1, 3 do
		delayRun(slot0.container, slot10 * 2 / display.DEFAULT_FPS, function ()
			if uv0[uv1] then
				if uv2.my_atk_txt_list[uv1] then
					uv2.my_atk_txt_list[uv1]:setString(slot0.power or 0)
				end

				if uv2.my_atk_name_list[uv1] then
					uv2.my_atk_name_list[uv1]:setString(slot0.name)
				end

				table.sort(slot0.team_partner, function (slot0, slot1)
					return slot0.pos < slot1.pos
				end)

				uv2.my_hero_item_list[uv1] = uv2:updateHeroInfo(230, 352 - (uv1 - 1) * 100, slot0.team_partner, uv2.my_hero_item_list[uv1])
			end
		end)
	end
end

function ArenateamFightTips.updateHeroInfo(slot0, slot1, slot2, slot3, slot4)
	if slot4 == nil then
		slot4 = {}
	end

	for slot8 = 1, 5 do
		if slot4[slot8] == nil then
			slot9 = HeroExhibitionItem.new(0.7, true)

			slot9:setPosition(cc.p(slot1 + (slot8 - 1) * (HeroExhibitionItem.Width * 0.7 + 10), slot2))
			slot0.container:addChild(slot9)

			slot4[slot8] = slot9
		end

		if slot3[slot8] then
			slot9:setData(slot10)
		else
			slot9:setData(nil)
		end
	end

	return slot4
end

function ArenateamFightTips.changeTeamDataOrder(slot0, slot1)
	if not slot0.scdata then
		return
	end

	if slot1 == 1 then
		for slot5, slot6 in pairs(slot0.scdata.arena_team_member) do
			if slot6.pos == 1 then
				slot6.pos = 2
			elseif slot6.pos == 2 then
				slot6.pos = 1
			end
		end
	else
		for slot5, slot6 in pairs(slot0.scdata.arena_team_member) do
			if slot6.pos == 2 then
				slot6.pos = 3
			elseif slot6.pos == 3 then
				slot6.pos = 2
			end
		end
	end

	slot0:updateMyselfInfo(slot0.scdata)
end

function ArenateamFightTips.close_callback(slot0)
	SysEnv:getInstance():set(SysEnv.keys.arenateam_skip_fight, slot0.is_skip_fight, true)

	if slot0.my_head_list then
		for slot4, slot5 in ipairs(slot0.my_head_list) do
			slot5:DeleteMe()
		end

		slot0.my_head_list = {}
	end

	if slot0.role_head_list then
		for slot4, slot5 in ipairs(slot0.role_head_list) do
			slot5:DeleteMe()
		end

		slot0.role_head_list = {}
	end

	if slot0.hero_item_list then
		for slot4, slot5 in pairs(slot0.hero_item_list) do
			slot5:DeleteMe()
		end

		slot0.hero_item_list = nil
	end

	if slot0.my_hero_item_list then
		for slot4, slot5 in pairs(slot0.my_hero_item_list) do
			for slot9, slot10 in ipairs(slot5) do
				slot10:DeleteMe()
			end
		end

		slot0.my_hero_item_list = nil
	end

	uv0:openArenateamFightTips(false)
end
