RecruitHeroModel = RecruitHeroModel or BaseClass()

function RecruitHeroModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function RecruitHeroModel.config(slot0)
	slot0.day_first_login = true
end

function RecruitHeroModel.setDayFirstLogin(slot0, slot1)
	slot0.day_first_login = slot1
end

function RecruitHeroModel.getDramaDunMaxID(slot0)
	slot1 = 1

	if BattleDramaController:getInstance():getModel():getDramaData() and slot3.max_dun_id and Config.DungeonData.data_drama_dungeon_info(slot3.max_dun_id) then
		slot1 = slot4.floor or 1
	end

	return slot1
end

function RecruitHeroModel.setRecruitEndTime(slot0, slot1)
	if slot1 - GameNet:getInstance():getTime() <= 0 then
		slot0.recruit_status = false
	else
		slot0.recruit_status = true
	end
end

function RecruitHeroModel.getRecruitEndTime(slot0)
	if slot0.recruit_status then
		return slot0.recruit_status
	end

	return false
end

function RecruitHeroModel.setRecruitBaseData(slot0, slot1)
	slot0.recruit_data = {}

	if slot1.quests then
		for slot5, slot6 in pairs(slot1.quests) do
			slot0.recruit_data[slot6.id] = slot6
		end
	end
end

function RecruitHeroModel.getRecruitBaseData(slot0, slot1)
	if slot0.recruit_data[slot1] then
		return slot0.recruit_data[slot1]
	end

	return nil
end

function RecruitHeroModel.setStatusRedPoint(slot0, slot1)
	if not slot1 then
		return
	end

	if MainuiController:getInstance():checkIsOpenByActivate(Config.FunctionData.data_info[MainuiConst.icon.limit_recruit].activate) == false then
		return
	end

	slot4 = false

	if slot1.quests then
		for slot8, slot9 in pairs(slot1.quests) do
			if slot9.status == 1 then
				slot4 = true

				break
			end
		end
	end

	slot5 = false

	if slot1.state and slot1.state == 1 then
		slot5 = true
	end

	MainuiController:getInstance():setFunctionTipsStatus(MainuiConst.icon.limit_recruit, slot4 or slot5 or slot0.day_first_login)
end

function RecruitHeroModel.__delete(slot0)
end
