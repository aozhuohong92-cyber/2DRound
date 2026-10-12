slot1 = HomeworldController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format
HomeworldInfoWindow = HomeworldInfoWindow or BaseClass(BaseView)

function HomeworldInfoWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "homeworld/homeworld_info_window"
end

function HomeworldInfoWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)
	slot1:getChildByName("win_title"):setString(uv0:getMyHomeCurStoreyIndex() .. TI18N("楼详情"))
	slot1:getChildByName("title_label_1"):setString(TI18N("概况总览"))
	slot1:getChildByName("title_label_2"):setString(TI18N("舒适度基础加成"))
	slot1:getChildByName("title_label_3"):setString(TI18N("家具主题加成"))
	slot1:getChildByName("title_txt_1"):setString(TI18N("家具名"))
	slot1:getChildByName("title_txt_2"):setString(TI18N("舒适度加成值"))
	slot1:getChildByName("title_txt_3"):setString(TI18N("套装名"))
	slot1:getChildByName("title_txt_4"):setString(TI18N("套件数量"))
	slot1:getChildByName("title_txt_5"):setString(TI18N("舒适度加成值"))
	slot1:getChildByName("tips_label"):setString(TI18N("多个相同的家具存在于房间时，对应的套件数量只会激活1个"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.btn_rule = slot1:getChildByName("btn_rule")
	slot0.soft_label = slot1:getChildByName("soft_label")
	slot0.homecoin_label = slot1:getChildByName("homecoin_label")
	slot0.worship_label = slot1:getChildByName("worship_label")
	slot0.base_total_txt = slot1:getChildByName("base_total_txt")
	slot0.suit_total_txt = slot1:getChildByName("suit_total_txt")
	slot3 = slot1:getChildByName("base_list_panel")
	slot0.base_scrollview = CommonScrollViewLayout.new(slot3, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot3:getContentSize(), {
		start_y = 0,
		item_width = 602,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 30,
		space_y = 5,
		col = 1,
		need_dynamic = true,
		item_class = HomeworldInfoBaseItem
	})

	slot0.base_scrollview:setSwallowTouches(false)

	slot6 = slot1:getChildByName("suit_list_panel")
	slot0.suit_scrollview = CommonScrollViewLayout.new(slot6, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot6:getContentSize(), {
		start_y = 0,
		item_width = 602,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 30,
		space_y = 5,
		col = 1,
		need_dynamic = true,
		item_class = HomeworldInfoSuitItem
	})

	slot0.suit_scrollview:setSwallowTouches(false)
end

function HomeworldInfoWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openHomeInfoWindow(false)
	end, true, 2)
	registerButtonEventListener(slot0.background, function ()
		uv0:openHomeInfoWindow(false)
	end, false, 2)
	registerButtonEventListener(slot0.btn_rule, function (slot0, slot1, slot2)
		if Config.HomeData.data_const.home_value_rule then
			TipsManager:getInstance():showCommonTips(slot3.desc, slot1:getTouchBeganPosition(), nil, , 550)
		end
	end, true, 1)
end

function HomeworldInfoWindow.openRootWnd(slot0)
	slot0:setData()
end

function HomeworldInfoWindow.setData(slot0)
	slot0.soft_label:setString(uv1(TI18N("舒适度 %d"), uv0:getHomeComfortValue()))

	slot2, slot3 = uv0:getMyHomeCurStoreyIndex()

	if slot2 == slot3 then
		slot0.homecoin_label:setString(uv1(TI18N("家园币 +%d/时"), uv0:getHomeCoinOutput()))
	else
		slot0.homecoin_label:setString(TI18N("本层非家园币收入楼层"))
	end

	slot0.worship_label:setString(uv1(TI18N("被赞数 %d"), uv0:getHomeWorship()))

	slot6 = {}

	if Config.HomeData.data_home_unit(uv0:getMyHomeWallId()) then
		uv2({}, {
			bid = slot9.bid,
			num = 1,
			cfg = deepCopy(slot9)
		})
		function (slot0)
			if slot0.set_id and slot0.set_id > 0 then
				slot1 = false

				for slot5, slot6 in pairs(uv0) do
					if slot0.set_id == slot6.set_id then
						slot1 = true
						slot7 = true

						for slot11, slot12 in pairs(slot6.item_list) do
							if slot0.bid == slot12 then
								slot7 = false

								break
							end
						end

						if slot7 then
							slot6.num = slot6.num + 1

							uv1(slot6.item_list, slot0.bid)
						end

						break
					end
				end

				if not slot1 then
					slot2 = {
						set_id = slot0.set_id,
						num = 1,
						cfg = Config.HomeData.data_suit_soft[slot0.set_id],
						item_list = {}
					}

					uv1(slot2.item_list, slot0.bid)
					uv1(uv0, slot2)
				end
			end
		end(slot9)
	end

	if Config.HomeData.data_home_unit(uv0:getMyHomeFloorId()) then
		uv2(slot5, {
			bid = slot11.bid,
			num = 1,
			cfg = deepCopy(slot11)
		})
		slot7(slot11)
	end

	for slot16, slot17 in pairs(uv0:getMyHomeFurnitureData()) do
		if Config.HomeData.data_home_unit(slot17.bid) then
			slot19 = false

			for slot23, slot24 in pairs(slot5) do
				if slot24.bid == slot18.bid then
					slot19 = true
					slot24.num = slot24.num + 1

					break
				end
			end

			if not slot19 then
				uv2(slot5, {
					bid = slot18.bid,
					num = 1,
					cfg = deepCopy(slot18)
				})
			end

			slot7(slot18)
		end
	end

	for slot17, slot18 in pairs(slot5) do
		slot18.cal_soft = slot18.cfg.soft * math.min(slot18.cfg.effect_count, slot18.num)
		slot13 = 0 + slot18.cal_soft
	end

	slot19 = TI18N("总计:%d")
	slot20 = slot13

	slot0.base_total_txt:setString(uv1(slot19, slot20))
	slot0.base_scrollview:setData(slot5)

	slot14 = {}
	slot15 = 0

	for slot19, slot20 in pairs(slot6) do
		slot21, slot22 = nil

		for slot26, slot27 in pairs(slot20.cfg) do
			if slot26 <= slot20.num and (not slot21 or slot21 > slot20.num - slot26) then
				slot21 = slot20.num - slot26
				slot22 = slot26
			end
		end

		if slot22 then
			slot20.cfg = slot20.cfg[slot22]
			slot15 = slot15 + slot20.cfg.all_soft

			uv2(slot14, slot20)
		end
	end

	slot0.suit_scrollview:setData(slot14)
	slot0.suit_total_txt:setString(uv1(TI18N("总计:%d"), slot15))
end

function HomeworldInfoWindow.close_callback(slot0)
	if slot0.base_scrollview then
		slot0.base_scrollview:DeleteMe()

		slot0.base_scrollview = nil
	end

	if slot0.suit_scrollview then
		slot0.suit_scrollview:DeleteMe()

		slot0.suit_scrollview = nil
	end

	uv0:openHomeInfoWindow(false)
end

HomeworldInfoBaseItem = class("HomeworldInfoBaseItem", function ()
	return ccui.Widget:create()
end)

function HomeworldInfoBaseItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function HomeworldInfoBaseItem.configUI(slot0)
	slot0.root_wnd = ccui.Layout:create()
	slot0.size = cc.size(602, 30)

	slot0.root_wnd:setContentSize(slot0.size)
	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setTouchEnabled(false)
	slot0:addChild(slot0.root_wnd)
end

function HomeworldInfoBaseItem.register_event(slot0)
end

function HomeworldInfoBaseItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	if not Config.ItemData.data_get_data(slot1.bid) then
		return
	end

	slot3 = slot1.cfg

	if not slot0.name_txt then
		slot0.name_txt = createLabel(24, 1, nil, 20, slot0.size.height * 0.5, nil, slot0.root_wnd, nil, cc.p(0, 0.5))
	end

	slot0.name_txt:setTextColor(BackPackConst.getWhiteQualityColorC4B(slot2.quality))
	slot0.name_txt:setString(slot3.name)

	if not slot0.num_txt then
		slot0.num_txt = createLabel(24, 274, nil, 295, slot0.size.height * 0.5, nil, slot0.root_wnd, nil, cc.p(0, 0.5))
	end

	slot0.num_txt:setString(slot1.num .. "/" .. slot3.effect_count)

	if not slot0.soft_txt then
		slot0.soft_txt = createLabel(24, 274, nil, 450, slot0.size.height * 0.5, nil, slot0.root_wnd, nil, cc.p(0, 0.5))
	end

	slot0.soft_txt:setString("+" .. math.min(slot1.num, slot3.effect_count) * slot3.soft)
end

function HomeworldInfoBaseItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end

HomeworldInfoSuitItem = class("HomeworldInfoSuitItem", function ()
	return ccui.Widget:create()
end)

function HomeworldInfoSuitItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function HomeworldInfoSuitItem.configUI(slot0)
	slot0.root_wnd = ccui.Layout:create()
	slot0.size = cc.size(602, 30)

	slot0.root_wnd:setContentSize(slot0.size)
	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setTouchEnabled(false)
	slot0:addChild(slot0.root_wnd)
end

function HomeworldInfoSuitItem.register_event(slot0)
end

function HomeworldInfoSuitItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	if not slot0.name_txt then
		slot0.name_txt = createLabel(24, 274, nil, 20, slot0.size.height * 0.5, nil, slot0.root_wnd, nil, cc.p(0, 0.5))
	end

	slot0.name_txt:setString(slot1.cfg.name)

	if not slot0.num_txt then
		slot0.num_txt = createLabel(24, 274, nil, 283, slot0.size.height * 0.5, nil, slot0.root_wnd, nil, cc.p(0, 0.5))
	end

	slot0.num_txt:setString(slot1.num .. "/" .. slot1.cfg.num)

	if not slot0.soft_txt then
		slot0.soft_txt = createLabel(24, 274, nil, 450, slot0.size.height * 0.5, nil, slot0.root_wnd, nil, cc.p(0, 0.5))
	end

	slot0.soft_txt:setString("+" .. slot1.cfg.all_soft)
end

function HomeworldInfoSuitItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
