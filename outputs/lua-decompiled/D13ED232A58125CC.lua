AdventureEvtOtherNpcWindow = AdventureEvtOtherNpcWindow or BaseClass(BaseView)
slot0 = AdventureController:getInstance()
slot1 = string.format

function AdventureEvtOtherNpcWindow.__init(slot0, slot1)
	slot0.win_type = WinType.Big
	slot0.data = slot1
	slot0.config = slot1.config
	slot0.layout_name = "adventure/adventure_evt_other_npc_view"
	slot0.is_full_screen = false
	slot0.item_list = {}
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("adventure", "adventure"),
			type = ResourcesType.plist
		}
	}
	slot0.btn_list = {}
end

function AdventureEvtOtherNpcWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 2)

	slot0.title_label = slot1:getChildByName("title_label")

	slot0.title_label:setString(TI18N("神秘事件"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.swap_desc_label = createRichLabel(24, 175, cc.p(0.5, 1), cc.p(360, 320), nil, nil, 610)

	slot1:addChild(slot0.swap_desc_label)

	slot0.item_bg = slot1:getChildByName("item_bg")
	slot0.container = slot1
end

function AdventureEvtOtherNpcWindow.register_event(slot0)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openEvtViewByType(false)
		end
	end)

	if not slot0.update_npc_info then
		slot0.update_npc_info = GlobalEvent:getInstance():Bind(AdventureEvent.Update_Evt_Npc_Info, function (slot0)
			uv0:updateAnswerData(slot0)
		end)
	end
end

function AdventureEvtOtherNpcWindow.openRootWnd(slot0)
	slot0:updatedata()

	if slot0.data then
		uv0:send20620(slot0.data.id, AdventureEvenHandleType.requst, {})
	end
end

function AdventureEvtOtherNpcWindow.updateAnswerData(slot0, slot1)
	if slot0.config and slot1 then
		if Config.AdventureData.data_adventure_npc_data[slot1.evt_id][slot1.id] == nil or next(slot2) == nil then
			return
		end

		slot3 = cc.size(604, 87)
		slot4 = 0

		table.sort(slot2, function (slot0, slot1)
			return slot0.num < slot1.num
		end)

		slot5 = Config.ItemData.data_get_data

		for slot9, slot10 in ipairs(slot2) do
			if slot9 == 1 then
				slot0.swap_desc_label:setString(slot10.lable_desc)
			end

			if not slot0.btn_list[slot9] then
				slot11 = createButton(slot0.item_bg, "", 0, 0, slot3, PathTool.getResFrame("common", "common_1029"), 26, Config.ColorData.data_color4[175], PathTool.getResFrame("common", "common_1020"))

				slot11:getRoot():setVisible(false)

				slot12 = createSprite(PathTool.getResFrame("adventure", "adventure_54"), 520, slot3.height / 2, slot11:getRoot())

				slot12:setVisible(false)

				slot11.i = slot9
				slot11.tag = slot12
				slot0.btn_list[slot9] = slot11
			end

			if slot0.btn_list[slot9] then
				slot11:getRoot():setVisible(true)

				slot12 = ""

				if slot10.lose then
					for slot16, slot17 in ipairs(slot10.lose) do
						if slot12 ~= "" then
							slot12 = slot12 .. ","
						end

						if slot5(slot17[1]) then
							slot12 = slot12 .. uv0("<img src='%s' scale=0.4 />  ", PathTool.getItemRes(slot20.icon)) .. slot17[2]
						end
					end

					if slot12 ~= "" then
						slot12 = uv0(TI18N("<div fontcolor=#a95f0f>(消耗 %s)</div>"), slot12)
					end
				end

				slot11:setRichText(slot10.msg .. "  " .. slot12, 24, 175)
				slot11:setPosition(slot0.item_bg:getContentSize().width / 2, 140 - (slot3.height + 5) * math.floor(slot9 - 1))

				if slot11 then
					slot11:addTouchEventListener(function (slot0, slot1)
						if slot1 == ccui.TouchEventType.began then
							if uv0.btn_list then
								for slot5, slot6 in ipairs(uv0.btn_list) do
									if slot6 then
										slot6.tag:setVisible(false)
									end
								end
							end
						elseif slot1 == ccui.TouchEventType.ended then
							if uv0.data then
								uv1.tag:setVisible(true)
								uv2:send20620(uv0.data.id, AdventureEvenHandleType.handle, {
									{
										type = 1,
										val = uv1.i
									}
								})
							end
						elseif slot1 == ccui.TouchEventType.canceled then
							uv1.tag:setVisible(false)
						end
					end, true)
				end
			end
		end
	end
end

function AdventureEvtOtherNpcWindow.updatedata(slot0)
	if slot0.config then
		slot0.swap_desc_label:setString(slot0.config.desc)
		slot0:createEffect(slot0.config.effect_str)
	end
end

function AdventureEvtOtherNpcWindow.createEffect(slot0, slot1)
	if slot1 ~= "" and not tolua.isnull(slot0.container) and slot0.box_effect == nil then
		slot0.box_effect = createEffectSpine(slot1, cc.p(353, 433), cc.p(0.5, 0.5), true, PlayerAction.action)

		slot0.box_effect:setScale(1.5)
		slot0.container:addChild(slot0.box_effect)
	end
end

function AdventureEvtOtherNpcWindow.close_callback(slot0)
	if slot0.update_npc_info then
		GlobalEvent:getInstance():UnBind(slot0.update_npc_info)

		slot0.update_npc_info = nil
	end

	uv0:openEvtViewByType(false)
end
