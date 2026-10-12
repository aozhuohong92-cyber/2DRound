MonopolyTile = MonopolyTile or {}
slot0 = 1000

function MonopolyTile.init(slot0, slot1, slot2, slot3)
	MonopolyTile.tile_w = slot0
	MonopolyTile.tile_h = slot1
	MonopolyTile.width = slot2
	MonopolyTile.height = slot3
	MonopolyTile.tile_max_w = math.floor(slot2 / slot0) + 1
	MonopolyTile.tile_max_h = math.floor(slot3 / slot1) + 1
end

function MonopolyTile.indexPixel(slot0)
	slot1, slot2 = MonopolyTile.indexTile(slot0)

	return MonopolyTile.toPixel(slot1, slot2)
end

function MonopolyTile.indexTile(slot0)
	return math.floor(slot0 / uv0), slot0 % uv0
end

function MonopolyTile.tileIndex(slot0, slot1)
	return slot0 * uv0 + slot1
end

function MonopolyTile.toPixel(slot0, slot1)
	return (slot0 - 1 + slot1 % 2 / 2) * MonopolyTile.tile_w * 2, (slot1 - 1) * MonopolyTile.tile_h
end

function MonopolyTile.toTile(slot0, slot1)
	slot2 = math.ceil(slot0 / MonopolyTile.tile_w)
	slot3 = math.ceil(slot1 / MonopolyTile.tile_h)
	slot8, slot9 = MonopolyTile.toPixel(math.ceil((slot2 + (slot3 - 1) % 2) / 2), slot3)
	slot10, slot11 = MonopolyTile.toPixel(math.ceil((slot2 + slot3 % 2) / 2), slot3 + 1)

	if math.abs(slot8 - slot0) + math.abs(slot9 - slot1) < math.abs(slot10 - slot0) + math.abs(slot11 - slot1) then
		return slot4, slot5
	else
		return slot6, slot7
	end
end

function MonopolyTile.getOffset(slot0, slot1, slot2, slot3)
	slot4 = slot2 - slot0

	if (slot3 - slot1) % 2 == 0 then
		return math.ceil(slot4 + slot5 / 2), math.floor(slot5 / 2 - slot4)
	else
		return math.ceil(slot4 - slot1 % 2 + slot5 / 2), math.floor(slot5 / 2 - slot4)
	end
end

function MonopolyTile.tileDistance(slot0, slot1, slot2, slot3)
	slot4, slot5 = MonopolyTile.getOffset(slot0, slot1, slot2, slot3)

	return math.max(math.abs(slot4), math.abs(slot5))
end
