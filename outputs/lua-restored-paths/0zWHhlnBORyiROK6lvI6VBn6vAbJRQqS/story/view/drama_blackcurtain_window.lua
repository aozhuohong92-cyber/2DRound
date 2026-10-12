DramaBlackCurtainWindow = DramaBlackCurtainWindow or BaseClass(BaseView)
slot1 = StoryController:getInstance():getView()

function DramaBlackCurtainWindow.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.MSG_TAG
	slot0.is_full_screen = true
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("drama", "drama"),
			type = ResourcesType.plist
		}
	}
	slot0.layout_name = "drama/drama_blackcurtain_window"
	slot0.label_list = {}
	slot0.interval_time = 1.5
	slot0.end_time = 1
end

function DramaBlackCurtainWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.star_bg = slot0.container:getChildByName("star_bg")
	slot0.container_size = slot0.container:getContentSize()
end

function DramaBlackCurtainWindow.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.label_index <= #uv0.label_list then
				uv0:openDramaActionTimer(false)

				if uv0.label_list[uv0.label_index + 1] then
					if uv0.label_list[uv0.label_index] then
						slot3:stopAllActions()
						slot3:setOpacity(255)
					end

					for slot7 = 1, #uv0.label_list - uv0.label_index do
						uv0.label_index = uv0.label_index + 1

						if uv0.label_list[uv0.label_index + 1] then
							slot8:runAction(cc.FadeIn:create(1.5))
						end
					end

					uv0.label_index = #uv0.label_list
				else
					uv0.container:runAction(cc.Sequence:create(cc.FadeOut:create(1), cc.CallFunc:create(function ()
						uv0:showBlackCurtain(false)
						GlobalEvent:getInstance():Fire(StoryEvent.PLAY_NEXT_ACT)
					end)))
				end
			else
				uv0.container:runAction(cc.Sequence:create(cc.FadeOut:create(1), cc.CallFunc:create(function ()
					uv0:showBlackCurtain(false)
					GlobalEvent:getInstance():Fire(StoryEvent.PLAY_NEXT_ACT)
				end)))
			end
		end
	end)
end

function DramaBlackCurtainWindow.showDramaMsg(slot0, slot1, slot2, slot3)
	slot1 = slot1 or ""
	slot0.interval_time = slot2 or 1.5
	slot0.end_time = slot3 or 1.5
	slot4 = {}

	while string.find(slot1, "&") do
		slot6 = string.sub(slot1, 1, string.find(slot1, "&") - 1)
		slot1 = string.gsub(slot1, slot6 .. "&", "")

		table.insert(slot4, slot6)
	end

	slot8 = slot1

	table.insert(slot4, slot8)

	for slot8, slot9 in pairs(slot0.label_list) do
		slot9:stopAllActions()
		slot9:removeFromParent()

		slot9 = nil
	end

	slot10 = slot0.container_size.height / 2 - (#slot4 - 1) * 20 - 30

	slot0.star_bg:setPositionY(slot10)

	for slot10, slot11 in ipairs(slot4) do
		slot13 = createLabel(26, cc.c3b(240, 195, 120), nil, slot0.container_size.width / 2, slot6 + 110 + (slot5 - slot10) * 50, slot11, slot0.container, nil, cc.p(0.5, 0.5))

		slot13:setOpacity(0)
		table.insert(slot0.label_list, slot13)

		if slot10 == 1 then
			slot13:runAction(cc.FadeIn:create(1.5))
		end
	end

	slot0.label_index = 1

	slot0:openDramaActionTimer(true)
end

function DramaBlackCurtainWindow.openDramaActionTimer(slot0, slot1)
	if slot1 == true then
		if slot0.dramaActionTimer ~= nil then
			GlobalTimeTicket:getInstance():remove(slot0.dramaActionTimer)

			slot0.dramaActionTimer = nil
		end

		slot0.dramaActionTimer = GlobalTimeTicket:getInstance():add(function ()
			uv0.label_index = uv0.label_index + 1

			if uv0.label_index <= #uv0.label_list then
				uv0.label_list[uv0.label_index]:runAction(cc.FadeIn:create(1.5))
			else
				uv0.dramaEndTimer = GlobalTimeTicket:getInstance():add(function ()
					uv0.container:runAction(cc.Sequence:create(cc.FadeOut:create(1), cc.CallFunc:create(function ()
						uv0:showBlackCurtain(false)
						GlobalEvent:getInstance():Fire(StoryEvent.PLAY_NEXT_ACT)
					end)))
					GlobalTimeTicket:getInstance():remove(uv0.dramaEndTimer)

					uv0.dramaEndTimer = nil
				end, uv0.end_time)

				GlobalTimeTicket:getInstance():remove(uv0.dramaActionTimer)

				uv0.dramaActionTimer = nil
			end
		end, slot0.interval_time)
	else
		if slot0.dramaActionTimer ~= nil then
			GlobalTimeTicket:getInstance():remove(slot0.dramaActionTimer)

			slot0.dramaActionTimer = nil
		end

		if slot0.dramaEndTimer ~= nil then
			GlobalTimeTicket:getInstance():remove(slot0.dramaEndTimer)

			slot0.dramaEndTimer = nil
		end
	end
end

function DramaBlackCurtainWindow.openRootWnd(slot0, slot1)
	slot0:showDramaMsg(slot1)
end

function DramaBlackCurtainWindow.close_callback(slot0)
	uv0:showBlackCurtain(false)

	slot4 = false

	slot0:openDramaActionTimer(slot4)
	slot0.container:stopAllActions()

	for slot4, slot5 in pairs(slot0.label_list) do
		slot5:stopAllActions()
		slot5:removeFromParent()

		slot5 = nil
	end
end
