PartnerSummonGoods = class("PartnerSummonGoods", function ()
	return ccui.Widget:create()
end)
PartnerSummonGoods.HEIGHT = 46
PartnerSummonGoods.WIDTH = 140

function PartnerSummonGoods.ctor(slot0, slot1)
	slot0.index = slot1 or 0
	slot0.size = cc.size(PartnerSummonGoods.WIDTH, PartnerSummonGoods.HEIGHT)

	slot0:setContentSize(slot0.size)
	slot0:setAnchorPoint(cc.p(0, 0))

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("partnersummon/partnersummon_goods"))

	slot0:addChild(slot0.root_wnd)

	slot0.item_icon_common = slot0.root_wnd:getChildByName("item_icon_common")
	slot0.common_num_label = slot0.root_wnd:getChildByName("common_num_label")
	slot0.touch_container = slot0.root_wnd:getChildByName("touch_container")

	slot0.touch_container:setSwallowTouches(false)
	slot0:registerEvent()
end

function PartnerSummonGoods.registerEvent(slot0)
	slot0.touch_container:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.item_id then
				TipsManager:getInstance():showGoodsTips(uv0.item_id)
			end
		end
	end)
end

function PartnerSummonGoods.setData(slot0, slot1, slot2)
	if slot2 then
		slot0.item_id = slot2
		slot0.index = slot1

		slot0.item_icon_common:loadTexture(PathTool.getItemRes(Config.ItemData.data_get_data(slot2).icon), LOADTEXT_TYPE)
		slot0.common_num_label:setString(BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot2))
	end
end

function PartnerSummonGoods.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
