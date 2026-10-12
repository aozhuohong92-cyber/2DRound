if not true then
	return
end

BattleDebug = BattleDebug or BaseClass(BaseController)

function BattleDebug.registerEvents(slot0)
	GlobalEvent:getInstance():Bind(BattleEvent.BATTLE_DEBUG, function ()
		uv0:open()
	end)
end

function BattleDebug.open(slot0)
	slot1 = ccui.Layout:create()

	slot1:setContentSize(cc.size(SCREEN_WIDTH, SCREEN_HEIGHT))
	slot1:setPosition(display.getLeft(slot1), display.getBottom(slot1))
	BattleController:getInstance():getModel():getBattleScene():addChild(slot1, 1000)
	slot1:setVisible(true)
	slot1:addChild(cc.DrawNode:create())

	slot4 = cc.c4f(0, 0, 0.8, 0.8)
	slot5 = cc.c4f(1, 0, 0.8, 0.8)
	slot6 = 80
	slot9 = {}
	slot10 = BattleController:getInstance():getModel().all_object
	slot16 = gridSizeY()

	Debug.log("========", slot6, gridSizeX(), slot16)

	slot11, slot12 = display.getScreenWH(slot1)

	for slot16 = 1, slot6 do
		if slot16 % 10 == 0 then
			slot3:drawLine(cc.p(slot16 * slot7, 0), cc.p(slot16 * slot7, slot12), slot5)
			slot3:drawLine(cc.p(0, slot16 * slot8), cc.p(slot11, slot16 * slot8), slot5)
		else
			slot3:drawLine(cc.p(slot16 * slot7, 0), cc.p(slot16 * slot7, slot12), slot4)
			slot3:drawLine(cc.p(0, slot16 * slot8), cc.p(slot11, slot16 * slot8), slot4)
		end
	end

	slot18 = 1
	slot13 = cc.c4f(0, 1, 0, slot18)

	function slot14(slot0, slot1)
		slot7 = 16
		uv0[slot0] = cc.Label:createWithSystemFont(slot0, DEFAULT_FONT, slot7)
		slot3 = nil

		for slot7, slot8 in pairs(uv1) do
			if slot8.pos == slot0 and slot8.obj_type == slot1 then
				slot3 = slot8
			end
		end

		if slot3 then
			slot2:setString(slot0 .. "_" .. slot3.object_name)
		end

		slot4 = gridPosToScreenPos(SkillAct.newPos2Gird(1, slot0, slot1 == BattleTypeConf.TYPE_ROLE))

		uv2:drawSolidRect(slot4, cc.p(slot4.x + uv3, slot4.y + uv4), uv5)
	end

	for slot18 = 1, 9 do
		slot14(slot18, BattleTypeConf.TYPE_ROLE)
		slot14(slot18, BattleTypeConf.TYPE_ENEMY)
	end
end
