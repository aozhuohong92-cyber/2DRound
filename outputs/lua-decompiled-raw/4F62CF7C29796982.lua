RankMainWindow = RankMainWindow or BaseClass(BaseView)
slot0 = table.sort
slot1 = RankController:getInstance()

function RankMainWindow.__init(slot0)
	slot0.ctrl = RankController:getInstance()
	slot0.is_full_screen = true
	slot0.win_type = WinType.Full
	slot0.title_str = TI18N("排行榜")
	slot0.cur_type = 0
	slot0.res_list = {}
	slot0.tab_info_list = {
		[RankConstant.MainTabType.LocalRank] = {
			status = true,
			label = TI18N("本服排行"),
			index = RankConstant.MainTabType.LocalRank
		},
		[RankConstant.MainTabType.CrossRank] = {
			status = true,
			label = TI18N("跨服排行"),
			index = RankConstant.MainTabType.CrossRank
		}
	}
	slot0.view_list = {}
	slot0.tab_list = {}
	slot0.is_init = true
	slot0.select_type = RankConstant.MainTabType.LocalRank
	slot0.is_cluster = false
	slot0.rank_first_list = {}
	slot0.showtips = {}
end

function RankMainWindow.open_callback(slot0)
	slot1 = createCSBNote(PathTool.getTargetCSB("rank/rank_main"))

	slot1:setPosition(cc.p(0, -15))
	slot0.container:addChild(slot1)

	slot0.main_panel = slot1:getChildByName("main_panel")

	slot0:playEnterAnimatianByObj(slot0.main_panel, 1)
end

function RankMainWindow.updateWorldLevel(slot0)
	slot0.world_lv_txt:setString(string.format(TI18N("%d级"), RoleController:getInstance():getModel():getWorldLev()))
end

function RankMainWindow.showWorldLevelTips(slot0, slot1)
	if slot1 == true then
		if not slot0.world_lv_layout then
			slot0.world_lv_layout = ccui.Layout:create()

			slot0.world_lv_layout:setTouchEnabled(true)
			slot0.world_lv_layout:setSwallowTouches(false)
			slot0.world_lv_layout:setContentSize(cc.size(SCREEN_WIDTH, SCREEN_HEIGHT))
			slot0.world_lv_layout:setLocalZOrder(999)
			slot0.world_lv_layout:setAnchorPoint(cc.p(0.5, 0.5))
			slot0.world_lv_layout:setPosition(SCREEN_WIDTH * 0.5, SCREEN_HEIGHT * 0.5)
			slot0:addChild(slot0.world_lv_layout)
			registerButtonEventListener(slot0.world_lv_layout, function ()
				uv0:showWorldLevelTips(false)
			end)

			slot3 = slot0.world_lv_layout:convertToNodeSpace(slot0.world_lv_btn:convertToWorldSpace(cc.p(0, 0)))

			createImage(slot0.world_lv_layout, PathTool.getResFrame("common", "common_1056"), slot3.x + 150, slot3.y - 10, cc.p(0.5, 1), true, nil, true):setTouchEnabled(true)

			slot5 = cc.size(400, 150)

			if Config.WorldLevData.data_const.worldlev_des then
				slot7 = createLabel(24, 161, nil, 30, 85, slot6.desc, slot4, nil, cc.p(0, 1))

				slot7:setMaxLineWidth(350)

				slot5.height = slot5.height + slot7:getContentSize().height

				slot7:setPosition(cc.p(30, slot5.height - 90))
			end

			slot4:setContentSize(slot5)

			slot7 = createSprite(PathTool.getResFrame("common", "txt_cn_common_90022"), 50, slot5.height - 40, slot4, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)
			slot8 = createLabel(26, 161, nil, 85, slot5.height - 40, TI18N("世界等级"), slot4, nil, cc.p(0, 0.5))
			slot9 = createSprite(PathTool.getResFrame("common", "common_1072"), 200, slot5.height - 75, slot4, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)

			slot9:setScaleY(3)
			slot9:setRotation(90)

			slot0.world_lv_txt = createRichLabel(24, 161, cc.p(0, 0.5), cc.p(30, 35))

			slot4:addChild(slot0.world_lv_txt)
			slot0.world_lv_txt:setString(string.format(TI18N("当前世界等级:<div fontcolor=#249003>%d级</div>"), RoleController:getInstance():getModel():getWorldLev()))
		end

		slot0.world_lv_layout:setVisible(true)
	elseif slot0.world_lv_layout then
		slot0.world_lv_layout:setVisible(false)
	end
end

function RankMainWindow.register_event(slot0)
	if not slot0.get_first_event then
		slot0.get_first_event = GlobalEvent:getInstance():Bind(RankEvent.RankEvent_Get_First_data, function (slot0)
			if not slot0 then
				return
			end

			slot1 = RankConstant.MainTabType.LocalRank

			if slot0.is_cluster == 1 then
				slot1 = RankConstant.MainTabType.CrossRank
			end

			if uv0.select_type ~= slot1 then
				return
			end

			uv0.rank_first_list[slot1] = slot0.rank_list

			uv0:updateRankList()
		end)
	end
end

function RankMainWindow.openRootWnd(slot0, slot1)
	slot0.select_type = slot1 or RankConstant.MainTabType.LocalRank

	slot0:checkTabUnlockInfo()
	slot0:setSelecteTab(slot0.select_type)
end

function RankMainWindow.checkTabUnlockInfo(slot0)
	slot0.tab_info_list[RankConstant.MainTabType.CrossRank].status = true

	if Config.CityData.data_base[CenterSceneBuild.crossshow] then
		for slot5, slot6 in ipairs(slot1.activate) do
			if slot6[1] == "world_lev" and (RoleController:getInstance():getModel():getWorldLev() or 0) < slot6[2] then
				slot0.tab_info_list[RankConstant.MainTabType.CrossRank].status = false

				slot0:setTabBtnTouchStatus(false, RankConstant.MainTabType.CrossRank)

				slot0.tab_btn_list[RankConstant.MainTabType.CrossRank].notice = string.format(TI18N("世界等级%s级解锁"), slot6[2])
			end
		end
	else
		slot0.tab_info_list[RankConstant.MainTabType.CrossRank].status = false

		slot0:setTabBtnTouchStatus(false, RankConstant.MainTabType.CrossRank)
	end
end

function RankMainWindow.selectedTabCallBack(slot0, slot1)
	slot0:changeTabIndex(slot1)
end

function RankMainWindow.changeTabIndex(slot0, slot1)
	if slot1 == RankConstant.MainTabType.CrossRank and not slot0.tab_info_list[slot1].status then
		if slot0.showtips[slot1] then
			message(slot0.showtips[slot1])
		end

		return
	end

	slot0.select_type = slot1

	if slot0.rank_first_list[slot1] ~= nil then
		slot0:updateRankList()
	else
		slot0.is_cluster = slot0.select_type == RankConstant.MainTabType.CrossRank

		uv0:send_12902(slot0.is_cluster)
	end
end

function RankMainWindow.updateRankList(slot0)
	if slot0.select_type == nil then
		return
	end

	if slot0.rank_first_list[slot0.select_type] == nil then
		return
	end

	if not slot0.list_view then
		slot0.list_view = CommonScrollViewLayout.new(slot0.main_panel, cc.p(16, 35), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(630, 750), {
			start_y = 5,
			item_width = 605,
			start_x = 0,
			space_x = 0,
			row = 1,
			item_height = 168,
			space_y = 0,
			col = 1,
			item_class = RankMainItem
		})
	end

	slot2 = {}

	if slot0.select_type == RankConstant.MainTabType.LocalRank then
		for slot7, slot8 in pairs(slot1) do
			if ({
				[2] = 2,
				[3] = 3,
				[4] = 5,
				[5] = 4,
				[6] = 1
			})[slot8.type] then
				table.insert(slot2, {
					sort = slot9,
					rank_type = slot8.type,
					rank_vo = slot8
				})
			end
		end

		uv0(slot2, function (slot0, slot1)
			return slot0.sort < slot1.sort
		end)
	else
		for slot6, slot7 in pairs(slot1) do
			table.insert(slot2, {
				rank_type = slot7.type,
				rank_vo = slot7
			})
		end

		uv0(slot2, function (slot0, slot1)
			return slot0.rank_type < slot1.rank_type
		end)
	end

	slot0.list_view:setData(slot2, function (slot0, slot1)
		if slot1 and next(slot1) ~= nil then
			uv0.ctrl:openRankView(true, slot0:getRankIndex() or 1, uv1)
		end
	end, nil, slot0.select_type == RankConstant.MainTabType.CrossRank)
end

function RankMainWindow.close_callback(slot0)
	slot0.ctrl:openMainView(false)

	if slot0.get_first_event then
		GlobalEvent:getInstance():UnBind(slot0.get_first_event)

		slot0.get_first_event = nil
	end

	if slot0.list_view then
		slot0.list_view:DeleteMe()
	end

	slot0.list_view = nil
end
