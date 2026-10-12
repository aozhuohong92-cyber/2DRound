BrowsePanel = BrowsePanel or BaseClass(BaseView)
slot1 = HeroExpeditController:getInstance():getModel()
slot2 = table.insert

function BrowsePanel.__init(slot0)
	slot0.is_full_screen = false
	slot0.layout_name = "heroexpedit/browse_reward_panel"
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.reward_list = {}
end

function BrowsePanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("Image_33"):getChildByName("Text_32"):setString(TI18N("奖励预览"))

	slot0.btn_con = slot1:getChildByName("btn_con")

	slot0.btn_con:getChildByName("Text_33"):setString(TI18N("确认"))

	slot0.good_con = slot1:getChildByName("good_con")
end

function BrowsePanel.openRootWnd(slot0, slot1)
	if slot1.rewards then
		slot4 = {}
		slot4 = (tableLen(slot2) ~= 2 or {
			108,
			365
		}) and {
			108,
			238,
			365
		}

		for slot8 = 1, slot3 do
			if not slot0.reward_list[slot8] then
				slot0.reward_list[slot8] = BackPackItem.new(nil, true)

				slot0.reward_list[slot8]:setAnchorPoint(0, 0.5)
				slot0.good_con:addChild(slot0.reward_list[slot8])
			end

			if slot0.reward_list[slot8] then
				slot0.reward_list[slot8]:setPosition(cc.p(slot4[slot8], 79))

				if slot2[slot8].bid == 25 and slot1.is_holiday == 1 then
					slot0.reward_list[slot8]:holidHeroExpeditTag(true, TI18N("限时提升"))
				else
					slot0.reward_list[slot8]:holidHeroExpeditTag(false)
				end

				slot0.reward_list[slot8]:setDefaultTip()
				slot0.reward_list[slot8]:setBaseData(slot2[slot8].bid, slot2[slot8].num)
			end
		end
	end
end

function BrowsePanel.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openBrowsePanelView(false)
	end, false, 2)
	registerButtonEventListener(slot0.btn_con, function ()
		uv0:openBrowsePanelView(false)
	end, true, 2)
end

function BrowsePanel.close_callback(slot0)
	if slot0.itemScrollview then
		slot0.itemScrollview:DeleteMe()

		slot0.itemScrollview = nil
	end

	uv0:openBrowsePanelView(false)
end
