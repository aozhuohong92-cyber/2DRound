SeerpalaceModel = SeerpalaceModel or BaseClass()

function SeerpalaceModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function SeerpalaceModel.config(slot0)
	slot0.change_flag = false
	slot0.change_partner_id = 0
	slot0.last_summon_group_id = 0
end

function SeerpalaceModel.setChangeFlag(slot0, slot1)
	slot0.change_flag = slot1
end

function SeerpalaceModel.getChangeFlag(slot0)
	return slot0.change_flag
end

function SeerpalaceModel.setChangePartnerId(slot0, slot1)
	slot0.change_partner_id = slot1 or 0
end

function SeerpalaceModel.getChangePartnerId(slot0)
	return slot0.change_partner_id
end

function SeerpalaceModel.setLastSummonGroupId(slot0, slot1)
	slot0.last_summon_group_id = slot1
end

function SeerpalaceModel.getLastSummonGroupId(slot0)
	return slot0.last_summon_group_id
end

function SeerpalaceModel.setFirstOpen(slot0, slot1)
	slot0.score_summon_is_open = slot1
end

function SeerpalaceModel.getFirstOpen(slot0)
	return slot0.score_summon_is_open or false
end

function SeerpalaceModel.updateScoreSummonRed(slot0)
	if slot0:getFirstOpen() and slot0:getScoreSummonRed() then
		MainSceneController:getInstance():setBuildRedStatus(CenterSceneBuild.seerpalace, true)
	else
		MainSceneController:getInstance():setBuildRedStatus(CenterSceneBuild.seerpalace, false)
	end
end

function SeerpalaceModel.getScoreSummonRed(slot0)
	slot0.role_vo = RoleController:getInstance():getRoleVo()

	if Config.RecruitHighData.data_seerpalace_const and slot1.recruit_vip and slot1.nature_score and slot1.light_dark_score and slot1.recruit_vip.val <= slot0.role_vo.vip_lev then
		if slot1.nature_score.val <= slot0.role_vo.predict_point then
			return true
		end

		if slot1.light_dark_score.val <= slot0.role_vo.predict_point then
			return true
		end
	end

	return false
end

function SeerpalaceModel.__delete(slot0)
end
