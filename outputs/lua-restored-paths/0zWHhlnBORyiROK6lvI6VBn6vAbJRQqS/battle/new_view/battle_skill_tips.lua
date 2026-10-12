BattleSkillTips = BattleSkillTips or BaseClass()

function BattleSkillTips.__init(slot0, slot1, slot2, slot3)
	if slot2 ~= nil then
		slot0.parent = slot2
	end

	slot0.offset_y = slot3 or 0
	slot0.delay = slot1 or 3
	slot0.WIDTH = 370
	slot0.HEIGHT = 190

	slot0:createRootWnd()
end

function BattleSkillTips.createRootWnd(slot0)
	slot0:LoadLayoutFinish()
	slot0:registerCallBack()
end

function BattleSkillTips.LoadLayoutFinish(slot0)
	slot0.screen_bg = ccui.Layout:create()

	slot0.screen_bg:setAnchorPoint(cc.p(0, 0))
	slot0.screen_bg:setContentSize(cc.size(SCREEN_WIDTH, SCREEN_HEIGHT))
	slot0.screen_bg:setTouchEnabled(true)
	slot0.screen_bg:setSwallowTouches(false)

	slot0.root_wnd = ccui.Widget:create()

	slot0.root_wnd:setTouchEnabled(true)
	slot0.root_wnd:setAnchorPoint(cc.p(0, 0))
	slot0.root_wnd:setPosition(cc.p(0, 0))
	slot0.screen_bg:addChild(slot0.root_wnd)

	slot0.info_layer = ccui.Layout:create()

	slot0.info_layer:setCascadeOpacityEnabled(true)
	slot0.info_layer:setOpacity(0)
	slot0.info_layer:setScale(0)
	slot0.screen_bg:addChild(slot0.info_layer)
	slot0.info_layer:runAction(cc.Spawn:create(cc.FadeIn:create(0.2), cc.ScaleTo:create(0.2, 1)))
end

function BattleSkillTips.setSkillInfo(slot0, slot1, slot2)
	slot0.offset_y = slot2 or 0

	slot0.info_layer:setPosition(SCREEN_WIDTH - slot0.WIDTH / 2, slot0.parent:getContentSize().height)
	slot0.info_layer:setVisible(true)
	slot0.info_layer:setContentSize(cc.size(200, slot0.HEIGHT))

	slot4 = ccui.ImageView:create(PathTool.getResFrame("common", "common_90005"), LOADTEXT_TYPE_PLIST)

	slot4:setAnchorPoint(0.5, 1)
	slot4:setScale9Enabled(true)
	slot4:setCapInsets(cc.rect(24, 29, 27, 18))
	slot0.info_layer:addChild(slot4)

	slot5 = ccui.ImageView:create(PathTool.getResFrame("common", "common_1016"), LOADTEXT_TYPE_PLIST)

	slot5:setScale9Enabled(true)
	slot5:setAnchorPoint(0.5, 0)
	slot4:addChild(slot5)

	slot6 = createRichLabel(22, 43, cc.p(0.5, 1), nil, 5, 0, slot0.WIDTH - 20)
	slot7 = createRichLabel(20, 44, cc.p(0, 0), nil, 5, 0, slot0.WIDTH - 20)
	slot8 = createRichLabel(20, 4, cc.p(0.5, 0), nil, 5, 0, slot0.WIDTH - 45)
	slot9 = Config.SkillData.data_get_skill(slot1)

	slot6:setString(analyzeDesc(string.format("<div fontcolor=#0x14b4f0 fontsize=22>%s\n</div>", slot9.name), 30, nil, 30))
	slot7:setString(analyzeDesc(string.format("<div>%s%s：%s\n</div>", TI18N("冷却"), TI18N("回合"), slot9.cd), 30, nil, 30))
	slot8:setString(analyzeDesc(string.format("<div>%s</div>", slot9.des), 30, nil, 30))

	slot13 = slot6:getSize()
	slot14 = slot8:getSize()

	slot4:setPosition(0, slot0.HEIGHT / 2)
	slot4:addChild(slot6)
	slot4:addChild(slot7)
	slot4:addChild(slot8)
	slot5:setContentSize(cc.size(350, 1))

	slot16 = slot13.height + slot14.height + 60 + slot7:getSize().height + 1

	slot6:setPosition(slot0.WIDTH / 2, slot16 - 8)
	slot8:setPosition(slot0.WIDTH / 2, slot16 - slot14.height - slot13.height - 20)
	slot5:setPosition(slot0.WIDTH / 2, slot16 - slot14.height - slot13.height - 40)
	slot7:setPosition(25, 10)
	slot4:setContentSize(slot0.WIDTH, slot16)
	slot0.info_layer:setContentSize(slot0.WIDTH, slot13.height)
	slot0.info_layer:setPosition(SCREEN_WIDTH - slot0.WIDTH * 1.8, slot16 + slot0.offset_y)
end

function BattleSkillTips.registerCallBack(slot0)
	slot0.screen_bg:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.began then
			TipsManager:getInstance():hideTips()
		end
	end)
end

function BattleSkillTips.setPosition(slot0, slot1, slot2)
	slot0.root_wnd:setAnchorPoint(cc.p(0, 1))
	slot0.root_wnd:setPosition(cc.p(slot1, slot2))
end

function BattleSkillTips.setPos(slot0, slot1, slot2)
	slot0.root_wnd:setPosition(cc.p(slot1, slot2))
end

function BattleSkillTips.getContentSize(slot0)
	return slot0.root_wnd:getContentSize()
end

function BattleSkillTips.getScreenBg(slot0)
	return slot0.screen_bg
end

function BattleSkillTips.isOpen(slot0)
	return slot0.is_close
end

function BattleSkillTips.open(slot0)
	ViewManager:getInstance():getLayerByTag(ViewMgrTag.MSG_TAG):addChild(slot0.screen_bg)
	doStopAllActions(slot0.screen_bg)
	delayRun(slot0.screen_bg, slot0.delay, function ()
		TipsManager:getInstance():hideTips()
	end)
end

function BattleSkillTips.close(slot0)
	slot0.info_layer:runAction(cc.Sequence:create(cc.FadeOut:create(0.2), cc.CallFunc:create(function ()
		doStopAllActions(uv0.screen_bg)
		uv0.screen_bg:removeFromParent()

		uv0.is_close = true
	end)))
end
