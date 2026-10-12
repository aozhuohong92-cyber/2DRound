HorcruxItem = class("HorcruxItem", function ()
	return ccui.Layout:create()
end)
HorcruxItem.Width = 119
HorcruxItem.Height = 119
slot1 = HeroController:getInstance():getModel()

function HorcruxItem.ctor(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot0.click = slot1
	slot0.scale = slot2 or 1
	slot0.show_tips = slot3
	slot0.size = cc.size(HorcruxItem.Width, HorcruxItem.Height)

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)

	if slot0.scale ~= 1 then
		slot0:setScale(slot0.scale)
	end

	slot0:configUI()

	if slot5 == nil then
		slot5 = slot0.click
	end

	slot0.effect = slot5

	if slot0.click == true then
		slot0:setTouchEnabled(true)
		slot0:registerEvent()
		slot0:setSwallowTouches(slot4)
	end

	slot0.show_type = slot6
end

function HorcruxItem.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("hero/horcrux_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.background = slot0.main_container:getChildByName("background")
	slot0.item_icon = slot0.main_container:getChildByName("icon")
	slot0.num_label = slot0.main_container:getChildByName("num")

	slot0.num_label:setString("")

	slot0.num_bg = slot0.main_container:getChildByName("num_bg")
	slot3 = Config.EffectData.data_effect_info[Config.HorcruxData.data_constant.item_effect_id and slot1.val or 156]

	if slot0.effect_node then
		slot0.effect_node:clearTracks()
		slot0.effect_node:removeFromParent()

		slot0.effect_node = nil
	end

	slot0.effect_node = createEffectSpine(slot3, cc.p(slot0:getContentSize().width / 2, slot0:getContentSize().height / 2), cc.p(0.5, 0.5), true, PlayerAction.action_1)

	slot0:addChild(slot0.effect_node, 10)
end

function HorcruxItem.getSize(slot0)
	return slot0.size
end

function HorcruxItem.getData(slot0)
	return slot0.horcrux_data
end

function HorcruxItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function HorcruxItem.registerEvent(slot0)
	if slot0.click == true then
		slot0:addTouchEventListener(function (slot0, slot1)
			if uv0.effect == true then
				customClickAction(uv0, slot1, uv0.scale)
			end

			if uv0.clickScroll and slot1 == ccui.TouchEventType.began then
				uv0.touch_began = slot0:getTouchBeganPosition()
			end

			if slot1 == ccui.TouchEventType.ended then
				if uv0.clickScroll then
					slot3 = slot0:getTouchEndPosition()

					if uv0.touch_began and slot3 and (math.abs(slot3.x - slot2.x) > 20 or math.abs(slot3.y - slot2.y) > 20) then
						return
					end
				end

				playButtonSound2()

				if uv0.horcrux_data and uv0.show_tips then
					uv1:openHorcruxTipsPanel(true, uv0.horcrux_data)
				end

				if uv0.callback then
					uv0:callback()
				end
			end
		end)
	end
end

function HorcruxItem.setData(slot0, slot1)
	slot0.horcrux_data = slot1

	slot0:showRedPoint(false)

	if slot0.horcrux_data then
		if slot0.show_type ~= 5 and uv0:getIsHaveHorcrux(slot0.horcrux_data.bid) then
			if uv0:getHorcruxIsOpen(slot0.horcrux_data.bid, slot0.horcrux_data.star) then
				if uv0:checkHorcruxActivateOpen(slot0.horcrux_data.star) then
					if slot0.horcrux_data.horcrux_status then
						if slot0.horcrux_data.horcrux_status == 1 then
							slot0.show_type = 4
						elseif slot0.horcrux_data.horcrux_status == 0 then
							slot0.show_type = 3
						elseif slot0.horcrux_data.horcrux_status == 2 then
							slot0.show_type = 6
						end
					end
				elseif slot0.horcrux_data.horcrux_status == 2 then
					slot0.show_type = 6
				else
					slot0.show_type = 2
				end
			else
				slot0.show_type = 1
			end
		end

		slot0.effect_node:setVisible(false)

		if slot0.show_type == 1 then
			slot0:showExpectIcon(true)
			slot0:showLockIcon(false)
			slot0:showOpenIcon(false)
			slot0:showHorcruxIcon(false)
			slot0:showHorcruxLev(false)
		elseif slot0.show_type == 2 then
			slot0:showExpectIcon(false)
			slot0:showLockIcon(true)
			slot0:showOpenIcon(false)
			slot0:showHorcruxIcon(true)
			slot0:showHorcruxLev(false)
		elseif slot0.show_type == 3 then
			slot0:showExpectIcon(false)
			slot0:showLockIcon(false)
			slot0:showOpenIcon(true)
			slot0:showHorcruxIcon(true)
			slot0:showHorcruxLev(false)
			slot0.effect_node:setVisible(true)
		elseif slot0.show_type == 4 then
			slot0:showExpectIcon(false)
			slot0:showLockIcon(false)
			slot0:showOpenIcon(false)
			slot0:showHorcruxIcon(true)
			slot0:showHorcruxLev(true)
			slot0.effect_node:setVisible(true)
		elseif slot0.show_type == 5 then
			slot0:showExpectIcon(false)
			slot0:showLockIcon(false)
			slot0:showOpenIcon(false)
			slot0:showHorcruxIcon(true)
			slot0:showHorcruxLev(false)
		elseif slot0.show_type == 6 then
			slot0:showExpectIcon(false)
			slot0:showLockIcon(true)
			slot0:showOpenIcon(false)
			slot0:showHorcruxIcon(true)

			if slot0.horcrux_data.horcrux_lev > 0 then
				slot0:showHorcruxLev(true)
			else
				slot0:showHorcruxLev(false)
			end
		end
	end
end

function HorcruxItem.showHorcruxLev(slot0, slot1)
	if slot1 then
		slot0.num_bg:setVisible(true)
		slot0.num_label:setVisible(true)
		slot0.num_label:setString(slot0.horcrux_data.horcrux_lev)
	else
		slot0.num_bg:setVisible(false)
		slot0.num_label:setVisible(false)
	end
end

function HorcruxItem.showHorcruxIcon(slot0, slot1)
	if slot1 then
		slot0.item_icon:setVisible(true)

		slot2 = nil

		if uv0:getPartnerHorcruxConfig(slot0.horcrux_data.bid) then
			slot2 = PathTool.getHorcruxRes(slot3.res_id)
		end

		if slot2 then
			loadSpriteTexture(slot0.item_icon, slot2, LOADTEXT_TYPE)
		end
	else
		slot0.item_icon:setVisible(false)
	end
end

function HorcruxItem.showExpectIcon(slot0, slot1)
	if slot1 == false and not slot0.horcrux_expect then
		return
	end

	if not slot0.horcrux_expect then
		slot2 = slot0.main_container:getContentSize()
		slot0.horcrux_expect = ccui.Layout:create()

		slot0.horcrux_expect:setAnchorPoint(cc.p(0.5, 0.5))
		slot0.horcrux_expect:setContentSize(slot2)
		slot0.horcrux_expect:setPosition(slot2.width / 2, slot2.height / 2)
		slot0.horcrux_expect:setTouchEnabled(false)
		showLayoutRect(slot0.horcrux_expect, 150)
		createImage(slot0.horcrux_expect, PathTool.getResFrame("common", "common_1113"), slot2.width / 2, slot2.height / 2, cc.p(0.5, 0.5), true, 0, false)
		createLabel(22, cc.c3b(255, 248, 229), cc.c3b(56, 18, 0), slot2.width / 2, slot2.height / 2, TI18N("敬请期待"), slot0.horcrux_expect, 2, cc.p(0.5, 0.5))
		slot0.main_container:addChild(slot0.horcrux_expect, 1)
	end

	slot0.horcrux_expect:setVisible(slot1)
end

function HorcruxItem.showLockIcon(slot0, slot1, slot2)
	if slot1 == false and not slot0.horcrux_lock then
		return
	end

	if not slot0.horcrux_lock then
		slot3 = slot0.main_container:getContentSize()
		slot0.horcrux_lock = createImage(slot0.main_container, PathTool.getResFrame("common", "common_1109_1"), slot3.width / 2, slot3.height / 2, nil, true, 1, true)

		slot0.horcrux_lock:setContentSize(cc.size(slot3.width + 2, slot3.height + 2))

		slot0.lock_img = createImage(slot0.horcrux_lock, PathTool.getResFrame("common", "common_90009"), slot3.width / 2, slot3.height / 2 + 15, cc.p(0.5, 0.5), true, 0, false)

		if slot2 then
			createLabel(22, cc.c3b(255, 248, 229), cc.c3b(56, 18, 0), slot3.width / 2, slot3.height / 2 - 25, TI18N("12星解锁"), slot0.horcrux_lock, 2, cc.p(0.5, 0.5))
		else
			slot0.lock_img:setPositionY(slot3.height / 2)
		end
	end

	slot0.horcrux_lock:setVisible(slot1)
end

function HorcruxItem.showOpenIcon(slot0, slot1)
	if slot1 == false and not slot0.open_icon then
		return
	end

	if not slot0.open_icon then
		slot2 = slot0.main_container:getContentSize()
		slot0.open_icon = createImage(slot0.main_container, PathTool.getResFrame("common", "common_1112"), slot2.width / 2, slot2.height / 2, cc.p(0.5, 0.5), true, 0, false)
	end

	slot0.open_icon:setVisible(slot1)

	if slot1 then
		ActionHelp.breathingLampAction(slot0.open_icon, 1)
	end
end

function HorcruxItem.showRedPoint(slot0, slot1)
	if slot1 == false and not slot0.red_point then
		return
	end

	if not slot0.red_point then
		slot0.red_point = createImage(slot0, PathTool.getResFrame("common", "common_1014"), 120, 120, cc.p(0.5, 0.5), true, 10, false)
	end

	if slot0.show_type == 4 then
		slot0.red_point:setPosition(cc.p(124, 117))
	else
		slot0.red_point:setPosition(cc.p(107, 107))
	end

	slot0.red_point:setVisible(slot1)
end

function HorcruxItem.DeleteMe(slot0)
	if slot0.effect_node then
		slot0.effect_node:clearTracks()
		slot0.effect_node:removeFromParent()

		slot0.effect_node = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
