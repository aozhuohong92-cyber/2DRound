ExchangeModel = ExchangeModel or BaseClass()

function ExchangeModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function ExchangeModel.config(slot0)
end

function ExchangeModel.__delete(slot0)
end
