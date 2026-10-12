ItemExhibitionList = ItemExhibitionList or class("ItemExhibitionList", function ()
	return ccui.Widget:create()
end)
ItemExhibitionList.WIDTH = 119
ItemExhibitionList.HEIGHT = 119

function ItemExhibitionList.ctor(slot0)
	slot0.is_play = true
	slot0.size = cc.size(ItemExhibitionList.WIDTH, ItemExhibitionList.HEIGHT)

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot0:setCascadeOpacityEnabled(true)
	slot0:registerEvent()
end

function ItemExhibitionList.registerEvent(slot0)
	slot0:registerScriptHandler(function (slot0)
		if slot0 == "enter" then
			if uv0.is_play == true then
				uv0:setOpacity(0)
				uv0:setScale(2)
				uv0:runAction(cc.Spawn:create(cc.FadeIn:create(0.1), cc.ScaleTo:create(0.1, 1)))
			end
		elseif slot0 == "exit" then
			-- Nothing
		end
	end)
end

function ItemExhibitionList.setData(slot0, slot1, slot2)
	if (slot1.show_type or MainuiConst.item_exhibition_type.item_type) == MainuiConst.item_exhibition_type.item_type then
		slot0:showItemUI(slot1, slot2)
	elseif slot3 == MainuiConst.item_exhibition_type.partner_type then
		slot0:showPartnerUI(slot1, slot2)
	else
		print(TI18N("ItemExhibitionList类型出错:%s"), tostring(slot3))
	end
end

function ItemExhibitionList.showItemUI(slot0, slot1, slot2)
	slot3 = slot1.bid or slot1.base_id

	if slot1 == nil or slot3 == nil then
		return
	end

	slot4, slot5, slot6 = nil

	if Config.ItemData.data_get_data(slot3) == nil then
		return
	end

	slot7 = slot6.effect or {}

	if slot6 ~= nil then
		slot4 = slot6.quality
		slot5 = slot6.name

		if not slot0.item then
			slot0.item = BackPackItem.new(true, true)

			if slot6.sub_type == BackPackConst.item_tab_type.HOLYEQUIPMENT then
				if BackpackController:getModel():getBagItemById(BackPackConst.Bag_Code.EQUIPS, slot1.id) then
					slot0.item:addCallBack(function ()
						HeroController:getInstance():openEquipTips(true, uv0)
					end)
				else
					slot0.item:setDefaultTip(true)
				end
			elseif slot6.type == BackPackConst.item_type.ARTIFACTCHIPS and BackpackController:getModel():getBackPackItemById(slot1.id) then
				slot0.item:addCallBack(function ()
					HeroController:getInstance():openArtifactTipsWindow(true, uv0, PartnerConst.ArtifactTips.normal)
				end)
			else
				slot0.item:setDefaultTip(true)
			end

			slot0.item:setPosition(0, 0)
			slot0.item:setAnchorPoint(cc.p(0, 0))
			slot0:addChild(slot0.item)
		end

		if slot0.item then
			slot8 = slot1.is_effect

			if slot2 and next(slot2 or {}) ~= nil and slot2.is_backpack == true then
				slot0.item:setBaseData(slot3, slot1.val or slot1.num)
			else
				slot0.item:setData({
					base_id = slot3,
					id = slot1.id,
					quantity = slot1.num,
					config = slot6,
					is_effect = slot1.is_effect or false
				}, nil, slot8)
			end

			if slot3 == Config.ItemData.data_assets_label2id.expedition_medal then
				if PlanesafkController and PlanesafkController:getInstance():getModel():isHolidayOpen() then
					slot0.item:holidHeroExpeditTag(true, TI18N("限时提升"))
				else
					slot0.item:holidHeroExpeditTag(false)
				end
			else
				slot0.item:holidHeroExpeditTag(false)
			end
		end
	end

	if slot4 ~= nil and slot5 ~= nil and slot0.item then
		slot0.item:setExtendDesc(true, slot5, BackPackConst.quality_color_id[slot4])
	end
end

function ItemExhibitionList.showPartnerUI(slot0, slot1, slot2)
	if not slot1.bid then
		return
	end

	if not Config.PartnerData.data_partner_base[slot1.bid] then
		return
	end

	slot0.item = HeroExhibitionItem.new(1, true)

	slot0.item:addCallBack(function ()
		if uv0.rid and uv0.srv_id then
			HeroController:getInstance():openHeroTipsPanel(true, uv0)
		else
			HeroController:getInstance():openHeroTipsPanelByBid(uv0.bid)
		end
	end)
	slot0.item:setPosition(0, 0)
	slot0.item:setAnchorPoint(cc.p(0, 0))
	slot0.item:setData(slot1)
	slot0:addChild(slot0.item)

	if (slot1.star or slot3.init_star) - 1 > 5 then
		slot4 = 5
	end
end

function ItemExhibitionList.showName(slot0, slot1)
end

function ItemExhibitionList.getRootWnd(slot0)
	if not tolua.isnull(slot0.item) then
		-- Nothing
	end
end

function ItemExhibitionList.setNewNamePosition(slot0, slot1, slot2)
end

function ItemExhibitionList.DeleteMe(slot0)
	slot0:stopAllActions()

	if slot0.item then
		slot0.item:DeleteMe()

		slot0.item = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
