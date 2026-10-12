ArenaLoopChallengeBuy = ArenaLoopChallengeBuy or BaseClass(BaseView)
slot0 = ArenaController:getInstance()
slot1 = RoleController:getInstance():getRoleVo()

function ArenaLoopChallengeBuy.__init(slot0)
	slot0.is_full_screen = false
	slot0.title_str = ""
	slot0.layout_name = "arena/arean_loop_challenge_buy"
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.change_num = 1
	slot0.init_change_num = 1
end

function ArenaLoopChallengeBuy.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.btn_close = slot0.main_container:getChildByName("btn_close")
	slot0.title_txt = slot0.main_container:getChildByName("Sprite_1"):getChildByName("Text_1")

	slot0.title_txt:setString(TI18N("道具购买"))

	slot0.item_name = slot0.main_container:getChildByName("Text_2")

	slot0.main_container:getChildByName("cost_title"):setString(TI18N("共花费:"))

	slot0.buy_tips = slot0.main_container:getChildByName("buy_tips")

	slot0.buy_tips:setVisible(false)

	slot0.gold_change = slot0.main_container:getChildByName("gold_change")
	slot0.buy_num = slot0.main_container:getChildByName("Image_num"):getChildByName("buy_num")
	slot0.btn_buy = slot0.main_container:getChildByName("btn_buy")

	slot0.btn_buy:getChildByName("Text_3"):setString(TI18N("确定"))

	slot0.btn_redu = slot0.main_container:getChildByName("btn_redu")
	slot0.btn_add = slot0.main_container:getChildByName("btn_add")
	slot0.edit_content = createEditBox(slot0.main_container, PathTool.getResFrame("common", "common_99998"), cc.size(90, 36), Config.ColorData.data_color4[175], 26, Config.ColorData.data_color4[175], 26, "", nil, , LOADTEXT_TYPE_PLIST)

	slot0.edit_content:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.edit_content:setPosition(cc.p(320, 209))

	slot1 = false

	slot0.edit_content:registerScriptEditBoxHandler(function (slot0, slot1)
		if slot0 == "return" or slot0 == "ended" then
			if uv0 then
				uv0 = false

				uv1.buy_num:setVisible(true)
				slot1:setText("")

				if slot1:getText() ~= "" and slot2 ~= uv1.input_text then
					if tonumber(slot2) ~= nil and slot3 >= 0 then
						uv1:showEditNum(slot3)
					else
						uv1:showEditNum(uv1.change_num)
						message(TI18N("请输入数字"))
					end
				else
					uv1:showEditNum(uv1.change_num)
				end
			end
		elseif slot0 == "began" then
			if not uv0 then
				uv1.buy_num:setVisible(false)

				uv0 = true
			end
		elseif slot0 == "changed" then
			-- Nothing
		end
	end)

	slot0.cost_icon = slot0.main_container:getChildByName("icon")

	slot0.cost_icon:setScale(0.3)
end

function ArenaLoopChallengeBuy.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openArenaLoopChallengeBuy(false)
	end, false, 2)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openArenaLoopChallengeBuy(false)
	end, true, 2)
	registerButtonEventListener(slot0.btn_redu, function ()
		slot0 = uv0.gold

		if uv1.cost_item_key and uv1.cost_item_key ~= "gold" then
			slot0 = uv0[uv1.cost_item_key] or 0
		end

		if slot0 <= 0 then
			message(TI18N("数量不足"))

			return
		end

		uv1.change_num = uv1.change_num - 1

		if uv1.change_num <= 0 then
			uv1.change_num = 1

			message(TI18N("购买数量不能为0"))
		end

		uv1.richlabel_num:setString(string.format(TI18N("<div fontcolor=#fff6e4>%s /</div><div fontcolor=#84e766> %s</div>"), MoneyTool.GetMoneyString(slot0), MoneyTool.GetMoneyString(uv1.expend_num * uv1.change_num)))
		uv1.buy_num:setString(uv1.change_num)
	end, true, 1)
	registerButtonEventListener(slot0.btn_add, function ()
		slot0 = uv0.gold

		if uv1.cost_item_key and uv1.cost_item_key ~= "gold" then
			slot0 = uv0[uv1.cost_item_key] or 0
		end

		if slot0 <= 0 then
			message(TI18N("数量不足"))

			return
		end

		uv1.change_num = uv1.change_num + 1

		if uv1.init_change_num <= uv1.change_num then
			uv1.change_num = uv1.init_change_num

			message(TI18N("已达最大购买值"))
		end

		uv1.richlabel_num:setString(string.format(TI18N("<div fontcolor=#fff6e4>%s /</div><div fontcolor=#84e766> %s</div>"), MoneyTool.GetMoneyString(slot0), MoneyTool.GetMoneyString(uv1.expend_num * uv1.change_num)))
		uv1.buy_num:setString(uv1.change_num)
	end, true, 1)
	registerButtonEventListener(slot0.btn_buy, function ()
		if uv0.change_num <= 0 then
			message(TI18N("购买数量不能为0"))

			return
		end

		if uv0.view_type == ArenaConst.view_type.summon then
			EliteSummonController:getInstance():send16692(uv0.change_num)
		elseif uv0.view_type == ArenaConst.view_type.elfin then
			if uv0.extra_data then
				ElfinController:getInstance():sender26507(uv0.extra_data, uv0.item_bid, uv0.change_num)
				uv1:openArenaLoopChallengeBuy(false)
			end
		else
			uv1:sender20207(uv0.change_num)
		end
	end, true, 1)
end

function ArenaLoopChallengeBuy.showEditNum(slot0, slot1)
	if not slot1 then
		return
	end

	if slot1 <= 0 then
		slot1 = slot0.change_num

		message(TI18N("购买数量不能为0"))
	elseif slot0.init_change_num <= slot1 then
		slot1 = slot0.init_change_num

		message(TI18N("已达最大购买值"))
	end

	slot0.change_num = slot1

	slot0.buy_num:setString(slot1)
	slot0.buy_num:setVisible(true)

	slot2 = uv0.gold

	if slot0.cost_item_key and slot0.cost_item_key ~= "gold" then
		slot2 = uv0[slot0.cost_item_key] or 0
	end

	slot0.richlabel_num:setString(string.format(TI18N("<div fontcolor=#fff6e4>%s /</div><div fontcolor=#84e766> %s</div>"), MoneyTool.GetMoneyString(slot2), MoneyTool.GetMoneyString(slot0.expend_num * slot0.change_num)))
end

function ArenaLoopChallengeBuy.openRootWnd(slot0, slot1)
	slot1 = slot1 or {}
	slot0.item_bid = slot1.item_bid
	slot0.view_type = slot1.view_type or ArenaConst.view_type.arena
	slot0.extra_data = slot1.extra_data

	if slot0.view_type == ArenaConst.view_type.arena then
		slot0.title_txt:setString(TI18N("道具购买"))
		slot0.buy_tips:setVisible(false)
	elseif slot0.view_type == ArenaConst.view_type.elfin then
		slot0.title_txt:setString(TI18N("快速补充"))

		if slot1.tips_str then
			slot0.buy_tips:setVisible(true)
			slot0.buy_tips:setString(slot1.tips_str)
		end
	end

	slot0.expend_num = Config.ArenaData.data_const.ticket_price.val[1][2]

	if slot1.item_price then
		slot0.expend_num = slot1.item_price
	end

	slot2 = Config.ArenaData.data_const
	slot0.goods_item = BackPackItem.new(true, true)

	slot0.main_container:addChild(slot0.goods_item)
	slot0.goods_item:setPosition(cc.p(slot0.main_container:getContentSize().width / 2, 307))

	if slot0.item_bid then
		slot3 = Config.ItemData.data_get_data(slot0.item_bid)

		slot0.item_name:setString(slot3.name)
		slot0.item_name:setTextColor(BackPackConst.getWhiteQualityColorC4B(slot3.quality))
		slot0.goods_item:setBaseData(slot0.item_bid)
	else
		slot0.item_name:setString(TI18N("竞技挑战劵"))
		slot0.goods_item:setBaseData(Config.ItemData.data_get_data(Config.ArenaData.data_const.arena_ticketcost.val[1][1]).icon)
	end

	slot0.richlabel_num = createRichLabel(26, cc.c4b(255, 246, 228, 255), cc.p(0.5, 0.5), cc.p(slot0.gold_change:getContentSize().width * 0.5 + 10, slot0.gold_change:getContentSize().height * 0.5), nil, , 250)

	slot0.gold_change:addChild(slot0.richlabel_num)

	if slot1.cost_item_id then
		slot0.cost_item_key = Config.ItemData.data_assets_id2label[slot1.cost_item_id]

		loadSpriteTexture(slot0.cost_icon, PathTool.getItemRes(Config.ItemData.data_get_data(slot1.cost_item_id).icon), LOADTEXT_TYPE)
	else
		slot0.cost_item_key = "gold"

		loadSpriteTexture(slot0.cost_icon, PathTool.getItemRes(Config.ItemData.data_get_data(Config.ArenaData.data_const.ticket_price.val[1][1]).icon), LOADTEXT_TYPE)
	end

	slot3 = uv0.gold

	if slot0.cost_item_key and slot0.cost_item_key ~= "gold" then
		slot3 = uv0[slot0.cost_item_key] or 0
	end

	slot0.richlabel_num:setString(string.format(TI18N("<div fontcolor=#fff6e4>%s /</div><div fontcolor=#84e766> %s</div>"), MoneyTool.GetMoneyString(slot3), MoneyTool.GetMoneyString(slot0.expend_num)))

	slot0.init_change_num = math.floor(slot3 / Config.ArenaData.data_const.ticket_price.val[1][2])

	if slot1.max_buy_num and slot1.max_buy_num < slot0.init_change_num then
		slot0.init_change_num = slot1.max_buy_num
	end

	if slot0.init_change_num < 1 then
		slot0.init_change_num = 1
	end

	if Config.ArenaData.data_const.ticket_price.val[1][2] <= slot3 then
		slot0.change_num = 1
	end

	slot0.buy_num:setString(slot0.change_num)
end

function ArenaLoopChallengeBuy.close_callback(slot0)
	if slot0.goods_item then
		slot0.goods_item:DeleteMe()
	end

	slot0.goods_item = nil

	uv0:openArenaLoopChallengeBuy(false)
end
