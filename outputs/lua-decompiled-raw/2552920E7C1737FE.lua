AdventureEvtAnswerWindow = AdventureEvtAnswerWindow or BaseClass(BaseView)
slot0 = AdventureController:getInstance()

function AdventureEvtAnswerWindow.__init(slot0, slot1)
	slot0.win_type = WinType.Mini
	slot0.data = slot1
	slot0.config = slot1.config
	slot0.layout_name = "adventure/adventure_evt_answer_view"
	slot0.is_full_screen = false
	slot0.is_use_csb = false
	slot0.item_list = {}
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("adventure", "adventure"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_25"),
			type = ResourcesType.single
		}
	}
	slot0.btn_list = {}
	slot0.str = ""
end

function AdventureEvtAnswerWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("root")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.start_container = slot0.main_container:getChildByName("start_container")
	slot0.role_bg = slot0.main_container:getChildByName("role_bg")

	loadSpriteTexture(slot0.role_bg, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_25"), LOADTEXT_TYPE)

	slot0.total_desc = slot0.main_container:getChildByName("total_desc")

	slot0.total_desc:setString(TI18N("全对奖励"))

	slot0.title_label = slot0.main_container:getChildByName("title_label")

	slot0.title_label:setString(TI18N("智力大乱斗"))

	slot0.this_desc = slot0.main_container:getChildByName("this_desc")

	slot0.this_desc:setString(TI18N("当前奖励"))

	slot0.item_container = slot0.main_container:getChildByName("item_container")
	slot0.base_reward_label = createRichLabel(24, 117, cc.p(0, 0.5), cc.p(315, 455), nil, , 500)

	slot0.main_container:addChild(slot0.base_reward_label)
	slot0.base_reward_label:setVisible(true)

	slot0.talk_bg = slot0.main_container:getChildByName("talk_bg")

	slot0:updatedata()
end

function AdventureEvtAnswerWindow.updatedata(slot0)
	if slot0.config then
		-- Nothing
	end
end

function AdventureEvtAnswerWindow.updateBackItem(slot0, slot1)
	if slot1 then
		slot2 = BackPackItem.Width * #slot1
		slot0.start_x = (slot0.item_container:getContentSize().width - (#slot1 * BackPackItem.Height + #slot1 * 5)) * 0.5

		for slot7, slot8 in ipairs(slot1) do
			if not slot0.item_list[slot7] then
				slot9 = BackPackItem.new(true, true)

				slot9:setAnchorPoint(cc.p(0, 0.5))

				slot0.item_list[slot7] = slot9

				slot0.item_container:addChild(slot9)
			end

			if slot0.item_list[slot7] then
				slot9:setBaseData(slot8.bid, slot8.num)
				slot9:setDefaultTip()
				slot9:setPosition(slot0.start_x + (slot7 - 1) * (BackPackItem.Width + 10), slot0.item_container:getContentSize().height / 2)
			end
		end
	end
end

function AdventureEvtAnswerWindow.register_event(slot0)
	if slot0.background then
		slot0.background:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				uv0:openAnswerView(false)
			end
		end)
	end

	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				uv0:openAnswerView(false)
			end
		end)
	end

	if not slot0.update_evt_answer then
		slot0.update_evt_answer = GlobalEvent:getInstance():Bind(AdventureEvent.Update_Evt_Answer_Info, function (slot0)
			uv0:updateAnswerData(slot0)
		end)
	end
end

function AdventureEvtAnswerWindow.updateAnswerData(slot0, slot1)
	slot0.answer_data = slot1
	slot0.cur_answer_bid = slot1.bid

	if slot1.now_items and next(slot1.now_items or {}) ~= nil then
		slot0.str = ""

		for slot5, slot6 in pairs(slot1.now_items) do
			if Config.ItemData.data_get_data(slot6.bid) then
				slot0.str = slot0.str .. string.format("<div><img src='%s' scale=0.4 /></div><div fontcolor=#ffce0c fontsize=26>%s   </div>", PathTool.getItemRes(Config.ItemData.data_get_data(slot6.bid).icon), slot6.num)
			end
		end
	end

	slot0.base_reward_label:setString(slot0.str)
	slot0:updateBackItem(slot1.max_items)

	if slot1.ret == 0 then
		slot0:updateNext()
	else
		slot0.main_container:runAction(cc.Sequence:create(cc.CallFunc:create(function ()
			if uv0.btn_list then
				for slot3, slot4 in ipairs(uv0.btn_list) do
					slot4.right:setVisible(false)
					slot4.fail:setVisible(false)

					if slot4 and slot4.index == uv1.sel_val then
						if uv1.ret == 1 then
							slot4.right:setVisible(true)
						else
							slot4.fail:setVisible(true)
						end
					elseif slot4 and slot4.index == uv1.right and uv1.ret == 2 then
						slot4.right:setVisible(true)
					end
				end
			end
		end), cc.DelayTime:create(1), cc.CallFunc:create(function ()
			if uv0.bid == 0 then
				uv1:openAnswerView(false)
				message(uv0.ret_msg)

				if uv0.ret_items and next(uv0.ret_items or {}) ~= nil then
					uv1:showGetItemTips(uv0.ret_items)
				end
			else
				uv2:updateNext()
			end
		end)))
	end
end

function AdventureEvtAnswerWindow.updateNext(slot0)
	if not slot0.answer_num then
		slot0.answer_num = createRichLabel(26, 175, cc.p(0, 1), cc.p(345, 960))

		slot0.main_container:addChild(slot0.answer_num)
	end

	if not slot0.answer_desc then
		slot0.answer_desc = createRichLabel(26, 175, cc.p(0, 1), cc.p(345, 920), nil, , 325)

		slot0.main_container:addChild(slot0.answer_desc)
	end

	if slot0.answer_num then
		slot0.answer_num:setString(TI18N("第") .. slot0.answer_data.num .. "/" .. slot0.answer_data.max .. TI18N("题"))
	end

	if slot0.answer_data.bid ~= 0 then
		if slot0.btn_list then
			for slot4, slot5 in ipairs(slot0.btn_list) do
				if slot5 then
					slot5:getRoot():setVisible(false)
				end
			end
		end

		slot0.answer_desc:setString(Config.AdventureData.data_adventure_answer[slot0.answer_data.bid].desc)

		slot3 = cc.size(290, 87)
		slot4 = 0

		if Config.AdventureData.data_adventure_kind_answer[slot0.answer_data.bid] then
			slot5 = {
				"a",
				"b",
				"c",
				"d"
			}
			slot6 = {
				[slot11] = slot2[slot5[slot11]]
			}

			for slot11 = 1, 4 do
				if slot2[slot5[slot11]] and string.len(slot2[slot5[slot11]]) > 0 then
					slot7 = 0 + 1
				end
			end

			slot8 = {
				"A ",
				"B ",
				"C ",
				"D "
			}

			for slot12 = 1, slot7 do
				if not slot0.btn_list[slot12] then
					slot13 = createButton(slot0.start_container, "", 0, 0, slot3, PathTool.getResFrame("common", "common_1029"), 26, Config.ColorData.data_color4[175], PathTool.getResFrame("common", "common_1020"))

					slot13:getRoot():setVisible(false)
					createSprite(PathTool.getResFrame("adventure", "adventure_50"), 55, slot3.height / 2, slot13:getRoot()):setVisible(true)

					slot13.name = createLabel(33, 175, nil, 89, 45, "", slot13:getRoot(), nil, cc.p(0, 0.5), "fonts/title.ttf")
					slot13.answer = createLabel(26, 175, nil, 120, 47, "", slot13:getRoot(), nil, cc.p(0, 0.5))
					slot17 = createSprite(PathTool.getResFrame("adventure", "adventure_54"), 240, slot3.height / 2, slot13:getRoot())

					slot17:setVisible(false)

					slot18 = createSprite(PathTool.getResFrame("adventure", "adventure_47"), 240, slot3.height / 2, slot13:getRoot())

					slot18:setVisible(false)

					slot13.fail = slot18
					slot13.right = slot17
					slot13.index = slot12
					slot0.btn_list[slot12] = slot13
				end

				if slot0.btn_list[slot12] then
					slot13:getRoot():setVisible(true)
					slot13.fail:setVisible(false)
					slot13.right:setVisible(false)
					slot13.name:setString(slot8[slot12])
					slot13.answer:setString(slot6[slot12])
					slot13:setPosition(155 + (slot3.width + 20) * ((slot12 - 1) % 2), 160 - (slot3.height + 20) * math.floor((slot12 - 1) / 2))

					if slot13 then
						slot13:addTouchEventListener(function (slot0, slot1)
							if slot1 == ccui.TouchEventType.ended and uv0.data then
								uv2:send20620(uv0.data.id, AdventureEvenHandleType.handle, {
									{
										type = 1,
										val = uv1.index
									}
								})
							end
						end, true)
					end
				end
			end
		end
	end
end

function AdventureEvtAnswerWindow.openRootWnd(slot0)
	if slot0.data then
		uv0:send20620(slot0.data.id, AdventureEvenHandleType.requst, {})
	end
end

function AdventureEvtAnswerWindow.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.item_list) do
		slot5:DeleteMe()
	end

	slot0.item_list = nil

	if slot0.update_evt_answer then
		GlobalEvent:getInstance():UnBind(slot0.update_evt_answer)

		slot0.update_evt_answer = nil
	end

	uv0:openAnswerView(false)
end
