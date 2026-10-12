MapUtil = MapUtil or {}
MapUtil.c_w = 256
MapUtil.c_h = 256
MapUtil.c_sw = 1024
MapUtil.c_sh = 1024
MapUtil.half_w = display.width / 2
MapUtil.half_h = display.height / 2
MapUtil.b = "b"
MapUtil.m = "m"
MapUtil.f = "f"
MapUtil.s = "s"
MapUtil.e = "e"
MapUtil.front = "front"
MapUtil.back = "back"
MapUtil.moveArea = 300
MapUtil.abA = MapUtil.moveArea
MapUtil.adA = -MapUtil.moveArea * 1.5
MapUtil.bcA = MapUtil.moveArea * 1.5
MapUtil.mp = MapUtil.half_w
MapUtil.ep = 0
MapUtil.cp = MapUtil.mp - MapUtil.moveArea
MapUtil.ap = MapUtil.mp - MapUtil.moveArea / 2
MapUtil.bp = MapUtil.mp + MapUtil.moveArea / 2
MapUtil.dp = MapUtil.mp + MapUtil.moveArea
MapUtil.fp = SCREEN_WIDTH
MapUtil.toLeft = false

function MapUtil.getDist(slot0, slot1)
	if slot0 == nil then
		return 0
	end

	slot2 = slot0.x - slot1.x
	slot3 = slot0.y - slot1.y

	return math.abs(slot2 * slot2 + slot3 * slot3)
end

function MapUtil.getDistanceSquared(slot0, slot1)
	if slot0 == nil then
		return 0
	end

	slot2 = slot0.x - slot1.x
	slot3 = slot0.y - slot1.y

	return math.sqrt(math.abs(slot2 * slot2 + slot3 * slot3))
end

function MapUtil.isOnRange(slot0, slot1, slot2)
	return MapUtil.getDistanceSquared(slot0, slot1) <= slot2
end
