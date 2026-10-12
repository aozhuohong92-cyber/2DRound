WeekCardTips = WeekCardTips or BaseClass(BaseView)
slot0 = TipsManager:getInstance()

function WeekCardTips.__init(slot0)
	slot0.is_full_screen = false
	slot0.layout_name = "tips/week_card_tips"
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("tips", "tips"),
			type = ResourcesType.plist
		}
	}
	slot0.item_list = {}
end

function WeekCardTips.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")

	slot0.main_panel:getChildByName("week_card_spr"):setLocalZOrder(10)

	slot0.text_name = slot0.main_panel:getChildByName("text_name")

	slot0.text_name:setString("")
	slot0.main_panel:getChildByName("name_0"):setString(TI18N("类型："))

	slot0.text_type = slot0.main_panel:getChildByName("text_type")

	slot0.text_type:setString("")
	slot0.main_panel:getChildByName("Text_1"):setString(TI18N("立即获取"))
	slot0.main_panel:getChildByName("Text_1_0"):setString(TI18N("持续七天，每天登录领取"))

	slot0.btn_close = slot0.main_panel:getChildByName("btn_close")
	slot0.tips_desc = createRichLabel(22, cc.c4b(255, 255, 248, 255), cc.p(0, 0.5), cc.p(15, 378), nil, nil, 400)

	slot0.main_panel:addChild(slot0.tips_desc)
end

function WeekCardTips.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:showWeekCardTips(false)
	end, false, 2)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:showWeekCardTips(false)
	end, false, 2)
end

function WeekCardTips.openRootWnd(slot0, slot1)
	if not slot1 then
		-- Nothing
	end

	slot0:setData(slot1)
end

function WeekCardTips.setData(slot0, slot1)
	slot0.text_name:setString(slot1.name or "")
	slot0.text_type:setString(slot1.type_desc or "")
	slot0:setShowItem(slot1)
end

function WeekCardTips.setShowItem(slot0, slot1)
	if slot1.id then
		slot0.goods_tips = BackPackItem.new(true, true, nil, 1, false)

		slot0.goods_tips:setPosition(cc.p(78, 483))
		slot0.main_panel:addChild(slot0.goods_tips)
		slot0.goods_tips:setBaseData(slot1.id)

		if not Config.GiftData.data_week_card_data then
			return
		end

		if slot2[slot1.id] then
			slot0.tips_desc:setString(slot3.weekcard_desc)

			if slot3.reward and slot3.reward[1] and slot3.reward[1][1] then
				slot0:setGoodsData(1, slot3.reward[1][1], slot3.reward[1][2] or 1, cc.p(128, 229), {
					188,
					228
				})
			end

			if slot3.mail_reward and slot3.mail_reward[1] and slot3.mail_reward[1][1] then
				slot0:setGoodsData(2, slot3.mail_reward[1][1], slot3.mail_reward[1][2] or 1, cc.p(128, 66), {
					188,
					62
				})
			end
		end
	end
end

function WeekCardTips.setGoodsData(slot0, slot1, slot2, slot3, slot4, slot5)
	if not slot0.item_list[slot1] then
		slot0.item_list[slot1] = BackPackItem.new(true, true, nil, 0.8, false)

		slot0.item_list[slot1]:setPosition(slot4)
		slot0.main_panel:addChild(slot0.item_list[slot1])
	end

	slot0.item_list[slot1]:setBaseData(slot2, slot3)
	createLabel(22, cc.c4b(255, 238, 221, 255), nil, slot5[1], slot5[2], "", slot0.main_panel, nil, cc.p(0, 0.5)):setString(Config.ItemData.data_get_data(slot2).name .. " x " .. slot3)
end

function WeekCardTips.close_callback(slot0)
	if slot0.goods_tips then
		slot0.goods_tips:DeleteMe()
	end

	slot0.goods_tips = nil

	if slot0.item_list and next(slot0.item_list or {}) ~= nil then
		for slot4, slot5 in ipairs(slot0.item_list) do
			if slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end
	end

	uv0:showWeekCardTips(false)
end
