slot1 = CrossarenaController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format
CrossarenaRoleTips = CrossarenaRoleTips or BaseClass(BaseView)

function CrossarenaRoleTips.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.layout_name = "crossarena/crossarena_role_tips"
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("form", "form"),
			type = ResourcesType.plist
		}
	}
	slot0.atk_txt_list = {}
	slot0.hero_item_list = {}
	slot0.my_atk_txt_list = {}
	slot0.my_hero_item_list = {}
	slot0.skip_cfg = Config.ArenaClusterData.data_const.arena_skip_count
end

function CrossarenaRoleTips.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot0.container, 1)

	slot0.btn_challenge = slot0.container:getChildByName("btn_challenge")
	slot1 = slot0.btn_challenge:getContentSize()
	slot0.btn_challenge_label = createRichLabel(26, cc.c3b(113, 40, 4), cc.p(0.5, 0.5), cc.p(slot1.width / 2, slot1.height / 2))

	slot0.btn_challenge_label:setString(TI18N("挑战"))
	slot0.btn_challenge:addChild(slot0.btn_challenge_label)

	slot0.ticket_bid = Config.ArenaClusterData.data_const.arena_ticket.val

	if Config.ItemData.data_get_data(slot0.ticket_bid) then
		slot0.btn_challenge_label:setString(uv0(TI18N("<img src='%s' scale=0.4 />3 挑战"), PathTool.getItemRes(slot2.icon)))
	end

	slot0.txt_name = slot0.container:getChildByName("txt_name")
	slot0.txt_level = slot0.container:getChildByName("txt_level")
	slot0.txt_score = slot0.container:getChildByName("txt_score")
	slot0.txt_my_name = slot0.container:getChildByName("txt_my_name")
	slot0.txt_my_level = slot0.container:getChildByName("txt_my_level")
	slot0.txt_my_score = slot0.container:getChildByName("txt_my_score")
	slot0.skip_battle_btn = slot0.container:getChildByName("skip_battle_btn")

	slot0.skip_battle_btn:setSelected(uv1:getCrossarenaAutoBattle() == 1)
	slot0.skip_battle_btn:getChildByName("name"):setString(TI18N("跳过战斗"))

	slot0.btn_form = slot0.container:getChildByName("btn_form")

	slot0.btn_form:getChildByName("label"):setString(TI18N("调整布阵"))

	slot0.change_pos_btn_1 = slot0.container:getChildByName("change_pos_btn_1")
	slot0.change_pos_btn_2 = slot0.container:getChildByName("change_pos_btn_2")

	for slot7 = 1, 3 do
		if slot0.container:getChildByName("title_team_" .. slot7) then
			slot8:setString(TI18N("队伍") .. StringUtil.numToChinese(slot7))
		end

		if slot0.container:getChildByName("txt_atk_" .. slot7) then
			uv2(slot0.atk_txt_list, slot9)
		end

		if slot0.container:getChildByName("title_my_team_" .. slot7) then
			slot10:setString(TI18N("队伍") .. StringUtil.numToChinese(slot7))
		end

		if slot0.container:getChildByName("txt_my_atk_" .. slot7) then
			uv2(slot0.my_atk_txt_list, slot11)
		end
	end

	slot0.role_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.role_head:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.role_head:setPosition(cc.p(95, 931))
	slot0.container:addChild(slot0.role_head)

	slot0.my_role_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.my_role_head:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.my_role_head:setPosition(cc.p(95, 466))
	slot0.container:addChild(slot0.my_role_head)
end

function CrossarenaRoleTips.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openCrossarenaRoleTips(false)
	end, false, 2)
	registerButtonEventListener(slot0.btn_form, function ()
		if uv0.data and uv0.data.rid and uv0.data.srv_id then
			HeroController:getInstance():openFormGoFightPanel(true, PartnerConst.Fun_Form.CrossArena, {
				rid = uv0.data.rid,
				srv_id = uv0.data.srv_id
			}, HeroConst.FormShowType.eFormFight)
		end
	end, true)
	registerButtonEventListener(slot0.btn_challenge, function ()
		if uv0.data and uv0.data.rid and uv0.data.srv_id then
			CrossarenaController:getInstance():sender25606(uv0.data.rid, uv0.data.srv_id)
			uv1:openCrossarenaRoleTips(false)
		end
	end, true)
	registerButtonEventListener(slot0.change_pos_btn_1, function ()
		uv0:changeTeamDataOrder(1)
	end, true)
	registerButtonEventListener(slot0.change_pos_btn_2, function ()
		uv0:changeTeamDataOrder(2)
	end, true)
	slot0.skip_battle_btn:addEventListener(function (slot0, slot1)
		if slot1 == ccui.CheckBoxEventType.selected then
			playButtonSound2()

			if uv0.skip_cfg and uv0.skip_cfg.val <= uv1:getCrossarenaChallengeNum() then
				uv1:setCrossarenaAutoBattle(1)
			else
				if uv0.skip_cfg then
					message(uv0.skip_cfg.desc)
				end

				uv0.skip_battle_btn:setSelected(false)
			end
		elseif slot1 == ccui.CheckBoxEventType.unselected then
			playButtonSound2()
			uv1:setCrossarenaAutoBattle(0)
		end
	end)
	slot0:addGlobalEvent(CrossarenaEvent.Update_Form_Data_Event, function (slot0)
		if slot0 and slot0.type == 1 then
			uv0:updateMyselfInfo(deepCopy(slot0.formations), true)
		end
	end)
	slot0:addGlobalEvent(CrossarenaEvent.Close_Form_Panle_Event, function (slot0)
		if slot0 then
			uv0:sender25604(1, slot0)
			uv1:updateMyselfInfo(slot0)
		end
	end)
end

function CrossarenaRoleTips.openRootWnd(slot0, slot1)
	slot0:setData(slot1)
	uv0:sender25605(1)
end

function CrossarenaRoleTips.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0.role_head:setHeadRes(slot1.face, false, LOADTEXT_TYPE, slot1.face_file, slot1.face_update_time)

	if Config.AvatarData.data_avatar[slot1.avatar_id or 0] then
		slot0.role_head:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot2.res_id or 1)), nil, false, slot2.offy)
	end

	slot0.role_head:setLev(slot1.lev)
	slot0.role_head:setSex(slot1.sex, cc.p(70, 4))
	slot0.txt_name:setString(transformNameByServ(slot1.name, slot1.srv_id))
	slot0.txt_level:setString(uv0(TI18N("%d级"), slot1.lev))
	slot0.txt_score:setString(uv0(TI18N("积分:%d"), slot1.score))
	table.sort(slot1.order_list or {}, SortTools.KeyLowerSorter("order"))

	for slot7, slot8 in ipairs(slot3) do
		if slot0.atk_txt_list[slot7] then
			if slot8.is_hidden == 1 then
				slot9:setString("???")
			else
				slot9:setString(slot8.power or 0)
			end
		end

		if slot8.is_hidden == 1 or not slot8.p_list or next(slot8.p_list) == nil then
			for slot13 = 1, 5 do
				delayRun(slot0.container, slot13 * 2 / display.DEFAULT_FPS, function ()
					slot0 = HeroExhibitionItem.new(0.7, true)

					slot0:setPosition(cc.p(230 + (uv0 - 1) * (HeroExhibitionItem.Width * 0.7 + 10), 826 - (uv1 - 1) * 100))
					uv2.container:addChild(slot0)
					uv3(uv2.hero_item_list, slot0)

					if uv4.is_hidden == 1 then
						slot0:showUnknownIcon(true)
					end
				end)
			end
		elseif slot8.p_list then
			slot13 = SortTools.KeyLowerSorter

			table.sort(slot8.p_list, slot13("pos"))

			for slot13 = 1, 5 do
				delayRun(slot0.container, slot13 * 2 / display.DEFAULT_FPS, function ()
					slot1 = HeroExhibitionItem.new(0.7, true)

					slot1:addCallBack(function ()
						if uv0 and uv0.rid and uv0.srv_id and uv1.order and uv0.pos then
							uv2:sender25603(uv0.rid, uv0.srv_id, uv1.order, uv0.pos)
						end
					end)
					slot1:setPosition(cc.p(230 + (uv1 - 1) * (HeroExhibitionItem.Width * 0.7 + 10), 826 - (uv3 - 1) * 100))
					uv4.container:addChild(slot1)
					uv5(uv4.hero_item_list, slot1)

					if uv0.p_list[uv1] then
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

	if RoleController:getInstance():getRoleVo() then
		slot0.my_role_head:setHeadRes(slot4.face_id, false, LOADTEXT_TYPE, slot4.face_file, slot4.face_update_time)
		slot0.txt_my_name:setString(slot4.name .. TI18N("(我)"))
		slot0.txt_my_level:setString(slot4.lev .. TI18N("级"))
		slot0.txt_my_score:setString(uv0(TI18N("积分:%d"), uv3:getMyCrossarenaScore()))
	end
end

function CrossarenaRoleTips.updateMyselfInfo(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	slot6 = SortTools.KeyLowerSorter

	table.sort(slot1, slot6("order"))

	slot0.team_list = slot1

	for slot6, slot7 in pairs(slot0.my_hero_item_list) do
		slot7:setVisible(false)
	end

	for slot6, slot7 in ipairs(slot1) do
		slot8 = 0

		table.sort(slot7.pos_info or {}, SortTools.KeyLowerSorter("pos"))

		for slot13 = 1, 5 do
			slot14 = 0

			if slot2 then
				slot14 = slot13 * 2 / display.DEFAULT_FPS
			end

			delayRun(slot0.container, slot14, function ()
				slot0 = uv0 * 10 + uv1

				if uv2[uv1] then
					slot2 = HeroController:getInstance():getModel():getHeroById(slot1.id)

					if uv3.my_hero_item_list[slot0] == nil then
						slot3 = HeroExhibitionItem.new(0.7, true)

						uv3.container:addChild(slot3)

						uv3.my_hero_item_list[slot0] = slot3
					end

					slot3:addCallBack(function ()
						if uv0 then
							HeroController:getInstance():openHeroTipsPanel(true, uv0)
						end
					end)
					slot3:setPosition(cc.p(230 + (uv1 - 1) * (HeroExhibitionItem.Width * 0.7 + 10), 352 - (uv0 - 1) * 100))

					if slot2 then
						uv4 = uv4 + (slot2.power or 0)

						slot3:setVisible(true)
						slot3:setData(slot2)
					end
				end

				if uv1 == 5 and uv3.my_atk_txt_list[uv0] then
					slot2:setString(uv4)
				end
			end)
		end
	end
end

function CrossarenaRoleTips.changeTeamDataOrder(slot0, slot1)
	if not slot0.team_list then
		return
	end

	slot2 = {}

	if slot1 == 1 then
		for slot6, slot7 in pairs(slot0.team_list) do
			if slot7.order == 1 then
				slot7.order = 2

				uv0(slot2, {
					old_team = 1,
					team = slot7.order
				})
			elseif slot7.order == 2 then
				slot7.order = 1

				uv0(slot2, {
					old_team = 2,
					team = slot7.order
				})
			else
				uv0(slot2, {
					team = slot7.order,
					old_team = slot7.order
				})
			end
		end
	else
		for slot6, slot7 in pairs(slot0.team_list) do
			if slot7.order == 2 then
				slot7.order = 3

				uv0(slot2, {
					old_team = 2,
					team = slot7.order
				})
			elseif slot7.order == 3 then
				slot7.order = 2

				uv0(slot2, {
					old_team = 3,
					team = slot7.order
				})
			else
				uv0(slot2, {
					team = slot7.order,
					old_team = slot7.order
				})
			end
		end
	end

	ElfinController:getInstance():send26564(PartnerConst.Fun_Form.CrossArena, slot2)
	uv1:sender25604(1, slot0.team_list)
	slot0:updateMyselfInfo(slot0.team_list)
end

function CrossarenaRoleTips.close_callback(slot0)
	if slot0.role_head then
		slot0.role_head:DeleteMe()

		slot0.role_head = nil
	end

	if slot0.my_role_head then
		slot0.my_role_head:DeleteMe()

		slot0.my_role_head = nil
	end

	for slot4, slot5 in pairs(slot0.hero_item_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	for slot4, slot5 in pairs(slot0.my_hero_item_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	uv0:openCrossarenaRoleTips(false)
end
