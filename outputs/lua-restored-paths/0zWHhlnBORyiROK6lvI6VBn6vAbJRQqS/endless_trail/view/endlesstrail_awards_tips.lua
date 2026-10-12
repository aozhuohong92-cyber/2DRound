EndlessAwardsTips = EndlessAwardsTips or BaseClass(BaseView)
slot0 = Endless_trailController:getInstance()
slot1 = Endless_trailController:getInstance():getModel()
slot2 = string.format

function EndlessAwardsTips.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Tips
	slot0.item_list = {}
	slot0.is_full_screen = false
	slot0.layout_name = "endlesstrail/endlesstrail_awards_tips"
end

function EndlessAwardsTips.open_callback(slot0)
	slot0.background_panel = slot0.root_wnd:getChildByName("background_panel")
	slot0.background = slot0.background_panel:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")

	slot0:playEnterAnimatianByObj(slot0.main_panel, 2)

	slot0.main_container = slot0.main_panel:getChildByName("main_container")
	slot0.desc_label = slot0.main_panel:getChildByName("desc_label")
	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.ok_btn = slot0.main_panel:getChildByName("ok_btn")
	slot0.ok_btn.label = slot0.ok_btn:getChildByName("label")

	slot0.ok_btn.label:setString(TI18N("领取"))

	slot0.title_container = slot0.main_panel:getChildByName("title_container")
	slot0.title_label = slot0.title_container:getChildByName("title_label")

	slot0.title_label:setString(TI18N("奖励"))
end

function EndlessAwardsTips.register_event(slot0)
	if slot0.background then
		slot0.background:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playTabButtonSound()
				uv0:openEndlessRewardTips(false)
			end
		end)
	end

	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				playTabButtonSound()
				uv0:openEndlessRewardTips(false)
			end
		end)
	end

	if slot0.ok_btn then
		slot0.ok_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playTabButtonSound()

				if uv0.data and uv1:getEndlessBattleData() then
					uv2:send23904(uv0.data.id, slot2.type)
				end
			end
		end)
	end
end

function EndlessAwardsTips.openRootWnd(slot0, slot1)
	slot0.data = slot1
	slot2 = uv0:getEndlessBattleData()

	if slot1 and slot2 and Config.EndlessData.data_first_data and Config.EndlessData.data_first_data[slot2.type] and Config.EndlessData.data_first_data[slot2.type][slot0.data.id] then
		slot0:updateItemData(Config.EndlessData.data_first_data[slot2.type][slot0.data.id])
	end
end

function EndlessAwardsTips.updateItemData(slot0, slot1)
	if slot1 then
		slot0.desc_label:setString(string.format(TI18N("第%s关首通奖励"), slot1.limit_id))

		slot3 = #slot1.items
		slot0.space = 30
		slot0.start_x = (slot0.main_container:getContentSize().width - (slot3 * BackPackItem.Width + (slot3 - 1) * slot0.space)) * 0.5

		for slot8, slot9 in ipairs(slot1.items) do
			if not slot0.item_list[slot8] then
				slot10 = BackPackItem.new(true, true)

				slot10:setBaseData(slot9[1], slot9[2])
				slot10:setPosition(cc.p(slot0.start_x + BackPackItem.Width * 0.5 + (slot8 - 1) * (BackPackItem.Width + slot0.space), slot0.main_container:getContentSize().height / 2))
				slot10:setDefaultTip()
				slot0.main_container:addChild(slot10)

				slot0.item_list[slot8] = slot10
			end
		end
	end

	if slot0.data then
		if slot0.data.status == TRUE then
			if slot0.ok_btn.label then
				setChildUnEnabled(false, slot0.ok_btn)
				slot0.ok_btn.label:enableOutline(Config.ColorData.data_color4[264], 2)
				slot0.ok_btn.label:setString(TI18N("领取"))
			end
		elseif slot0.ok_btn.label then
			setChildUnEnabled(true, slot0.ok_btn)
			slot0.ok_btn.label:disableEffect(cc.LabelEffect.OUTLINE)
			slot0.ok_btn.label:setString(TI18N("不可领取"))
		end
	end
end

function EndlessAwardsTips.close_callback(slot0)
	uv0:openEndlessRewardTips(false)
end
