SortTools = {
	KeyLowerSorter = function (slot0)
		return function (slot0, slot1)
			if slot0 and slot1 and slot0[uv0] and slot1[uv0] then
				if slot0[uv0] < slot1[uv0] then
					return true
				else
					return false
				end
			else
				return false
			end
		end
	end,
	tableLowerSorter = function (slot0)
		return function (slot0, slot1)
			if slot0 == nil or slot1 == nil then
				return false
			end

			slot5 = uv0

			for slot5 = 1, table.getn(slot5) do
				if slot0[uv0[slot5]] == nil or slot1[uv0[slot5]] == nil then
					return false
				end

				if slot0[uv0[slot5]] < slot1[uv0[slot5]] then
					return true
				elseif slot1[uv0[slot5]] < slot0[uv0[slot5]] then
					return false
				end
			end

			return false
		end
	end,
	KeyUpperSorter = function (slot0)
		return function (slot0, slot1)
			if slot0 and slot1 and slot0[uv0] and slot1[uv0] then
				if slot1[uv0] < slot0[uv0] then
					return true
				else
					return false
				end
			else
				return false
			end
		end
	end,
	tableUpperSorter = function (slot0)
		return function (slot0, slot1)
			if slot0 == nil or slot1 == nil then
				return false
			end

			for slot5 = 1, #uv0 do
				if slot0[uv0[slot5]] == nil or slot1[uv0[slot5]] == nil then
					return false
				end

				if slot1[uv0[slot5]] < slot0[uv0[slot5]] then
					return true
				elseif slot0[uv0[slot5]] < slot1[uv0[slot5]] then
					return false
				end
			end

			return false
		end
	end,
	tableCommonSorter = function (slot0)
		return function (slot0, slot1)
			if slot0 == nil or slot1 == nil then
				return false
			end

			for slot5 = 1, #uv0 do
				if slot0[uv0[slot5][1]] == nil or slot1[uv0[slot5][1]] == nil then
					return false
				end

				if uv0[slot5][2] or false then
					if slot1[uv0[slot5][1]] < slot0[uv0[slot5][1]] then
						return true
					elseif slot0[uv0[slot5][1]] < slot1[uv0[slot5][1]] then
						return false
					end
				elseif slot1[uv0[slot5][1]] < slot0[uv0[slot5][1]] then
					return false
				elseif slot0[uv0[slot5][1]] < slot1[uv0[slot5][1]] then
					return true
				end
			end

			return false
		end
	end,
	ItemLowerSorter = function ()
		return function (slot0, slot1)
			if slot0 and slot1 then
				return slot0 < slot1
			end
		end
	end,
	ItemUpperSorter = function ()
		return function (slot0, slot1)
			if slot0 and slot1 then
				return slot1 < slot0
			end
		end
	end
}

function SortTools.BinaryInsert(slot0, slot1, slot2)
	slot2 = slot2 or SortTools.ItemLowerSorter
	slot3 = 1
	slot4 = #slot0
	slot5 = 1
	slot6 = 0

	while slot3 <= slot4 do
		if slot2(slot1, slot0[math.floor((slot3 + slot4) / 2)]) then
			slot6 = 0
			slot4 = slot5 - 1
		else
			slot6 = 1
			slot3 = slot5 + 1
		end
	end

	table.insert(slot0, slot5 + slot6, slot1)

	return slot5 + slot6
end

function SortTools.BinarySearch(slot0, slot1, slot2, slot3)
	slot5 = 1
	slot6 = #slot0
	slot7 = 0

	while slot5 <= slot6 do
		if slot2(slot1, slot0[math.floor((slot5 + slot6) / 2)]) then
			slot9 = {
				slot7,
				slot7
			}
			slot10 = slot7 - 1

			while slot10 >= 1 and slot2(slot1, slot0[slot10]) do
				slot10 = slot10 - 1
				slot9[1] = slot10
			end

			slot10 = slot7 + 1

			while slot4 >= slot10 and slot2(slot1, slot0[slot10]) do
				slot10 = slot10 + 1
				slot9[2] = slot10
			end

			return slot9
		elseif slot3(slot1, slot8) then
			slot6 = slot7 - 1
		else
			slot5 = slot7 + 1
		end
	end
end

function SortTools.BubbleSort(slot0, slot1, slot2)
	function slot3(slot0, slot1)
		if slot0[uv0] == nil and slot0[uv0] ~= nil then
			return true
		end

		if slot0[uv0] ~= nil and slot1[uv0] ~= nil then
			if uv1 == false then
				if slot1[uv0] < slot0[uv0] then
					return true
				end
			elseif slot0[uv0] < slot1[uv0] then
				return true
			end
		end

		return false
	end

	slot5 = false
	slot6 = nil

	for slot11 = 1, #slot0 - 1 do
		if not true then
			break
		end

		slot7 = false

		for slot15 = 1, slot4 - slot11 do
			if slot3(slot0[slot15], slot0[slot15 + 1]) then
				slot7 = true
				slot0[slot15] = slot0[slot15 + 1]
				slot0[slot15 + 1] = slot0[slot15]
			end
		end
	end
end

function SortTools.SortListByFunc(slot0, slot1)
	slot3 = false
	slot4 = nil

	for slot9 = 1, #slot0 - 1 do
		if not true then
			break
		end

		slot5 = false

		for slot13 = 1, slot2 - slot9 do
			if slot1(slot0[slot13], slot0[slot13 + 1]) then
				slot5 = true
				slot0[slot13] = slot0[slot13 + 1]
				slot0[slot13 + 1] = slot0[slot13]
			end
		end
	end
end
