slot1 = MonopolyController:getInstance():getModel()
slot2 = string.format
MonopolyGridItem = class("MonopolyGridItem", function ()
	return ccui.Layout:create()
end)

function MonopolyGridItem.ctor(slot0)
	slot0:configUI()
	slot0:registerEvent()
end

function MonopolyGridItem.configUI(slot0)
	slot0.size = cc.size(171, 93)

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("monopoly/monopoly_grid_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.image_bg = slot0.container:getChildByName("image_bg")

	slot0.image_bg:ignoreContentAdaptWithSize(true)
end

function MonopolyGridItem.registerEvent(slot0)
	if not slot0.update_evt_type_event then
		slot0.update_evt_type_event = GlobalEvent:getInstance():Bind(MonopolyEvent.Update_Grid_Evt_Type_Event, function (slot0, slot1, slot2)
			if uv0.data and uv0.data.step_id == slot0 and uv0.data.index == slot1 then
				uv0.data:updateData({
					evt_type = slot2
				})
				uv0:updateEvtType()
			end
		end)
	end
end

function MonopolyGridItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1
	slot0.grid_img_load = loadImageTextureFromCDN(slot0.image_bg, slot0:getGridPathByResId(slot1.map_id, slot1.grid_res_id), ResourcesType.single, slot0.grid_img_load)

	if slot1.grid_index then
		slot3, slot4 = MonopolyTile.indexPixel(slot1.grid_index)

		slot0:setPosition(cc.p(slot3, slot4))
	end

	slot0:updateEvtType()
end

function MonopolyGridItem.updateEvtType(slot0)
	if not slot0.data then
		return
	end

	if slot0.evt_icon then
		slot0.evt_icon:stopAllActions()
		slot0.evt_icon:setVisible(false)
	end

	if slot0.data.evt_type ~= MonopolyConst.Event_Type.Normal then
		slot1 = slot0.data.res_data or {}
		slot3 = slot1[2]

		if (slot1[1] or 1) == 1 and slot3 then
			if slot0:getEvtPathByResId(slot3) then
				if not slot0.evt_icon then
					slot0.evt_icon = createSprite(nil, slot0.size.width * 0.5, slot0.size.height * 0.5, slot0.container, cc.p(0.5, 0), LOADTEXT_TYPE)
				end

				if slot0.data.offset then
					slot0.evt_icon:setPosition(cc.p(slot0.size.width * 0.5 + (slot0.data.offset[1] or 0), slot0.size.height * 0.5 + (slot0.data.offset[2] or 0)))
				end

				slot0.evt_icon:setVisible(true)

				slot0.evt_icon_load = loadSpriteTextureFromCDN(slot0.evt_icon, slot4, ResourcesType.single, slot0.evt_icon_load)

				if slot0.data.show_ani == 1 then
					slot0.evt_icon:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.MoveBy:create(1.4, cc.p(0, 10)), cc.MoveBy:create(1.4, cc.p(0, -10)))))
				else
					slot0.evt_icon:stopAllActions()
				end
			end

			slot0.evt_icon:setVisible(true)

			if slot0.evt_effect then
				slot0.evt_effect:clearTracks()
				slot0.evt_effect:removeFromParent()

				slot0.evt_effect = nil
				slot0.cur_effect_name = nil
			end
		elseif slot2 == 2 and slot3 then
			if not slot0.cur_effect_name or slot0.cur_effect_name ~= slot3 then
				slot0.cur_effect_name = slot3

				if slot0.evt_effect then
					slot0.evt_effect:clearTracks()
					slot0.evt_effect:removeFromParent()

					slot0.evt_effect = nil
				end

				slot4 = 0
				slot5 = 0

				if slot0.data.offset then
					slot4 = slot0.data.offset[1] or 0
					slot5 = slot0.data.offset[2] or 0
				end

				slot0.evt_effect = createEffectSpine(slot3, cc.p(slot0.size.width * 0.5 + slot4, slot0.size.height * 0.5 + slot5), cc.p(0.5, 0.5), true, PlayerAction.action)

				slot0.container:addChild(slot0.evt_effect)
			end

			if slot0.evt_icon then
				slot0.evt_icon:stopAllActions()
				slot0.evt_icon:setVisible(false)
			end
		end
	elseif slot0.evt_effect then
		slot0.evt_effect:clearTracks()
		slot0.evt_effect:removeFromParent()

		slot0.evt_effect = nil
	end
end

function MonopolyGridItem.getGridPathByResId(slot0, slot1, slot2)
	if slot1 and slot2 and slot2 ~= "" then
		return uv0("resource/monopoly/background/%d/%s.png", Config.MonopolyMapsData.data_map_info[slot1].res_id, slot2)
	end
end

function MonopolyGridItem.getEvtPathByResId(slot0, slot1)
	if slot1 and slot1 ~= "" then
		return uv0("resource/monopoly/evt/%s.png", slot1)
	end
end

function MonopolyGridItem.setItemLocalZOrder(slot0, slot1)
	slot0:setLocalZOrder(slot1)
end

function MonopolyGridItem.getCurGridPos(slot0)
	if slot0.data then
		return MonopolyTile.indexTile(slot0.data.grid_index)
	end
end

function MonopolyGridItem.DeleteMe(slot0)
	if slot0.evt_icon_load then
		slot0.evt_icon_load:DeleteMe()

		slot0.evt_icon_load = nil
	end

	if slot0.grid_img_load then
		slot0.grid_img_load:DeleteMe()

		slot0.grid_img_load = nil
	end

	if slot0.evt_effect then
		slot0.evt_effect:clearTracks()
		slot0.evt_effect:removeFromParent()

		slot0.evt_effect = nil
	end

	if slot0.update_evt_type_event then
		GlobalEvent:getInstance():UnBind(slot0.update_evt_type_event)

		slot0.update_evt_type_event = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
