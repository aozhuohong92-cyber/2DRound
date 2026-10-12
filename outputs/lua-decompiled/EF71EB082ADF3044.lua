ScoreShopItem = class("ScoreShopItem", function ()
	return ccui.Layout:create()
end)

function ScoreShopItem.ctor(slot0)
	slot0:configUI()
	slot0:registerEvent()
end

function ScoreShopItem.ctor(slot0)
	slot0.is_limit = false
	slot0.limit_have_num = 0
	slot0.lock_desc = ""
	slot0.ctrl = MallController:getInstance()
	slot0.role_vo = RoleController:getInstance():getRoleVo()

	slot0:configUI()
end

function ScoreShopItem.configUI(slot0, ...)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("mall/score_shop_item"))

	slot0:setAnchorPoint(cc.p(0, 1))
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(195, 236))
	slot0:setTouchEnabled(true)

	slot0.main_container = slot0.root_wnd:getChildByName("container")

	slot0.main_container:setTouchEnabled(true)
	slot0.main_container:setSwallowTouches(false)

	slot0.name = slot0.main_container:getChildByName("name_txt")
	slot0.coin = slot0.main_container:getChildByName("coin")
	slot0.price = slot0.main_container:getChildByName("price")
	slot0.goods_item = BackPackItem.new(true, true, nil, 0.9)

	slot0.goods_item:setPosition(slot0:getContentSize().width / 2, slot0:getContentSize().height / 2 + 25)
	slot0.main_container:addChild(slot0.goods_item)

	slot0.discount_label = createRichLabel(18, cc.c3b(24, 90, 3), cc.p(0.5, 0), cc.p(slot0:getContentSize().width / 2, 65))

	slot0.discount_label:setString(TI18N("限购xxx个"))
	slot0.main_container:addChild(slot0.discount_label)
	slot0.discount_label:setVisible(false)

	slot0.grey = slot0.main_container:getChildByName("got_shadow")

	slot0.grey:setLocalZOrder(20)
	slot0.grey:setVisible(false)

	slot0.need_icon = slot0.main_container:getChildByName("need_icon")
	slot0.need_label = slot0.main_container:getChildByName("need_label")

	slot0.need_icon:setVisible(false)
	slot0.need_label:setVisible(false)
	slot0:setSellAll(false)
	slot0:registerEvent()
end

function ScoreShopItem.setData(slot0, slot1)
	slot2 = nil
	slot2 = (not slot1.shop_type or slot1.shop_type) and slot1.type
	slot0.data = slot1

	if slot0.item_grid_bg then
		slot0.item_grid_bg:setVisible(false)
	end

	slot3, slot4 = nil

	if type(slot1.pay_type) == "number" then
		slot3 = Config.ItemData.data_get_data(slot1.pay_type)
		slot4 = Config.ItemData.data_assets_id2label[slot1.pay_type]
	else
		slot3 = Config.ItemData.data_get_data(Config.ItemData.data_assets_label2id[slot1.pay_type])
		slot4 = slot1.pay_type
	end

	if not slot3 then
		return
	end

	slot0.pay_type = slot4

	slot0.goods_item:setDefaultTip()
	slot0.goods_item:showTagIcon(false)
	slot0.goods_item:setBaseData(slot1.item_bid or slot1.item_id, slot1.item_num or 1)

	if slot0.goods_item.data then
		slot0.name:setString(slot0.goods_item.data.name)
	end

	if slot2 == MallConst.MallType.SkillShop then
		slot0.goods_item:showTagIcon(HeroController:getInstance():getModel():checkTalentIsLearnByBid(slot5), 1, 2)
	end

	slot0.price:setString(slot1.price)
	loadSpriteTexture(slot0.coin, PathTool.getItemRes(slot3.icon), LOADTEXT_TYPE)

	slot0.str = ""
	slot7 = 0
	slot8 = 0
	slot9 = 0
	slot10 = false
	slot0.rank_limit_flag = false

	if slot1.limit_rank and slot1.limit_rank > 0 and slot2 == MallConst.MallType.Ladder and (LadderController:getInstance():getModel():getLadderMyBaseInfo() and slot11.best_rank == 0 or slot1.limit_rank < slot11.best_rank) then
		slot8 = slot1.limit_rank
		slot10 = true
	end

	slot0.vip_limit_flag = 0

	if slot1.limit_vip and slot1.limit_vip > 0 and slot0.role_vo and slot0.role_vo.vip_lev < slot1.limit_vip then
		slot10 = true
		slot9 = slot1.limit_vip
	end

	if slot10 == false then
		if slot1.limit_count and slot1.limit_count > 0 then
			slot0.str = "限购"
			slot7 = slot1.limit_count
			slot10 = true
		elseif slot1.limit_month and slot1.limit_month > 0 then
			slot0.str = "每月限购"
			slot7 = slot1.limit_month
			slot10 = true
		elseif slot1.limit_week and slot1.limit_week > 0 then
			slot0.str = "每周限购"
			slot7 = slot1.limit_week
			slot10 = true
		elseif slot1.limit_day and slot1.limit_day > 0 then
			slot0.str = "每日限购"
			slot7 = slot1.limit_day
			slot10 = true
		elseif slot1.shop_type == 4 or slot1.shop_type == 2 then
			slot7 = 1
			slot10 = false
		elseif slot4 ~= "red_gold_or_gold" then
			if slot0.role_vo[slot4] and slot0.role_vo[slot4] < 20 * slot1.price then
				if math.floor(slot0.role_vo[slot4] / slot1.price) >= 1 then
					slot7 = slot11
				else
					slot7 = 1
				end
			else
				slot7 = 20
				slot10 = false
			end
		elseif slot0.role_vo.gold + slot0.role_vo.red_gold and slot11 < 20 * slot1.price then
			if math.floor(slot11 / slot1.price) >= 1 then
				slot7 = slot12
			else
				slot7 = 1
			end
		else
			slot7 = 20
			slot10 = false
		end
	end

	if slot9 > 0 and slot10 then
		slot0.discount_label:setVisible(true)
		slot0.discount_label:setString(string.format(TI18N("VIP %d 专属"), slot9))
		slot0:setSellAll(false)

		slot0.vip_limit_flag = slot9
	elseif slot7 > 0 and slot10 then
		slot0.discount_label:setVisible(true)
		slot0.discount_label:setString(string.format(TI18N("%s %s/%s 个"), slot0.str, slot1.has_buy, slot7))

		if slot1.has_buy == slot7 then
			slot0:setSellAll(true)
		else
			slot0:setSellAll(false)
		end
	elseif slot8 > 0 and slot10 then
		slot0.discount_label:setVisible(true)
		slot0.discount_label:setString(string.format(TI18N("需达到%d名"), slot8))
		slot0:setSellAll(false)

		slot0.rank_limit_flag = true
	else
		slot0.discount_label:setVisible(false)

		if slot1.has_buy == 1 then
			slot0:setSellAll(true)
		else
			slot0:setSellAll(false)
		end
	end

	slot0.data.limit_num = slot7
	slot0.data.is_show_limit_label = slot10

	if slot1.discount and slot1.discount > 0 then
		slot0.price:setString(slot1.discount)
	end

	if slot0.data.type == 10 or slot0.data.type == 11 or slot0.data.type == 12 or slot0.data.type == 13 then
		slot0:isShowLevLimit(true, slot0.data.lev)
	else
		slot0:isShowLevLimit(false)
	end

	if slot0.data.type == 5 and slot0.data.glev then
		slot0:isShowGLevLimit(true, slot0.data.glev)
	else
		slot0:isShowGLevLimit(false, 0)
	end

	if slot0.ctrl:getNeedBid() ~= nil and (slot11 == slot1.item_id or slot11 == slot1.item_bid) then
		slot0.need_icon:setVisible(true)
		slot0.need_label:setVisible(true)
	else
		slot0.need_icon:setVisible(false)
		slot0.need_label:setVisible(false)
	end

	if slot0.data.type == 3 then
		slot0:showChipTag(slot0.ctrl:getModel():checkHeroChips(slot1.item_id))
	else
		slot0:showChipTag(false)
	end
end

function ScoreShopItem.showChipTag(slot0, slot1)
	if not slot0.tag_point and slot1 == false then
		return
	end

	if not slot0.tag_point then
		slot0.tag_point = createImage(slot0.main_container, PathTool.getResFrame("common", "txt_cn_common_30016"), 8, 132, cc.p(0, 1), true, 10, false)

		slot0.tag_point:setScale(1)
	end

	slot0.tag_point:setVisible(slot1)
end

function ScoreShopItem.isShowLevLimit(slot0, slot1, slot2)
	if not slot0.limit_lev_label then
		slot0.limit_lev_label = createRichLabel(20, 58, cc.p(0, 0), cc.p(133, 25))

		slot0.limit_lev_label:setString(TI18N("xx级可购买"))
		slot0.main_container:addChild(slot0.limit_lev_label)
	end

	slot3 = RoleController:getInstance():getRoleVo().lev

	slot0.limit_lev_label:setVisible(slot1)

	if slot1 == true then
		slot4 = 0

		if slot2[1] and slot2[1] then
			slot4 = slot2[1] or 0
		end

		if slot0.limit_lev_label then
			if slot3 < slot4 then
				slot0.limit_lev_label:setString(string.format(TI18N("<div fontcolor=#289b14>%s</div>级可购买"), slot4))
			else
				slot0.limit_lev_label:setString("")
			end
		end
	end
end

function ScoreShopItem.isShowGLevLimit(slot0, slot1, slot2)
	if slot2 <= RoleController:getInstance():getRoleVo().guild_lev then
		slot1 = false
	end

	slot0.limit_glev_status = slot1

	if slot0.limit_glev_layer == nil and slot1 == false then
		return
	end

	if not slot0.limit_glev_layer then
		slot0.limit_glev_layer = createSprite(PathTool.getResFrame("common", "common_90056"), 211, 30, slot0.main_container)

		slot0.limit_glev_layer:setLocalZOrder(9999)
		slot0.limit_glev_layer:setScaleX(0.5)
		slot0.limit_glev_layer:setScaleY(0.6)

		slot0.limit_glev_label = createRichLabel(20, 58, cc.p(0, 0), cc.p(155, 17))

		slot0.main_container:addChild(slot0.limit_glev_label, 9999)
	end

	slot0.limit_glev_layer:setVisible(slot1)
	slot0.limit_glev_label:setVisible(slot1)
	slot0.limit_glev_label:setString(string.format(TI18N("<div fontcolor=#ffffff outline=2,#d95014>公会%s级解锁</div>"), slot2))
	slot0.grey:setVisible(slot1)

	slot0.limit_glev_status = slot1
end

function ScoreShopItem.setSellAll(slot0, slot1)
	slot0.grey:setVisible(slot1)
	slot0:setTouchEnabled(not slot1)
end

function ScoreShopItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function ScoreShopItem.registerEvent(slot0)
	slot0:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0.touch_end = slot0:getTouchEndPosition()
			slot2 = true

			if uv0.touch_began ~= nil then
				slot2 = math.abs(uv0.touch_end.x - uv0.touch_began.x) <= 20 and math.abs(uv0.touch_end.y - uv0.touch_began.y) <= 20
			end

			if slot2 == true then
				playButtonSound2()

				if uv0.vip_limit_flag > 0 then
					message(string.format(TI18N("VIP%d以上可购买"), uv0.vip_limit_flag))

					return
				end

				if uv0.rank_limit_flag then
					message(TI18N("未满足购买条件"))

					return
				end

				if uv0.limit_glev_status then
					message(TI18N("该商品暂未达解锁条件哦，请努力提高公会等级"))

					return
				end

				if uv0.callback then
					uv0:callback()
				end
			end
		elseif slot1 == ccui.TouchEventType.moved then
			-- Nothing
		elseif slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()
		elseif slot1 == ccui.TouchEventType.canceled then
			-- Nothing
		end
	end)

	if not slot0.buy_success_event then
		slot0.buy_success_event = GlobalEvent:getInstance():Bind(MallEvent.Buy_Success_Event, function (slot0)
			if not slot0 or not uv0.data then
				return
			end

			if uv0.data.id and slot0.eid == uv0.data.id and next(slot0.ext or {}) ~= nil then
				uv0.data.has_buy = slot0.ext[1].val

				uv0.discount_label:setString(string.format(TI18N("%s %s/%s 个"), uv0.str, uv0.data.has_buy, uv0.data.limit_num))

				if uv0.data.has_buy == uv0.data.limit_num then
					uv0:setSellAll(true)
				end
			end
		end)
	end

	if not slot0.buy_success_shenmi then
		slot0.buy_success_shenmi = GlobalEvent:getInstance():Bind(MallEvent.Buy_One_Success, function (slot0)
			if not slot0 or not uv0.data then
				return
			end

			uv0:buyOneSuccess(slot0)
		end)
	end

	if slot0.role_vo and slot0.role_update_event == nil then
		slot0.role_update_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if not uv0.data then
				return
			end

			if (slot0 == "gold" or slot0 == "red_gold" or slot0 == "hero_soul" or slot0 == "arena_cent" or slot0 == "friend_point" or slot0 == "guild") and uv0.data.limit_day == 0 and uv0.data.limit_month == 0 and uv0.data.limit_week == 0 and uv0.data.limit_count == 0 and uv0.data.shop_type ~= 4 and uv0.data.shop_type ~= 2 then
				if uv0.pay_type ~= "red_gold_or_gold" then
					if uv0.role_vo[uv0.pay_type] and uv0.role_vo[uv0.pay_type] < 20 * uv0.data.price then
						if math.floor(uv0.role_vo[uv0.pay_type] / uv0.data.price) >= 1 then
							uv0.data.limit_num = slot2
						else
							uv0.data.limit_num = 1
						end
					else
						uv0.data.limit_num = 20
					end
				elseif uv0.role_vo.gold + uv0.role_vo.red_gold and slot2 < 20 * uv0.data.price then
					if math.floor(slot2 / uv0.data.price) >= 1 then
						uv0.data.limit_num = slot3
					else
						uv0.data.limit_num = 1
					end
				else
					uv0.data.limit_num = 20
				end
			end
		end)
	end
end

function ScoreShopItem.buyOneSuccess(slot0, slot1)
	slot2 = nil

	if ((not slot0.data.shop_type or slot0.data.shop_type) and slot0.data.type) == nil then
		return
	end

	if slot2 == slot1.type and slot0.data.order and slot1.order == slot0.data.order then
		if not slot0.data.has_buy then
			slot0.data.has_buy = slot1.num or 1
		else
			slot0.data.has_buy = slot0.data.has_buy + (slot1.num or 1)
		end

		slot0.discount_label:setString(string.format(TI18N("%s %s/%s 个"), slot0.str, slot0.data.has_buy, slot0.data.limit_num))

		if not slot0.data.limit_count or slot3 == 0 then
			slot3 = slot0.data.limit_num
		end

		if slot3 and slot3 <= slot0.data.has_buy then
			slot0:setSellAll(true)
		end
	end
end

function ScoreShopItem.getData(slot0)
	return slot0.data
end

function ScoreShopItem.createItemBgSprite(slot0)
	if not slot0.item_grid_bg then
		slot0.item_grid_bg = createSprite(PathTool.getPlistImgForDownLoad("bigbg/mall", "skin_bg_3"), -30, 30, slot0, cc.p(0, 1), LOADTEXT_TYPE, -1)
	end

	slot0.item_grid_bg:setVisible(true)
end

function ScoreShopItem.DeleteMe(slot0)
	if slot0.buy_success_event then
		GlobalEvent:getInstance():UnBind(slot0.buy_success_event)

		slot0.buy_success_event = nil
	end

	if slot0.buy_success_shenmi then
		GlobalEvent:getInstance():UnBind(slot0.buy_success_shenmi)

		slot0.buy_success_shenmi = nil
	end

	if slot0.goods_item then
		slot0.goods_item:DeleteMe()
	end

	if slot0.role_vo then
		if slot0.role_update_event ~= nil then
			slot0.role_vo:UnBind(slot0.role_update_event)

			slot0.role_update_event = nil
		end

		slot0.role_vo = nil
	end

	doStopAllActions(slot0.name)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
