RoleEnv = RoleEnv or BaseClass(SysEnv)
slot0 = cc.FileUtils:getInstance():getWritablePath() .. "role_env/"
RoleEnv.keys = {
	godbattle_form = "godbattle_form",
	chief_war_show_form = "chief_war_show_form",
	barrage_type_key = "barrage_type_key",
	guild_war_form = "guild_war_form",
	bigworld_personal_log = "bigworld_personal_log",
	assistant_key = "assistant_key",
	undertown_dun_type = "undertown_dun_type",
	item_source_key = "item_source_key",
	artifact_count_tips = "artifact_count_tips",
	guide_step_list = "guide_step_list",
	guide_over_step = "over"
}

function RoleEnv.getInstance(slot0)
	if not slot0.is_init then
		slot0.is_init = true
	end

	return slot0
end

function RoleEnv.updateEventKey(slot0, slot1, slot2)
end

function RoleEnv.getKeys(slot0)
	return RoleEnv.keys
end

function RoleEnv.filepath(slot0)
	if RoleController:getInstance():getRoleVo() == nil then
		return
	end

	if not cc.FileUtils:getInstance():isDirectoryExist(uv0) then
		cc.FileUtils:getInstance():createDirectory(uv0)
	end

	return string.format("%srole_env_%d_%s_%d.lua", uv0, slot1.reg_time, slot1.srv_id, slot1.rid)
end
