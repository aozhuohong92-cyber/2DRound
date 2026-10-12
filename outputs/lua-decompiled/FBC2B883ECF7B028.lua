BattleResultShowInfoWindow = BattleResultShowInfoWindow or BaseClass(BaseView)
slot0 = BattleController:getInstance()
slot1 = table.insert
slot2 = RoleController:getInstance():getRoleVo()
slot3 = Config.UnitData.data_unit
slot4 = Config.PartnerData.data_partner_base

function BattleResultShowInfoWindow.__init(slot0, slot1)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.win_type = WinType.Big
	slot0.layout_name = "battle/battle_result_showinfo"
	slot0.total_data = {}
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("vedio", "vedio"),
			type = ResourcesType.plist
		}
	}
	slot0.view_type = slot1 or ArenaConst.champion_type.normal
end

function BattleResultShowInfoWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 1)

	slot6 = TI18N

	slot1:getChildByName("main_panel"):getChildByName("win_title"):setString(slot6("数据统计"))

	for slot6 = 1, 3 do
		if slot2:getChildByName("desc_" .. slot6) then
			if slot6 == 1 then
				slot7:setString(TI18N("伤害"))
			elseif slot6 == 2 then
				slot7:setString(TI18N("承受伤害"))
			else
				slot7:setString(TI18N("治疗"))
			end
		end
	end

	slot0.tab_list = {}

	for slot6 = 1, 3 do
		if slot1:getChildByName("tab_btn_" .. slot6) then
			slot8 = slot7:getChildByName("unselect_bg")
			slot9 = slot7:getChildByName("select_bg")

			slot8:setVisible(true)
			slot9:setVisible(false)

			slot0.tab_list[slot6] = {
				tab = slot7,
				unselect = slot8,
				select = slot9,
				title = slot7:getChildByName("title")
			}

			if slot6 == 1 then
				slot10:setString(TI18N("队伍一"))
			elseif slot6 == 2 then
				slot10:setString(TI18N("队伍二"))
			elseif slot6 == 3 then
				slot10:setString(TI18N("队伍三"))
			end
		end
	end

	slot0.item = slot2:getChildByName("item")

	slot0.item:setVisible(false)

	slot0.close_btn = slot2:getChildByName("close_btn")
	slot0.top_list_view = slot2:getChildByName("top_list_view")
	slot0.bottom_list_view = slot2:getChildByName("bottom_list_view")
	slot0.top_name = slot2:getChildByName("top_name")
	slot0.bottom_name = slot2:getChildByName("bottom_name")
	slot0.success_img = slot2:getChildByName("success_img")
	slot0.fail_img = slot2:getChildByName("fail_img")
	slot0.top_y = 702
	slot0.bottom_y = 360
	slot0.report_btn = slot2:getChildByName("report_btn")
	slot0.share_btn = slot2:getChildByName("share_btn")
	slot0.share_panel = slot1:getChildByName("share_panel")

	slot0.share_panel:setVisible(false)
	slot0.share_panel:setSwallowTouches(false)

	slot0.share_bg = slot0.share_panel:getChildByName("share_bg")
	slot0.btn_guild = slot0.share_bg:getChildByName("btn_guild")
	slot0.btn_world = slot0.share_bg:getChildByName("btn_world")
	slot0.btn_cross = slot0.share_bg:getChildByName("btn_cross")

	slot0.share_bg:getChildByName("guild_label"):setString(TI18N("分享到公会频道"))
	slot0.share_bg:getChildByName("world_label"):setString(TI18N("分享到世界频道"))
	slot0.share_bg:getChildByName("cross_label"):setString(TI18N("分享到跨服频道"))

	slot0.baseZOrder = slot2:getLocalZOrder()
end

function BattleResultShowInfoWindow.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:onCloseBtn()
		end
	end)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:onCloseBtn()
		end
	end)
	slot0.report_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound()
			uv0:onClickReportBtn()
		end
	end)
	slot0.share_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound()
			uv0.share_panel:setVisible(true)
		end
	end)
	registerButtonEventListener(slot0.btn_guild, function ()
		if RoleController:getInstance():getRoleVo():isHasGuild() == false then
			message(TI18N("您暂未加入公会"))

			return
		end

		uv0:onClickShareBtnByType(ChatConst.Channel.Gang)
	end, false, 1)
	registerButtonEventListener(slot0.btn_world, function ()
		uv0:onClickShareBtnByType(ChatConst.Channel.World)
	end, false, 1)

	slot5 = false

	registerButtonEventListener(slot0.btn_cross, function ()
		if RoleController:getInstance():getRoleVo().lev < Config.MiscData.data_const.cross_level.val then
			message(string.format(TI18N("%d级开启跨服频道"), slot0.val))

			return
		end

		uv0:onClickShareBtnByType(ChatConst.Channel.Cross)
	end, slot5, 1)

	function slot4(slot0, slot1)
		if slot1 == ccui.TouchEventType.began then
			uv0.share_panel:setVisible(false)
		end
	end

	slot0.share_panel:addTouchEventListener(slot4)

	for slot4, slot5 in ipairs(slot0.tab_list) do
		slot0.tab_list[slot4].tab:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playTabButtonSound()
				uv0:changeTabIndex(uv1)
			end
		end)
	end
end

function BattleResultShowInfoWindow.onCloseBtn(slot0)
	if slot0.fight_type == BattleConst.Fight_Type.PlanesWar and GuildbossController:getInstance() and slot1.hideGuildbossResultWindow then
		slot1:hideGuildbossResultWindow(true)
	end

	uv0:openBattleResultShowInfoWindow(false)
end

function BattleResultShowInfoWindow.onClickReportBtn(slot0)
	slot1 = RoleController:getInstance():getRoleVo()

	if slot0.replay_id and slot1 then
		if slot0.fight_type == BattleConst.Fight_Type.Arena then
			ArenaController:getInstance():openLoopResultWindow(false)
		elseif slot0.fight_type == BattleConst.Fight_Type.LadderWar then
			LadderController:getInstance():openLadderBattleResultWindow(false)
		elseif slot0.fight_type == BattleConst.Fight_Type.EliteMatchWar or slot0.fight_type == BattleConst.Fight_Type.EliteKingMatchWar then
			ElitematchController:getInstance():openElitematchFightResultPanel(false)
		elseif slot0.fight_type == BattleConst.Fight_Type.StarTower then
			StartowerController:getInstance():openResultWindow(false)
		elseif slot0.fight_type == BattleConst.Fight_Type.PlanesWar and GuildbossController:getInstance() and slot2.hideGuildbossResultWindow then
			slot2:hideGuildbossResultWindow(false)
		end

		if slot0.success == 1 then
			BattleController:getInstance():openFinishView(false, slot0.fight_type)
		else
			BattleController:getInstance():openFailFinishView(false, slot0.fight_type)
		end

		BattleController:getInstance():csRecordBattle(slot0.replay_id, slot1.srv_id)
	end
end

function BattleResultShowInfoWindow.onClickShareBtnByType(slot0, slot1)
	if slot0.replay_id and slot0.fight_type then
		BattleController:getInstance():on20034(slot0.replay_id, slot1, slot0.target_name or "", BattleConst.getShareTypeByBattleType(slot0.fight_type))
		slot0.share_panel:setVisible(false)
	end
end

function BattleResultShowInfoWindow.changeTabIndex(slot0, slot1)
	if slot0.select_index == slot1 then
		return
	end

	slot0.select_index = slot1

	if slot0.select_tab then
		slot0.select_tab.tab:setLocalZOrder(slot0.baseZOrder - 99)
		slot0.select_tab.select:setVisible(false)
		slot0.select_tab.unselect:setVisible(true)
	end

	slot0.select_tab = slot0.tab_list[slot1]

	slot0.select_tab.tab:setLocalZOrder(slot0.baseZOrder + 99)
	slot0.select_tab.select:setVisible(true)
	slot0.select_tab.unselect:setVisible(false)

	if slot0.total_data[slot1] then
		slot0:setData(slot2)
	end
end

function BattleResultShowInfoWindow.openRootWnd(slot0, slot1, slot2)
	if slot1 == nil then
		return
	end

	slot0.fight_type = (slot2 or {}).fight_type or slot1.combat_type

	if slot1.hurt_statistics == nil and next(slot1) ~= nil then
		slot0.total_data = slot1

		for slot8 = 1, math.min(#slot1, 3) do
			slot0.tab_list[slot8].tab:setVisible(true)
		end

		slot0:changeTabIndex(1)
	else
		slot0:setData(slot1)
	end

	if slot0.fight_type and slot0.fight_type == BattleConst.Fight_Type.Arena or slot0.fight_type == BattleConst.Fight_Type.PK or slot0.fight_type == BattleConst.Fight_Type.GuildWar or slot0.fight_type == BattleConst.Fight_Type.LadderWar or slot0.fight_type == BattleConst.Fight_Type.EliteMatchWar or slot0.fight_type == BattleConst.Fight_Type.EliteKingMatchWar or slot0.fight_type == BattleConst.Fight_Type.StarTower or slot0.fight_type == BattleConst.Fight_Type.AreanManyPeople or slot0.fight_type == BattleConst.Fight_Type.PlanesWar then
		slot0.report_btn:setVisible(true)
		slot0.share_btn:setVisible(true)
	end
end

function BattleResultShowInfoWindow.setData(slot0, slot1)
	slot0.top_plist = {}
	slot0.bot_plist = {}
	slot0.success = slot1.result or 0
	slot0.atk_name = slot1.atk_name or uv0.name or ""
	slot0.target_name = slot1.target_role_name or slot1.def_name or ""
	slot0.replay_id = slot1.replay_id or slot1.vedio_id

	for slot5, slot6 in pairs(slot1.hurt_statistics or {}) do
		if slot6.type == 1 or slot6.type == 0 then
			slot0.top_plist = slot6.partner_hurts
		elseif slot6.type == 2 then
			slot0.bot_plist = slot6.partner_hurts
		end
	end

	slot0:setBaseInfo()

	slot3 = 0
	slot4 = 0

	for slot8, slot9 in ipairs(slot0.top_plist) do
		slot9.dps = slot9.dps or 0
		slot9.be_hurt = slot9.be_hurt or 0
		slot9.cure = slot9.cure or 0

		if 0 < slot9.dps then
			slot2 = slot9.dps
		end

		if slot3 < slot9.be_hurt then
			slot3 = slot9.be_hurt
		end

		if slot4 < slot9.cure then
			slot4 = slot9.cure
		end
	end

	for slot8, slot9 in ipairs(slot0.bot_plist) do
		slot9.dps = slot9.dps or 0
		slot9.be_hurt = slot9.be_hurt or 0
		slot9.cure = slot9.cure or 0

		if slot2 < slot9.dps then
			slot2 = slot9.dps
		end

		if slot3 < slot9.be_hurt then
			slot3 = slot9.be_hurt
		end

		if slot4 < slot9.cure then
			slot4 = slot9.cure
		end
	end

	slot0:setTopInfo(slot2, slot3, slot4)
	slot0:setBottomInfo(slot2, slot3, slot4)
end

function BattleResultShowInfoWindow.setBaseInfo(slot0)
	slot0.success_img:setVisible(slot0.success ~= 0)
	slot0.fail_img:setVisible(slot0.success ~= 0)

	if slot0.success == 1 then
		slot0.success_img:setPositionY(slot0.top_y)
		slot0.fail_img:setPositionY(slot0.bottom_y)
	elseif slot0.success == 2 then
		slot0.success_img:setPositionY(slot0.bottom_y)
		slot0.fail_img:setPositionY(slot0.top_y)
	end

	slot0.top_name:setString(slot0.atk_name)
	slot0.bottom_name:setString(slot0.target_name)
end

function BattleResultShowInfoWindow.setTopInfo(slot0, slot1, slot2, slot3)
	slot4 = 0

	for slot9, slot10 in ipairs(slot0.top_plist) do
		if 0 < slot10.dps then
			slot5 = slot10.dps
			slot4 = slot10.bid
		end
	end

	if slot0.top_scroll_view == nil then
		slot0.top_scroll_view = CommonScrollViewLayout.new(slot0.top_list_view, nil, ScrollViewDir.horizontal, nil, slot0.top_list_view:getContentSize(), {
			start_y = 0,
			item_width = 122,
			start_x = 0,
			space_x = 0,
			row = 1,
			item_height = 278,
			space_y = 0,
			col = 1,
			item_class = BattleResultReportItem
		})
	end

	slot0.top_scroll_view:setVisible(true)
	slot0.top_scroll_view:setData(slot0.top_plist, nil, nil, {
		is_top_team = true,
		total_hurt = slot1,
		total_behurt = slot2,
		total_cure = slot3,
		_mvp_bid = slot4,
		node = slot0.item,
		fight_type = slot0.fight_type
	})
end

function BattleResultShowInfoWindow.setBottomInfo(slot0, slot1, slot2, slot3)
	slot4 = 0

	for slot9, slot10 in ipairs(slot0.bot_plist) do
		if 0 < slot10.dps then
			slot5 = slot10.dps
			slot4 = slot10.bid
		end
	end

	if slot0.bottom_scroll_view == nil then
		slot0.bottom_scroll_view = CommonScrollViewLayout.new(slot0.bottom_list_view, nil, ScrollViewDir.horizontal, nil, slot0.bottom_list_view:getContentSize(), {
			start_y = 0,
			item_width = 122,
			start_x = 0,
			space_x = 0,
			row = 1,
			item_height = 278,
			space_y = 0,
			col = 1,
			item_class = BattleResultReportItem
		})
	end

	slot0.bottom_scroll_view:setVisible(true)
	slot0.bottom_scroll_view:setData(slot0.bot_plist, nil, nil, {
		total_hurt = slot1,
		total_behurt = slot2,
		total_cure = slot3,
		_mvp_bid = slot4,
		node = slot0.item,
		fight_type = slot0.fight_type
	})
end

function BattleResultShowInfoWindow.close_callback(slot0)
	if slot0.top_scroll_view then
		slot0.top_scroll_view:DeleteMe()
	end

	slot0.top_scroll_view = nil

	if slot0.bottom_scroll_view then
		slot0.bottom_scroll_view:DeleteMe()
	end

	slot0.bottom_scroll_view = nil

	uv0:openBattleResultShowInfoWindow(false)
end

BattleResultReportItem = class("BattleResultReportItem", function ()
	return ccui.Layout:create()
end)

function BattleResultReportItem.ctor(slot0)
	slot0.is_completed = false
end

function BattleResultReportItem.setExtendData(slot0, slot1)
	slot0.total_hurt = slot1.total_hurt
	slot0.total_behurt = slot1.total_behurt
	slot0.total_cure = slot1.total_cure
	slot0.mvp_bid = slot1._mvp_bid
	slot0.fight_type = slot1.fight_type
	slot0.is_top_team = slot1.is_top_team

	if not tolua.isnull(slot1.node) and slot0.root_wnd == nil then
		slot0.is_completed = true
		slot3 = slot2:getContentSize()

		slot0:setAnchorPoint(cc.p(0.5, 0.5))
		slot0:setContentSize(slot3)

		slot0.root_wnd = slot2:clone()

		slot0.root_wnd:setVisible(true)
		slot0.root_wnd:setAnchorPoint(0.5, 0.5)
		slot0.root_wnd:setPosition(slot3.width * 0.5, slot3.height * 0.5)

		slot7 = slot0.root_wnd

		slot0:addChild(slot7)

		for slot7 = 1, 3 do
			slot0["progress_" .. slot7] = slot0.root_wnd:getChildByName("progress_" .. slot7)

			if slot0["progress_" .. slot7] then
				slot0["progress_" .. slot7]:setScale9Enabled(true)
			end

			slot0["desc_" .. slot7] = slot0.root_wnd:getChildByName("desc_" .. slot7)
		end

		slot0.mvp = slot0.root_wnd:getChildByName("mvp")
		slot0.partner_item = HeroExhibitionItem.new(0.8, true)

		slot0.partner_item:addCallBack(handler(slot0, slot0._onClickHeroCallBack))
		slot0.partner_item:setPosition(61, 198)
		slot0.root_wnd:addChild(slot0.partner_item)
	end
end

function BattleResultReportItem._onClickHeroCallBack(slot0)
	if slot0.data and slot0.data.rid and slot0.data.rid ~= 0 and slot0.data.srvid and slot0.data.srvid ~= "" and slot0.data.id and slot0.data.id ~= 0 then
		if RoleController:getInstance():getRoleVo().rid == slot0.data.rid and slot1.srv_id == slot0.data.srvid then
			if HeroController:getInstance():getModel():getHeroById(slot0.data.id) then
				HeroController:getInstance():openHeroTipsPanel(true, slot2)
			else
				message(TI18N("伙伴不存在"))
			end
		else
			LookController:getInstance():sender11061(slot0.data.rid, slot0.data.srvid, slot0.data.id)
		end
	else
		message(TI18N("该英雄来自异域，无法查看"))
	end
end

function BattleResultReportItem.setData(slot0, slot1)
	if slot1 and slot1.bid then
		slot0.data = slot1

		if slot0.mvp_bid and slot0.mvp_bid == slot1.bid then
			slot0.mvp:setVisible(true)
		else
			slot0.mvp:setVisible(false)
		end

		if (slot1.star == 0 or slot1.star == nil) and uv0(slot1.bid) then
			slot1.bid = tonumber(slot2.head_icon)
			slot1.master_head_id = slot1.bid

			if slot2.star and slot2.star > 0 then
				slot1.star = slot2.star
			elseif uv1[slot1.bid] then
				slot1.star = slot3.init_star
			end
		end

		slot0.partner_item:setData(slot1, true)

		if slot0.fight_type == BattleConst.Fight_Type.PlanesWar and slot0.is_top_team then
			if slot0.data.srvid == "" then
				slot0.partner_item:showHelpImg(true)
			else
				slot0.partner_item:showHelpImg(false)
			end
		end

		slot0.desc_1:setString(slot1.dps)
		slot0.desc_2:setString(slot1.be_hurt)
		slot0.desc_3:setString(slot1.cure)

		if slot0.total_hurt == 0 then
			slot0.progress_1:setPercent(0)
		else
			slot0.progress_1:setPercent(100 * slot1.dps / slot0.total_hurt)
		end

		if slot0.total_behurt == 0 then
			slot0.progress_2:setPercent(0)
		else
			slot0.progress_2:setPercent(100 * slot1.be_hurt / slot0.total_behurt)
		end

		if slot0.total_cure == 0 then
			slot0.progress_3:setPercent(0)
		else
			slot0.progress_3:setPercent(100 * slot1.cure / slot0.total_cure)
		end
	end
end

function BattleResultReportItem.DeleteMe(slot0)
	if slot0.partner_item then
		slot0.partner_item:DeleteMe()

		slot0.partner_item = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
