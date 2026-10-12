SureveyQuestWindow = SureveyQuestWindow or BaseClass(BaseView)
slot0 = WelfareController:getInstance()
slot1 = 40

function SureveyQuestWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "welfare/surveyquest_window"
	slot0.topic_sprite = {}
	slot0.answer_label = {}
	slot0.topic_layout = {}
	slot0.touchSelect = {}
	slot0.touchManySelect = {}
	slot0.item_list = {}
	slot0.answer_list = {}
	slot0.index_count = 0
	slot0.cur_index = nil
	slot0.titleTopic = nil
	slot0.answer_ret_temp = nil
	slot0.topic_length = 10
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("welfare", "welfare"),
			type = ResourcesType.plist
		}
	}
end

function SureveyQuestWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.btn_start = slot0.main_container:getChildByName("btn_start")
	slot0.btn_start.label = slot0.btn_start:getChildByName("Text_9")
	slot0.btn_close = slot0.main_container:getChildByName("btn_close")
	slot0.answer_scroll = slot0.main_container:getChildByName("answer_scroll")

	slot0.answer_scroll:setScrollBarEnabled(false)
	slot0.answer_scroll:setVisible(false)
	slot0.main_container:getChildByName("Text_10"):setString(TI18N("小助手的冒险调查"))

	slot0.text_prompt = slot0.main_container:getChildByName("text_prompt")
	slot0.start_title = slot0.text_prompt:getChildByName("Text_8")

	slot0.start_title:setString("")

	slot0.start_memo = slot0.text_prompt:getChildByName("Text_8_0")

	slot0.start_memo:setString("")

	slot0.suggest_panel = slot0.main_container:getChildByName("suggest_panel")
	slot0.text_Field = slot0.suggest_panel:getChildByName("text_Field")

	slot0.text_Field:setVisible(false)
	slot0.text_Field:addEventListener(function (slot0, slot1)
		if slot1 == ccui.TextFiledEventType.attach_with_ime then
			slot0:setString("")
		elseif slot1 == ccui.TextFiledEventType.detach_with_ime then
			-- Nothing
		elseif slot1 == ccui.TextFiledEventType.insert_text then
			-- Nothing
		elseif slot1 == ccui.TextFiledEventType.delete_backward then
			-- Nothing
		end
	end)
	slot0.suggest_panel:setVisible(false)

	slot0.label_content = createRichLabel(22, Config.ColorData.data_color4[151], cc.p(0, 1), cc.p(9, 370), 6, nil, 450)

	slot0.label_content:setString("")
	slot0.suggest_panel:addChild(slot0.label_content)

	slot0.edit_content = createEditBox(slot0.suggest_panel, PathTool.getResFrame("common", "common_99998"), cc.size(400, 300), nil, 22, nil, 22, "", nil, , LOADTEXT_TYPE_PLIST)

	slot0.edit_content:setAnchorPoint(cc.p(0, 1))
	slot0.edit_content:setPlaceholderFontColor(cc.c4b(114, 78, 52, 255))
	slot0.edit_content:setFontColor(cc.c4b(114, 78, 52, 255))
	slot0.edit_content:setPosition(cc.p(9, 370))
	slot0.edit_content:registerScriptEditBoxHandler(function (slot0, slot1)
		if slot0 == "return" or slot0 == "ended" then
			if uv0.begin_change_label then
				uv0.begin_change_label = false

				uv0.label_content:setVisible(true)
				slot1:setText("")

				if slot1:getText() ~= "" and slot2 ~= uv0.content_str then
					uv0.content_str = slot2

					if uv0.label_content then
						uv0.label_content:setString(slot2)
					end
				end
			end
		elseif slot0 == "began" then
			if not uv0.begin_change_label then
				uv0.label_content:setVisible(false)

				uv0.begin_change_label = true
			end
		elseif slot0 == "changed" then
			-- Nothing
		end
	end)

	slot0.reward_panel = slot0.main_container:getChildByName("reward_panel")

	slot0.reward_panel:setVisible(false)
end

function SureveyQuestWindow.openRootWnd(slot0)
	uv0:sender24601()
end

function SureveyQuestWindow.register_event(slot0)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openSureveyQuestView(false)
	end, true, 2)
	registerButtonEventListener(slot0.btn_start, function ()
		if uv0:getModel():getQuestOpenData() and slot0.flag ~= 0 then
			uv0:sender24604()

			return
		end

		if uv1.topic_length < uv1.index_count then
			return
		end

		uv1.index_count = uv1.index_count + 1

		if uv1.questNaire_list then
			slot1 = true
			slot2 = uv1.questNaire_list[uv1.index_count - 1]

			if uv1.questNaire_list[uv1.index_count - 1].specific_type ~= QuestConst.fill_blank then
				if uv1.answer_ret_temp and #uv1.answer_ret_temp ~= 0 then
					slot3 = {
						id = slot2.id,
						topic_type = slot2.specific_type
					}
					slot4 = ""

					if type(uv1.answer_ret_temp) == "table" then
						uv1.answer_ret_temp = table.concat(uv1.answer_ret_temp, ",")
					else
						slot4 = uv1.answer_ret_temp
					end

					slot3.ret = tostring(uv1.answer_ret_temp)

					table.insert(uv1.answer_list, slot3)
				end

				for slot6, slot7 in pairs(uv1.answer_list) do
					if slot7.id == slot2.id and slot7.ret ~= nil then
						slot1 = false

						break
					end
				end

				if slot2.must == 1 and slot2.specific_type ~= QuestConst.fill_blank and slot1 == true then
					uv1.index_count = uv1.index_count - 1

					message(TI18N("必须选择一个答案"))

					return
				end
			else
				if slot2.must == 1 and uv1.label_content:getString() == "" then
					uv1.index_count = uv1.index_count - 1

					message(TI18N("填空题需写入文字哦"))

					return
				end

				table.insert(uv1.answer_list, {
					id = slot2.id,
					topic_type = slot2.specific_type,
					ret = uv1.label_content:getString()
				})
				uv1.label_content:setString("")
				uv1.edit_content:setText("")
			end
		end

		if uv1.index_count == 1 then
			uv0:sender24602()
		end

		if uv1.topic_length + 1 == uv1.index_count then
			uv1.answer_scroll:setVisible(false)
			uv1.suggest_panel:setVisible(false)

			if uv1.titleTopic then
				uv1.titleTopic:setVisible(false)
			end

			uv1:getRewardList()
		else
			uv1.answer_ret_temp = nil

			uv1:startTopicAnswer(uv1.questNaire_list)
			uv1.text_prompt:setVisible(false)
			uv1.btn_start.label:setString(TI18N("下一页"))
		end
	end, true, 2)
	slot0:addGlobalEvent(WelfareEvent.Get_SureveyQuest_Basic, function (slot0)
		if not slot0 or next(slot0) == nil then
			return
		end

		if uv0:getModel():getQuestOpenData() and slot1.status == 0 then
			return
		end

		uv1.answer_reward_list = slot0.rewards

		if uv0:getModel():getQuestOpenData() then
			if slot2.flag == 0 then
				uv1.start_title:setString(TI18N("亲爱的船长大人："))
				uv1.start_memo:setString(TI18N("辛苦您参加小助手的冒险调查，小助手为大人\n\n准备了小小谢礼，放在了问卷的最后哦~"))
			else
				uv1:getRewardList(slot2.flag)
			end
		end
	end)
	slot0:addGlobalEvent(WelfareEvent.Get_SureveyQuest_Topic_Content, function (slot0)
		if not slot0 or next(slot0) == nil then
			return
		end

		if uv0:getModel():getQuestOpenData() and slot1.status == 0 then
			return
		end

		uv1.topic_length = tableLen(slot0.questionnaire_list)
		uv1.questNaire_list = slot0.questionnaire_list

		uv1:startTopicAnswer(uv1.questNaire_list)
	end)
	slot0:addGlobalEvent(WelfareEvent.Get_SureveyQuest_Get_Reward, function (slot0)
		if not slot0 or next(slot0) == nil then
			return
		end

		if uv0:getModel():getQuestOpenData() and slot1.status == 0 then
			return
		end

		uv1.btn_start.label:setString(TI18N("已完成"))
		uv1.btn_start.label:disableEffect(cc.LabelEffect.OUTLINE)
		setChildUnEnabled(true, uv1.btn_start)
		uv1.btn_start:setTouchEnabled(false)
	end)
end

function SureveyQuestWindow.getRewardList(slot0, slot1)
	slot0.reward_panel:setVisible(true)

	slot0.end_memo = slot0.reward_panel:getChildByName("Text_1")

	slot0.end_memo:setString(TI18N("亲爱的船长大人~\n\n请收下小助手的一点心意"))

	if (slot1 or 1) == 2 then
		slot0.btn_start.label:setString(TI18N("已完成"))
		slot0.btn_start.label:disableEffect(cc.LabelEffect.OUTLINE)
		setChildUnEnabled(true, slot0.btn_start)
		slot0.btn_start:setTouchEnabled(false)
	else
		slot0.btn_start.label:setString(TI18N("领取奖励"))
	end

	slot2 = slot0.reward_panel:getChildByName("good_cons")

	if slot0.answer_reward_list then
		slot3 = {}

		for slot7, slot8 in pairs(slot0.answer_reward_list) do
			table.insert(slot3, {
				bid = slot8.bid,
				quantity = slot8.num
			})
		end

		slot0.item_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot2:getContentSize(), {
			start_y = 0,
			start_x = 0,
			space_x = 10,
			row = 1,
			space_y = 0,
			col = 0,
			item_class = BackPackItem,
			item_width = BackPackItem.Width,
			item_height = BackPackItem.Height
		})

		slot0.item_scrollview:setSwallowTouches(false)
		slot0.item_scrollview:setData(slot3)

		if uv0:getModel():getQuestOpenData() and slot6.flag == 0 then
			uv0:sender24603(slot0.answer_list)
		end
	end
end

function SureveyQuestWindow.startTopicAnswer(slot0, slot1)
	if not slot1 or next(slot1) == nil then
		return
	end

	if not slot1[slot0.index_count] then
		return
	end

	slot2 = slot1[slot0.index_count].specific_type

	if not slot0.titleTopic then
		slot0.titleTopic = createRichLabel(24, cc.c4b(77, 48, 27, 255), cc.p(0, 0.5), cc.p(115, 570), 10, nil, 510)

		slot0.main_container:addChild(slot0.titleTopic)
	end

	slot6 = slot1[slot0.index_count].title

	slot0.titleTopic:setString(slot6)

	for slot6, slot7 in pairs(slot0.topic_sprite) do
		slot7:setVisible(false)
	end

	for slot6, slot7 in pairs(slot0.topic_layout) do
		slot7:setVisible(false)
	end

	for slot6, slot7 in pairs(slot0.touchSelect) do
		slot7:setVisible(false)
	end

	for slot6, slot7 in pairs(slot0.answer_label) do
		slot7:setVisible(false)
	end

	slot4 = assert(loadstring("return " .. string.gsub(string.gsub(slot1[slot0.index_count].option, "\\r", ""), "\\", "")))() or "error"

	if slot2 == QuestConst.fill_blank then
		slot0.answer_scroll:setVisible(false)
		slot0.suggest_panel:setVisible(true)
	else
		slot0.answer_scroll:setVisible(true)
		slot0.suggest_panel:setVisible(false)

		slot5 = {}
		slot6 = true
		slot10 = slot4

		for slot10 = 1, tableLen(slot10) do
			if slot4[slot10] and slot4[slot10][2] and slot0:getStringCharCount(slot4[slot10][2]) > 5 then
				slot6 = false

				break
			end
		end

		slot10 = slot4

		for slot10 = 1, tableLen(slot10) do
			if not slot0.topic_sprite[slot10] then
				slot0.topic_sprite[slot10] = createImage(slot0.answer_scroll, PathTool.getResFrame("common", "common_1030"), 20, 100 * slot10, cc.p(0.5, 0.5), true, 0, true)
				slot0.answer_label[slot10] = createRichLabel(24, cc.c4b(77, 48, 27, 255), cc.p(0, 1), cc.p(47, 31), nil, , 480)

				slot0.answer_label[slot10]:setVisible(false)
				slot0.topic_sprite[slot10]:addChild(slot0.answer_label[slot10])

				slot0.topic_layout[slot10] = ccui.Layout:create()

				slot0.topic_layout[slot10]:setAnchorPoint(0, 0.5)
				slot0.topic_layout[slot10]:setContentSize(cc.size(150, 60))
				slot0.topic_layout[slot10]:setPosition(cc.p(0, 15))
				slot0.topic_sprite[slot10]:addChild(slot0.topic_layout[slot10])
				slot0.topic_sprite[slot10]:setVisible(false)
				slot0.topic_layout[slot10]:setTouchEnabled(true)

				slot0.touchSelect[slot10] = createSprite(PathTool.getResFrame("common", "common_1043"), 18, 18, slot0.topic_sprite[slot10], cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)

				slot0.touchSelect[slot10]:setVisible(false)
			end

			if slot0.topic_sprite[slot10] then
				slot0.answer_label[slot10]:setString(slot4[slot10][2])
				slot0.answer_label[slot10]:setVisible(false)

				if slot6 then
					if math.fmod(slot10, 2) == 1 then
						slot5[slot10] = slot0.answer_label[slot10]:getContentSize().height + uv0
					else
						slot5[slot10] = 0
					end
				else
					slot5[slot10] = slot0.answer_label[slot10]:getContentSize().height + uv0
				end
			end
		end

		slot0.answer_scroll:setInnerContainerSize(cc.size(slot0.answer_scroll:getContentSize().width, math.max(slot0.answer_scroll:getContentSize().height, slot0:sunTotal(slot5))))

		slot9 = {}
		slot13 = slot4

		for slot13 = 1, tableLen(slot13) do
			if slot0.topic_layout[slot13] and slot0.touchSelect[slot13] then
				registerButtonEventListener(slot0.topic_layout[slot13], function ()
					if uv0 == QuestConst.single then
						if uv1.cur_tab ~= nil then
							uv1.cur_tab:setVisible(false)
						end

						uv1.cur_index = uv2
						uv1.cur_tab = uv1.touchSelect[uv1.cur_index]

						if uv1.cur_tab ~= nil then
							uv1.cur_tab:setVisible(true)
						end

						uv1.answer_ret_temp = uv3[uv2][1]
					elseif uv0 == QuestConst.multiple then
						if uv1.touchSelect[uv2]:isVisible() == true then
							slot3 = false

							uv1.touchSelect[uv2]:setVisible(slot3)

							for slot3 = #uv4, 1, -1 do
								if uv4[slot3] == uv3[uv2][1] then
									table.remove(uv4, slot3)
								end
							end
						else
							if tableLen(uv4) + 1 > 3 then
								uv1.touchSelect[uv2]:setVisible(false)
								message(TI18N("多选题最多只能选择3个哦"))

								return
							end

							uv1.touchSelect[uv2]:setVisible(true)
							table.insert(uv4, uv3[uv2][1])
						end

						uv1.answer_ret_temp = uv4
					end
				end, true, 1)
			end

			if slot0.topic_sprite[slot13] then
				slot0.topic_layout[slot13]:setVisible(true)
				slot0.topic_sprite[slot13]:setVisible(true)
				slot0.answer_label[slot13]:setVisible(true)
				slot0.topic_sprite[slot13]:loadTexture(slot2 == QuestConst.single and PathTool.getResFrame("common", "common_1030") or PathTool.getResFrame("common", "common_1044"), LOADTEXT_TYPE_PLIST)
				slot0.answer_label[slot13]:setString(slot4[slot13][2])

				if slot6 then
					if math.ceil(slot13 / 2) == 1 then
						if math.fmod(slot13, 2) == 1 then
							slot0.topic_sprite[slot13]:setPosition(cc.p(20, slot0.answer_scroll:getInnerContainerSize().height - 30))
						else
							slot0.topic_sprite[slot13]:setPosition(cc.p(260, slot0.answer_scroll:getInnerContainerSize().height - 30))
						end
					elseif math.fmod(slot13, 2) == 1 then
						slot0.topic_sprite[slot13]:setPosition(cc.p(20, slot0.topic_sprite[slot13 - 1]:getPositionY() - slot0.answer_label[slot13 - 1]:getContentSize().height - uv0))
					else
						slot0.topic_sprite[slot13]:setPosition(cc.p(260, slot0.topic_sprite[slot13 - 1]:getPositionY()))
					end
				elseif slot13 == 1 then
					slot0.topic_sprite[slot13]:setPosition(cc.p(20, slot0.answer_scroll:getInnerContainerSize().height - 30))
				else
					slot0.topic_sprite[slot13]:setPosition(cc.p(20, slot0.topic_sprite[slot13 - 1]:getPositionY() - slot0.answer_label[slot13 - 1]:getContentSize().height - uv0))
				end
			end
		end
	end
end

function SureveyQuestWindow.getStringCharCount(slot0, slot1)
	slot3 = 0
	slot4 = 1

	while #slot1 >= slot4 do
		slot6 = 1
		slot6 = string.byte(slot1, slot4) > 239 and 4 or slot5 > 223 and 3 or slot5 > 128 and 2 or 1
		slot7 = string.sub(slot1, slot4, slot4 + slot6 - 1)
		slot4 = slot4 + slot6
		slot3 = slot3 + 1
	end

	return slot3
end

function SureveyQuestWindow.sunTotal(slot0, slot1)
	for slot6, slot7 in ipairs(slot1) do
		slot2 = 0 + slot7
	end

	return slot2
end

function SureveyQuestWindow.close_callback(slot0)
	if slot0.item_list and next(slot0.item_list or {}) ~= nil then
		for slot4, slot5 in ipairs(slot0.item_list) do
			if slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end
	end

	uv0:openSureveyQuestView(false)
end
