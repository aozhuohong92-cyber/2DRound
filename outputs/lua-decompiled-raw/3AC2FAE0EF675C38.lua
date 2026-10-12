ArenapeakchampionGuessingTabGuessing = class("ArenapeakchampionGuessingTabGuessing", function ()
	return ccui.Widget:create()
end)
slot1 = ArenapeakchampionController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format

function ArenapeakchampionGuessingTabGuessing.ctor(slot0, slot1)
	slot0.parent = slot1
	slot0.role_vo = RoleController:getInstance():getRoleVo()

	slot0:loadResources()
end

function ArenapeakchampionGuessingTabGuessing.loadResources(slot0)
	if slot0.apc_guessing_info_event == nil then
		slot0.apc_guessing_info_event = GlobalEvent:getInstance():Bind(ArenapeakchampionEvent.ARENAPEAKCHAMPION_GUESSING_INFO_EVENT, function (slot0)
			if not slot0 then
				return
			end

			uv0.is_init_data = true
			uv0.scdata = slot0

			uv0:setData()
		end)
	end

	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/arenapeakchampion", "arenapeakchampion_guessing_centre", false),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/arenapeakchampion", "txt_cn_arenapeakchampion_guessing_top", false),
			type = ResourcesType.single
		}
	}
	slot0.resources_load = ResourcesLoad.New(true)

	slot0.resources_load:addAllList(slot0.res_list, function ()
		if uv0.parent then
			uv0:config()
			uv0:layoutUI()
			uv0:registerEvents()

			uv0.is_init_res = true

			uv0:setData()
		end
	end)
end

function ArenapeakchampionGuessingTabGuessing.config(slot0)
end

function ArenapeakchampionGuessingTabGuessing.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("arenapeakchampion/arenapeakchampion_guessing_tab_guessing"))

	slot0:addChild(slot0.root_wnd)

	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.top_img = slot0.container:getChildByName("top_img")
	slot0.centre_img = slot0.container:getChildByName("centre_img")

	loadSpriteTexture(slot0.top_img, PathTool.getPlistImgForDownLoad("bigbg/arenapeakchampion", "txt_cn_arenapeakchampion_guessing_top", false), LOADTEXT_TYPE)
	loadSpriteTexture(slot0.centre_img, PathTool.getPlistImgForDownLoad("bigbg/arenapeakchampion", "arenapeakchampion_guessing_centre", false), LOADTEXT_TYPE)

	slot0.vs_img = slot0.container:getChildByName("vs_img")
	slot0.item_count_label = createRichLabel(22, cc.c4b(255, 243, 170, 255), cc.p(1, 0.5), cc.p(694, 1081), nil, , 1000)

	slot0.container:addChild(slot0.item_count_label)
	slot0:updateItemCount()

	slot0.centre_panel = slot0.container:getChildByName("centre_panel")
	slot0.empty_panel = slot0.container:getChildByName("empty_panel")
	slot0.win_img = slot0.centre_panel:getChildByName("win_img")
	slot0.left_good_img = slot0.centre_panel:getChildByName("left_good_img")
	slot0.right_good_img = slot0.centre_panel:getChildByName("right_good_img")

	slot0.left_good_img:setVisible(false)
	slot0.right_good_img:setVisible(false)

	slot0.left_fight_label = CommonNum.new(20, slot0.centre_panel:getChildByName("left_power_click"), 0, -2, cc.p(0.5, 0.5))

	slot0.left_fight_label:setPosition(103, 28)

	slot0.left_play_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.left_play_head:setLev(99)
	slot0.left_play_head:addCallBack(function ()
		uv0:onClickHeadBtn(1)
	end)
	slot0.centre_panel:getChildByName("left_play_node"):addChild(slot0.left_play_head)

	slot0.right_fight_label = CommonNum.new(20, slot0.centre_panel:getChildByName("right_power_click"), 0, -2, cc.p(0.5, 0.5))

	slot0.right_fight_label:setPosition(103, 28)

	slot0.right_play_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.right_play_head:setLev(99)
	slot0.right_play_head:addCallBack(function ()
		uv0:onClickHeadBtn(2)
	end)
	slot0.centre_panel:getChildByName("right_play_node"):addChild(slot0.right_play_head)

	slot0.centre_left_name = slot0.centre_panel:getChildByName("left_name")
	slot0.left_srv_name = slot0.centre_panel:getChildByName("left_srv_name")
	slot0.centre_right_name = slot0.centre_panel:getChildByName("right_name")
	slot0.right_srv_name = slot0.centre_panel:getChildByName("right_srv_name")
	slot0.time_val = slot0.centre_panel:getChildByName("time_val")
	slot0.match_value = createRichLabel(22, cc.c4b(248, 240, 186, 255), cc.p(0.5, 0.5), cc.p(360, 906), nil, , 1000)

	slot0.container:addChild(slot0.match_value)

	slot0.fight_btn = slot0.centre_panel:getChildByName("fight_btn")

	slot0.fight_btn:getChildByName("label"):setString(TI18N("观战"))

	slot0.fight_info_btn = slot0.centre_panel:getChildByName("fight_info_btn")

	slot0.fight_info_btn:getChildByName("label"):setString(TI18N("对阵详情"))
	slot0.fight_info_btn:setVisible(false)

	slot0.guessing_panel = slot0.container:getChildByName("guessing_panel")
	slot0.progress_bar = slot0.guessing_panel:getChildByName("progress_bar")
	slot0.progress_bar_x = slot0.progress_bar:getPositionX()

	slot0.progress_bar:setScale9Enabled(true)

	slot0.left_guess_btn = slot0.guessing_panel:getChildByName("left_guess_btn")
	slot0.right_guess_btn = slot0.guessing_panel:getChildByName("right_guess_btn")
	slot0.progress_img = slot0.guessing_panel:getChildByName("progress_img")
	slot0.left_name = slot0.guessing_panel:getChildByName("left_name")
	slot0.right_name = slot0.guessing_panel:getChildByName("right_name")
	slot0.left_guess_bg = slot0.guessing_panel:getChildByName("left_guess_bg")
	slot0.left_bet_name = slot0.guessing_panel:getChildByName("left_bet_name")
	slot0.right_guess_bg = slot0.guessing_panel:getChildByName("right_guess_bg")
	slot0.right_bet_name = slot0.guessing_panel:getChildByName("right_bet_name")
	slot0.left_rate = slot0.guessing_panel:getChildByName("left_rate")
	slot0.right_rate = slot0.guessing_panel:getChildByName("right_rate")
	slot0.left_guess_name = slot0.guessing_panel:getChildByName("left_guess_name")

	slot0.left_guess_name:setString(TI18N("竞猜"))

	slot0.right_guess_name = slot0.guessing_panel:getChildByName("right_guess_name")

	slot0.right_guess_name:setString(TI18N("竞猜"))
end

function ArenapeakchampionGuessingTabGuessing.registerEvents(slot0)
	registerButtonEventListener(slot0.fight_btn, function ()
		uv0:onClickFightBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.fight_info_btn, function ()
		uv0:onClickFightInfoBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.right_guess_btn, function ()
		uv0:onClickGuessBtn(2)
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.left_guess_btn, function ()
		uv0:onClickGuessBtn(1)
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)

	if slot0.apc_main_event == nil then
		slot0.apc_main_event = GlobalEvent:getInstance():Bind(ArenapeakchampionEvent.ARENAPEAKCHAMPION_MAIN_EVENT, function (slot0)
			uv0:updateTime()

			if slot0 and slot0.step == 1 and slot0.round == 1 then
				uv1:sender27703()
			end
		end)
	end

	if slot0.apc_show_vedion_event == nil then
		slot0.apc_show_vedion_event = GlobalEvent:getInstance():Bind(ArenapeakchampionEvent.ARENAPEAKCHAMPION_SHOW_VEDIO_EVENT, function (slot0)
			if uv0.parent and uv0.parent.cur_tab_index and uv0.parent.cur_tab_index == ArenapeakchampionConstants.guessing_tab.eGuessing then
				uv0.must_play_vedio = true
			end

			uv1:sender27703()
		end)
	end

	if slot0.arenapeakchampion_update_guessing_info_event == nil then
		slot0.arenapeakchampion_update_guessing_info_event = GlobalEvent:getInstance():Bind(ArenapeakchampionEvent.ARENAPEAKCHAMPION_UPDATE_GUESSING_INFO_EVENT, function (slot0)
			if not slot0 then
				return
			end

			uv0:updateGuessPanel(slot0)
		end)
	end

	if slot0.apc_guessing_stake_event == nil then
		slot0.apc_guessing_stake_event = GlobalEvent:getInstance():Bind(ArenapeakchampionEvent.ARENAPEAKCHAMPION_GUESSING_STAKE_EVENT, function (slot0)
			if not slot0 then
				return
			end

			if uv0.scdata then
				uv0.scdata.bet_type = slot0.bet_type
			end

			uv0:updateGuessName(slot0.bet_type)
		end)
	end

	if slot0.apc_single_info_event == nil then
		slot0.apc_single_info_event = GlobalEvent:getInstance():Bind(ArenapeakchampionEvent.ARENAPEAKCHAMPION_SINGLE_INFO_EVENT, function (slot0)
			uv0:updateItemCount()
		end)
	end

	if slot0.apc_all_red_point_event == nil then
		slot0.apc_all_red_point_event = GlobalEvent:getInstance():Bind(ArenapeakchampionEvent.ARENAPEAKCHAMPION_ALL_RED_POINT_EVENT, function (slot0)
			uv0:updateRedPoint()
		end)
	end
end

function ArenapeakchampionGuessingTabGuessing.onClickHeadBtn(slot0, slot1)
	if not slot0.scdata then
		return
	end

	slot2, slot3 = nil

	if slot1 == 1 then
		slot2 = slot0.scdata.a_rid
		slot3 = slot0.scdata.a_srv_id
	else
		slot2 = slot0.scdata.b_rid
		slot3 = slot0.scdata.b_srv_id
	end

	if slot2 and slot3 then
		if RoleController:getInstance():getRoleVo() and slot2 == slot4.rid and slot3 == slot4.srv_id then
			message(TI18N("这是你自己~"))

			return
		end

		if slot3 == "" then
			message(TI18N("角色信息丢失在异域中"))

			return
		end

		FriendController:getInstance():openFriendCheckPanel(true, {
			srv_id = slot3,
			rid = slot2
		})
	end
end

function ArenapeakchampionGuessingTabGuessing.onClickLookBtn(slot0)
	MainuiController:getInstance():openCommonExplainView(true, Config.ArenaPeakChampionData.data_explain_guess)
end

function ArenapeakchampionGuessingTabGuessing.onClickRecordBtn(slot0)
	uv0:openArenapeakchampionGuessInfoPanel(true)
end

function ArenapeakchampionGuessingTabGuessing.onClickFightInfoBtn(slot0)
	if not slot0.scdata then
		return
	end

	if slot0.scdata.step == 0 then
		message(TI18N("巅峰竞技场未开赛"))

		return
	end

	uv0:openArenapeakchampionFightInfoPanel(true, {
		data = slot0.scdata
	})
end

function ArenapeakchampionGuessingTabGuessing.onClickFightBtn(slot0)
	if slot0.scdata then
		uv0:openLookFightVedioPanel(slot0.scdata)
	end
end

function ArenapeakchampionGuessingTabGuessing.onClickGuessBtn(slot0, slot1)
	if not slot0.scdata then
		return
	end

	if slot0.scdata.bet_type ~= 0 then
		message(TI18N("已经竞猜过啦"))

		return
	end

	if uv0:getMainData().step == 0 or slot2.step_status == 2 then
		message(TI18N("赛季未开启"))

		return
	end

	if slot2 and slot2.round_status == 2 then
		if not slot0.a_ratio then
			return
		end

		if not slot0.b_ratio then
			return
		end

		if slot1 == 1 then
			uv1:openArenapeakchampionGuessCountPanel(true, {
				bet_type = 1,
				name = slot0.scdata.a_name,
				ratio = slot0.a_ratio
			})
		else
			uv1:openArenapeakchampionGuessCountPanel(true, {
				bet_type = 2,
				name = slot0.scdata.b_name,
				ratio = slot0.b_ratio
			})
		end
	else
		message(TI18N("非竞猜阶段不可下注"))
	end
end

function ArenapeakchampionGuessingTabGuessing.updateItemCount(slot0)
	if not slot0.item_count_label then
		return
	end

	if Config.ItemData.data_get_data(33) and uv0:getMyGuessData() then
		slot0.item_count_label:setString(uv1(TI18N("我的代币: <img src='%s' scale=0.25 /> %s"), PathTool.getItemRes(slot1.icon), slot2.can_bet))
	end
end

function ArenapeakchampionGuessingTabGuessing.updateTime(slot0)
	if uv0:getMainData() and slot1.step ~= 0 then
		doStopAllActions(slot0.time_val)

		if slot1.round_status_time - GameNet:getInstance():getTime() < 0 then
			slot2 = 0
		end

		commonCountDownTime(slot0.time_val, slot2)

		if slot1.round_status == 2 then
			slot0.fight_btn:setVisible(false)
			slot0.vs_img:setVisible(true)
			slot0.fight_info_btn:setVisible(true)
		else
			if slot1.round_status == 1 then
				slot0.fight_btn:loadTexture(PathTool.getResFrame("arenapeakchampion", "arenapeakchampion_guessing_19_1", false, "arenapeak_guessing"), LOADTEXT_TYPE_PLIST)
				slot0.fight_btn:getChildByName("label"):setString(TI18N("查看"))
			else
				slot0.fight_btn:loadTexture(PathTool.getResFrame("arenapeakchampion", "arenapeakchampion_guessing_19", false, "arenapeak_guessing"), LOADTEXT_TYPE_PLIST)
				slot0.fight_btn:getChildByName("label"):setString(TI18N("观战"))
			end

			slot0.fight_btn:setVisible(true)
			slot0.vs_img:setVisible(false)
			slot0.fight_info_btn:setVisible(false)
		end

		if slot0.current_round_status == nil then
			slot0.current_round_status = slot1.round_status
		elseif slot0.current_round_status ~= slot1.round_status then
			if slot0.current_round_status == 2 and slot1.round_status == 3 then
				-- Nothing
			elseif slot1.round_status == 1 or slot1.round_status == 2 then
				uv1:sender27701()
			end

			uv1:sender27703()

			slot0.current_round_status = slot1.round_status
		end
	end
end

function ArenapeakchampionGuessingTabGuessing.setData(slot0)
	if not slot0.scdata then
		return
	end

	if slot0.is_init_data and slot0.is_init_res then
		if not uv0:getMainData() then
			return
		end

		if slot1.step == 0 or slot1.step_status == 2 then
			slot0:showEmptyInfo(true, slot1)
			slot0:unEnabledGuessBtn(true)
			slot0.progress_bar:setPercent(50)
			slot0.progress_img:setPositionX(slot0.progress_bar_x)
			slot0.left_name:setString("")
			slot0.right_name:setString("")
			slot0.left_rate:setString("")
			slot0.right_rate:setString("")
			slot0.left_guess_bg:setVisible(false)
			slot0.left_bet_name:setVisible(false)
			slot0.right_guess_bg:setVisible(false)
			slot0.right_bet_name:setVisible(false)

			return
		end

		slot0:showEmptyInfo(false)

		if slot0.must_play_vedio then
			slot0.must_play_vedio = false

			if #slot0.scdata.result_info > 0 then
				function slot5(slot0, slot1)
					return slot0.order < slot1.order
				end

				table.sort(slot0.scdata.result_info, slot5)

				for slot5, slot6 in ipairs(slot0.scdata.result_info) do
					if slot6.replay_id ~= 0 then
						BattleController:getInstance():csRecordBattle(slot6.replay_id, slot6.replay_sid)

						return
					end
				end
			end
		end

		slot0:updateTime()
		slot0:updateCentrePanel()
		slot0:updateGuessPanel()
	end
end

function ArenapeakchampionGuessingTabGuessing.updateCentrePanel(slot0)
	if not slot0.scdata then
		return
	end

	slot0:setHeadInfo(slot0.left_play_head, slot0.scdata.a_lev, slot0.scdata.a_face, slot0.scdata.a_avatar_id, slot0.scdata.a_face_file, slot0.scdata.a_face_update_time)
	slot0:setHeadInfo(slot0.right_play_head, slot0.scdata.b_lev, slot0.scdata.b_face, slot0.scdata.b_avatar_id, slot0.scdata.b_face_file, slot0.scdata.b_face_update_time)
	slot0.centre_left_name:setString(slot0.scdata.a_name)
	slot0.centre_right_name:setString(slot0.scdata.b_name)

	if getServerName(slot0.scdata.a_srv_id) == "" then
		slot1 = TI18N("异域")
	end

	slot0.left_srv_name:setString(uv0("[%s]", slot1))

	if getServerName(slot0.scdata.b_srv_id) == "" then
		slot1 = TI18N("异域")
	end

	slot0.right_srv_name:setString(uv0("[%s]", slot1))
	slot0.left_fight_label:setNum(slot0.scdata.a_power)
	slot0.right_fight_label:setNum(slot0.scdata.b_power)

	if slot0.scdata.ret == 0 then
		slot0.win_img:setVisible(false)
	else
		slot0.win_img:setVisible(true)

		if slot0.scdata.ret == 1 then
			slot0.win_img:setPositionX(60)
		else
			slot0.win_img:setPositionX(632)
		end
	end

	if uv1:getMainData() then
		slot3, slot4 = uv1:getMacthText(slot2.step, slot2.round, slot2.round_status)

		if slot4 then
			slot5 = (slot3 or "") .. uv0("<div fontcolor=#52f559>%s</div>", slot4)
		end

		slot0.match_value:setString(slot5)
	end
end

function ArenapeakchampionGuessingTabGuessing.setHeadInfo(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot1:setHeadRes(slot3 or 1001, false, LOADTEXT_TYPE, slot5, slot6)
	slot1:setLev(slot2 or 1)

	if slot4 and slot1.record_res_bid == nil or slot1.record_res_bid ~= slot4 then
		slot1.record_res_bid = slot4

		if Config.AvatarData.data_avatar[slot4] then
			slot1:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot7.res_id or 1), false, false), nil, false, slot7.offy)
		end
	end
end

function ArenapeakchampionGuessingTabGuessing.unEnabledGuessBtn(slot0, slot1)
	if slot1 then
		slot0.left_guess_name:disableEffect(cc.LabelEffect.OUTLINE)
		slot0.right_guess_name:disableEffect(cc.LabelEffect.OUTLINE)
		setChildUnEnabled(true, slot0.left_guess_btn)
		setChildUnEnabled(true, slot0.right_guess_btn)
		setChildUnEnabled(true, slot0.left_guess_name)
		setChildUnEnabled(true, slot0.right_guess_name)
	else
		slot0.left_guess_name:enableOutline(cc.c4b(22, 53, 118, 255), 2)
		slot0.right_guess_name:enableOutline(cc.c4b(142, 58, 8, 255), 2)
		setChildUnEnabled(false, slot0.left_guess_btn)
		setChildUnEnabled(false, slot0.right_guess_btn)
		setChildUnEnabled(false, slot0.left_guess_name)
		setChildUnEnabled(false, slot0.right_guess_name)
	end
end

function ArenapeakchampionGuessingTabGuessing.updateGuessName(slot0, slot1)
	if not slot0.left_guess_name then
		return
	end

	if not slot0.scdata then
		return
	end

	if not slot1 then
		return
	end

	if slot1 == 0 then
		slot0.left_guess_bg:setVisible(false)
		slot0.left_bet_name:setVisible(false)
		slot0.right_guess_bg:setVisible(false)
		slot0.right_bet_name:setVisible(false)

		if uv0:getMainData() and slot2.round_status == 2 then
			slot0:unEnabledGuessBtn(false)
		else
			slot0:unEnabledGuessBtn(true)
		end

		slot0.left_good_img:setVisible(false)
		slot0.right_good_img:setVisible(false)
	else
		slot2 = nil

		if slot1 == 1 then
			slot0.left_guess_bg:setVisible(true)
			slot0.left_bet_name:setVisible(true)
			slot0.right_guess_bg:setVisible(false)
			slot0.right_bet_name:setVisible(false)

			slot2 = slot0.left_bet_name

			slot0.left_good_img:setVisible(true)
			slot0.right_good_img:setVisible(false)
		else
			slot0.left_guess_bg:setVisible(false)
			slot0.left_bet_name:setVisible(false)
			slot0.right_guess_bg:setVisible(true)
			slot0.right_bet_name:setVisible(true)
			slot0.left_good_img:setVisible(false)
			slot0.right_good_img:setVisible(true)

			slot2 = slot0.right_bet_name
		end

		slot0:unEnabledGuessBtn(true)

		if slot0.scdata.ret == 0 then
			slot2:setString(TI18N("已下注"))
			slot2:setTextColor(cc.c4b(14, 252, 19, 255))
		elseif slot0.scdata.ret == slot0.scdata.bet_type then
			slot2:setString(TI18N("猜中"))
			slot2:setTextColor(cc.c4b(14, 252, 19, 255))
		else
			slot2:setString(TI18N("猜错"))
			slot2:setTextColor(cc.c4b(252, 92, 14, 255))
		end
	end
end

function ArenapeakchampionGuessingTabGuessing.updateGuessPanel(slot0, slot1)
	if not slot0.scdata then
		return
	end

	if slot1 == nil then
		slot0:updateGuessName(slot0.scdata.bet_type)
		slot0.left_name:setString(transformNameByServ(slot0.scdata.a_name, slot0.scdata.a_srv_id))
		slot0.right_name:setString(transformNameByServ(slot0.scdata.b_name, slot0.scdata.b_srv_id))
	end

	slot2 = slot1 or slot0.scdata
	slot0.a_ratio = slot2.a_bet_ratio
	slot0.b_ratio = slot2.b_bet_ratio

	slot0.left_rate:setString(uv0(TI18N("赔率:%0.2f"), slot0.a_ratio / 1000))
	slot0.right_rate:setString(uv0(TI18N("赔率:%0.2f"), slot0.b_ratio / 1000))

	if slot2.a_bet + slot2.b_bet == 0 then
		slot0.progress_bar:setPercent(50)
		slot0.progress_img:setPositionX(slot0.progress_bar_x)
	else
		slot4 = 461
		slot5 = 100 * slot2.a_bet / slot3

		slot0.progress_bar:setPercent(slot5)
		slot0.progress_img:setPositionX(slot0.progress_bar_x - slot4 * 0.5 + slot4 * slot5 / 100)
	end

	slot0:updateRedPoint()
end

function ArenapeakchampionGuessingTabGuessing.updateRedPoint(slot0)
	if slot0.left_guess_btn then
		addRedPointToNodeByStatus(slot0.left_guess_btn, uv0:getGuessRedPoint(), 0, 0)
	end

	if slot0.right_guess_btn then
		addRedPointToNodeByStatus(slot0.right_guess_btn, slot1, 0, 0)
	end
end

function ArenapeakchampionGuessingTabGuessing.showEmptyInfo(slot0, slot1, slot2)
	if not slot0.empty_panel then
		return
	end

	if slot1 then
		if slot0.centre_img then
			slot0.centre_img:setVisible(false)
		end

		slot0.centre_panel:setVisible(false)
		slot0.vs_img:setVisible(false)
		slot0.empty_panel:setVisible(true)

		if slot0.gril_img_load == nil then
			slot0.gril_img_load = loadSpriteTextureFromCDN(slot0.empty_panel:getChildByName("gril_img"), PathTool.getPlistImgForDownLoad("bigbg", "bigbg_50", false), ResourcesType.single, slot0.gril_img_load)
		end

		if slot0.talk_img_load == nil then
			slot0.talk_img_load = loadSpriteTextureFromCDN(slot0.empty_panel:getChildByName("talk_img"), PathTool.getPlistImgForDownLoad("bigbg", "bigbg_96", false), ResourcesType.single, slot0.talk_img_load)
		end

		slot0.empty_label = createRichLabel(28, cc.c4b(100, 50, 35, 255), cc.p(0.5, 0.5), cc.p(360, 112), nil, , 1000)

		slot0.empty_panel:addChild(slot0.empty_label)

		if slot2 then
			if slot2.start_time - GameNet:getInstance():getTime() < 0 then
				slot3 = 0
			end

			commonCountDownTime(slot0.empty_label, slot3, {
				callback = function (slot0)
					uv0:setTimeFormatString(slot0)
				end
			})
		end

		slot0.match_value:setString(TI18N("未开赛"))
	else
		slot0.empty_panel:setVisible(false)

		if slot0.empty_label then
			doStopAllActions(slot0.empty_label)
		end

		if slot0.centre_img then
			slot0.centre_img:setVisible(true)
		end

		slot0.centre_panel:setVisible(true)
	end
end

function ArenapeakchampionGuessingTabGuessing.setTimeFormatString(slot0, slot1)
	if slot1 > 0 then
		slot0.empty_label:setString(uv0(TI18N("距离比赛开启: <div fontcolor=#249003>%s</div>"), TimeTool.GetTimeFormatDay(slot1)))
	else
		slot0.empty_label:setString(TI18N("巅峰冠军赛即将开始"))
	end
end

function ArenapeakchampionGuessingTabGuessing.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)

	if slot1 and not slot0.is_init then
		slot0.is_init = true

		uv0:sender27703()
		uv0:sender27701()
	end
end

function ArenapeakchampionGuessingTabGuessing.DeleteMe(slot0)
	if slot0.resources_load then
		slot0.resources_load:DeleteMe()
	end

	slot0.resources_load = nil
	slot0.parent = nil

	doStopAllActions(slot0.time_val)

	if slot0.empty_label then
		doStopAllActions(slot0.empty_label)
	end

	if slot0.apc_main_event then
		GlobalEvent:getInstance():UnBind(slot0.apc_main_event)

		slot0.apc_main_event = nil
	end

	if slot0.apc_show_vedion_event then
		GlobalEvent:getInstance():UnBind(slot0.apc_show_vedion_event)

		slot0.apc_show_vedion_event = nil
	end

	if slot0.apc_guessing_info_event then
		GlobalEvent:getInstance():UnBind(slot0.apc_guessing_info_event)

		slot0.apc_guessing_info_event = nil
	end

	if slot0.arenapeakchampion_update_guessing_info_event then
		GlobalEvent:getInstance():UnBind(slot0.arenapeakchampion_update_guessing_info_event)

		slot0.arenapeakchampion_update_guessing_info_event = nil
	end

	if slot0.apc_guessing_stake_event then
		GlobalEvent:getInstance():UnBind(slot0.apc_guessing_stake_event)

		slot0.apc_guessing_stake_event = nil
	end

	if slot0.apc_single_info_event then
		GlobalEvent:getInstance():UnBind(slot0.apc_single_info_event)

		slot0.apc_single_info_event = nil
	end

	if slot0.apc_all_red_point_event then
		GlobalEvent:getInstance():UnBind(slot0.apc_all_red_point_event)

		slot0.apc_all_red_point_event = nil
	end

	if slot0.left_fight_label then
		slot0.left_fight_label:DeleteMe()

		slot0.left_fight_label = nil
	end

	if slot0.right_fight_label then
		slot0.right_fight_label:DeleteMe()

		slot0.right_fight_label = nil
	end
end
