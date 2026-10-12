AdventureEvtNpcView = AdventureEvtNpcView or BaseClass(BaseView)
slot0 = AdventureController:getInstance()

function AdventureEvtNpcView.__init(slot0, slot1)
	slot0.win_type = WinType.Big
	slot0.is_full_screen = false
	slot0.btn_list = {}
	slot0.data = slot1
	slot0.config = slot1.config
	slot0.is_use_csb = false
	slot0.layout_name = "adventure/adventure_evt_npc_view"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("adventure", "adventure"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_18"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_45"),
			type = ResourcesType.single
		}
	}
	slot0.title_str = TI18N("npc对话框")
	slot0.role_vo = RoleController:getInstance():getRoleVo()
end

function AdventureEvtNpcView.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("root")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.title_label = slot0.main_container:getChildByName("title_label")
	slot0.role_bg = slot0.main_container:getChildByName("role_bg")
	slot0.bg = slot0.main_container:getChildByName("bg")

	slot0.role_bg:setScale(0.75)
	slot0.role_bg:setPositionY(slot0.role_bg:getPositionY() - 20)
	loadSpriteTexture(slot0.role_bg, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_45"), LOADTEXT_TYPE)
	slot0.bg:loadTexture(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_18"), LOADTEXT_TYPE)

	slot0.tips_desc_label = createRichLabel(26, 175, cc.p(0.5, 1), cc.p(slot0.main_container:getContentSize().width / 2, 680), nil, , 610)

	slot0.main_container:addChild(slot0.tips_desc_label)
	slot0.tips_desc_label:setVisible(true)

	slot0.item_bg = slot0.main_container:getChildByName("item_bg")
end

function AdventureEvtNpcView.updateData(slot0, slot1)
	if slot0.config and slot1 then
		slot2 = Config.AdventureData.data_adventure_npc_data[slot1.evt_id][slot1.id]
		slot3 = cc.size(604, 87)
		slot4 = 0

		table.sort(slot2, function (slot0, slot1)
			return slot0.num < slot1.num
		end)

		if slot2 then
			slot0.tips_desc_label:setString(slot2[1].lable_desc)

			slot5 = {
				"a",
				"b",
				"c"
			}
			slot6 = {}
			slot7 = 0
			slot8 = {
				"",
				"",
				"",
				""
			}
			slot12 = slot2

			for slot12 = 1, tableLen(slot12) do
				if not slot0.btn_list[slot12] then
					slot13 = createButton(slot0.item_bg, "", 0, 0, slot3, PathTool.getResFrame("common", "common_1029"), 26, Config.ColorData.data_color4[175], PathTool.getResFrame("common", "common_1020"))

					slot13:getRoot():setVisible(false)

					slot14 = createSprite(PathTool.getResFrame("adventure", "adventure_54"), 520, slot3.height / 2, slot13:getRoot())

					slot14:setVisible(false)

					slot13.i = slot12
					slot13.tag = slot14
					slot0.btn_list[slot12] = slot13
				end

				if slot0.btn_list[slot12] then
					slot13:getRoot():setVisible(true)
					slot13:setBtnLabel(slot8[slot12] .. slot2[slot12].msg)
					slot13:setPosition(slot0.item_bg:getContentSize().width / 2, 230 - (slot3.height + 5) * math.floor(slot12 - 1))

					if slot13 then
						slot13:addTouchEventListener(function (slot0, slot1)
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
end

function AdventureEvtNpcView.register_event(slot0)
	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				uv0:openEvtViewByType(false)
			end
		end)
	end

	if not slot0.update_npc_info then
		slot0.update_npc_info = GlobalEvent:getInstance():Bind(AdventureEvent.Update_Evt_Npc_Info, function (slot0)
			uv0:updateData(slot0)
		end)
	end
end

function AdventureEvtNpcView.openRootWnd(slot0)
	if slot0.data then
		uv0:send20620(slot0.data.id, AdventureEvenHandleType.requst, {})
	end
end

function AdventureEvtNpcView.close_callback(slot0)
	if slot0.update_npc_info then
		GlobalEvent:getInstance():UnBind(slot0.update_npc_info)

		slot0.update_npc_info = nil
	end

	uv0:openEvtViewByType(false)
end
