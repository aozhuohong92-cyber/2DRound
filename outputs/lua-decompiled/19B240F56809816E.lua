Array = Array or BaseClass()

function Array.__init(slot0)
	slot0.size = 0
	slot0.items = {}
end

function Array.IsEmpty(slot0)
	return slot0.size <= 0
end

function Array.PushBack(slot0, slot1)
	slot0.size = slot0.size + 1
	slot0.items[slot0.size] = slot1
end

function Array.PopBack(slot0)
	if slot0.size > 0 then
		slot0.items[slot0.size] = nil
		slot0.size = slot0.size - 1

		return slot0.items[slot0.size]
	end

	return nil
end

function Array.PushFront(slot0, slot1)
	table.insert(slot0.items, 1, slot1)

	slot0.size = slot0.size + 1
end

function Array.PopFront(slot0)
	if slot0.size > 0 then
		table.remove(slot0.items, 1)

		slot0.size = slot0.size - 1

		return slot0.items[1]
	end

	return nil
end

function Array.ForEach(slot0, slot1)
	for slot5 = 1, slot0.size do
		slot1(slot0.items[slot5])
	end
end

function Array.Get(slot0, slot1, slot2)
	if slot1 < slot0.size then
		return slot0.items[slot1 + 1]
	elseif slot2 ~= false then
		print("Array:Get() out of index!")
	end
end

function Array.Set(slot0, slot1, slot2)
	if slot1 < slot0.size then
		slot0.items[slot1 + 1] = slot2
	else
		print("Array:Set() out of index!")
	end
end

function Array.GetSize(slot0)
	return slot0.size
end

function Array.LowerSort(slot0, slot1)
	slot2 = nil

	table.sort(slot0.items, (not slot1 or SortTools.KeyLowerSorter(slot1)) and SortTools.ItemLowerSorter())
end

function Array.LowerSortByParams(slot0, ...)
	slot2 = nil

	if slot0:GetSize() > 1 then
		table.sort(slot0.items, (table.getn({
			...
		}) ~= 0 or SortTools.ItemLowerSorter()) and SortTools.tableLowerSorter(slot1))
	end
end

function Array.UpperSort(slot0, slot1)
	slot2 = nil

	table.sort(slot0.items, (not slot1 or SortTools.KeyUpperSorter(slot1)) and SortTools.ItemUpperSorter())
end

function Array.UpperSortByParams(slot0, ...)
	slot2 = nil

	if slot0:GetSize() > 1 then
		table.sort(slot0.items, (table.getn({
			...
		}) ~= 0 or SortTools.ItemUpperSorter()) and SortTools.tableUpperSorter(slot1))
	end
end

function Array.FindByKey(slot0, slot1, slot2, slot3)
	for slot7 = (slot3 or 0) + 1, slot0.size do
		if slot0.items[slot7][slot1] == slot2 then
			return slot8, slot7 - 1
		end
	end

	return nil, -1
end

function Array.FindByLastKey(slot0, slot1, slot2, slot3)
	slot4 = nil
	slot5 = -1

	for slot9 = (slot3 or 0) + 1, slot0.size do
		if slot0.items[slot9][slot1] == slot2 then
			slot5 = slot9 - 1
			slot4 = slot10
		end
	end

	return slot4, slot5
end

function Array.FindByFunc(slot0, slot1, slot2)
	for slot6 = (slot2 or 0) + 1, slot0.size do
		if slot1(slot0.items[slot6]) then
			return slot7, slot6 - 1
		end
	end

	return nil, -1
end

function Array.Erase(slot0, slot1)
	slot2 = nil

	if (slot1 or slot0.size - 1) >= 0 and slot1 < slot0.size then
		slot2 = table.remove(slot0.items, slot1 + 1)
		slot0.size = slot0.size - 1
	end

	return slot2
end

function Array.Insert(slot0, slot1, slot2)
	table.insert(slot0.items, (slot2 or 0) + 1, slot1)

	slot0.size = slot0.size + 1
end

function Array.GetArray(slot0, slot1, slot2)
	if slot0 == nil then
		return {}
	end

	slot3 = {}

	for slot7 = slot1, slot2 do
		if slot7 > #slot0 then
			break
		end

		table.insert(slot3, slot0[slot7])
	end

	return slot3
end

function Array.GetArrayByScale(slot0, slot1, slot2)
	if slot0 == nil then
		return {}
	end

	slot3 = {}
	slot4 = math.floor(#slot0 * slot1) + 1

	return Array.GetArray(slot0, slot4, slot4 + slot2 - 1)
end

function Array.ConcatArray(slot0, slot1)
	if slot1 == nil or slot1:GetSize() == 0 then
		return slot0
	end

	slot0:ForEach(function (slot0)
		uv0:PushBack(slot0)
	end)
	slot1:ForEach(function (slot0)
		uv0:PushBack(slot0)
	end)

	return Array.New()
end
