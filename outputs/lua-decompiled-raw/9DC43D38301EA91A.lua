ActionBuySkinPanel = class("ActionBuySkinPanel", function ()
	return ccui.Widget:create()
end)
slot0 = ActionController:getInstance()

function ActionBuySkinPanel.ctor(slot0, slot1)
	slot0.holiday_bid = slot1
	slot0.touch_buy_skin = true
	slot0.attr_list = {}

	slot0:configUI()
	slot0:register_event()
end

function ActionBuySkinPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_buy_skin_panel"))

	slot0.root_wnd:setPosition(-40, -82)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.holiday_bg = slot0.main_container:getChildByName("bg")

	slot0:setHolidayBG()

	slot0.btn_fight = slot0.main_container:getChildByName("btn_fight")

	slot0.btn_fight:getChildByName("Text_1"):setString(TI18N("皮肤预览"))

	slot0.text_attr = slot0.main_container:getChildByName("Text_32")

	slot0.text_attr:setString(TI18N("属性加成："))
	slot0.text_attr:setVisible(false)

	slot1 = slot0.main_container:getChildByName("Text_2")

	slot1:setString(TI18N("现价:￥"))
	slot1:setVisible(false)

	slot0.text_price = slot0.main_container:getChildByName("text_price")

	slot0.text_price:setVisible(false)
	slot0.text_price:setString("")

	slot0.btn_buy = slot0.main_container:getChildByName("btn_buy")
	slot0.btn_buy_text = slot0.btn_buy:getChildByName("Text_4")

	slot0.btn_buy_text:setString("")

	slot0.time_text = slot0.main_container:getChildByName("time_text")

	slot0.time_text:setString("")

	slot2 = slot0.main_container:getChildByName("goods")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 15,
		start_x = 10,
		space_x = 10,
		row = 1,
		space_y = 0,
		col = 0,
		scale = 0.9,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.9,
		item_height = BackPackItem.Height * 0.9
	})

	slot0.item_scrollview:setSwallowTouches(false)
	uv0:cs16603(slot0.holiday_bid)
end

function ActionBuySkinPanel.setHolidayBG(slot0)
	slot1 = "txt_cn_hero_skin_buy"

	if uv0:getActionSubTabVo(slot0.holiday_bid) and slot2.aim_title ~= "" and slot2.aim_title then
		slot1 = slot2.aim_title
	end

	if not slot0.bg_load then
		slot0.bg_load = loadSpriteTextureFromCDN(slot0.holiday_bg, PathTool.getPlistImgForDownLoad("bigbg/action", slot1), ResourcesType.single, slot0.bg_load)
	end
end

function ActionBuySkinPanel.register_event(slot0)
	if not slot0.skin_buy_event then
		slot0.skin_buy_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_HOLIDAY_SIGNLE, function (slot0)
			if not slot0 then
				return
			end

			if slot0.bid == uv0.holiday_bid then
				commonCountDownTime(uv0.time_text, slot0.remain_sec)
				uv0:setData(slot0)
			end
		end)
	end

	registerButtonEventListener(slot0.btn_fight, function ()
		TimesummonController:getInstance():send23219(ActionRankCommonType.action_skin_buy)
	end, true, 2, nil, , 2)
	registerButtonEventListener(slot0.btn_buy, function ()
		uv0:setCheckHasHeroSkin()
	end, true)
end

function ActionBuySkinPanel.setCheckHasHeroSkin(slot0)
	if not slot0.touch_buy_skin then
		return
	end

	if not slot0.cur_skin_id then
		return
	end

	if HeroController:getModel():isUnlockHeroSkin(slot0.cur_skin_id, true) and Config.PartnerSkinData.data_skin_info and slot2[slot0.cur_skin_id] and slot2[slot0.cur_skin_id].diamond_num and slot3[1] then
		CommonAlert.show(string.format(TI18N("您已拥有当前皮肤的永久使用权，再次购买后使用将会转化成 <img src='%s' scale=0.3 /><div fontcolor=#289b14> *%d </div>，是否继续购买"), PathTool.getItemRes(Config.ItemData.data_get_data(slot3[1][1]).icon), slot3[1][2]), TI18N("确定"), function ()
			uv0:setChargeSkin()
		end, TI18N("取消"), nil, CommonAlert.type.rich)

		return
	end

	slot0:setChargeSkin()
end

function ActionBuySkinPanel.setChargeSkin(slot0)
	if slot0.buy_skin_ticket == nil then
		slot0.buy_skin_ticket = GlobalTimeTicket:getInstance():add(function ()
			uv0.touch_buy_skin = true

			if uv0.buy_skin_ticket ~= nil then
				GlobalTimeTicket:getInstance():remove(uv0.buy_skin_ticket)

				uv0.buy_skin_ticket = nil
			end
		end, 3)
	end

	slot0.touch_buy_skin = nil

	if slot0.buy_charge_id and Config.ChargeData.data_charge_data[slot0.buy_charge_id] then
		sdkOnPay(slot1.val, 1, slot1.id, slot1.name)
	end
end

function ActionBuySkinPanel.setData(slot0, slot1)
	if (slot1.aim_list or nil) and slot2[1] and slot2[1].aim_args then
		if (keyfind("aim_args_key", 40, slot2[1].aim_args) or nil) and Config.EffectData.data_effect_info[slot3.aim_args_val or 0] then
			slot0.bg_effect = createEffectSpine(slot5, cc.p(0, -70), cc.p(0.5, 0.5), true, PlayerAction.action)

			slot0.main_container:addChild(slot0.bg_effect)
		end

		slot5 = nil

		if keyfind("aim_args_key", 35, slot2[1].aim_args) or nil then
			slot5 = slot4.aim_args_val or 0
		end

		if slot5 then
			slot0.cur_skin_id = slot5

			slot0:setAttrGoodsData(slot5, slot2[1].item_list)
		end

		if slot1.finish ~= 0 then
			setChildUnEnabled(true, slot0.btn_buy)
			slot0.btn_buy_text:setString(TI18N("已购买"))
			slot0.btn_buy_text:disableEffect(cc.LabelEffect.OUTLINE)
			slot0.btn_buy:setTouchEnabled(false)
		else
			slot7 = nil

			if keyfind("aim_args_key", 33, slot2[1].aim_args) or nil then
				slot7 = slot6.aim_args_val or 0
			end

			if slot7 then
				slot0.buy_charge_id = slot7

				if Config.ChargeData.data_charge_data[slot7] then
					slot0.btn_buy_text:setString("￥" .. slot8[slot7].val)
				end
			end
		end
	end
end

function ActionBuySkinPanel.setAttrGoodsData(slot0, slot1, slot2)
	if Config.PartnerSkinData.data_skin_info and slot3[slot1] then
		for slot9, slot10 in pairs(slot3[slot1].skin_attr or {}) do
			slot11 = PathTool.getAttrIconByStr(slot10[1])
			slot12 = Config.AttrData.data_key_to_name[slot10[1]] or ""
			slot13, slot14, slot15 = commonGetAttrInfoByKeyValue(slot10[1], slot10[2])
		end

		for slot10 = 1, #{
			[slot9] = string.format("<img src=%s visible=true scale=1 /><div fontColor=#89ff83 outline=2,#000000> %s+%s</div>", slot13, slot14, slot15)
		} do
			slot6 = "" .. slot5[slot10] .. "  "
		end

		slot7 = createRichLabel(22, cc.c4b(255, 255, 255, 255), cc.p(1, 0.5), cc.p(679, 262), nil, , 600)

		slot0.main_container:addChild(slot7)
		slot7:setString(TI18N("<div fontColor=#ffffff outline=2,#000000>属性加成：</div>") .. slot6)
	end

	if slot2 then
		slot4 = {}

		for slot8, slot9 in pairs(slot2) do
			table.insert(slot4, {
				bid = slot9.bid,
				quantity = slot9.num
			})
		end

		if #slot4 > 4 then
			slot0.item_scrollview:setClickEnabled(true)
		else
			slot0.item_scrollview:setClickEnabled(false)
		end

		slot0.item_scrollview:setData(slot4)
		slot0.item_scrollview:addEndCallBack(function ()
			for slot4, slot5 in pairs(uv0.item_scrollview:getItemList()) do
				slot5:setDefaultTip()
			end
		end)
	end
end

function ActionBuySkinPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function ActionBuySkinPanel.DeleteMe(slot0)
	if slot0.buy_skin_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.buy_skin_ticket)

		slot0.buy_skin_ticket = nil
	end

	doStopAllActions(slot0.time_text)

	if slot0.bg_effect then
		slot0.bg_effect:clearTracks()
		slot0.bg_effect:removeFromParent()

		slot0.bg_effect = nil
	end

	if slot0.bg_load then
		slot0.bg_load:DeleteMe()

		slot0.bg_load = nil
	end

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.skin_buy_event then
		GlobalEvent:getInstance():UnBind(slot0.skin_buy_event)

		slot0.skin_buy_event = nil
	end
end
