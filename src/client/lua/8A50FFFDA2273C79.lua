SuitShopController = SuitShopController or BaseClass(BaseController)

function SuitShopController.config(slot0)
	slot0.model = SuitShopModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function SuitShopController.getModel(slot0)
	return slot0.model
end

function SuitShopController.registerEvents(slot0)
end

function SuitShopController.registerProtocals(slot0)
end

function SuitShopController.send13030(slot0)
end

function SuitShopController.openSuitShopMainView(slot0, slot1)
	if slot1 == true then
		if not slot0.suit_shop_view then
			slot0.suit_shop_view = SuitShopMainWindow.New()
		end

		slot0.suit_shop_view:open()
	elseif slot0.suit_shop_view then
		slot0.suit_shop_view:close()

		slot0.suit_shop_view = nil
	end
end

function SuitShopController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
