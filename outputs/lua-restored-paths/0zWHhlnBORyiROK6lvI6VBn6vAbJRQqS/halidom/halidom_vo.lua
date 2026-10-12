HalidomVo = HalidomVo or BaseClass(EventDispatcher)

function HalidomVo.__init(slot0)
	slot0.id = 0
	slot0.lev = 0
	slot0.exp = 0
	slot0.step = 0
	slot0.all_attr = {}
	slot0.red_status_list = {}
end

function HalidomVo.updateData(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		slot0[slot5] = slot6
	end

	slot0:dispatchUpdateAttrByKey()
	slot0:checkHalidomRedStatus()
end

function HalidomVo.dispatchUpdateAttrByKey(slot0)
end

function HalidomVo.checkHalidomRedStatus(slot0)
	slot1 = false
	slot3 = Config.HalidomData.data_lvup[slot0.id]

	if slot0.lev < Config.HalidomData.data_max_lev[slot0.id] and slot3 and slot3[slot0.lev] then
		slot1 = true

		for slot8, slot9 in pairs(slot4.loss or {}) do
			if BackpackController:getInstance():getModel():getItemNumByBid(slot9[1]) < slot9[2] then
				slot1 = false

				break
			end
		end
	end

	slot0.red_status_list[HalidomConst.Red_Type.Lvup] = slot1
	slot4 = false
	slot6 = Config.HalidomData.data_step[slot0.id]

	if slot0.step < Config.HalidomData.data_max_step[slot0.id] and slot6 and slot6[slot0.step + 1] then
		slot4 = true

		for slot11, slot12 in pairs(slot7.conds) do
			if slot12[1] == "lev" and slot12[2] and slot0.lev < slot12[2] then
				slot4 = false
			end
		end

		if slot4 then
			for slot11, slot12 in pairs(slot7.loss_items) do
				if BackpackController:getInstance():getModel():getItemNumByBid(slot12[1]) < slot12[2] then
					slot4 = false

					break
				end
			end
		end

		slot9 = HeroController:getInstance():getModel():getAllHeroArray():GetSize()

		if slot4 then
			for slot13, slot14 in pairs(slot7.loss_fixed) do
				slot17 = slot14[3]

				for slot22 = 1, slot9 do
					if slot8:Get(slot22 - 1).is_lock == 0 and slot23.is_in_form == 0 and slot23.bid == slot14[1] and slot23.star == slot14[2] then
						slot18 = 0 + 1
					end

					if slot17 <= slot18 then
						break
					end
				end

				if slot18 < slot17 then
					slot4 = false

					break
				end
			end
		end

		if slot4 then
			for slot13, slot14 in pairs(slot7.loss_rand) do
				slot17 = slot14[3]

				for slot22 = 1, slot9 do
					if slot8:Get(slot22 - 1).is_lock == 0 and slot23.is_in_form == 0 and slot23.camp_type == slot14[1] and slot23.star == slot14[2] then
						slot18 = 0 + 1
					end

					if slot17 <= slot18 then
						break
					end
				end

				if slot18 < slot17 then
					slot4 = false

					break
				end
			end
		end
	end

	slot0.red_status_list[HalidomConst.Red_Type.Step] = slot4
end

function HalidomVo.getRedStatusByType(slot0, slot1)
	return slot0.red_status_list[slot1] or false
end

function HalidomVo.__delete(slot0)
end
