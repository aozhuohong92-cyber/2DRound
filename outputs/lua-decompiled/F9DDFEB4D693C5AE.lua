return function (slot0, slot1, slot2)
	if not slot1.src then
		return
	end

	if (string.find(slot1.src, "R") ~= nil or string.find(slot1.src, "H") ~= nil or string.find(slot1.src, "E") ~= nil) and string.sub(slot1.src, -4) ~= ".png" then
		slot3 = ChatController:getInstance():getFaceSpineSize(slot1.src)
		slot1.width = slot1.width or slot3[1]
		slot1.height = slot1.height or slot3[2]
		slot4 = createSpineByName(slot1.src)

		slot4:setAnimation(0, PlayerAction.action, true)

		slot5 = ccui.Layout:create()

		slot5:setAnchorPoint(cc.p(0, 0))
		slot5:setContentSize({
			width = slot1.width,
			height = slot1.height
		})
		slot5:addChild(slot4)

		return {
			slot5
		}
	end

	if not slot0:getSprite(slot1.src) then
		slot0:printf("<img> - create sprite failde")

		return
	end

	if slot1.scale then
		slot3:setScale(slot1.scale)
	end

	if slot1.rotate then
		slot3:setRotation(slot1.rotate)
	end

	if slot1.visible ~= nil then
		slot3:setVisible(slot1.visible)
	end

	if not slot0:getSprite(slot1.src) then
		slot0:printf("<img> - create sprite failde")

		return
	end

	if slot1.scale then
		slot4:setScale(slot1.scale)

		slot5 = slot4:getContentSize()

		slot4:setContentSize(cc.size(slot5.width * slot1.scale, slot5.height * slot1.scale))
	end

	if slot1.rotate then
		slot4:setRotation(slot1.rotate)
	end

	if slot1.visible ~= nil then
		slot4:setVisible(slot1.visible)
	end

	slot3.richtext = ccui.RichElementCustomNode:create(autoId(), cc.c3b(255, 255, 255), 255, slot4)
	slot3.content2 = "图片" .. slot1.src
	slot3.target = slot4
	slot1.nodes = {
		slot3
	}
end
