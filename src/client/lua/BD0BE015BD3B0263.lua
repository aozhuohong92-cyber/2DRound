SaveLocalData = SaveLocalData or BaseClass()
SaveLocalData.key_value = {
	hide_other_player = "hide_other_player",
	music_volume = "music_volume",
	notice_version = "notice_version",
	gm_eidt_list = "gm_eidt_list",
	achieve_list = "achieve_list",
	stupid = "stupid",
	loginMode = "loginMode",
	voice = "voice",
	is_team_channel = "is_team_channel",
	usrNameList = "usrNameList",
	is_auto_team_voice = "is_auto_team_voice",
	last_login_accounts = "last_login_accounts",
	refuse_stranger_chat = "refuse_stranger_chat",
	srv_id = "srv_id",
	chat_greeting = "chat_greeting",
	isTourist = "isTourist",
	password = "password",
	is_auto_world_voice = "is_auto_world_voice",
	photo_id = "photo_id",
	is_world_channel = "is_world_channel",
	is_guild_channel = "is_guild_channel",
	is_show_scene_effect = "is_show_scene_effect",
	is_auto_guild_voice = "is_auto_guild_voice",
	audio_volume = "audio_volume",
	gm_cmd = "gm_cmd",
	is_auto_cross_voice = "is_auto_cross_voice",
	last_login_ip = "last_login_ip",
	setting = "setting",
	need_check_friend = "need_check_friend",
	usrName = "usrName",
	is_normal_smooth = "is_normal_smooth",
	lead_mission = "lead_mission",
	rid = "rid",
	voice_volume = "voice_volume",
	is_now_channel = "is_now_channel",
	refuse_add_friend = "refuse_add_friend",
	is_auto = "is_auto"
}

function SaveLocalData.getInstance(slot0)
	if not slot0.is_init then
		slot0.user_default = cc.UserDefault:getInstance()
		slot0.is_init = true
	end

	return slot0
end

function SaveLocalData.writeLuaData(slot0, slot1, slot2)
	if slot1 == nil then
		return
	end

	slot3 = type(slot2)

	delayRun(ViewManager:getInstance():getLayerByTag(ViewMgrTag.MSG_TAG), math.random(1, 100) / 100, function ()
		if uv0 == "table" then
			uv1.user_default:setStringForKey(uv3, uv1:writeLuaTable(uv2, 0))
			uv1.user_default:flush()
		elseif uv0 == "string" then
			uv1.user_default:setStringForKey(uv3, uv2)
			uv1.user_default:flush()
		elseif uv0 == "number" then
			uv1.user_default:setFloatForKey(uv3, uv2)
			uv1.user_default:flush()
		elseif uv0 == "boolean" then
			uv1.user_default:setBoolForKey(uv3, uv2)
			uv1.user_default:flush()
		end
	end)
end

function SaveLocalData.writeLuaTable(slot0, slot1, slot2)
	slot2 = slot2 or 0
	slot3 = ""

	for slot7, slot8 in pairs(slot1) do
		if type(slot7) == "string" then
			slot7 = string.format("%q", slot7)
		end

		slot9 = ""
		TypeV = type(slot8)

		if TypeV == "table" then
			slot9 = "{"
		end

		formatting = string.rep(" ", slot2) .. "[" .. slot7 .. "]" .. " = " .. slot9
		slot3 = TypeV == "table" and slot3 .. formatting .. "\n" .. SaveLocalData:writeLuaTable(slot8, slot2 + 1) .. slot10 .. "},\n" or slot3 .. formatting .. "\n" .. SaveLocalData:writeLuaTable(slot8, slot2 + 1) .. slot10 .. "},\n" .. formatting .. ((TypeV ~= "string" or string.format("%q", slot8)) and tostring(slot8)) .. ",\n"
	end

	return slot3
end

function SaveLocalData.readStringForKey(slot0, slot1)
	if slot1 == nil then
		return
	end

	return slot0.user_default:getStringForKey(slot1)
end

function SaveLocalData.readNumberForKey(slot0, slot1)
	if slot1 == nil then
		return
	end

	return slot0.user_default:getFloatForKey(slot1)
end

function SaveLocalData.readBooleanForKey(slot0, slot1)
	if slot1 == nil then
		return
	end

	return slot0.user_default:getBoolForKey(slot1)
end

function SaveLocalData.readTableForKey(slot0, slot1)
	if slot1 == nil then
		return
	end

	if slot0:readStringForKey(slot1) == "" or #slot2 == 0 then
		return {}
	elseif loadstring("return {" .. slot2 .. "}") == nil then
		return {}
	else
		return slot3()
	end
end

function SaveLocalData.readNumber(slot0, slot1, slot2)
	if slot0:readTableForKey(slot1) == nil or next(slot3) == nil then
		return 0
	end

	for slot7, slot8 in pairs(slot3) do
		if slot7 == slot2 then
			return slot8
		end
	end

	return 0
end

SaveLocalData.vision = "format.1.0"

function SaveLocalData.write_hero_stand_table(slot0, slot1, slot2)
	if (slot2 or 0) == 0 then
		slot3 = "" .. "Hero_Format_data = Hero_Format_data or {} \n" .. "Hero_Format_data.version = " .. string.format("%q", SaveLocalData.vision) .. "\n" .. "Hero_Format_data.data_list = { " .. "\n" .. "[" .. string.format("%q", player.srv_id .. "_" .. player.rid) .. "] = { \n"
	end

	if slot2 == 0 then
		slot3 = slot3 .. slot0:writeLuaTable(slot1) .. "\n" .. "}" .. "\n" .. "}"
	end

	slot0.user_default:setStringForKey(SaveLocalData.key_value.hero_stand_data, slot3)
	slot0.user_default:flush()
end

function SaveLocalData.read_hero_stand_table(slot0)
	if type(slot0:readTableForKey(SaveLocalData.key_value.hero_stand_data)) == "table" and #slot1 == 0 then
		return {}
	end

	if Hero_Format_data.version ~= SaveLocalData.vision then
		return {}
	end

	if Hero_Format_data ~= nil and Hero_Format_data.data_list ~= nil then
		if Hero_Format_data.data_list[player.srv_id .. "_" .. player.rid] ~= nil then
			return deepCopy(Hero_Format_data.data_list[slot2])
		else
			return {}
		end
	end
end
