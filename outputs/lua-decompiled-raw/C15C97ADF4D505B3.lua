slot1 = PlanesafkController:getInstance():getModel()
slot2 = string.format
PlanesafkEvtItem = PlanesafkEvtItem or BaseClass()

function PlanesafkEvtItem.__init(slot0, slot1)
	slot0.parent = slot1

	slot0:createRootWnd()
	slot0:registerEvent()
end

function PlanesafkEvtItem.createRootWnd(slot0)
	slot0.size = cc.size(PlanesafkConst.Grid_Width, PlanesafkConst.Grid_Height)
	slot0.root_wnd = ccui.Widget:create()

	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0))
	slot0.root_wnd:setContentSize(slot0.size)
	slot0.parent:addChild(slot0.root_wnd)
end

function PlanesafkEvtItem.registerEvent(slot0)
end

function PlanesafkEvtItem.setDarkBgIcon(slot0)
	if not slot0.data then
		return
	end

	if not slot0.bg_icon then
		return
	end

	if slot0.data.is_black == true then
		setChildDarkShader(true, slot0.bg_icon)
	else
		setChildDarkShader(false, slot0.bg_icon)
	end
end

function PlanesafkEvtItem.setData(slot0, slot1)
	slot0.data = slot1

	if slot0.data and slot0.data.is_hide == 0 then
		slot0.is_show = true

		slot0:removeRemoveEffect()

		if slot0.bg_icon == nil then
			slot0.bg_icon = createSprite(nil, slot0.size.width * 0.5, 25, slot0.root_wnd, cc.p(0.5, 0.5), LOADTEXT_TYPE)
		else
			slot0.bg_icon:setVisible(true)
		end

		slot2 = uv0:getMapResID()

		if slot0.record_bg_res == nil or slot0.record_bg_res ~= slot2 then
			slot0.record_bg_res = slot2
			slot0.bg_item_load = loadSpriteTextureFromCDN(slot0.bg_icon, uv0:getBgPathByResId(slot2), ResourcesType.single, slot0.bg_item_load, nil, function ()
				uv0:setDarkBgIcon()
			end)
		else
			slot0:setDarkBgIcon()
		end

		if slot0.data then
			if slot0.layer_bg == nil then
				slot0.layer_bg = ccui.Widget:create()

				slot0.layer_bg:setContentSize(slot0.size)
				slot0.layer_bg:setPosition(0, 0)
				slot0.layer_bg:setAnchorPoint(cc.p(0, 0))
				slot0.layer_bg:setTouchEnabled(true)
				slot0.layer_bg:setSwallowTouches(false)
				slot0.layer_bg:addTouchEventListener(function (slot0, slot1)
					uv0:onClickBtn(slot0, slot1)
				end)
				slot0.root_wnd:addChild(slot0.layer_bg)
			else
				slot0.layer_bg:setVisible(true)
			end

			slot3, slot4 = uv0:getRolePos()

			if slot4 == slot0.data.index and slot3 == slot0.data.line then
				GlobalEvent:getInstance():Fire(PlanesafkEvent.Planesafk_Create_Role_Event)
				slot0:updateEvtInfo(false)
			else
				slot0:updateEvtInfo(true)
			end
		elseif slot0.layer_bg then
			slot0.layer_bg:setVisible(false)
		end
	else
		if slot0.is_show then
			slot0:removeRemoveEffect()

			slot0.remove_effect_spine = createEffectSpine(slot0:getRemoveEvtIconBgEffectId(uv0:getMapResID()), cc.p(91, 40), cc.p(0.5, 0.5), false, PlayerAction.action, function ()
				uv0.remove_effect_spine:setVisible(false)
			end)

			slot0.root_wnd:addChild(slot0.remove_effect_spine)

			slot0.is_show = false
		end

		if slot0.bg_icon then
			slot0.bg_icon:setVisible(false)
		end

		if slot0.layer_bg then
			slot0.layer_bg:setVisible(false)
		end
	end
end

function PlanesafkEvtItem.removeRemoveEffect(slot0)
	if slot0.remove_effect_spine then
		slot0.remove_effect_spine:clearTracks()
		slot0.remove_effect_spine:removeFromParent()

		slot0.remove_effect_spine = nil
	end
end

function PlanesafkEvtItem.onClickBtn(slot0, slot1, slot2)
	if not slot0.evt_cfg then
		return
	end

	if slot2 == ccui.TouchEventType.began then
		slot0.touch_began_pos = slot1:getTouchBeganPosition()
	elseif slot2 == ccui.TouchEventType.ended then
		slot3 = slot1:getTouchEndPosition()

		if slot0.touch_began_pos and slot3 and math.abs(slot3.x - slot0.touch_began_pos.x) <= 20 and math.abs(slot3.y - slot0.touch_began_pos.y) <= 20 then
			uv0:onHandlePlanesEvtById(slot0.evt_cfg.type, slot0.data)
		end
	end
end

function PlanesafkEvtItem.showRoleInfo(slot0)
	slot0:updateEvtInfo(false)

	if not slot0.layer_bg then
		return
	end

	if not slot0.map_role then
		slot0:showRoleShowEffect(true, PlayerAction.action_2)
	end

	slot0:removeRoleInfo(true)

	slot3 = "H60001"

	if Config.HomeData.data_figure[uv0:getPlanesRoleLookId()] then
		slot3 = slot2.look_id
	end

	slot0.map_role = createEffectSpine(slot3, cc.p(0, 0), cc.p(0.5, 0), true, PlayerAction.idle)

	slot0.map_role:setScale(1)
	slot0.layer_bg:addChild(slot0.map_role)
	slot0.map_role:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
end

function PlanesafkEvtItem.showRoleShowEffect(slot0, slot1, slot2)
	if slot1 then
		if slot0.role_show_effect == nil then
			slot0.role_show_effect = createEffectSpine("E27533", cc.p(90, 82), cc.p(0.5, 0.5), false, slot2 or PlayerAction.action_1, function ()
				uv0.role_show_effect:setVisible(false)
			end)

			slot0.root_wnd:addChild(slot0.role_show_effect)
		else
			slot0.role_show_effect:setVisible(true)
			slot0.role_show_effect:setAnimation(0, slot3, false)
		end
	elseif slot0.role_show_effect then
		slot0.role_show_effect:clearTracks()
		slot0.role_show_effect:removeFromParent()

		slot0.role_show_effect = nil
	end
end

function PlanesafkEvtItem.removeRoleInfo(slot0, slot1)
	if slot0.map_role then
		slot0.map_role:clearTracks()
		slot0.map_role:removeFromParent()

		slot0.map_role = nil
		slot0.cur_look_id = nil

		if not slot1 then
			slot0:showRoleShowEffect(true)
		end
	end
end

function PlanesafkEvtItem.updateEvtInfo(slot0, slot1, slot2)
	if slot1 then
		slot0:removeRoleInfo()

		if not slot0.layer_bg then
			return
		end

		if slot0.data.evt_config == nil then
			slot0.data.evt_config = Config.PlanesData.data_evt_info[slot0.data.evt_id]
		end

		slot0.evt_cfg = slot0.data.evt_config

		if not slot0.evt_cfg then
			return
		end

		if slot0.evt_cfg.is_hide == 1 and slot0.data.is_black and slot0.data.line > uv0:getRolePos() + 2 then
			slot0:hideEvtInfo()

			return
		end

		if slot0.evt_cfg.res_1 and next(slot4) ~= nil then
			slot6 = slot4[2]

			if not slot0.cur_res_name or slot0.cur_res_name ~= slot6 then
				slot0.cur_res_name = slot6

				slot0:removeEvtEffect()

				if slot4[1] == 1 then
					slot7 = slot0:getEvtPathByResId(slot6)

					if not slot0.evt_icon_sp then
						slot0.evt_icon_sp = createSprite(nil, slot0.size.width * 0.5, slot0.size.height * 0.5, slot0.layer_bg, cc.p(0.5, 0.5), LOADTEXT_TYPE, 2)
					end

					slot0.evt_icon_sp:setVisible(true)

					if slot0.evt_cfg.reversal == 1 then
						slot0.evt_icon_sp:setScaleX(-1)
					else
						slot0.evt_icon_sp:setScaleX(1)
					end

					slot0.evt_sp_load = loadSpriteTextureFromCDN(slot0.evt_icon_sp, slot7, ResourcesType.single, slot0.evt_sp_load, nil, function ()
						if uv0 and uv0.data and uv0.data.is_black then
							setChildDarkShader(true, uv0.evt_icon_sp)
						else
							setChildDarkShader(false, uv0.evt_icon_sp)
						end
					end)
				elseif slot5 == 2 then
					slot0.evt_effect = createEffectSpine(slot6, cc.p(slot0.size.width * 0.5, slot0.size.height * 0.5), cc.p(0.5, 0.5), true, PlayerAction.action)

					slot0.layer_bg:addChild(slot0.evt_effect, 2)

					if slot0.data.is_black then
						setChildDarkShader(true, slot0.evt_effect)
					end

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
						slot0.evt_effect:setPosition(slot0.size.width * 0.5 + slot7, slot0.size.height * 0.5 + slot8)
					end
				end
			elseif slot5 == 1 and slot0.evt_icon_sp then
				slot0.evt_icon_sp:setVisible(true)

				if slot0 and slot0.data and slot0.data.is_black then
					setChildDarkShader(true, slot0.evt_icon_sp)
				else
					setChildDarkShader(false, slot0.evt_icon_sp)
				end
			elseif slot5 == 2 and slot0.evt_effect then
				slot0.evt_effect:setVisible(true)

				if slot0.data.is_black then
					setChildDarkShader(true, slot0.evt_effect)
				else
					setChildDarkShader(false, slot0.evt_effect)
				end
			end
		else
			if slot0.evt_icon_sp then
				slot0.evt_icon_sp:setVisible(false)
			end

			slot0:removeEvtEffect()

			slot0.cur_res_name = nil
			slot0.evt_cfg = nil
		end

		if not slot0.data.is_black and uv0:getRolePos() < slot0.data.line then
			slot0:showSelectEvtInfo()
		else
			if slot0.name_txt then
				slot0.name_txt:setVisible(false)
			end

			if slot0.fight_bg then
				slot0.fight_bg:setVisible(false)
			end

			if slot0.evt_icon_bg then
				doStopAllActions(slot0.evt_icon_bg)
				slot0.evt_icon_bg:setVisible(false)
			end

			if slot0.select_arrow_img then
				doStopAllActions(slot0.select_arrow_img)
				slot0.select_arrow_img:setVisible(false)
			end
		end
	else
		slot0:hideEvtInfo()
	end
end

function PlanesafkEvtItem.showSelectEvtInfo(slot0)
	if slot0.evt_icon_bg == nil then
		slot0.evt_icon_bg = createSprite(nil, slot0.size.width * 0.5, slot0.size.height * 0.5, slot0.layer_bg, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST, 1)
	else
		slot0.evt_icon_bg:setVisible(true)
	end

	doStopAllActions(slot0.evt_icon_bg)

	slot2, slot3 = slot0:getSelectEvtIconBgPathByResId(uv0:getMapResID())

	loadSpriteTexture(slot0.evt_icon_bg, slot2, LOADTEXT_TYPE_PLIST)
	slot0.evt_icon_bg:setPositionY(slot3)
	slot0.evt_icon_bg:setOpacity(100)
	slot0.evt_icon_bg:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.FadeIn:create(1), cc.FadeTo:create(1.2, 100))))

	if slot0.select_arrow_img == nil then
		slot0.select_arrow_img = createSprite(PathTool.getResFrame("planes_map", "planesafk_01"), slot0.size.width * 0.5, slot0.size.height * 0.5 + 130, slot0.layer_bg, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST, 3)
	else
		slot0.select_arrow_img:setVisible(true)
	end

	doStopAllActions(slot0.select_arrow_img)
	slot0.select_arrow_img:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.MoveTo:create(1, cc.p(slot0.size.width * 0.5, slot0.size.height * 0.5 + 180)), cc.MoveTo:create(0.8, cc.p(slot0.size.width * 0.5, slot0.size.height * 0.5 + 130)))))
	slot0:updateNameTxt(offset_x, offset_y)
end

function PlanesafkEvtItem.hideEvtInfo(slot0)
	if slot0.evt_icon_sp then
		slot0.evt_icon_sp:setVisible(false)
	end

	if slot0.name_txt then
		slot0.name_txt:setVisible(false)
	end

	if slot0.fight_bg then
		slot0.fight_bg:setVisible(false)
	end

	if slot0.evt_icon_bg then
		doStopAllActions(slot0.evt_icon_bg)
		slot0.evt_icon_bg:setVisible(false)
	end

	if slot0.select_arrow_img then
		doStopAllActions(slot0.select_arrow_img)
		slot0.select_arrow_img:setVisible(false)
	end

	slot0:removeEvtEffect()

	slot0.cur_res_name = nil
	slot0.evt_cfg = nil
end

function PlanesafkEvtItem.updateNameTxt(slot0, slot1, slot2)
	if not slot0.evt_cfg then
		return
	end

	if slot0.evt_cfg.type == PlanesafkConst.Evt_Type.Monster or slot0.evt_cfg.type == PlanesafkConst.Evt_Type.Guard then
		if slot0.fight_bg == nil then
			slot0.fight_bg = ccui.Widget:create()

			slot0.layer_bg:addChild(slot0.fight_bg, 4)
			createSprite(PathTool.getResFrame("common", "common_2015"), slot0.size.width * 0.5, 46, slot0.fight_bg, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST):setScale(10, 0.7)
			createSprite(PathTool.getResFrame("common", "common_2016"), 30, 45, slot0.fight_bg, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST):setScale(0.7)

			slot0.fight_txt = createLabel(22, cc.c4b(255, 245, 138, 255), nil, 100, 46, "", slot0.fight_bg, 2, cc.p(0.5, 0.5))
		else
			slot0.fight_bg:setVisible(true)
		end

		if slot0.data and slot0.data.combat_power then
			if slot0.data.combat_power == 0 then
				slot0.fight_txt:setString("???")
			else
				slot0.fight_txt:setString(slot0.data.combat_power)
			end
		end

		if slot0.name_txt then
			slot0.name_txt:setVisible(false)
		end
	else
		if not slot0.name_txt then
			slot0.name_txt = createLabel(20, cc.c4b(255, 255, 255, 255), cc.c4b(2, 0, 25, 255), 0, 10, "", slot0.layer_bg, 2, cc.p(0.5, 1))
		else
			slot0.name_txt:setVisible(true)
		end

		slot0.name_txt:setLocalZOrder(99)
		slot0.name_txt:setString(slot0.evt_cfg.name)
		slot0.name_txt:setPosition(slot0.size.width * 0.5, 50)
		slot0.name_txt:setVisible(true)

		if slot0.fight_bg then
			slot0.fight_bg:setVisible(false)
		end
	end
end

function PlanesafkEvtItem.setVisible(slot0, slot1)
	if not tolua.isnull(slot0.root_wnd) then
		slot0.root_wnd:setVisible(slot1)
	end
end

function PlanesafkEvtItem.setPosition(slot0, slot1, slot2)
	if not tolua.isnull(slot0.root_wnd) then
		slot0.root_wnd:setPosition(slot1, slot2 - PlanesConst.Grid_Height * 0.5)
	end
end

function PlanesafkEvtItem.setLocalZOrder(slot0, slot1)
	if not tolua.isnull(slot0.root_wnd) then
		slot0.root_wnd:setLocalZOrder(slot1)
	end
end

function PlanesafkEvtItem.getEvtPathByResId(slot0, slot1)
	if slot1 and slot1 ~= "" then
		return uv0("resource/planes/evt_icon/%s.png", slot1)
	end
end

function PlanesafkEvtItem.getSelectEvtIconBgPathByResId(slot0, slot1)
	if slot1 == "11" then
		return PathTool.getResFrame("planes_map", "planesafk_04"), 71
	elseif slot1 == "12" then
		return PathTool.getResFrame("planes_map", "planesafk_02"), 64
	else
		return PathTool.getResFrame("planes_map", "planesafk_05"), 64
	end
end

function PlanesafkEvtItem.getRemoveEvtIconBgEffectId(slot0, slot1)
	if slot1 == "11" then
		return "E27601"
	elseif slot1 == "12" then
		return "E27602"
	else
		return "E27603"
	end
end

function PlanesafkEvtItem.showEvtEnterAni(slot0, slot1)
	if not tolua.isnull(slot0.root_wnd) then
		slot2, slot3 = slot0.root_wnd:getPosition()

		slot0.root_wnd:runAction(cc.Sequence:create(cc.DelayTime:create(slot1 + 0.3), cc.CallFunc:create(function ()
			uv0.root_wnd:setOpacity(0)
			uv0.root_wnd:setVisible(true)
			uv0.root_wnd:setScale(0.1)
		end), cc.Spawn:create(cc.FadeIn:create(0.4), cc.ScaleTo:create(0.4, 1))))
	end
end

function PlanesafkEvtItem.showClickAni(slot0)
	slot0.root_wnd:runAction(cc.Sequence:create(cc.Spawn:create(cc.EaseBackOut:create(cc.MoveBy:create(0.1, cc.p(0, 20))), cc.ScaleTo:create(0.1, 1.1)), cc.Spawn:create(cc.EaseBackOut:create(cc.MoveBy:create(0.1, cc.p(0, -20))), cc.ScaleTo:create(0.1, 0.9)), cc.ScaleTo:create(0.05, 1)))
end

function PlanesafkEvtItem.removeEvtEffect(slot0)
	if slot0.evt_effect then
		slot0.evt_effect:clearTracks()
		slot0.evt_effect:removeFromParent()

		slot0.evt_effect = nil
	end
end

function PlanesafkEvtItem.__delete(slot0)
	if slot0.data ~= nil and slot0.update_self_event ~= nil then
		slot0.data:UnBind(slot0.update_self_event)

		slot0.update_self_event = nil
	end

	if slot0.evt_sp_load then
		slot0.evt_sp_load:DeleteMe()

		slot0.evt_sp_load = nil
	end

	if slot0.bg_item_load then
		slot0.bg_item_load:DeleteMe()

		slot0.bg_item_load = nil
	end

	slot0:removeRemoveEffect()
	slot0:removeEvtEffect()
	slot0:showRoleShowEffect(false)

	if slot0.root_wnd:getParent() then
		slot0.root_wnd:removeAllChildren()
		slot0.root_wnd:removeFromParent()
	end
end
