TileUtil = TileUtil or {}
TileUtil.tileWidth = 30
TileUtil.tileHeight = 30

function TileUtil.changeXToTile(slot0)
	return math.ceil(slot0 / TileUtil.tileWidth)
end

function TileUtil.changeYToTile(slot0)
	return math.ceil(slot0 / TileUtil.tileHeight)
end

function TileUtil.changeXToPixs(slot0)
	return slot0 * TileUtil.tileWidth - 15
end

function TileUtil.changeYToPixs(slot0)
	return slot0 * TileUtil.tileHeight - 15
end

function TileUtil.changeToTilePoint(slot0)
	if slot0 == nil then
		return nil
	end

	return cc.p(TileUtil.changeXToTile(slot0.x), TileUtil.changeYToTile(slot0.y))
end

function TileUtil.changeToPixsPoint(slot0)
	if slot0 == nil then
		return nil
	end

	return cc.p(TileUtil.changeXToPixs(slot0.x), TileUtil.changeYToPixs(slot0.y))
end
