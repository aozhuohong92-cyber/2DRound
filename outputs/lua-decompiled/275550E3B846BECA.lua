Report_Type = {
	Sign_In = "sign_in",
	Set_Level = "set_level",
	Mission_Failed = "mission_failed",
	Mission_Begin = "mission_begin",
	Pay = "pay",
	Sing_Off = "sign_off",
	Mission_Completed = "mission_completed",
	Event = "event"
}
UsingEN = false

function report_event(slot0)
	callFunc("onAnalyticsData", json.encode(slot0))
end

function _report_mission(slot0, slot1)
	slot2, slot3 = nil

	if slot0 == BattleConst.Fight_Type.Darma then
		if BattleDramaController:getInstance():getModel():getDramaData() then
			dun_id = slot4.max_dun_id

			if slot1 == Report_Type.Mission_Begin or slot1 == Report_Type.Mission_Failed then
				dun_id = slot4.dun_id
			end

			if Config.DungeonData.data_drama_dungeon_info(dun_id) then
				slot3 = "Drama_" .. slot5.floor
				slot2 = "副本" .. slot5.floor
			end
		else
			return
		end
	elseif slot0 == BattleConst.Fight_Type.StarTower then
		slot4 = (StartowerController:getInstance():getModel():getNowTowerId() or 0) + 1
		slot3 = "Startower_" .. slot4
		slot2 = "深海监狱" .. slot4
	else
		return
	end

	if not slot2 then
		return
	end

	return {
		usingen = UsingEN,
		keyCN = slot2,
		keyEN = slot3
	}
end

function report_sign_in()
	if LoginController:getInstance():getModel():getLoginData().srv_id == "" then
		return
	end

	if RoleController:getInstance():getRoleVo() then
		report_event({
			type = Report_Type.Sign_In,
			roleId = slot1.rid or 0
		})
	end
end

function report_sign_off()
	report_event({
		type = Report_Type.Sing_Off
	})
end

function report_level_up(slot0)
	report_event({
		type = Report_Type.Set_Level,
		level = slot0
	})
end

function report_pay(slot0, slot1, slot2)
end

function report_mission_begin(slot0)
	if not _report_mission(slot0, Report_Type.Mission_Begin) then
		return
	end

	slot1.type = Report_Type.Mission_Begin

	report_event(slot1)
end

function report_mission_completed(slot0)
	if not _report_mission(slot0) then
		return
	end

	slot1.type = Report_Type.Mission_Completed

	report_event(slot1)
end

function report_mission_failed(slot0)
	if not _report_mission(slot0, Report_Type.Mission_Failed) then
		return
	end

	slot1.type = Report_Type.Mission_Failed

	report_event(slot1)
end

function report_draw(slot0, slot1)
	slot2, slot3 = nil

	if slot0 == PartnersummonConst.Summon_Type.Normal then
		slot2 = "drawnormal"
		slot3 = "普通召唤"
	elseif slot0 == PartnersummonConst.Summon_Type.Friend then
		slot2 = "drawfriend"
		slot3 = "友情召唤"
	elseif slot0 == PartnersummonConst.Summon_Type.Advanced then
		slot2 = "drawadvanced"
		slot3 = "高级召唤"
	elseif slot0 == PartnersummonConst.Summon_Type.Score then
		slot2 = "drawscore"
		slot3 = "积分召唤"
	else
		return
	end

	if not slot3 then
		return
	end

	if slot1 > 1 then
		slot3 = slot3 .. slot1 .. "次"
		slot2 = slot2 .. slot1 .. "Times"
	end

	report_event({
		type = Report_Type.Event,
		keyEN = slot2,
		keyCN = slot3,
		usingen = UsingEN,
		extra = report_get_roledata() or {}
	})
end

function report_treasure(slot0, slot1)
	slot2, slot3 = nil

	if slot0 == 1 then
		slot3 = "幸运探宝"
		slot2 = "Treasure"
	elseif slot0 == 2 then
		slot3 = "高级探宝"
		slot2 = "TreasureAdvanced"
	end

	if not slot3 then
		return
	end

	if slot1 > 1 then
		slot3 = slot3 .. slot1 .. "次"
		slot2 = slot2 .. slot1 .. "Times"
	end

	report_event({
		type = Report_Type.Event,
		keyEN = slot2,
		keyCN = slot3,
		usingen = UsingEN,
		extra = report_get_roledata() or {}
	})
end

function report_gold_consume(slot0)
	if analysis_gold_consume then
		if slot0 == 0 then
			return
		end

		if slot0 > 0 then
			keyCN = "获得金币"
			keyEN = "GetGold"
		else
			keyCN = "消耗金币"
			keyEN = "ConsumeGold"
		end

		slot1 = {
			type = Report_Type.Event,
			keyEN = keyEN,
			keyCN = keyCN,
			usingen = UsingEN,
			extra = report_get_roledata() or {}
		}
		slot1.extra.changed = slot0

		report_event(slot1)
	else
		analysis_gold_consume = true
	end
end

function report_diamond_consume(slot0)
	if analysis_diamond_consume then
		if slot0 == 0 then
			return
		end

		if slot0 > 0 then
			keyCN = "获得钻石"
			keyEN = "GetDiamand"
		else
			keyCN = "消耗钻石"
			keyEN = "ConsumeDiamand"
		end

		slot1 = {
			type = Report_Type.Event,
			keyEN = keyEN,
			keyCN = keyCN,
			usingen = UsingEN,
			extra = report_get_roledata() or {}
		}
		slot1.extra.changed = slot0

		report_event(slot1)
	else
		analysis_diamond_consume = true
	end
end

function report_hero(slot0)
	if analysis_hero_change then
		if slot0 == 0 then
			return
		end

		if slot0 > 0 then
			keyCN = "获得英雄"
			keyEN = "GetHero"
		else
			keyCN = "删除英雄"
			keyEN = "DeleteHero"
		end

		slot1 = {
			type = Report_Type.Event,
			keyEN = keyEN,
			keyCN = keyCN,
			usingen = UsingEN,
			extra = report_get_roledata() or {}
		}
		slot1.extra.changed = slot0

		report_event(slot1)
	else
		analysis_hero_change = true
	end
end

function report_get_roledata()
	if LoginController:getInstance():getModel():getLoginData().srv_id == "" then
		return
	end

	slot1 = RoleController:getInstance():getRoleVo() or rdata

	return {
		serverId = serverId(slot1 and slot1.srv_id or slot0.srv_id),
		serverName = slot0.srv_name,
		roleId = slot1 and slot1.rid or 0,
		roleName = slot1 and slot1.name or "",
		level = slot1 and slot1.lev or 1
	}
end
