slot1 = PlanesController:getInstance():getModel()
slot2 = string.format
PlanesMainItem = class("PlanesMainItem", function ()
	return ccui.Widget:create()
end)

function PlanesMainItem.ctor(slot0)
	slot0:createRootWnd()
	slot0:registerEvent()
end

function PlanesMainItem.createRootWnd(slot0)
	slot0.size = cc.size(223, 284)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("planes/planes_main_item"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("container")

	slot2:setSwallowTouches(false)

	slot0.con_size = slot2:getContentSize()
	slot0.container = slot2
	slot0.icon_sp = slot2:getChildByName("icon_sp")
	slot0.image_bg = slot2:getChildByName("image_bg")
	slot0.pos_node = slot2:getChildByName("pos_node")
	slot0.progress_bg = slot2:getChildByName("progress_bg")
	slot0.progress = slot0.progress_bg:getChildByName("progress")

	slot0.progress:setScale9Enabled(true)
	slot0.progress:setPercent(0)

	slot0.progress_value = slot0.progress_bg:getChildByName("progress_value")

	slot0.progress_value:setString(0)

	slot0.name_txt = slot2:getChildByName("name_txt")
	slot0.camp_sp = slot2:getChildByName("camp_sp")
	slot0.tips_txt = slot2:getChildByName("tips_txt")

	slot0.tips_txt:setVisible(false)

	slot0.award_txt = slot2:getChildByName("award_txt")

	slot0.award_txt:setVisible(false)
end

function PlanesMainItem.registerEvent(slot0)
	registerButtonEventListener(slot0.container, handler(slot0, slot0.onClickItem), true)

	if not slot0.show_open_effect_event then
		slot0.show_open_effect_event = GlobalEvent:getInstance():Bind(PlanesEvent.Dun_Open_Effect_Event, function (slot0)
			if slot0 and uv0.data and slot0.id == uv0.data.id then
				uv0.open_param = slot0

				uv0.tips_txt:setVisible(false)
				uv0.award_txt:setVisible(false)
				uv0:showDunOpenEffect(true)
			end
		end)
	end
end

function PlanesMainItem.onClickItem(slot0)
	if not slot0.data then
		return
	end

	if slot0.data.dun_status == PlanesConst.Dun_Status.Chose or slot0.data.dun_status == PlanesConst.Dun_Status.Select then
		uv0:sender23123(slot0.data.id)
		uv0:openPlanesDunInfoWindow(true, slot0.data.id)
	end
end

function PlanesMainItem.setData(slot0, slot1, slot2)
	if not slot1 or not slot2 then
		return
	end

	slot0.index = slot2

	slot0.container:setName("guide_planes_item_" .. slot1.id)

	if slot0.data and slot0.data.dun_status == PlanesConst.Dun_Status.Chose and slot1.dun_status == PlanesConst.Dun_Status.Select then
		slot0.data = slot1

		return
	end

	slot0.data = slot1

	slot0.name_txt:setString(slot1.name)
	slot0:updateInfo()
end

function PlanesMainItem.updateInfo(slot0)
	if not slot0.data then
		return
	end

	if not Config.SecretDunData.data_customs[slot0.data.id] then
		return
	end

	loadSpriteTexture(slot0.camp_sp, slot0:getCampResPathById(slot1.camp), LOADTEXT_TYPE_PLIST)
	slot0.tips_txt:setVisible(false)
	slot0.award_txt:setVisible(false)
	slot0.progress_bg:setVisible(false)

	if slot0.lock_tips_txt then
		slot0.lock_tips_txt:setVisible(false)
	end

	slot0:handleEffect(false)

	slot3 = PathTool.getResFrame("planes", "planes_main_1002", false, "planes_main")

	if slot0.data.dun_status == PlanesConst.Dun_Status.Chose then
		slot0.tips_txt:setString(TI18N("点击开启副本"))
		slot0.tips_txt:setVisible(true)
	elseif slot0.data.dun_status == PlanesConst.Dun_Status.Select then
		slot0.progress_bg:setVisible(true)

		slot4, slot5 = uv0:getCurDunProgressVal()

		if math.floor(slot4 / slot5 * 100) > 100 then
			slot6 = 100
		end

		slot0.progress:setPercent(slot6)
		slot0.progress_value:setString(slot6 .. "%")
		slot0:handleEffect(true, 1704)
	elseif slot0.data.dun_status == PlanesConst.Dun_Status.Close then
		slot0.tips_txt:setString(TI18N("已选择其他副本"))
		slot0.tips_txt:setVisible(true)
	elseif slot0.data.dun_status == PlanesConst.Dun_Status.Lock then
		slot3 = PathTool.getResFrame("planes", "planes_main_1003", false, "planes_main")

		slot0.tips_txt:setVisible(false)

		if not slot0.lock_tips_txt then
			slot0.lock_tips_txt = createRichLabel(20, 1, cc.p(0.5, 0.5), cc.p(slot0.con_size.width * 0.5, 95))

			slot0.lock_tips_txt:setString(TI18N("<div href=xxx fontcolor=#ff5d5d outline=2,#490912>尚未开启</div>"))
			slot0.container:addChild(slot0.lock_tips_txt)
			slot0.lock_tips_txt:addTouchLinkListener(function (slot0, slot1, slot2, slot3)
				if uv0.callback then
					uv0.callback(slot3, uv0.index, uv0.data.id)
				end
			end, {
				"click",
				"href"
			})
		end

		slot0.lock_tips_txt:setVisible(true)
	end

	if not slot0.cur_bg_res or slot0.cur_bg_res ~= slot3 then
		slot0.cur_bg_res = slot3

		slot0.image_bg:loadTexture(slot3, LOADTEXT_TYPE_PLIST)
	end

	if slot0.data.dun_res_id then
		slot0.icon_sp_load = loadSpriteTextureFromCDN(slot0.icon_sp, uv1("resource/planes/dun_img/dun_img_%s.png", slot0.data.dun_res_id), ResourcesType.single, slot0.icon_sp_load, nil, function ()
			if uv0.icon_sp and not tolua.isnull(uv0.icon_sp) then
				if uv0.data and uv0.data.dun_status == PlanesConst.Dun_Status.Close then
					setChildUnEnabled(true, uv0.icon_sp)
				else
					setChildUnEnabled(false, uv0.icon_sp)
				end
			end
		end)
	end

	slot0:updateRedStatus()
end

function PlanesMainItem.updateRedStatus(slot0)
	if not slot0.data then
		return
	end

	if (slot0.data.dun_status == PlanesConst.Dun_Status.Chose or slot0.data.dun_status == PlanesConst.Dun_Status.Select) and uv0:checkIsCanGetAwardByDunId(slot0.data.id) then
		addRedPointToNodeByStatus(slot0.container, true, -23, -228)
	else
		addRedPointToNodeByStatus(slot0.container, false)
	end
end

function PlanesMainItem.handleEffect(slot0, slot1, slot2)
	if slot1 == true then
		if not tolua.isnull(slot0.pos_node) and slot0.play_effect == nil then
			slot0.play_effect = createEffectSpine(Config.EffectData.data_effect_info[slot2], cc.p(0, 0), cc.p(0.5, 0.5), true, PlayerAction.action)

			slot0.pos_node:addChild(slot0.play_effect)
		end
	elseif slot0.play_effect then
		slot0.play_effect:clearTracks()
		slot0.play_effect:removeFromParent()

		slot0.play_effect = nil
	end
end

function PlanesMainItem.showDunOpenEffect(slot0, slot1)
	if slot1 == true then
		if slot0.lock_callback then
			slot0.lock_callback(true)
		end

		if not tolua.isnull(slot0.container) and slot0.open_effect == nil then
			slot2, slot3 = slot0.pos_node:getPosition()
			slot0.open_effect = createEffectSpine(Config.EffectData.data_effect_info[1703], cc.p(slot2, slot3), cc.p(0.5, 0.5), false, PlayerAction.action, handler(slot0, slot0.onOpenEffectEnd))

			slot0.container:addChild(slot0.open_effect)
		elseif slot0.open_effect then
			slot0.open_effect:setToSetupPose()
			slot0.open_effect:setAnimation(0, PlayerAction.action, false)
		end
	elseif slot0.open_effect then
		slot0.open_effect:clearTracks()
		slot0.open_effect:removeFromParent()

		slot0.open_effect = nil
	end
end

function PlanesMainItem.onOpenEffectEnd(slot0)
	if slot0.open_param then
		slot0:updateInfo()
		delayOnce(function ()
			if not uv0 then
				return
			end

			if not uv0.open_param then
				return
			end

			MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.PlanesWar, {
				dun_id = uv0.open_param.id,
				floor = uv0.open_param.floor
			})

			uv0.open_param = nil

			if uv0.lock_callback then
				uv0.lock_callback(false)
			end
		end, 0.3)
	else
		slot0:updateInfo()
	end
end

function PlanesMainItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function PlanesMainItem.addLockScreenCallBack(slot0, slot1)
	slot0.lock_callback = slot1
end

function PlanesMainItem.getCampResPathById(slot0, slot1)
	if slot1 == HeroConst.CampType.eWater then
		return PathTool.getResFrame("planes", "planes_main_1007", false, "planes_main")
	elseif slot1 == HeroConst.CampType.eFire then
		return PathTool.getResFrame("planes", "planes_main_1008", false, "planes_main")
	elseif slot1 == HeroConst.CampType.eWind then
		return PathTool.getResFrame("planes", "planes_main_1009", false, "planes_main")
	elseif slot1 == HeroConst.CampType.eLight then
		return PathTool.getResFrame("planes", "planes_main_1010", false, "planes_main")
	elseif slot1 == HeroConst.CampType.eDark then
		return PathTool.getResFrame("planes", "planes_main_1011", false, "planes_main")
	else
		return PathTool.getResFrame("planes", "planes_main_1007", false, "planes_main")
	end
end

function PlanesMainItem.suspendAllActions(slot0)
end

function PlanesMainItem.DeleteMe(slot0)
	if slot0.show_open_effect_event then
		GlobalEvent:getInstance():UnBind(slot0.show_open_effect_event)

		slot0.show_open_effect_event = nil
	end

	if slot0.icon_sp_load then
		slot0.icon_sp_load:DeleteMe()

		slot0.icon_sp_load = nil
	end

	slot0:showDunOpenEffect(false)
	slot0:handleEffect(false)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
