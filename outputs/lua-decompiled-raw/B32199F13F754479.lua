slot0 = 10
slot1 = 10
slot2 = 14
slot3 = 1000
slot4 = false
slot5 = false
slot6 = false
slot7 = math.abs
slot8 = GameMath.round
Astar = Astar or BaseClass()
Astar.celltype = {
	block = 1,
	water = 3,
	desert = 6,
	grass = 5,
	alpha = 2,
	snow = 4,
	normal = 0
}

function Astar.__init(slot0)
	if Astar.Instance ~= nil then
		error("[Astar] accempt to create a singleton twice!")

		return
	end

	slot0.show_ui = uv0
	slot0.open = Heap.New("f")
	slot0.all_point = {}
	slot0.block = {}
	slot0.max_x = 0
	slot0.max_y = 0
	slot0.dynamic_block = {}
	slot0.junction = {}
	slot0.start_point = cc.p(0, 0)
	slot0.end_point = cc.p(0, 0)
	slot0.path = nil
end

function Astar.getInstance(slot0)
	if Astar.Instance == nil then
		Astar.Instance = Astar.New()
	end

	return Astar.Instance
end

function Astar.reset(slot0)
	slot0.all_point = {}
	slot0.path = nil

	slot0.open:clear()
end

function Astar.clear(slot0)
	slot0:reset()

	slot0.block = {}
	slot0.max_x = 0
	slot0.max_y = 0
	slot0.dynamic_block = {}
	slot0.junction = {}
end

function Astar.setBlock(slot0, slot1)
	slot0.block = slot1
	slot0.max_y = #slot1
	slot0.max_x = #slot1[1] or 0

	slot0:showUI()
end

function Astar.setMax(slot0, slot1, slot2)
	slot0.max_x = slot1
	slot0.max_y = slot2
end

function Astar.setDynamicBlock(slot0, slot1)
	slot0.dynamic_block = slot1
end

function Astar.setJunction(slot0, slot1)
	slot0.junction = slot1
end

function Astar.calcH(slot0, slot1, slot2, slot3, slot4)
	return uv0(slot1 - slot3) * uv1 + uv0(slot2 - slot4) * uv2
end

function Astar.calc_key(slot0, slot1)
	return slot1
end

function Astar.new_point(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot3 == nil then
		return slot0:calc_key({
			g = 0,
			f = 0,
			h = 0,
			n = 0,
			x = slot1,
			y = slot2,
			dir = DirType.None
		})
	else
		slot6 = slot3.g + slot5
		slot7 = slot0:calcH(slot1, slot2, slot0.end_point.x, slot0.end_point.y)

		return slot0:calc_key({
			x = slot1,
			y = slot2,
			g = slot6,
			h = slot7,
			f = slot6 + slot7,
			parent = slot3,
			dir = slot4,
			n = slot3.n + 1
		})
	end
end

function Astar.isSamePoint(slot0, slot1, slot2)
	if slot1 == nil or slot2 == nil then
		return
	end

	return slot1.x == slot2.x and slot1.y == slot2.y
end

function Astar.autoCheck(slot0, slot1)
	if not slot0:isBlock(slot1.x, slot1.y) then
		return slot1
	elseif not slot0:isBlock(slot1.x + 1, slot1.y) then
		return {
			x = slot1.x + 1,
			y = slot1.y
		}
	elseif not slot0:isBlock(slot1.x - 1, slot1.y) then
		return {
			x = slot1.x - 1,
			y = slot1.y
		}
	elseif not slot0:isBlock(slot1.x, slot1.y + 1) then
		return {
			x = slot1.x,
			y = slot1.y + 1
		}
	elseif not slot0:isBlock(slot1.x, slot1.y - 1) then
		return {
			x = slot1.x,
			y = slot1.y - 1
		}
	elseif not slot0:isBlock(slot1.x + 2, slot1.y) then
		return {
			x = slot1.x + 2,
			y = slot1.y
		}
	elseif not slot0:isBlock(slot1.x - 2, slot1.y) then
		return {
			x = slot1.x - 2,
			y = slot1.y
		}
	elseif not slot0:isBlock(slot1.x, slot1.y + 2) then
		return {
			x = slot1.x,
			y = slot1.y + 2
		}
	elseif not slot0:isBlock(slot1.x, slot1.y - 2) then
		return {
			x = slot1.x,
			y = slot1.y - 2
		}
	end

	return nil
end

function Astar.find(slot0, slot1, slot2)
	if slot2 == nil then
		return
	end

	if slot0:isSamePoint(slot1, slot2) then
		return
	end

	if slot0.path and slot0:isSamePoint(slot0.start_point, slot1) and slot0:isSamePoint(slot0.end_point, slot2) then
		return true
	end

	slot0:reset()

	if slot0:isBlock(slot2.x, slot2.y) then
		print("目标点为不可行走区域", slot3, slot4, slot0.max_x, slot0.max_y)

		return false
	end

	start_point_new = slot0:autoCheck(slot1)

	if start_point_new == nil and math.max(math.abs(slot1.x - slot3), math.abs(slot1.y - slot4)) < 8 then
		print("起始点在不可行走区域", slot1.x, slot1.y, slot0.max_x, slot0.max_y)

		slot0.path = {
			x = slot3,
			y = slot4,
			parent = slot1
		}

		return true
	elseif start_point_new == nil then
		print("起始点在不可行走区域", slot1.x, slot1.y, slot0.max_x, slot0.max_y)

		return false
	end

	if slot0:isSamePoint(start_point_new, slot2) then
		return
	end

	slot5 = os.clock()
	slot0.start_point = slot1
	slot0.end_point = slot2
	slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot14 = nil
	slot16 = slot0.all_point

	slot0.open:insert(slot0:new_point(start_point_new.x, start_point_new.y))

	while not slot15:IsEmpty() do
		slot8 = slot15:take_smallest()
		slot8.close = 1
		slot20 = slot8.x
		slot21 = slot8.y

		for slot20, slot21 in pairs(slot0:nextPos(slot20, slot21, slot8.dir)) do
			slot11 = slot21[2]

			if slot16[slot21[1]] and slot16[slot10][slot11] then
				slot14 = slot8.g + slot21[4]

				if slot16[slot10][slot11].close == nil and slot14 < slot6.g then
					slot6.g = slot14
					slot6.f = slot6.g + slot6.h
					slot6.parent = slot8
					slot6.dir = slot21[3]
					slot6.n = slot8.n + 1
				end
			elseif slot10 == slot3 and slot11 == slot4 then
				slot0.path = slot0:new_point(slot10, slot11, slot8, slot12, slot13)

				slot0:showUI()

				slot16 = {}

				slot15:clear()

				return true
			elseif not slot0:isBlock(slot10, slot11) then
				slot6 = slot0:new_point(slot10, slot11, slot8, slot12, slot13)

				if slot16[slot10] == nil then
					slot16[slot10] = {}
				end

				slot16[slot10][slot11] = slot6

				slot15:insert(slot6)
			end
		end
	end

	slot0.path = slot6

	slot0:showUI()
	slot0:reset()

	return false
end

function Astar.isBlock(slot0, slot1, slot2)
	if slot1 < 1 or slot0.max_x < slot1 then
		return true
	elseif slot2 < 1 or slot0.max_y < slot2 then
		return true
	elseif uv0 then
		return false
	elseif slot0:isNotBlock(slot0.block[slot2][slot1]) then
		return false
	elseif Astar.celltype.block == 1 or slot3 == nil then
		return true
	else
		return slot0.dynamic_block[slot3] == nil or slot3 == Astar.celltype.block
	end
end

function Astar.isNotBlock(slot0, slot1)
	return slot1 == Astar.celltype.normal or slot1 == Astar.celltype.alpha or slot1 == Astar.celltype.water or slot1 == Astar.celltype.snow or slot1 == Astar.celltype.grass or slot1 == Astar.celltype.desert
end

function Astar.isAlpha(slot0, slot1, slot2)
	return slot0.block[slot2] and slot0.block[slot2][slot1] == Astar.celltype.alpha
end

function Astar.type(slot0, slot1, slot2)
	if slot0.block[slot2] then
		return slot0.block[slot2][slot1]
	end

	return Astar.celltype.normal
end

function Astar.rand(slot0)
	slot1 = {
		x = math.random(1, slot0.max_x),
		y = math.random(1, slot0.max_y)
	}

	if slot0:isBlock(slot1.x, slot1.y) then
		return slot0:rand()
	end

	return slot1
end

function Astar.randNextPoint(slot0, slot1, slot2, slot3)
	slot4 = {
		x = slot1.x + math.random(-slot2.x, slot2.x),
		y = slot1.y + math.random(-slot2.y, slot2.y)
	}

	if slot0:isBlock(slot4.x, slot4.y) then
		return nil
	elseif slot3 and slot0:lineInBlock(slot3, slot4) then
		return nil
	end

	return slot4
end

function Astar.getPath(slot0, slot1)
	slot2 = {}
	slot3 = slot0.path

	while slot3 do
		table.insert(slot2, {
			x = slot3.x,
			y = slot3.y
		})

		slot3 = slot3.parent
	end

	if slot1 then
		slot0:reset()
	end

	return slot2
end

function Astar.floyd(slot0, slot1)
	if #slot0:getPath(slot1) > 2 then
		slot4, slot5 = slot0:getNodeDistance(slot2[1], slot2[2])
		slot6 = 3

		while slot3 >= slot6 do
			slot7, slot8 = slot0:getNodeDistance(slot2[slot6 - 1], slot2[slot6])

			if slot4 == slot7 and slot5 == slot8 then
				table.remove(slot2, slot6 - 1)

				slot3 = slot3 - 1
			else
				slot6 = slot6 + 1
				slot4 = slot7
				slot5 = slot8
			end
		end

		slot6 = 3

		while slot3 >= slot6 do
			if slot0:lineInBlock(slot2[slot6 - 2], slot2[slot6]) then
				slot6 = slot6 + 1
			else
				table.remove(slot2, slot6 - 1)

				slot3 = slot3 - 1
			end
		end
	end

	return slot2
end

function Astar.lineInBlock(slot0, slot1, slot2)
	slot3 = slot1.x - slot2.x
	slot4 = slot1.y - slot2.y
	slot5 = math.max(uv0(slot3), uv0(slot4))

	for slot11 = 1, slot5 do
		if uv1(slot1.x - slot3 / slot5 * slot11) == slot1.x and uv1(slot1.y - slot4 / slot5 * slot11) == slot1.y then
			-- Nothing
		elseif slot12 == slot2.x and slot13 == slot2.y then
			-- Nothing
		elseif slot0:isBlock(slot12, slot13) then
			return true
		end
	end

	return false
end

function Astar.hasBlock(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		if slot0:isBlock(slot6.x, slot6.y) then
			return true
		end
	end

	return false
end

function Astar.getNodeDistance(slot0, slot1, slot2)
	return slot1.x - slot2.x, slot1.y - slot2.y
end

function Astar.targetPos(slot0, slot1, slot2)
	slot4 = slot2.x - 50

	if slot2.x < slot1.x then
		slot3 = slot2.x + 50
	end

	slot6 = slot2.y - 50

	if slot2.y < slot1.y then
		slot5 = slot2.y + 50
	end

	slot7 = 0
	slot8, slot9 = nil

	while slot7 < 3 do
		if not slot0:isBlock(TileUtil.changeXToTile(math.random(slot4, slot3)), TileUtil.changeYToTile(math.random(slot6, slot5))) then
			return cc.p(slot8, slot9)
		end

		slot7 = slot7 + 1
	end

	return slot2
end

function Astar.nextDoor(slot0, slot1)
	return Astar.findDoor(slot0, slot1) and slot2[#slot2] or nil
end

function Astar.findDoor(slot0, slot1)
	if slot0 == slot1 then
		return nil
	end

	if not Config.Map[slot0] then
		return nil
	end

	if not Config.Map[slot1] then
		return nil
	end

	slot2 = {}

	for slot6, slot7 in pairs(Config.Map[slot0].unit_list) do
		table.insert(slot2, {
			slot6,
			slot7
		})
	end

	slot3, slot4, slot5 = nil
	slot6 = {
		[slot0] = 1
	}

	while next(slot2) do
		if Config.UnitData.data_unit(table.remove(slot2, 1)[2][1]) and slot4.sub_type == 102 then
			if Config.MapUnit[slot3[2][1]][1] == slot1 then
				slot2 = {}

				while true do
					slot8 = UnitVo.New()
					slot8.battle_id = 1
					slot8.id = slot3.id
					slot8.base_id = slot3.id
					slot8.type = UnitVo.Type.DOOR
					slot8.x = slot3[2][2]
					slot8.y = slot3[2][3]

					table.insert(slot2, slot8)

					if slot3[3] == nil then
						return slot2
					end
				end
			elseif not slot6[slot5] and Config.Map[slot5] then
				slot6[slot5] = 1

				for slot11, slot12 in pairs(Config.Map[slot5].unit_list) do
					table.insert(slot2, {
						slot11,
						slot12,
						slot3
					})
				end
			end
		end
	end

	return nil
end

function Astar.nextPos(slot0, slot1, slot2, slot3)
	if slot3 == DirType.Top then
		return {
			{
				slot1,
				slot2 - 1,
				DirType.Top,
				uv0
			},
			{
				slot1 - 1,
				slot2 - 1,
				DirType.LeftTop,
				uv1
			},
			{
				slot1 + 1,
				slot2 - 1,
				DirType.RightTop,
				uv1
			},
			{
				slot1 - 1,
				slot2,
				DirType.Left,
				uv2
			},
			{
				slot1 + 1,
				slot2,
				DirType.Right,
				uv2
			}
		}
	elseif slot3 == DirType.Bottom then
		return {
			{
				slot1,
				slot2 + 1,
				DirType.Bottom,
				uv0
			},
			{
				slot1 - 1,
				slot2 + 1,
				DirType.LeftBottom,
				uv1
			},
			{
				slot1 + 1,
				slot2 + 1,
				DirType.RightBottom,
				uv1
			},
			{
				slot1 - 1,
				slot2,
				DirType.Left,
				uv2
			},
			{
				slot1 + 1,
				slot2,
				DirType.Right,
				uv2
			}
		}
	elseif slot3 == DirType.Left then
		return {
			{
				slot1 - 1,
				slot2,
				DirType.Left,
				uv2
			},
			{
				slot1 - 1,
				slot2 - 1,
				DirType.LeftTop,
				uv1
			},
			{
				slot1 - 1,
				slot2 + 1,
				DirType.LeftBottom,
				uv1
			},
			{
				slot1,
				slot2 - 1,
				DirType.Top,
				uv0
			},
			{
				slot1,
				slot2 + 1,
				DirType.Bottom,
				uv0
			}
		}
	elseif slot3 == DirType.Right then
		return {
			{
				slot1 + 1,
				slot2,
				DirType.Right,
				uv2
			},
			{
				slot1 + 1,
				slot2 - 1,
				DirType.RightTop,
				uv1
			},
			{
				slot1 + 1,
				slot2 + 1,
				DirType.RightBottom,
				uv1
			},
			{
				slot1,
				slot2 - 1,
				DirType.Top,
				uv0
			},
			{
				slot1,
				slot2 + 1,
				DirType.Bottom,
				uv0
			}
		}
	elseif slot3 == DirType.LeftTop then
		return {
			{
				slot1 - 1,
				slot2 - 1,
				DirType.LeftTop,
				uv1
			},
			{
				slot1 - 1,
				slot2,
				DirType.Left,
				uv2
			},
			{
				slot1,
				slot2 - 1,
				DirType.Top,
				uv0
			},
			{
				slot1 - 1,
				slot2 + 1,
				DirType.LeftBottom,
				uv1
			},
			{
				slot1 + 1,
				slot2 - 1,
				DirType.RightTop,
				uv1
			}
		}
	elseif slot3 == DirType.RightTop then
		return {
			{
				slot1 + 1,
				slot2 - 1,
				DirType.RightTop,
				uv1
			},
			{
				slot1 + 1,
				slot2,
				DirType.Right,
				uv2
			},
			{
				slot1,
				slot2 - 1,
				DirType.Top,
				uv0
			},
			{
				slot1 - 1,
				slot2 - 1,
				DirType.LeftTop,
				uv1
			},
			{
				slot1 + 1,
				slot2 + 1,
				DirType.RightBottom,
				uv1
			}
		}
	elseif slot3 == DirType.LeftBottom then
		return {
			{
				slot1 - 1,
				slot2 + 1,
				DirType.LeftBottom,
				uv1
			},
			{
				slot1 - 1,
				slot2,
				DirType.Left,
				uv2
			},
			{
				slot1,
				slot2 + 1,
				DirType.Bottom,
				uv0
			},
			{
				slot1 - 1,
				slot2 - 1,
				DirType.LeftTop,
				uv1
			},
			{
				slot1 + 1,
				slot2 + 1,
				DirType.RightBottom,
				uv1
			}
		}
	elseif slot3 == DirType.RightBottom then
		return {
			{
				slot1 + 1,
				slot2 + 1,
				DirType.RightBottom,
				uv1
			},
			{
				slot1 + 1,
				slot2,
				DirType.Right,
				uv2
			},
			{
				slot1,
				slot2 + 1,
				DirType.Bottom,
				uv0
			},
			{
				slot1 - 1,
				slot2 + 1,
				DirType.LeftBottom,
				uv1
			},
			{
				slot1 + 1,
				slot2 - 1,
				DirType.RightTop,
				uv1
			}
		}
	else
		return {
			{
				slot1 - 1,
				slot2,
				DirType.Left,
				uv2
			},
			{
				slot1 + 1,
				slot2,
				DirType.Right,
				uv2
			},
			{
				slot1,
				slot2 - 1,
				DirType.Top,
				uv0
			},
			{
				slot1,
				slot2 + 1,
				DirType.Bottom,
				uv0
			},
			{
				slot1 - 1,
				slot2 - 1,
				DirType.LeftTop,
				uv1
			},
			{
				slot1 - 1,
				slot2 + 1,
				DirType.LeftBottom,
				uv1
			},
			{
				slot1 + 1,
				slot2 - 1,
				DirType.RightTop,
				uv1
			},
			{
				slot1 + 1,
				slot2 + 1,
				DirType.RightBottom,
				uv1
			}
		}
	end
end

function Astar.print(slot0)
	slot1 = slot0.path

	while slot1 do
		Debug.log("x=" .. slot1.x, "y=" .. slot1.y, "n=" .. slot1.n, "dir=" .. slot1.dir, "g=" .. slot1.g)

		slot1 = slot1.parent
	end
end

function Astar.showUI(slot0)
	if not slot0.show_ui then
		return
	end

	if not slot0.layer then
		slot0.layer = ccui.Widget:create()
	end

	slot1 = slot0:getPath()
	slot2 = slot0:floyd()

	function slot3(slot0, slot1, slot2)
		for slot6, slot7 in pairs(slot0) do
			if slot7.x == slot1 and slot2 == slot7.y then
				return slot7
			end
		end

		return false
	end

	slot0.layer:removeAllChildren()
	slot0.layer:addChild(cc.DrawNode:create())

	slot6 = TileUtil.tileHeight
	slot11 = 0.8

	for slot11 = 1, slot0.max_y do
		slot4:drawLine(cc.p(0, slot11 * slot6), cc.p(slot0.max_x * TileUtil.tileWidth, slot11 * slot6), cc.c4f(0, 0, slot11, 0.5))
	end

	for slot11 = 1, slot0.max_x do
		slot4:drawLine(cc.p(slot11 * slot5, 0), cc.p(slot11 * slot5, slot0.max_y * slot6), slot7)
	end

	slot8, slot9, slot10 = nil

	for slot14, slot15 in pairs(slot0.block) do
		for slot19, slot20 in pairs(slot15) do
			slot8, slot9 = nil

			if slot3(slot2, slot19, slot14) then
				slot8 = cc.c4f(0, 1, 0, 0.7)
				slot9 = slot0.all_point[slot19] and slot0.all_point[slot19][slot14] or nil
			elseif slot3(slot1, slot19, slot14) then
				slot8 = cc.c4f(0, 1, 0, 0.2)
				slot9 = slot0.all_point[slot19][slot14]
			elseif slot0.all_point[slot19] and slot0.all_point[slot19][slot14] then
				if slot0.all_point[slot19][slot14].close then
					slot8 = cc.c4f(1, 1, 0, 0.6)
				else
					slot8 = cc.c4f(0, 0, 1, 0.5)
				end
			elseif slot0:isBlock(slot19, slot14) then
				slot8 = cc.c4f(1, 0, 0, 0.4)
			end

			if slot8 then
				slot4:drawSolidRect(cc.p((slot19 - 1) * slot5, (slot14 - 1) * slot6), cc.p(slot19 * slot5, slot14 * slot6), slot8)
			end

			if uv0 and slot9 then
				slot10 = createWithSystemFont("", DEFAULT_FONT, 10)

				slot0.layer:addChild(slot10)
				slot10:setString(slot9.f .. "_" .. slot9.n)
				slot10:setAnchorPoint(0, 0)
				slot10:setPosition((slot19 - 1) * slot5 + 1, (slot14 - 1) * slot6 + 2)
			end
		end
	end
end
