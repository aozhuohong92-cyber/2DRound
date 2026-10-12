slot1 = HomeworldController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format
HomeworldSuitWindow = HomeworldSuitWindow or BaseClass(BaseView)

function HomeworldSuitWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "homeworld/homeworld_suit_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("homeworld", "homeworld"),
			type = ResourcesType.plist
		}
	}
	slot0.award_list = {}
end

function HomeworldSuitWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1

	slot0:playEnterAnimatianByObj(slot1, 1)
	slot1:getChildByName("win_title"):setString(TI18N("主题一览"))
	slot1:getChildByName("tips_label"):setString(TI18N("收集进度达到一定阶段时能获得奖励，努力收集家具吧！"))
	slot1:getChildByName("tips_label_2"):setString(TI18N("该主题包含以下装饰"))
	slot1:getChildByName("tips_label_3"):setString(TI18N("收集进度:"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.preview_btn = slot1:getChildByName("preview_btn")
	slot2 = slot1:getChildByName("progress_bg")
	slot0.progress = slot2:getChildByName("progress")

	slot0.progress:setScale9Enabled(true)
	slot0.progress:setPercent(0)

	slot0.progress_txt = slot2:getChildByName("progress_txt")
	slot0.name_label = slot1:getChildByName("name_label")
	slot0.num_label = slot1:getChildByName("num_label")
	slot3 = slot1:getChildByName("list_panel")
	slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot3, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot3:getContentSize(), {
		start_y = 0,
		row = 0,
		start_x = 3,
		space_x = 7,
		item_width = 194,
		item_height = 260,
		space_y = 7,
		col = 3,
		need_dynamic = true
	})

	slot0.item_scrollview:setSwallowTouches(false)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)

	slot0.image_bg = createSprite(PathTool.getResFrame("common", "common_1005"), 105, 778, slot0.main_container, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)
end

function HomeworldSuitWindow._createNewCell(slot0)
	return HomeworldSuitItem.new()
end

function HomeworldSuitWindow._numberOfCells(slot0)
	if not slot0.suit_data then
		return 0
	end

	return #slot0.suit_data
end

function HomeworldSuitWindow._updateCellByIndex(slot0, slot1, slot2)
	if not slot0.suit_data then
		return
	end

	slot1.index = slot2

	if not slot0.suit_data[slot2] then
		return
	end

	slot1:setData(slot3)
end

function HomeworldSuitWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openHomeworldSuitWindow(false)
	end, false, 2)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openHomeworldSuitWindow(false)
	end, true, 2)
	registerButtonEventListener(slot0.preview_btn, function ()
		uv0:onClickPreviewBtn()
	end, true)
	slot0:addGlobalEvent(HomeworldEvent.Get_Suit_Award_Data_Event, function ()
		uv0:updateSuitAwardInfo()
	end)
end

function HomeworldSuitWindow.onClickPreviewBtn(slot0)
	if not slot0.suit_cfg then
		return
	end

	for slot5, slot6 in pairs(slot0.suit_cfg.preview or {}) do
		slot8 = slot6[2]
		slot9 = slot6[3]

		if slot6[1] and slot8 then
			if slot8 == 99 then
				-- Nothing
			elseif slot8 == 98 then
				slot1.land_bid = slot7
			else
				slot1.unit_list = slot1.unit_list or {}

				uv0(slot1.unit_list, {
					bid = slot7,
					dir = slot8,
					index = slot9 or 0
				})
			end
		end
	end

	if next({
		wall_bid = slot7
	}) ~= nil then
		if slot0.suit_cfg then
			slot1.homename = slot0.suit_cfg.name .. TI18N("预览")
		end

		uv1:enterPreviewState(slot1)
		slot0:showSelfWindow(false)
	else
		message(TI18N("暂无预览"))
	end
end

function HomeworldSuitWindow.openRootWnd(slot0, slot1)
	slot0.suit_cfg = Config.HomeData.data_suit[slot1]

	if not slot0.suit_cfg then
		return
	end

	uv0:sender26013()
	slot0:updateSuitBaseInfo()

	slot0.suit_data = {}

	if Config.HomeData.data_suit_unit[slot1] then
		for slot6, slot7 in pairs(slot2) do
			uv1(slot0.suit_data, Config.HomeData.data_home_unit(slot7))
		end
	end

	table.sort(slot0.suit_data, SortTools.KeyLowerSorter("bid"))
	slot0.item_scrollview:reloadData()
end

function HomeworldSuitWindow.updateSuitBaseInfo(slot0)
	if not slot0.suit_cfg then
		return
	end

	slot0.name_label:setString(slot0.suit_cfg.name)
	slot0.num_label:setString(uv0(TI18N("共:%d"), slot0.suit_cfg.comfort))

	if not slot0.suit_icon then
		slot0.suit_icon = createSprite(nil, 105, 778, slot0.main_container, cc.p(0.5, 0.5), LOADTEXT_TYPE)
	end

	if not slot0.cur_res_id or slot0.cur_res_id ~= slot0.suit_cfg.res_id then
		slot0.cur_res_id = slot0.suit_cfg.res_id
		slot0.icon_load = loadSpriteTextureFromCDN(slot0.suit_icon, PathTool.getSuitIconRes(slot0.suit_cfg.res_id), ResourcesType.single, slot0.icon_load)
	end

	if not slot0.desc_txt then
		slot0.desc_txt = createRichLabel(20, cc.c4b(120, 80, 70, 255), cc.p(0, 0.5), cc.p(185, 785), 5, nil, 380)

		slot0.main_container:addChild(slot0.desc_txt)
	end

	slot0.desc_txt:setString(slot0.suit_cfg.desc)
end

function HomeworldSuitWindow.updateSuitAwardInfo(slot0)
	if not slot0.suit_cfg then
		return
	end

	slot2 = slot0.suit_cfg.num
	slot3 = 0

	if uv0:getHomeSuitAwardDataById(slot0.suit_cfg.set_id) and slot1.collect then
		slot3 = tableLen(slot1.collect)
	end

	slot0.progress_txt:setString(slot3 .. "/" .. slot2)
	slot0.progress:setPercent(slot3 / slot2 * 100)

	function slot4(slot0)
		slot1 = false

		if uv0 and uv0.reward then
			for slot5, slot6 in pairs(uv0.reward) do
				if slot6.id == slot0 then
					slot1 = true

					break
				end
			end
		end

		return slot1
	end

	if Config.HomeData.data_suit_award[slot0.suit_cfg.set_id] then
		slot6 = {}

		for slot11, slot12 in pairs(slot5) do
			if 0 < slot12.num then
				slot7 = slot12.num
			end

			uv1(slot6, slot12)
		end

		slot11 = SortTools.KeyLowerSorter

		table.sort(slot6, slot11("id"))

		for slot11, slot12 in pairs(slot0.award_list) do
			slot12:setVisible(false)
		end

		slot8 = 148

		for slot12, slot13 in ipairs(slot6) do
			if not slot0.award_list[slot12] then
				slot14 = HomeworldSuitAward.new()

				slot0.main_container:addChild(slot14)

				slot0.award_list[slot12] = slot14
			end

			slot14:setData(slot13, slot4(slot13.id), slot3)
			slot14:setPosition(cc.p(slot8 + slot13.num / slot7 * 485, 125))
			slot14:setVisible(true)
		end
	end
end

function HomeworldSuitWindow.showSelfWindow(slot0, slot1)
	slot0.root_wnd:setVisible(slot1)
end

function HomeworldSuitWindow.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.icon_load then
		slot0.icon_load:DeleteMe()

		slot0.icon_load = nil
	end

	for slot4, slot5 in pairs(slot0.award_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	uv0:openHomeworldSuitWindow(false)
end

HomeworldSuitItem = class("HomeworldSuitItem", function ()
	return ccui.Widget:create()
end)

function HomeworldSuitItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function HomeworldSuitItem.configUI(slot0)
	slot0.size = cc.size(194, 260)

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("homeworld/homeworld_suit_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0.container:setSwallowTouches(false)

	slot0.name_txt = slot0.container:getChildByName("name_txt")
	slot0.image_tips = slot0.container:getChildByName("image_tips")

	slot0.image_tips:getChildByName("label"):setString(TI18N("未收集"))

	slot0.num_txt = slot0.container:getChildByName("num_txt")

	slot0.container:getChildByName("detail_txt"):setString(TI18N("详情"))

	slot0.sp_icon = slot0.container:getChildByName("sp_icon")

	slot0.sp_icon:setScale(0.75)
end

function HomeworldSuitItem.register_event(slot0)
	registerButtonEventListener(slot0.container, function ()
		if uv0.data then
			uv1:openFurnitureInfoWindow(true, uv0.data.bid)
		end
	end, true, 1, nil, , , true)
end

function HomeworldSuitItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0.name_txt:setString(slot1.name)

	if Config.ItemData.data_get_data(slot1.bid) then
		slot0.name_txt:setTextColor(BackPackConst.getBlackQualityColorC4B(slot2.quality))
	end

	if not slot0.confort_txt then
		slot0.confort_txt = createRichLabel(20, cc.c4b(134, 79, 53), cc.p(0.5, 0.5), cc.p(slot0.size.width * 0.5, 205))

		slot0.container:addChild(slot0.confort_txt)
	end

	slot0.confort_txt:setString(uv0(TI18N("舒适度<div fontcolor=157e22>+%d</div>"), slot1.soft))

	if slot0.data.icon and (not slot0.cur_res_icon or slot0.cur_res_icon ~= slot0.data.icon) then
		slot0.cur_res_icon = slot0.data.icon

		loadSpriteTexture(slot0.sp_icon, PathTool.getFurnitureNormalRes(slot0.data.icon), LOADTEXT_TYPE)
	end

	slot3 = uv1:getFurnitureAllNumByBid(slot1.bid)

	slot0.num_txt:setString(uv0(TI18N("拥有:%d"), slot3))

	if slot3 > 0 then
		slot0.image_tips:setVisible(false)
	else
		slot0.image_tips:setVisible(true)
	end
end

function HomeworldSuitItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end

HomeworldSuitAward = class("HomeworldSuitAward", function ()
	return ccui.Widget:create()
end)

function HomeworldSuitAward.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function HomeworldSuitAward.configUI(slot0)
	slot0.size = cc.size(54, 64)

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = ccui.Layout:create()

	slot0.root_wnd:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.root_wnd:setPosition(cc.p(slot0.size.width * 0.5, slot0.size.height * 0.5))
	slot0.root_wnd:setTouchEnabled(true)
	slot0:addChild(slot0.root_wnd)

	slot0.image_bg = createImage(slot0.root_wnd, PathTool.getResFrame("homeworld", "homeworld_1053"), slot0.size.width * 0.5, slot0.size.height * 0.5, cc.p(0.5, 0.5), true, nil, true)

	slot0.image_bg:setCapInsets(cc.rect(20, 15, 1, 1))
	slot0.image_bg:setContentSize(slot0.size)

	if not slot0.update_red_status_event then
		slot0.update_red_status_event = GlobalEvent:getInstance():Bind(HomeworldEvent.Update_Red_Status_Data, function (slot0, slot1)
			if slot0 == HomeworldConst.Red_Index.Suit then
				uv0:updateSuitAwardRedStatus()
			end
		end)
	end
end

function HomeworldSuitAward.register_event(slot0)
	registerButtonEventListener(slot0.root_wnd, function ()
		if uv0.data and uv0.cur_num then
			if uv0.data.num <= uv0.cur_num then
				if uv0.is_get then
					message(TI18N("已经领取过奖励啦"))
				else
					uv1:sender26014(uv0.data.id)
				end
			else
				message(TI18N("未达到领取条件"))
			end
		end
	end, true)
end

function HomeworldSuitAward.setData(slot0, slot1, slot2, slot3)
	if not slot1 then
		return
	end

	slot0.data = slot1
	slot0.is_get = slot2 or false
	slot0.cur_num = slot3 or 0

	if slot1.reward and slot1.reward[1] then
		slot5 = slot1.reward[1][2]

		if Config.ItemData.data_get_data(slot1.reward[1][1]) then
			if not slot0.award_icon then
				slot0.award_icon = createSprite(PathTool.getItemRes(slot6.icon), slot0.size.width * 0.5, slot0.size.height * 0.5 + 7, slot0.root_wnd, cc.p(0.5, 0.5), LOADTEXT_TYPE)

				slot0.award_icon:setScale(0.4)
			end

			if not slot0.award_num then
				slot0.award_num = createLabel(16, 1, 2, slot0.size.width - 6, 12, slot5, slot0.root_wnd, 2, cc.p(1, 0))
			end
		end
	end

	if slot2 == true then
		if not slot0.get_icon then
			slot0.get_icon = createSprite(PathTool.getResFrame("homeworld", "txt_cn_homeworld_2"), 22, 55, slot0.root_wnd, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)
		end

		slot0.get_icon:setVisible(true)
	elseif slot0.get_icon then
		slot0.get_icon:setVisible(false)
	end

	slot0:updateSuitAwardRedStatus()
end

function HomeworldSuitAward.updateSuitAwardRedStatus(slot0)
	if slot0.data and slot0.data.set_id and slot0.data.id then
		addRedPointToNodeByStatus(slot0.root_wnd, uv0:checkSuitAwardRedStatus(slot0.data.set_id, slot0.data.id), 7, 7)
	end
end

function HomeworldSuitAward.DeleteMe(slot0)
	if slot0.update_red_status_event then
		GlobalEvent:getInstance():UnBind(slot0.update_red_status_event)

		slot0.update_red_status_event = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
