BattlDramafuncWindow = BattlDramafuncWindow or BaseClass(BaseView)
slot0 = BattleDramaController:getInstance()

function BattlDramafuncWindow.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "battledrama/battle_drama_open_func_view"
	slot0.item_list = {}
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_3"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("battleopen", "battleopen"),
			type = ResourcesType.plist
		}
	}
end

function BattlDramafuncWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("root")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.item_container = slot0.main_container:getChildByName("item_container")
	slot0.scroll_view = CommonScrollViewLayout.new(slot0.item_container, nil, , ScrollViewStartPos.top, cc.size(slot0.item_container:getContentSize().width, slot0.item_container:getContentSize().height), {
		start_y = 0,
		start_x = 0,
		space_x = 0,
		row = 0,
		space_y = 0,
		col = 1,
		need_dynamic = true,
		item_class = BattleDramaFuncItem,
		item_width = BattleDramaFuncItem.WIDTH,
		item_height = BattleDramaFuncItem.HEIGHT
	})

	slot0.scroll_view:setPosition(0, 0)

	slot0.back_container = slot0.main_container:getChildByName("back_container")
	slot0.desc_label = slot0.main_container:getChildByName("desc_label")
	slot0.empty_bg = slot0.main_container:getChildByName("empty_bg")

	slot0.empty_bg:setVisible(false)
	loadSpriteTexture(slot0.empty_bg, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_3"), LOADTEXT_TYPE)

	slot0.desc_label = slot0.empty_bg:getChildByName("desc_label")

	slot0.desc_label:setPositionX(slot0.empty_bg:getContentSize().width / 2)
	slot0.desc_label:setString(TI18N("暂无记录"))
end

function BattlDramafuncWindow.register_event(slot0)
	if slot0.background then
		slot0.background:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				uv0:openBattleDramaFuncView(false)
			end
		end)
	end

	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				uv0:openBattleDramaFuncView(false)
			end
		end)
	end
end

function BattlDramafuncWindow.openRootWnd(slot0)
	delayRun(slot0.main_container, 0.1, function ()
		uv0:updateItemReward(Config.DungeonData.data_drama_pre_fun)
	end)
end

function BattlDramafuncWindow.updateItemReward(slot0, slot1)
	if slot1 then
		slot2 = {}

		if BattleDramaController:getInstance():getModel():getDramaData() then
			for slot7, slot8 in ipairs(slot1) do
				slot8.has_open = 0

				if slot8.limit_id <= slot3.max_dun_id then
					slot8.has_open = 1
				end

				table.insert(slot2, slot8)
			end
		end

		table.sort(slot2, SortTools.tableLowerSorter({
			"has_open",
			"id"
		}))
		slot0.empty_bg:setVisible(false)

		if slot2 and next(slot2 or {}) ~= nil then
			slot0.scroll_view:setData(slot2)
		else
			slot0.empty_bg:setVisible(true)
		end
	end
end

function BattlDramafuncWindow.close_callback(slot0)
	if slot0.cur_item then
		slot0.cur_item:DeleteMe()

		slot0.cur_item = nil
	end

	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()

		slot0.scroll_view = nil
	end

	if slot0.item_list and next(slot0.item_list or {}) ~= nil then
		for slot4, slot5 in ipairs(slot0.item_list) do
			if slot5 then
				slot5:DeleteMe()

				slot5 = nil
			end
		end
	end

	slot0.item_list = {}

	uv0:openBattleDramaFuncView(false)
end
