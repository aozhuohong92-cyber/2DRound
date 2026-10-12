GoodsBaseTips = GoodsBaseTips or BaseClass(CommonUI)

function GoodsBaseTips.__init(slot0)
	slot0.WIDTH = 418
	slot0.title_space = 30
	slot0.space_x = 28
	slot0.arrow_x = 275
end

function GoodsBaseTips.setDataVo(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0.vo = slot1
	slot0.goods_vo = goods_vo
	slot0.partner_id = slot5

	slot0:initMainView(slot1, slot2, slot3, slot4)
end

function GoodsBaseTips.initMainView(slot0, slot1, slot2, slot3, slot4)
	slot0:clearMainContainer()
	slot0:createBackground()
	slot0:setDescription(slot1)
	slot0:setBaseMessage(slot1, slot3, slot4)
	slot0:setTitle()
	slot0:adjustPosition()
end

function GoodsBaseTips.setDescription(slot0, slot1)
	slot0.descript_container = ccui.Widget:create()

	slot0.descript_container:setContentSize(cc.size(slot0.WIDTH, 0))
	slot0.descript_container:setAnchorPoint(cc.p(0, 0))
	slot0:getMainContainer():addChild(slot0.descript_container)

	slot4 = nil
	slot5 = ""
	slot4 = Config.ItemData.data_get_data(slot1.base_id)
	slot5 = slot4.desc

	if slot4 == nil then
		return
	end

	slot0.change_desc_label = createRichLabel(20, Config.ColorData.data_color4[27], cc.p(0, 0), cc.p(slot0.space_x, 62), nil, , 350)

	slot0.change_desc_label:setString(slot5)
	slot0.descript_container:addChild(slot0.change_desc_label)

	if slot0.change_desc_label:getContentSize().height > 0 then
		slot2 = slot2 + slot0.change_desc_label:getContentSize().height + 2 + 14
	end

	if slot2 > 0 then
		slot2 = slot2 + 70
	end

	slot0.descript_container:setContentSize(cc.size(slot0.WIDTH, slot2))
end

function GoodsBaseTips.setBaseMessage(slot0, slot1, slot2, slot3)
	slot0.msg_container = ccui.Widget:create()

	slot0.msg_container:setContentSize(cc.size(slot0.WIDTH, 0))
	slot0.msg_container:setAnchorPoint(cc.p(0, 0))
	slot0:getMainContainer():addChild(slot0.msg_container)

	slot5 = slot1.base_id
	slot6 = BackPackItem.new(false, false, false, 1, false)

	slot6:setPosition(30, -1)
	slot6:setBaseData(slot5)
	slot0.msg_container:addChild(slot6)

	slot8 = Config.ItemData.data_get_data(slot5)
	slot9 = 95
	slot10 = slot0:createLabel(24, 3, 147, slot9)

	slot10:setString(slot8.name)
	slot10:setTextColor(BackPackConst.quality_color[slot8.quality])
	slot0.msg_container:addChild(slot10)

	slot11 = createScale9Sprite(PathTool.getResFrame("common", "common_1016"), 10, slot9 - 112)

	slot11:setContentSize(cc.size(slot0.WIDTH - 20, 2))
	slot11:setAnchorPoint(cc.p(0, 0))
	slot0.msg_container:addChild(slot11, -1)

	if slot2 then
		slot12 = slot0:createLabel(22, 5, slot10:getPositionX() + slot10:getContentSize().width + 5, slot9)

		slot12:setString(string.format("X%s", slot2))
		slot12:setTextColor(BackPackConst.quality_color[slot8.quality + 1])
		slot0.msg_container:addChild(slot12)
	end

	slot12 = false

	if not CommonGoodsType.isAsset(slot5) then
		slot10 = slot0:createLabel(20, 27, slot7, slot9 - 5 - 29 - 3)

		slot10:setString(TI18N("拥有："))
		slot0.msg_container:addChild(slot10)

		slot0.own_label = slot10
		slot13 = 0
		slot15 = slot0:createLabel(20, 27, slot10:getPositionX() + slot10:getContentSize().width, slot10:getPositionY())

		slot15:setString(((slot1.type or 1) == BackPackConst.item_type.REFINE or BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot5)) and (BackpackController:getInstance():getModel():getPackItemNumByBid(BackPackConst.Bag_Code.EQUIP_REFINE, slot5) or 0))
		slot0.msg_container:addChild(slot15)

		slot0.num_label = slot15
		slot10 = slot0:createLabel(20, 27, slot15:getPositionX() + slot15:getContentSize().width, slot15:getPositionY())

		slot10:setString(TI18N("个"))
		slot0.msg_container:addChild(slot10)

		slot0.own_val_label = slot10
	end

	slot10 = slot0:createLabel(20, 27, slot7, 25)

	slot10:setString(Config.ItemData.data_item_type[slot8.type] or slot8.type)
	slot0.msg_container:addChild(slot10)

	slot0.type_label = slot10

	slot0.msg_container:setContentSize(cc.size(slot0.WIDTH, slot4 + 110))
end

function GoodsBaseTips.updateItemType(slot0, slot1)
	if not slot1 or not slot0.type_label then
		return
	end

	slot1 = slot1 or 1

	slot0.type_label:setString(Config.ItemData.data_item_type[slot1] or slot1)
end

function GoodsBaseTips.updateGoodsNum(slot0, slot1)
	slot2 = 0

	if slot0.num_label and slot0.own_val_label then
		slot0.num_label:setString((not slot0.is_pack_num or (slot1.type or 1) == BackPackConst.item_type.REFINE or BackpackController:getInstance():getData():getBackPackItemNumByBid(slot1.bid)) and slot1.quantity)
		slot0.own_val_label:setPositionX(slot0.num_label:getPositionX() + slot0.num_label:getContentSize().width)
	end
end

function GoodsBaseTips.richtext(slot0, slot1, slot2, slot3)
	return string.format("<div fontsize=%s fontcolor=%s>%s</div>", slot3 or 26, tranformC3bTostr(slot2), slot1 or "")
end

function GoodsBaseTips.setTitle(slot0)
	slot0.title_widget = ccui.Widget:create()

	slot0.title_widget:setAnchorPoint(cc.p(0, 0))
	slot0.title_widget:setContentSize(cc.size(slot0.WIDTH, 45))
	slot0:getMainContainer():addChild(slot0.title_widget)
end

function GoodsBaseTips.createBackground(slot0)
	slot0.background = createScale9Sprite(PathTool.getResFrame("common", "common_1034"), 0, 0)

	slot0.background:setContentSize(cc.size(slot0.WIDTH, 269))
	slot0.background:setAnchorPoint(cc.p(0, 0))
	slot0.main_container:addChild(slot0.background)
end

function GoodsBaseTips.createTitleByLabel(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot7 = ccui.Widget:create()

	slot7:setCascadeOpacityEnabled(true)
	slot7:setAnchorPoint(cc.p(0, 0))
	slot7:setContentSize(cc.size(slot0.WIDTH, 20))
	slot7:setPosition(cc.p(slot3, slot4))
	slot1:addChild(slot7)

	slot9 = slot0:createLabel(18, slot5 or 6, slot0.title_space + (slot6 or 0), 10)

	slot9:setAnchorPoint(cc.p(0, 0.5))
	slot9:setString(slot2)
	slot7:addChild(slot9)

	return slot7, slot9
end

function GoodsBaseTips.createLabel(slot0, slot1, slot2, slot3, slot4)
	slot5 = createLabel(slot1, Config.ColorData.data_color4[slot2], nil, 0, 0, "", nil, , cc.p(0, 1))

	if slot3 and slot4 then
		slot5:setPosition(cc.p(slot3, slot4))
	end

	return slot5
end

function GoodsBaseTips.adjustPosition(slot0)
	slot0.descript_container:setPositionY(0)

	slot1 = 30 + slot0.descript_container:getContentSize().height

	slot0.msg_container:setPositionY(slot1)

	slot1 = slot1 + slot0.msg_container:getContentSize().height

	slot0.title_widget:setPositionY(slot1 - slot0.title_widget:getContentSize().height)

	slot1 = slot1 + 5

	slot0:getMainContainer():setContentSize(slot0.WIDTH, slot1)
	slot0.background:setContentSize(cc.size(slot0.WIDTH, slot1))

	if display.height < slot1 then
		slot0:getMainContainer():setScale(display.height / slot1 - 0.05)
	end

	slot0:getMainContainer():setPosition(cc.p(SCREEN_WIDTH / 2, display.height / 2))
end

function GoodsBaseTips.isUseType(slot0, slot1, slot2)
	if slot1 == slot2 then
		return true
	end

	return false
end

function GoodsBaseTips.adjustTipsSize(slot0, slot1)
	slot4 = 95

	if slot1 - slot0:getContentSize().height > 0 then
		slot0:getMainContainer():setContentSize(slot0.WIDTH, slot1)
		slot0.background:setContentSize(cc.size(slot0.WIDTH, slot1))
		slot0.descript_container:setPositionY(slot0.descript_container:getPositionY() + slot3)
		slot0.msg_container:setPositionY(slot0.msg_container:getPositionY() + slot3)
		slot0.title_widget:setPositionY(slot0.title_widget:getPositionY() + slot3)
	end
end

function GoodsBaseTips.getMainContainer(slot0)
	return slot0.main_container
end

function GoodsBaseTips.setPosition(slot0, slot1)
	slot0.main_container:setPosition(slot1)
end

function GoodsBaseTips.getContentSize(slot0)
	return slot0:getMainContainer():getContentSize()
end

function GoodsBaseTips.clearMainContainer(slot0)
	if slot0:getMainContainer() then
		slot0:getMainContainer():removeAllChildren()
	end
end

function GoodsBaseTips.getUseBtn(slot0)
	return slot0.use_btn
end
