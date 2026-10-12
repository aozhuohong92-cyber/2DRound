RoleVo = RoleVo or BaseClass(EventDispatcher)

function RoleVo.__init(slot0)
	slot0.rid = 0
	slot0.srv_id = ""
	slot0.main_srv_id = ""
	slot0.name = 0
	slot0.lev = 0
	slot0.is_vip = 0
	slot0.vip_lev = 0
	slot0.vip_exp = 0
	slot0.is_show_vip = 0
	slot0.sex = 0
	slot0.career = 0
	slot0.face_id = ""
	slot0.gid = 0
	slot0.gsrv_id = ""
	slot0.position = 0
	slot0.gname = ""
	slot0.signature = ""
	slot0.exp_max = 0
	slot0.exp_total_nextlev = 0
	slot0.buffs = {}
	slot0.reg_time = 0
	slot0.guild_lev = 0
	slot0.power = 0
	slot0.is_first_rename = TRUE
	slot0.avatar_base_id = 0
	slot0.guild_quit_time = 0
	slot0.max_power = 0
	slot0.fans_num = 0
	slot0.arena_elite_lev = 0
	slot0.city_id = 0
	slot0.backdrop_id = 0
	slot0.is_open_home = 0
	slot0.exp = 0
	slot0.gold = 0
	slot0.gold_acc = 0
	slot0.red_gold = 0
	slot0.coin = 0
	slot0.klb = 0
	slot0.silver_coin = 0
	slot0.energy = 0
	slot0.energy_max = 0
	slot0.arena_cent = 0
	slot0.activity = 0
	slot0.guild = 0
	slot0.hero_soul = 0
	slot0.friend_point = 0
	slot0.boss_point = 0
	slot0.star_hun = 0
	slot0.star_point = 0
	slot0.worship = 0
	slot0.cross_cham_worship = 0
	slot0.look_id = 0
	slot0.arena_coin = 0
	slot0.arena_guesscent = 0
	slot0.auto_pk = 0
	slot0.sky_coin = 0
	slot0.recruit_hero = 0
	slot0.recruithigh_hero = 0
	slot0.hero_exp = 0
	slot0.open_day = 0
	slot0.cluster_coin = 0
	slot0.home_coin = 0
	slot0.hallow_refine = 0
	slot0.cluster_guess_coin = 0
	slot0.cluster_guess_cent = 0
	slot0.feather_exchange = 0
	slot0.peak_guess_cent = 0
	slot0.acc_recruit_hero = 0
	slot0.predict_point = 0
	slot0.dic_action_assets = {}
	slot0.pass_certify = 2
	slot0.custom_face_file = ""
	slot0.face_file = ""
	slot0.face_update_time = 0
end

function RoleVo.getRoleSrid(slot0)
	return getNorKey(slot0.srv_id, slot0.rid)
end

function RoleVo.isSameRole(slot0, slot1, slot2)
	return slot0.srv_id == slot1 and slot0.rid == slot2
end

function RoleVo.getGuildSrid(slot0)
	return slot0.gsrv_id .. "_" .. slot0.gid
end

function RoleVo.isHasGuild(slot0)
	return slot0.gid ~= 0
end

function RoleVo.initAttributeData(slot0, slot1)
	for slot6, slot7 in pairs(slot1 or {}) do
		if type(slot7) ~= "table" then
			slot0:setRoleAttribute(slot6, slot7)
		end
	end
end

function RoleVo.initActionAssetsData(slot0, slot1, slot2)
	if not slot0.dic_action_assets then
		return
	end

	for slot7, slot8 in ipairs(slot1 or {}) do
		slot0.dic_action_assets[slot8.id] = slot8.val

		if slot2 then
			slot0:Fire(RoleEvent.UPDATE_ROLE_ACTION_ASSETS, slot8.id, slot8.val)
		end
	end
end

function RoleVo.getActionAssetsNumByBid(slot0, slot1)
	if slot0.dic_action_assets and slot0.dic_action_assets[slot1] then
		return slot0.dic_action_assets[slot1]
	else
		return 0
	end
end

function RoleVo.setRoleAttribute(slot0, slot1, slot2)
	if slot0[slot1] ~= slot2 or slot1 == "face_id" then
		if slot1 == "coin" or slot1 == "gold" then
			if slot1 == "coin" then
				report_gold_consume(slot2 - (slot0[slot1] or 0))
			elseif slot1 == "gold" then
				report_diamond_consume(slot4)
			end
		end

		slot0[slot1] = slot2

		slot0:dispatchUpdateAttrByKey(slot1, slot2)
	end
end

function RoleVo.dispatchUpdateAttrByKey(slot0, slot1, slot2)
	slot0:Fire(RoleEvent.UPDATE_ROLE_ATTRIBUTE, slot1, slot2)
end

function RoleVo.setPower(slot0, slot1)
	slot0.power = slot1 or 0

	if slot0.power ~= slot0.power then
		slot0:dispatchUpdateAttrByKey("power", slot0.power)
		slot0:Fire(RoleEvent.UPDATE_POWER_VALUE, slot0.power, slot2)
	end
end

function RoleVo.setMaxPower(slot0, slot1)
	slot0.max_power = slot1 or 0

	if slot0.max_power ~= slot0.max_power then
		slot0:dispatchUpdateAttrByKey("max_power", slot0.max_power)
	end
end

function RoleVo.setBuffVo(slot0, slot1)
	for slot6, slot7 in pairs(slot1) do
		slot9 = nil

		((not slot0.buffs[slot7.bid] or slot0.buffs[slot8]) and BuffVo.New()):initVo(slot7)
	end

	slot0:setRoleAttribute("buffs", {
		[slot8] = slot9
	})
end

function RoleVo.getBuffVo(slot0)
	return slot0.buffs
end

function RoleVo.setRoleAssset(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		if Config.ItemData.data_assets_id2label[slot6.label] ~= nil then
			slot0:setRoleAttribute(slot8, tonumber(slot6.val))
		end
	end
end

function RoleVo.setAllDataStatus(slot0, slot1)
	slot0.is_get_all_data = slot1
end

function RoleVo.isGetAllData(slot0)
	return slot0.is_get_all_data
end

function RoleVo.getRoleName(slot0)
	return slot0.name
end

function RoleVo.getRoleMainSrvId(slot0)
	return slot0.main_srv_id or ""
end

function RoleVo.setVolume(slot0, slot1)
	slot0.volume = slot1 or 0
end

function RoleVo.dispatchUpdateBaseAttr(slot0)
	slot0:Fire(RoleEvent.UPDATE_ROLE_BASE_ATTR)
end

function RoleVo.dispatchUpdateAssets(slot0)
	slot0:Fire(RoleEvent.UPDATE_ROLE_ASSETS)
end

function RoleVo.setRoleHeadList(slot0, slot1)
	slot0:setRoleAttribute("face_list", slot1.face_list)
end

function RoleVo.__delete(slot0)
end
