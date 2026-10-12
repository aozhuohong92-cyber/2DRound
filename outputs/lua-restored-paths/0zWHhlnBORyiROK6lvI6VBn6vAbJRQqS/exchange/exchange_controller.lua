ExchangeController = ExchangeController or BaseClass(BaseController)

function ExchangeController.config(slot0)
	slot0.model = ExchangeModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function ExchangeController.getModel(slot0)
	return slot0.model
end

function ExchangeController.registerEvents(slot0)
end

function ExchangeController.registerProtocals(slot0)
	slot0:RegisterProtocal(23606, "handle23606")
	slot0:RegisterProtocal(23607, "handle23607")
end

function ExchangeController.send23606(slot0)
	slot0:SendProtocal(23606, {})
end

function ExchangeController.handle23606(slot0, slot1)
	slot0.dispather:Fire(ExchangeEvent.Extra_Reward, slot1)
end

function ExchangeController.send23607(slot0, slot1)
	slot0:SendProtocal(23607, {
		id = slot1
	})
end

function ExchangeController.handle23607(slot0, slot1)
	message(slot1.msg)
end

function ExchangeController.openExchangeMainView(slot0, slot1)
	if slot1 then
		if not slot0.exchange_win then
			slot0.exchange_win = ExchangeWindow.New()
		end

		slot0.exchange_win:open()
	elseif slot0.exchange_win then
		slot0.exchange_win:close()

		slot0.exchange_win = nil
	end
end

function ExchangeController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
