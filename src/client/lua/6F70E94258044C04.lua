function slot0(slot0, slot1, slot2, slot3, slot4)
	if slot1 == "" then
		return
	end

	if not createWithSystemFont(slot1, slot2, slot3) then
		slot0:printf("<div> - create label failed")

		return
	end

	slot5:setColor(slot4)

	slot5.info = {
		slot1,
		slot2,
		slot3,
		slot4
	}
	slot5.b_size = slot5:getBoundingBox()

	return slot5
end

function slot1(slot0, slot1)
	if not slot1 then
		return
	end

	if #slot0:split(slot1, ",") ~= 4 then
		slot0:printf("parser <div> property shadow error")

		return nil
	end

	slot2.offset = cc.size(tonumber(slot2[1]) or 0, tonumber(slot2[2]) or 0)
	slot2.blurradius = tonumber(slot2[3]) or 0
	slot2.color = slot0:convertColor(slot2[4]) or cc.c4b(255, 255, 255, 255)

	return slot2
end

function slot2(slot0, slot1)
	if not slot1 then
		return
	end

	if #slot0:split(slot1, ",") ~= 2 then
		slot0:printf("parser <div> property outline error")

		return nil
	end

	slot2.size = tonumber(slot2[1]) or 0
	slot2.color = slot0:convertColor(slot2[2]) or cc.c4b(255, 255, 255, 255)

	return slot2
end

function slot3(slot0, slot1)
	if not slot1 then
		return
	end

	return {
		color = slot0:convertColor(slot1) or cc.c4b(255, 255, 255, 255)
	}
end

return function (slot0, slot1, slot2)
	slot1.charlist = slot0:stringToChars(slot1.content or "")
	slot4 = slot1.fontname or slot2.fontName
	slot5 = slot1.fontsize or slot2.fontSize
	slot6 = slot0:convertColor(slot1.fontcolor) or slot2.fontColor
	slot7 = uv0(slot0, slot1.shadow)
	slot9 = uv1(slot0, slot1.outline)
	slot10 = uv2(slot0, glow)

	function slot1.create_node(slot0)
		if uv0(uv1, slot0, uv2, uv3, uv4) then
			if uv5 then
				slot1:enableShadow(uv5.color, uv5.offset, uv5.blurradius)
			end

			if uv6 then
				slot1:enableOutline(uv6.color, uv6.size)
			end

			if uv7 then
				slot1:enableGlow(uv7.color)
			end
		end

		return slot1
	end
end
