slot1 = LuaJavaBridge.callStaticMethod

function slot2(slot0, slot1)
	if type(slot0) ~= "table" then
		slot0 = {}
	end

	if slot1 then
		return slot0, slot1
	end

	slot1 = {
		"("
	}

	for slot5, slot6 in ipairs(slot0) do
		if type(slot6) == "number" then
			slot1[#slot1 + 1] = "F"
		elseif slot7 == "boolean" then
			slot1[#slot1 + 1] = "Z"
		elseif slot7 == "function" then
			slot1[#slot1 + 1] = "I"
		else
			slot1[#slot1 + 1] = "Ljava/lang/String;"
		end
	end

	slot1[#slot1 + 1] = ")V"

	return slot0, table.concat(slot1)
end

return {
	callStaticMethod = function (slot0, slot1, slot2, slot3)
		slot4, slot5 = uv0(slot2, slot3)

		return uv1(slot0, slot1, slot4, slot5)
	end
}
