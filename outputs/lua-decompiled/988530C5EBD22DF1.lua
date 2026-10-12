TipsOnlySource = TipsOnlySource or BaseClass(BaseView)
slot0 = BackpackController:getInstance()
slot1 = BackpackController:getInstance():getModel()

function TipsOnlySource.__init(slot0)
	slot0.is_full_screen = false
	slot0.title_str = ""
	slot0.layout_name = "tips/tips_only_source"
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.item_list = {}
end

function TipsOnlySource.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)
	slot0.main_container:getChildByName("title_con"):getChildByName("title_label"):setString(TI18N("获取途径"))

	slot0.scrollCon = slot0.main_container:getChildByName("scrollCon")
	slot0.scroll_size = slot0.scrollCon:getContentSize()
	slot0.scrollView = createScrollView(slot0.scroll_size.width, slot0.scroll_size.height - 3, -6, 2, slot0.scrollCon, ccui.ScrollViewDir.vertical)
	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
end

function TipsOnlySource.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openTipsOnlySource(false)
		end
	end)

	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0:openTipsOnlySource(false)
			end
		end)
	end
end

function TipsOnlySource.openRootWnd(slot0, slot1, slot2, slot3)
	slot0.data = slot1
	slot0.extend_data = slot2
	slot0.need_item_list = slot3

	slot0:createSourceList()
end

function TipsOnlySource.createSourceList(slot0)
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
			if Config.SourceData.data_source_data[slot8[1]] and slot9.evt_type ~= "evt_league_help" then
				table.insert(slot3, slot8)
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

				slot12:setCloseCallBack(function ()
					uv0:openTipsOnlySource(false)
				end)

				slot0.item_list[slot10] = slot12

				slot0.scrollView:addChild(slot12)
				slot12:setData(slot11)
				slot12:setPosition(10, slot4 - 6 - (SourceItem.HEIGHT - 2) * (slot10 - 1))
			end
		end
	end
end

function TipsOnlySource.checIsOpen(slot0, slot1)
	if slot1 then
		slot2 = TRUE
		slot3 = ""

		if slot1[1] and slot1[1] == "dungeon" then
			if BattleDramaController:getInstance():getModel():getDramaData() and slot1[2] then
				if slot1[2] <= slot4.max_dun_id then
					slot2 = FALSE
				end

				if Config.DungeonData.data_drama_dungeon_info(slot5) then
					slot3 = TI18N("通关") .. slot6.name .. TI18N("解锁")
				end
			end
		elseif slot1[1] and slot1[1] == "lev" then
			if RoleController:getInstance():getRoleVo() and slot1[2] then
				if slot1[2] <= slot4.lev then
					slot2 = FALSE
				end

				slot3 = slot5 .. TI18N("级解锁")
			end
		elseif slot1[1] and slot1[1] == "guild" then
			if RoleController:getInstance():getRoleVo() and slot4.gid ~= 0 and slot4.gsrv_id ~= "" then
				if GuildController:getInstance():getModel():getMyGuildInfo() then
					if slot1[2] <= slot5.lev then
						slot2 = FALSE
					else
						slot2 = TRUE
						slot3 = TI18N("公会") .. slot6 .. TI18N("级解锁")
					end
				end
			else
				slot2 = TRUE
				slot3 = TI18N("尚未加入公会")
			end
		end

		return slot2, slot3
	end
end

function TipsOnlySource.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.item_list) do
		if slot5 and slot5.DeleteMe then
			slot5:DeleteMe()
		end
	end

	uv0:openTipsOnlySource(false)
end
