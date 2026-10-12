StrongerModel = StrongerModel or BaseClass()

function StrongerModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function StrongerModel.config(slot0)
	slot0.scroe_list = {}
	slot0.max_list = {}
end

function StrongerModel.setDataByBid(slot0, slot1)
	if slot0.scroe_list[slot1.partner_bid] == nil then
		slot0.scroe_list[slot1.partner_bid] = {}
	end

	slot0.scroe_list[slot1.partner_bid] = slot1.partner_score

	if slot0.max_list[slot1.partner_bid] == nil then
		slot0.max_list[slot1.partner_bid] = {}
	end

	slot0.max_list[slot1.partner_bid] = slot1.stronger_partner_score
end

function StrongerModel.getStrongerValByBid(slot0, slot1, slot2)
	slot4 = slot0.max_list[slot1] or {}
	slot5 = 0
	slot6 = 0

	for slot10, slot11 in pairs(slot0.scroe_list[slot1] or {}) do
		if slot11.id_2 == slot2 then
			slot5 = slot11.val
		end
	end

	for slot10, slot11 in pairs(slot4) do
		if slot11.id_2 == slot2 then
			slot6 = slot11.val
		end
	end

	return slot5, slot6
end

function StrongerModel.getTotalAndMaxValByBid(slot0, slot1)
	slot2 = 0

	if slot0.scroe_list[slot1] then
		for slot6, slot7 in pairs(slot0.scroe_list[slot1]) do
			slot2 = slot2 + slot7.val
		end
	end

	slot3 = 0

	if slot0.max_list[slot1] then
		for slot7, slot8 in pairs(slot0.max_list[slot1]) do
			slot3 = slot3 + slot8.val
		end
	end

	return slot2, slot3
end

function StrongerModel.checkStrongItemIsOpen(slot0, slot1)
	slot2 = false

	if slot1 then
		if slot1[1] and slot1[1] == "dugeon" then
			if BattleDramaController:getInstance():getModel():getDramaData() and slot1[2] and slot1[2] <= slot3.max_dun_id then
				slot2 = true
			end
		elseif slot1[1] and slot1[1] == "lev" then
			if RoleController:getInstance():getRoleVo() and slot1[2] and slot1[2] <= slot3.lev then
				slot2 = true
			end
		elseif slot1[1] and slot1[1] == "guild" and RoleController:getInstance():getRoleVo() and slot3.gid ~= 0 and slot3.gsrv_id ~= "" and GuildController:getInstance():getModel():getMyGuildInfo() and slot1[2] <= slot4.lev then
			slot2 = true
		end
	end

	return slot2
end

function StrongerModel.__delete(slot0)
end
