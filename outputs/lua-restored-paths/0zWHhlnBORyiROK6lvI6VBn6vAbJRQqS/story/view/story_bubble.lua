StoryBubble = StoryBubble or BaseClass()

function StoryBubble.__init(slot0, slot1)
	slot0:config()
	slot0:initView()

	if slot1 ~= nil then
		slot0:setParent(slot1, 100)
	end
end

function StoryBubble.config(slot0)
end

function StoryBubble.initView(slot0)
	slot0.root_wnd = ccui.Layout:create()

	slot0.root_wnd:setAnchorPoint(cc.p(1, 0))
	slot0.root_wnd:setContentSize(cc.size(195, 63))

	slot0.bubble_bg = createImage(slot0.root_wnd, PathTool.getResFrame("common", "common_30010"), 97.5, 31.5, cc.p(0.5, 0.5), true)

	slot0.bubble_bg:setScale9Enabled(true)
	slot0.bubble_bg:setCapInsets(cc.rect(10, 10, 1, 1))

	slot0.target_label = createRichLabel(18, cc.c3b(2, 54, 86), cc.p(0, 0.5), cc.p(20, 16), 1, 1, 210)

	slot0.root_wnd:addChild(slot0.target_label)
end

function StoryBubble.setData(slot0, slot1, slot2)
	slot2 = slot2 or false

	slot0.target_label:setString(WordCensor:getInstance():relapceFaceIconTag(string.gsub(slot1, "~n", RoleController:getInstance():getRoleVo().name))[2])

	if slot0.target_label:getContentSize().width + 40 < 195 then
		slot6 = 195
	end

	if slot0.target_label:getContentSize().height + 21 + 2 * 8 < 58 then
		slot9 = 58
	end

	slot0.target_label:setPositionY(slot9 * 0.5 + slot8 * 0.5)
	slot0.bubble_bg:setContentSize(cc.size(slot6, slot9))
	slot0.root_wnd:setContentSize(slot0.bubble_bg:getContentSize())
	slot0.bubble_bg:setPosition(slot6 * 0.5, slot9 * 0.5)

	if slot2 then
		slot0.bubble_bg:setScaleX(-1)
	end
end

function StoryBubble.getRootWnd(slot0)
	return slot0.root_wnd
end

function StoryBubble.setAnchorPoint(slot0, slot1, slot2)
	slot0.root_wnd:setAnchorPoint(cc.p(slot1, slot2))
end

function StoryBubble.setPosition(slot0, slot1, slot2)
	slot0.root_wnd:setPosition(cc.p(slot1, slot2))
end

function StoryBubble.setParent(slot0, slot1)
	if not tolua.isnull(slot0.root_wnd) then
		slot0.root_wnd:removeFromParent()

		if not tolua.isnull(slot1) then
			slot1:addChild(slot0.root_wnd)
		end
	end
end

function StoryBubble.__delete(slot0)
	if slot0.close_call_back then
		slot0.close_call_back()
	end

	if not tolua.isnull(slot0.root_wnd) then
		slot0.root_wnd:removeAllChildren()
		slot0.root_wnd:removeFromParent()
	end

	slot0.root_wnd = nil
end

function StoryBubble.addCloseCallBack(slot0, slot1)
	slot0.close_call_back = slot1
end
