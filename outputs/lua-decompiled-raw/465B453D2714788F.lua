HomeTile = HomeTile or {}
slot0 = 20
slot1 = 30
slot2 = 4
slot3 = 8
slot4 = 1000
HOME_TILE_TYPE_LAND = 20
HOME_TILE_TYPE_L_WALL = 21
HOME_TILE_TYPE_R_WALL = 22

function HomeTile.init(slot0, slot1, slot2, slot3)
	HomeTile.tile_w = slot0
	HomeTile.tile_h = slot1
	HomeTile.width = slot2
	HomeTile.height = slot3
	HomeTile.tile_max_w = math.floor(slot2 / slot0) + 1
	HomeTile.tile_max_h = math.floor(slot3 / slot1) + 1
	HomeTile.grid_max_w = math.floor(HomeTile.tile_max_w / uv0)
	HomeTile.grid_max_h = math.floor(HomeTile.tile_max_h / uv1)
end

function HomeTile.gridList(slot0, slot1)
	slot2 = math.floor(slot0 / uv0)
	slot3 = math.floor(slot1 / uv1)
	slot5 = slot1 % uv1
	slot6 = slot2
	slot7 = slot2
	slot8 = slot3
	slot9 = slot3

	if slot2 > 0 and slot0 % uv0 < uv2 then
		slot6 = slot2 - 1
	elseif slot2 < HomeTile.grid_max_w and uv0 - slot4 < uv2 then
		slot7 = slot2 + 1
	end

	if slot3 > 0 and slot5 < uv3 then
		slot8 = slot3 - 1
	elseif slot3 < HomeTile.grid_max_h and uv1 - slot5 < uv3 then
		slot9 = slot3 + 1
	end

	slot10 = {}

	for slot14 = slot6, slot7 do
		for slot18 = slot8, slot9 do
			table.insert(slot10, {
				slot14,
				slot18
			})
		end
	end

	return slot10
end

function HomeTile.lineInfo(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6, slot7 = HomeTile.indexPixel(HOME_TILE_TYPE_LAND, slot1)
	slot9 = GameNet:getInstance():getTime()

	if slot3 - slot4 > 0 and slot9 < slot3 then
		slot10, slot11 = HomeTile.indexPixel(HOME_TILE_TYPE_LAND, slot0)
		slot12 = slot5 / slot8
		slot13 = cc.pSub(cc.p(slot6, slot7), cc.p(slot10, slot11))

		return cc.pAdd(cc.p(slot10, slot11), cc.pMul(cc.pNormalize(slot13), cc.pGetLength(slot13) - (slot3 - slot9) * slot12)), slot12, false
	else
		return cc.p(slot6, slot7), 200, true
	end
end

function HomeTile.indexPixel(slot0, slot1)
	slot2, slot3 = HomeTile.indexTile(slot1)

	return HomeTile.toPixel(slot0, slot2, slot3)
end

function HomeTile.indexTile(slot0)
	return math.floor(slot0 / uv0), slot0 % uv0
end

function HomeTile.tileIndex(slot0, slot1)
	return slot0 * uv0 + slot1
end

function HomeTile.toPixel(slot0, slot1, slot2)
	if slot0 == HOME_TILE_TYPE_L_WALL then
		return (slot1 - 1 + slot2 % 2 / 2) * HomeTile.tile_w * 2 + HomeTile.tile_w * 0.5, (slot2 - 1) * HomeTile.tile_h + HomeTile.tile_h * 0.5
	elseif slot0 == HOME_TILE_TYPE_R_WALL then
		return (slot1 - 1 + slot2 % 2 / 2) * HomeTile.tile_w * 2 + HomeTile.tile_w * 0.5, (slot2 - 1) * HomeTile.tile_h - HomeTile.tile_h * 0.5
	else
		return (slot1 - 1 + slot2 % 2 / 2) * HomeTile.tile_w * 2, (slot2 - 1) * HomeTile.tile_h
	end
end

function HomeTile.toPixelLeft(slot0, slot1, slot2)
	if slot0 == HOME_TILE_TYPE_L_WALL then
		return (slot1 - 1 + slot2 % 2 / 2) * HomeTile.tile_w * 2, slot2 * HomeTile.tile_h
	elseif slot0 == HOME_TILE_TYPE_R_WALL then
		return (slot1 - 1 + slot2 % 2 / 2) * HomeTile.tile_w * 2, slot2 * HomeTile.tile_h
	else
		return (slot1 - 1.5 + slot2 % 2 / 2) * HomeTile.tile_w * 2, (slot2 - 1) * HomeTile.tile_h
	end
end

function HomeTile.toPixelRight(slot0, slot1, slot2)
	if slot0 == HOME_TILE_TYPE_L_WALL then
		return (slot1 - 0.5 + slot2 % 2 / 2) * HomeTile.tile_w * 2, (slot2 - 1) * HomeTile.tile_h
	elseif slot0 == HOME_TILE_TYPE_R_WALL then
		return (slot1 - 0.5 + slot2 % 2 / 2) * HomeTile.tile_w * 2, (slot2 - 3) * HomeTile.tile_h
	else
		return (slot1 - 0.5 + slot2 % 2 / 2) * HomeTile.tile_w * 2, (slot2 - 1) * HomeTile.tile_h
	end
end

function HomeTile.toPixelTop(slot0, slot1, slot2)
	if slot0 == HOME_TILE_TYPE_L_WALL then
		return (slot1 - 1 + slot2 % 2 / 2) * HomeTile.tile_w * 2 + HomeTile.tile_w, slot2 * HomeTile.tile_h + HomeTile.tile_h
	elseif slot0 == HOME_TILE_TYPE_R_WALL then
		return (slot1 - 0.5 + slot2 % 2 / 2) * HomeTile.tile_w * 2, (slot2 - 1) * HomeTile.tile_h
	else
		return (slot1 - 1 + slot2 % 2 / 2) * HomeTile.tile_w * 2, slot2 * HomeTile.tile_h
	end
end

function HomeTile.toPixelBottom(slot0, slot1, slot2)
	if slot0 == HOME_TILE_TYPE_L_WALL then
		return (slot1 - 1 + slot2 % 2 / 2) * HomeTile.tile_w * 2, (slot2 - 2) * HomeTile.tile_h
	elseif slot0 == HOME_TILE_TYPE_R_WALL then
		return (slot1 - 1 + slot2 % 2 / 2) * HomeTile.tile_w * 2, (slot2 - 2) * HomeTile.tile_h
	else
		return (slot1 - 1 + slot2 % 2 / 2) * HomeTile.tile_w * 2, (slot2 - 2) * HomeTile.tile_h
	end
end

function HomeTile.toTile(slot0, slot1, slot2)
	slot3 = math.ceil(slot1 / HomeTile.tile_w)
	slot4 = math.ceil(slot2 / HomeTile.tile_h)
	slot9, slot10 = HomeTile.toPixel(slot0, math.ceil((slot3 + (slot4 - 1) % 2) / 2), slot4)
	slot11, slot12 = HomeTile.toPixel(slot0, math.ceil((slot3 + slot4 % 2) / 2), slot4 + 1)

	if math.abs(slot9 - slot1) + math.abs(slot10 - slot2) < math.abs(slot11 - slot1) + math.abs(slot12 - slot2) then
		return slot5, slot6
	else
		return slot7, slot8
	end
end

function HomeTile.tileOffset(slot0, slot1, slot2, slot3)
	if (slot2 - slot3) % 2 == 0 then
		return slot0 + math.floor(slot4 / 2), slot1 + slot2 + slot3
	else
		return slot0 + math.floor(slot4 / 2) + slot1 % 2, slot1 + slot2 + slot3
	end
end

function HomeTile.tilesOffset(slot0, slot1, slot2)
	slot3 = {
		[slot7] = {}
	}

	for slot7, slot8 in pairs(slot2 or {
		{
			0,
			0
		}
	}) do
		slot3[slot7][1], slot3[slot7][2] = HomeTile.tileOffset(slot0, slot1, slot8[1], slot8[2])
	end

	return slot3
end

function HomeTile.getOffset(slot0, slot1, slot2, slot3)
	slot4 = slot2 - slot0

	if (slot3 - slot1) % 2 == 0 then
		return math.ceil(slot4 + slot5 / 2), math.floor(slot5 / 2 - slot4)
	else
		return math.ceil(slot4 - slot1 % 2 + slot5 / 2), math.floor(slot5 / 2 - slot4)
	end
end

function HomeTile.tileRange(slot0, slot1, slot2, slot3)
	slot4 = math.max
	slot4 = math.max
	slot4 = {}
	slot5 = -math.floor(slot4(1, slot2 or 1) / 2)
	slot6 = -math.floor(slot4(1, slot3 or 1) / 2)
	slot7, slot8, slot9 = nil

	for slot13 = slot5, slot5 + slot2 - 1 do
		for slot17 = slot6, slot6 + slot3 - 1 do
			slot18, slot19 = HomeTile.tileOffset(slot0, slot1, slot13, slot17)

			table.insert(slot4, {
				slot18,
				slot19
			})
		end
	end

	return slot4
end

function HomeTile.tileRangePixel(slot0, slot1, slot2, slot3, slot4)
	if math.max(1, slot3 or 1) % 2 == 0 and math.max(1, slot4 or 1) % 2 == 0 then
		return HomeTile.toPixelTop(slot0, slot1, slot2)
	elseif slot3 % 2 == 1 and slot4 % 2 == 1 then
		return HomeTile.toPixel(slot0, slot1, slot2)
	elseif slot3 % 2 == 0 and slot4 % 2 == 1 then
		slot5, slot6 = HomeTile.toPixelTop(slot0, slot1, slot2)
		slot7, slot8 = HomeTile.toPixelRight(slot0, slot1, slot2)

		return (slot5 + slot7) / 2, (slot6 + slot8) / 2
	else
		slot5, slot6 = HomeTile.toPixelLeft(slot0, slot1, slot2)
		slot7, slot8 = HomeTile.toPixelTop(slot0, slot1, slot2)

		return (slot5 + slot7) / 2, (slot6 + slot8) / 2
	end
end

function HomeTile.tileRangePixel2(slot0, slot1, slot2, slot3)
	slot4 = HomeTile.toPixel(slot0, slot1, slot2)

	for slot9, slot10 in pairs(slot3) do
		if slot10[2] < ({
			0,
			0
		})[2] then
			slot5 = slot10
		end
	end

	slot6, slot7 = HomeTile.tileOffset(slot1, slot2, slot5[1], slot5[2])
	slot8, slot9 = HomeTile.toPixelRight(slot0, slot6, slot7)

	return slot4, slot9
end

function HomeTile.tileDistance(slot0, slot1, slot2, slot3)
	slot4, slot5 = HomeTile.getOffset(slot0, slot1, slot2, slot3)

	return math.max(math.abs(slot4), math.abs(slot5))
end
