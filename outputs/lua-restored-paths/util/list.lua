List = {
	New = function ()
		return {
			first = 0,
			last = -1
		}
	end,
	Size = function (slot0)
		if slot0.last < slot0.first then
			return 0
		else
			return slot0.last + 1 - slot0.first
		end
	end,
	Empty = function (slot0)
		return slot0.last < slot0.first
	end,
	clean = function (slot0)
		slot0 = {
			first = 0,
			last = -1
		}
	end,
	Get = function (slot0, slot1)
		return slot0[slot0.first + slot1]
	end,
	PushFront = function (slot0, slot1)
		slot2 = slot0.first - 1
		slot0.first = slot2
		slot0[slot2] = slot1
	end,
	PushBack = function (slot0, slot1)
		slot2 = slot0.last + 1
		slot0.last = slot2
		slot0[slot2] = slot1
	end,
	PopFront = function (slot0)
		if slot0.last < slot0.first then
			error("list is empty")
		end

		slot0[slot1] = nil
		slot0.first = slot1 + 1

		return slot0[slot1]
	end,
	PopBack = function (slot0)
		if slot0.last < slot0.first then
			error("list is empty")
		end

		slot0[slot1] = nil
		slot0.last = slot1 - 1

		return slot0[slot1]
	end,
	GetBack = function (slot0)
		return slot0[slot0.last]
	end,
	GetFront = function (slot0)
		return slot0[slot0.first]
	end
}
