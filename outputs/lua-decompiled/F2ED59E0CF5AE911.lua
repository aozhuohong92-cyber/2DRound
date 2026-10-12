ArenapeakchampionMainWindow = ArenapeakchampionMainWindow or BaseClass(BaseView)
slot1 = ArenapeakchampionController:getInstance():getModel()
slot2 = string.format
slot3 = table.sort
slot4 = table.insert
slot5 = math.ceil
slot6 = math.floor

function ArenapeakchampionMainWindow.__init(slot0)
	slot0.win_type = WinType.Full
	slot0.is_full_screen = true
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("arenapeakchampion", "arenapeak_mian"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/elitematch", "elitematch_matching_bg", true),
			type = ResourcesType.single
		}
	}
	slot0.layout_name = "arenapeakchampion/arenapeakchampion_main_window"
	slot0.vSize = cc.size(108, 108)
end

function ArenapeakchampionMainWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale() or 1)
	slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg/elitematch", "elitematch_matching_bg", true), LOADTEXT_TYPE)

	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot0.container, 1)

	slot0.container_size = slot0.container:getContentSize()
	slot0.top_panel = slot0.container:getChildByName("top_panel")
	slot0.bottom_panel = slot0.container:getChildByName("bottom_panel")
	slot0.close_btn = slot0.container:getChildByName("close_btn")
	slot0.spine_node = slot0.top_panel:getChildByName("spine_node")

	slot0:showFlagSpine(true)

	slot0.name = slot0.top_panel:getChildByName("name")
	slot0.shop_btn = slot0.top_panel:getChildByName("shop_btn")

	slot0.shop_btn:getChildByName("label"):setString(TI18N("巅峰商城"))

	slot0.rank_btn = slot0.top_panel:getChildByName("rank_btn")

	slot0.rank_btn:getChildByName("label"):setString(TI18N("排行榜"))

	slot0.recrod_btn = slot0.top_panel:getChildByName("recrod_btn")

	slot0.recrod_btn:getChildByName("label"):setString(TI18N("历史赛季"))

	slot0.lay_head_list = {
		(function (slot0)
			if slot0 then
				slot1 = {
					lay_head = slot0,
					head_node = slot0:getChildByName("head_node"),
					tip_img = slot0:getChildByName("tip_img")
				}

				slot1.tip_img:setVisible(false)

				slot1.name = slot0:getChildByName("name")

				slot1.name:setString("")

				slot1.srv_name = slot0:getChildByName("srv_name")

				slot1.srv_name:setString("")

				return slot1
			end
		end)(slot0.top_panel:getChildByName("lay_head_1"))
	}
	slot0.lay_head_list[1].title_img = slot0.lay_head_list[1].lay_head:getChildByName("title_img")

	slot0.lay_head_list[1].name:setZOrder(2)

	slot0.head_panel = slot0.top_panel:getChildByName("head_panel")

	for slot6 = 2, 8 do
		slot0.lay_head_list[slot6] = slot2(slot0.head_panel:getChildByName("lay_head_" .. slot6))
	end

	for slot6, slot7 in ipairs(slot0.lay_head_list) do
		if slot6 == 1 then
			slot7.head_node:setScale(1.23)
		elseif slot6 > 4 then
			slot7.head_node:setScale(0.92)
		else
			slot7.head_node:setScale(1.02)
		end
	end

	slot0.rank_info = slot0.bottom_panel:getChildByName("rank_info")
	slot0.form_btn = slot0.bottom_panel:getChildByName("form_btn")

	slot0.form_btn:getChildByName("label"):setString(TI18N("布阵调整"))

	slot0.report_btn = slot0.bottom_panel:getChildByName("report_btn")

	slot0.report_btn:getChildByName("label"):setString(TI18N("我的赛程"))

	slot0.look_btn = slot0.bottom_panel:getChildByName("look_btn")
	slot0.fight_btn = slot0.bottom_panel:getChildByName("fight_btn")

	slot0.fight_btn:getChildByName("label"):setString(TI18N("进入大赛"))

	slot0.zone_btn = slot0.bottom_panel:getChildByName("zone_btn")
	slot0.zone_name = slot0.zone_btn:getChildByName("zone_name")
	slot0.zone_icon = slot0.zone_btn:getChildByName("arenapeakchampion_mian_17_55")

	slot0.zone_btn:setVisible(false)
	slot0.bottom_panel:getChildByName("match_key"):setString(TI18N("当前赛程："))
	slot0.bottom_panel:getChildByName("time_key"):setString(TI18N("赛季时间："))
	slot0.bottom_panel:getChildByName("condition_key"):setString(TI18N("参与条件："))

	slot0.match_value = createRichLabel(22, cc.c4b(255, 215, 107, 255), cc.p(0, 0.5), cc.p(156, 318), nil, nil, 1000)
	slot0.time_value = createRichLabel(22, cc.c4b(255, 248, 191, 255), cc.p(0, 0.5), cc.p(156, 288), nil, nil, 1000)
	slot0.condition_value = createRichLabel(22, cc.c4b(255, 248, 191, 255), cc.p(0, 0.5), cc.p(156, 255), nil, nil, 1000)

	slot0.bottom_panel:addChild(slot0.match_value)
	slot0.bottom_panel:addChild(slot0.time_value)
	slot0.bottom_panel:addChild(slot0.condition_value)

	slot3 = ""

	if LoginController:getInstance():getModel():getLoginData() and slot4.isTry then
		if Config.ArenaPeakChampionData.data_const.battle_members1 then
			slot3 = uv0(TI18N("先行服跨服竞技场前<div fontcolor=#ffd76b>%s</div>名,进入巅峰冠军赛的预选赛阶段"), slot5.val)
		end
	elseif Config.ArenaPeakChampionData.data_const.battle_members then
		slot3 = uv0(TI18N("跨服竞技场前<div fontcolor=#ffd76b>%s</div>名,进入巅峰冠军赛的预选赛阶段"), slot5.val)
	end

	slot0.condition_value:setString(slot3)
	slot0:adaptationScreen()
end

function ArenapeakchampionMainWindow.adaptationScreen(slot0)
	slot1 = display.getTop(slot0.container)
	slot2 = display.getBottom(slot0.container)
	slot3 = display.getLeft(slot0.container)
	slot4 = display.getRight(slot0.container)

	slot0.top_panel:setPositionY(slot1 - (slot0.container_size.height - slot0.top_panel:getPositionY()))
	slot0.bottom_panel:setPositionY(slot2 + slot0.bottom_panel:getPositionY())
	slot0.close_btn:setPositionY(slot2 + slot0.close_btn:getPositionY())

	slot9 = slot0.head_panel:getContentSize()
	slot13 = cc.size

	slot0.head_panel:setContentSize(slot13(slot9.width, slot9.height + slot1 - slot0.container_size.height - slot2))

	for slot13 = 2, 8 do
		if slot0.lay_head_list[slot13] then
			slot14.lay_head:setPositionY((slot9.height + slot8) * slot14.lay_head:getPositionY() / slot9.height)
		end
	end
end

function ArenapeakchampionMainWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), true, REGISTER_BUTTON_SOUND_CLOSED_TYPY)
	registerButtonEventListener(slot0.fight_btn, handler(slot0, slot0.onClickFightBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.look_btn, handler(slot0, slot0.onClickRuleBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY, nil, 0.8)
	registerButtonEventListener(slot0.shop_btn, handler(slot0, slot0.onClickShopBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.rank_btn, handler(slot0, slot0.onClickRankBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.form_btn, handler(slot0, slot0.onClickFormBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.report_btn, handler(slot0, slot0.onClickReportBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)

	slot4 = handler(slot0, slot0.onClickZoneBtn)
	slot5 = false

	registerButtonEventListener(slot0.zone_btn, slot4, slot5, REGISTER_BUTTON_SOUND_BUTTON_TYPY)

	for slot4, slot5 in pairs(slot0.lay_head_list) do
		registerButtonEventListener(slot5.lay_head, function ()
			uv0:onClickHeadBtn(uv1)
		end, false, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	end

	slot0:addGlobalEvent(ArenapeakchampionEvent.ARENAPEAKCHAMPION_MAIN_EVENT, function (slot0)
		if not slot0 then
			return
		end

		uv0:setScdata(slot0)
	end)
	slot0:addGlobalEvent(ArenapeakchampionEvent.ARENAPEAKCHAMPION_CURRENT_RANK_EVENT, function (slot0)
		if not slot0 then
			return
		end

		uv0:initPeakRankInfo(slot0)
	end)
	slot0:addGlobalEvent(ArenapeakchampionEvent.ARENAPEAKCHAMPION_SINGLE_INFO_EVENT, function (slot0)
		if not slot0 then
			return
		end

		uv0:setSingleInfo(slot0)
	end)
	slot0:addGlobalEvent(ArenapeakchampionEvent.ARENAPEAKCHAMPION_ALL_RED_POINT_EVENT, function ()
		uv0:updateRedPoint()
	end)
end

function ArenapeakchampionMainWindow.updateRedPoint(slot0)
	if uv0:getGuessRedPoint() or uv0.match_stage_redpoint then
		addRedPointToNodeByStatus(slot0.fight_btn, true, 0, 5)
	else
		addRedPointToNodeByStatus(slot0.fight_btn, false, 0, 5)
	end

	if uv0.my_match_redpoint then
		addRedPointToNodeByStatus(slot0.report_btn, true, 5, 5)
	else
		addRedPointToNodeByStatus(slot0.report_btn, false, 5, 5)
	end

	if uv0.is_worship_redpoint then
		addRedPointToNodeByStatus(slot0.rank_btn, true, 5, 5)
	else
		addRedPointToNodeByStatus(slot0.rank_btn, false, 5, 5)
	end
end

function ArenapeakchampionMainWindow.onClickCloseBtn(slot0)
	uv0:openArenapeakchampionMainWindow(false)
end

function ArenapeakchampionMainWindow.onClickRankBtn(slot0)
	if not slot0.scdata then
		return
	end

	if slot0.select_zone_index == nil or slot0.zone_list == nil then
		-- Nothing
	elseif slot0.zone_list[slot0.select_zone_index] then
		slot1.zone_id = slot0.zone_list[slot0.select_zone_index].id
	else
		slot1.zone_id = slot0.scdata.zone_id
	end

	RankController:getInstance():openSingleRankMainWindow(true, {
		rank_type = RankConstant.RankType.arena_peak_champion,
		title_name = TI18N("巅峰冠军赛排行榜"),
		background_path = PathTool.getPlistImgForDownLoad("bigbg/elitematch", "elitematch_matching_bg", true),
		zone_id = slot0.scdata.zone_id
	})
end

function ArenapeakchampionMainWindow.onClickShopBtn(slot0)
	uv0:openArenapeakchampionShop()
end

function ArenapeakchampionMainWindow.onClickRuleBtn(slot0)
	MainuiController:getInstance():openCommonExplainView(true, Config.ArenaPeakChampionData.data_explain)
end

function ArenapeakchampionMainWindow.onClickFightBtn(slot0)
	if not slot0.scdata then
		return
	end

	uv0:openArenapeakchampionGuessingWindow(true)
end

function ArenapeakchampionMainWindow.onClickFormBtn(slot0)
	HeroController:getInstance():openFormGoFightPanel(true, PartnerConst.Fun_Form.ArenapeakchampionDef, {}, HeroConst.FormShowType.eFormSave)
end

function ArenapeakchampionMainWindow.onClickHeadBtn(slot0, slot1)
	if not slot0.dic_arena_peak_rank then
		return
	end

	if slot0.dic_arena_peak_rank[slot1] then
		slot3 = slot0.dic_arena_peak_rank[slot1].srv_id

		if RoleController:getInstance():getRoleVo() and slot0.dic_arena_peak_rank[slot1].rid == slot4.rid and slot3 == slot4.srv_id then
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

function ArenapeakchampionMainWindow.onClickReportBtn(slot0)
	if not slot0.scdata then
		return
	end

	if uv0.my_match_redpoint then
		uv1:sender27731(1)
		uv0:setMyMatchRedPoint(false)
	end

	uv1:openArenapeakchampionMymatchPanel(true)
end

function ArenapeakchampionMainWindow.onClickZoneBtn(slot0)
	if not slot0.scdata then
		return
	end

	slot1 = slot0.zone_btn:convertToWorldSpace(cc.p(0, 0))

	if not slot0.zone_list then
		slot0.zone_list = {}

		for slot5 = 1, slot0.scdata.max_zone_id do
			uv1(slot0.zone_list, {
				id = slot5,
				value = uv0(TI18N("第%s赛区"), slot5)
			})
		end

		uv2(slot0.zone_list, SortTools.KeyLowerSorter("id"))
	end

	slot2 = {
		other_index = slot0.scdata.zone_id or 1
	}
	slot2.select_index = slot0.select_zone_index or slot2.other_index
	slot2.offsetx = 120
	slot2.offsety = 45
	slot2.combobox_max_size = cc.size(236, 190)
	slot2.combobox_bg_size = cc.size(244, 198)
	slot2.dir_type = 2
	slot2.combo_show_type = 2

	CommonUIController:getInstance():openCommonComboboxPanel(true, slot1, handler(slot0, slot0.onChoseZoneBtn), slot0.zone_list, slot2)
end

function ArenapeakchampionMainWindow.onChoseZoneBtn(slot0, slot1, slot2, slot3)
	if not slot0.scdata then
		return
	end

	uv0:sender27714(slot2.id, 1, 8)

	slot0.select_zone_index = slot1

	slot0.zone_name:setString(slot2.value)

	if slot0.scdata.zone_id == slot2.id then
		slot0.zone_icon:setVisible(true)
	else
		slot0.zone_icon:setVisible(false)
	end
end

function ArenapeakchampionMainWindow.openRootWnd(slot0, slot1)
	uv0:sender27700()
	uv0:sender27701()
	uv0:sender27714(0, 1, 8)
end

function ArenapeakchampionMainWindow.setSingleInfo(slot0, slot1)
	if slot1.best_rank == 0 then
		slot0.rank_info:setString(TI18N("历史最高排名: 未上榜"))
	else
		slot0.rank_info:setString(uv0(TI18N("历史最高排名: 第%s名"), slot1.best_rank))
	end
end

function ArenapeakchampionMainWindow.setScdata(slot0, slot1)
	slot0.scdata = slot1

	if slot0.scdata.step == 0 then
		slot0.zone_btn:setVisible(false)
	else
		slot0.zone_btn:setVisible(true)
	end

	if slot0.select_zone_index == nil then
		slot0.zone_name:setString(uv0(TI18N("第%s赛区"), slot0.scdata.zone_id))
	end

	slot0:initMatchText()
	slot0:updateRedPoint()
end

function ArenapeakchampionMainWindow.initMatchText(slot0)
	if not slot0.scdata then
		return
	end

	if slot0.scdata.step_status == 2 then
		if uv0:isBeforeOpenMacthTime() then
			slot0.match_value:setString(TI18N("即将开赛"))
		else
			slot0.match_value:setString(TI18N("未开赛"))
		end
	else
		slot1, slot2 = uv0:getMacthText(slot0.scdata.step, slot0.scdata.round, slot0.scdata.round_status)

		if slot2 ~= nil then
			slot0.match_value:setString(slot1 .. slot2)
		else
			slot0.match_value:setString(slot1)
		end
	end

	if slot0.scdata.period == 0 then
		slot0.name:setString("")
	else
		slot0.name:setString(uv1(TI18N("第%s赛季"), slot0.scdata.period))
	end

	slot1 = TimeTool.getMD(slot0.scdata.start_time)
	slot2 = TimeTool.getMD(slot0.scdata.end_time)

	if slot0.scdata.step == 0 or slot0.scdata.step_status == 2 then
		if slot0.scdata.start_time - GameNet:getInstance():getTime() < 0 then
			slot3 = 0
		end

		slot0.time_value:setString(uv1(TI18N("%s-%s(距离下次开启剩余%s)"), slot1, slot2, TimeTool.GetTimeFormatDay(slot3)))
	else
		if slot0.scdata.end_time - GameNet:getInstance():getTime() < 0 then
			slot3 = 0
		end

		slot0.time_value:setString(uv1(TI18N("%s-%s(距离赛季<div fontcolor=#ffd76b>结束</div>%s)"), slot1, slot2, TimeTool.GetTimeFormatDay(slot3)))
	end
end

function ArenapeakchampionMainWindow.initPeakRankInfo(slot0, slot1)
	if slot1 then
		slot0.dic_arena_peak_rank = {}

		for slot5, slot6 in ipairs(slot1.rank_list) do
			slot0.dic_arena_peak_rank[slot6.rank] = slot6
		end

		slot0:updatePeakRankInfo(slot0.dic_arena_peak_rank)
	end
end

function ArenapeakchampionMainWindow.updatePeakRankInfo(slot0, slot1)
	for slot5, slot6 in ipairs(slot0.lay_head_list) do
		if slot1[slot5] then
			slot0:showHeadInfo(true, slot6, slot7.face_id, slot7.face_file, slot7.face_update_time)

			if slot5 == 1 and not slot0.is_init_1 then
				slot0.is_init_1 = true

				slot0:showFlagEffect(true)
			end

			slot6.tip_img:setVisible(false)
			slot6.name:setString(slot7.name)

			if getServerName(slot7.srv_id) == "" then
				slot8 = TI18N("异域")
			end

			slot6.srv_name:setString(uv0("[%s]", slot8))
		else
			slot0:showHeadInfo(false, slot6)
			slot6.tip_img:setVisible(true)
			slot6.name:setString(TI18N("虚位以待"))
			slot6.srv_name:setString("")
		end
	end
end

function ArenapeakchampionMainWindow.showHeadInfo(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot1 then
		slot2.head_node:setVisible(true)

		if slot2.clipNode == nil then
			slot2.clipNode = cc.ClippingNode:create(createSprite(PathTool.getResFrame("common", "common_1032"), slot0.vSize.width / 2, slot0.vSize.height / 2, nil, cc.p(0.5, 0.5)))

			slot2.clipNode:setAnchorPoint(cc.p(0.5, 0.5))
			slot2.clipNode:setContentSize(slot0.vSize)
			slot2.clipNode:setCascadeOpacityEnabled(true)
			slot2.clipNode:setAlphaThreshold(0)
			slot2.head_node:addChild(slot2.clipNode, 2)

			slot2.icon = ccui.ImageView:create()

			slot2.icon:setScale(0.8)
			slot2.icon:setCascadeOpacityEnabled(true)
			slot2.icon:setAnchorPoint(0.5, 0.5)
			slot2.icon:setPosition(slot0.vSize.width / 2, slot0.vSize.height / 2 + 2)
			slot2.clipNode:addChild(slot2.icon, 3)
		end

		if slot3 and (slot2.record_face_id == nil or slot2.record_face_id ~= slot3) then
			slot2.record_face_id = slot3

			slot0:setHeadRes(slot2.icon, slot3, false, LOADTEXT_TYPE, slot4, slot5)
		end
	elseif slot2.head_node then
		slot2.head_node:setVisible(false)
	end
end

function ArenapeakchampionMainWindow.setHeadRes(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	if slot2 == nil or slot2 == "" then
		return
	end

	if slot5 and slot5 ~= "" and (slot7 or slot6 and slot6 ~= 0) then
		TencentCos:getInstance():downLoadHeadFile(slot5, slot6, function (slot0)
			if not tolua.isnull(uv0) then
				uv1:setHeadRes(uv0, slot0, true)
			end
		end)
	else
		slot4 = slot4 or LOADTEXT_TYPE

		if (slot3 or false) == false then
			slot2 = PathTool.getHeadIcon(slot2)
		end

		if tolua.isnull(slot1) then
			return
		end

		slot1:loadTexture(slot2, slot4)

		slot8 = slot1:getContentSize()
		slot9 = 1
		slot10 = cc.size(90, 90)

		slot1:setScale(slot10.width / slot8.width > slot10.height / slot8.height and slot10.height / slot8.height or slot10.width / slot8.width)
	end
end

function ArenapeakchampionMainWindow.showFlagSpine(slot0, slot1)
	if slot1 == true then
		if slot0.play_effect == nil then
			slot0.play_effect = createEffectSpine("E27401", cc.p(0, -242), cc.p(0.5, 0.5), true, PlayerAction.action)

			slot0.spine_node:addChild(slot0.play_effect, 1)
		end
	elseif slot0.play_effect then
		slot0.play_effect:setVisible(false)
		slot0.play_effect:removeFromParent()

		slot0.play_effect = nil
	end
end

function ArenapeakchampionMainWindow.showFlagEffect(slot0, slot1)
	if slot1 == true then
		if slot0.flag_effect == nil and slot0.lay_head_list and slot0.lay_head_list[1] and slot0.lay_head_list[1].lay_head then
			slot0.flag_effect = createEffectSpine("E27405", cc.p(90, 90), cc.p(0.5, 0.5), true, PlayerAction.action)

			slot0.lay_head_list[1].lay_head:addChild(slot0.flag_effect, 1)
		end
	elseif slot0.flag_effect then
		slot0.flag_effect:setVisible(false)
		slot0.flag_effect:removeFromParent()

		slot0.flag_effect = nil
	end
end

function ArenapeakchampionMainWindow.close_callback(slot0)
	slot0:showFlagSpine(false)
	slot0:showFlagEffect(false)
	uv0:openArenapeakchampionMainWindow(false)
end
