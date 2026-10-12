MapTile = MapTile or BaseClass()

function MapTile.__init(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	slot0.complete_ = false
	slot0.isDeleted = false
	slot0.isAdded__ = false
	slot0.tex = slot2

	if slot1 == nil then
		slot1 = cc.p(0, 0)
	end

	slot0.type = slot3 or MapUtil.s
	slot0.pos__ = slot1
	slot0.anchorPoint = cc.p(0.5, 0.5)
	slot0.parent = slot6
	slot0.top = slot7
	slot0.tile_x = math.floor(slot1.x / MapUtil.c_w)
	slot0.tile_y = math.floor(slot1.y / MapUtil.c_h)
	slot4 = true
	slot0.sprite = cc.Sprite:create()

	slot0.sprite:setAnchorPoint(slot0.anchorPoint)
	slot0:loadResources(slot2)
end

function MapTile.loadResources(slot0, slot1)
	slot0.resources_load = createResourcesLoad(slot1, ResourcesType.single, function ()
		if uv0.sprite then
			loadSpriteTexture(uv0.sprite, uv1, LOADTEXT_TYPE)
		end

		uv0.x = uv0.pos__.x + uv0:getContentSize__().width / 2

		if uv0.top then
			uv0.y = slot1.y - slot0.height / 2
		else
			uv0.y = slot1.y + slot0.height / 2
		end

		uv0.sprite:setPosition(cc.p(uv0.x, uv0.y))

		uv0.pos__ = cc.p(uv0.x, uv0.y)
		uv0.complete_ = true
	end, slot0.resources_load)
end

function MapTile.getSprite(slot0)
	return slot0.sprite
end

function MapTile.isComplete(slot0)
	return slot0.complete_
end

function MapTile.retain(slot0)
	if slot0.retain_ then
		return
	end

	if slot0.sprite then
		slot0.sprite:retain()
	end

	slot0.retain_ = true
end

function MapTile.setVisibleByPos(slot0, slot1)
	if math.abs(slot0.tile_x - slot1.x) < 3 and math.abs(slot0.tile_y - slot1.y) < 3 then
		slot0.sprite:setVisible(true)
	else
		slot0.sprite:setVisible(false)
	end
end

function MapTile.setVisible(slot0, slot1)
	slot0.sprite:setVisible(slot1)
end

function MapTile.__delete(slot0)
	if slot0.resources_load then
		slot0.resources_load:DeleteMe()

		slot0.resources_load = nil
	end

	if slot0.sprite then
		if slot0.retain_ == true then
			doRelease(slot0.sprite)
		end

		if slot0.isAdded__ then
			slot0.sprite:removeFromParent()
		end
	end

	slot0.sprite = nil
	slot0.isDeleted = true
	slot0.isAdded__ = false
end

function MapTile.addChildOnParent(slot0)
	if slot0.complete_ and not slot0.isAdded__ and slot0.sprite and slot0.parent and not tolua.isnull(slot0.parent) then
		slot0.parent:addChild(slot0.sprite, -1)

		slot0.isAdded__ = true
	end
end

function MapTile.setPosition(slot0, slot1)
	if slot0.complete_ then
		slot0.x = slot1.x + slot0:getContentSize__().width / 2

		if slot0.top then
			slot0.y = slot1.y - slot2.height / 2
		else
			slot0.y = slot1.y + slot2.height / 2
		end

		slot0.sprite:setPosition(cc.p(slot0.x, slot0.y))

		slot0.pos__ = cc.p(slot0.x, slot0.y)
	end
end

function MapTile.getContentSize__(slot0)
	return slot0.sprite:getContentSize()
end

function MapTile.getPosition(slot0)
	return slot0.pos__
end

function MapTile.getType(slot0)
	return slot0.type
end

function MapTile.isAdded(slot0)
	return slot0.isAdded__
end
