FixArray = FixArray or BaseClass()

function FixArray.__init(slot0, slot1, slot2)
	slot0.max = slot1
	slot0.del_call = slot2
	slot0.idx = 0
	slot0.size = 0
	slot0.first = 0
	slot0.last = -1
	slot0.items = {}
end

function FixArray.IsEmpty(slot0)
	return slot0.size <= 0
end

function FixArray.GetSize(slot0)
	return slot0.size
end

function FixArray.Clear(slot0)
	slot0.size = 0
	slot0.first = 0
	slot0.last = -1
	slot0.items = {}
end

function FixArray.PushFront__(slot0, slot1)
	slot0.first = slot0.first - 1
	slot0.size = slot0.size + 1
	slot0.items[slot0.first] = slot1
end

function FixArray.PushBack__(slot0, slot1)
	slot0.last = slot0.last + 1
	slot0.size = slot0.size + 1
	slot0.items[slot0.last] = slot1
end

function FixArray.GetBack(slot0)
	return slot0.items[slot0.last]
end

function FixArray.GetFront(slot0)
	return slot0.items[slot0.first]
end

function FixArray.Get(slot0, slot1)
	if slot1 < slot0.size then
		return nil
	end

	return slot0.items[slot0.first + slot1]
end

function FixArray.PopFront(slot0)
	if slot0.size <= 0 then
		return nil
	end

	slot0.items[slot0.first] = nil
	slot0.size = slot0.size - 1
	slot0.first = slot0.first + 1

	return slot0.items[slot0.first]
end

function FixArray.PopBack(slot0)
	if slot0.size <= 0 then
		return nil
	end

	slot0.items[last] = nil
	slot0.last = slot0.last - 1
	slot0.size = slot0.size - 1

	return slot0.items[slot0.last]
end

function FixArray.ForFront(slot0, slot1, ...)
	for slot5 = slot0.first, slot0.last do
		if not slot1(slot0.items[slot5], ...) then
			return
		end
	end
end

function FixArray.ForBack(slot0, slot1, ...)
	for slot5 = slot0.last, slot0.first, -1 do
		if not slot1(slot0.items[slot5], ...) then
			return
		end
	end
end

function FixArray.IsMax(slot0)
	return slot0.max <= slot0.size
end

function FixArray.PushBack(slot0, slot1)
	slot2 = nil

	if slot0.max <= slot0.size then
		slot3 = slot0:PopFront()

		if slot0.del_call and slot3 then
			slot0.del_call(slot3)
		end
	end

	slot0:PushBack__(slot1)

	return slot2
end

function FixArray.PushFront(slot0, slot1)
	slot2 = nil

	if slot0.max <= slot0.size then
		slot2 = slot0:PopBack()

		if slot0.del_call and slot2 then
			slot0:del_call(slot2)
		end
	end

	slot0:PushFront__(slot1)

	return slot2
end

function FixArray.SetFirst(slot0)
	slot0.idx = slot0.first
end

function FixArray.SetLast(slot0)
	slot0.idx = slot0.last
end

function FixArray.GoNext(slot0)
	if slot0.last <= slot0.idx then
		slot0.idx = slot0.first
	else
		slot0.idx = slot0.idx + 1
	end
end

function FixArray.GoBack(slot0)
	if slot0.idx <= slot0.first then
		slot0.idx = slot0.last
	else
		slot0.idx = slot0.idx - 1
	end
end

function FixArray.getNow(slot0)
	return slot0.items[slot0.idx]
end

function FixArray.GetRoll(slot0)
	slot0:GoNext()

	return slot0.items[slot0.idx]
end

function FixArray.GetRollReverse(slot0)
	slot0:GoBack()

	return slot0.items[slot0.idx]
end
