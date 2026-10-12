GodBattleExplainPanel = GodBattleExplainPanel or BaseClass()

function GodBattleExplainPanel.__init(slot0, slot1)
	slot0.is_init = false
	slot0.parent = slot1
	slot0.cache_list = {}
	slot0.max_height = 0

	slot0:createRoorWnd()
	slot0:registerEvent()
end

function GodBattleExplainPanel.createRoorWnd(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("godbattle/godbattle_explain_panel"))

	if not tolua.isnull(slot0.parent) then
		slot0.parent:addChild(slot0.root_wnd)
	end

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.scroll_view = slot0.root_wnd:getChildByName("scroll_view")

	slot0.scroll_view:setScrollBarEnabled(false)

	slot0.scroll_width = slot0.scroll_view:getContentSize().width
	slot0.scroll_height = slot0.scroll_view:getContentSize().height
end

function GodBattleExplainPanel.registerEvent(slot0)
end

function GodBattleExplainPanel.addToParent(slot0, slot1)
	if not tolua.isnull(slot0.root_wnd) then
		slot0.root_wnd:setVisible(slot1)
	end

	if slot1 == true and slot0.is_init == false then
		slot0.is_init = true

		slot0:setDataList(Config.ZsWarData.data_explain)
	end
end

function GodBattleExplainPanel.setDataList(slot0, slot1)
	slot0.render_list = slot1

	for slot5, slot6 in ipairs(slot0.render_list) do
		delayRun(slot0.container, slot5 / display.DEFAULT_FPS, function ()
			uv0:createList(uv1)
		end)
	end
end

function GodBattleExplainPanel.createList(slot0, slot1)
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

function GodBattleExplainPanel.createTitleContent(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot2 = ccui.Widget:create()

	slot2:setAnchorPoint(cc.p(0, 1))
	slot2:setCascadeOpacityEnabled(true)

	slot3 = 0

	if slot1.title == " " or slot1.title == "" then
		slot4 = createRichLabel(24, 175, cc.p(0, 1), cc.p(0, 0), 5, nil, 605)

		slot4:setString(splitDataStr(slot1.desc))
		slot2:addChild(slot4)

		slot3 = slot4:getContentSize().height

		slot2:setContentSize(cc.size(slot0.scroll_width - 8, slot3))
		slot4:setPositionY(slot3 - 8)
	else
		slot4 = createScale9Sprite(PathTool.getResFrame("common", "common_90025"), 0, 0, LOADTEXT_TYPE_PLIST, slot2)

		slot4:setAnchorPoint(cc.p(0, 1))
		slot4:setContentSize(cc.size(617, 44))

		slot5 = createLabel(26, Config.ColorData.data_color4[175], nil, 5, slot4:getContentSize().height * 0.5, slot1.title, slot4, nil, cc.p(0, 0.5))
		slot6 = createRichLabel(24, 175, cc.p(0, 1), cc.p(0, 0), 5, nil, 605)

		slot6:setString(splitDataStr(slot1.desc))
		slot2:addChild(slot6)

		slot3 = slot4:getContentSize().height + slot6:getContentSize().height

		slot2:setContentSize(cc.size(slot0.scroll_width - 8, slot3))
		slot4:setPositionY(slot3 - 8)
		slot6:setPositionY(slot4:getPositionY() - slot4:getContentSize().height - 8)
	end

	return slot2, slot3
end

function GodBattleExplainPanel.__delete(slot0)
	doStopAllActions(slot0.container)
end
