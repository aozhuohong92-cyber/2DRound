ForgeHouseModel = ForgeHouseModel or BaseClass()

function ForgeHouseModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function ForgeHouseModel.config(slot0)
end

function ForgeHouseModel.setCompSendID(slot0, slot1)
	slot0.comp_send_id = slot1
end

function ForgeHouseModel.getCompSendID(slot0)
	return slot0.comp_send_id or nil
end

function ForgeHouseModel.__delete(slot0)
end
