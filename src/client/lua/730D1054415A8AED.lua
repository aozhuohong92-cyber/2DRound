module("BattleUtil", package.seeall)
require("script/battle/BattleLayer")

function playerBattleReportById(slot0, slot1, slot2, slot3)
	slot4 = slot0 or tolua.cast(slot1:getUserObject(), "CCInteger"):getValue()

	if slot3 == nil then
		slot3 = true
	end

	if slot4 == nil then
		print("p_reportId", slot0)
		print("userobject", tolua.cast(slot1:getUserObject(), "CCInteger"):getValue())
		error("error in function playerBattleReportById p_reportId = nil")

		return
	end

	require("script/ui/mail/MailService")
	MailService.getRecord(slot4, function (slot0)
		require("script/ui/guild/city/VisitorBattleLayer")
		BattleLayer.showBattleWithString(slot0, nil, VisitorBattleLayer.createAfterBattleLayer({
			server = amf3.decode(Base64.decodeWithZip(slot0))
		}, nil, uv0), nil, nil, nil, nil, nil, true, nil, true)
	end)
end

function playTwoBattle(slot0, slot1, slot2)
	slot3, slot4 = nil

	function slot5(...)
		require("script/ui/guild/city/VisitorBattleLayer")
		BattleLayer.showBattleWithString(uv0, nil, VisitorBattleLayer.createAfterBattleLayer({
			server = amf3.decode(Base64.decodeWithZip(uv0))
		}, nil, uv1), nil, nil, nil, nil, nil, p_showFightForce)
	end

	require("script/ui/mail/MailService")
	MailService.getRecord(slot0, function (slot0)
		uv0 = slot0

		MailService.getRecord(uv1, function (slot0)
			uv0 = slot0
			slot1 = CCLayer:create()

			slot1:registerScriptHandler(function (slot0)
				if slot0 == "enter" then
					performCallfunc(function (...)
						BattleLayer.closeLayer()
						uv0()
					end, 0.5)
				end
			end)
			BattleLayer.showBattleWithString(uv2, nil, slot1, nil, nil, nil, nil, nil, p_showFightForce)
		end)
	end)
end

function playerTestBattleReportById(slot0, slot1, slot2, slot3)
	slot4 = slot0 or tolua.cast(slot1:getUserObject(), "CCInteger"):getValue()

	if slot3 == nil then
		slot3 = true
	end

	if slot4 == nil then
		print("p_reportId", slot0)
		print("userobject", tolua.cast(slot1:getUserObject(), "CCInteger"):getValue())
		error("error in function playerBattleReportById p_reportId = nil")

		return
	end

	require("script/ui/mail/MailService")
	MailService.getRecord(slot4, function (slot0)
		require("script/ui/guild/city/VisitorBattleLayer")
		require("script/fight/FightScene")
		FightScene.setReportLayer(VisitorBattleLayer.createAfterBattleLayer({
			server = amf3.decode(Base64.decodeWithZip(slot0))
		}, nil, uv0))
		FightScene.showFightWithString(slot0)
	end)
end
