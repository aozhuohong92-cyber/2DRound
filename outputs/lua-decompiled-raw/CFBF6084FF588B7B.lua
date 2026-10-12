CustomPageView = class("CustomPageView", function ()
	return cc.Node:create()
end)

function CustomPageView.ctor(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot0.view_size = slot1
	slot0.is_arrow = slot2
	slot0.is_light = slot3
	slot0.cur_page = 1
	slot0.tot_page = slot6 or 2
	slot0.per_page = 1
	slot0.light_gap = slot4 or 20
	slot0.light_y = slot5 or 20

	slot0:init()
end

function CustomPageView.init(slot0)
	slot0.page_view = ccui.PageView:create()

	slot0.page_view:setTouchEnabled(true)
	slot0.page_view:setContentSize(slot0.view_size)
	slot0:addChild(slot0.page_view)
	slot0.page_view:addEventListener(function (slot0, slot1)
		uv0:pageViewTurning(slot0, slot1)
	end)
	slot0:showArrow()
	slot0:showLight()
end

function CustomPageView.showArrow(slot0)
	if not slot0.is_arrow then
		return
	end

	if not slot0.left_btn then
		slot0.right_btn = ccui.Button:create(PathTool.getResFrame("common", "common_90034"), "", "", LOADTEXT_TYPE_PLIST)

		slot0.right_btn:setPosition(slot0.view_size.width - 28, slot0.view_size.height / 2)
		slot0:addChild(slot0.right_btn, 1)
		slot0.right_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				doScrollToPage(uv0.page_view, uv0.page_view:getCurrentPageIndex() + 1)
			end
		end)

		slot0.left_btn = ccui.Button:create(PathTool.getResFrame("common", "common_90034"), "", "", LOADTEXT_TYPE_PLIST)

		slot0.left_btn:setPosition(28, slot0.view_size.height / 2)
		slot0.left_btn:setScaleX(-1)
		slot0:addChild(slot0.left_btn, 1)
		slot0.left_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				doScrollToPage(uv0.page_view, uv0.page_view:getCurrentPageIndex() - 1)
			end
		end)
	end
end

function CustomPageView.showLight(slot0)
	if not slot0.is_light then
		return
	end

	if not slot0.lights then
		slot0.lights = {}
	end

	slot1 = #slot0.lights
	slot2 = slot0.tot_page
	slot3 = {}

	while slot2 > 0 do
		slot2 = slot2 - 1
		slot4 = nil

		if #slot0.lights > 0 then
			slot4 = table.remove(slot0.lights)
		else
			slot0:addChild(ccui.ImageView:create())
		end

		table.insert(slot3, slot4)
	end

	for slot7, slot8 in pairs(slot0.lights) do
		slot8:removeFromParent()

		slot8 = nil
	end

	slot0.lights = nil
	slot0.lights = slot3

	slot0:adjustLightPos(slot0.light_gap, slot0.light_y)
end

function CustomPageView.adjustLightPos(slot0, slot1, slot2, slot3)
	if not slot0.lights then
		return
	end

	slot0.light_gap = slot1 or 10
	slot0.light_y = slot2 or 10
	slot3 = slot3 or 0

	for slot9 = 1, #slot0.lights do
		slot4 = 0 + 12 + slot0.light_gap
	end

	if slot3 == nil then
		slot3 = 0
	end

	slot6 = (slot0.view_size.width - slot4) * 0.5 + slot3

	for slot10 = 1, #slot0.lights do
		slot0.lights[slot10]:setPosition(slot6, slot0.light_y)

		slot6 = slot6 + slot5 + slot0.light_gap
	end
end

function CustomPageView.adjustArrowGap(slot0, slot1)
	if slot0.left_btn then
		slot0.left_btn:setPosition(cc.p(-slot1, slot0.view_size.height / 2))
		slot0.right_btn:setPosition(cc.p(slot0.view_size.width + slot1, slot0.view_size.height / 2))
	end
end

function CustomPageView.adjustArrowPos(slot0, slot1, slot2, slot3)
	if slot0.left_btn then
		slot0.left_btn:setPosition(slot0.left_btn:getPositionX() + slot1, slot0.left_btn:getPositionY() + slot3)
		slot0.left_btn:setPosition(slot0.left_btn:getPositionX() + slot2, slot0.left_btn:getPositionY() + slot3)
	end
end

function CustomPageView.showPage(slot0, slot1)
	if slot0.tot_page < slot1 or slot1 < 1 then
		return
	end

	slot0.cur_page = slot1

	if slot0.is_light and slot0.lights then
		slot2, slot3 = nil

		for slot7 = 1, #slot0.lights do
			if (slot7 == slot1 and true or false) ~= slot0.lights[slot7].shine then
				slot2.shine = slot3

				if slot3 then
					slot2:loadTexture(PathTool.getResFrame("common", "common_1065"), LOADTEXT_TYPE_PLIST)
				else
					slot2:loadTexture(PathTool.getResFrame("common", "common_1066"), LOADTEXT_TYPE_PLIST)
				end
			end
		end
	end

	if slot0.is_arrow then
		if slot0.cur_page == 1 and slot0.cur_page < slot0.tot_page then
			setChildUnEnabled(true, slot0.left_btn)
			slot0.left_btn:setTouchEnabled(false)
			setChildUnEnabled(false, slot0.right_btn)
			slot0.right_btn:setTouchEnabled(true)
		elseif slot0.cur_page == 1 and slot0.tot_page <= slot0.cur_page then
			setChildUnEnabled(true, slot0.left_btn)
			slot0.left_btn:setTouchEnabled(false)
			setChildUnEnabled(true, slot0.right_btn)
			slot0.right_btn:setTouchEnabled(false)
		elseif slot0.cur_page > 1 and slot0.cur_page < slot0.tot_page then
			setChildUnEnabled(false, slot0.left_btn)
			slot0.left_btn:setTouchEnabled(true)
			setChildUnEnabled(false, slot0.right_btn)
			slot0.right_btn:setTouchEnabled(true)
		elseif slot0.cur_page > 1 and slot0.cur_page == slot0.tot_page then
			setChildUnEnabled(false, slot0.left_btn)
			slot0.left_btn:setTouchEnabled(true)
			setChildUnEnabled(true, slot0.right_btn)
			slot0.right_btn:setTouchEnabled(false)
		end
	end
end

function CustomPageView.pageViewTurning(slot0, slot1, slot2)
	if slot2 == ccui.PageViewEventType.turning and slot0.cur_page ~= slot0.page_view:getCurrentPageIndex() + 1 then
		slot0.cur_page = slot3 + 1

		if slot0.turn_call_back then
			slot0.turn_call_back(slot0.cur_page, slot0.pages_num)
		end

		if slot0.cur_page + 1 <= slot0.tot_page and slot0.cur_page == slot0.page_view:getChildrenCount() then
			delayRun(slot0, 0.05, function ()
				uv0:createPageItem(uv0.cur_page)
			end)
		end

		slot0:showPage(slot0.cur_page)
	end
end

function CustomPageView.MoveFadeIn(slot0)
	slot4 = cc.EventListenerTouchOneByOne:create()

	slot4:registerScriptHandler(function (slot0, slot1)
		if uv0.page_view:convertToNodeSpace(slot0:getLocation()).x > 0 and slot3.y > 0 and slot3.x < uv0.page_view:getContentSize().width and slot3.y < uv0.page_view:getContentSize().height and uv0.tot_page >= 2 then
			uv0.page_view:setOpacity(55)

			uv0.cur_Location = true
		else
			uv0.cur_Location = false

			return false
		end

		return true
	end, cc.Handler.EVENT_TOUCH_BEGAN)
	slot4:registerScriptHandler(function (slot0, slot1)
		uv0.page_view:runAction(cc.Sequence:create(cc.FadeOut:create(0.3)))
	end, cc.Handler.EVENT_TOUCH_MOVED)
	slot4:registerScriptHandler(function (slot0, slot1)
		uv0.page_view:setOpacity(255)
		uv0.page_view:runAction(cc.Sequence:create(cc.FadeIn:create(0.3)))
	end, cc.Handler.EVENT_TOUCH_ENDED)
	cc.Director:getInstance():getEventDispatcher():addEventListenerWithSceneGraphPriority(slot4, slot0.page_view)
end

function CustomPageView.addTurnCallBack(slot0, slot1)
	slot0.turn_call_back = slot1
end

function CustomPageView.addCreatePageCallBack(slot0, slot1)
	slot0.create_call_back = slot1
end

function CustomPageView.setViewData(slot0, slot1)
	slot0.data_list = slot1
	slot0.tot_page = math.floor((#slot1 - 1) / slot0.per_page) + 1
	slot0.cur_page = 1
	slot2 = 1

	if slot0.cur_page == 1 and slot0.tot_page >= 2 then
		slot2 = 2
	end

	for slot6 = 1, slot2 do
		slot0:createPageItem(slot6 - 1)
	end

	if slot0.turn_call_back then
		slot0.turn_call_back(slot0.cur_page, slot0.pages_num)
	end

	delayRun(slot0.page_view, 0.05, function ()
		doScrollToPage(uv0.page_view, 2)
	end)
	slot0:showPage(1)

	if slot0.lights and #slot0.lights ~= slot0.tot_page then
		slot0:showLight()
	end
end

function CustomPageView.createPageItem(slot0, slot1)
	if not slot0.page_view:getItem(slot1) then
		slot2 = ccui.Layout:create()

		slot2:setCascadeOpacityEnabled(true)
		slot2:setContentSize(slot0.view_size)
		slot0.page_view:insertPage(slot2, slot1)
		slot0.page_view:setCurrentPageIndex(math.max(0, slot0.page_view:getCurrentPageIndex()))

		if slot0.create_call_back then
			slot0.create_call_back(slot0.data_list, slot1 + 1, slot2)
		end
	end
end

function CustomPageView.removeAllLayouts(slot0)
	slot0.page_view:removeAllPages()
end

function CustomPageView.removePageAtIndex(slot0, slot1)
	slot0.page_view:removePageAtIndex(slot1)
end

function CustomPageView.dispose(slot0)
	slot0:removeAllChildren()

	if slot0:getParent() then
		slot0:removeFromParent()
	end
end
