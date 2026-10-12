BattleDramaMainPointItem = class("BattleDramaMainPointItem", function ()
	return ccui.Widget:create()
end)
BattleDramaMainPointItem.WIDTH = 50
BattleDramaMainPointItem.HEIGHT = 50

function BattleDramaMainPointItem.ctor(slot0)
	slot0.ctrl = BattleDramaController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.is_big_point = FALSE

	slot0:initUi()
end

function BattleDramaMainPointItem.initUi(slot0)
	slot0.size = cc.size(BattleDramaMainPointItem.WIDTH, BattleDramaMainPointItem.HEIGHT)

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot0:setCascadeOpacityEnabled(true)
	slot0:retain()

	slot0.normal_img = createSprite(PathTool.getResFrame("battle", "battle_normal_point"), slot0.size.width / 2, slot0.size.height / 2, slot0, cc.p(0.5, 0.5))

	slot0:setVisible(false)
	slot0:registerEvent()
end

function BattleDramaMainPointItem.registerEvent(slot0)
	slot0:addTouchEventListener(function (slot0, slot1)
		if uv0.is_big_point == TRUE then
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()

				if uv0.data then
					uv0.ctrl:openDramBossInfoView(true, uv0.data)
				end
			end
		end
	end)
end

function BattleDramaMainPointItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1
	slot2 = slot0.model:getDramaData()
	slot0.is_big_point = slot1.info_data.is_big
	slot0.dun_id = slot1.info_data.id
	slot0.chapter_id = slot1.info_data.chapter_id
	slot0.next_id = slot1.info_data.next_id
	slot0.v_data = slot1.v_data

	slot0:updateStatus(slot0.v_data.status, slot0.is_big_point)
end

function BattleDramaMainPointItem.updateStatus(slot0, slot1, slot2)
	slot0:setVisible(false)

	if slot1 == 1 or slot1 == 2 or slot1 == 3 then
		slot0:setVisible(true)

		if slot1 == 3 and slot2 == TRUE then
			slot0:setTouchEnabled(true)
			loadSpriteTexture(slot0.normal_img, PathTool.getResFrame("battle", "battle_drama_has_ack"))
		elseif slot2 == TRUE then
			slot0:setTouchEnabled(true)
			loadSpriteTexture(slot0.normal_img, PathTool.getResFrame("battle", "battle_drama_no_ack"))
		end
	elseif slot2 == TRUE then
		loadSpriteTexture(slot0.normal_img, PathTool.getResFrame("battle", "battle_drama_no_ack"))
	end
end

function BattleDramaMainPointItem.clearInfo(slot0)
	doStopAllActions(slot0)
	slot0:removeFromParent()
end

function BattleDramaMainPointItem.DeleteMe(slot0)
	doStopAllActions(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
	slot0:release()
end
