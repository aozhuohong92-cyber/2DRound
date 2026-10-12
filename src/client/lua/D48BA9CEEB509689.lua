MoneyTool = MoneyTool or {}

function MoneyTool.GetMoneyString(slot0, slot1)
	if slot1 == nil then
		slot1 = true
	end

	if slot0 == nil then
		return 0
	end

	if slot0 < 100000 then
		if slot1 then
			return MoneyTool.moneyFormat(slot0)
		else
			return slot0
		end
	elseif slot0 < 100000000 then
		if slot1 then
			return string.format(TI18N("%s万"), MoneyTool.moneyFormat(math.floor(slot0 * 0.0001)))
		else
			return string.format(TI18N("%s万"), slot0)
		end
	elseif slot1 then
		slot2, slot3 = math.modf(math.modf(slot0 * 1e-06) / 100)
		slot4, slot5 = math.modf(slot3 * 100 / 10)

		if slot2 >= 100 or slot3 == 0 then
			return string.format("%s", MoneyTool.moneyFormat(slot2)) .. TI18N("亿")
		else
			return string.format("%s.%s", MoneyTool.moneyFormat(slot2), slot4) .. TI18N("亿")
		end
	else
		return string.format("%s", math.modf(slot0 * 1e-07) / 10) .. TI18N("亿")
	end

	return slot0
end

function MoneyTool.moneyFormat(slot0)
	slot1 = ""

	if slot0 < 0 then
		slot1 = "-"
		slot0 = slot0 * -1
	end

	if slot0 < 1000 then
		return tostring(slot0)
	end

	slot4 = math.modf(table.getn(MoneyTool.split(tostring(slot0), "")), 3) == 0 and 4 or slot4 + 1

	while slot3 > slot4 do
		table.insert(slot2, slot4, ",")

		slot4 = slot4 + 4
		slot3 = slot3 + 1
	end

	return slot1 .. MoneyTool.join(slot2, "")
end

function MoneyTool.getMoneyString2(slot0, slot1)
	if slot1 == nil then
		slot1 = true
	end

	if slot0 == nil then
		return 0
	end

	if slot1 then
		return MoneyTool.moneyFormat(slot0)
	else
		return slot0
	end
end

function MoneyTool.split(slot0, slot1)
	if string.len(slot1) == 0 then
		slot2 = {}
		slot6 = slot0

		for slot6 = 1, string.len(slot6) do
			table.insert(slot2, string.sub(slot0, slot6, slot6))
		end

		return slot2
	else
		return Split(slot0, slot1)
	end
end

function MoneyTool.join(slot0, slot1)
	if string.len(slot1) == 0 then
		slot6 = slot0

		for slot6 = 2, table.getn(slot6) do
			slot2 = "%s" .. slot1 .. "%s"
		end

		return string.format(slot2, unpack(slot0))
	else
		return Join(slot0, slot1)
	end
end

function MoneyTool.GetMoneyWanString(slot0)
	if slot0 == nil then
		return 0
	end

	if slot0 < 100000 then
		return slot0
	else
		return string.format(TI18N("%s万"), math.floor(slot0 * 0.0001))
	end

	return slot0
end
