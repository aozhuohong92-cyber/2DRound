RefItemUI = RefItemUI or BaseClass()
slot0 = BackpackController:getInstance():getModel()
slot1 = RefController:getInstance()

function RefItemUI.__init(slot0, slot1)
	slot0.parent = slot1

	slot0:createRootWnd()
end

function RefItemUI.createRootWnd(slot0)
	slot0.size = slot0.parent:getContentSize()
	slot0.scroll_view = CommonScrollViewLayout.new(slot0.parent, cc.p(8, 8), nil, , cc.size(slot0.size.width - 16, slot0.size.height - 16), {
		start_y = 0,
		once_num = 1,
		start_x = 4,
		item_width = 96,
		space_x = 14,
		row = 5,
		item_height = 96,
		space_y = 10,
		col = 5,
		need_dynamic = true,
		item_class = RefItemUIItem
	})

	slot0:setData()
end

function RefItemUI.setVisible(slot0, slot1)
	if not tolua.isnull(slot0.scroll_view) then
		slot0.scroll_view:setVisible(slot1)
	end
end

function RefItemUI.setData(slot0)
	slot0.scroll_view:setData(uv0:getItemListForShare(), call_back)
end

function RefItemUI.__delete(slot0)
	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()

		slot0.scroll_view = nil
	end
end

RefItemUIItem = class("RefItemUIItem", function ()
	return ccui.Layout:create()
end)

function RefItemUIItem.ctor(slot0)
	slot0.item_name = ""
	slot0.size = cc.size(96, 96)

	slot0:setContentSize(slot0.size)
	slot0:setAnchorPoint(0.5, 0.5)

	slot0.backpack_item = BackPackItem.new(false, true, false, 0.8)

	slot0.backpack_item:setPosition(48, 48)
	slot0:addChild(slot0.backpack_item)
	slot0:registerEvent()
end

function RefItemUIItem.registerEvent(slot0)
	slot0.backpack_item:addCallBack(function ()
		if uv0.data and uv0.data.config then
			if BackPackConst.checkIsEquip(uv0.data.config.type) then
				HeroController:getInstance():openEquipTips(true, uv0.data, PartnerConst.EqmTips.other)
			elseif BackPackConst.checkIsArtifact(uv0.data.config.type) then
				HeroController:getInstance():openArtifactTipsWindow(true, uv0.data, PartnerConst.ArtifactTips.normal)
			else
				TipsManager:getInstance():showGoodsTips(uv0.data)
			end

			uv1:send10535(1, uv0.data.id, 0, 1)
		end
	end)
end

function RefItemUIItem.setData(slot0, slot1)
	slot0.data = slot1

	if slot1 then
		slot0.backpack_item:setData(slot1)
	end
end

function RefItemUIItem.suspendAllActions(slot0)
end

function RefItemUIItem.DeleteMe(slot0)
	if slot0.backpack_item then
		slot0.backpack_item:DeleteMe()
	end

	slot0.backpack_item = nil

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
