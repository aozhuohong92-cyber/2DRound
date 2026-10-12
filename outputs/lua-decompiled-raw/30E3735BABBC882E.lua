RfmPersonnalGiftController = RfmPersonnalGiftController or BaseClass(BaseController)

function RfmPersonnalGiftController.config(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function RfmPersonnalGiftController.registerEvents(slot0)
end

function RfmPersonnalGiftController.registerProtocals(slot0)
	slot0:RegisterProtocal(28900, "handle28900")
	slot0:RegisterProtocal(28901, "handle28901")
end

function RfmPersonnalGiftController.sender28900(slot0)
	slot0:SendProtocal(28900)
end

function RfmPersonnalGiftController.handle28900(slot0, slot1)
	GlobalEvent:getInstance():Fire(RfmPersonnalGiftEvent.Rfm_Personal_Gift_Event, slot1)
end

function RfmPersonnalGiftController.handle28901(slot0, slot1)
	if slot1.flag == 1 then
		delayOnce(function ()
			uv0:openRfmPersonalGiftView(true)
		end, 0.3)
	end
end

function RfmPersonnalGiftController.openRfmPersonalGiftView(slot0, slot1)
	if FILTER_CHARGE then
		return
	end

	if slot1 == true then
		if GuideController:getInstance():isInGuide() then
			return
		end

		if StoryController:getInstance():getModel():isStoryState() then
			return
		end

		if not slot0.rfm_personal_gift_view then
			slot0.rfm_personal_gift_view = RfmPersonnalGiftWindow.New()
		end

		slot0.rfm_personal_gift_view:open()
	elseif slot0.rfm_personal_gift_view then
		slot0.rfm_personal_gift_view:close()

		slot0.rfm_personal_gift_view = nil
	end
end

function RfmPersonnalGiftController.__delete(slot0)
end
