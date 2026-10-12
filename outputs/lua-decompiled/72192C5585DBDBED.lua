FruitTreasureMapItem = class("FruitTreasureMapItem", function ()
	return ccui.Layout:create()
end)
slot0 = FruitTreasureController:getInstance():getModel()

function FruitTreasureMapItem.ctor(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("fruit_treasure/fruit_map_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.size = cc.size(694, 511)

	slot0:setCascadeOpacityEnabled(true)
	slot0:setTouchEnabled(true)
	slot0:setAnchorPoint(0, 0)
	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setPosition(0, 0)

	slot5 = "main_panel"
	slot0.main_panel = slot0.root_wnd:getChildByName(slot5)
	slot0.itemList = {}

	for slot5 = 1, 5 do
		slot7 = FruitTreasureItem.new()

		slot7:setName("item")
		slot7:setAnchorPoint(cc.p(0.5, 0.5))
		slot7:setPosition(-150, -150)
		slot0.main_panel:getChildByName("pos_" .. slot5):addChild(slot7)
		table.insert(slot0.itemList, slot7)
	end

	slot0:registerEvent()
end

function FruitTreasureMapItem.registerEvent(slot0)
end

function FruitTreasureMapItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = uv0.alllist[slot1]

	for slot6 = 1, 5 do
		slot0.main_panel:getChildByName("pos_" .. slot6):getChildByName("item"):setVisible(false)
	end

	slot0.data = slot2

	for slot6 = 1, #slot2.list do
		slot8 = slot0.main_panel:getChildByName("pos_" .. slot6):getChildByName("item")

		slot8:setVisible(true)
		slot8:setData(slot2.list[slot6])
	end
end

function FruitTreasureMapItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function FruitTreasureMapItem.clickFun(slot0)
	if slot0.callback then
		slot0:callback()
	end
end

function StarTowerItem.getData(slot0)
	return slot0.data
end

function FruitTreasureMapItem.DeleteMe(slot0)
	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
