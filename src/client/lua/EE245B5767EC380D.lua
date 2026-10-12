PokedexModel = PokedexModel or BaseClass()

function PokedexModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function PokedexModel.config(slot0)
	slot0.have_list = {}
	slot0.all_data = {}
	slot0.disband_list = {}
end

function PokedexModel.setHavePartner(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.all_data = slot1

	for slot6, slot7 in pairs(slot1.partners or {}) do
		slot0.have_list[slot7.partner_id] = true
	end
end

function PokedexModel.getAllData(slot0)
	if slot0.all_data then
		return slot0.all_data
	end
end

function PokedexModel.isHavePartner(slot0, slot1)
	return slot0.have_list[slot1]
end

function PokedexModel.setDisbandPartner(slot0, slot1)
	slot0.disband_list[slot1] = true
end

function PokedexModel.isDisbandPartner(slot0, slot1)
	return slot0.disband_list[slot1]
end

function PokedexModel.__delete(slot0)
end
