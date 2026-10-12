BattleDramaDropItem = class("BattleDramaDropItem", function ()
	return ccui.Layout:create()
end)
BattleDramaDropItem.WIDTH = 600
BattleDramaDropItem.HEIGHT = 168

function BattleDramaDropItem.ctor(slot0, slot1, slot2, slot3)
	slot0:retain()

	slot0.size = slot3 or cc.size(BattleDramaDropItem.WIDTH, BattleDramaDropItem.HEIGHT)

	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("battledrama/battle_drama_drop_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("root")
	slot0.name_label = slot0.container:getChildByName("name_label")
	slot0.item_scrollview = slot0.container:getChildByName("item_scrollview")

	slot0.item_scrollview:setScrollBarEnabled(false)
	slot0.item_scrollview:setSwallowTouches(false)

	slot0.item_list = {}

	slot0:registerEvent()
end

function BattleDramaDropItem.registerEvent(slot0)
end

function BattleDramaDropItem.setData(slot0, slot1, slot2)
	if slot1 == true then
		slot0:updateItem(slot2)
		slot0.name_label:setString(TI18N("当前关卡"))
	else
		slot0.name_label:setString(slot2.name)
		slot0:updateItem(slot2.items)
	end
end

function BattleDramaDropItem.updateItem(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = 0.8
	slot3 = nil
	slot4 = BackPackItem.Width * slot2 * #slot1
	slot10 = cc.size

	slot0.item_scrollview:setInnerContainerSize(slot10(math.max(slot0.item_scrollview:getContentSize().width, #slot1 * BackPackItem.Width * slot2 + #slot1 * 10), slot0.item_scrollview:getContentSize().height))

	slot0.start_x = 0

	for slot10, slot11 in ipairs(slot1) do
		delayRun(slot0.item_scrollview, slot10 / display.DEFAULT_FPS, function ()
			if not uv0.item_list[uv1] then
				uv2 = BackPackItem.new(true, true)

				uv2:setAnchorPoint(0, 0.5)
				uv2:setScale(uv3)
				uv0.item_scrollview:addChild(uv2)

				uv0.item_list[uv1] = uv2
			end

			uv2 = uv0.item_list[uv1]

			if uv2 then
				uv2:setPosition(uv0.start_x + (uv1 - 1) * (BackPackItem.Width * uv3 + 10) + 8, uv0.item_scrollview:getContentSize().height / 2)

				slot1 = {
					bid = uv4[1],
					num = uv4[2]
				}

				uv2:setBaseData(uv4[1], uv4[2], true)
				uv2:setDefaultTip()
			end
		end)
	end
end

function BattleDramaDropItem.DeleteMe(slot0)
	if slot0.item_list and next(slot0.item_list or {}) ~= nil then
		for slot4, slot5 in ipairs(slot0.item_list) do
			if slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
	slot0:release()
end
