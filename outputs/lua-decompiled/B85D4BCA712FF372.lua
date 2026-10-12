slot1 = HomeworldController:getInstance():getModel()
slot2 = string.format
HomeworldHookTimeAward = HomeworldHookTimeAward or BaseClass()

function HomeworldHookTimeAward.__init(slot0, slot1)
	slot0.parent = slot1

	slot0:createRoorWnd()
	slot0:registerEvent()
	slot0:setData()
end

function HomeworldHookTimeAward.createRoorWnd(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("homeworld/homeworld_hook_time"))

	slot0.root_wnd:setPosition(cc.p(170, 1150))
	slot0.parent:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.progress_bg = slot0.container:getChildByName("progress_bg")
	slot0.progress = slot0.progress_bg:getChildByName("progress")

	slot0.progress:setPercent(0)

	slot0.progress_value = slot0.progress_bg:getChildByName("progress_value")

	slot0.progress_value:setString(0)

	slot0.pos_bird = slot0.container:getChildByName("pos_bird")
	slot0.btn_get_res = slot0.container:getChildByName("btn_get_res")

	slot0.btn_get_res:ignoreContentAdaptWithSize(true)
	slot0.btn_get_res:loadTexture(PathTool.getPlistImgForDownLoad("homeworld", "homeworld_big_bg_4"), LOADTEXT_TYPE)
	slot0:showBirdEffect(true)
	slot0:setRedStatus(uv0:getRedStatusById(HomeworldConst.Red_Index.Hook))
end

function HomeworldHookTimeAward.registerEvent(slot0)
	registerButtonEventListener(slot0.btn_get_res, function ()
		uv0:sender26016()
		uv1:showBirdEffect(true, PlayerAction.interaction)
	end, true)
	registerButtonEventListener(slot0.container, function ()
		uv0:sender26016()
		uv1:showBirdEffect(true, PlayerAction.interaction)
	end, false)
end

function HomeworldHookTimeAward.setData(slot0)
	slot2 = math.floor(uv0:getHomeAccHookTime() / 3600)

	if not Config.HomeData.data_const.homecoin_hoarding_limit then
		return
	end

	slot0.progress_value:setString(uv1(TI18N("已累计%d时"), slot2))
	slot0.progress:setPercent(slot2 / slot3.val * 100)
	slot0.btn_get_res:stopAllActions()

	if slot1 > 0 then
		slot0.btn_get_res:setPosition(cc.p(-22, 165))
		slot0.btn_get_res:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.MoveTo:create(1, cc.p(-22, 170)), cc.MoveTo:create(1, cc.p(-22, 160)))))
		slot0.btn_get_res:setVisible(true)
	else
		slot0.btn_get_res:setVisible(false)
	end
end

function HomeworldHookTimeAward.setVisible(slot0, slot1)
	if slot0.root_wnd then
		slot0.root_wnd:setVisible(slot1)
	end
end

function HomeworldHookTimeAward.setRedStatus(slot0, slot1)
end

function HomeworldHookTimeAward.showBirdEffect(slot0, slot1, slot2)
	if slot1 == true then
		slot3 = true

		if (slot2 or PlayerAction.idle) == PlayerAction.interaction then
			slot3 = false
		end

		if not tolua.isnull(slot0.pos_bird) and slot0.bird_effect == nil then
			slot0.bird_effect = createEffectSpine("H66001", cc.p(0, 0), cc.p(0.5, 0.5), true, PlayerAction.idle, handler(slot0, slot0._onActionEndCallback))

			slot0.pos_bird:addChild(slot0.bird_effect)
		elseif slot0.bird_effect then
			slot0.bird_effect:setToSetupPose()
			slot0.bird_effect:setAnimation(0, slot2, slot3)
		end

		slot0.cur_action = slot2
	elseif slot0.bird_effect then
		slot0.bird_effect:clearTracks()
		slot0.bird_effect:removeFromParent()

		slot0.bird_effect = nil
	end
end

function HomeworldHookTimeAward._onActionEndCallback(slot0)
	if slot0.cur_action == PlayerAction.interaction then
		slot0:showBirdEffect(true, PlayerAction.idle)
	end
end

function HomeworldHookTimeAward.__delete(slot0)
	slot0:showBirdEffect(false)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
