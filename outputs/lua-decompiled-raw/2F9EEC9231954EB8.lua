PlanesTile = PlanesTile or {}
slot0 = 1000
PlanesTile.planes_type = 1
PlanesTile.year_monster_type = 2

function PlanesTile.init(slot0, slot1, slot2, slot3, slot4)
	PlanesTile.tile_w = slot0 or 192
	PlanesTile.tile_h = slot1 or 96
	PlanesTile.width = slot2
	PlanesTile.height = slot3
	PlanesTile.tile_max_w = math.floor(slot2 / slot0) + 1
	PlanesTile.tile_max_h = math.floor(slot3 / slot1) + 1
	PlanesTile.player_type = slot4 or PlanesTile.planes_type
end

function PlanesTile.indexPixel(slot0)
	slot1, slot2 = PlanesTile.indexTile(slot0)

	return PlanesTile.toPixel(slot1, slot2)
end

function PlanesTile.indexTile(slot0)
	return math.floor(slot0 / uv0), slot0 % uv0
end

function PlanesTile.tileIndex(slot0, slot1)
	return slot0 * uv0 + slot1
end

function PlanesTile.toPixel(slot0, slot1)
	return (slot0 - 1 + slot1 % 2 / 2) * PlanesTile.tile_w * 2, (slot1 - 1) * PlanesTile.tile_h
end

function PlanesTile.toPixelLeft(slot0, slot1)
	return (slot0 - 1.5 + slot1 % 2 / 2) * PlanesTile.tile_w * 2, (slot1 - 1) * PlanesTile.tile_h
end

function PlanesTile.toPixelRight(slot0, slot1)
	return (slot0 - 0.5 + slot1 % 2 / 2) * PlanesTile.tile_w * 2, (slot1 - 1) * PlanesTile.tile_h
end

function PlanesTile.toPixelTop(slot0, slot1)
	return (slot0 - 1 + slot1 % 2 / 2) * PlanesTile.tile_w * 2, slot1 * PlanesTile.tile_h
end

function PlanesTile.toPixelBottom(slot0, slot1)
	return (slot0 - 1 + slot1 % 2 / 2) * PlanesTile.tile_w * 2, (slot1 - 2) * PlanesTile.tile_h
end

function PlanesTile.toTile(slot0, slot1)
	slot2 = math.ceil(slot0 / PlanesTile.tile_w)
	slot3 = math.ceil(slot1 / PlanesTile.tile_h)
	slot8, slot9 = PlanesTile.toPixel(math.ceil((slot2 + (slot3 - 1) % 2) / 2), slot3)
	slot10, slot11 = PlanesTile.toPixel(math.ceil((slot2 + slot3 % 2) / 2), slot3 + 1)

	if math.abs(slot8 - slot0) + math.abs(slot9 - slot1) < math.abs(slot10 - slot0) + math.abs(slot11 - slot1) then
		return slot4, slot5
	else
		return slot6, slot7
	end
end

function PlanesTile.tileOffset(slot0, slot1, slot2, slot3)
	if (slot2 - slot3) % 2 == 0 then
		return slot0 + math.floor(slot4 / 2), slot1 + slot2 + slot3
	else
		return slot0 + math.floor(slot4 / 2) + slot1 % 2, slot1 + slot2 + slot3
	end
end

function PlanesTile.tilesOffset(slot0, slot1, slot2)
	slot3 = {
		[slot7] = {}
	}

	for slot7, slot8 in pairs(slot2 or {
		{
			0,
			0
		}
	}) do
		slot3[slot7][1], slot3[slot7][2] = PlanesTile.tileOffset(slot0, slot1, slot8[1], slot8[2])
	end

	return slot3
end

function PlanesTile.getOffset(slot0, slot1, slot2, slot3)
	slot4 = slot2 - slot0

	if (slot3 - slot1) % 2 == 0 then
		return math.ceil(slot4 + slot5 / 2), math.floor(slot5 / 2 - slot4)
	else
		return math.ceil(slot4 - slot1 % 2 + slot5 / 2), math.floor(slot5 / 2 - slot4)
	end
end

function PlanesTile.tileRange(slot0, slot1, slot2, slot3)
	slot4 = math.max
	slot4 = math.max
	slot4 = {}
	slot5 = -math.floor(slot4(1, slot2 or 1) / 2)
	slot6 = -math.floor(slot4(1, slot3 or 1) / 2)
	slot7, slot8, slot9 = nil

	for slot13 = slot5, slot5 + slot2 - 1 do
		for slot17 = slot6, slot6 + slot3 - 1 do
			slot18, slot19 = PlanesTile.tileOffset(slot0, slot1, slot13, slot17)

			table.insert(slot4, {
				slot18,
				slot19
			})
		end
	end

	return slot4
end

function PlanesTile.tileRangePixel(slot0, slot1, slot2, slot3)
	if math.max(1, slot2 or 1) % 2 == 0 and math.max(1, slot3 or 1) % 2 == 0 then
		return PlanesTile.toPixelTop(slot0, slot1)
	elseif slot2 % 2 == 1 and slot3 % 2 == 1 then
		return PlanesTile.toPixel(slot0, slot1)
	elseif slot2 % 2 == 0 and slot3 % 2 == 1 then
		slot4, slot5 = PlanesTile.toPixelTop(slot0, slot1)
		slot6, slot7 = PlanesTile.toPixelRight(slot0, slot1)

		return (slot4 + slot6) / 2, (slot5 + slot7) / 2
	else
		slot4, slot5 = PlanesTile.toPixelLeft(slot0, slot1)
		slot6, slot7 = PlanesTile.toPixelTop(slot0, slot1)

		return (slot4 + slot6) / 2, (slot5 + slot7) / 2
	end
end

function PlanesTile.tileRangePixel2(slot0, slot1, slot2)
	slot3 = PlanesTile.toPixel(slot0, slot1)

	for slot8, slot9 in pairs(slot2) do
		if slot9[2] < ({
			0,
			0
		})[2] then
			slot4 = slot9
		end
	end

	slot5, slot6 = PlanesTile.tileOffset(slot0, slot1, slot4[1], slot4[2])
	slot7, slot8 = PlanesTile.toPixelRight(slot5, slot6)

	return slot3, slot8
end

function PlanesTile.tileDistance(slot0, slot1, slot2, slot3)
	slot4, slot5 = PlanesTile.getOffset(slot0, slot1, slot2, slot3)

	return math.max(math.abs(slot4), math.abs(slot5))
end

function PlanesTile.astar(slot0, slot1, slot2)
	PlanesTile.walkable = slot2

	if slot0.x == slot1.x and slot0.y == slot1.y then
		return false
	elseif PlanesTile.isBlock(slot1.x, slot1.y, true) then
		return false
	end

	slot3 = {}

	Heap.New("f"):insert(PlanesTile.newPoint(slot0.x, slot0.y))

	slot6, slot7, slot8, slot9, slot10, slot11, slot12 = nil

	while not slot4:IsEmpty() do
		slot4:take_smallest().close = 1

		for slot16, slot17 in pairs({
			{
				-1,
				0,
				1,
				1
			},
			{
				1,
				0,
				2,
				1
			},
			{
				0,
				-1,
				3,
				1.2
			},
			{
				0,
				1,
				4,
				1.2
			}
		}) do
			slot18, slot9 = PlanesTile.tileOffset(slot6.x, slot6.y, slot17[1], slot17[2])
			slot10 = slot17[3]
			slot11 = slot17[4]

			if slot18 == slot0.x and slot9 == slot0.y then
				-- Nothing
			elseif slot3[slot8] and slot3[slot8][slot9] then
				slot12 = slot6.g + slot11

				if slot3[slot8][slot9].close == nil and slot12 < slot5.g then
					slot5.g = slot12
					slot5.f = slot5.g + slot5.h
					slot5.parent = slot6
					slot5.dir = slot10
					slot5.n = slot6.n + 1
				end
			elseif slot8 == slot1.x and slot9 == slot1.y then
				PlanesTile.walkable = nil

				return PlanesTile.newPoint(slot8, slot9, slot6, slot10, slot11)
			elseif not PlanesTile.isBlock(slot8, slot9) then
				slot5 = PlanesTile.newPoint(slot8, slot9, slot6, slot10, slot11)

				if slot3[slot8] == nil then
					slot3[slot8] = {}
				end

				slot3[slot8][slot9] = slot5

				slot4:insert(slot5)
			end
		end
	end
end

function PlanesTile.isBlock(slot0, slot1, slot2)
	if PlanesTile.player_type == PlanesTile.planes_type then
		if slot2 and PlanesController:getInstance():getModel():checkEvtCanWalkByGridIndex(PlanesTile.tileIndex(slot0, slot1), slot2) then
			return false
		elseif PlanesTile.walkable[slot1] and PlanesTile.walkable[slot1][slot0] and PlanesTile.walkable[slot1][slot0] > 1 and PlanesController:getInstance():getModel():checkEvtCanWalkByGridIndex(slot3) then
			return false
		end
	elseif PlanesTile.player_type == PlanesTile.year_monster_type then
		if slot2 and ActionyearmonsterController:getInstance():getModel():checkEvtCanWalkByGridIndex(slot3, slot2) then
			return false
		elseif PlanesTile.walkable[slot1] and PlanesTile.walkable[slot1][slot0] and PlanesTile.walkable[slot1][slot0] > 1 and ActionyearmonsterController:getInstance():getModel():checkEvtCanWalkByGridIndex(slot3) then
			return false
		end
	end

	return true
end

function PlanesTile.newPoint(slot0, slot1, slot2, slot3, slot4)
	if slot2 == nil then
		return {
			g = 0,
			f = 0,
			h = 0,
			n = 0,
			dir = 0,
			x = slot0,
			y = slot1
		}
	else
		slot5 = slot2.g + slot4
		slot6 = 1.5

		if slot2.dir == 0 or slot2.dir == slot3 then
			slot6 = 1
		end

		return {
			x = slot0,
			y = slot1,
			g = slot5,
			h = slot6,
			f = slot5 + slot6,
			parent = slot2,
			dir = slot3,
			n = slot2.n + 1
		}
	end
end

function PlanesTile.test(slot0)
	slot1 = PlanesTile.astar({
		x = 3,
		y = 16
	}, {
		x = 3,
		y = 12
	}, slot0)

	while slot1 do
		if slot0[slot1.y][slot1.x].txt then
			slot4.txt:setString(string.format("%s,g=%s", slot4.tile_res, slot1.g))
		end

		slot1 = slot1.parent
	end
end
