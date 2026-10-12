BattlDramaDropTipsWindow = class("BattlDramaDropTipsWindow", function ()
	return ccui.Widget:create()
end)
slot0 = BattleDramaController:getInstance()
slot1 = BattleDramaController:getInstance():getModel()

function BattlDramaDropTipsWindow.ctor(slot0, slot1)
	slot0.max_dun_id = slot1 or uv0:getDramaData().max_dun_id
	slot0.item_list = {}

	slot0:open_callback()
end

function BattlDramaDropTipsWindow.open_callback(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("battledrama/battle_drama_drop_view"))

	slot0.root_wnd:setPosition(58, 260)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("root")
	slot0.item_scroolview = slot0.main_container:getChildByName("item_scrollview")

	slot0.item_scroolview:setScrollBarEnabled(false)

	slot0.empty_bg = slot0.main_container:getChildByName("empty_bg")

	slot0.empty_bg:setVisible(true)
	loadSpriteTexture(slot0.empty_bg, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_3"), LOADTEXT_TYPE)

	slot0.desc_label = slot0.empty_bg:getChildByName("desc_label")

	slot0.desc_label:setPositionX(slot0.empty_bg:getContentSize().width / 2)
	slot0.desc_label:setString(TI18N("暂无记录"))

	if slot0.max_dun_id and Config.DungeonData.data_drama_dungeon_info(slot0.max_dun_id) and Config.DungeonData.data_drama_dungeon_info(slot0.max_dun_id) then
		slot0:updateItemReward(slot1.hook_show_items)
	end
end

function BattlDramaDropTipsWindow.register_event(slot0)
	if slot0.background then
		slot0.background:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
			end
		end)
	end
end

function BattlDramaDropTipsWindow.updateItemReward(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.empty_bg:setVisible(false)

	slot0.cur_item = BattleDramaDropItem.new()

	slot0.cur_item:setData(true, slot1)
	slot0.cur_item:setPosition(8, 521)
	slot0.main_container:addChild(slot0.cur_item)

	if uv0:getDramaData() and uv0:getShowDescRewad(slot2.max_dun_id) and next(slot3 or {}) ~= nil then
		slot4 = nil
		slot6 = #slot3 * BattleDramaDropItem.HEIGHT * #slot1
		slot11 = cc.size

		slot0.item_scroolview:setInnerContainerSize(slot11(slot0.item_scroolview:getContentSize().width, math.max(slot0.item_scroolview:getContentSize().height, BattleDramaDropItem.HEIGHT * #slot3)))

		for slot11, slot12 in ipairs(slot3) do
			delayRun(slot0.item_scroolview, slot11 / display.DEFAULT_FPS, function ()
				if not uv0.item_list[uv1] then
					uv2 = BattleDramaDropItem.new()

					uv2:setAnchorPoint(0.5, 1)
					uv2:setScale(1)
					uv0.item_scroolview:addChild(uv2)

					uv0.item_list[uv1] = uv2
				end

				uv2 = uv0.item_list[uv1]

				if uv2 then
					uv2:setData(false, uv3)
					uv2:setPosition(uv0.item_scroolview:getContentSize().width / 2 + 1, uv4 - (BattleDramaDropItem.HEIGHT + 5) * (uv1 - 1))
				end
			end)
		end
	end
end

function BattlDramaDropTipsWindow.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function BattlDramaDropTipsWindow.DeleteMe(slot0)
	if slot0.cur_item then
		slot0.cur_item:DeleteMe()

		slot0.cur_item = nil
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
end
