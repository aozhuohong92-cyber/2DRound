HeroExpeditModel = HeroExpeditModel or BaseClass()
slot0 = table.insert

function HeroExpeditModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function HeroExpeditModel.config(slot0)
	slot0.isChangeRedPointStatus = 0
	slot0.sendRedPointStatus = 0
end

function HeroExpeditModel.setDifferentChoose(slot0, slot1)
	slot0.different = slot1
end

function HeroExpeditModel.getDifferentChoose(slot0)
	if slot0.different then
		return slot0.different
	end

	return 0
end

function HeroExpeditModel.setExpeditData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.expeditData = slot1

	MainuiController:getInstance():setBtnRedPoint(MainuiConst.btn_index.esecsice, {
		bid = RedPointType.heroexpedit,
		status = slot0:checkRedStatus()
	})
end

function HeroExpeditModel.getExpeditData(slot0)
	if slot0.expeditData then
		return slot0.expeditData
	end

	return {}
end

function HeroExpeditModel.setEmployHelpMeData(slot0, slot1)
	slot0.help_me_data = slot1
end

function HeroExpeditModel.getEmployHelpMeData(slot0)
	if slot0.help_me_data then
		return slot0.help_me_data
	end

	return {}
end

function HeroExpeditModel.setIsChangeRedPoint(slot0, slot1)
	slot0.isChangeRedPointStatus = slot1
end

function HeroExpeditModel.setHeroSendRedPoint(slot0, slot1)
	if Config.DailyplayData.data_exerciseactivity[EsecsiceConst.exercise_index.heroexpedit] == nil then
		return
	end

	if MainuiController:getInstance():checkIsOpenByActivate(slot2[EsecsiceConst.exercise_index.heroexpedit].activate) == false then
		return
	end

	slot0.sendRedPointStatus = slot1

	GlobalEvent:getInstance():Fire(HeroExpeditEvent.Expedit_RedPoint_Event)
end

function HeroExpeditModel.getHeroSendRedPoint(slot0)
	return false
end

function HeroExpeditModel.checkRedStatus(slot0)
	return false
end

function HeroExpeditModel.getExpeditBoxData(slot0)
	slot1 = {}

	for slot6, slot7 in ipairs(Config.ExpeditionData.data_sign_info) do
		if slot7.type == 2 then
			table.insert(slot1, slot6)
		end
	end

	return slot1
end

function HeroExpeditModel.setHeroBloodById(slot0, slot1)
	slot0.HeroBloodData = {}
	slot0.hireHeroData = {}
	slot0.hireHeroIsUsedData = {}

	slot0:setExpeditEmployData(slot1.list)

	slot3 = 0
	slot4 = ""

	if RoleController:getInstance():getRoleVo() then
		slot3 = slot2.rid
		slot4 = slot2.srv_id
	end

	for slot8, slot9 in ipairs(slot1.p_list) do
		slot0.HeroBloodData[getNorKey(slot3, slot4, slot9.id)] = slot9.hp_per
	end

	if next(slot1.list) ~= nil then
		for slot8, slot9 in pairs(slot1.list) do
			slot10 = getNorKey(slot9.rid, slot9.srv_id, slot9.id)
			slot0.hireHeroData[slot10] = true
			slot0.HeroBloodData[slot10] = slot9.hp_per
			slot0.hireHeroIsUsedData[slot10] = slot9.is_used
		end
	end
end

function HeroExpeditModel.getHeroBloodById(slot0, slot1, slot2, slot3)
	if not slot0.HeroBloodData then
		return 100
	end

	if not slot1 or type(slot1) ~= "number" then
		return 100
	end

	return slot0.HeroBloodData[getNorKey(slot2 or 0, slot3 or "", slot1)] or 100
end

function HeroExpeditModel.getHireHero(slot0, slot1, slot2, slot3)
	if not slot0.hireHeroData then
		return false
	end

	if not slot1 or type(slot1) ~= "number" then
		return false
	end

	return slot0.hireHeroData[getNorKey(slot2 or 0, slot3 or "", slot1)] or false
end

function HeroExpeditModel.getHireHeroIsUsed(slot0, slot1, slot2, slot3)
	if not slot0.hireHeroIsUsedData then
		return 0
	end

	if not slot1 or type(slot1) ~= "number" then
		return 0
	end

	return slot0.hireHeroIsUsedData[getNorKey(slot2 or 0, slot3 or "", slot1)] or 0
end

function HeroExpeditModel.setExpeditEmployData(slot0, slot1)
	slot0.expeditEmployData = slot1
end

function HeroExpeditModel.getExpeditEmployData(slot0)
	return slot0.expeditEmployData or {}
end

function HeroExpeditModel.__delete(slot0)
end
