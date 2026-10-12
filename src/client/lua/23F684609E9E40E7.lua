DayChargeModel = DayChargeModel or BaseClass()

function DayChargeModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function DayChargeModel.config(slot0)
end

function DayChargeModel.__delete(slot0)
end
