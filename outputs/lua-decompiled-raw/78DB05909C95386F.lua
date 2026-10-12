ActDailyLimitGiftTab = ActDailyLimitGiftTab or class("ActDailyLimitGiftTab", function ()
	return ccui.Widget:create()
end)
res_list = {
	[92.0] = "txt_cn_exchage_2_",
	[93.0] = "txt_cn_exchage_3_",
	[94.0] = "txt_cn_exchage_4_",
	[91.0] = "txt_cn_exchage_1_"
}

function ActDailyLimitGiftTab.ctor(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_daily_limit_gift_tab"))

	slot0:setAnchorPoint(cc.p(0, 0.5))
	slot0:setContentSize(cc.size(164, 196))
	slot0:setTouchEnabled(true)
	slot0:setSwallowTouches(false)
	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.red_point = slot0.container:getChildByName("red_point")

	slot0.red_point:setVisible(false)

	slot0.select = slot0.container:getChildByName("select")
	slot0.unselect = slot0.container:getChildByName("unselect")
	slot0.name = createLabel(20, 1, 2, 82, 42, "超值礼包", slot0.root_wnd, nil, cc.p(0.5, 0))

	slot0:registerEvent()
end

function ActDailyLimitGiftTab.registerEvent(slot0)
	slot0:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.call_back ~= nil then
				uv0:call_back()
			end
		end
	end)
end

function ActDailyLimitGiftTab.setData(slot0, slot1)
	slot0.shop_id = slot1

	if slot0.shop_id ~= nil and res_list[slot0.shop_id] then
		loadSpriteTexture(slot0.unselect, PathTool.getResFrame("exchange", res_list[slot0.shop_id] .. "2"), LOADTEXT_TYPE_PLIST)
		loadSpriteTexture(slot0.select, PathTool.getResFrame("exchange", res_list[slot0.shop_id] .. "1"), LOADTEXT_TYPE_PLIST)
	end
end

function ActDailyLimitGiftTab.setTitle(slot0, slot1)
	slot0.name:setString(slot1)
end

function ActDailyLimitGiftTab.getData(slot0)
	return slot0.shop_id
end

function ActDailyLimitGiftTab.setSelecte(slot0, slot1)
	slot0.unselect:setVisible(not slot1)
	slot0.select:setVisible(slot1)
	slot0.root_wnd:setScale(slot1 and 1.03 or 1)
end

function ActDailyLimitGiftTab.addCallBack(slot0, slot1)
	slot0.call_back = slot1
end

function ActDailyLimitGiftTab.DeleteMe(slot0)
	if slot0.shop_id then
		slot0.shop_id = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
