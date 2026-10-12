RefEquipUI = RefEquipUI or BaseClass()
slot0 = HeroController:getInstance():getModel()
slot1 = table.insert
slot2 = RefController:getInstance()

function RefEquipUI.__init(slot0, slot1)
	slot0.parent = slot1

	slot0:createRootWnd()
end

function RefEquipUI.createRootWnd(slot0)
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
		item_class = RefEquipUIItem
	})

	slot0:setData()
end

function RefEquipUI.setVisible(slot0, slot1)
	if not tolua.isnull(slot0.scroll_view) then
		slot0.scroll_view:setVisible(slot1)
	end
end

function RefEquipUI.setData(slot0)
	slot2 = {}

	for slot6, slot7 in pairs(uv0:getHeroList()) do
		for slot11, slot12 in pairs(slot7.eqm_list) do
			uv1(slot2, {
				id = slot7.partner_id,
				item = slot12
			})
		end

		for slot11, slot12 in pairs(slot7.artifact_list) do
			uv1(slot2, {
				id = slot7.partner_id,
				item = slot12
			})
		end
	end

	slot0.scroll_view:setData(slot2, call_back)
end

function RefEquipUI.__delete(slot0)
	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()

		slot0.scroll_view = nil
	end
end

RefEquipUIItem = class("RefEquipUIItem", function ()
	return ccui.Layout:create()
end)

function RefEquipUIItem.ctor(slot0)
	slot0.item_name = ""
	slot0.size = cc.size(96, 96)

	slot0:setContentSize(slot0.size)
	slot0:setAnchorPoint(0.5, 0.5)

	slot0.backpack_item = BackPackItem.new(false, true, false, 0.8)

	slot0.backpack_item:setPosition(48, 48)
	slot0:addChild(slot0.backpack_item)
	slot0:registerEvent()
end

function RefEquipUIItem.registerEvent(slot0)
	slot0.backpack_item:addCallBack(function ()
		if uv0.data and uv0.data.item and uv0.data.id then
			if BackPackConst.checkIsEquip(uv0.item_data.config.type) then
				HeroController:getInstance():openEquipTips(true, uv0.item_data, PartnerConst.EqmTips.other)
				uv1:send10535(4, uv0.data.item.id, uv0.data.id, 2)
			elseif BackPackConst.checkIsArtifact(uv0.item_data.config.type) then
				HeroController:getInstance():openArtifactTipsWindow(true, uv0.item_data, PartnerConst.ArtifactTips.normal)
				uv1:send10535(2, uv0.data.item.id, uv0.data.id, 2)
			end
		end
	end)
end

function RefEquipUIItem.setData(slot0, slot1)
	slot0.data = slot1

	if slot1 then
		slot0.item_data = slot1.item

		slot0.backpack_item:setData(slot0.item_data)
	end
end

function RefEquipUIItem.suspendAllActions(slot0)
end

function RefEquipUIItem.DeleteMe(slot0)
	if slot0.backpack_item then
		slot0.backpack_item:DeleteMe()
	end

	slot0.backpack_item = nil

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
