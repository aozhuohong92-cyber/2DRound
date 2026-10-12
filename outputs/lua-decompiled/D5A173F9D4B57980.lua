FruitTreasureVo = FruitTreasureVo or BaseClass(EventDispatcher)

function FruitTreasureVo.__init(slot0, ...)
	slot0.id = ""
	slot0.name = ""
	slot0.index = ""
	slot0.piece = {}
	slot0.exclusive = {}
	slot0.piece_id = ""
	slot0.type = 1
	slot0.quality = 1
	slot0.main_attr = 0
	slot0.second_attr = 0
	slot0.info_id = 0
	slot0.lev = 1
	slot0.star = 1
	slot0.rank = 0
	slot0.attrs = {}
	slot0.nodelist = {}
	slot0.battlepoint = 0
	slot0.attack = 0
	slot0.def = 0
	slot0.hp = 0
	slot0.speed = 0
	slot0.desc = ""
	slot0.eff_times = 0
	slot0.eff_add = 0
	slot0.isActive = false
end

function FruitTreasureVo.setData(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		if slot0[slot5] then
			slot0[slot5] = slot6
		end
	end

	slot0:setAttr()
	slot0:setNodeList()
end

function FruitTreasureVo.updateList(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		if slot0[slot5] then
			slot0[slot5] = slot6
		end
	end

	slot0.isActive = true
end

function FruitTreasureVo.setAttr(slot0, slot1)
	if slot1 then
		slot0.attrs = slot1
	else
		slot0.attrs = {}
		slot2 = 1

		if slot0.main_attr ~= "atk" then
			slot2 = 2
		end

		table.insert(slot0.attrs, {
			attr_id = Config.AttrData.data_key_to_id[slot0.main_attr],
			attr_val = Config.BlastiaData.data_upgrade_level[slot0.type .. "_" .. slot0.lev].main_attrs[slot2][2]
		})

		slot7 = 1

		if slot0.second_attr ~= "def" then
			slot7 = 2
		end

		table.insert(slot0.attrs, {
			attr_id = Config.AttrData.data_key_to_id[slot0.second_attr],
			attr_val = Config.BlastiaData.data_upgrade_star[slot4].second_attrs[slot7][2]
		})
	end
end

function FruitTreasureVo.getAttr(slot0)
	slot1 = {}

	table.insert(slot1, {
		attr_id = Config.AttrData.data_key_to_id[slot0.main_attr],
		attr_val = FruitTreasureController:getInstance():getModel():getAttrByKey(slot0.main_attr, slot0.attrs)
	})
	table.insert(slot1, {
		attr_id = Config.AttrData.data_key_to_id[slot0.second_attr],
		attr_val = FruitTreasureController:getInstance():getModel():getAttrByKey(slot0.second_attr, slot0.attrs)
	})

	return slot1
end

function FruitTreasureVo.setNodeList(slot0)
	for slot5, slot6 in pairs({
		40,
		60,
		80
	}) do
		if Config.BlastiaData.data_node_increase[slot0.type .. "_" .. slot6] then
			table.insert(slot0.nodelist, slot8)
		end
	end
end

function FruitTreasureVo.update(slot0, slot1, slot2)
	if slot0[slot1] then
		slot0[slot1] = slot2
	end
end

function FruitTreasureVo.setKey(slot0, slot1, slot2)
	slot0[slot1] = slot2
end

function FruitTreasureVo.getStarLimit(slot0, slot1)
	for slot6, slot7 in pairs(Config.BlastiaData.data_upgrade_star) do
		if slot7.type == slot0.type then
			slot2 = 0 + 1
		end
	end

	return slot2
end

function FruitTreasureVo.getLevelLimit(slot0, slot1)
	for slot6, slot7 in pairs(Config.BlastiaData.data_upgrade_level) do
		if slot7.type == slot0.type then
			slot2 = 0 + 1
		end
	end

	return slot2
end

function FruitTreasureVo.getExValue(slot0)
	slot3 = Config.BlastiaData.data_effect[slot0.exclusive[slot0.star][2]]

	table.insert({}, slot3.desc_effect)

	if string.len(slot3.desc_addition) > 0 then
		table.insert(slot4, slot3.desc_addition)
	end

	return slot4
end

function FruitTreasureVo.getExRate(slot0)
	if Config.BlastiaData.data_effect[slot0.exclusive[slot0.star][2]].val1_rate == 0 then
		slot4 = 1
	end

	return slot4
end

function FruitTreasureVo.__delete(slot0, ...)
end
