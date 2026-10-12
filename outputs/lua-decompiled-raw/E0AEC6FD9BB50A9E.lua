slot1 = TrainingcampController:getInstance():getModel()
TrainingcampAllfinishTipsWindow = TrainingcampAllfinishTipsWindow or BaseClass(BaseView)

function TrainingcampAllfinishTipsWindow.__init(slot0)
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

function TrainingcampAllfinishTipsWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.scroll_view = slot0.container:getChildByName("scroll_view")

	slot0.scroll_view:setScrollBarEnabled(false)
	slot0.scroll_view:setTouchEnabled(false)

	slot0.scroll_width = slot0.scroll_view:getContentSize().width
	slot0.scroll_height = slot0.scroll_view:getContentSize().height
	slot0.win_title = slot0.container:getChildByName("win_title")
end

function TrainingcampAllfinishTipsWindow.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0.is_exist_ui_end = false

			playCloseSound()
			uv1:openTrainingcampAllfinishTipsWindow(false)
		end
	end)
end

function TrainingcampAllfinishTipsWindow.openRootWnd(slot0)
	slot0.max_height = 0

	slot0:setData()
end

function TrainingcampAllfinishTipsWindow.setData(slot0)
	slot1 = ""

	if Config.TrainingCampData.data_const.tips_content then
		slot1 = Config.TrainingCampData.data_const.tips_content.desc
	end

	if Config.TrainingCampData.data_const.tips_title then
		slot0.win_title:setString(Config.TrainingCampData.data_const.tips_title.desc)
	end

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

function TrainingcampAllfinishTipsWindow.createList(slot0, slot1)
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

function TrainingcampAllfinishTipsWindow.createTitleContent(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot2 = ccui.Widget:create()

	slot2:setAnchorPoint(cc.p(0, 1))
	slot2:setCascadeOpacityEnabled(true)

	slot3 = 0

	if string.find(slot1, "img") then
		slot7 = createSprite(PathTool.getResFrame("trainingcamp", "txt_cn_trainingcamp_" .. string.gsub(slot1, "img", "")), slot0.scroll_width / 4 * 3, 0, slot2, cc.p(0.5, 1), LOADTEXT_TYPE_PLIST)
		slot3 = slot7:getContentSize().height

		slot2:setContentSize(cc.size(slot0.scroll_width - 8, slot3))
		slot7:setPositionY(slot3 - 150)
	else
		slot5 = createRichLabel(22, 274, cc.p(0, 1), cc.p(0, 0), 30, nil, 480)

		slot5:setString("        " .. slot1)
		slot2:addChild(slot5)

		slot3 = slot5:getContentSize().height

		slot2:setContentSize(cc.size(slot0.scroll_width - 8, slot3))
		slot5:setPositionY(slot3 - 130)
	end

	return slot2, slot3
end

function TrainingcampAllfinishTipsWindow.close_callback(slot0)
	slot0.container:stopAllActions()
	uv0:openTrainingcampAllfinishTipsWindow(false)
end
