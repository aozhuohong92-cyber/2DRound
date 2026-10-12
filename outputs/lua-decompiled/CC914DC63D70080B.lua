slot1 = TrainingcampController:getInstance():getModel()
TrainingcampTipsWindow = TrainingcampTipsWindow or BaseClass(BaseView)

function TrainingcampTipsWindow.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "trainingcamp/trainingcamp_tips_view"
	slot0.cache_list = {}
	slot0.is_csb_action = true
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("trainingcamp", "trainingcamp"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_93"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_94"),
			type = ResourcesType.single
		}
	}
end

function TrainingcampTipsWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.scroll_view = slot0.container:getChildByName("scroll_view")

	slot0.scroll_view:setScrollBarEnabled(false)

	slot0.scroll_width = slot0.scroll_view:getContentSize().width
	slot0.scroll_height = slot0.scroll_view:getContentSize().height
	slot0.win_title = slot0.container:getChildByName("win_title")
end

function TrainingcampTipsWindow.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openTrainingcampTipsWindow(false)
			delayOnce(function ()
				GlobalEvent:getInstance():Fire(TrainingcampEvent.Show_Close_Effect_Event)
				uv0:setVisible(false)
				uv0:closeInternal()
			end, 16 / display.DEFAULT_FPS)
		end
	end)
end

function TrainingcampTipsWindow.openRootWnd(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.win_title:setString(slot1.name)

	slot0.max_height = 0

	slot0:setDataList(slot1.message)
end

function TrainingcampTipsWindow.setDataList(slot0, slot1)
	slot2 = {}

	if string.find(slot1, "&&") then
		slot2 = string.split(slot1, "&&")
	else
		slot2[1] = slot1
	end

	slot0.render_list = slot2

	for slot7, slot8 in ipairs(slot0.render_list) do
		delayRun(slot0.container, slot7 / display.DEFAULT_FPS, function ()
			uv0:createList(uv1)
		end)
	end
end

function TrainingcampTipsWindow.createList(slot0, slot1)
	slot2, slot3 = slot0:createTitleContent(slot1)

	slot0.scroll_view:addChild(slot2)
	table.insert(slot0.cache_list, slot2)

	slot0.max_height = slot0.max_height + slot3 + 30
	slot10 = slot0.scroll_width

	slot0.scroll_view:setInnerContainerSize(cc.size(slot10, math.max(slot0.max_height, slot0.scroll_height)))

	slot5 = 0

	for slot9, slot10 in ipairs(slot0.cache_list) do
		slot10:setPosition(8, slot4 - slot5)

		slot5 = slot5 + slot10:getContentSize().height + 30
	end
end

function TrainingcampTipsWindow.createTitleContent(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot2 = ccui.Widget:create()

	slot2:setAnchorPoint(cc.p(0, 1))
	slot2:setCascadeOpacityEnabled(true)

	slot3 = 0

	if string.find(slot1, "img") then
		slot7 = createImage(slot2, PathTool.getPlistImgForDownLoad("bigbg/trainingcamp", "trainingcamp_" .. string.gsub(slot1, "img", "")), slot0.scroll_width / 2, 0, cc.p(0.5, 1), false, 1, false)
		slot3 = slot7:getContentSize().height

		slot2:setContentSize(cc.size(slot0.scroll_width - 8, slot3))
		slot7:setPositionY(slot3 - 8)
	else
		slot5 = createRichLabel(20, 201, cc.p(0.5, 1), cc.p(246, 0), 5, nil, 480)

		slot5:setString(slot1)
		slot2:addChild(slot5)

		slot3 = slot5:getContentSize().height

		slot2:setContentSize(cc.size(slot0.scroll_width - 8, slot3))
		slot5:setPositionY(slot3 - 8)
	end

	return slot2, slot3
end

function TrainingcampTipsWindow.close_callback(slot0)
	slot0.container:stopAllActions()
	uv0:openTrainingcampTipsWindow(false)
end
