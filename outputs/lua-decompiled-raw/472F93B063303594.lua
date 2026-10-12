ActionHeroSkinResetPanel = ActionHeroSkinResetPanel or BaseClass(BaseView)
slot1 = ActionController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format

function ActionHeroSkinResetPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = false
	slot0.layout_name = "action/action_hero_skin_reset_panel"
	slot0.res_list = {}
end

function ActionHeroSkinResetPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.title = slot0.main_container:getChildByName("win_title")

	slot0.title:setString(TI18N("皮肤置换"))

	slot0.left_btn = slot0.main_container:getChildByName("left_btn")

	slot0.left_btn:getChildByName("label"):setString(TI18N("取 消"))

	slot0.right_btn = slot0.main_container:getChildByName("right_btn")
	slot0.right_btn_lab = slot0.right_btn:getChildByName("label")

	setChildUnEnabled(true, slot0.right_btn)
	slot0.right_btn_lab:disableEffect(cc.LabelEffect.OUTLINE)
	slot0.right_btn:setTouchEnabled(false)

	slot0.timer = 5

	slot0.right_btn_lab:setString(string.format("%s(%s)", TI18N("确认消耗"), slot0.timer))
	slot0:showAutoBtnTimer()

	slot0.one_box = slot0.main_container:getChildByName("one_box")

	slot0.one_box:setSelected(false)

	slot0.two_box = slot0.main_container:getChildByName("two_box")

	slot0.two_box:setSelected(false)

	slot0.left_item_1 = BackPackItem.new(true, true, nil, , , true)

	slot0.left_item_1:setAnchorPoint(0.5, 0.5)
	slot0.left_item_1:setPosition(slot0.main_container:getContentSize().width / 2 - 130, 440)
	slot0.main_container:addChild(slot0.left_item_1)

	slot0.right_item_1 = BackPackItem.new(true, true, nil, , , true)

	slot0.right_item_1:setAnchorPoint(0.5, 0.5)
	slot0.right_item_1:setPosition(slot0.main_container:getContentSize().width / 2 + 170, 440)
	slot0.main_container:addChild(slot0.right_item_1)

	slot0.left_item_2 = BackPackItem.new(true, true, nil, , , true)

	slot0.left_item_2:setAnchorPoint(0.5, 0.5)
	slot0.left_item_2:setPosition(slot0.main_container:getContentSize().width / 2 - 130, 304)
	slot0.main_container:addChild(slot0.left_item_2)

	slot0.right_item_2 = BackPackItem.new(true, true, nil, , , true)

	slot0.right_item_2:setAnchorPoint(0.5, 0.5)
	slot0.right_item_2:setPosition(slot0.main_container:getContentSize().width / 2 + 170, 304)
	slot0.main_container:addChild(slot0.right_item_2)

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.tips_text = createRichLabel(24, cc.c4b(100, 50, 35, 255), cc.p(0.5, 0.5), cc.p(slot0.main_container:getContentSize().width / 2, 200), nil, , 600)

	slot0.main_container:addChild(slot0.tips_text)
	slot0:updateTipsText()
end

function ActionHeroSkinResetPanel.updateTipsText(slot0)
	slot1 = ""
	slot3 = 0
	slot4 = Config.PartnerData.data_partner_const.reborn_skin_id

	if slot0.one_box:isSelected() == true and slot4 then
		if Config.ItemData.data_get_data(slot4.val[1][2]) then
			slot1 = slot5.name
			slot2 = 0 + 1
		end

		slot7 = BackpackController:getInstance():getModel():getItemNumByBid(slot4.val[1][2])

		if HeroController:getModel():getHeroSkinInfoBySkinID(slot4.val[1][1]) == 0 then
			slot3 = slot3 + 1
		end

		if slot7 and slot7 > 0 then
			slot3 = slot3 + slot7
		end
	end

	if slot0.two_box:isSelected() == true and slot4 then
		if Config.ItemData.data_get_data(slot4.val[2][2]) then
			slot1 = (slot1 ~= "" or slot5.name) and slot1 .. "、" .. slot5.name
			slot2 = slot2 + 1
		end

		slot7 = BackpackController:getInstance():getModel():getItemNumByBid(slot4.val[2][2])

		if HeroController:getModel():getHeroSkinInfoBySkinID(slot4.val[2][1]) == 0 then
			slot3 = slot3 + 1
		end

		if slot7 and slot7 > 0 then
			slot3 = slot3 + slot7
		end
	end

	slot5 = ""

	if slot1 == "" then
		slot5 = TI18N("请先<div fontcolor=#D95014>勾选</div>想要参与置换的皮肤\n          并获得自选皮肤礼盒")
	else
		slot6 = ""

		if Config.PartnerData.data_partner_const.reborn_skin_reward and Config.ItemData.data_get_data(slot7.val) then
			slot6 = slot8.name
		end

		slot8 = "\n                 并获取"

		if slot2 >= 2 then
			slot8 = "\n                                  并获取"
		end

		slot5 = uv0(TI18N("是否确认<div fontcolor=#D95014>消耗</div>所有<div fontcolor=#D95014>%s</div>皮肤%s<div fontcolor=#D95014>%s*%d</div>"), slot1, slot8, slot6, slot3)
	end

	slot0.tips_text:setString(slot5)
end

function ActionHeroSkinResetPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0._onClickBtnClose), false, 1)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0._onClickBtnClose), true, 1)
	registerButtonEventListener(slot0.left_btn, handler(slot0, slot0._onClickBtnClose), true, 2)
	registerButtonEventListener(slot0.right_btn, handler(slot0, slot0._onClickBtnRight), true, 2)
	slot0.one_box:addEventListener(function (slot0, slot1)
		if slot1 == ccui.CheckBoxEventType.selected then
			if Config.PartnerData.data_partner_const.reborn_skin_id then
				if HeroController:getModel():getHeroSkinInfoBySkinID(slot2.val[1][1]) == 0 or BackpackController:getInstance():getModel():getItemNumByBid(slot2.val[1][2]) > 0 then
					uv0:updateTipsText()

					return
				end
			end

			message(TI18N("该皮肤未拥有"))
			uv0.one_box:setSelected(false)
			uv0:updateTipsText()
		elseif slot1 == ccui.CheckBoxEventType.unselected then
			uv0:updateTipsText()
		end
	end)
	slot0.two_box:addEventListener(function (slot0, slot1)
		if slot1 == ccui.CheckBoxEventType.selected then
			if Config.PartnerData.data_partner_const.reborn_skin_id then
				if HeroController:getModel():getHeroSkinInfoBySkinID(slot2.val[2][1]) == 0 or BackpackController:getInstance():getModel():getItemNumByBid(slot2.val[2][2]) > 0 then
					uv0:updateTipsText()

					return
				end
			end

			message(TI18N("该皮肤未拥有"))
			uv0.two_box:setSelected(false)
			uv0:updateTipsText()
		elseif slot1 == ccui.CheckBoxEventType.unselected then
			uv0:updateTipsText()
		end
	end)
end

function ActionHeroSkinResetPanel._onClickBtnClose(slot0)
	uv0:openActionHeroSkinResetPanel(false)
end

function ActionHeroSkinResetPanel._onClickBtnRight(slot0)
	if slot0.one_box:isSelected() == true and Config.PartnerData.data_partner_const.reborn_skin_id then
		uv0({}, {
			skin_ids = slot2.val[1][1]
		})
	end

	if slot0.two_box:isSelected() == true and Config.PartnerData.data_partner_const.reborn_skin_id then
		uv0(slot1, {
			skin_ids = slot2.val[2][1]
		})
	end

	if #slot1 <= 0 then
		message(TI18N("选择需要消耗的皮肤"))

		return
	end

	uv1:sender11074(slot1)
	slot0:_onClickBtnClose()
end

function ActionHeroSkinResetPanel.openRootWnd(slot0)
	slot0:setData()
end

function ActionHeroSkinResetPanel.setData(slot0)
	if Config.PartnerData.data_partner_const.reborn_skin_id then
		slot2 = {}

		slot0.left_item_1:setData(deepCopy(Config.ItemData.data_get_data(slot1.val[1][2])))

		slot3 = {}

		slot0.left_item_2:setData(deepCopy(Config.ItemData.data_get_data(slot1.val[2][2])))
	end

	if Config.PartnerData.data_partner_const.reborn_skin_reward then
		slot3 = {}
		slot3 = deepCopy(Config.ItemData.data_get_data(slot2.val))

		slot0.right_item_1:setData(slot3)
		slot0.right_item_2:setData(slot3)
	end

	if Config.PartnerData.data_partner_const.reborn_skin_id then
		if HeroController:getModel():getHeroSkinInfoBySkinID(slot3.val[1][1]) ~= 0 and BackpackController:getInstance():getModel():getItemNumByBid(slot3.val[1][2]) <= 0 then
			slot0.left_item_1:grayStatus(true, 150, TI18N("未拥有"))
		else
			slot0.left_item_1:grayStatus(false)
		end

		if HeroController:getModel():getHeroSkinInfoBySkinID(slot3.val[2][1]) ~= 0 and BackpackController:getInstance():getModel():getItemNumByBid(slot3.val[2][2]) <= 0 then
			slot0.left_item_2:grayStatus(true, 150, TI18N("未拥有"))
		else
			slot0.left_item_2:grayStatus(false)
		end
	end
end

function ActionHeroSkinResetPanel.showAutoBtnTimer(slot0)
	if not slot0.timer then
		return
	end

	slot0.timer_id = GlobalTimeTicket:getInstance():add(function ()
		if uv0.timer > 1 then
			uv0.timer = uv0.timer - 1

			uv0.right_btn_lab:setString(string.format("%s(%s)", TI18N("确认消耗"), uv0.timer))
		else
			uv0.right_btn_lab:setString(TI18N("确认消耗"))
			setChildUnEnabled(false, uv0.right_btn)
			uv0.right_btn:setTouchEnabled(true)
			uv0.right_btn_lab:enableOutline(Config.ColorData.data_color4[264], 2)
		end
	end, 1, slot0.timer)
end

function ActionHeroSkinResetPanel.close_callback(slot0)
	if slot0.timer_id then
		GlobalTimeTicket:getInstance():remove(slot0.timer_id)
	end

	if slot0.left_item_1 then
		slot0.left_item_1:DeleteMe()
	end

	slot0.left_item_1 = nil

	if slot0.right_item_1 then
		slot0.right_item_1:DeleteMe()
	end

	slot0.right_item_1 = nil

	if slot0.left_item_2 then
		slot0.left_item_2:DeleteMe()
	end

	slot0.left_item_2 = nil

	if slot0.right_item_2 then
		slot0.right_item_2:DeleteMe()
	end

	slot0.right_item_2 = nil

	uv0:openActionHeroSkinResetPanel(false)
end
