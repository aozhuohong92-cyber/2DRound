RoleHonorItem = class("RoleHonorItem", function ()
	return ccui.Layout:create()
end)
RoleHonorItem.Width = 104
RoleHonorItem.Height = 120

function RoleHonorItem.ctor(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0.scale = slot1 or 1
	slot0.can_click = slot2 or false
	slot0.click_delay = slot0.click_delay
	slot0.last_click_time = 0
	slot0.size = cc.size(HeroExhibitionItem.Width, HeroExhibitionItem.Height)

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)

	if slot0.can_click then
		slot0:setTouchEnabled(true)
	else
		slot0:setTouchEnabled(false)
	end

	slot0:setCascadeOpacityEnabled(true)
	slot0:setScale(slot0.scale)

	slot0.icon = createSprite(nil, slot0.size.width / 2, slot0.size.height / 2, slot0, cc.p(0.5, 0.5), LOADTEXT_TYPE)

	slot0:registerEvent()
end

function RoleHonorItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function RoleHonorItem.setShowDefaultTips(slot0)
	slot0.is_show_default_tips = true

	if slot0.can_click == false then
		slot0.can_click = true

		slot0:registerEvent()
	end
end

function RoleHonorItem.registerEvent(slot0)
	if slot0.can_click == true then
		slot0:addTouchEventListener(function (slot0, slot1)
			customClickAction_2(uv0, slot1, uv0.scale)

			if slot1 == ccui.TouchEventType.ended and uv0.can_click == true and uv0:checkItemClickDelayTime() then
				playButtonSound2()

				if uv0.is_show_default_tips then
					if not uv0.config then
						TipsController:getInstance():openHonorIconTips(true, {
							config = uv0.config
						})
					end
				elseif uv0.callback then
					uv0.callback()
				end
			end
		end)
	end
end

function RoleHonorItem.checkItemClickDelayTime(slot0)
	if slot0.click_delay and slot0.click_delay > 0 then
		if math.abs(GameNet:getInstance():getTimeFloat() - slot0.last_click_time) < slot0.click_delay then
			return false
		else
			slot0.last_click_time = GameNet:getInstance():getTimeFloat()

			return true
		end
	else
		return true
	end
end

function RoleHonorItem.setData(slot0, slot1)
	if slot1 == nil then
		slot0.icon:setVisible(false)
	else
		slot0.icon:setVisible(true)
	end

	slot0.config = slot1.config

	if slot0.config == nil then
		slot0.config = Config.RoomFeatData.data_honor_icon_info[slot1.id]
	end

	if not slot0.config then
		return
	end

	slot0:setIcon(slot0.config.icon_res)
end

function RoleHonorItem.setShowEffect(slot0, slot1)
	if not slot0.config then
		return
	end

	if slot1 then
		if slot0.config.effect_res == nil or slot0.config.effect_res == "" then
			slot0:showEffect(false)
		else
			slot0:showEffect(true, slot0.config.effect_res)
		end
	else
		slot0:showEffect(false)
	end
end

function RoleHonorItem.setIcon(slot0, slot1)
	if slot1 == nil or slot1 == "" then
		return
	end

	slot2 = tostring(slot1)

	if slot0.record_icon_res == nil or slot0.record_icon_res ~= slot2 then
		slot0.record_icon_res = slot2

		loadSpriteTexture(slot0.icon, PathTool.getPlistImgForDownLoad("rolehonorwall/honorwarllicon", slot2, false), LOADTEXT_TYPE)
	end
end

function RoleHonorItem.setIconUnEnabled(slot0, slot1)
	if slot0.icon then
		setChildUnEnabled(slot1, slot0.icon)
	end
end

function RoleHonorItem.setShowLock(slot0, slot1)
	if slot1 then
		if slot0.lock_icon == nil then
			slot0.lock_icon = createImage(slot0, PathTool.getResFrame("common", "common_90009"), slot0.size.width / 2, 70, cc.p(0.5, 0.5), true, 0, false)
		else
			slot0.lock_icon:setVisible(true)
		end

		slot0:setIconUnEnabled(true)
	else
		slot0:setIconUnEnabled(false)

		if slot0.lock_icon then
			slot0.lock_icon:setVisible(false)
		end
	end
end

function RoleHonorItem.showEffect(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.play_effect == nil then
			slot0.play_effect = createEffectSpine(slot2, cc.p(slot0.size.width / 2, slot0.size.height / 2), cc.p(0.5, 0.5), true, PlayerAction.action)

			slot0:addChild(slot0.play_effect, 1)
		end
	elseif slot0.play_effect then
		slot0.play_effect:setVisible(false)
		slot0.play_effect:removeFromParent()

		slot0.play_effect = nil
	end
end

function RoleHonorItem.DeleteMe(slot0)
	slot0:showEffect(false)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
