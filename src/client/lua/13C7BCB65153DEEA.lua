GameMath = GameMath or {}
GameMath.DirRight = 6
GameMath.DirLeft = 4
GameMath.DirLeftTop = 2
GameMath.DirRightTop = 8

function GameMath.GetDirectionNumberHV(slot0)
	if radianToDegree(cc.pGetAngle(cc.p(1, 0), cc.p(slot0.x, slot0.y))) < 0 then
		slot4 = 360 + slot4
	end

	return slot4 >= 90 and slot4 <= 270 and 6 or 4
end

function GameMath.GetDirectionNumberHVII(slot0)
	if radianToDegree(cc.pGetAngle(cc.p(1, 0), cc.p(slot0.x, slot0.y))) < 0 then
		slot4 = 360 + slot4
	end

	return slot4 > 10 and slot4 < 90 and 2 or slot4 >= 90 and slot4 < 170 and 6 or slot4 >= 170 and slot4 <= 270 and 8 or 4
end

function GameMath.IsPointNear(slot0, slot1, slot2, slot3, slot4)
	slot4 = slot4 or 1
	slot5 = slot0 - slot2
	slot6 = slot1 - slot3

	return slot5 * slot5 + slot6 * slot6 <= slot4 * slot4
end

function GameMath.Round(slot0)
	slot1, slot2 = math.modf(slot0)

	if slot2 > 0.5 then
		slot1 = slot1 + 1
	end

	return slot1
end

function GameMath.RoundWithPercentCeil(slot0, slot1)
	slot2, slot3 = math.modf(slot0)

	if slot1 < math.abs(slot3) then
		slot2 = slot2 + 1
	end

	return slot2
end

function GameMath.RoundWithPercentFloor(slot0, slot1)
	slot2, slot3 = math.modf(slot0)

	if math.abs(slot3) < slot1 then
		return slot2
	end

	return slot2 + 1
end

function GameMath.GetIntPart(slot0)
	if math.ceil(slot0) == slot0 then
		return slot1
	else
		return slot1 - 1
	end
end

function GameMath.GetFloatPart(slot0)
	return slot0 - GameMath.GetIntPart(slot0)
end

function GameMath.NormalizeDegree(slot0)
	slot2 = 360

	if slot0 > 0 then
		while slot2 < slot1 do
			slot1 = slot1 - slot2
		end
	elseif slot1 < 0 then
		while slot1 < 0 do
			slot1 = slot1 + slot2
		end
	end

	return slot1
end

function GameMath.GetRealActionName(slot0, slot1)
	if slot0 == PlayerAction.battle_stand then
		if slot1 == GameMath.DirRightTop or slot1 == GameMath.DirLeft then
			return PlayerAction.battle_stand
		else
			return PlayerAction.stand_1
		end
	elseif slot0 == PlayerAction.run then
		if slot1 == GameMath.DirRightTop or slot1 == GameMath.DirLeft then
			return PlayerAction.run
		else
			return PlayerAction.run_1
		end
	end

	return slot0
end

function GameMath.HitRectTest(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot0 < slot2 or slot0 >= slot2 + slot4 or slot1 < slot3 or slot1 >= slot3 + slot5 then
		return false
	end

	return true
end

function GameMath.GetDistance(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot0 - slot2
	slot6 = slot1 - slot3
	slot7 = slot5 * slot5 + slot6 * slot6

	if slot4 then
		return math.pow(slot7, 0.5)
	end

	return slot7
end

function GameMath.GetNearestPoint(slot0, slot1, slot2, slot3)
	slot4 = nil
	slot5 = -1

	for slot9, slot10 in pairs(slot0) do
		slot11 = nil
		slot11 = (get_point_handler ~= nil or GameMath.GetDistance(slot1, slot2, slot10.x, slot10.y)) and GameMath.GetDistance(slot1, slot2, slot3(slot10))

		if slot5 == -1 or slot11 < slot5 then
			slot4 = slot10
			slot5 = slot11
		end
	end

	return slot4
end

function GameMath.FuzzyEqual(slot0, slot1, slot2)
	if math.abs(slot0 - slot1) < (slot2 or 0.01) / 2 then
		return true
	end

	return false
end

function GameMath.IsPointNearRect(slot0, slot1, slot2, slot3, slot4)
	if slot0 >= slot2 - slot4 and slot0 <= slot2 + slot4 and slot1 >= slot3 - slot4 and slot1 <= slot3 + slot4 then
		return true
	end

	return false
end

function GameMath.round(slot0)
	slot1, slot2 = math.modf(slot0)

	if slot2 >= 0.5 then
		return slot1 + 1
	else
		return slot1
	end
end

function GameMath.nextPos(slot0, slot1, slot2)
	slot5 = cc.pMul(cc.pNormalize(cc.pSub(slot1, slot0)), slot2)

	return cc.pAdd(slot0, slot5), slot5
end

function GameMath.moveDir(slot0, slot1, slot2)
	return cc.pMul(cc.pNormalize(cc.pSub(slot1, slot0)), slot2)
end
