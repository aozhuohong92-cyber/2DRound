LookController = LookController or BaseClass(BaseController)

function LookController.config(slot0)
	slot0.model = LookModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function LookController.getModel(slot0)
	return slot0.model
end

function LookController.registerEvents(slot0)
end

function LookController.registerProtocals(slot0)
	slot0:RegisterProtocal(11061, "handle11061")
	slot0:RegisterProtocal(11062, "handle11062")
end

function LookController.sender11061(slot0, slot1, slot2, slot3, slot4)
	slot5 = {
		r_rid = slot1,
		r_srvid = slot2,
		partner_id = slot3
	}

	if slot0.dic_attr_data == nil then
		slot0.dic_attr_data = {}
	end

	slot0.dic_attr_data[string.format("%s_%s_%s", slot1, slot2, slot3)] = slot4

	slot0:SendProtocal(11061, slot5)
end

function LookController.clearAttrData(slot0)
	slot0.dic_attr_data = nil
end

function LookController.handle11061(slot0, slot1)
	message(slot1.msg)

	if slot1.bid ~= 0 then
		slot3 = 1

		if Config.PartnerData.data_partner_base[slot1.bid] then
			slot3 = slot2.camp_type
		end

		slot1.camp_type = slot3
		slot4 = string.format("%s_%s_%s", slot1.r_rid, slot1.r_srvid, slot1.partner_id)

		if slot0.dic_attr_data and slot0.dic_attr_data[slot4] then
			slot1.atk = slot0.dic_attr_data[slot4].atk or slot1.atk
			slot1.hp = slot0.dic_attr_data[slot4].hp or slot1.hp
			slot1.power = slot0.dic_attr_data[slot4].power or slot1.power
		end

		HeroController:getInstance():openHeroTipsPanel(true, slot1)
	end
end

function LookController.sender11062(slot0, slot1, slot2)
	slot0:SendProtocal(11062, {
		id = slot1,
		srv_id = slot2
	})
end

function LookController.handle11062(slot0, slot1)
	message(slot1.msg)

	if slot1.bid ~= 0 then
		slot3 = 1

		if Config.PartnerData.data_partner_base[slot1.bid] then
			slot3 = slot2.camp_type
		end

		slot1.camp_type = slot3

		HeroController:getInstance():openHeroTipsPanel(true, slot1)
	end
end

function LookController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
