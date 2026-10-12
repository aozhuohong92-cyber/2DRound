CrossgroundMainWindow = CrossgroundMainWindow or BaseClass(BaseView)
slot0 = CrossgroundController:getInstance()
slot1 = CrossgroundController:getInstance():getModel()
slot2 = table.sort

function CrossgroundMainWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Full
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("crossground", "crossground"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_82", true),
			type = ResourcesType.single
		}
	}
	slot0.layout_name = "crossground/crossground_main"
end

function CrossgroundMainWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_82", true), LOADTEXT_TYPE)
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_panel")
	slot2 = slot1:getChildByName("title_sp")

	slot2:setPositionY(slot2:getPositionY() + 15)
	slot0:playEnterAnimatianByObj(slot1, 1)

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.cross_btn = slot1:getChildByName("cross_btn")
	slot3 = slot1:getChildByName("scroll_list")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot3, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot3:getContentSize(), {
		start_y = 0,
		item_width = 687,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 214,
		space_y = 10,
		col = 1,
		need_dynamic = true,
		item_class = CrossgroundItem
	})

	slot0.item_scrollview:setSwallowTouches(false)
end

function CrossgroundMainWindow.openRootWnd(slot0)
	slot0:setData()
end

function CrossgroundMainWindow.setData(slot0)
	if Config.CrossGroundData.data_base then
		slot2 = {}

		for slot7, slot8 in pairs(slot1) do
			table.insert(slot2, {
				data = slot8,
				index = slot7
			})
		end

		uv0(slot2, function (slot0, slot1)
			return slot0.index < slot1.index
		end)
		slot0.item_scrollview:setData(slot2)
	end
end

function CrossgroundMainWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openCrossGroundMainWindow(false)
	end, false, 2)
	registerButtonEventListener(slot0.cross_btn, function ()
		CrossshowController:getInstance():openCrossshowMainWindow(true)
	end, false, 1)
	slot0:addGlobalEvent(LadderEvent.UpdateLadderRedStatus, function ()
		uv0:updateItemListRedStatus()
	end)
	slot0:addGlobalEvent(CrossarenaEvent.Update_Red_Status_Event, function ()
		uv0:updateItemListRedStatus()
	end)
	slot0:addGlobalEvent(CrosschampionEvent.Update_Red_Status_Event, function ()
		uv0:updateItemListRedStatus()
	end)
	slot0:addGlobalEvent(ArenateamEvent.ARENATEAM_ALL_RED_POINT_EVENT, function ()
		uv0:updateItemListRedStatus()
	end)
	slot0:addGlobalEvent(ArenapeakchampionEvent.ARENAPEAKCHAMPION_MAIN_EVENT, function ()
		if not uv0.item_scrollview then
			return
		end

		if uv0.item_scrollview:getItemList() then
			for slot4, slot5 in pairs(slot0) do
				if slot5.item_obj_list and slot5.item_obj_list[2] and slot5.item_obj_list[2].data and slot5.item_obj_list[2].data.id == 1006 then
					slot5:updateArenaPeakInfo(slot5.item_obj_list[2], slot5.item_obj_list[2].data)
				end
			end
		end
	end)
	slot0:addGlobalEvent(ArenapeakchampionEvent.ARENAPEAKCHAMPION_ALL_RED_POINT_EVENT, function ()
		uv0:updateItemListRedStatus()
	end)
end

function CrossgroundMainWindow.updateItemListRedStatus(slot0)
	if not slot0.item_scrollview then
		return
	end

	if slot0.item_scrollview:getItemList() then
		for slot5, slot6 in pairs(slot1) do
			slot6:updateRedStatus()
		end
	end
end

function CrossgroundMainWindow.close_callback(slot0)
	ArenapeakchampionController:getInstance().is_send_27700 = nil

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	uv0:openCrossGroundMainWindow(false)
end
