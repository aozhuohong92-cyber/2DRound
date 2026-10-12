slot1 = HeavenController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format
slot4 = table.sort
HeavenChapterWindow = HeavenChapterWindow or BaseClass(BaseView)

function HeavenChapterWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.layout_name = "heaven/heaven_chapter_window"
	slot0.win_type = WinType.Full
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("heaven", "heaven"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_84", true),
			type = ResourcesType.single
		}
	}
	slot0.star_list = {}
	slot0.desc_list = {}
	slot0.customs_item_list = {}
	slot0.line_node_list = {}
	slot0.award_box_list = {}
	slot0.award_item_list = {}
	slot0.show_customs_num = 0
	slot0.boss_item_list = {}
end

function HeavenChapterWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.customs_panel = slot0.main_container:getChildByName("customs_panel")
	slot1 = slot0.main_container:getChildByName("top_panel")
	slot0.arrow_left = slot1:getChildByName("arrow_left")
	slot0.arrow_right = slot1:getChildByName("arrow_right")
	slot0.wnd_title = slot1:getChildByName("wnd_title")
	slot0.btn_rule = slot1:getChildByName("btn_rule")
	slot0.award_panel = slot0.main_container:getChildByName("award_panel")
	slot0.progress = slot0.award_panel:getChildByName("progress_bg"):getChildByName("progress")

	slot0.progress:setScale9Enabled(true)
	slot0.progress:setPercent(0)

	slot0.star_count = slot0.award_panel:getChildByName("star_count")
	slot3 = slot0.main_container:getChildByName("bottom_panel")
	slot0.bottom_panel = slot3
	slot0.image_bust = slot3:getChildByName("image_bust")

	slot0.image_bust:ignoreContentAdaptWithSize(true)

	slot0.first_sp = slot3:getChildByName("first_sp")
	slot0.btn_check = slot3:getChildByName("btn_check")

	slot0.btn_check:setVisible(false)

	slot0.add_btn = slot3:getChildByName("add_btn")
	slot0.challenge_btn = slot3:getChildByName("challenge_btn")

	slot0.challenge_btn:getChildByName("label"):setString(TI18N("挑战"))

	slot0.sweep_btn = slot3:getChildByName("sweep_btn")

	slot0.sweep_btn:getChildByName("label"):setString(TI18N("扫荡"))

	slot0.customs_num = slot3:getChildByName("customs_num")
	slot0.power_txt = slot3:getChildByName("power_txt")
	slot0.count_label = slot3:getChildByName("count_label")
	slot7 = TI18N

	slot3:getChildByName("count_title"):setString(slot7("挑战次数:"))

	for slot7 = 1, 3 do
		if slot3:getChildByName("star_" .. slot7) then
			slot8:setVisible(false)
			uv0(slot0.star_list, slot8)
		end
	end

	for slot7 = 1, 3 do
		if slot3:getChildByName("star_desc_" .. slot7) then
			slot8:setString("")
			uv0(slot0.desc_list, slot8)
		end
	end

	slot4 = slot3:getChildByName("award_list")
	slot5 = slot4:getContentSize()
	slot7 = 0.6
	slot0.good_scrollview = CommonScrollViewLayout.new(slot4, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, cc.size(slot5.width, slot5.height), {
		start_y = 0,
		start_x = 0,
		space_x = 5,
		row = 1,
		space_y = 0,
		col = 0,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * slot7,
		item_height = BackPackItem.Height * slot7,
		scale = slot7
	})

	slot0.good_scrollview:setSwallowTouches(false)

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot9 = display.getTop(slot0.main_container)
	slot10 = display.getBottom(slot0.main_container)

	slot1:setPositionY(slot9 - 158)
	slot0.award_panel:setPositionY(slot9 - 238)
	slot3:setPositionY(slot10 + 110)
	slot0.close_btn:setPositionY(slot10 + 150)
end

function HeavenChapterWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openHeavenChapterWindow(false)
	end, true, 2)
	registerButtonEventListener(slot0.btn_rule, function (slot0, slot1, slot2)
		if Config.DungeonHeavenData.data_const.dunheaven_rule then
			TipsManager:getInstance():showCommonTips(slot3.desc, slot1:getTouchBeganPosition())
		end
	end, true)
	registerButtonEventListener(slot0.arrow_left, function ()
		uv0:onClickLeftArrow()
	end, true)
	registerButtonEventListener(slot0.arrow_right, function ()
		uv0:onClickRightArrow()
	end, true)
	registerButtonEventListener(slot0.btn_check, function ()
		uv0:onClickCheckBtn()
	end, true)
	registerButtonEventListener(slot0.add_btn, function ()
		uv0:onClickAddCountBtn()
	end, true)
	registerButtonEventListener(slot0.challenge_btn, function ()
		uv0:onClickChallengeBtn()
	end, true)
	registerButtonEventListener(slot0.sweep_btn, function ()
		uv0:onClickSweepBtn()
	end, true)
	slot0:addGlobalEvent(HeavenEvent.Update_Chapter_Count_Event, function ()
		uv0:updateChallengeCount()
		uv0:updateLeftBuyCount()
	end)
	slot0:addGlobalEvent(HeavenEvent.Update_Chapter_Basedata_Event, function ()
		uv0:updateCustomsList()
		uv0:updateStarAwardInfo()
		uv0:updateCustomsInfo(uv0.cur_customs_cfg)
		uv0:updateArrowBtnStatus()
	end)
	slot0:addGlobalEvent(HeavenEvent.Get_Chapter_Award_Event, function ()
		for slot3, slot4 in pairs(uv0.award_box_list) do
			slot4:updateEffectStatus()
		end
	end)
end

function HeavenChapterWindow.onClickLeftArrow(slot0)
	if slot0.chapter_id and uv0:checkHeavenChapterIsOpen(slot0.chapter_id - 1) then
		slot0.chapter_id = slot0.chapter_id - 1

		slot0:setData()

		if not uv0:checkIsHaveCustomsCache(slot0.chapter_id) then
			uv1:sender25201(slot0.chapter_id)
		end
	end
end

function HeavenChapterWindow.onClickRightArrow(slot0)
	if slot0.chapter_id and uv0:checkHeavenChapterIsOpen(slot0.chapter_id + 1) then
		slot0.chapter_id = slot0.chapter_id + 1

		slot0:setData()

		if not uv0:checkIsHaveCustomsCache(slot0.chapter_id) then
			uv1:sender25201(slot0.chapter_id)
		end
	end
end

function HeavenChapterWindow.onClickCheckBtn(slot0)
	slot0:showCustomsBossList()
end

function HeavenChapterWindow.onClickAddCountBtn(slot0)
	if not Config.DungeonHeavenData.data_const.refresh_number then
		return
	end

	if slot1.val <= uv0:getLeftChallengeCount() then
		message(TI18N("当前挑战次数已满"))

		return
	end

	if Config.DungeonHeavenData.data_count_buy[uv0:getTodayBuyCount() + 1] then
		if slot4.limit_vip <= RoleController:getInstance():getRoleVo().vip_lev then
			CommonAlert.show(string.format(TI18N("是否消耗<img src=%s visible=true scale=0.3 />%d购买一次挑战次数？"), PathTool.getItemRes(3), slot4.cost), TI18N("确定"), function ()
				uv0:sender25207()
			end, TI18N("取消"), nil, CommonAlert.type.rich)
		else
			message(TI18N("提升VIP等级可增加购买次数"))
		end
	else
		message(TI18N("今日购买次数已用完"))
	end
end

function HeavenChapterWindow.onClickChallengeBtn(slot0)
	if slot0.cur_customs_cfg then
		if slot0.cur_customs_cfg.type == 1 then
			HeroController:getInstance():openFormGoFightPanel(true, PartnerConst.Fun_Form.HeavenBoss, {
				chapter_id = slot0.cur_customs_cfg.id,
				customs_id = slot0.cur_customs_cfg.order_id
			})
		else
			HeroController:getInstance():openFormGoFightPanel(true, PartnerConst.Fun_Form.Heaven, {
				chapter_id = slot0.cur_customs_cfg.id,
				customs_id = slot0.cur_customs_cfg.order_id
			})
		end
	end
end

function HeavenChapterWindow.onClickSweepBtn(slot0)
	if slot0.cur_customs_cfg then
		uv0:checkHeavenSweep(slot0.cur_customs_cfg.id, slot0.cur_customs_cfg.order_id)
	end
end

function HeavenChapterWindow.openRootWnd(slot0, slot1)
	slot0.chapter_id = slot1

	slot0:setData()

	if not uv0:checkIsHaveCustomsCache(slot1) then
		uv1:sender25201(slot1)
	end
end

function HeavenChapterWindow.setData(slot0)
	if not slot0.chapter_id then
		return
	end

	slot0.cur_customs_cfg = nil
	slot0.chapter_cfg = Config.DungeonHeavenData.data_chapter[slot0.chapter_id]
	slot0.customs_cfg = Config.DungeonHeavenData.data_customs[slot0.chapter_id]

	if not slot0.chapter_cfg or not slot0.customs_cfg then
		return
	end

	slot0.wnd_title:setString(slot0.chapter_cfg.type)

	if slot0.chapter_cfg.map_id and slot0.chapter_cfg.map_id ~= 0 and slot0.background then
		slot0.map_load = loadImageTextureFromCDN(slot0.background, PathTool.getPlistImgForDownLoad("bigbg", uv0("bigbg_" .. slot0.chapter_cfg.map_id), true), ResourcesType.single, slot0.map_load)
	end

	for slot4, slot5 in pairs(slot0.line_node_list) do
		slot5:setVisible(false)
	end

	slot0:updateChallengeCount()
	slot0:updateLeftBuyCount()
	slot0:updateBossBust()
	slot0:updateCustomsList(true)
	slot0:updateArrowBtnStatus()
	slot0:updateStarAwardInfo()
end

function HeavenChapterWindow.updateCustomsList(slot0, slot1)
	if not slot0.customs_cfg or not slot0.chapter_cfg then
		return
	end

	if not slot1 and slot0.show_customs_num == #uv0:getAllCanShowCustomsDataById(slot0.chapter_cfg.id) then
		return
	end

	for slot6, slot7 in pairs(slot0.customs_item_list) do
		slot7:setVisible(false)
	end

	slot0.all_customs_vo = slot2
	slot0.show_customs_num = #slot2

	if Config.DungeonHeavenData.data_customs_pos[slot0.chapter_cfg.pos_id] then
		slot4 = slot0:getDefaultChoseCustomsId()

		for slot8, slot9 in ipairs(slot0.all_customs_vo) do
			delayRun(slot0.customs_panel, slot8 / display.DEFAULT_FPS, function ()
				if not uv0.customs_item_list[uv1] then
					slot0 = HeavenCustomsItem.new(handler(uv0, uv0._onClickCustomsItem))

					uv0.customs_panel:addChild(slot0, 1)

					uv0.customs_item_list[uv1] = slot0
				end

				if uv2[uv3.id] then
					slot0:setPosition(cc.p(slot1.pos[1] or 0, slot1.pos[2] or 0))
				end

				slot0:setVisible(true)
				slot0:setData(uv3, uv0.customs_cfg[uv3.id])

				if uv4 == uv3.id then
					uv0:_onClickCustomsItem(slot0)
				end
			end)
		end
	end

	slot0:updateLineList(slot3)
end

function HeavenChapterWindow.getDefaultChoseCustomsId(slot0)
	for slot5, slot6 in pairs(slot0.all_customs_vo or {}) do
		if 1 < slot6.id then
			slot1 = slot6.id
		end
	end

	return slot1
end

function HeavenChapterWindow._onClickCustomsItem(slot0, slot1)
	if slot0.cur_customs_cfg and slot0.cur_customs_cfg.order_id == slot1:getCustomsId() then
		return
	end

	if slot0.cur_item_node then
		slot0.cur_item_node:setSelected(false)
	end

	slot1:setSelected(true)

	slot0.cur_item_node = slot1

	slot0:updateCustomsInfo(slot1:getData())
end

function HeavenChapterWindow.updateCustomsInfo(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.cur_customs_cfg = slot1
	slot3 = {}

	if uv0:getCustomsDataById(slot1.id, slot1.order_id) and slot2.state == 2 then
		slot3 = slot1.show_award

		loadSpriteTexture(slot0.first_sp, PathTool.getResFrame("heaven", "txt_cn_heaven_award"), LOADTEXT_TYPE_PLIST)
	else
		slot3 = slot1.f_show_award

		loadSpriteTexture(slot0.first_sp, PathTool.getResFrame("heaven", "txt_cn_heaven_first"), LOADTEXT_TYPE_PLIST)
	end

	if slot2 and slot2.star == 3 then
		slot0.challenge_btn:setVisible(false)
		slot0.sweep_btn:setVisible(true)
	else
		slot0.challenge_btn:setVisible(true)
		slot0.sweep_btn:setVisible(false)
	end

	slot0.customs_num:setString(uv1(TI18N("第%d关"), slot1.order_id))
	slot0.power_txt:setString(uv1(TI18N("推荐战力:%d"), slot1.power))
	slot0.btn_check:setVisible(slot1.type == 1)

	for slot7, slot8 in pairs(slot0.desc_list) do
		slot8:setString("")
	end

	for slot7, slot8 in pairs(slot0.star_list) do
		slot8:setVisible(false)
	end

	for slot7, slot8 in ipairs(slot1.cond_info or {}) do
		slot9 = slot8[1]
		slot12 = Config.DungeonHeavenData.data_star_cond[slot8[2]]

		if slot0.desc_list[slot7] and slot12 then
			slot11:setString(slot12.type)
		end

		if slot0.star_list[slot7] and slot2 then
			slot14 = 0

			for slot18, slot19 in pairs(slot2.star_info) do
				if slot19.star_id == slot9 then
					slot14 = slot19.flag
				end
			end

			slot13:setVisible(slot14 == 1)
		end
	end

	slot4 = {}

	for slot8, slot9 in ipairs(slot3) do
		slot12 = deepCopy(Config.ItemData.data_get_data(slot9[1]))
		slot12.quantity = slot9[2]

		uv2(slot4, slot12)
	end

	slot0.good_scrollview:setData(slot4)
	slot0.good_scrollview:addEndCallBack(function ()
		slot1 = Config.DungeonHeavenData.data_const.heaven_handbook

		for slot5, slot6 in pairs(uv0.good_scrollview:getItemList()) do
			slot8 = nil

			if slot6:getData() and slot1 then
				for slot12, slot13 in pairs(slot1.val) do
					if slot13 == slot7.id then
						slot8 = 2

						break
					end
				end
			end

			slot6:setDefaultTip(true, nil, nil, slot8)
		end
	end)
end

function HeavenChapterWindow.updateLineList(slot0, slot1)
	if not slot0.all_customs_vo or not slot1 then
		return
	end

	if #slot0.all_customs_vo - 1 < 1 then
		return
	end

	for slot6, slot7 in pairs(slot0.line_node_list) do
		slot7:setVisible(false)
	end

	slot3 = 1

	for slot7 = 1, slot2 do
		if slot1[slot7] then
			slot12 = slot8.end_pos[1]
			slot13 = slot8.end_pos[2]

			uv0({}, cc.p(slot8.start_pos[1], slot8.start_pos[2]))

			if slot8.bessel_pos_1 and next(slot8.bessel_pos_1) ~= nil then
				uv0(slot9, cc.p(slot8.bessel_pos_1[1], slot8.bessel_pos_1[2]))
			end

			if slot8.bessel_pos_2 and next(slot8.bessel_pos_2) ~= nil then
				uv0(slot9, cc.p(slot8.bessel_pos_2[1], slot8.bessel_pos_2[2]))
			end

			uv0(slot9, cc.p(slot12, slot13))

			slot15 = 1 / (math.sqrt(math.pow(slot12 - slot10, 2) + math.pow(slot13 - slot11, 2)) / 30)
			slot16 = {}
			slot17 = 0

			while slot17 < 1 do
				table.insert(slot16, slot0:getBezierPos(slot9, slot17))

				slot17 = slot17 + slot15
			end

			for slot21, slot22 in ipairs(slot16) do
				if not slot0.line_node_list[slot3] then
					slot0.line_node_list[slot3] = createSprite(PathTool.getResFrame("heaven", "heaven_1013"), slot22.x, slot22.y, slot0.customs_panel, cc.p(0.5, 0.5))
				end

				slot23:setPosition(slot22)
				slot23:setVisible(true)

				slot3 = slot3 + 1
			end
		end
	end
end

function HeavenChapterWindow.factorial(slot0, slot1)
	if slot1 == 0 then
		return 1
	else
		return slot1 * slot0:factorial(slot1 - 1)
	end
end

function HeavenChapterWindow.getBezierPos(slot0, slot1, slot2)
	slot3 = #slot1 - 1

	for slot9, slot10 in pairs(slot1) do
		slot4 = 0 + slot10.x * slot0:factorial(slot3) / (slot0:factorial(slot3 - slot9 + 1) * slot0:factorial(slot9 - 1)) * math.pow(1 - slot2, slot3 - slot9 + 1) * math.pow(slot2, slot9 - 1)
		slot5 = 0 + slot10.y * slot0:factorial(slot3) / (slot0:factorial(slot3 - slot9 + 1) * slot0:factorial(slot9 - 1)) * math.pow(1 - slot2, slot3 - slot9 + 1) * math.pow(slot2, slot9 - 1)
	end

	return cc.p(slot4, slot5)
end

function HeavenChapterWindow.updateArrowBtnStatus(slot0)
	if slot0.chapter_id then
		slot0.arrow_left:setVisible(uv0:checkHeavenChapterIsOpen(slot0.chapter_id - 1))
		slot0.arrow_right:setVisible(uv0:checkHeavenChapterIsOpen(slot0.chapter_id + 1))
	else
		slot0.arrow_left:setVisible(false)
		slot0.arrow_right:setVisible(false)
	end
end

function HeavenChapterWindow.updateChallengeCount(slot0)
	if Config.DungeonHeavenData.data_const.refresh_number then
		slot0.count_label:setString(uv0:getLeftChallengeCount() .. "/" .. slot1.val)
	end
end

function HeavenChapterWindow.updateLeftBuyCount(slot0)
	if not slot0.left_buy_count then
		slot0.left_buy_count = createRichLabel(20, 1, cc.p(0.5, 0.5), cc.p(590, 6))

		slot0.bottom_panel:addChild(slot0.left_buy_count)
	end

	slot0.left_buy_count:setString(string.format(TI18N("<div fontcolor=#fff8bf outline=2,#000000>(剩余购买次数:</div><div fontcolor=#39e522 outline=2,#000000>%d</div><div fontcolor=#fff8bf outline=2,#000000>)</div>"), uv0:getTodayLeftBuyCount()))
end

function HeavenChapterWindow.updateStarAwardInfo(slot0)
	if not slot0.chapter_id then
		return
	end

	slot2 = uv0:getChapterDataById(slot0.chapter_id)

	if not Config.DungeonHeavenData.data_star_award[slot0.chapter_id] or not slot2 then
		return
	end

	slot3 = slot2.all_star
	slot4 = uv0:getChapterMaxStarNum(slot0.chapter_id)

	slot0.progress:setPercent(slot3 / slot4 * 100)

	slot9 = "/"
	slot8 = slot3 .. slot9 .. slot4

	slot0.star_count:setString(slot8)

	for slot8, slot9 in pairs(slot0.award_box_list) do
		slot9:setVisible(false)
	end

	for slot8, slot9 in ipairs(slot1) do
		if not slot0.award_box_list[slot8] then
			slot10 = HeavenAwardBoxItem.new(handler(slot0, slot0._onClickShowAwardTips))

			slot0.award_panel:addChild(slot10)

			slot0.award_box_list[slot8] = slot10
		end

		slot10:setPosition(cc.p(slot9.limit_star / slot4 * 324, 20))
		slot10:setData(slot9, slot0.chapter_id)
		slot10:setVisible(true)
	end
end

function HeavenChapterWindow._onClickShowAwardTips(slot0, slot1, slot2, slot3)
	if not slot0.tips_layer then
		slot0.tips_layer = ccui.Layout:create()

		slot0.tips_layer:setContentSize(cc.size(SCREEN_WIDTH, display.height))
		slot0.main_container:addChild(slot0.tips_layer)
		slot0.tips_layer:setTouchEnabled(true)
		slot0.tips_layer:setSwallowTouches(false)
		registerButtonEventListener(slot0.tips_layer, function ()
			uv0.tips_layer:setVisible(false)
		end, false, 1)
	end

	slot0.tips_layer:setVisible(true)

	if not slot0.tips_bg then
		slot0.tips_bg = createImage(slot0.tips_layer, PathTool.getResFrame("common", "common_1056"), 0, 0, cc.p(0, 0), true, 10, true)

		slot0.tips_bg:setTouchEnabled(true)
	end

	if slot0.tips_bg then
		slot4 = cc.size(BackPackItem.Width * #slot2 + 72, BackPackItem.Height + 50)

		slot0.tips_bg:setContentSize(slot4)
		slot0.tips_bg:setAnchorPoint(cc.p(0.5, 1))

		if slot0.main_container:convertToNodeSpace(slot1:convertToWorldSpace(cc.p(0, 0))).x - slot4.width / 2 < 0 then
			slot6.x = 10 + slot4.width / 2
		end

		slot0.tips_bg:setPosition(slot6)
	end

	for slot7, slot8 in pairs(slot0.award_item_list) do
		slot8:setVisible(false)
	end

	for slot7, slot8 in pairs(slot2) do
		if Config.ItemData.data_get_data(slot8[1]) then
			if not slot0.award_item_list[slot7] then
				slot9 = BackPackItem.new(nil, true, nil, 0.8)
				slot0.award_item_list[slot7] = slot9

				slot9:setAnchorPoint(cc.p(0, 0.5))
				slot0.tips_bg:addChild(slot9)
				slot9:setBaseData(slot8[1], slot8[2])
				slot9:setPosition(cc.p((BackPackItem.Width + 18) * (slot7 - 1) + 30, 95))
				slot9:setDefaultTip()
				slot9:setExtendDesc(true, slot10.name, 275)
			else
				slot9:setBaseData(slot8[1], slot8[2])
				slot9:setExtendDesc(true, slot10.name, 275)
				slot9:setPosition(cc.p((BackPackItem.Width + 18) * (slot7 - 1) + 30, 95))
				slot9:setVisible(true)
			end
		end
	end
end

function HeavenChapterWindow.updateBossBust(slot0)
	if not slot0.chapter_cfg then
		return
	end

	if not slot0.bust_res or slot0.chapter_cfg.bust_id ~= slot0.bust_res then
		slot0.bust_res = slot0.chapter_cfg.bust_id
		slot0.bust_load = loadImageTextureFromCDN(slot0.image_bust, PathTool.getPartnerBustRes_2(slot0.chapter_cfg.bust_id), ResourcesType.single, slot0.bust_load)
	end
end

function HeavenChapterWindow.showCustomsBossList(slot0)
	if slot0.cur_customs_cfg and slot0.cur_customs_cfg.type == 1 then
		slot1 = {}

		for slot5, slot6 in ipairs(slot0.cur_customs_cfg.unit_id) do
			if Config.UnitData.data_unit(slot6) then
				for slot11 = 1, 5 do
					if slot7["monster" .. slot11] and Config.UnitData.data_unit(slot12) then
						uv0(slot1, Config.UnitData.data_unit(slot12))
					end
				end
			end
		end

		if not slot0.boss_tips_mask then
			slot0.boss_tips_mask = ccui.Layout:create()

			slot0.boss_tips_mask:setContentSize(SCREEN_WIDTH, display.height)
			slot0.boss_tips_mask:setPositionY(display.getBottom(slot0.main_container))
			slot0.boss_tips_mask:setTouchEnabled(true)
			slot0.main_container:addChild(slot0.boss_tips_mask, 1)
			slot0.boss_tips_mask:setSwallowTouches(true)
			slot0.boss_tips_mask:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended then
					uv0.boss_tips_mask:setVisible(false)

					uv0.boss_tips_show = false
				end
			end)
		end

		slot0.boss_tips_mask:setVisible(true)

		if not slot0.boss_tips_bg then
			slot3 = slot0.main_container:convertToNodeSpace(slot0.btn_check:convertToWorldSpace(cc.p(0, 0)))
			slot0.boss_tips_bg = createImage(slot0.boss_tips_mask, PathTool.getResFrame("common", "common_1092"), slot3.x, slot3.y + 75, cc.p(0.5, 0), true, nil, true)

			slot0.boss_tips_bg:setContentSize(cc.size(576, 362))
			slot0.boss_tips_bg:setTouchEnabled(true)
		end

		if not slot0.boss_unit_bg_1 then
			slot0.boss_unit_bg_1 = createImage(slot0.boss_tips_bg, PathTool.getResFrame("common", "common_90058"), 288, 250, cc.p(0.5, 0.5), true, nil, true)

			slot0.boss_unit_bg_1:setContentSize(cc.size(563, 120))
		end

		if not slot0.boss_team_1 then
			slot0.boss_team_1 = createLabel(22, cc.c3b(224, 191, 152), nil, 20, 329, TI18N("队伍一:"), slot0.boss_tips_bg, nil, cc.p(0, 0.5))
		end

		if not slot0.boss_unit_bg_2 then
			slot0.boss_unit_bg_2 = createImage(slot0.boss_tips_bg, PathTool.getResFrame("common", "common_90058"), 288, 90, cc.p(0.5, 0.5), true, nil, true)

			slot0.boss_unit_bg_2:setContentSize(cc.size(563, 120))
		end

		if not slot0.boss_team_2 then
			slot0.boss_team_2 = createLabel(22, cc.c3b(224, 191, 152), nil, 20, 168, TI18N("队伍二:"), slot0.boss_tips_bg, nil, cc.p(0, 0.5))
		end

		for slot5, slot6 in pairs(slot0.boss_item_list) do
			slot6:setVisible(false)
		end

		for slot5, slot6 in ipairs(slot1) do
			delayRun(slot0.boss_tips_mask, slot5 / display.DEFAULT_FPS, function ()
				if not uv0.boss_item_list[uv1] then
					slot0 = HeroExhibitionItem.new(0.8, true)

					uv0.boss_tips_bg:addChild(slot0)

					uv0.boss_item_list[uv1] = slot0
				end

				slot1 = HeroVo.New()
				slot1.bid = tonumber(uv2.head_icon)
				slot1.star = uv2.star
				slot1.camp_type = uv2.camp_type
				slot1.lev = uv2.lev

				slot0:setData(slot1)

				slot2 = 0
				slot3 = 250

				if uv1 > 5 then
					slot2 = 75 + (uv1 - 6) * (HeroExhibitionItem.Width * 0.8 + 10)
					slot3 = 90
				else
					slot2 = 75 + (uv1 - 1) * (HeroExhibitionItem.Width * 0.8 + 10)
				end

				slot0:setPosition(cc.p(slot2, slot3))
				slot0:setVisible(true)
			end)
		end
	end
end

function HeavenChapterWindow.close_callback(slot0)
	if slot0.bust_load then
		slot0.bust_load:DeleteMe()

		slot0.bust_load = nil
	end

	if slot0.map_load then
		slot0.map_load:DeleteMe()

		slot0.map_load = nil
	end

	for slot4, slot5 in pairs(slot0.customs_item_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	for slot4, slot5 in pairs(slot0.award_box_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	for slot4, slot5 in pairs(slot0.award_item_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	for slot4, slot5 in pairs(slot0.boss_item_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	if slot0.good_scrollview then
		slot0.good_scrollview:DeleteMe()

		slot0.good_scrollview = nil
	end

	if slot0.chapter_id then
		uv0:setHeavenLastShowChapterId(slot0.chapter_id)
	end

	uv1:openHeavenChapterWindow(false)
end

HeavenAwardBoxItem = class("HeavenAwardBoxItem", function ()
	return ccui.Widget:create()
end)

function HeavenAwardBoxItem.ctor(slot0, slot1)
	slot0.call_back = slot1

	slot0:configUI()
	slot0:register_event()
end

function HeavenAwardBoxItem.configUI(slot0)
	slot0.size = cc.size(50, 50)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.container = ccui.Layout:create()

	slot0.container:setTouchEnabled(true)
	slot0.container:setContentSize(slot0.size)
	slot0.container:setAnchorPoint(0.5, 0.5)
	slot0.container:setPosition(cc.p(slot0.size.width / 2, slot0.size.height / 2))
	slot0:addChild(slot0.container)
end

function HeavenAwardBoxItem.register_event(slot0)
	registerButtonEventListener(slot0.container, function (slot0, slot1, slot2)
		if uv0.award_status == 1 then
			if uv0.chapter_id and uv0.data then
				uv1:sender25215(uv0.chapter_id, uv0.data.award_id)
			end
		elseif uv0.data and uv0.call_back then
			uv0:call_back(uv0.data.award, slot1:getTouchBeganPosition())
		end
	end)
end

function HeavenAwardBoxItem.setData(slot0, slot1, slot2)
	if not slot1 or not slot2 then
		return
	end

	slot0.data = slot1
	slot0.chapter_id = slot2

	if not slot0.star_num_txt then
		slot0.star_num_txt = createLabel(20, 1, cc.c3b(22, 5, 0), slot0.size.width / 2, 5, "", slot0.container, 2, cc.p(0.5, 1))
	end

	slot0.star_num_txt:setString(slot1.limit_star)
	slot0:updateEffectStatus()
end

function HeavenAwardBoxItem.updateEffectStatus(slot0)
	if not slot0.data or not slot0.chapter_id then
		return
	end

	slot0.award_status = uv0:getChapterStarAwardStatus(slot0.chapter_id, slot0.data.award_id)
	slot1 = PlayerAction.action_1

	if slot0.award_status == 1 then
		slot1 = PlayerAction.action_2
	elseif slot0.award_status == 2 then
		slot1 = PlayerAction.action_3
	end

	slot0:handleEffect(true, slot1)
end

function HeavenAwardBoxItem.handleEffect(slot0, slot1, slot2)
	if slot1 == true then
		if not tolua.isnull(slot0.container) and slot0.box_effect == nil and slot0.data then
			slot0.box_effect = createEffectSpine(Config.EffectData.data_effect_info[slot0.data.effect_id], cc.p(slot0.size.width / 2, 8), cc.p(0.5, 0.5), true, slot2)

			slot0.container:addChild(slot0.box_effect)
		elseif slot0.box_effect and (not slot0.cur_action_name or slot0.cur_action_name ~= slot2) then
			slot0.box_effect:setToSetupPose()
			slot0.box_effect:setAnimation(0, slot2, true)
		end

		slot0.cur_action_name = slot2
	elseif slot0.box_effect then
		slot0.box_effect:clearTracks()
		slot0.box_effect:removeFromParent()

		slot0.box_effect = nil
	end
end

function HeavenAwardBoxItem.DeleteMe(slot0)
	slot0:handleEffect(false)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
