VipPanel = class("VipPanel", function ()
	return ccui.Widget:create()
end)
slot0 = Config.ChargeData.data_supre_reward_data

function VipPanel.ctor(slot0)
	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function VipPanel.config(slot0)
	slot0.ctrl = VipController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.size = cc.size(660, 647)

	slot0:setContentSize(slot0.size)
	slot0:setAnchorPoint(cc.p(0, 0))

	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("vip/vip_panel"))

	slot0:addChild(slot0.root_wnd)
	slot0.root_wnd:setPositionY(-4)
	slot0:setCascadeOpacityEnabled(true)

	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.item_list = {}
	slot0.desc_list = {}
	slot0.super_card_status = nil

	slot0.ctrl:sender16707()
	slot0.ctrl:sender16710()
	slot0.ctrl:setIsFirst(false)
end

function VipPanel.layoutUI(slot0)
	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.chargeCon = slot0.main_container:getChildByName("chargeCon")
	slot0.goods_scroll = slot0.chargeCon:getChildByName("goods_scroll")
	slot0.item_scroll = createScrollView(390, 120, 10, 0, slot0.goods_scroll, ccui.ScrollViewDir.horizontal)

	slot0.item_scroll:setTouchEnabled(true)

	slot0.giftCon = slot0.chargeCon:getChildByName("giftCon")
	slot0.buy_btn = slot0.chargeCon:getChildByName("buy_btn")

	slot0.buy_btn:setVisible(true)

	slot0.buy_complete = slot0.chargeCon:getChildByName("buy_complete")

	slot0.buy_complete:setVisible(false)

	slot0.buy_btn_label = slot0.buy_btn:getChildByName("buy_btn_label")
	slot0.buy_red = slot0.buy_btn:getChildByName("red")

	slot0.buy_red:setVisible(false)

	slot0.info_scroll = createScrollView(slot0.giftCon:getContentSize().width, slot0.giftCon:getContentSize().height, 0, 0, slot0.giftCon, ccui.ScrollViewDir.vertical)
	slot0.title = slot0.chargeCon:getChildByName("title")
	slot0.old_price = createRichLabel(22, cc.c4b(50, 50, 50, 255), cc.p(0.5, 0), cc.p(slot0.buy_btn:getPositionX(), 96))

	slot0.chargeCon:addChild(slot0.old_price)

	slot0.buy_price = createRichLabel(24, 175, cc.p(0.5, 0.5), cc.p(slot0.buy_btn:getPositionX() - 63, 57))

	slot0.chargeCon:addChild(slot0.buy_price)

	slot0.supre_good_con = slot0.main_container:getChildByName("Sprite_1"):getChildByName("good_con")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.supre_good_con, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot0.supre_good_con:getContentSize(), {
		start_y = 6,
		start_x = 0,
		space_x = 10,
		row = 1,
		space_y = 0,
		col = 0,
		scale = 0.6,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.6,
		item_height = BackPackItem.Height * 0.6
	})

	slot0.item_scrollview:setSwallowTouches(false)

	slot0.supre_card_get = slot0.main_container:getChildByName("Sprite_1"):getChildByName("btn_get")

	slot0.supre_card_get:setVisible(false)

	slot0.supre_card_get_label = slot0.supre_card_get:getChildByName("Text_3_0")

	slot0.supre_card_get_label:setString(TI18N("领取"))

	slot0.des_labellist = {}

	slot0.chargeCon:getChildByName("gift_title"):setString(TI18N("特权礼包"))

	slot0.red_line = createSprite(PathTool.getResFrame("common", "common_1073"), 70, 14, slot0.old_price, cc.p(0.5, 0.5))
	slot0.desc_label = createRichLabel(22, cc.c4b(71, 44, 30, 255), cc.p(0.5, 0.5), cc.p(250, 450), nil, nil, 1000)

	slot0.main_container:addChild(slot0.desc_label)

	if slot0.role_vo.vip_lev > Config.VipData.data_get_reward_length - 1 then
		slot0:setData(Config.VipData.data_get_reward_length - 1)
	else
		slot0:setData(slot0.role_vo.vip_lev)
	end
end

function VipPanel.registerEvents(slot0)
	slot0.buy_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if RoleController:getInstance():getRoleVo().vip_lev == 0 and RoleController:getInstance():getRoleVo().is_vip == FALSE then
				if uv0.config.lev == 0 then
					uv0.ctrl:sender16711(uv0.index)
				else
					message(string.format(TI18N("未达到VIP%s"), uv0.config.lev))
				end
			elseif uv0.config then
				if slot2 < uv0.config.lev then
					message(string.format(TI18N("未达到VIP%s"), uv0.config.lev))
				else
					uv0.ctrl:sender16711(uv0.index)
				end
			end
		end
	end)

	if slot0.update_buy == nil then
		slot0.update_buy = GlobalEvent:getInstance():Bind(VipEvent.UPDATE_GET_LIST, function ()
			if uv0.model:getGetGiftList()[uv0.index] then
				uv0.buy_price:setVisible(false)
				uv0.buy_btn:setVisible(false)
				uv0.buy_complete:setVisible(true)
			else
				uv0.buy_price:setVisible(true)
				uv0.buy_btn:setVisible(true)
				uv0.buy_complete:setVisible(false)
			end

			uv0:updateRed()
		end)
	end

	if slot0.role_vo and slot0.role_update_event == nil then
		slot0.role_update_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "vip_lev" then
				uv0:updateRed()
			end
		end)
	end

	if slot0.supre_get_event == nil then
		slot0.supre_get_event = GlobalEvent:getInstance():Bind(VipEvent.SUPRE_CARD_GET, function (slot0)
			uv0.supre_card_get:setVisible(true)

			uv0.super_card_status = slot0

			if slot0 == 1 then
				setChildUnEnabled(false, uv0.supre_card_get)
				uv0.supre_card_get_label:enableOutline(cc.c4b(2, 0, 25, 255), 2)
				addRedPointToNodeByStatus(uv0.supre_card_get, true, 7, 10)
				uv0.supre_card_get_label:setString(TI18N("领取"))
			else
				addRedPointToNodeByStatus(uv0.supre_card_get, false)

				if slot0 == 0 then
					setChildUnEnabled(false, uv0.supre_card_get)
					uv0.supre_card_get_label:enableOutline(cc.c4b(2, 0, 25, 255), 2)
					uv0.supre_card_get_label:setString(TI18N("待激活"))
				else
					setChildUnEnabled(true, uv0.supre_card_get)
					uv0.supre_card_get_label:setString(TI18N("已领取"))
					uv0.supre_card_get_label:disableEffect()
				end
			end
		end)
	end

	registerButtonEventListener(slot0.supre_card_get, function ()
		if uv0.super_card_status then
			if uv0.super_card_status == 0 then
				JumpController:jumpViewByEvtData({
					44
				})
			else
				uv0.ctrl:sender16708()
			end
		end
	end, true, 1)
end

function VipPanel.updateRed(slot0)
	slot2 = #slot0.model:getGetGiftList()

	if slot0.index == slot0.role_vo.vip_lev then
		if slot1[slot0.index] == nil and slot0.ctrl:getIsFirst() then
			slot0.buy_red:setVisible(true)
		else
			slot0.buy_red:setVisible(false)
		end
	else
		slot0.buy_red:setVisible(false)
	end
end

function VipPanel.setData(slot0, slot1)
	if Config.VipData.data_get_reward[slot1] == nil then
		return
	end

	slot3 = {}

	for slot7, slot8 in pairs(uv0[slot1].reward) do
		table.insert(slot3, {
			bid = slot8[1],
			quantity = slot8[2]
		})
	end

	slot0.item_scrollview:setData(slot3)
	slot0.item_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.item_scrollview:getItemList()) do
			slot5:setDefaultTip()
		end
	end)

	slot0.config = slot2

	slot0.title:setString(TI18N("VIP") .. slot1 .. TI18N("特权"))

	slot0.index = slot1
	slot4 = RoleController:getInstance():getRoleVo().vip_lev
	slot5 = RoleController:getInstance():getRoleVo().is_vip
	slot6 = RoleController:getInstance():getRoleVo().vip_exp

	slot0.desc_label:setString(string.format(TI18N("累计充值<div fontcolor=#249013>%s </div><img src=%s scale=0.3 visible=true />即可享受以下特权"), slot0.config.gold, PathTool.getItemRes(Config.ItemData.data_assets_label2id.gold)))

	slot8 = slot2.items
	slot9 = slot2.spe_reward
	slot18 = math.max((BackPackItem.Width * 0.65 + 15) * #slot8, slot0.item_scroll:getContentSize().width)
	slot19 = slot0.item_scroll:getContentSize().height

	slot0.item_scroll:setInnerContainerSize(cc.size(slot18, slot19))
	slot0:clearItemList()

	function slot13(slot0)
		if uv0 and next(uv0 or {}) ~= nil then
			for slot4, slot5 in pairs(uv0) do
				if slot5 == slot0 then
					return true
				end
			end

			return false
		end
	end

	slot14 = nil

	for slot18, slot19 in pairs(slot8) do
		slot20 = slot19[1]
		slot21 = slot19[2]

		if not slot0.item_list[slot18] then
			slot22 = BackPackItem.new(true, true)
			slot22.bid = slot20
			slot0.item_list[slot18] = slot22

			slot0.item_scroll:addChild(slot22)
		end

		slot22 = deepCopy(Config.ItemData.data_get_data(slot20))
		slot22.quantity = slot21
		slot14 = slot0.item_list[slot18]

		slot14:setData(slot22)
		slot14:setAnchorPoint(0, 0.5)
		slot14:setVisible(true)
		slot14:setDefaultTip()
		slot14:setScale(slot10)
		slot14:setPosition(5 + (slot11 + 15) * (slot18 - 1), slot0.item_scroll:getContentSize().height / 2 - 10)

		if slot9 and next(slot9 or {}) ~= nil then
			if slot13(slot20) then
				if Config.ItemData.data_get_data(slot20).quality >= 4 then
					slot14:showItemEffect(true, 263, PlayerAction.action_1, true, 1.1)
				else
					slot14:showItemEffect(true, 263, PlayerAction.action_2, true, 1.1)
				end
			else
				slot14:showItemEffect(false)
			end
		end

		slot0.item_list[slot18] = slot14
	end

	slot15 = slot2.spe_desc
	slot22 = slot0.info_scroll:getContentSize().width
	slot23 = math.max(42 * #slot15, slot0.info_scroll:getContentSize().height)

	slot0.info_scroll:setInnerContainerSize(cc.size(slot22, slot23))

	slot18 = 0

	for slot22, slot23 in pairs(slot0.desc_list) do
		if #slot15 < slot22 then
			slot0.desc_list[slot22]:setVisible(false)
		else
			slot0.desc_list[slot22]:setVisible(true)
		end

		slot18 = slot18 + 1
	end

	for slot22, slot23 in pairs(slot15) do
		if slot0.desc_list[slot22] then
			slot0.desc_list[slot22]:setString(slot23)
			slot0.desc_list[slot22]:setPosition(5, slot16 + 10 - (slot0.desc_list[slot22]:getContentSize().height + 12) * slot22)
		else
			delayRun(slot0.info_scroll, 0.05 * (slot22 - slot18), function ()
				if not uv0.desc_list[uv1] then
					slot0 = createRichLabel(22, 58, cc.p(0, 0), cc.p(0, 0), 0, 0, uv0.info_scroll:getContentSize().width)
					uv0.desc_list[uv1] = slot0

					slot0:setString(uv2)
					uv0.info_scroll:addChild(slot0)
				else
					uv0.desc_list[uv1]:setString(uv2)
				end

				uv0.desc_list[uv1]:setPosition(5, uv3 + 10 - (uv0.desc_list[uv1]:getContentSize().height + 12) * uv1)
			end)
		end
	end

	slot0.buy_price:setString(string.format(TI18N("<img src=%s scale=0.3 visible=true />"), PathTool.getItemRes(Config.ItemData.data_get_data(slot2.price[1][1]).icon)))
	slot0.old_price:setString(string.format(TI18N("原价<img src=%s scale=0.3 visible=true />%s"), PathTool.getItemRes(Config.ItemData.data_get_data(slot2.old_price[1][1]).icon), slot2.old_price[1][2]))
	slot0.buy_btn_label:setString(string.format(TI18N("%d 购买"), slot2.price[1][2]))

	if slot0.model:getGetGiftList() and slot19[slot1] then
		slot0.buy_price:setVisible(false)
		slot0.buy_btn:setVisible(false)
		slot0.buy_complete:setVisible(true)
	else
		slot0.buy_price:setVisible(true)
		slot0.buy_btn:setVisible(true)
		slot0.buy_complete:setVisible(false)
	end

	slot0:updateRed()
end

function VipPanel.clearItemList(slot0)
	if slot0.item_list then
		for slot4, slot5 in pairs(slot0.item_list) do
			if not tolua.isnull(slot5) then
				slot5:setVisible(false)
			end
		end
	end
end

function VipPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function VipPanel.DeleteMe(slot0)
	for slot4, slot5 in pairs(slot0.item_list) do
		slot5:DeleteMe()
	end

	slot0.item_list = nil

	if slot0.update_buy then
		GlobalEvent:getInstance():UnBind(slot0.update_buy)

		slot0.update_buy = nil
	end

	if slot0.supre_get_event then
		GlobalEvent:getInstance():UnBind(slot0.supre_get_event)

		slot0.supre_get_event = nil
	end

	if slot0.role_vo then
		if slot0.role_update_event ~= nil then
			slot0.role_vo:UnBind(slot0.role_update_event)

			slot0.role_update_event = nil
		end

		slot0.role_vo = nil
	end
end
