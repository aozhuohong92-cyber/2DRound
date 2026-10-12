slot1 = "<div>"
slot2 = "</div>"
slot3 = "true"
slot4 = "false"

return {
	parse = function (slot0)
		slot1 = {}

		if not string.find(slot0, "^%b<>.+%b<>$") then
			slot0 = table.concat({
				uv0,
				slot0,
				uv1
			})
		end

		slot3 = 0

		for slot7, slot8 in function ()
			return string.find(uv0, "%b<>", uv1)
		end, nil, nil do
			if string.find(string.sub(slot0, slot7, slot8), "^</") then
				uv2.disposeLabelTail({}, slot1, slot0, slot9, slot7, slot8)
			elseif string.find(slot9, "/>$") then
				uv2.disposeLabelSelfClosing(slot2, slot1, slot0, slot9, slot7, slot8)
			else
				uv2.disposeLabelHead(slot2, slot1, slot0, slot9, slot7, slot8)
			end

			slot3 = slot8 + 1
		end

		return slot1
	end,
	disposeLabelHead = function (slot0, slot1, slot2, slot3, slot4, slot5)
		if uv0.peekstack(slot0) then
			table.insert(slot1, uv0.parseLabelWithContent(slot6.labelhead, string.sub(slot2, slot6.endindex + 1, slot4 - 1)))
		end

		uv0.pushstack(slot0, {
			labelhead = slot3,
			beginindex = slot4,
			endindex = slot5
		})
	end,
	disposeLabelTail = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
		if uv0.popstack(slot0) then
			if not uv0.checkLabelMatch(slot7.labelhead, slot3) then
				return string.format("labelparser # error: label can not match(%s, %s)", slot7.labelhead, slot3)
			end

			table.insert(slot1, uv0.parseLabelWithContent(slot7.labelhead, string.sub(slot2, slot7.endindex + 1, slot4 - 1), slot6))

			if uv0.peekstack(slot0) then
				slot10.beginindex = slot4
				slot10.endindex = slot5
			end
		end
	end,
	disposeLabelSelfClosing = function (slot0, slot1, slot2, slot3, slot4, slot5)
		uv0.disposeLabelHead(slot0, slot1, slot2, slot3, slot4, slot5)
		uv0.disposeLabelTail(slot0, slot1, slot2, slot3, slot4, slot5, true)
	end,
	checkLabelMatch = function (slot0, slot1)
		return uv0.parseLabelname(slot1) == uv0.parseLabelname(slot0)
	end,
	parseLabelWithContent = function (slot0, slot1, slot2)
		if not slot2 then
			if slot1 == nil or slot1 == "" then
				return
			end
		else
			slot1 = nil
		end

		slot4 = uv0.parseLabelHead(slot0)
		slot4.labelname = uv0.parseLabelname(slot0)
		slot4.content = slot1

		return slot4
	end,
	parseLabelname = function (slot0)
		slot1, slot2 = string.find(slot0, "%w+")

		if not slot1 then
			print("labelparser # error: label name not found")

			return nil
		end

		return string.lower(string.sub(slot0, slot1, slot2))
	end,
	parseLabelHead = function (slot0)
		slot1 = {}
		slot5 = "[%w%_]+%=[^%s%>]+"

		for slot5 in string.gmatch(slot0, slot5) do
			slot6 = string.find(slot5, "=")
			slot7 = string.lower(string.sub(slot5, 1, slot6 - 1))
			slot9 = false
			slot10, slot11 = string.find(string.sub(slot5, slot6 + 1, string.len(slot5)), "['\"].+['\"]")

			if slot10 then
				slot8 = string.sub(slot8, slot10 + 1, slot11 - 1)
				slot9 = true
			end

			if not slot9 then
				if string.lower(slot8) == "true" then
					slot8 = true
					slot9 = true
				elseif slot12 == "false" then
					slot8 = false
					slot9 = true
				end
			end

			if not slot9 and tonumber(slot8) then
				slot8 = slot12
				slot9 = true
			end

			slot1[slot7] = slot8
		end

		return slot1
	end,
	peekstack = function (slot0)
		return slot0[#slot0]
	end,
	pushstack = function (slot0, slot1)
		table.insert(slot0, slot1)
	end,
	popstack = function (slot0)
		slot0[#slot0] = nil

		return slot0[#slot0]
	end
}
