TimesummonModel = TimesummonModel or BaseClass()

function TimesummonModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function TimesummonModel.config(slot0)
end

function TimesummonModel.getEffectAction(slot0, slot1)
	for slot6, slot7 in pairs(slot1) do
		if Config.ItemData.data_get_data(slot7.base_id) then
			if slot8.type == 102 then
				if slot8.eqm_jie == 4 and 1 < 2 then
					slot2 = 2
				elseif slot8.eqm_jie == 5 and slot2 < 3 then
					slot2 = 3
				end
			elseif slot8.eqm_jie == 3 and slot2 <= 1 then
				slot2 = 1
			elseif slot8.eqm_jie == 4 and slot2 < 4 then
				slot2 = 4
			elseif slot8.eqm_jie == 5 and slot2 < 5 then
				slot2 = 5
			end
		end
	end

	slot3 = TimesummonConst.Action_Group[slot2]

	return slot3[1], slot3[2]
end

function TimesummonModel.__delete(slot0)
end
