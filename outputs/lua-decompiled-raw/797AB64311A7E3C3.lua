slot1 = PlanesController:getInstance():getModel()
slot2 = string.format
PlanesEvtItem = PlanesEvtItem or BaseClass()

function PlanesEvtItem.__init(slot0, slot1)
	slot0.parent = slot1

	slot0:createRootWnd()
	slot0:registerEvent()
end

function PlanesEvtItem.createRootWnd(slot0)
	slot0.size = cc.size(PlanesConst.Grid_Width, PlanesConst.Grid_Height)
	slot0.root_wnd = ccui.Widget:create()

	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0))
	slot0.root_wnd:setContentSize(slot0.size)
	slot0.parent:addChild(slot0.root_wnd)
end

function PlanesEvtItem.registerEvent(slot0)
end

function PlanesEvtItem.setData(slot0, slot1, slot2)
	if slot0.data ~= nil and slot0.update_self_event ~= nil then
		slot0.data:UnBind(slot0.update_self_event)

		slot0.update_self_event = nil
	end

	if slot1 ~= nil then
		slot0.data = slot1

		if slot0.update_self_event == nil then
			slot0.update_self_event = slot0.data:Bind(PlanesEvent.Update_Evt_Status_Event, function ()
				uv0:updateEvtInfo()
			end)
		end

		slot0:updateEvtInfo(slot2)
	end
end

function PlanesEvtItem.updateEvtInfo(slot0, slot1)
	if not slot0.data then
		return
	end

	slot0.evt_cfg = slot0.data.config or {}

	if slot0.data.is_hide == 1 then
		slot0:setVisible(false)

		return
	else
		slot0:setVisible(not slot1)
	end

	slot2 = {}

	if (slot0.evt_cfg.type ~= PlanesConst.Evt_Type.Stage or (slot0.data.platform ~= 1 or slot0.evt_cfg.res_1) and slot0.evt_cfg.res_2) and (slot0.evt_cfg.type ~= PlanesConst.Evt_Type.Stage or (slot0.data.switch ~= 0 or slot0.evt_cfg.res_1) and slot0.evt_cfg.res_2) and (slot0.data.status ~= PlanesConst.Evt_State.Down or slot0.evt_cfg.res_2) and slot0.evt_cfg.res_1 and next(slot2) ~= nil then
		slot3 = slot2[1]
		slot4 = slot2[2]

		if not slot0.cur_res_name or slot0.cur_res_name ~= slot4 then
			slot0.cur_res_name = slot4

			if slot0.evt_effect then
				slot0.evt_effect:clearTracks()
				slot0.evt_effect:removeFromParent()

				slot0.evt_effect = nil
			end

			if slot3 == 1 then
				slot5 = slot0:getEvtPathByResId(slot4)

				if not slot0.evt_icon_sp then
					slot0.evt_icon_sp = createSprite(nil, slot0.size.width * 0.5, slot0.size.height * 0.5, slot0.root_wnd, cc.p(0.5, 0.5), LOADTEXT_TYPE)
				end

				slot0.evt_icon_sp:setVisible(true)

				if slot0.evt_cfg.reversal == 1 then
					slot0.evt_icon_sp:setScaleX(-1)
				else
					slot0.evt_icon_sp:setScaleX(1)
				end

				slot0.evt_sp_load = loadSpriteTextureFromCDN(slot0.evt_icon_sp, slot5, ResourcesType.single, slot0.evt_sp_load)
			elseif slot3 == 2 then
				slot0.evt_effect = createEffectSpine(slot4, cc.p(slot0.size.width * 0.5, slot0.size.height * 0.5), cc.p(0.5, 0.5), true, PlayerAction.action)

				slot0.root_wnd:addChild(slot0.evt_effect)

				if slot0.evt_cfg.reversal == 1 then
					slot0.evt_effect:setScaleX(-1)
				else
					slot0.evt_effect:setScaleX(1)
				end

				if slot0.evt_icon_sp then
					slot0.evt_icon_sp:setVisible(false)
				end
			end

			if slot0.evt_cfg.offset then
				if slot0.evt_icon_sp then
					slot0.evt_icon_sp:setPosition(slot0.size.width * 0.5 + (slot0.evt_cfg.offset[1] or 0), slot0.size.height * 0.5 + (slot0.evt_cfg.offset[2] or 0))
				end

				if slot0.evt_effect then
					slot0.evt_effect:setPosition(slot0.size.width * 0.5 + slot5, slot0.size.height * 0.5 + slot6)
				end

				slot0:updateNameTxt(slot5, slot6)
			end
		elseif slot3 == 1 and slot0.evt_icon_sp then
			slot0.evt_icon_sp:setVisible(true)
		elseif slot3 == 2 and slot0.evt_effect then
			slot0.evt_effect:setVisible(true)
		end
	else
		if slot0.evt_icon_sp then
			slot0.evt_icon_sp:setVisible(false)
		end

		if slot0.name_txt then
			slot0.name_txt:setVisible(false)
		end

		if slot0.evt_effect then
			slot0.evt_effect:clearTracks()
			slot0.evt_effect:removeFromParent()

			slot0.evt_effect = nil
		end

		slot0.cur_res_name = nil
	end
end

function PlanesEvtItem.updateNameTxt(slot0, slot1, slot2)
	if slot0.evt_cfg.type ~= PlanesConst.Evt_Type.Normal and slot0.evt_cfg.type ~= PlanesConst.Evt_Type.Barrier then
		if not slot0.name_txt then
			slot0.name_txt = createLabel(18, 1, 2, 0, 10, "", slot0.root_wnd, 2, cc.p(0.5, 1))
		end

		slot0.name_txt:setLocalZOrder(99)
		slot0.name_txt:setString(slot0.evt_cfg.name)
		slot0.name_txt:setPosition(slot0.size.width * 0.5 + slot1, slot2)
		slot0.name_txt:setVisible(true)
	elseif slot0.name_txt then
		slot0.name_txt:setVisible(false)
	end
end

function PlanesEvtItem.setVisible(slot0, slot1)
	if not tolua.isnull(slot0.root_wnd) then
		slot0.root_wnd:setVisible(slot1)
	end
end

function PlanesEvtItem.setPosition(slot0, slot1, slot2)
	if not tolua.isnull(slot0.root_wnd) then
		slot0.root_wnd:setPosition(slot1, slot2 - PlanesConst.Grid_Height * 0.5)
	end
end

function PlanesEvtItem.setLocalZOrder(slot0, slot1)
	if not tolua.isnull(slot0.root_wnd) then
		slot0.root_wnd:setLocalZOrder(slot1)
	end
end

function PlanesEvtItem.getEvtPathByResId(slot0, slot1)
	if slot1 and slot1 ~= "" then
		return uv0("resource/planes/evt_icon/%s.png", slot1)
	end
end

function PlanesEvtItem.showEvtEnterAni(slot0, slot1)
	if not tolua.isnull(slot0.root_wnd) then
		slot2, slot3 = slot0.root_wnd:getPosition()

		slot0.root_wnd:runAction(cc.Sequence:create(cc.DelayTime:create(slot1 + 0.3), cc.CallFunc:create(function ()
			uv0.root_wnd:setOpacity(0)
			uv0.root_wnd:setVisible(true)
			uv0.root_wnd:setScale(0.1)
		end), cc.Spawn:create(cc.FadeIn:create(0.4), cc.ScaleTo:create(0.4, 1))))
	end
end

function PlanesEvtItem.showClickAni(slot0)
	slot0.root_wnd:runAction(cc.Sequence:create(cc.Spawn:create(cc.EaseBackOut:create(cc.MoveBy:create(0.1, cc.p(0, 20))), cc.ScaleTo:create(0.1, 1.1)), cc.Spawn:create(cc.EaseBackOut:create(cc.MoveBy:create(0.1, cc.p(0, -20))), cc.ScaleTo:create(0.1, 0.9)), cc.ScaleTo:create(0.05, 1)))
end

function PlanesEvtItem.__delete(slot0)
	if slot0.data ~= nil and slot0.update_self_event ~= nil then
		slot0.data:UnBind(slot0.update_self_event)

		slot0.update_self_event = nil
	end

	if slot0.evt_sp_load then
		slot0.evt_sp_load:DeleteMe()

		slot0.evt_sp_load = nil
	end

	if slot0.evt_effect then
		slot0.evt_effect:clearTracks()
		slot0.evt_effect:removeFromParent()

		slot0.evt_effect = nil
	end

	if slot0.root_wnd:getParent() then
		slot0.root_wnd:removeAllChildren()
		slot0.root_wnd:removeFromParent()
	end
end
