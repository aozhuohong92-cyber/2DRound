ElfinEggSyntheticPanel = ElfinEggSyntheticPanel or BaseClass(BaseView)
slot1 = ElfinController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format

function ElfinEggSyntheticPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = false
	slot0.layout_name = "elfin/elfin_egg_synthetic_panel"
	slot0.cur_selected_sum = 1
	slot0.max_num = 1
	slot0.have_egg_num = 0
	slot0.need_egg_num = 0
	slot0.need_cost_num = 0
	slot0.cost_name = ""
	slot0.egg_name_1 = ""
	slot0.egg_name_2 = ""
	slot0.res_list = {}
end

function ElfinEggSyntheticPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.title = slot0.main_container:getChildByName("win_title")

	slot0.title:setString(TI18N("合成"))

	slot0.Text_2 = slot0.main_container:getChildByName("Text_2")

	slot0.Text_2:setString(TI18N("消耗："))

	slot0.left_btn = slot0.main_container:getChildByName("left_btn")

	slot0.left_btn:getChildByName("label"):setString(TI18N("取 消"))

	slot0.right_btn = slot0.main_container:getChildByName("right_btn")
	slot0.right_btn_lab = slot0.right_btn:getChildByName("label")

	slot0.right_btn_lab:setString(TI18N("确认消耗"))

	slot0.tips_lab = slot0.main_container:getChildByName("tips_lab")
	slot0.icon_img = slot0.main_container:getChildByName("icon_img")
	slot0.con_num = slot0.main_container:getChildByName("con_num")
	slot0.left_item_1 = BackPackItem.new(true, true, nil, nil, nil, true)

	slot0.left_item_1:setAnchorPoint(0.5, 0.5)
	slot0.left_item_1:setPosition(slot0.main_container:getContentSize().width / 2 - 160, 302)
	slot0.main_container:addChild(slot0.left_item_1)

	slot0.right_item_1 = BackPackItem.new(true, true, nil, nil, nil, true)

	slot0.right_item_1:setAnchorPoint(0.5, 0.5)
	slot0.right_item_1:setPosition(slot0.main_container:getContentSize().width / 2 + 170, 302)
	slot0.main_container:addChild(slot0.right_item_1)

	slot0.container = slot0.main_container:getChildByName("container")
	slot0.container_y = slot0.container:getPositionY()
	slot0.sub_btn = slot0.container:getChildByName("sub_btn")
	slot0.add_btn = slot0.container:getChildByName("add_btn")
	slot0.max_btn = slot0.container:getChildByName("max_btn")
	slot0.slider = slot0.container:getChildByName("slider")

	slot0.slider:setBarPercent(20, 80)

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
end

function ElfinEggSyntheticPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0._onClickBtnClose), false, 1)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0._onClickBtnClose), true, 1)
	registerButtonEventListener(slot0.left_btn, handler(slot0, slot0._onClickBtnClose), true, 2)
	registerButtonEventListener(slot0.right_btn, handler(slot0, slot0._onClickBtnRight), true, 2)

	if slot0.slider ~= nil then
		slot0.slider:addEventListener(function (slot0, slot1)
			if slot1 == ccui.SliderEventType.percentChanged then
				uv0:setCurUseItemInfoByPercent(uv0.slider:getPercent())
			end
		end)
	end

	slot0.sub_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			if uv0.slider:getPercent() == 0 then
				return
			end

			if uv0.cur_selected_sum == 0 then
				return
			end

			uv0.cur_selected_sum = uv0.cur_selected_sum - 1

			uv0:setCurUseItemInfoByNum(uv0.cur_selected_sum)
		end
	end)
	slot0.add_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			if uv0.slider:getPercent() == 100 then
				return
			end

			if uv0.max_num <= uv0.cur_selected_sum then
				return
			end

			uv0.cur_selected_sum = uv0.cur_selected_sum + 1

			uv0:setCurUseItemInfoByNum(uv0.cur_selected_sum)
		end
	end)
	slot0.max_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			if uv0.slider:getPercent() == 100 then
				return
			end

			if uv0.max_num <= uv0.cur_selected_sum then
				return
			end

			uv0.cur_selected_sum = uv0.max_num

			uv0:setCurUseItemInfoByNum(uv0.cur_selected_sum)
		end
	end)
end

function ElfinEggSyntheticPanel._onClickBtnClose(slot0)
	uv0:openElfinEggSyntheticPanel(false)
end

function ElfinEggSyntheticPanel._onClickBtnRight(slot0)
	if slot0.elfin_bid then
		uv0:sender26508(slot0.elfin_bid, slot0.cur_selected_sum, 0)
	end
end

function ElfinEggSyntheticPanel.openRootWnd(slot0, slot1)
	slot0.elfin_bid = slot1

	slot0:setData()
end

function ElfinEggSyntheticPanel.setCurUseItemInfoByPercent(slot0, slot1)
	slot0.cur_selected_sum = math.max(1, math.floor(slot1 * slot0.max_num * 0.01))

	slot0:setUseInfo(slot0.cur_selected_sum)
end

function ElfinEggSyntheticPanel.setCurUseItemInfoByNum(slot0, slot1)
	slot0.cur_selected_sum = math.max(1, slot1)

	slot0.slider:setPercent((slot0.cur_selected_sum - 1) / math.max(1, slot0.max_num - 1) * 100)
	slot0:setUseInfo(slot0.cur_selected_sum)
end

function ElfinEggSyntheticPanel.setUseInfo(slot0, slot1)
	slot1 = math.min(slot0.max_num, slot1)

	slot0.left_item_1:setNeedNum(slot1 * slot0.need_egg_num, slot0.have_egg_num)
	slot0.right_item_1:setNum(slot1)

	slot2 = slot1 * slot0.need_cost_num
	slot3 = "" .. slot2

	if slot2 >= 10000 then
		slot3 = math.floor(slot2 / 10000) .. TI18N("万")
	end

	slot0.con_num:setString(slot3)
	slot0.tips_lab:setString(uv0(TI18N("是否确认消耗%s，使用 %s*%d\n合成 %s*%d"), slot0.cost_name, slot0.egg_name_1, slot1 * slot0.need_egg_num, slot0.egg_name_2, slot1))
end

function ElfinEggSyntheticPanel.setData(slot0)
	if not slot0.elfin_bid then
		return
	end

	if not Config.SpriteData.data_elfin_com[slot0.elfin_bid] then
		return
	end

	slot2 = 0
	slot3 = 0

	for slot7, slot8 in ipairs(slot1.expend) do
		if Config.ItemData.data_get_data(slot8[1]) then
			if slot7 == 1 then
				slot0.egg_name_1 = slot11.name
				slot0.need_egg_num = slot8[2] + 1
				slot0.have_egg_num = BackpackController:getInstance():getModel():getItemNumByBid(slot9)
				slot12 = {}

				slot0.left_item_1:setData(deepCopy(slot11))
			else
				slot0.cost_name = slot11.name
				slot0.need_cost_num = slot10
				slot3 = BackpackController:getInstance():getModel():getItemNumByBid(slot9)

				loadSpriteTexture(slot0.icon_img, PathTool.getItemRes(slot11.icon), LOADTEXT_TYPE)
			end
		end
	end

	if Config.ItemData.data_get_data(slot1.award) then
		slot6 = {}

		if deepCopy(slot5) then
			slot0.egg_name_2 = slot6.name
		end

		slot0.right_item_1:setData(slot6)
	end

	if math.min(math.floor(slot2 / slot0.need_egg_num), math.floor(slot3 / slot0.need_cost_num)) > 0 then
		slot0.max_num = math.min(slot2, slot3)
	end

	slot0:setCurUseItemInfoByNum(slot0.max_num)
end

function ElfinEggSyntheticPanel.close_callback(slot0)
	if slot0.left_item_1 then
		slot0.left_item_1:DeleteMe()
	end

	slot0.left_item_1 = nil

	if slot0.right_item_1 then
		slot0.right_item_1:DeleteMe()
	end

	slot0.right_item_1 = nil

	uv0:openElfinEggSyntheticPanel(false)
end
