Heap = Heap or BaseClass()

function Heap.__init(slot0, slot1)
	slot0.key = slot1
	slot0.size = 0
	slot0.items = {}
end

function Heap.clear(slot0)
	slot0.size = 0
	slot0.items = {}
end

function Heap.IsEmpty(slot0)
	return slot0.size == 0
end

function Heap.GetSize(slot0)
	return slot0.size
end

function Heap.take_smallest(slot0)
	slot0.items[1] = slot0.items[slot0.size]
	slot0.items[slot0.size] = nil
	slot0.size = slot0.size - 1

	slot0:balance()

	return slot0.items[1]
end

function Heap.insert(slot0, slot1)
	slot0.size = slot0.size + 1
	slot0.items[slot0.size] = slot1
	slot2, slot3 = nil
	slot4 = slot0.items
	slot5 = math.ceil
	slot6 = slot0.size
	slot7 = slot0.key

	while slot6 > 1 do
		if slot4[slot6][slot7] < slot4[slot5(slot6 * 0.5)][slot7] then
			slot4[slot6] = slot4[slot3]
			slot4[slot3] = slot4[slot6]
			slot6 = slot3
		else
			return
		end
	end
end

function Heap.balance(slot0)
	slot1 = 1
	slot2, slot3, slot4 = nil
	slot5 = slot0.size
	slot6 = slot0.items
	slot7 = slot0.key

	while true do
		if slot5 >= slot1 * 2 then
			if slot6[slot4][slot7] < slot6[slot1][slot7] then
				slot1 = slot4
			end

			if slot5 >= slot4 + 1 and slot6[slot4][slot7] < slot6[slot1][slot7] then
				slot1 = slot4
			end
		end

		if slot2 == slot1 then
			return
		end

		slot6[slot2] = slot6[slot1]
		slot6[slot1] = slot6[slot2]
	end
end
