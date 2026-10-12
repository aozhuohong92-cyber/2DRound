LimitTimeActionController = LimitTimeActionController or BaseClass(BaseController)

function LimitTimeActionController.config(slot0)
	slot0.model = LimitTimeActionModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function LimitTimeActionController.getModel(slot0)
	return slot0.model
end

function LimitTimeActionController.registerEvents(slot0)
end

function LimitTimeActionController.registerProtocals(slot0)
	slot0:RegisterProtocal(28000, "handle28000")
end

function LimitTimeActionController.sender28000(slot0)
	slot0:SendProtocal(28000, {})
end

function LimitTimeActionController.handle28000(slot0, slot1)
	if slot1 ~= nil and next(slot1) ~= nil then
		GlobalEvent:getInstance():Fire(LimitTimeActionEvent.Limit_Time_Gift_Event, slot1)
	end
end

function LimitTimeActionController.openLimitTimeGiftWindow(slot0, slot1)
	if FILTER_CHARGE then
		return
	end

	if slot1 == true then
		if not slot0.limit_time_gift_window then
			slot0.limit_time_gift_window = LimitTimeGiftWindow.New()
		end

		slot0.limit_time_gift_window:open()
	elseif slot0.limit_time_gift_window then
		slot0.limit_time_gift_window:close()

		slot0.limit_time_gift_window = nil
	end
end

function LimitTimeActionController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
