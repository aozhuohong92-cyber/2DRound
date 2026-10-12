slot1 = MonopolyController:getInstance():getModel()
slot2 = table.insert
slot3 = table.sort
slot4 = string.format
HolynightBossWindow = HolynightBossWindow or BaseClass(BaseView)

function HolynightBossWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "monopoly/holynight_boss_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("monopoly", "monopolyboss"),
			type = ResourcesType.plist
		}
	}
	slot0.cur_step_id = 1
	slot0.show_customs_data = {}
	slot0.mian_hero_list = {}
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.gold_item_bid = 0

	if Config.MonopolyMapsData.data_const.monopoly_gold_id then
		slot0.gold_item_bid = slot1.val
	end
end

function HolynightBossWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)
	slot0.main_container:getChildByName("win_title"):setString(TI18N("挑战BOSS"))
	slot0.main_container:getChildByName("rank_title"):setString(TI18N("通关排行榜"))

	slot0.rule_btn = slot0.main_container:getChildByName("rule_btn")
	slot0.chapter_btn = slot0.main_container:getChildByName("chapter_btn")
	slot0.chapter_btn_arrow = slot0.chapter_btn:getChildByName("arrow_sp")
	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.probe_txt = slot0.main_container:getChildByName("probe_txt")
	slot0.item_num_txt = slot0.main_container:getChildByName("item_num_txt")
	slot0.chapter_name_txt = slot0.main_container:getChildByName("chapter_name_txt")
	slot0.atk_txt = slot0.main_container:getChildByName("atk_txt")

	slot0.atk_txt:setString("+0")

	slot0.hp_txt = slot0.main_container:getChildByName("hp_txt")

	slot0.hp_txt:setString("+0")

	slot0.role_info_title = slot0.main_container:getChildByName("role_info_title")
	slot0.rank_more_txt = createRichLabel(22, 1, cc.p(0.5, 0.5), cc.p(539, 754))

	slot0.main_container:addChild(slot0.rank_more_txt)
	slot0.rank_more_txt:setString(TI18N("<div href=checkmore fontcolor=#249112 >查看详情</div>"))

	function slot5(slot0, slot1)
		if slot0 == "href" then
			uv0:openMonopolyRankWindow(true, uv1.cur_step_id)
		end
	end

	slot0.rank_more_txt:addTouchLinkListener(slot5, {
		"href"
	})

	slot0.rank_name_list = {}

	for slot5 = 1, 3 do
		if slot0.main_container:getChildByName("rank_name_txt_" .. slot5) then
			uv1(slot0.rank_name_list, slot6)
		end
	end

	if slot0.gold_item_bid and Config.ItemData.data_get_data(slot0.gold_item_bid) then
		loadSpriteTexture(slot0.main_container:getChildByName("item_sp"), PathTool.getItemRes(slot3.icon), LOADTEXT_TYPE)
	end

	slot3 = slot0.main_container:getChildByName("order_list")
	slot4 = slot3:getContentSize()
	slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot3, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot4.width, slot4.height), {
		start_y = 0,
		row = 0,
		start_x = 0,
		space_x = 0,
		item_width = 617,
		item_height = 142,
		space_y = 5,
		col = 1,
		need_dynamic = true
	})

	slot0.item_scrollview:setSwallowTouches(false)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
end

function HolynightBossWindow.createNewCell(slot0)
	return HolynightBossItem.new()
end

function HolynightBossWindow.numberOfCells(slot0)
	if not slot0.show_customs_data then
		return 0
	end

	return #slot0.show_customs_data
end

function HolynightBossWindow.updateCellByIndex(slot0, slot1, slot2)
	if not slot0.show_customs_data then
		return
	end

	slot1.index = slot2

	if not slot0.show_customs_data[slot2] then
		return
	end

	slot1:setData(slot3)
end

function HolynightBossWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickCloseBtn), false, 2)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), true, 2)
	registerButtonEventListener(slot0.chapter_btn, handler(slot0, slot0.onClickChapterBtn), true)
	registerButtonEventListener(slot0.rule_btn, function (slot0, slot1, slot2)
		if Config.MonopolyMapsData.data_const.monopoly_rule_2 then
			TipsManager:getInstance():showCommonTips(slot3.desc, slot1:getTouchBeganPosition())
		end
	end, true)
	slot0:addGlobalEvent(MonopolyEvent.Update_Buff_Data_Event, function ()
		uv0:updateBuffData()
	end)
	slot0:addGlobalEvent(MonopolyEvent.Get_Boss_Data_Event, function (slot0)
		if slot0 and slot0.id == uv0.cur_step_id then
			uv0:setData(slot0)
		end
	end)
	slot0:addGlobalEvent(MonopolyEvent.Get_Guild_Rank_Data_Event, function (slot0)
		if slot0 and slot0.id == uv0.cur_step_id then
			uv0:updateRankData(slot0)
		end
	end)

	if not slot0.role_assets_event and slot0.role_vo then
		slot0.role_assets_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ACTION_ASSETS, function (slot0, slot1)
			if slot0 and slot0 == uv0.gold_item_bid and uv0.role_vo then
				uv0:updateItemNum()
			end
		end)
	end
end

function HolynightBossWindow.onClickChapterBtn(slot0)
	slot1 = slot0.chapter_btn:convertToWorldSpace(cc.p(0, 0))

	if not slot0.all_chapter_data then
		slot0.all_chapter_data = {}

		for slot5, slot6 in pairs(Config.MonopolyMapsData.data_customs) do
			uv0(slot0.all_chapter_data, {
				id = slot6.id,
				value = slot6.name
			})
		end

		table.sort(slot0.all_chapter_data, SortTools.KeyLowerSorter("id"))
	end

	CommonUIController:getInstance():openCommonComboboxPanel(true, slot1, handler(slot0, slot0.onChoseChapterBtn), slot0.all_chapter_data, {
		select_index = slot0.cur_step_id,
		offsetx = -110
	})
end

function HolynightBossWindow.onChoseChapterBtn(slot0, slot1)
	if slot0.all_chapter_data[slot1] then
		slot0.cur_step_id = slot0.all_chapter_data[slot1].id

		uv0:sender27500(slot0.cur_step_id)
		uv0:sender27503(slot0.cur_step_id, 0)
	end
end

function HolynightBossWindow.updateItemNum(slot0)
	slot0.item_num_txt:setString(slot0.role_vo:getActionAssetsNumByBid(slot0.gold_item_bid))
end

function HolynightBossWindow.updateBuffData(slot0)
	slot2 = 0
	slot3 = 0

	for slot7, slot8 in pairs(uv0:getMonopolyBuffData()) do
		if slot8.buff_id == 1 then
			slot2 = slot8.val
		elseif slot8.buff_id == 2 then
			slot3 = slot8.val
		end
	end

	slot0.atk_txt:setString(uv1(TI18N("+%d"), slot2))
	slot0.hp_txt:setString(uv1(TI18N("+%d"), slot3))
end

function HolynightBossWindow.onClickCloseBtn(slot0)
	uv0:openHolynightBossWindow(false)
end

function HolynightBossWindow.openRootWnd(slot0, slot1)
	slot0.cur_step_id = slot1 or 1

	uv0:sender27500(slot0.cur_step_id)
	uv0:sender27504()
	uv0:sender27503(slot0.cur_step_id, 0)
end

function HolynightBossWindow.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	if Config.MonopolyMapsData.data_customs[slot1.id] then
		slot0.chapter_name_txt:setString(slot2.name)
	end

	if Config.MonopolyDungeonsData.data_main_hero[slot1.id] then
		slot0.role_info_title:setString(uv0(TI18N("主题英雄上阵伤害提升%d%%"), slot3.buff_val or 0))

		for slot7, slot8 in pairs(slot0.mian_hero_list) do
			slot8:setVisible(false)
		end

		for slot7, slot8 in ipairs(slot3.main_partner) do
			if not slot0.mian_hero_list[slot7] then
				slot9 = HeroExhibitionItem.new(0.7)

				slot0.main_container:addChild(slot9)

				slot0.mian_hero_list[slot7] = slot9
			end

			slot9:setPosition(cc.p(100 + (slot7 - 1) * 105, 775))
			slot9:setData(Config.PartnerData.data_partner_base[slot8])
			slot9:setVisible(true)
		end
	end

	slot0.probe_txt:setString(TI18N("探索值:") .. slot1.develop)

	slot0.show_customs_data = {}

	if Config.MonopolyDungeonsData.data_boss_info[slot0.cur_step_id] then
		for slot8, slot9 in pairs(slot4) do
			slot10 = deepCopy(slot9)
			slot10.state, slot10.hp, slot10.max_hp = slot0:getBossStateById(slot9.boss_id)

			uv1(slot0.show_customs_data, slot10)
		end
	end

	uv2(slot0.show_customs_data, SortTools.KeyLowerSorter("boss_id"))
	slot0.item_scrollview:reloadData()
	slot0:updateItemNum()
end

function HolynightBossWindow.updateRankData(slot0, slot1)
	if not slot1 then
		return
	end

	for slot6, slot7 in ipairs(slot0.rank_name_list) do
		slot7:setString((function (slot0)
			slot1 = TI18N("暂无")

			for slot5, slot6 in pairs(uv0.guild_stage_rank or {}) do
				if slot6.rank == slot0 then
					slot1 = slot6.name

					break
				end
			end

			return slot1
		end)(slot6))
	end
end

function HolynightBossWindow.getBossStateById(slot0, slot1)
	if not slot0.data then
		return 1
	end

	slot2 = 1
	slot3 = 0
	slot4 = 1

	for slot8, slot9 in pairs(slot0.data.boss_list) do
		if slot9.boss_id == slot1 then
			slot2 = slot9.status
			slot3 = slot9.hp
			slot4 = slot9.max_hp

			break
		end
	end

	return slot2, slot3, slot4
end

function HolynightBossWindow.close_callback(slot0)
	MainuiController:getInstance():resetUIFightType()

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.role_assets_event and slot0.role_vo then
		slot0.role_vo:UnBind(slot0.role_assets_event)

		slot0.role_assets_event = nil
	end

	for slot4, slot5 in pairs(slot0.mian_hero_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	uv0:openHolynightBossWindow(false)
end
