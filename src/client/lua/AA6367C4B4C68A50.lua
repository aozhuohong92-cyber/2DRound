ActiontermbeginsTabChapterPanel = class("ActiontermbeginsTabChapterPanel", function ()
	return ccui.Widget:create()
end)
slot1 = ActiontermbeginsController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.sort
slot5 = RoleController:getInstance():getRoleVo()
slot6 = math.floor

function ActiontermbeginsTabChapterPanel.ctor(slot0, slot1)
	slot0.parent = slot1

	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function ActiontermbeginsTabChapterPanel.config(slot0)
	slot0.diff_item_list = {}
	slot0.select_index = 1
end

function ActiontermbeginsTabChapterPanel.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("actiontermbegins/action_term_begins_tab_chapter_panel"))

	slot0:addChild(slot0.root_wnd)

	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.look_btn = slot0.main_container:getChildByName("look_btn")
	slot0.diff_item_list = {}
	slot2 = {
		TI18N("简单"),
		TI18N("困难"),
		TI18N("地狱"),
		TI18N("噩梦")
	}
	slot7 = "select_diff"
	slot0.select_diff = slot0.main_container:getChildByName("diff_panel"):getChildByName(slot7)
	slot0.select_diff_x = slot0.select_diff:getPositionX()

	for slot7 = 1, 4 do
		slot8 = slot3:getChildByName("diff_item_" .. slot7)
		slot0.diff_item_list[slot7] = {
			btn = slot8,
			icon = slot8:getChildByName("icon"),
			diff_name = slot8:getChildByName("diff_name")
		}

		if slot2[slot7] then
			slot0.diff_item_list[slot7].diff_name:setString(slot2[slot7])
		end

		slot0.diff_item_list[slot7].lock_img = slot8:getChildByName("lock_img")
	end

	slot0.chapter_item_list = {}

	for slot7 = 1, 5 do
		if slot0.main_container:getChildByName("chapter_item_" .. slot7) then
			slot0.chapter_item_list[slot7] = {
				item = slot8,
				btn = slot8:getChildByName("btn"),
				icon = slot8:getChildByName("icon"),
				bar = slot8:getChildByName("bar"),
				bar_num = slot8:getChildByName("bar_num"),
				lock_img = slot8:getChildByName("lock_img"),
				pass_img = slot8:getChildByName("pass_img"),
				chapter_name = slot8:getChildByName("chapter_name")
			}

			slot0.chapter_item_list[slot7].chapter_name:setString("")
			slot0.chapter_item_list[slot7].pass_img:setVisible(false)
			slot0.chapter_item_list[slot7].lock_img:setVisible(false)
			slot0.chapter_item_list[slot7].bar:setPercent(0)
		end
	end

	slot0.select_img_pos = {
		cc.p(50, 136),
		cc.p(52, 137),
		cc.p(50, 102),
		cc.p(50, 136),
		cc.p(50, 136)
	}
	slot0.select_img = slot0.main_container:getChildByName("select_img")

	if slot0.select_img then
		breatheShineAction4(slot0.select_img, 0.3, 10)
	end

	slot0.bottom_panel = slot0.main_container:getChildByName("bottom_panel")
	slot0.chapter_name = slot0.bottom_panel:getChildByName("chapter_name")
	slot0.dungeons_key = slot0.bottom_panel:getChildByName("dungeons_key")

	slot0.dungeons_key:setString(TI18N("关卡效果"))

	slot4, slot5 = slot0.dungeons_key:getPosition()
	slot0.dungeons_effect_label = {
		createRichLabel(20, cc.c4b(100, 50, 35, 255), cc.p(0, 0.5), cc.p(slot4, slot5 - 30), nil, nil, 720),
		createRichLabel(20, cc.c4b(100, 50, 35, 255), cc.p(0, 0.5), cc.p(slot4, slot5 - 56), nil, nil, 720),
		createRichLabel(20, cc.c4b(100, 50, 35, 255), cc.p(0, 0.5), cc.p(slot4, slot5 - 82), nil, nil, 720)
	}

	slot0.bottom_panel:addChild(slot0.dungeons_effect_label[1])
	slot0.bottom_panel:addChild(slot0.dungeons_effect_label[2])
	slot0.bottom_panel:addChild(slot0.dungeons_effect_label[3])
	slot0.bottom_panel:getChildByName("power_key"):setString(TI18N("推荐战力:"))

	slot0.power = slot0.bottom_panel:getChildByName("power")
	slot0.reward_desc = slot0.bottom_panel:getChildByName("reward_desc")

	slot0.reward_desc:setString(TI18N("本关奖励"))

	slot0.fight_btn = slot0.bottom_panel:getChildByName("fight_btn")
	slot0.fight_btn_label = slot0.fight_btn:getChildByName("label")

	slot0.fight_btn_label:setString(TI18N("挑 战"))

	slot6 = slot0.bottom_panel:getChildByName("buy_panel")

	slot6:getChildByName("key"):setString(TI18N("挑战次数:"))

	slot0.buy_count = slot6:getChildByName("label")
	slot0.buy_btn = slot6:getChildByName("add_btn")
	slot0.buy_tips = createRichLabel(20, cc.c4b(255, 248, 191, 255), cc.p(0.5, 0.5), cc.p(566, 126), nil, nil, 600)

	slot0.bottom_panel:addChild(slot0.buy_tips)

	slot0.item_scrollview = slot0.bottom_panel:getChildByName("item_scrollview")

	slot0.item_scrollview:setScrollBarEnabled(false)

	slot0.look_btn = slot0.main_container:getChildByName("look_btn")
	slot0.less_time = createRichLabel(22, cc.c4b(255, 248, 191, 255), cc.p(1, 0.5), cc.p(700, 442), nil, nil, 720)

	slot0.main_container:addChild(slot0.less_time)
end

function ActiontermbeginsTabChapterPanel.registerEvents(slot0)
	registerButtonEventListener(slot0.fight_btn, function ()
		uv0:onChickFightBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.buy_btn, function ()
		uv0:onClickBuyCountBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)

	function slot4(slot0, slot1, slot2)
		TipsManager:getInstance():showCommonTips(Config.HolidayTermBeginsData.data_const.level_descreption.desc, slot1:getTouchBeganPosition())
	end

	slot5 = true

	registerButtonEventListener(slot0.look_btn, slot4, slot5, 1)

	for slot4, slot5 in ipairs(slot0.diff_item_list) do
		registerButtonEventListener(slot5.btn, function ()
			uv0:onClickDiffBtn(uv1)
		end, false, 2)
	end

	for slot4, slot5 in ipairs(slot0.chapter_item_list) do
		registerButtonEventListener(slot5.btn, function ()
			uv0:onClickChapterBtn(uv1)
		end, false, 2)
	end

	if not slot0.add_goods_event then
		slot0.add_goods_event = GlobalEvent:getInstance():Bind(ActiontermbeginsEvent.TERM_BEGINS_BUY_COUNT_EVENT, function (slot0)
			if slot0 and uv0.scdata then
				uv0.scdata.cha_count = slot0.count
				uv0.scdata.buy_count = slot0.buy_count

				uv0:updateBuyCount()

				if uv0.is_open_form then
					uv0.is_open_form = false

					HeroController:getInstance():openFormGoFightPanel(true, PartnerConst.Fun_Form.TermBegins)
				end
			end
		end)
	end
end

function ActiontermbeginsTabChapterPanel.onClickBuyCountBtn(slot0)
	if not slot0.scdata then
		return
	end

	if slot0.scdata.buy_count <= 0 then
		message(TI18N("购买次数已达上限"))

		return
	end

	if not Config.HolidayTermBeginsData.data_const.action_num_espensive then
		return
	end

	slot2 = slot0.scdata.cha_count or 0

	CommonAlert.show(uv0(TI18N("是否花费<img src='%s' scale=0.3 />%s购买一次挑战次数？"), PathTool.getItemRes(Config.ItemData.data_get_data(slot1.val[1] or Config.ItemData.data_assets_label2id.gold).icon), slot1.val[2] or 1), TI18N("确定"), function ()
		uv0:sender26701()
	end, TI18N("取消"), nil, CommonAlert.type.rich)
end

function ActiontermbeginsTabChapterPanel.onChickFightBtn(slot0)
	if slot0.is_time_out then
		message(TI18N("活动已结束"))

		return
	end

	if not slot0.scdata then
		return
	end

	if not slot0.select_index then
		return
	end

	if not slot0.config_list[slot0.select_index] then
		return
	end

	if slot1.order_id < slot0.scdata.order then
		message(TI18N("该关卡已通关"))

		return
	elseif slot0.scdata.order < slot1.order_id then
		message(TI18N("该关卡未解锁"))

		return
	end

	if slot0.scdata.cha_count <= 0 then
		slot0.is_open_form = true

		slot0:onClickBuyCountBtn()

		return
	end

	HeroController:getInstance():openFormGoFightPanel(true, PartnerConst.Fun_Form.TermBegins)
end

function ActiontermbeginsTabChapterPanel.onClickDiffBtn(slot0, slot1)
	if not slot0.scdata then
		return
	end

	if slot0.scdata.difficulty < slot1 then
		message("请先通关上一难度")

		return
	end

	if not slot0.round_chapter_config[slot1] then
		return
	end

	slot0.select_difficulty = slot1
	slot0.config_list = {}

	for slot6, slot7 in pairs(slot2) do
		uv0(slot0.config_list, slot7)
	end

	uv1(slot0.config_list, function (slot0, slot1)
		return slot0.order_id < slot1.order_id
	end)
	slot0:updateAllChapterData()
end

function ActiontermbeginsTabChapterPanel.onClickChapterBtn(slot0, slot1)
	slot0:upateSingleChapterInfo(slot1)
end

function ActiontermbeginsTabChapterPanel.setData(slot0)
	if not slot0.is_init then
		slot0.is_init = true

		if slot0.parent and slot0.parent.scdata then
			slot0:setScdata(slot0.parent.scdata)
		end
	end
end

function ActiontermbeginsTabChapterPanel.setScdata(slot0, slot1)
	slot0.scdata = slot1

	if not Config.HolidayTermBeginsData.data_max_diff[slot0.scdata.round] then
		return
	end

	if not Config.HolidayTermBeginsData.data_max_chapter_id[slot0.scdata.round] then
		return
	end

	if not Config.HolidayTermBeginsData.data_round_info[slot0.scdata.round] then
		return
	end

	slot0.round_chapter_config = Config.HolidayTermBeginsData.data_chapter_info[slot4.unit_round]

	if not slot0.round_chapter_config then
		return
	end

	slot0.select_difficulty = slot0.scdata.difficulty

	if slot2 < slot0.select_difficulty then
		slot0.select_difficulty = slot2
	end

	if not slot0.round_chapter_config[slot0.select_difficulty] then
		return
	end

	slot0.config_list = {}

	for slot9, slot10 in pairs(slot5) do
		uv0(slot0.config_list, slot10)
	end

	uv1(slot0.config_list, function (slot0, slot1)
		return slot0.order_id < slot1.order_id
	end)

	if slot3 < slot0.scdata.order then
		slot0.is_pass_all = true
	end

	if slot0.scdata.end_time - GameNet:getInstance():getTime() <= 0 then
		slot6 = 0
		slot0.is_time_out = true
	end

	commonCountDownTime(slot0.less_time, slot6, {
		callback = function (slot0)
			uv0:setTimeFormatString(slot0)
		end
	})
	slot0:updateAllChapterData()
	slot0:updateBuyCount()
end

function ActiontermbeginsTabChapterPanel.setTimeFormatString(slot0, slot1)
	if slot1 > 0 then
		slot0.less_time:setString(string.format(TI18N("<div outline=2,#000000 >剩余时间:</div><div fontcolor=#80f731 outline=2,#000000>%s</div>"), TimeTool.GetTimeFormatDayIIIIII(slot1)))
	else
		slot0.less_time:setString(TI18N("<div outline=2,#000000 >剩余时间:</div><div fontcolor=#80f731 outline=2,#000000>00:00</div>"))

		slot0.is_time_out = true

		if not slot0.is_time_out_once and slot0.fight_btn then
			slot0.is_time_out_once = true

			slot0.fight_btn_label:disableEffect(cc.LabelEffect.OUTLINE)
			setChildUnEnabled(true, slot0.fight_btn)
		end
	end
end

function ActiontermbeginsTabChapterPanel.updateAllChapterData(slot0)
	if not slot0.scdata then
		return
	end

	for slot4, slot5 in ipairs(slot0.chapter_item_list) do
		if slot0.config_list[slot4] then
			slot5.item:setVisible(true)
			slot5.chapter_name:setString(slot6.order_name)

			if slot5.item_load == nil then
				slot5.item_load = loadSpriteTextureFromCDN(slot5.icon, PathTool.getPlistImgForDownLoad("bigbg/termbegins", "term_begins_chapter_" .. slot6.order_res), ResourcesType.single, slot5.item_load, nil, function ()
					if not tolua.isnull(uv0.icon) and uv1.scdata then
						if uv2.order_id < uv1.scdata.order then
							setChildUnEnabled(true, uv0.icon)
						else
							setChildUnEnabled(false, uv0.icon)
						end
					end
				end)
			end

			if slot6.order_id < slot0.scdata.order then
				slot5.lock_img:setVisible(false)
				slot5.pass_img:setVisible(true)
				slot5.bar:setPercent(0)
				slot5.bar_num:setString("0%")
				setChildUnEnabled(true, slot5.icon)
			elseif slot6.order_id == slot0.scdata.order then
				slot0.select_index = slot4

				slot5.lock_img:setVisible(false)
				slot5.pass_img:setVisible(false)

				slot7 = slot0.scdata.hp_per / 10

				slot5.bar:setPercent(slot7)
				slot5.bar_num:setString(slot7 .. "%")
				setChildUnEnabled(false, slot5.icon)
			else
				slot5.lock_img:setVisible(true)
				slot5.pass_img:setVisible(false)
				slot5.bar:setPercent(100)
				slot5.bar_num:setString("100%")
				setChildUnEnabled(false, slot5.icon)
			end
		else
			slot5.item:setVisible(false)
		end
	end

	slot4 = slot0.select_index

	slot0:upateSingleChapterInfo(slot4)

	for slot4, slot5 in ipairs(slot0.diff_item_list) do
		if slot4 < slot0.scdata.difficulty then
			if slot5.lock_img then
				slot5.lock_img:setVisible(false)
			end

			setChildUnEnabled(false, slot5.icon)
		elseif slot4 == slot0.scdata.difficulty then
			if slot5.lock_img then
				slot5.lock_img:setVisible(false)
			end

			setChildUnEnabled(false, slot5.icon)
		else
			if slot5.lock_img then
				slot5.lock_img:setVisible(true)
			end

			setChildUnEnabled(true, slot5.icon)
		end
	end

	slot0:setSelectDiff()
end

function ActiontermbeginsTabChapterPanel.setSelectDiff(slot0)
	if not slot0.select_difficulty then
		return
	end

	if slot0.select_diff then
		slot0.select_diff:setPositionX(slot0.select_diff_x + (slot0.select_difficulty - 1) * 80)
	end
end

function ActiontermbeginsTabChapterPanel.upateSingleChapterInfo(slot0, slot1)
	if not slot0.config_list then
		return
	end

	if not slot0.config_list[slot1] then
		return
	end

	slot0.select_index = slot1

	if slot0.select_img_pos[slot1] and slot0.chapter_item_list[slot1] then
		slot3, slot4 = slot0.chapter_item_list[slot1].item:getPosition()

		slot0.select_img:setPosition(slot0.select_img_pos[slot1].x + slot3 - 50, slot0.select_img_pos[slot1].y + slot4 - 51)
	end

	slot6 = slot2.order_name

	slot0.chapter_name:setString(slot6)

	for slot6, slot7 in ipairs(slot0.dungeons_effect_label) do
		if slot2.add_skill_decs[slot6] then
			slot7:setString(slot2.add_skill_decs[slot6])
		else
			slot7:setString("")
		end
	end

	slot0.power:setString(slot2.power)

	slot0.item_list = commonShowSingleRowItemList(slot0.item_scrollview, slot0.item_list, slot2.hit_award or {}, {
		scale = 0.7,
		max_count = 5,
		is_center = true
	})

	if slot0.config_list[slot0.select_index] then
		if slot5.order_id < slot0.scdata.order then
			slot0.fight_btn_label:disableEffect(cc.LabelEffect.OUTLINE)
			setChildUnEnabled(true, slot0.fight_btn)
		elseif not slot0.is_time_out and slot5.order_id == slot0.scdata.order then
			slot0.fight_btn_label:enableOutline(Config.ColorData.data_color4[264], 2)
			setChildUnEnabled(false, slot0.fight_btn)
		else
			slot0.fight_btn_label:disableEffect(cc.LabelEffect.OUTLINE)
			setChildUnEnabled(true, slot0.fight_btn)
		end
	end
end

function ActiontermbeginsTabChapterPanel.updateBuyCount(slot0)
	if not slot0.scdata then
		return
	end

	if Config.HolidayTermBeginsData.data_const.free_fight_count then
		slot0.buy_count:setString(uv0("%s/%s", slot0.scdata.cha_count, slot1.val))
	else
		slot0.buy_count:setString(slot0.scdata.cha_count)
	end

	slot0.buy_tips:setString(string.format(TI18N("<div outline=2,#000000>%s</div><div fontcolor=#3df424 outline=2,#000000>%s</div>"), TI18N("剩余购买次数:"), slot0.scdata.buy_count))

	if not slot0.is_time_out and slot0.scdata.cha_count > 0 and not slot0.is_pass_all then
		addRedPointToNodeByStatus(slot0.fight_btn, true, 5, 5)
	else
		addRedPointToNodeByStatus(slot0.fight_btn, false, 5, 5)
	end
end

function ActiontermbeginsTabChapterPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function ActiontermbeginsTabChapterPanel.DeleteMe(slot0)
	for slot4, slot5 in ipairs(slot0.chapter_item_list) do
		if slot5.item_load then
			slot5.item_load:DeleteMe()

			slot5.item_load = nil
		end
	end

	if slot0.item_list then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end

		slot0.item_list = nil
	end

	doStopAllActions(slot0.item_scrollview)
	doStopAllActions(slot0.select_img)
end
