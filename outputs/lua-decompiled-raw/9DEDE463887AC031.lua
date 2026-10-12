BattleDramaDropSecBossItem = class("BattleDramaDropSecBossItem", function ()
	return ccui.Layout:create()
end)
BattleDramaDropSecBossItem.WIDTH = 600
BattleDramaDropSecBossItem.HEIGHT = 168

function BattleDramaDropSecBossItem.ctor(slot0)
	slot0:retain()

	slot0.size = size or cc.size(BattleDramaDropSecBossItem.WIDTH, BattleDramaDropSecBossItem.HEIGHT)

	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("battledrama/battle_drama_drop_sec_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("root")
	slot0.name_label = slot0.container:getChildByName("name_label")
	slot0.item_scrollview = slot0.container:getChildByName("item_scrollview")

	slot0.item_scrollview:setScrollBarEnabled(false)
	slot0.item_scrollview:setSwallowTouches(false)

	slot0.item_list = {}
	slot0.swap_label = createRichLabel(24, 117, cc.p(0, 0.5), cc.p(420, 140), nil, , 1000)

	slot0.swap_label:setVisible(false)
	slot0.container:addChild(slot0.swap_label)
	slot0:registerEvent()
end

function BattleDramaDropSecBossItem.registerEvent(slot0)
end

function BattleDramaDropSecBossItem.checkSwapAlert(slot0)
end

function BattleDramaDropSecBossItem.setBossData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	if Config.DungeonData.data_drama_dungeon_info(slot1.dungeon_id) then
		slot0.name_label:setString(slot2.name)
	end

	slot0:updateItem(slot1.items)
	slot0:updateBtnStatus()
end

function BattleDramaDropSecBossItem.updateBtnStatus(slot0)
end

function BattleDramaDropSecBossItem.updateItem(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = 0.8
	slot3 = nil
	slot4 = BackPackItem.Width * slot2 * #slot1
	slot5 = #slot1 * BackPackItem.Width * slot2 + #slot1 * 10
	slot10 = cc.size

	slot0.item_scrollview:setInnerContainerSize(slot10(math.max(slot0.item_scrollview:getContentSize().width, slot5), slot0.item_scrollview:getContentSize().height))

	slot0.start_x = (slot0.item_scrollview:getContentSize().width - slot5) * 0.5

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
				uv2:setPosition(0 + (uv1 - 1) * (BackPackItem.Width * uv3 + 10), uv0.item_scrollview:getContentSize().height / 2)

				slot0 = {
					bid = uv4[1],
					num = uv4[2]
				}

				uv2:setBaseData(uv4[1], uv4[2], true)
				uv2:setDefaultTip()
			end
		end)
	end
end

function BattleDramaDropSecBossItem.DeleteMe(slot0)
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
