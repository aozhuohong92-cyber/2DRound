FurnitureVo = FurnitureVo or BaseClass(EventDispatcher)

function FurnitureVo.__init(slot0)
	slot0.id = 0
	slot0.bid = 0
	slot0.index = 0
	slot0.dir = HomeworldConst.Dir_Type.Left
	slot0.config = {}
end

function FurnitureVo.updateData(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		slot0[slot5] = slot6

		if slot5 == "bid" then
			slot0.config = Config.HomeData.data_home_unit(slot6) or {}
		end
	end

	slot0.id = slot0.bid * 1000 + slot0.index

	slot0:dispatchUpdateAttrByKey()
end

function FurnitureVo.updateIndex(slot0, slot1)
	slot0.index = slot1
	slot0.id = slot0.bid * 1000 + slot0.index
end

function FurnitureVo.dispatchUpdateAttrByKey(slot0)
end

function FurnitureVo.__delete(slot0)
end
