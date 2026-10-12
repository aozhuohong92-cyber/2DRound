slot0 = require("UUn2rw1Xe79sI0UaGlea5iQRvaDeuUng.richlabel.labelparser")
slot1 = "UUn2rw1Xe79sI0UaGlea5iQRvaDeuUng.richlabel.RichLabel"
slot2 = "UUn2rw1Xe79sI0UaGlea5iQRvaDeuUng/richlabel/labels/label_"
slot3 = class("RichLabel", function ()
	return cc.Node:create()
end)
slot4 = {}
slot5 = {
	"href",
	"click"
}
slot6 = "richlabel.debug.drawnodes"

function slot3.ctor(slot0, slot1)
	slot1 = slot1 or {}
	slot0._default = {
		fontName = slot1.fontName or "Arial",
		fontSize = slot1.fontSize or 20,
		fontColor = slot1.fontColor or cc.c3b(255, 255, 255),
		lineSpace = slot1.lineSpace or 0,
		charSpace = 0
	}
	slot8 = cc.DrawNode:create()

	slot0:addChild(slot8)

	slot9 = ccui.Widget:create()

	slot9:setAnchorPoint(0, 0)
	slot0:addChild(slot9)

	slot10 = cc.Node:create()

	slot0:addChild(slot10)

	slot0._maxWidth = slot1.maxWidth or 100
	slot0._containerNode = slot10
	slot0._drawLineNode = slot8
	slot0._clickNode = slot9
	slot0._animationCounter = 0

	slot0:setCascadeOpacityEnabled(true)
	slot0:setCascadeColorEnabled(true)
	slot10:setCascadeOpacityEnabled(true)
	slot10:setCascadeColorEnabled(true)
	slot9:setCascadeColorEnabled(true)
	slot9:setCascadeOpacityEnabled(true)
end

function slot3.getSize(slot0)
	return cc.size(slot0._currentWidth, slot0._currentHeight)
end

function slot3.setLineSpace(slot0, slot1)
	slot0._default.lineSpace = slot1
end

function slot3.setMaxWidth(slot0, slot1, slot2)
	slot0._maxWidth = slot1

	if slot2 then
		slot0:layout_()
	end
end

function slot3.getString(slot0)
	return slot0._currentText
end

function slot3.setString(slot0, slot1)
	if slot0._currentText == (slot1 or "") then
		return
	end

	slot0._currentText = slot1
	slot2 = uv0.parse(slot1)
	slot0._parsedtable = slot2

	if slot2 == nil then
		return slot0:printf("parser text error")
	end

	slot0:layout_()
end

function slot3.addTouchLinkListener(slot0, slot1, slot2)
	slot0._clickNode:setTouchEnabled(true)
	slot0._clickNode:setSwallowTouches(false)
	slot0._clickNode:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()
		elseif slot1 == ccui.TouchEventType.ended and uv1 then
			slot3 = uv0._containerNode:convertToNodeSpace(slot0:getTouchEndPosition())
			slot4 = true

			if uv0.touch_began ~= nil then
				slot4 = math.abs(slot2.x - uv0.touch_began.x) <= 20 and math.abs(slot2.y - uv0.touch_began.y) <= 20
			end

			uv2 = uv2 or uv3
			slot5, slot6, slot7 = uv0:isClickByFlag(slot3, uv3)

			if slot5 then
				uv1(slot6, slot7, uv0, slot2, slot4)
			end
		end
	end)
end

function slot3.split(slot0, slot1, slot2)
	if slot2 == "" then
		return false
	end

	slot4 = {}

	for slot8, slot9 in function ()
		return string.find(uv0, uv1, uv2, true)
	end, nil,  do
		table.insert(slot4, string.sub(slot1, 0, slot8 - 1))

		slot3 = slot9 + 1
	end

	table.insert(slot4, string.sub(slot1, slot3))

	return slot4
end

function slot3.addTouchEventListener(slot0, slot1)
	slot0._clickNode:setTouchEnabled(true)
	slot0._clickNode:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended and uv0 then
			uv0(type, value, slot0)
		end
	end)
end

function slot3.isClickByFlag(slot0, slot1, slot2)
	for slot6, slot7 in pairs(slot0._parsedtable) do
		for slot11, slot12 in pairs(slot2) do
			if slot7[slot12] then
				for slot16, slot17 in pairs(slot7.nodes or {}) do
					if cc.rectContainsPoint(slot17:getBoundingBox(), slot1) then
						return true, slot12, slot7[slot12]
					end
				end
			end
		end
	end

	return true, "", ""
end

function slot3.debugDraw(slot0, slot1)
	slot1 = slot1 or 2
	slot3 = cc.utils:findChildren(slot0._containerNode, uv0)

	function table_insertto(slot0, slot1, slot2)
		if slot2 <= 0 then
			slot2 = #slot0 + 1
		end

		for slot7 = 0, #slot1 - 1 do
			slot0[slot7 + slot2] = slot1[slot7 + 1]
		end
	end

	table_insertto(slot3, cc.utils:findChildren(slot0, uv0), #slot3 + 1)

	for slot8, slot9 in pairs(slot3) do
		doRemoveFromParent(slot9)
	end

	slot5 = slot0:getContentSize()
	slot6 = slot0:getAnchorPoint()
	slot7 = cc.rect(0, 0, slot5.width, slot5.height)

	slot0:drawrect(slot0._drawLineNode, slot7, 1, cc.c4f(0, 0, 1, 0.5)):setName(uv0)
	slot0:drawrect(slot0._clickNode, slot7, 1, cc.c4f(0, 1, 0, 0.5)):setName(uv0)
	slot0:drawrect(slot0, slot7, 1):setName(uv0)
	slot0:drawdot(slot0, cc.p(slot5.width * slot6.x, slot5.height * slot6.y), 5):setName(uv0)

	if slot1 > 1 then
		slot13 = 1
		slot14 = 0.5
		slot9 = cc.c4f(0, 0, slot13, slot14)

		for slot13, slot14 in pairs(slot0._parsedtable) do
			for slot18, slot19 in pairs(slot14.nodes) do
				slot0:drawrect(slot2, slot19:getBoundingBox(), 1, slot9):setName(uv0)
				slot0:drawdot(slot2, cc.p(slot19:getPositionX(), slot19:getPositionY()), 2, slot9):setName(uv0)
			end
		end
	end
end

function slot3.layout_(slot0)
	slot0:init_nodes_()

	slot1 = slot0._default.lineSpace
	slot2 = 0
	slot3 = 0
	slot5 = nil

	for slot9 = #slot0:create_allnodes_(), 1, -1 do
		for slot13, slot14 in pairs(slot4[slot9].nodes) do
			slot14:setPositionY(slot3 + (slot5.h - slot14:getBoundingBox().height) / 2)
		end

		slot2 = math.max(slot5.w, slot2)
		slot3 = slot3 + slot5.h + slot1
	end

	slot4 = nil
	slot3 = math.max(0, slot3 - slot1)
	slot0._currentWidth = slot2
	slot0._currentHeight = slot3

	slot0:setContentSize(cc.size(slot2, slot3))
	slot0._clickNode:setContentSize(cc.size(slot2, slot3))
	slot0._drawLineNode:setContentSize(cc.size(slot2, slot3))
	slot0:draw_underline_()
end

function slot3.init_nodes_(slot0)
	for slot4, slot5 in pairs(slot0._parsedtable) do
		if slot0:loadLabelParser_(slot5.labelname) then
			slot7(slot0, slot5, slot0._default)
		end
	end
end

function slot3.draw_underline_(slot0)
	slot0._drawLineNode:clear()

	slot1 = slot0._default.charSpace
	slot2, slot3, slot4 = nil

	for slot8, slot9 in pairs(slot0._parsedtable) do
		if slot9.href and slot9.nodes then
			for slot15, slot16 in pairs(slot9.nodes) do
				slot3, slot4 = slot16:getPosition()

				slot0:drawLine(cc.p(slot3 - slot1 / 2, slot4 - 1), cc.p(slot3 + slot16:getBoundingBox().width + slot1 + 1, slot4 - 1), 1, nil or (slot9.fontcolor and not slot0:convertColor(string.sub(slot9.fontcolor, 2)) or not slot0._default.fontColor or {
					a = 1,
					r = slot11.r / 255,
					g = slot11.g / 255,
					b = slot11.b / 255
				}) and {
					g = 1,
					a = 1,
					b = 1,
					r = 1
				})
			end
		end
	end
end

function slot3.create_allnodes_(slot0)
	slot1 = slot0._parsedtable

	slot0._containerNode:removeAllChildren()

	if slot0._maxWidth <= 0 then
		slot3 = 9999999999.0
	end

	slot4 = slot0._default.charSpace
	slot5 = {}
	slot6 = {}
	slot7 = 0
	slot8 = 0
	slot9, slot10, slot11, slot12, slot13, slot14 = nil

	for slot18, slot19 in pairs(slot1) do
		if slot19.nodes then
			for slot23, slot24 in pairs(slot19.nodes) do
				if slot3 < slot7 + slot24:getBoundingBox().width and slot7 > 0 then
					table.insert(slot5, {
						h = slot8,
						w = slot7 - slot4,
						nodes = slot6
					})

					slot8 = 0
					slot7 = 0
					slot6 = {}
				end

				slot2:addChild(slot24)
				slot24:setAnchorPoint(0, 0)
				slot24:setPositionX(slot7)

				slot7 = slot7 + slot9.width + slot4
				slot8 = math.max(slot8, slot9.height)

				table.insert(slot6, slot24)
			end
		elseif slot19.charlist then
			slot19.nodes = {}
			slot14 = nil
			slot10 = ""

			for slot23, slot24 in pairs(slot19.charlist) do
				if slot14 and slot3 < slot7 + slot14:getBoundingBox().width or slot24 == "\n" then
					if slot14 and (slot10 ~= "" or slot24 == "\n") then
						if slot13 and slot10 ~= "" then
							slot14:setString(slot10)

							slot11 = slot12
						elseif slot13 and slot24 == "\n" then
							slot11 = ""

							table.insert(slot5, {
								h = slot8,
								w = slot7 - slot4,
								nodes = slot6
							})

							slot7 = 0
							slot8 = 0
							slot6 = {}
						else
							slot11 = ""
						end

						slot14:setPositionX(slot7)

						slot9 = slot14:getBoundingBox()
						slot7 = slot7 + slot9.width + slot4
						slot8 = math.max(slot8, slot9.height)

						table.insert(slot6, slot14)

						slot14 = nil
					end

					table.insert(slot5, {
						h = slot8,
						w = math.max(0, slot7 - slot4),
						nodes = slot6
					})

					slot8 = 0
					slot7 = 0
					slot6 = {}
				end

				slot10 = slot11

				if slot24 == "\n" then
					slot12 = ""
				else
					slot11 = slot11 .. slot24
					slot12 = slot24
				end

				if slot14 == nil and slot11 ~= "" then
					slot14 = slot19.create_node(slot11)

					slot2:addChild(slot14)
					slot14:setAnchorPoint(0, 0)
					table.insert(slot19.nodes, slot14)
					slot14:setString(slot11)
				elseif slot14 then
					slot14:setString(slot11)
				end
			end

			if slot14 then
				slot14:setPositionX(slot7)

				slot9 = slot14:getBoundingBox()
				slot7 = slot7 + slot9.width + slot4
				slot8 = math.max(slot8, slot9.height)

				table.insert(slot6, slot14)
			end
		end
	end

	if next(slot6) then
		table.insert(slot5, {
			h = slot8,
			w = slot7 - slot4,
			nodes = slot6
		})
	end

	return slot5
end

function slot3.getElementsWithGroup(slot0, slot1)
	if slot0._parsedtable[slot1] then
		return slot0._parsedtable[slot1].nodes
	end
end

function slot3.loadLabelParser_(slot0, slot1)
	if uv0[slot1] then
		return slot3
	end

	if not string.find(uv1, "%.%w+$") then
		return
	end

	slot6 = string.format("%s.labels.label_%s", string.sub(uv1, 1, slot4 - 1), slot1)

	if not PathTool.isFileExist(uv2 .. slot1 .. ".luac") and not PathTool.isFileExist(uv2 .. slot1 .. ".lua") then
		return nil
	end

	if require(slot6) then
		slot2[slot1] = slot7
	end

	return slot7
end

function slot3.convertColor(slot0, slot1)
	if not slot1 then
		return
	end

	function slot2(slot0)
		return tonumber("0x" .. slot0)
	end

	slot7 = slot2(string.sub(slot1, -4, -3))
	slot8 = slot2(string.sub(slot1, -2, -1))

	if slot2(string.sub(slot1, -6, -5)) and slot7 and slot8 then
		return cc.c4b(slot6, slot7, slot8, 255)
	end
end

function slot3.stringToChars(slot0, slot1)
	slot2 = {}
	slot3 = string.len(slot1)
	slot4 = 1

	while slot3 >= slot4 do
		slot6 = 1

		if string.byte(slot1, slot4) > 0 and slot5 <= 127 then
			slot6 = 1

			if slot5 >= 48 and slot5 <= 57 then
				slot7, slot8 = string.find(string.sub(slot1, slot4), "%d+")

				if slot7 and slot8 then
					slot6 = math.min(20, slot8 - slot7 + 1)
				end
			end
		elseif slot5 >= 192 and slot5 <= 223 then
			slot6 = 2
		elseif slot5 >= 224 and slot5 <= 239 then
			slot6 = 3
		elseif slot5 >= 240 and slot5 <= 247 then
			slot6 = 4
		end

		slot4 = slot4 + slot6

		table.insert(slot2, string.sub(slot1, slot4, slot4 + slot6 - 1))
	end

	table.insert(slot2, "")

	return slot2, slot3
end

function slot3.printf(slot0, slot1, ...)
	return string.format("RichLabel# " .. slot1, ...)
end

function slot3.drawdot(slot0, slot1, slot2, slot3, slot4)
	slot5 = cc.DrawNode:create()

	slot5:drawDot(slot2, slot3 or 2, slot4 or cc.c4f(1, 0, 0, 0.5))
	slot1:addChild(slot5)

	return slot5
end

function slot3.drawrect(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = slot4 or cc.c4f(1, 0, 0, 0.5)
	slot9 = cc.DrawNode:create()

	slot9:drawPolygon({
		cc.p(slot2.x, slot2.y),
		cc.p(slot2.x, slot2.y + slot2.height),
		cc.p(slot2.x + slot2.width, slot2.y + slot2.height),
		cc.p(slot2.x + slot2.width, slot2.y)
	}, 4, slot5 and slot6 or cc.c4f(0, 0, 0, 0), slot3 or 2, slot6)
	slot1:addChild(slot9)

	return slot9
end

function slot3.drawLine(slot0, slot1, slot2, slot3, slot4)
	slot0._drawLineNode:drawSegment(slot1, slot2, slot3, slot4)
end

function slot3.getSprite(slot0, slot1)
	if cc.SpriteFrameCache:getInstance():getSpriteFrame(slot1) then
		return cc.Sprite:createWithSpriteFrame(slot3)
	end

	return cc.Sprite:create(slot1)
end

function slot3.DeleteMe(slot0)
end

return slot3
