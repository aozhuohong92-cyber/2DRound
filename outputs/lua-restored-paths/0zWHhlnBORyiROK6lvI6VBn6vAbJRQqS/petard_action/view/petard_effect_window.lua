slot1 = PetardActionController:getInstance():getModel()
PetardEffectWindow = class("PetardEffectWindow", function ()
	return ccui.Layout:create()
end)

function PetardEffectWindow.ctor(slot0)
	slot0:createRootWnd()
end

function PetardEffectWindow.createRootWnd(slot0)
	slot0.main_size = cc.size(SCREEN_WIDTH, display.height)

	slot0:setContentSize(slot0.main_size)
	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setPosition(SCREEN_WIDTH * 0.5, SCREEN_HEIGHT * 0.5)

	slot0.root_wnd = ccui.Layout:create()

	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.root_wnd:setContentSize(slot0.main_size)
	slot0.root_wnd:setPosition(slot0.main_size.width * 0.5, slot0.main_size.height * 0.5)
	slot0:addChild(slot0.root_wnd)
	ViewManager:getInstance():addToLayerByTag(slot0, ViewMgrTag.MSG_TAG)
end

function PetardEffectWindow.openView(slot0, slot1)
	slot0.use_item_num = slot1 or 1

	slot0:setData()
	delayRun(slot0.root_wnd, 1.2, function ()
		if Config.HolidayPetardData.data_const.meteor_bid then
			PetardActionController:getInstance():sender27001(slot0.val, uv0.use_item_num)
		end

		uv1:openPetardEffectWindow(false)
	end)
end

function PetardEffectWindow.setData(slot0)
	slot0:handleLeftEmptyEffect(true)
end

function PetardEffectWindow.handleLeftEmptyEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	elseif not tolua.isnull(slot0.root_wnd) and slot0.play_effect == nil then
		slot0.play_effect = createEffectSpine(Config.EffectData.data_effect_info[341], cc.p(slot0.main_size.width * 0.5, slot0.main_size.height * 0.5), cc.p(0.5, 0.5), false, PlayerAction.action)

		slot0.root_wnd:addChild(slot0.play_effect)
	end
end

function PetardEffectWindow.DeleteMe(slot0)
	slot0:handleLeftEmptyEffect(false)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
