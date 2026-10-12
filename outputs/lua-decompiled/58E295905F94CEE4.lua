FruitTreasureBackPackItem = class("FruitTreasureBackPackItem", function ()
	return ccui.Layout:create()
end)
slot0 = FruitTreasureController:getInstance():getModel()

function FruitTreasureBackPackItem.ctor(slot0)
	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function FruitTreasureBackPackItem.config(slot0)
	slot0.ctrl = FruitTreasureController:getInstance()

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setTouchEnabled(true)
end

function FruitTreasureBackPackItem.layoutUI(slot0)
	slot0.icon = BackPackItem.new(true, true, nil, 0.8, false)

	slot0:addChild(slot0.icon)

	slot0.starnode = cc.Node:create()

	slot0.icon:addChild(slot0.starnode)
	slot0.icon:updateScale(0.8)
end

function FruitTreasureBackPackItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0.icon:setBaseData(slot0.data.piece_id)
	slot0.icon.chipSprite:setVisible(false)
	slot0.starnode:removeAllChildren()
	uv0:createStar(slot0.data.star, slot0.starnode, uv0:getStarMax(slot0.data.type))

	if not slot0.txtLev then
		if not slot0.levBg then
			slot0.levBg = createSprite(PathTool.getResFrame("common", "common_1030"), 6, 66, LOADTEXT_TYPE_PLIST)

			slot0.levBg:setCascadeOpacityEnabled(true)
		else
			slot0.levBg:setVisible(true)
		end

		slot0.levBg:setAnchorPoint(cc.p(0, 0))
		slot0.icon:addChild(slot0.levBg, 1)
		slot0.levBg:setScale(slot0.head_panel_scale or 1)

		slot0.txtLev = createLabel(18, nx.gui.WHITE, Config.ColorData.data_color4[152], slot0.levBg:getContentSize().width / 2 - 2, slot0.levBg:getContentSize().height / 2 + 1, "", slot0.levBg, 1, cc.p(0.5, 0.5))

		slot0.txtLev:setLocalZOrder(1)
	end

	if slot0.levBg then
		slot0.levBg:setVisible(true)
	end

	slot0.txtLev:setString(slot0.data.lev)

	if slot0.levBg ~= nil then
		slot0.levBg:setPosition(cc.p(98, 98))
	end
end

function FruitTreasureBackPackItem.registerEvents(slot0)
	registerButtonEventListener(slot0.icon, function ()
		TipsManager:getInstance():showFruitChipTips(uv0.data, false, false, true, false)
		uv0.icon:updateScale(0.8)
	end, true, 2, nil, 0.8)
end

function FruitTreasureBackPackItem.clickHandler(slot0)
	if slot0.call_fun then
		slot0:call_fun(slot0.data)
	end
end

function FruitTreasureBackPackItem.addCallBack(slot0, slot1)
	slot0.call_fun = slot1
end

function FruitTreasureBackPackItem.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function FruitTreasureBackPackItem.getData(slot0)
	return slot0.data
end

function FruitTreasureBackPackItem.clearInfo(slot0)
	slot0:removeFromParent()
end

function FruitTreasureBackPackItem.DeleteMe(slot0)
	slot0:removeFromParent()
end
