StoryTalk = StoryTalk or BaseClass(BaseView)
slot0 = StoryController:getInstance()
slot1 = slot0:getModel()
slot2 = slot0:getView()
slot3 = table.insert
slot4 = string.format

function StoryTalk.__init(slot0, slot1)
	slot0.is_skip = slot1
	slot0.win_type = WinType.Big
	slot0.is_full_screen = true
	slot0.view_tag = ViewMgrTag.MSG_TAG
	slot0.max_height = 0
	slot0.item_info_list = {}
	slot0.item_height = 162
	slot0.item_show_list = {}
	slot0.can_click = false
	slot0.layout_name = "drama/dramatalk_view"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("drama", "drama"),
			type = ResourcesType.plist
		}
	}
end

function StoryTalk.open_callback(slot0)
	slot1 = slot0.root_wnd:getChildByName("background")

	slot1:setScale(display.getMaxScale())
	slot1:setOpacity(100)

	slot0.background = slot1
	slot2 = slot0.root_wnd:getChildByName("container")

	slot2:setPositionY(display.getBottom(slot0.root_wnd))

	slot0.scroll_view = slot2:getChildByName("scroll_view")

	slot0.scroll_view:setScrollBarEnabled(false)

	slot0.scroll_size = slot0.scroll_view:getContentSize()
	slot0.item = slot0.root_wnd:getChildByName("item")

	slot0.item:setVisible(false)

	slot0.container = slot2
end

function StoryTalk.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0:playNextAcrt()
		end
	end)
	slot0.scroll_view:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0.touch_end = slot0:getTouchEndPosition()
			slot2 = true

			if uv0.touch_began ~= nil then
				slot2 = math.abs(uv0.touch_end.x - uv0.touch_began.x) <= 20 and math.abs(uv0.touch_end.y - uv0.touch_began.y) <= 20
			end

			if slot2 == true then
				uv0:playNextAcrt()
			end
		elseif slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()
		end
	end)
	slot0.container:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0:playNextAcrt()
		end
	end)
end

function StoryTalk.playNextAcrt(slot0)
	if slot0.can_click == true then
		GlobalEvent:getInstance():Fire(StoryEvent.PLAY_NEXT_ACT)
	end
end

function StoryTalk.openRootWnd(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0:setData(slot1, slot2, slot3, slot4, slot5)
end

function StoryTalk.setData(slot0, slot1, slot2, slot3, slot4, slot5)
	if not slot0.scroll_size then
		return
	end

	slot0.can_click = false

	delayRun(slot0.container, 0.5, function ()
		uv0.can_click = true
	end)
	uv0(slot0.item_info_list, 1, {
		type = slot1 or 1,
		bid = slot2,
		actiontype = slot3 or 1,
		name = slot4,
		msg = slot5
	})

	if slot0.topDataCache then
		slot0:createItem(slot0.topDataCache)
	end

	slot7 = #slot0.item_info_list
	slot0.max_height = slot7 * slot0.item_height + (slot7 - 1) * -18 + 40
	slot0.max_height = math.max(slot0.max_height, slot0.scroll_size.height)
	slot14 = slot0.scroll_size.width

	slot0.scroll_view:setInnerContainerSize(cc.size(slot14, slot0.max_height))

	slot9 = 0

	for slot13, slot14 in ipairs(slot0.item_show_list) do
		if not tolua.isnull(slot14.item) then
			slot14.item:setPositionY(slot0.max_height - 40 - (slot13 - 1) * (slot0.item_height + slot8))
			slot0:doRunAction(slot14.item, slot0.max_height - 40 - slot0.item_height - slot8 - (slot13 - 1) * (slot0.item_height + slot8), slot13)
		end
	end

	slot0:showRoleSpine(slot6.type, slot6.bid, slot6.actiontype)
	slot0:refreshTopItem(slot6)
end

function StoryTalk.doRunAction(slot0, slot1, slot2, slot3)
	if tolua.isnull(slot1) then
		return
	end

	slot5 = slot0.scroll_size.width * 0.5
	slot6 = cc.MoveTo:create(0.2, cc.p(slot5, slot2 - 20))

	if slot3 == 3 then
		slot1:runAction(cc.Sequence:create(cc.Spawn:create(cc.FadeOut:create(0.2), cc.MoveTo:create(0.3, cc.p(slot5, slot2))), cc.FadeIn:create(0.1)))
	else
		slot1:runAction(cc.Sequence:create(slot6, slot7))
	end
end

function StoryTalk.refreshTopItem(slot0, slot1)
	if tolua.isnull(slot0.item) then
		return
	end

	if not slot0.topItem then
		slot0.topItem = slot0.item:clone()

		slot0.topItem:setPosition(slot0.scroll_size.width * 0.5, slot0.max_height + 6)
		slot0.topItem:setVisible(true)

		slot2 = slot0.topItem:getChildByName("Image_4")
		slot5 = createImage(slot2, PathTool.getResFrame("drama", "drama_1002"), 10, slot2:getContentSize().height - 8, cc.p(0, 0.5), true):getContentSize()
		slot7 = createRichLabel(24, cc.c3b(31, 31, 31), cc.p(0, 1), cc.p(20, slot3.height - 50), 10, nil, 628)

		slot7:setString(WordCensor:getInstance():relapceFaceIconTag(slot1.msg or "")[2] or "")
		slot2:addChild(slot7)
		createImage(slot2, PathTool.getResFrame("drama", "drama_1004"), slot3.width - 52, 27, cc.p(0.5, 0.5), true):runAction(cc.RepeatForever:create(cc.Sequence:create(cc.FadeTo:create(1, 100), cc.FadeTo:create(1, 255))))
		slot0.scroll_view:addChild(slot0.topItem, 10)

		slot0.topItem.name_txt = createLabel(26, cc.c3b(255, 255, 255), nil, slot5.width / 2, slot5.height / 2, slot1.name or "", slot4, nil, cc.p(0.5, 0.5))
		slot0.topItem.msg_txt = slot7

		slot0.topItem:setOpacity(0)
		slot0.topItem:runAction(cc.Spawn:create(cc.FadeIn:create(0.3), cc.MoveTo:create(0.3, cc.p(slot0.scroll_size.width * 0.5, slot0.max_height - 40))))
	else
		slot0.topItem.name_txt:setString(slot1.name or "")
		slot0.topItem.msg_txt:setString(WordCensor:getInstance():relapceFaceIconTag(slot1.msg or "")[2] or "")
		slot0.topItem:setPosition(cc.p(slot0.scroll_size.width * 0.5, slot0.max_height + 6))
		slot0.topItem:setOpacity(0)
		slot0.topItem:runAction(cc.Spawn:create(cc.FadeIn:create(0.3), cc.MoveTo:create(0.3, cc.p(slot0.scroll_size.width * 0.5, slot0.max_height - 40))))
	end

	slot0.topDataCache = slot1
end

function StoryTalk.createItem(slot0, slot1)
	if tolua.isnull(slot0.item) then
		return
	end

	slot2 = slot0.item:clone()

	slot2:setPosition(slot0.scroll_size.width * 0.5, slot0.max_height - 40)
	slot2:setVisible(true)

	slot3 = slot2:getChildByName("Image_4")

	slot3:setContentSize(cc.size(646, 130))
	slot3:loadTexture(PathTool.getResFrame("drama", "drama_1003"), LOADTEXT_TYPE_PLIST)

	slot6 = createRichLabel(24, cc.c3b(255, 255, 255), cc.p(0, 1), cc.p(20, slot4.height - 50), 10, nil, 606)

	slot6:setString(WordCensor:getInstance():relapceFaceIconTag(slot1.msg or "")[2] or "")
	slot3:addChild(slot6)
	slot0.scroll_view:addChild(slot2)

	slot7 = {
		item = slot2,
		item_msg = slot6,
		name_txt = createLabel(24, cc.c3b(246, 184, 66), nil, 20, 100, slot1.name or "", slot3, nil, cc.p(0, 0.5))
	}

	uv0(slot0.item_show_list, 1, slot7)
	slot7.item:setOpacity(0)
	slot7.item:runAction(cc.FadeIn:create(0.3))
end

function StoryTalk.showRoleSpine(slot0, slot1, slot2, slot3)
	slot4 = slot0:getSpineActionName(slot3)

	if slot1 == 1 then
		if slot0.leftSpine and slot0.leftSpine.effid ~= slot2 then
			slot0.leftSpine:removeFromParent()

			slot0.leftSpine = nil
		end

		if slot0.leftSpine == nil then
			slot5 = slot0.container:getContentSize()
			slot0.leftSpine = createEffectSpine(PathTool.getEffectRes(slot2), cc.p(30, 80), cc.p(0.5, 0), true, slot4)
			slot0.leftSpine.effid = slot2

			slot0.leftSpine:setOpacity(0)
			slot0.container:getChildByName("pos_left"):addChild(slot0.leftSpine)
			slot0.leftSpine:runAction(cc.FadeIn:create(0.2))
		elseif not slot0.lastDirType or slot0.lastDirType ~= slot1 or slot0.lastActionType ~= slot3 then
			slot0.leftSpine:setOpacity(100)
			slot0.leftSpine:setAnimation(0, slot4, true)
			slot0.leftSpine:setToSetupPose()
			slot0.leftSpine:runAction(cc.FadeIn:create(0.2))
		end

		if (not slot0.lastDirType or slot0.lastDirType ~= slot1) and slot0.rightSpine then
			slot0.rightSpine:setAnimation(0, "action2", true)
			slot0.rightSpine:setToSetupPose()
		end
	elseif slot1 == 2 then
		if slot0.rightSpine and slot0.rightSpine.effid ~= slot2 then
			slot0.rightSpine:removeFromParent()

			slot0.rightSpine = nil
		end

		if slot0.rightSpine == nil then
			slot5 = slot0.container:getContentSize()
			slot0.rightSpine = createEffectSpine(PathTool.getEffectRes(slot2), cc.p(-30, -20), cc.p(0.5, 0), true, slot4)

			slot0.rightSpine:setOpacity(0)

			slot0.rightSpine.effid = slot2

			slot0.container:getChildByName("pos_right"):addChild(slot0.rightSpine)
			slot0.rightSpine:runAction(cc.FadeIn:create(0.2))
		elseif not slot0.lastDirType or slot0.lastDirType ~= slot1 or slot0.lastActionType ~= slot3 then
			slot0.rightSpine:setOpacity(100)
			slot0.rightSpine:setAnimation(0, slot4, true)
			slot0.rightSpine:setToSetupPose()
			slot0.rightSpine:runAction(cc.FadeIn:create(0.2))
		end

		if (not slot0.lastDirType or slot0.lastDirType ~= slot1) and slot0.leftSpine then
			slot0.leftSpine:setAnimation(0, "action2", true)
			slot0.leftSpine:setToSetupPose()
		end
	end

	slot0.lastDirType = slot1
	slot0.lastActionType = slot3
end

function StoryTalk.getSpineActionName(slot0, slot1)
	slot2 = "action1"

	if slot1 and type(slot1) == "number" then
		slot2 = "action" .. slot1
	end

	return slot2
end

function StoryTalk.close_callback(slot0)
	doStopAllActions(slot0.container)
	doStopAllActions(slot0.leftSpine)
	doStopAllActions(slot0.rightSpine)

	for slot4, slot5 in ipairs(slot0.item_show_list) do
		doStopAllActions(slot5.item)
	end

	if slot0.leftSpine then
		slot0.leftSpine:clearTracks()
		slot0.leftSpine:removeFromParent()

		slot0.leftSpine = nil
	end

	if slot0.rightSpine then
		slot0.rightSpine:clearTracks()
		slot0.rightSpine:removeFromParent()

		slot0.rightSpine = nil
	end

	slot0.item_show_list = nil

	uv0:hideTalk()
end
