TipsSource = TipsSource or BaseClass(BaseView)
slot0 = BackpackController:getInstance()
slot1 = BackpackController:getInstance():getModel()

function TipsSource.__init(slot0)
	slot0.is_full_screen = false
	slot0.title_str = ""
	slot0.layout_name = "tips/tips_source"
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.item_list = {}
end

function TipsSource.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)
	slot0.main_container:getChildByName("title_con"):getChildByName("title_label"):setString(TI18N("获取途径"))

	slot0.name = slot0.main_container:getChildByName("name")
	slot0.own_label = slot0.main_container:getChildByName("own_label")

	UITool.SetTitleColor(slot0.name)
	slot0.own_label:setTextColor(cc.c3b(25, 162, 51))

	slot0.goods_item = BackPackItem.new()

	slot0.goods_item:setPosition(100, 445)
	slot0.main_container:addChild(slot0.goods_item)

	slot0.desc_scroll = createScrollView(400, 70, 180, 380, slot0.main_container, ccui.ScrollViewDir.vertical)
	slot0.desc = createRichLabel(24, cc.c3b(144, 93, 56), cc.p(0, 1), cc.p(0, slot0.desc_scroll:getContentSize().height), 0, 0, 400)

	slot0.desc_scroll:addChild(slot0.desc)

	slot0.scrollCon = slot0.main_container:getChildByName("scrollCon")
	slot0.scroll_size = slot0.scrollCon:getContentSize()
	slot0.scrollView = createScrollView(slot0.scroll_size.width, slot0.scroll_size.height - 3, -6, 2, slot0.scrollCon, ccui.ScrollViewDir.vertical)
	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
end

function TipsSource.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openTipsSource(false)
		end
	end)

	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0:openTipsSource(false)
			end
		end)
	end
end

function TipsSource.openRootWnd(slot0, slot1, slot2, slot3)
	slot0.data = slot1
	slot0.extend_data = slot2
	slot0.need_item_list = slot3

	slot0:setData()
	slot0:createSourceList()
end

function TipsSource.setData(slot0)
	slot0.goods_item:setData(slot0.data)

	slot1 = nil

	if not ((not slot0.data.config or slot0.data.config) and slot0.data) then
		return
	end

	slot0.name:setTextColor(BackPackConst.quality_color[slot1.quality or 0])
	slot0.name:setString(slot1.name)

	slot4 = slot0.data.base_id or slot0.data.id
	slot5 = uv0:getBackPackItemNumByBid(slot4)

	if CommonGoodsType.isAsset(slot4) == true then
		slot5 = RoleController:getInstance():getRoleVo()[Config.ItemData.data_assets_id2label[slot4] or ""] or 0
	end

	slot0.own_label:setString(string.format(TI18N("拥有%s个"), slot5))
	slot0.desc:setString(slot1.desc)

	slot6 = math.max(slot0.desc:getContentSize().height, slot0.desc_scroll:getContentSize().height)

	slot0.desc_scroll:setInnerContainerSize(cc.size(slot0.desc_scroll:getContentSize().width, slot6))
	slot0.desc:setPositionY(slot6)
end

function TipsSource.createSourceList(slot0)
	if slot0.data == nil then
		return
	end

	slot1 = nil

	if not ((not slot0.data.config or slot0.data.config) and slot0.data) then
		return
	end

	if slot1.source and next(slot2) ~= nil then
		slot3 = {}

		for slot7, slot8 in pairs(slot2) do
			if Config.SourceData.data_source_data[slot8[1]].evt_type ~= "evt_league_help" then
				if slot9.evt_type == "evt_festival_feather" then
					if ActionController:getInstance():getActionSubTabVo(ActionRankCommonType.recruit_luxury) then
						table.insert(slot3, slot8)
					end
				elseif slot9.evt_type == "evt_summon_feather" then
					if ActionController:getInstance():getActionSubTabVo(ActionRankCommonType.summon_luxury) then
						table.insert(slot3, slot8)
					end
				else
					table.insert(slot3, slot8)
				end
			elseif slot0.extend_data and next(slot0.extend_data) ~= nil and slot0.extend_data[1] == "evt_league_help" and slot0.extend_data[2] then
				table.insert(slot3, slot8)
			end
		end

		slot10 = slot0.scroll_size.width

		slot0.scrollView:setInnerContainerSize(cc.size(slot10, math.max(slot0.scroll_size.height, SourceItem.HEIGHT * #slot3)))

		slot5 = {}

		for slot9, slot10 in pairs(slot3) do
			slot11 = Config.SourceData.data_source_data[slot10[1]]
			slot10.is_lock, slot10.str = slot0:checIsOpen(slot11.lev_limit)
			slot10.id = slot11.id
			slot10.infon_data = slot11

			table.insert(slot5, slot10)
		end

		table.sort(slot5, SortTools.tableLowerSorter({
			"is_lock"
		}))

		if slot5 and next(slot5 or {}) ~= nil then
			for slot10, slot11 in ipairs(slot5) do
				slot12 = SourceItem.new(slot1.id, slot0.need_item_list)
				slot0.item_list[slot10] = slot12

				slot0.scrollView:addChild(slot12)
				slot12:setData(slot11)
				slot12:setPosition(10, slot4 - 6 - (SourceItem.HEIGHT + 1) * (slot10 - 1))
			end
		end
	end
end

function TipsSource.checIsOpen(slot0, slot1)
	if slot1 then
		slot2 = TRUE
		slot3 = ""

		if slot1[1] then
			-- Nothing
		end

		if slot1[3] then
			slot4[2] = {
				slot1[3],
				slot1[4]
			}
		end

		for slot8, slot9 in ipairs({
			{
				slot1[1],
				slot1[2]
			}
		}) do
			slot11 = slot9[2]

			if slot2 == TRUE and slot9[1] == "dungeon" then
				if BattleDramaController:getInstance():getModel():getDramaData() and slot11 then
					if slot11 <= slot12.max_dun_id then
						slot2 = FALSE
					end

					if Config.DungeonData.data_drama_dungeon_info(slot13) then
						slot3 = TI18N("通关") .. slot14.name .. TI18N("解锁")
					end
				end
			elseif slot2 == TRUE and slot10 == "lev" then
				if RoleController:getInstance():getRoleVo() and slot11 then
					if slot11 <= slot12.lev then
						slot2 = FALSE
					end

					slot3 = slot13 .. TI18N("级解锁")
				end
			elseif slot2 == TRUE and slot10 == "world_lev" then
				if RoleController:getInstance():getModel():getWorldLev() and slot11 then
					if slot11 <= slot12 then
						slot2 = FALSE
					end

					slot3 = TI18N("世界等级") .. slot11 .. TI18N("级解锁")
				end
			elseif slot2 == TRUE and slot10 == "guild" then
				if RoleController:getInstance():getRoleVo() and slot12.gid ~= 0 and slot12.gsrv_id ~= "" then
					if GuildController:getInstance():getModel():getMyGuildInfo() then
						if slot11 <= slot13.lev then
							slot2 = FALSE
						else
							slot2 = TRUE
							slot3 = TI18N("公会") .. slot14 .. TI18N("级解锁")
						end
					end
				else
					slot2 = TRUE
					slot3 = TI18N("尚未加入公会")
				end
			end
		end

		return slot2, slot3
	end
end

function TipsSource.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.item_list) do
		if slot5 and slot5.DeleteMe then
			slot5:DeleteMe()
		end
	end

	if slot0.goods_item then
		slot0.goods_item:DeleteMe()
	end

	slot0.goods_item = nil

	uv0:openTipsSource(false)
end
