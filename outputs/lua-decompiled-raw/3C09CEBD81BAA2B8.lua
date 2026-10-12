ShareTips = ShareTips or BaseClass()

function ShareTips.__init(slot0, slot1, slot2)
	slot0.delay = slot1 or 3
	slot0.type = slot2 or 1
	slot0.btn_list = {}

	slot0:createRootWnd()
end

function ShareTips.createRootWnd(slot0)
	slot0:LoadLayoutFinish()
	slot0:registerCallBack()
end

function ShareTips.closeCallBack(slot0)
end

function ShareTips.LoadLayoutFinish(slot0)
	slot0.screen_bg = ccui.Layout:create()

	slot0.screen_bg:setAnchorPoint(cc.p(0, 0))
	slot0.screen_bg:setContentSize(cc.size(SCREEN_WIDTH, display.height))
	slot0.screen_bg:setTouchEnabled(true)
	slot0.screen_bg:setSwallowTouches(false)

	slot0.root_wnd = ccui.Widget:create()

	slot0.root_wnd:setTouchEnabled(true)
	slot0.root_wnd:setAnchorPoint(cc.p(0, 0))
	slot0.root_wnd:setPosition(cc.p(0, 0))
	slot0.screen_bg:addChild(slot0.root_wnd)

	slot0.background = ccui.ImageView:create(PathTool.getResFrame("common", "common_1056"), LOADTEXT_TYPE_PLIST)

	slot0.background:setScale9Enabled(true)
	slot0.background:setCapInsets(cc.rect(59, 39, 5, 5))
	slot0.background:setAnchorPoint(cc.p(0, 0))
	slot0.root_wnd:addChild(slot0.background)
end

function ShareTips.registerCallBack(slot0)
	slot0.screen_bg:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.began then
			TipsManager:getInstance():hideTips()
		end
	end)
end

function ShareTips.setPosition(slot0, slot1, slot2)
	slot0.root_wnd:setAnchorPoint(cc.p(0, 1))
	slot0.root_wnd:setPosition(cc.p(slot1, slot2))
end

function ShareTips.addToParent(slot0, slot1, slot2)
	slot0.parent_wnd = slot1

	if not tolua.isnull(slot0.root_wnd) then
		slot0.root_wnd:removeFromParent()
	end

	slot0.parent_wnd:addChild(slot0.root_wnd, slot2)
end

function ShareTips.setPos(slot0, slot1, slot2)
	slot0.root_wnd:setPosition(cc.p(slot1, slot2))
end

function ShareTips.getContentSize(slot0)
	return slot0.root_wnd:getContentSize()
end

function ShareTips.getScreenBg(slot0)
	return slot0.screen_bg
end

function ShareTips.showTips(slot0, slot1, slot2)
	slot3 = slot2

	if slot1 then
		slot0.root_wnd:setContentSize(slot3)

		slot7 = slot3

		slot0.background:setContentSize(slot7)

		for slot7, slot8 in ipairs(slot1) do
			if not slot0.btn_list[slot7] then
				slot9 = createButton(slot0.background, slot8.label, 0, 0, cc.size(slot8.width, slot8.height), slot8.select_path, 22)
				slot9.data = slot8

				slot9:addTouchEventListener(function (slot0, slot1)
					if slot1 == ccui.TouchEventType.ended then
						if uv0 == 1 then
							BattleController:getInstance():on20034(uv1.replay_id, ChatConst.Channel.World, uv1.name, BattleConst.ShareType.SharePlunder)
						elseif uv0 == 2 then
							if RoleController:getInstance():getRoleVo() and slot2.gid ~= 0 and slot2.gsrv_id ~= "" then
								BattleController:getInstance():on20034(uv1.replay_id, ChatConst.Channel.Gang, uv1.name, BattleConst.ShareType.SharePlunder)
							else
								message(TI18N("暂无公会"))
							end
						end

						TipsManager:getInstance():hideTips()
					end
				end)
				slot9:setPosition(slot0.background:getContentSize().width / 2, slot0.background:getContentSize().height - slot8.height / 2 - 20 - (slot7 - 1) * (slot8.height + 15))

				slot0.btn_list[slot7] = slot9
			end
		end
	end
end

function ShareTips.setAnchorPoint(slot0, slot1)
	slot0.screen_bg:setAnchorPoint(slot1)
end

function ShareTips.open(slot0)
	ViewManager:getInstance():getLayerByTag(ViewMgrTag.MSG_TAG):addChild(slot0.screen_bg)
	doStopAllActions(slot0.screen_bg)
end

function ShareTips.close(slot0)
	if slot0.screen_bg then
		doStopAllActions(slot0.screen_bg)
		slot0.screen_bg:removeFromParent()

		slot0.screen_bg = nil
	end
end
