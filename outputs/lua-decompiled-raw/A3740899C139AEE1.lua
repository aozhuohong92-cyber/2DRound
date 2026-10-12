FruitTreasureItem = class("FruitTreasureItem", function ()
	return ccui.Layout:create()
end)
slot0 = FruitTreasureController:getInstance():getModel()

function FruitTreasureItem.ctor(slot0)
	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function FruitTreasureItem.config(slot0)
	slot0.ctrl = FruitTreasureController:getInstance()

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setTouchEnabled(true)
end

function FruitTreasureItem.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("fruit_treasure/fruit_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.icon = slot0.root_wnd:getChildByName("icon")
	slot0.tips = slot0.root_wnd:getChildByName("tips")
	slot0.sp_node = slot0.root_wnd:getChildByName("sp_node")
	slot0.type = slot0.root_wnd:getChildByName("type")
	slot0.name_txt = slot0.root_wnd:getChildByName("name")
	slot0.lv_txt = slot0.root_wnd:getChildByName("lv"):getChildByName("txt")
	slot0.type_bg = slot0.root_wnd:getChildByName("bg")

	slot0.type_bg:setVisible(false)
end

function FruitTreasureItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0.icon:loadTexture(PathTool.getItemRes(slot1.piece_id), LOADTEXT_TYPE)
	slot0.name_txt:setString(slot1.name or "")
	slot0.type:loadTexture(PathTool.getResFrame("yanfubaoshu", slot1.id), LOADTEXT_TYPE_PLIST)
	slot0.icon:removeAllChildren()
	uv0:createStar(slot0.data.star, slot0.icon, uv0:getStarMax(slot0.data.type))
	slot0.lv_txt:setString(slot0.data.lev)

	if not slot0.data.isActive then
		setChildUnEnabled(true, slot0.icon)
		slot0.type_bg:setVisible(true)
	else
		setChildUnEnabled(false, slot0.icon)
		slot0.type_bg:setVisible(false)
	end

	if slot0.effect2 then
		slot0.effect2:setAnimation(0, "type_" .. slot1.type, true)
	else
		slot0.effect2 = createEffectSpine("yfbs", cc.p(0, 0), cc.p(0.5, 0.5), true, "type_" .. slot1.type, nil, , , func_start)

		slot0.sp_node:addChild(slot0.effect2)
	end

	slot0.effect2:setVisible(slot0.data.isActive)
	slot0:setRedStatus(uv0.fruittreasure_red_list[slot1.id])
end

function FruitTreasureItem.setRedStatus(slot0, slot1)
	slot2 = false

	slot0.tips:setVisible(slot1[FruitTreasureConst.RedType.Lv] or slot1[FruitTreasureConst.RedType.Star] or slot1[FruitTreasureConst.RedType.Active])
end

function FruitTreasureItem.registerEvents(slot0)
	registerButtonEventListener(slot0.icon, function ()
		if not not uv0.data.isActive then
			uv0.ctrl:send29608(uv0.data.id, function ()
				TipsManager:getInstance():showFruitChipTips(uv0.data, true, false, true, uv1)
			end)
		else
			TipsManager:getInstance():showFruitChipTips(uv0.data, true, false, true, slot0)
		end
	end, true, 2)
end

function FruitTreasureItem.clickHandler(slot0)
	if slot0.call_fun then
		slot0:call_fun(slot0.data)
	end
end

function FruitTreasureItem.addCallBack(slot0, slot1)
	slot0.call_fun = slot1
end

function FruitTreasureItem.setSelectStatus(slot0, slot1)
	slot0.select_bg:setVisible(slot1)
end

function FruitTreasureItem.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function FruitTreasureItem.getData(slot0)
	return slot0.data
end

function FruitTreasureItem.clearInfo(slot0)
	slot0:setSelectStatus(false)
	slot0:removeFromParent()
end

function FruitTreasureItem.DeleteMe(slot0)
	slot0:removeFromParent()
	slot0:removeAllChildren()
	slot0:release()
end
