RankWindow = RankWindow or BaseClass(BaseView)
slot0 = table.sort
slot1 = ElitematchController:getInstance()
slot2 = Config.ArenaEliteData.data_elite_level

function RankWindow.__init(slot0, slot1, slot2)
	slot0.is_cluster = slot2 or false
	slot0.ctrl = RankController:getInstance()
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "rank/rank_window"
	slot0.cur_type = 0
	slot0.res_list = {}
	slot0.tab_info_list = {}
	slot0.first_list = {}
	slot0.click_index = slot1 or 1
end

function RankWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_panel = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_panel, 1)

	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.rank_panel = slot0.main_panel:getChildByName("rank_panel")
	slot0.my_rank = slot0.main_panel:getChildByName("my_rank")

	slot0.my_rank:getChildByName("title"):setString(TI18N("我的排名"))

	slot0.rank_index = slot0.my_rank:getChildByName("rank_id")
	slot0.four_label = createRichLabel(24, Config.ColorData.data_color4[175], cc.p(0.5, 0.5), cc.p(370, 35), 0, 0, 500)

	slot0.my_rank:addChild(slot0.four_label)

	slot0.my_rank_power = createLabel(24, Config.ColorData.data_color4[175], nil, 528, 35, "", slot0.my_rank, 0, cc.p(0.5, 0.5))
	slot0.my_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.my_head:setHeadLayerScale(0.9)
	slot0.my_head:setPosition(160, 60)
	slot0.my_rank:addChild(slot0.my_head)

	slot0.no_rank = createLabel(24, Config.ColorData.data_color4[175], nil, 62, 45, TI18N("未上榜"), slot0.my_rank, 0, cc.p(0.5, 0.5))
	slot0.my_name = createLabel(24, Config.ColorData.data_color4[175], nil, 285, 56, "", slot0.my_rank, 0, cc.p(0.5, 0.5))

	if slot0.click_index == RankConstant.RankType.elite then
		slot0.rank_index:setVisible(false)
		slot0.my_head:setVisible(false)
		slot0.my_name:setVisible(false)

		slot0.elite_lev = createSprite("", 220, 60, slot0.my_rank, cc.p(0.5, 0.5), LOADTEXT_TYPE)

		slot0.elite_lev:setVisible(false)

		if not slot0.elite_load then
			slot0.elite_load = loadSpriteTextureFromCDN(slot0.elite_lev, PathTool.getPlistImgForDownLoad("elitematch/elitematch_icon", "elitemmatch_little_icon_01", false), ResourcesType.single, slot0.elite_load)
		end

		slot0.rank_score = createLabel(24, Config.ColorData.data_color4[175], nil, 333, 60, "", slot0.my_rank, 0, cc.p(0.5, 0.5))

		slot0.rank_score:setString("0")
		createButton(slot0.my_rank, TI18N("查看结算奖励"), 509, 60, cc.size(179, 54), PathTool.getResFrame("common", "common_1018"), 26, cc.c4b(37, 85, 5, 255)):addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				ElitematchController:getInstance():openElitematchRewardPanel(true, 3, ElitematchController:getInstance():getModel():getEliteLev(), ElitematchController:getInstance():getModel():getEliteRank())
			end
		end)
	end

	slot0.title_con = slot0.main_panel:getChildByName("title_con")

	if slot0.click_index == RankConstant.RankType.elite then
		slot0.title_con:getChildByName("title_label"):setString(string.format(TI18N("S%d赛季"), uv0:getModel():getElitePeriod()))
	else
		slot2:setString(RankConstant.TitleName[slot0.click_index] or "")
	end

	slot0.top_bg = slot0.main_panel:getChildByName("top_bg")

	if not slot0.item_load then
		slot0.item_load = createResourcesLoad(PathTool.getPlistImgForDownLoad("bigbg/rank", "rank_2"), ResourcesType.single, function ()
			if not tolua.isnull(uv0.top_bg) then
				loadSpriteTexture(uv0.top_bg, uv1, LOADTEXT_TYPE)
			end
		end, slot0.item_load)
	end

	slot0:updateTitle()
end

function RankWindow.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0.ctrl:openRankView(false)
		end
	end)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0.ctrl:openRankView(false)
		end
	end)

	if not slot0.update_data_event then
		slot0.update_data_event = GlobalEvent:getInstance():Bind(RankEvent.RankEvent_Get_Rank_data, function (slot0)
			uv0:updateRankList(slot0)
		end)
	end

	if not slot0.arnea_data_event then
		slot0.arnea_data_event = GlobalEvent:getInstance():Bind(ArenaEvent.UpdateLoopChallengeRank, function (slot0)
			uv0:updateRankList(slot0)
		end)
	end

	if not slot0.get_time_event then
		slot0.get_time_event = GlobalEvent:getInstance():Bind(RankEvent.RankEvent_Get_Time_event, function (slot0)
			if not slot0 or not uv0.click_index then
				return
			end

			slot1 = uv0.click_index or RankConstant.RankType.drama

			if slot0.type and slot1 ~= slot0.type then
				return
			end

			if not SysEnv:getInstance():loadRankFile(slot1, uv0.is_cluster) or next(slot2) == nil then
				uv0:senProto(slot1)
			elseif slot0.time and slot2.data and slot0.type and (slot0.time == 0 or slot0.time == slot2.timestamp) and slot1 == slot0.type then
				uv0:updateRankList(slot2.data)
			else
				uv0:senProto(slot1)
			end
		end)
	end
end

function RankWindow.openRootWnd(slot0)
	if slot0.click_index == RankConstant.RankType.fans then
		if RoleController:getInstance():getModel() and slot1.fans_rank_data then
			slot0:updateRankList(slot1.fans_rank_data)
		end
	else
		slot0.ctrl:send_12901(slot0.click_index, slot0.is_cluster)
	end
end

function RankWindow.setPanelData(slot0)
end

function RankWindow.updateTitle(slot0)
	slot2 = #(RankConstant.RankTitle[slot0.click_index] or {}) or 0
	slot3 = RankConstant.TitlePos[slot0.click_index] or {}

	for slot8 = 1, slot2 do
		if slot8 ~= slot2 then
			createImage(slot0.main_panel, PathTool.getResFrame("common", "common_1069"), (RankConstant.TitleLinePos[slot0.click_index] or {})[slot8] or 0, 636, cc.p(0, 0.5), true, 1, false):setScaleY(0.8)
		end

		createLabel(24, Config.ColorData.data_color4[175], nil, slot3[slot8] or 0, 636, "", slot0.main_panel, 0, cc.p(0, 0.5)):setString(slot1[slot8] or "")
	end
end

function RankWindow.updateRankList(slot0, slot1)
	if slot0.click_index == RankConstant.RankType.elite then
		return
	end

	slot0.data = slot1

	slot0:updateMyData()
	slot0:updateRankData()

	if not slot0.list_view then
		slot0.list_view = CommonScrollViewSingleLayout.new(slot0.main_panel, cc.p(45, 170), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(640, 430), {
			start_y = 0,
			row = 1,
			start_x = 0,
			space_x = 5,
			item_width = 630,
			item_height = 120,
			space_y = 6,
			col = 1,
			need_dynamic = true
		}, cc.p(0, 0))

		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	if not slot1 or next(slot1) == nil then
		slot0:senProto(slot0.click_index)

		return
	end

	slot0.show_list = slot1.rank_list or {}

	slot0.list_view:reloadData()

	if #slot0.show_list == 0 then
		slot0:showEmptyIcon(true)
	else
		slot0:showEmptyIcon(false)
	end
end

function RankWindow.createNewCell(slot0, slot1, slot2)
	slot3 = RankItem.new(1)

	slot3:setExtendData({
		rank_type = slot0.click_index,
		is_cluster = slot0.is_cluster
	})

	return slot3
end

function RankWindow.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function RankWindow.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if slot0.show_list[slot2] then
		slot1:setData(slot3, slot2)
	end
end

function RankWindow.showEmptyIcon(slot0, slot1)
	if not slot0.empty_con and slot1 == false then
		return
	end

	if not slot0.empty_con then
		slot3 = cc.size(200, 200)
		slot0.empty_con = ccui.Widget:create()

		slot0.empty_con:setContentSize(slot3)
		slot0.empty_con:setAnchorPoint(cc.p(0.5, 0))
		slot0.empty_con:setPosition(cc.p(slot0.main_panel:getContentSize().width / 2, 330))
		slot0.main_panel:addChild(slot0.empty_con, 10)

		slot5 = createImage(slot0.empty_con, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_3"), slot3.width / 2, slot3.height / 2, cc.p(0.5, 0.5), false)
		slot0.empty_label = createLabel(26, Config.ColorData.data_color4[175], nil, slot3.width / 2, -10, "", slot0.empty_con, 0, cc.p(0.5, 0))
	end

	slot0.empty_label:setString(TI18N("当前排行榜暂无数据"))
	slot0.empty_con:setVisible(slot1)
end

function RankWindow.senProto(slot0, slot1)
	if slot1 == RankConstant.RankType.union then
		slot0.ctrl:send_12903(slot0.is_cluster)
	elseif slot1 == RankConstant.RankType.arena then
		ArenaController:getInstance():requestLoopChalllengeRank()
	elseif slot1 == RankConstant.RankType.action_partner then
		slot0.ctrl:send_12904(0, 100)
	else
		slot0.ctrl:send_12900(slot1, nil, , slot0.is_cluster)
	end
end

function RankWindow.updateMyData(slot0)
	if not slot0.data then
		return
	end

	slot2 = TI18N("0")

	if (slot0.data.my_idx or slot1.rank or 0) and slot3 > 0 then
		slot2 = slot3
	end

	slot0.no_rank:setVisible(false)

	slot4 = RoleController:getInstance():getRoleVo()

	slot0.rank_index:setString(slot2)

	if slot3 and slot3 >= 1 and slot3 <= 3 then
		slot0.rank_index:setVisible(false)

		if not slot0.my_rank_icon then
			slot0.my_rank_icon = createImage(slot0.my_rank, nil, 43, 26, cc.p(0, 0), true, 1, false)
		end

		slot0.my_rank_icon:setVisible(true)
		slot0.my_rank_icon:loadTexture(PathTool.getResFrame("common", "common_200" .. slot3), LOADTEXT_TYPE_PLIST)
		slot0.my_rank_icon:setScale(0.7)
	elseif slot3 <= 0 then
		slot0.no_rank:setVisible(true)
		slot0.rank_index:setVisible(false)
	else
		slot0.rank_index:setVisible(true)

		if slot0.my_rank_icon then
			slot0.my_rank_icon:setVisible(false)
		end
	end

	slot0.my_head:setHeadRes(slot4.face_id, false, LOADTEXT_TYPE, slot4.face_file, slot4.face_update_time)
	slot0.my_name:setString(slot4.name or "")

	if Config.AvatarData.data_avatar[slot1.avatar_bid] then
		slot0.my_head:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot7.res_id or 1), false, false), nil, false, slot7.offy)
	end

	slot8 = ""

	slot0.my_rank_power:setPositionX(528)
	slot0.four_label:setVisible(true)

	if slot0.rune_item then
		slot0.rune_item:setVisible(false)
	end

	slot0.my_rank_power:setString("")
	slot0.four_label:setPosition(cc.p(485, 50))

	if slot0.click_index == RankConstant.RankType.power or slot0.click_index == RankConstant.RankType.action_power then
		slot8 = string.format("<img src='%s' /> %s", PathTool.getResFrame("common", "common_90002"), slot1.my_val1 or 0)
	elseif slot0.click_index == RankConstant.RankType.drama or slot0.click_index == RankConstant.RankType.action_drama then
		if Config.DungeonData.data_drama_dungeon_info(slot1.my_val1) then
			slot8 = slot9.name
		end
	elseif slot0.click_index == RankConstant.RankType.union then
		slot8 = string.format(TI18N("<div fontsize=20 fontcolor=#0EBEBE>会长名：%s</div>"), slot1.leader_name)

		if slot4.gid == 0 then
			slot8 = TI18N("暂无公会")
		end

		slot0.my_name:setString(slot4.gname)
		slot0.my_name:setPosition(cc.p(215, 82))
		slot0.my_head:setVisible(false)
		slot0.four_label:setPosition(cc.p(215, 45))

		if (slot1.power or 0) <= 0 then
			slot0.my_rank_power:setString("")
		else
			slot0.my_rank_power:setString(slot9)
		end

		slot0.my_rank_power:setPositionX(535)
	elseif slot0.click_index == RankConstant.RankType.tower or slot0.click_index == RankConstant.RankType.action_tower then
		slot10 = TimeTool.GetTimeMS(slot1.my_val2 or 0, true)

		if slot1.my_val1 and slot1.my_val1 == 0 then
			slot10 = ""

			slot0.four_label:setVisible(false)
		end

		slot0.my_rank_power:setString(slot10)

		slot8 = slot1.my_val1 or ""

		slot0.four_label:setPosition(cc.p(430, 53))
		slot0.my_rank_power:setPosition(cc.p(540, 53))
	elseif slot0.click_index == RankConstant.RankType.adventure then
		slot8 = slot1.my_val1 or 0

		slot0.my_rank_power:setString(slot1.my_val2 ~= 0 and slot1.my_val2 or "")
		slot0.four_label:setPosition(cc.p(430, 53))
		slot0.my_rank_power:setPosition(cc.p(540, 53))
	elseif slot0.click_index == RankConstant.RankType.arena or slot0.click_index == RankConstant.RankType.action_arena then
		slot8 = string.format("<img src='%s' scale=0.35 /> %s", PathTool.getItemRes("8"), slot0.data.score or slot0.data.my_val1 or 0)
	elseif slot0.click_index == RankConstant.RankType.action_adventure then
		slot9 = PathTool.getResFrame("common", "common_90002")
		slot8 = slot1.my_val1 or 0
	elseif slot0.click_index == RankConstant.RankType.hallows_power or slot0.click_index == RankConstant.RankType.treasure then
		slot9 = PathTool.getResFrame("common", "common_90002")
		slot8 = slot1.my_val1 or 0
	elseif slot0.click_index == RankConstant.RankType.action_partner then
		slot9 = PathTool.getResFrame("common", "common_90002")
		slot10 = slot1.power or 0
		slot8 = slot10

		if slot10 > 0 then
			if not slot0.hero_item then
				slot0.hero_item = HeroExhibitionItem.new(0.8, true)

				slot0.hero_item:setPosition(cc.p(410, 60))
				slot0.my_rank:addChild(slot0.hero_item)
				slot0.hero_item:addCallBack(function (slot0)
					if slot0:getData() and next(slot1) ~= nil then
						slot2 = RoleController:getInstance():getRoleVo()

						LookController:sender11061(slot2.rid, slot2.srv_id, slot1.partner_id)
					end
				end)
			end

			slot0.hero_item:setData(slot0:createPartnerVo())
		end

		slot0.four_label:setPosition(cc.p(525, 53))
	elseif slot0.click_index == RankConstant.RankType.action_star or slot0.click_index == RankConstant.RankType.star_power then
		slot9 = PathTool.getResFrame("common", "common_90002")
		slot8 = slot1.my_val1 or 0

		slot0.four_label:setPosition(cc.p(525, 53))
	elseif slot0.click_index == RankConstant.RankType.elite then
		slot0.elite_lev:setVisible(true)
		slot0.rank_score:setString(slot0.data.score or 0)

		if slot0.elite_load then
			loadSpriteTexture(slot0.elite_lev, PathTool.getPlistImgForDownLoad("elitematch/elitematch_icon", uv0[slot0.data.elite_lev or 1].little_ico, false), LOADTEXT_TYPE)
		end
	elseif slot0.click_index == RankConstant.RankType.ladder then
		slot8 = string.format("<img src='%s' /> %s", PathTool.getResFrame("common", "common_90002"), slot1.my_val1 or 0)

		if slot0.guild_name == nil then
			slot0.guild_name = createLabel(24, Config.ColorData.data_color4[175], nil, 480, 65, "", slot0.my_rank, 0, cc.p(0.5, 0.5))
		end

		slot11 = nil

		slot0.guild_name:setString((slot4.gid ~= 0 or TI18N("暂无公会")) and slot4.gname)
		slot0.my_name:setPosition(285, 78)
		slot0.four_label:setPosition(285, 50)
	elseif slot0.click_index == RankConstant.RankType.fans then
		slot8 = slot4.fans_num
	elseif slot0.click_index == RankConstant.RankType.planes_rank or slot0.click_index == RankConstant.RankType.sweet then
		slot8 = slot0.data.my_val1 or 0

		slot0.my_name:setAnchorPoint(cc.p(0, 0.5))
		slot0.my_name:setPositionX(208)
		slot0.four_label:setPosition(445, 58)
	elseif slot0.click_index == RankConstant.RankType.summon_prophet then
		slot8 = slot0.data.my_val1
	end

	if slot8 == 0 then
		slot8 = ""
	end

	slot0.four_label:setString(slot8)
end

function RankWindow.createPartnerVo(slot0)
	slot1 = HeroVo.New()

	slot1:updateHeroVo({
		partner_id = slot0.data.pid,
		bid = slot0.data.pbid,
		lev = slot0.data.plev,
		star = slot0.data.pstar
	})

	return slot1
end

function RankWindow.updateRankData(slot0)
	if not slot0.data then
		return
	end

	slot1 = nil
	slot1 = slot0.click_index == RankConstant.RankType.elite and (slot0.data.arena_elite_rank or {}) or slot0.data.rank_list or {}
	slot2 = 0
	slot3 = slot0.main_panel:getContentSize()

	for slot7 = 1, 3 do
		slot0.first_list[slot7] = slot0.first_list[slot7] or {}

		if slot0.first_list[slot7].role_spine then
			slot0.first_list[slot7].role_spine:DeleteMe()

			slot0.first_list[slot7].role_spine = nil
		end

		slot8 = slot3.width / 2
		slot9 = 883
		slot10 = 0

		if slot7 == 2 then
			slot8 = slot3.width / 2 - 226
			slot9 = 870
			slot10 = 6
		elseif slot7 == 3 then
			slot8 = slot3.width / 2 + 234
			slot9 = 870
			slot10 = 6
		end

		if not slot0.first_list[slot7].name_txt then
			slot0.first_list[slot7].name_txt = createLabel(24, Config.ColorData.data_color4[1], 2, slot8, 712 - slot10, TI18N("虚位以待"), slot0.main_panel, 2, cc.p(0.5, 0.5))

			slot0.first_list[slot7].name_txt:setLocalZOrder(1)
		end

		if not slot0.first_list[slot7].title_sp then
			slot0.first_list[slot7].title_sp = createSprite(PathTool.getResFrame("common", "common_300" .. slot7), slot8, slot9 + 60, slot0.main_panel, cc.p(0.5, 0.5))

			slot0.first_list[slot7].title_sp:setScale(0.7)
			slot0.first_list[slot7].title_sp:setLocalZOrder(1)
		end
	end

	for slot7, slot8 in ipairs(slot1) do
		if (slot8.idx or slot8.rank) > 0 and slot9 <= 3 then
			slot2 = slot2 + 1

			if (slot8.look_id or slot8.lookid or slot8.leader_look_id or 110101) == 0 then
				slot10 = 110101
			end

			slot11 = slot3.width / 2
			slot12 = 873

			if slot9 == 2 then
				slot11 = slot3.width / 2 - 226
				slot12 = 860
			elseif slot9 == 3 then
				slot11 = slot3.width / 2 + 234
				slot12 = 860
			end

			slot13 = BaseRole.new(BaseRole.type.role, slot10)

			slot13:setCascade(true)
			slot13:setAnchorPoint(cc.p(0.5, 0))
			slot13:setAnimation(0, PlayerAction.show, true)
			slot13:setScale(0.4)
			slot0.main_panel:addChild(slot13)
			slot13:setPosition(slot11, slot12 - 100)

			slot0.first_list[slot9].role_spine = slot13

			if slot0.first_list[slot9].name_txt then
				slot0.first_list[slot9].name_txt:setString(slot8.name or "")
			end

			if not slot0.first_list[slot9].touch_layer then
				slot14 = ccui.Layout:create()

				slot14:setAnchorPoint(cc.p(0.5, 0))
				slot14:setContentSize(cc.size(160, 260))
				slot14:setPosition(slot11, slot12 - 173)
				slot14:setTouchEnabled(true)
				slot0.main_panel:addChild(slot14)

				slot0.first_list[slot9].touch_layer = slot14
			end

			slot0.first_list[slot9].touch_layer:addTouchEventListener(function (slot0, slot1)
				if ccui.TouchEventType.ended == slot1 and uv0 then
					uv1.ctrl:openChatMessage(uv0.rid or uv0.leader_rid or 0, uv0.srv_id or uv0.leader_srvid or 0, nil, cc.p(slot0:getTouchEndPosition().x + 320, slot0:getTouchEndPosition().y))
				end
			end)
		end

		if slot2 >= 3 then
			break
		end
	end
end

function RankWindow.onEnterAnim(slot0)
end

function RankWindow.close_callback(slot0)
	if slot0.data and slot0.data.time and slot0.data.time ~= 0 then
		SysEnv:getInstance():saveRankFile(slot0.click_index, slot0.data.time, slot0.data, slot0.is_cluster)
	end

	slot0.ctrl:openRankView(false)

	if slot0.update_data_event then
		GlobalEvent:getInstance():UnBind(slot0.update_data_event)

		slot0.update_data_event = nil
	end

	if slot0.arnea_data_event then
		GlobalEvent:getInstance():UnBind(slot0.arnea_data_event)

		slot0.arnea_data_event = nil
	end

	if slot0.get_time_event then
		GlobalEvent:getInstance():UnBind(slot0.get_time_event)

		slot0.get_time_event = nil
	end

	for slot4, slot5 in pairs(slot0.first_list) do
		if slot5.role_spine then
			slot5.role_spine:DeleteMe()

			slot5.role_spine = nil
		end
	end

	slot0.first_list = {}

	if slot0.list_view then
		slot0.list_view:DeleteMe()
	end

	slot0.list_view = nil

	if slot0.elite_list_view then
		slot0.elite_list_view:DeleteMe()
	end

	slot0.elite_list_view = nil

	if slot0.item_load then
		slot0.item_load:DeleteMe()
	end

	if slot0.hero_item then
		slot0.hero_item:DeleteMe()
	end

	slot0.hero_item = nil
	slot0.item_load = nil

	if slot0.elite_load then
		slot0.elite_load:DeleteMe()
	end

	slot0.elite_load = nil
end
