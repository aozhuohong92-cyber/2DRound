HomePetBaseInfoPanel = HomePetBaseInfoPanel or BaseClass(BaseView)
slot1 = HomepetController:getInstance():getModel()
slot2 = string.format

function HomePetBaseInfoPanel.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("homepet_travellingbag", "homepet_travellingbag"),
			type = ResourcesType.plist
		}
	}
	slot0.layout_name = "homepet/home_pet_base_info_panel"
	slot0.item_list = {}
	slot0.homepet_vo = uv0:getHomePetVo()
end

function HomePetBaseInfoPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot1 = slot0.main_container:getChildByName("main_panel")
	slot0.title = slot1:getChildByName("win_title")

	slot0.title:setString(TI18N("宠物详细"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.look_btn = slot1:getChildByName("look_btn")
	slot0.change_btn = slot0.main_container:getChildByName("change_btn")

	slot0.main_container:getChildByName("energy_key"):setString(TI18N("精力值:"))

	slot0.pet_name = slot0.main_container:getChildByName("pet_name")
	slot0.energy_value = slot0.main_container:getChildByName("energy_value")
	slot0.item_scrollview = slot0.main_container:getChildByName("item_scrollview")

	slot0.item_scrollview:setScrollBarEnabled(false)
	slot0.item_scrollview:setSwallowTouches(false)

	slot0.item_scrollview_size = slot0.item_scrollview:getContentSize()
	slot0.tips_panel = slot0.main_container:getChildByName("tips_panel")

	slot0.tips_panel:setZOrder(3)

	slot0.tips_panel_bg = slot0.tips_panel:getChildByName("bg")
	slot0.tips_panel_bg_size = slot0.tips_panel_bg:getContentSize()
	slot0.tips_time = slot0.tips_panel:getChildByName("time")

	slot0:onShowTipsPanel(false)

	slot0.dog_img = createSprite(nil, 152, 338, slot0.main_container, cc.p(0.5, 0.5))

	if slot0.dog_img and slot0.item_load_dog == nil then
		slot0.item_load_dog = loadSpriteTextureFromCDN(slot0.dog_img, PathTool.getPlistImgForDownLoad("bigbg/homepet", "home_pet_dog", false), ResourcesType.single, slot0.item_load_dog)
	end
end

function HomePetBaseInfoPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		if uv0.is_tips_show then
			uv0:onShowTipsPanel(false)
		else
			uv1:openHomePetBaseInfoPanel(false)
		end
	end, false, 2)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openHomePetBaseInfoPanel(false)
	end, true, 2)
	registerButtonEventListener(slot0.main_container, function ()
		uv0:onShowTipsPanel(false)
	end, false)
	registerButtonEventListener(slot0.look_btn, function ()
		uv0:onShowTipsPanel(true)
	end, true, 1)
	registerButtonEventListener(slot0.change_btn, function ()
		uv0:onChangeBtn()
	end, true, 1)

	if slot0.homepet_vo and slot0.home_pet_vo_attt_event == nil then
		slot0.home_pet_vo_attt_event = slot0.homepet_vo:Bind(HomepetEvent.HOME_PET_VO_ATTR_EVENT, function (slot0, slot1)
			if slot0 == "vigor" then
				uv0:updateVigor()
			elseif slot0 == "vigor_time" then
				uv0:updateVigorTime()
			elseif slot0 == "state" then
				uv0:updateVigorTime()
			end
		end)
	end
end

function HomePetBaseInfoPanel.onChangeBtn(slot0, slot1)
	if isQingmingShield and isQingmingShield() then
		return
	end

	if not slot0.homepet_vo then
		return
	end

	slot0.set_name_alert = CommonAlert.showInputApply(string.format(TI18N("<div fontcolor=#a95f0f>改名需消耗%s <img src=%s scale=0.3 visible=true /></div>"), Config.HomePetData.data_const.rename_cost.val, PathTool.getItemRes(Config.ItemData.data_get_data(Config.ItemData.data_assets_label2id.gold).icon)), TI18N("请输入名字(限制6字)"), TI18N("确 定"), function (slot0)
		if slot0 == nil or slot0 == "" then
			message(TI18N("名字不合法"))

			return
		end

		uv0:sender26102(string.gsub(slot0, "\n", ""))
	end, TI18N("取 消"), nil, true, nil, 20, CommonAlert.type.rich, FALSE, cc.size(270, 50), 12, {
		off_y = -15
	})

	slot0.set_name_alert.alert_txt:setPositionY(20)
	slot0.set_name_alert.line:setVisible(false)

	slot7 = createLabel(26, Config.ColorData.data_color4[175], nil, 75, 75, TI18N("名字："), slot0.set_name_alert.alert_panel)
end

function HomePetBaseInfoPanel.closeSetNameAlert(slot0)
	slot0.pet_name:setString(slot0.homepet_vo:getPetName())

	if slot0.set_name_alert then
		slot0.set_name_alert:close()

		slot0.set_name_alert = nil
	end
end

function HomePetBaseInfoPanel.openRootWnd(slot0, slot1)
	if not slot0.homepet_vo then
		return
	end

	slot2 = slot1 or {}

	slot0:updateList()
	slot0.pet_name:setString(slot0.homepet_vo:getPetName())
	slot0:updateVigor()
end

function HomePetBaseInfoPanel.updateVigor(slot0)
	slot2 = 100

	if Config.HomePetData.data_const.power_upper_limit then
		slot2 = slot1.val
	end

	slot3 = slot0.homepet_vo:getPetVigor()

	slot0.energy_value:setString(uv0("%s/%s", slot3, slot2))
	slot0:showProgress(true, slot3 * 100 / slot2)
end

function HomePetBaseInfoPanel.updateList(slot0)
	slot0.show_list = {
		{
			text = "性格：" .. Config.HomePetData.data_const.pet_character.desc
		},
		{
			text = "爱好：" .. Config.HomePetData.data_const.pet_interest.desc
		}
	}
	slot4 = Config.HomePetData.data_const.pet_story.desc
	slot0.show_list[3] = {
		text = "故事：\n　　" .. slot4
	}

	for slot4, slot5 in ipairs(slot0.item_list) do
		slot5:setVisible(false)
	end

	slot2 = 2
	slot3 = 10
	slot4 = 20

	for slot8 = 1, #slot0.show_list do
		slot9 = slot0.show_list[slot8]

		if slot0.item_list[slot8] == nil then
			slot0.item_list[slot8] = createRichLabel(24, cc.c4b(100, 50, 35, 255), cc.p(0, 1), cc.p(-10000, 0), 6, nil, 320)

			slot0.item_scrollview:addChild(slot0.item_list[slot8])
		else
			slot0.item_list[slot8]:setVisible(true)
		end

		slot0.item_list[slot8]:setString(slot9.text)

		slot9.y = slot3
		slot3 = slot3 + slot0.item_list[slot8]:getContentSize().height + slot4
	end

	slot10 = cc.size

	slot0.item_scrollview:setInnerContainerSize(slot10(slot0.item_scrollview_size.width, math.max(slot0.item_scrollview_size.height, slot3 - slot4)))

	for slot10 = 1, slot1 do
		slot0.item_list[slot10]:setPosition(slot2, slot6 - (slot0.show_list[slot10].y or 0))
	end

	if slot6 == slot0.item_scrollview_size.height then
		slot0.item_scrollview:setTouchEnabled(false)
	else
		slot0.item_scrollview:setTouchEnabled(true)
	end
end

function HomePetBaseInfoPanel.showProgress(slot0, slot1, slot2)
	if slot1 then
		if slot0.comp_bar == nil then
			slot0.comp_bar_bg, slot0.comp_bar = createLoadingBar(PathTool.getResFrame("common", "common_90005"), PathTool.getResFrame("common", "common_90006"), cc.size(240, 19), slot0.main_container, cc.p(0.5, 0.5), 155, 48, true, true)
		else
			slot0.comp_bar_bg:setVisible(true)
		end

		slot0.comp_bar:setPercent(slot2)
	elseif slot0.comp_bar_bg then
		slot0.comp_bar_bg:setVisible(false)
	end
end

function HomePetBaseInfoPanel.onShowTipsPanel(slot0, slot1)
	if not slot0.tips_panel then
		return
	end

	if slot1 then
		slot0.is_tips_show = true

		slot0.tips_panel:setPositionX(308)

		if slot0.tips_label == nil then
			slot0.tips_label = createRichLabel(20, cc.c4b(224, 191, 152, 255), cc.p(0, 1), cc.p(25, 220), nil, nil, 470)

			slot0.tips_panel:addChild(slot0.tips_label)

			if Config.HomePetData.data_const.pet_tips then
				slot0.tips_label:setString(slot3.desc)
			else
				slot0.tips_label:setString(TI18N("宠物tips说明"))
			end

			slot5 = slot0.tips_label:getContentSize()

			slot0.tips_panel_bg:setContentSize(cc.size(slot0.tips_panel_bg_size.width, slot0.tips_panel_bg_size.height - slot2 + slot5.height + 40))
			slot0.tips_time:setPositionY(slot2 - slot5.height - 20)
		end

		slot0:updateVigorTime()
	else
		slot0.is_tips_show = false

		slot0.tips_panel:setPositionX(-10000)
	end
end

function HomePetBaseInfoPanel.updateVigorTime(slot0)
	if slot0.is_tips_show and slot0.homepet_vo and slot0.tips_time then
		if Config.HomePetData.data_const.power_upper_limit and slot1.val <= slot0.homepet_vo:getPetVigor() then
			doStopAllActions(slot0.tips_time)
			slot0.tips_time:setString("精力值已满")

			return
		end

		if slot0.homepet_vo:getPetState() == HomepetConst.state_type.eNotActive or slot3 == HomepetConst.state_type.eOnWay then
			doStopAllActions(slot0.tips_time)
			slot0.tips_time:setString("萌宠出行时，精力值不自动恢复。")

			return
		end

		commonCountDownTime(slot0.tips_time, slot0.homepet_vo:getPetVigorTime(), {
			callback = function (slot0)
				uv0:setTimeFormatString(slot0)
			end
		})
	end
end

function HomePetBaseInfoPanel.setTimeFormatString(slot0, slot1)
	if not slot0.tips_time then
		return
	end

	if slot1 < 0 then
		slot0.tips_time:setString(TI18N("精力值恢复: 00:00"))
	else
		slot0.tips_time:setString(TI18N("精力值恢复: " .. TimeTool.GetTimeForFunction(slot1)))
	end
end

function HomePetBaseInfoPanel.showPetSpine(slot0, slot1)
	if slot1 then
		if slot0.pet_spine == nil then
			slot0.main_container:addChild(slot0.pet_spine, 1)
		end
	elseif slot0.pet_spine then
		slot0.pet_spine = nil
	end
end

function HomePetBaseInfoPanel.close_callback(slot0)
	if slot0.item_load_dog then
		slot0.item_load_dog:DeleteMe()

		item_load_dog = nil
	end

	if slot0.homepet_vo then
		if slot0.home_pet_vo_attt_event ~= nil then
			slot0.homepet_vo:UnBind(slot0.home_pet_vo_attt_event)

			slot0.home_pet_vo_attt_event = nil
		end

		slot0.homepet_vo = nil
	end

	doStopAllActions(slot0.tips_time)
	uv0:openHomePetBaseInfoPanel(false)
end
