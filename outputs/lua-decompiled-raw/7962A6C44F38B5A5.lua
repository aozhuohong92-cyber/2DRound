SysEnv = SysEnv or BaseClass()
slot0 = cc.FileUtils:getInstance():getWritablePath() .. "sys_env_data.lua"
SysEnv.keys = {
	elfin_auto_buy_item = "elfin_auto_buy_item",
	spine_down_key = "spine_down_key",
	equip_sell_quality_5 = "equip_sell_quality_5",
	holy_sell_star_3 = "holy_sell_star_3",
	cache_chat = "cache_chat",
	holy_sell_star_2 = "holy_sell_star_2",
	equip_sell_quality_4 = "equip_sell_quality_4",
	usrNameList = "usrNameList",
	scene_quality = "scene_quality",
	holy_plan_save_tip = "holy_plan_save_tip",
	audio_volume = "audio_volume",
	equip_sell_quality_3 = "equip_sell_quality_3",
	mission_trace = "mission_trace",
	srv_id = "srv_id",
	equip_sell_star_3 = "equip_sell_star_3",
	gm_eidt_list = "gm_eidt_list",
	equip_sell_star_1 = "equip_sell_star_1",
	adventure_mine_skip_fight = "adventure_mine_skip_fight",
	welfare_redpoint = "welfare_redpoint",
	chat_red_open = "chat_red_open",
	auto_cross_voice = "auto_cross_voice",
	grow_fund_redpoint = "grow_fund_redpoint",
	res_check_3 = "res_check_3",
	holy_sell_step_3 = "holy_sell_step_3",
	video_first_open = "video_first_open",
	equip_sell_star_5 = "equip_sell_star_5",
	skip_recruit_anim = "skip_recruit_anim",
	user_proto_agree = "user_proto_agree",
	holy_sell_step_1 = "holy_sell_step_1",
	equip_sell_quality_2 = "equip_sell_quality_2",
	frist_open_game = "frist_open_game",
	usrName = "usrName",
	holy_sell_step_2 = "holy_sell_step_2",
	login_srv_sign = "login_srv_sign",
	rid = "rid",
	password = "password",
	holy_plan_wear_tip = "holy_plan_wear_tip",
	elfin_plan_save_tip = "elfin_plan_save_tip",
	music_is_open = "music_is_open",
	guild_first_open = "guild_first_open",
	equip_sell_all = "equip_sell_all",
	equip_sell_quality_1 = "equip_sell_quality_1",
	music_volume = "music_volume",
	arenateam_skip_fight = "arenateam_skip_fight",
	loading_png = "loading_png_form",
	holy_sell_star_1 = "holy_sell_star_1",
	user_proto_name_list = "user_proto_name_list",
	custom_head_info = "custom_head_info",
	equip_sell_star_2 = "equip_sell_star_2",
	holy_sell_star_5 = "holy_sell_star_5",
	message_push = "message_push",
	chat_greeting = "chat_greeting",
	res_check_4 = "res_check_4",
	auto_world_voice = "auto_world_voice",
	auto_guild_voice = "auto_guild_voice",
	audio_is_open = "audio_is_open",
	default_server_data = "default_server_data",
	voice_is_open = "voice_is_open",
	equip_sell_star_4 = "equip_sell_star_4",
	resources_down_key = "resources_down_key",
	adventure_series_fight = "adventure_series_fight",
	forge_artifact_num = "forge_artifact_num",
	voice_volume = "voice_volume",
	holy_sell_star_4 = "holy_sell_star_4",
	equip_sell_star_6 = "equip_sell_star_6",
	high_quality = "high_quality",
	adventure_skip_fight = "adventure_skip_fight"
}
SysEnv.files = {}

function SysEnv.getInstance(slot0)
	if not slot0.is_init then
		slot0:load()

		slot0.is_init = true
	end

	return slot0
end

function SysEnv.get(slot0, slot1, slot2)
	if slot1 == nil then
		return slot2
	end

	if slot0[slot1] ~= nil then
		return slot0[slot1]
	else
		return slot2
	end
end

function SysEnv.getNum(slot0, slot1, slot2)
	return slot0:get(slot1, slot2 or 0)
end

function SysEnv.getStr(slot0, slot1, slot2)
	return slot0:get(slot1, slot2 or "")
end

function SysEnv.getTable(slot0, slot1, slot2)
	return slot0:get(slot1, slot2 or {})
end

function SysEnv.getBool(slot0, slot1, slot2)
	return slot0:get(slot1, slot2 or false)
end

function SysEnv.set(slot0, slot1, slot2, slot3)
	if slot1 == nil then
		return
	end

	if type(slot2) ~= "table" and slot0[slot1] and slot0[slot1] == slot2 then
		return
	end

	slot0[slot1] = slot2

	slot0:updateEventKey(slot1, slot2)

	if slot3 == false then
		return
	end

	slot0:save()
end

function SysEnv.updateEventKey(slot0, slot1, slot2)
	if slot1 == SysEnv.keys.music_volume then
		AudioManager:getInstance():setMusicVolume(slot2 / 100)
	elseif slot1 == SysEnv.keys.audio_volume then
		AudioManager:getInstance():setEffectVolume(slot2 / 100)
	elseif slot1 == SysEnv.keys.voice_volume then
		AudioManager:getInstance():setRecordVolume(slot2 / 100)
	elseif slot1 == SysEnv.keys.music_is_open then
		if slot2 == false then
			AudioManager:getInstance():setMusicVolume(0)
		elseif slot2 == true then
			AudioManager:getInstance():setMusicVolume(SysEnv:getInstance():getNum(SysEnv.keys.music_volume, 100) / 100)
		end
	elseif slot1 == SysEnv.keys.audio_is_open then
		if slot2 == false then
			AudioManager:getInstance():setEffectVolume(0)
		elseif slot2 == true then
			AudioManager:getInstance():setEffectVolume(SysEnv:getInstance():getNum(SysEnv.keys.audio_volume, 100) / 100)
		end
	elseif slot1 == SysEnv.keys.voice_is_open then
		if slot2 == false then
			AudioManager:getInstance():setRecordVolume(0)
		elseif slot2 == true then
			AudioManager:getInstance():setRecordVolume(SysEnv:getInstance():getNum(SysEnv.keys.voice_volume, 100) / 100)
		end
	elseif slot1 == SysEnv.keys.scene_quality then
		-- Nothing
	elseif slot1 == SysEnv.keys.message_push then
		-- Nothing
	elseif slot1 == SysEnv.keys.mission_trace then
		-- Nothing
	elseif slot1 == SysEnv.keys.high_quality then
		if slot2 == false then
			EQUIPMENT_QUALITY = 1
		elseif slot2 == true then
			EQUIPMENT_QUALITY = 3
		end
	end
end

function SysEnv.getKeys(slot0)
	return SysEnv.keys
end

function SysEnv.filepath(slot0)
	return uv0
end

function SysEnv.load(slot0)
	if not slot0:filepath() then
		return
	end

	for slot6, slot7 in pairs(slot0:loadfile(slot1) or {}) do
		slot0[slot6] = slot7
	end
end

function SysEnv.save(slot0)
	if not slot0:filepath() then
		return
	end

	slot2 = "return {"
	slot3 = nil

	for slot8, slot9 in pairs(slot0:getKeys()) do
		v = slot0[slot9]

		if v ~= nil then
			if type(v) == "string" then
				v = "[[" .. v .. "]]"
			elseif slot3 == "table" then
				v = slot0:luaTable2Str(v, 1)
			else
				v = tostring(v)
			end

			slot2 = slot2 .. "\n  " .. slot9 .. "=" .. v .. ","
		end
	end

	return writeBinaryFile(slot1, slot2 .. "\n}")
end

function SysEnv.loadfile(slot0, slot1)
	if cc.FileUtils:getInstance():isFileExist(slot1) then
		print("load_file===>", slot1)

		slot2, slot3 = pcall(function ()
			return dofile(uv0)
		end)

		if slot2 and type(slot3) == "table" then
			return slot3
		end
	end

	return {}
end

function SysEnv.isFileExist(slot0)
	if slot0:filepath() and cc.FileUtils:getInstance():isFileExist(slot1) then
		return true
	end

	return false
end

function SysEnv.savefile(slot0, slot1, slot2)
	print("save_file===>", slot1)

	return writeBinaryFile(slot1, "return " .. slot0:luaTable2Str(slot2, 0))
end

function SysEnv.savefileOutKey(slot0, slot1, slot2)
	print("save_file===>", slot1)

	return writeBinaryFile(slot1, "return " .. slot0:otherLuaTable2Str(slot2, 0))
end

function SysEnv.otherLuaTable2Str(slot0, slot1, slot2)
	slot3 = "{\n"
	slot4 = string.rep("  ", slot2 or 0)

	for slot8, slot9 in pairs(slot1) do
		if type(slot8) == "string" then
			slot8 = string.format("%q", slot8)
		end

		TypeV = type(slot9)
		slot3 = slot3 .. slot4 .. "  " .. ((TypeV ~= "table" or slot0:luaTable2Str(slot9, slot2 + 1)) and (TypeV ~= "string" or string.format("%q", slot0:luaTable2Str(slot9, slot2 + 1))) and tostring(string.format("%q", slot0:luaTable2Str(slot9, slot2 + 1)))) .. ",\n"
	end

	return slot3 .. slot4 .. "}"
end

function SysEnv.luaTable2Str(slot0, slot1, slot2)
	slot3 = "{\n"
	slot4 = string.rep("  ", slot2 or 0)

	for slot8, slot9 in pairs(slot1) do
		if type(slot8) == "string" then
			slot8 = string.format("%q", slot8)
		end

		TypeV = type(slot9)
		slot3 = slot3 .. slot4 .. "  [" .. slot8 .. "] = " .. ((TypeV ~= "table" or slot0:luaTable2Str(slot9, slot2 + 1)) and (TypeV ~= "string" or string.format("%q", slot0:luaTable2Str(slot9, slot2 + 1))) and tostring(string.format("%q", slot0:luaTable2Str(slot9, slot2 + 1)))) .. ",\n"
	end

	return slot3 .. slot4 .. "}"
end

slot1 = {}
slot2 = {}
slot3 = {}

function SysEnv.loadRankFile(slot0, slot1, slot2)
	slot3 = 0

	if slot2 == true then
		slot3 = 1
	end

	if uv0[getNorKey(slot1, slot3)] ~= nil then
		return uv0[getNorKey(slot1, slot3)]
	end

	slot4 = cc.FileUtils:getInstance():getWritablePath() .. "rank_env/" .. slot3 .. "/"

	if RoleController:getInstance():getRoleVo() == nil then
		return
	end

	if not cc.FileUtils:getInstance():isDirectoryExist(slot4 .. getNorKey(slot5.rid, slot5.main_srv_id) .. "/") then
		cc.FileUtils:getInstance():createDirectory(slot4)
	end

	uv0[slot1] = slot0:loadfile(slot4 .. "rank_data_" .. slot1 .. ".lua")

	return uv0[slot1]
end

function SysEnv.saveResourcesFile(slot0, slot1)
	if not cc.FileUtils:getInstance():isDirectoryExist(cc.FileUtils:getInstance():getWritablePath() .. "resources_env/") then
		cc.FileUtils:getInstance():createDirectory(slot2)
	end

	slot0:savefileOutKey(slot2 .. "resources_data.lua", slot1)
end

function SysEnv.loadResourcesFile(slot0)
	if not cc.FileUtils:getInstance():isDirectoryExist(cc.FileUtils:getInstance():getWritablePath() .. "resources_env/") then
		cc.FileUtils:getInstance():createDirectory(slot1)
	end

	return slot0:loadfile(slot1 .. "resources_data.lua")
end

function SysEnv.saveRankFile(slot0, slot1, slot2, slot3, slot4)
	slot5 = 0

	if slot4 == true then
		slot5 = 1
	end

	slot6 = cc.FileUtils:getInstance():getWritablePath() .. "rank_env/" .. slot5 .. "/"

	if RoleController:getInstance():getRoleVo() == nil then
		return
	end

	if not cc.FileUtils:getInstance():isDirectoryExist(slot6 .. getNorKey(slot7.rid, slot7.main_srv_id) .. "/") then
		cc.FileUtils:getInstance():createDirectory(slot6)
	end

	slot9 = {
		timestamp = slot2,
		data = slot3
	}

	slot0:savefile(slot6 .. "rank_data_" .. slot1 .. ".lua", slot9)

	uv0[slot1] = slot9
end

function SysEnv.saveFormFile(slot0, slot1, slot2)
	slot3 = cc.FileUtils:getInstance():getWritablePath() .. "form_env/"

	if RoleController:getInstance():getRoleVo() == nil then
		return
	end

	if not cc.FileUtils:getInstance():isDirectoryExist(slot3 .. getNorKey(slot4.rid, slot4.main_srv_id) .. "/") then
		cc.FileUtils:getInstance():createDirectory(slot3)
	end

	slot6 = {
		type = slot1,
		data = slot2
	}

	slot0:savefile(slot3 .. "form_data_" .. slot1 .. ".lua", slot6)

	uv0[slot1] = slot6
end

function SysEnv.loadFormFile(slot0, slot1)
	if uv0[slot1] ~= nil then
		return uv0[slot1]
	end

	slot2 = cc.FileUtils:getInstance():getWritablePath() .. "form_env/"

	if RoleController:getInstance():getRoleVo() == nil then
		return
	end

	if not cc.FileUtils:getInstance():isDirectoryExist(slot2 .. getNorKey(slot3.rid, slot3.main_srv_id) .. "/") then
		cc.FileUtils:getInstance():createDirectory(slot2)
	end

	uv0[slot1] = slot0:loadfile(slot2 .. "form_data_" .. slot1 .. ".lua")

	return uv0[slot1]
end

function SysEnv.saveBigWorldFormFile(slot0, slot1)
	slot2 = cc.FileUtils:getInstance():getWritablePath() .. "form_env/"

	if RoleController:getInstance():getRoleVo() == nil then
		return
	end

	if not cc.FileUtils:getInstance():isDirectoryExist(slot2 .. getNorKey(slot3.rid, slot3.main_srv_id) .. "/") then
		cc.FileUtils:getInstance():createDirectory(slot2)
	end

	slot5 = slot1

	slot0:savefile(slot2 .. "big_world_data.lua", slot5)

	uv0 = slot5
end

function SysEnv.loadBigWorldFormFile(slot0)
	if uv0 ~= nil and next(uv0) ~= nil then
		return uv0
	end

	slot1 = cc.FileUtils:getInstance():getWritablePath() .. "form_env/"

	if RoleController:getInstance():getRoleVo() == nil then
		return
	end

	if not cc.FileUtils:getInstance():isDirectoryExist(slot1 .. getNorKey(slot2.rid, slot2.main_srv_id) .. "/") then
		cc.FileUtils:getInstance():createDirectory(slot1)
	end

	uv0 = slot0:loadfile(slot1 .. "big_world_data.lua")

	return uv0
end

function SysEnv.loadPrivateChatFile(slot0, slot1, slot2)
	slot3 = cc.FileUtils:getInstance():getWritablePath() .. "chat_env/"

	if RoleController:getInstance():getRoleVo() == nil then
		return
	end

	if not cc.FileUtils:getInstance():isDirectoryExist(slot3 .. getNorKey(slot4.rid, slot4.srv_id) .. "/") then
		cc.FileUtils:getInstance():createDirectory(slot3)
	end

	return (slot0:loadfile(slot3 .. "chat_" .. slot4.srv_id .. "_" .. slot4.rid .. "_" .. slot1 .. "_" .. slot2 .. ".lua") or {}).talk_list
end

function SysEnv.savePrivateChatFile(slot0, slot1, slot2, slot3)
	slot4 = cc.FileUtils:getInstance():getWritablePath() .. "chat_env/"

	if RoleController:getInstance():getRoleVo() == nil then
		return
	end

	if not cc.FileUtils:getInstance():isDirectoryExist(slot4 .. getNorKey(slot5.rid, slot5.srv_id) .. "/") then
		cc.FileUtils:getInstance():createDirectory(slot4)
	end

	slot0:savefile(slot4 .. "chat_" .. slot5.srv_id .. "_" .. slot5.rid .. "_" .. slot1 .. "_" .. slot2 .. ".lua", {
		talk_list = slot3
	})
end

function SysEnv.saveContactListFile(slot0, slot1)
	slot2 = cc.FileUtils:getInstance():getWritablePath() .. "private_chat_env/"

	if RoleController:getInstance():getRoleVo() == nil then
		return
	end

	if not cc.FileUtils:getInstance():isDirectoryExist(slot2 .. getNorKey(slot3.rid, slot3.srv_id) .. "/") then
		cc.FileUtils:getInstance():createDirectory(slot2)
	end

	slot0:savefile(slot2 .. "private_chat_" .. slot3.srv_id .. "_" .. slot3.rid .. ".lua", {
		contact_list = slot1
	})
end

function SysEnv.loadContactListFile(slot0)
	slot1 = cc.FileUtils:getInstance():getWritablePath() .. "private_chat_env/"

	if RoleController:getInstance():getRoleVo() == nil then
		return
	end

	if not cc.FileUtils:getInstance():isDirectoryExist(slot1 .. getNorKey(slot2.rid, slot2.srv_id) .. "/") then
		cc.FileUtils:getInstance():createDirectory(slot1)
	end

	return (slot0:loadfile(slot1 .. "private_chat_" .. slot2.srv_id .. "_" .. slot2.rid .. ".lua") or {}).contact_list
end

function SysEnv.saveDramaTipsFile(slot0, slot1)
	slot2 = cc.FileUtils:getInstance():getWritablePath() .. "drama_tips_env/"

	if RoleController:getInstance():getRoleVo() == nil then
		return
	end

	if not cc.FileUtils:getInstance():isDirectoryExist(slot2 .. getNorKey(slot3.rid, slot3.srv_id) .. "/") then
		cc.FileUtils:getInstance():createDirectory(slot2)
	end

	slot2 = slot2 .. "drama_tips_" .. slot3.srv_id .. "_" .. slot3.rid .. ".lua"

	if not ({})[slot1.dun_id] then
		slot5[slot1.dun_id] = {
			dun_id = slot1.dun_id
		}
	end

	slot0:savefile(slot2, slot5)
end

function SysEnv.loadDramaTipsFile(slot0)
	slot1 = cc.FileUtils:getInstance():getWritablePath() .. "drama_tips_env/"

	if RoleController:getInstance():getRoleVo() == nil then
		return
	end

	if not cc.FileUtils:getInstance():isDirectoryExist(slot1 .. getNorKey(slot2.rid, slot2.srv_id) .. "/") then
		cc.FileUtils:getInstance():createDirectory(slot1)
	end

	return slot0:loadfile(slot1 .. "drama_tips_" .. slot2.srv_id .. "_" .. slot2.rid .. ".lua") or {}
end

function SysEnv.saveArtifactLockStatus(slot0, slot1)
	slot2 = cc.FileUtils:getInstance():getWritablePath() .. "artifact_lock_env/"

	if RoleController:getInstance():getRoleVo() == nil then
		return
	end

	if not cc.FileUtils:getInstance():isDirectoryExist(slot2 .. getNorKey(slot3.rid, slot3.srv_id) .. "/") then
		cc.FileUtils:getInstance():createDirectory(slot2)
	end

	slot0:savefile(slot2 .. "artifact_lock_" .. slot3.srv_id .. "_" .. slot3.rid .. ".lua", {
		lock_status = slot1
	})
end

function SysEnv.loadArtifactLockStatus(slot0)
	slot1 = cc.FileUtils:getInstance():getWritablePath() .. "artifact_lock_env/"

	if RoleController:getInstance():getRoleVo() == nil then
		return
	end

	if not cc.FileUtils:getInstance():isDirectoryExist(slot1 .. getNorKey(slot2.rid, slot2.srv_id) .. "/") then
		cc.FileUtils:getInstance():createDirectory(slot1)
	end

	return (slot0:loadfile(slot1 .. "artifact_lock_" .. slot2.srv_id .. "_" .. slot2.rid .. ".lua") or {}).lock_status
end

function SysEnv.saveGuildActiveIconId(slot0, slot1)
	slot2 = cc.FileUtils:getInstance():getWritablePath() .. "guild_active_env/"

	if RoleController:getInstance():getRoleVo() == nil then
		return
	end

	if not cc.FileUtils:getInstance():isDirectoryExist(slot2 .. getNorKey(slot3.rid, slot3.srv_id) .. "/") then
		cc.FileUtils:getInstance():createDirectory(slot2)
	end

	slot0:savefile(slot2 .. "guild_active_" .. slot3.srv_id .. "_" .. slot3.rid .. ".lua", {
		active_icon_id = slot1
	})
end

function SysEnv.loadGuildActiveIconId(slot0)
	slot1 = cc.FileUtils:getInstance():getWritablePath() .. "guild_active_env/"

	if RoleController:getInstance():getRoleVo() == nil then
		return
	end

	if not cc.FileUtils:getInstance():isDirectoryExist(slot1 .. getNorKey(slot2.rid, slot2.srv_id) .. "/") then
		cc.FileUtils:getInstance():createDirectory(slot1)
	end

	if not (slot0:loadfile(slot1 .. "guild_active_" .. slot2.srv_id .. "_" .. slot2.rid .. ".lua") or {}).active_icon_id and Config.GuildQuestData.data_lev_data[GuildController:getInstance():getModel():getGuildActiveLev()] then
		slot4.active_icon_id = slot6.res_id
	end

	return slot4.active_icon_id or 1
end

function SysEnv.saveAllServerListFile(slot0)
	if not LoginController:getInstance():getModel():getServerListData() then
		return
	end

	if not cc.FileUtils:getInstance():isDirectoryExist(cc.FileUtils:getInstance():getWritablePath() .. "server_list_env/") then
		cc.FileUtils:getInstance():createDirectory(slot2)
	end

	slot0:savefile(slot2 .. "server_list_data.lua", slot1)
end

function SysEnv.loadAllServerListFile(slot0)
	if not cc.FileUtils:getInstance():isDirectoryExist(cc.FileUtils:getInstance():getWritablePath() .. "server_list_env/") then
		cc.FileUtils:getInstance():createDirectory(slot1)
	end

	return slot0:loadfile(slot1 .. "server_list_data.lua") or {}
end
