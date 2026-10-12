function setAllChildColorScale(slot0, slot1)
	slot2 = slot0:getColor()
	slot6 = cc.c3b

	slot0:setColor(slot6(slot1 * slot2.r, slot1 * slot2.g, slot1 * slot2.b))

	slot7 = slot0

	for slot6, slot7 in pairs(slot0.getChildren(slot7)) do
		slot2 = slot7:getColor()

		slot7:setColor(cc.c3b(slot1 * slot2.r, slot1 * slot2.g, slot1 * slot2.b))
		setAllChildColorScale(slot7, slot1)
	end
end

function setAllChildFilter(slot0, slot1, slot2, slot3)
	if tolua.isnull(slot0) then
		return
	end

	if slot0.setFilterStatus then
		slot0:setFilterStatus(slot1, slot2 or "", slot3 or cc.c4b(255, 255, 255, 255))
	end

	slot8 = slot0

	for slot7, slot8 in pairs(slot0.getChildren(slot8)) do
		setAllChildFilter(slot8, slot1, slot2, slot3)
	end
end

CustomTool = CustomTool or {}

function CustomTool.createLabel(slot0, slot1, slot2, slot3)
	createWithSystemFont("", DEFAULT_FONT, slot2):setTextColor(slot0)

	if slot1 then
		slot4:enableOutline(slot1, 1)
	end

	if slot3 then
		slot4:setAnchorPoint(slot3)
	end

	return slot4
end

function CustomTool.calculation(slot0, slot1)
	if slot1 ~= nil then
		slot3 = slot0:getContentSize().height

		if slot1 < slot0:getContentSize().width then
			slot4 = math.ceil(slot2 / slot1)

			slot0:setContentSize(cc.size(slot1, slot3 * slot4))
			slot0:setWidth(slot1)
			slot0:setHeight(slot3 * slot4)
		end
	end

	return slot0
end

function extend(slot0)
	if not tolua.getpeer(slot0) then
		tolua.setpeer(slot0, {})
	end

	setmetatable(slot1, DebugScene)

	return slot0
end
