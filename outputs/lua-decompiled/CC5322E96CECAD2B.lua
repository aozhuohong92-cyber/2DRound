ActionyearmonsterSubmitPanel = ActionyearmonsterSubmitPanel or BaseClass(BaseView)
slot1 = ActionyearmonsterController:getInstance():getModel()
slot2 = string.format
slot3 = table.sort
slot4 = table.insert
slot5 = table.remove

function ActionyearmonsterSubmitPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.is_full_screen = false
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("actionyearmonster", "actionyearmonster_ch"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/actionyearmonster", "actionyearmonster_submit_bg"),
			type = ResourcesType.single
		}
	}
	slot0.layout_name = "actionyearmonster/actionyearmonster_submit_panel"
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.holiday_nian_tribute_id = 80351

	if Config.HolidayNianData.data_const.holiday_nian_tribute_id then
		slot0.holiday_nian_tribute_id = slot1.val
	end

	slot0.vertical_array = Array.New()
	slot0.have_count = 0
end

function ActionyearmonsterSubmitPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale() or 1)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.panel_bg = slot0.main_panel:getChildByName("panel_bg")

	loadSpriteTexture(slot0.panel_bg, PathTool.getPlistImgForDownLoad("bigbg/actionyearmonster", "actionyearmonster_submit_bg"), LOADTEXT_TYPE)

	slot0.title = slot0.main_panel:getChildByName("win_title")

	slot0.title:setString(TI18N("凶狠的年兽"))

	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.rule_btn = slot0.main_panel:getChildByName("rule_btn")
	slot0.item_btn = slot0.main_panel:getChildByName("item_btn")
	slot0.item_icon = slot0.item_btn:getChildByName("img")

	slot0.item_icon:setScale(0.9)

	slot0.item_count = slot0.item_btn:getChildByName("count")
	slot0.item_config = Config.ItemData.data_get_data(slot0.holiday_nian_tribute_id)

	if slot0.item_config then
		loadSpriteTexture(slot0.item_icon, PathTool.getItemRes(slot0.item_config.icon), LOADTEXT_TYPE)
	end

	slot0.challenge_btn = slot0.main_container:getChildByName("challenge_btn")

	slot0.challenge_btn:getChildByName("label"):setString(TI18N("提交贡品"))

	slot3 = slot0.main_container:getChildByName("progress_container")
	slot0.progress_container = slot3
	slot0.progress = slot3:getChildByName("progress")
	slot0.hp_value = slot3:getChildByName("hp_value")

	if Config.HolidayNianData.data_redbag_progress and next(slot5) ~= nil then
		slot0.box_list = {}

		uv0(slot5, function (slot0, slot1)
			return slot0 < slot1
		end)

		slot6 = slot5[#slot5]
		slot0.max_num = slot6
		slot7 = slot3:getContentSize().width / slot6

		for slot11, slot12 in ipairs(slot5) do
			if slot11 >= #slot5 then
				break
			end

			slot14 = slot7 * slot12 - 5
			slot0.box_list[slot11] = {
				sprite = createSprite(PathTool.getResFrame("actionyearmonster_ch", "actionyearmonster_ch_13"), slot14, 23, slot3, cc.p(0.5, 0.5)),
				lable = createLabel(22, cc.c4b(255, 234, 171, 255), cc.c4b(159, 48, 27, 255), slot14, -10, slot12, slot3, 2, cc.p(0.5, 0.5)),
				per = slot12 * 100 / slot6,
				is_show_redbag = false
			}
		end
	end

	slot0.tips = slot0.main_container:getChildByName("tips")

	slot0.tips:setString(TI18N("全服收集提交贡品, 召唤限时年兽和红包雨"))
end

function ActionyearmonsterSubmitPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickCloseBtn), false, 1)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), true, 2)
	registerButtonEventListener(slot0.rule_btn, handler(slot0, slot0.onClickRuleBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.challenge_btn, handler(slot0, slot0.onClickChallengeBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	slot0:addGlobalEvent(ActionyearmonsterEvent.Year_Submit_item_Event, function (slot0)
		uv0:showEffect(true, "eating")
	end)
	slot0:addGlobalEvent(ActionyearmonsterEvent.YEAR_MONSTER_BASE_INFO, function (slot0)
		uv0:updateShowMoveVertical(slot0)

		uv0.base_data = slot0

		uv0:updateProgress()
		uv0:updateItemCount()
	end)

	if slot0.role_assets_event == nil and slot0.role_vo then
		slot0.role_assets_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ACTION_ASSETS, function (slot0, slot1)
			if slot0 == uv0.holiday_nian_tribute_id then
				uv0:updateItemCount()
			end
		end)
	end
end

function ActionyearmonsterSubmitPanel.onClickCloseBtn(slot0)
	uv0:openActionyearmonsterSubmitPanel(false)
end

function ActionyearmonsterSubmitPanel.onClickItemBtn(slot0)
end

function ActionyearmonsterSubmitPanel.onClickChallengeBtn(slot0)
	if not slot0.base_data then
		return
	end

	if not slot0.role_vo then
		return
	end

	if slot0.base_data.max_val - slot0.base_data.val == 0 then
		message(TI18N("年兽已召唤, 请在年兽沉睡后再试"))

		return
	end

	if slot1 < slot0.role_vo:getActionAssetsNumByBid(slot0.holiday_nian_tribute_id) then
		slot2 = slot1
	end

	if slot2 == 0 then
		if slot0.item_config then
			message(slot0.item_config.name .. TI18N("数量不足!"))
		else
			message(TI18N("贡品数量不足!"))
		end

		return
	end

	slot0.have_count = slot2

	uv0:sender28211(slot2)
end

function ActionyearmonsterSubmitPanel.updateItemCount(slot0)
	if slot0.role_vo then
		slot0.item_count:setString("x" .. slot0.role_vo:getActionAssetsNumByBid(slot0.holiday_nian_tribute_id))

		if slot0.base_data and slot0.base_data.val < slot0.base_data.max_val and slot1 > 0 then
			addRedPointToNodeByStatus(slot0.challenge_btn, true, 0, 5)
		else
			addRedPointToNodeByStatus(slot0.challenge_btn, false, 0, 5)
		end
	else
		slot0.item_count:setString("x0")
	end
end

function ActionyearmonsterSubmitPanel.openRootWnd(slot0, slot1)
	slot0.base_data = (slot1 or {}).base_data

	if not slot0.base_data then
		return
	end

	slot0:updateProgress()
	slot0:updateItemCount()

	if slot0.base_data.max_val <= slot0.base_data.val then
		slot0:showEffect(true, PlayerAction.stand)
		slot0.tips:setString(TI18N("限时年兽已苏醒，前往挑战获取丰厚奖励！"))
	else
		slot0:showEffect(true)
		slot0.tips:setString(TI18N("全服收集提交贡品, 召唤限时年兽和红包雨"))
	end
end

function ActionyearmonsterSubmitPanel.onClickRuleBtn(slot0, slot1, slot2, slot3)
	if Config.HolidayNianData.data_const.holiday_nian_tribute_desc then
		TipsManager:getInstance():showCommonTips(slot4.desc, slot2:getTouchBeganPosition())
	end
end

function ActionyearmonsterSubmitPanel.updateProgress(slot0)
	if not slot0.base_data then
		return
	end

	slot0.progress:setPercent(slot0.base_data.val * 100 / slot0.base_data.max_val)
	slot0.hp_value:setString(uv0("%s/%s", slot0.base_data.val, slot0.base_data.max_val))

	if slot0.is_init_per == nil then
		slot0.is_init_per = true

		for slot5, slot6 in ipairs(slot0.box_list) do
			slot6.lable:setString(math.floor(slot0.base_data.max_val * slot6.per / 100))

			if slot6.per < slot1 then
				slot6.is_show_redbag = true
			else
				slot6.lable:disableEffect(cc.LabelEffect.OUTLINE)
				setChildUnEnabled(true, slot6.lable)
				setChildUnEnabled(true, slot6.sprite)
			end
		end
	else
		for slot5, slot6 in ipairs(slot0.box_list) do
			if slot6.per < slot1 and not slot6.is_show_redbag then
				slot6.is_show_redbag = true

				slot6.lable:disableEffect(cc.LabelEffect.OUTLINE)
				slot6.lable:enableOutline(cc.c4b(100, 50, 35, 255), 2)
				setChildUnEnabled(false, slot6.lable)
				setChildUnEnabled(false, slot6.sprite)
			end
		end
	end
end

function ActionyearmonsterSubmitPanel.showEffect(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.play_effect == nil then
			slot0.play_effect = createEffectSpine("E28002", cc.p(347, 467), cc.p(0.5, 0.5), true, slot2 or "sleeping", function ()
				uv0:endEffect()
			end)

			slot0.main_container:addChild(slot0.play_effect, 1)
		elseif slot3 == "eating" then
			slot0.is_show_eat = true

			slot0.play_effect:setAnimation(0, slot3, false)
		else
			slot0.play_effect:setAnimation(0, slot3, true)
		end
	elseif slot0.play_effect then
		slot0.play_effect:setVisible(false)
		slot0.play_effect:removeFromParent()

		slot0.play_effect = nil
	end
end

function ActionyearmonsterSubmitPanel.endEffect(slot0)
	if slot0.is_show_eat then
		slot0.is_show_eat = false

		slot0:showEffect(true)
	end
end

function ActionyearmonsterSubmitPanel.updateShowMoveVertical(slot0, slot1)
	if slot0.base_data then
		slot2 = ""

		if slot0.item_config then
			slot2 = slot0.item_config.name
		end

		slot9 = "进度值<div fontcolor=#84e766 fontsize=22 >+%s</div>"
		slot8 = slot1.val - slot0.base_data.val

		for slot8, slot9 in pairs({
			uv0(TI18N("消耗<div fontcolor=#ff91f6 fontsize=22 >%s</div>×%d"), slot2, slot0.have_count),
			uv0(TI18N(slot9), slot8)
		}) do
			slot0:showMoveVertical(slot9)
		end

		slot0:crateLabelEffect(slot3)
	end
end

function ActionyearmonsterSubmitPanel.crateLabelEffect(slot0, slot1)
	if slot0.label_list == nil then
		slot0.label_list = {}
	end

	slot2 = nil

	if #slot0.label_list > 0 then
		slot2 = uv0(slot0.label_list)

		slot2:setVisible(true)
		slot2:setString("+" .. slot1)
	else
		slot2 = createLabel(50, cc.c4b(255, 207, 60, 255), cc.c4b(176, 53, 10, 255), 0, 0, "+" .. slot1, slot0.progress_container, 2, cc.p(0.5, 0.5), "fonts/title.ttf")
	end

	if slot2 then
		slot2:setPosition(210, 20)
		slot2:setOpacity(0)
		slot2:runAction(cc.Spawn:create(cc.EaseSineOut:create(cc.MoveTo:create(0.8, cc.p(210, 53))), cc.Sequence:create(cc.FadeIn:create(0.2), cc.DelayTime:create(0.5), cc.FadeOut:create(0.5), cc.CallFunc:create(function ()
			uv0:setVisible(false)
			uv1(uv2.label_list, uv0)
		end))))
	end
end

function ActionyearmonsterSubmitPanel.showMoveVertical(slot0, slot1)
	slot2 = slot0.main_container

	if string.len(slot1) == 0 then
		return
	end

	slot3 = ccui.Widget:create()

	slot3:setCascadeOpacityEnabled(true)
	slot3:setAnchorPoint(cc.p(0.5, 0))
	slot2:addChild(slot3, 10)

	slot4 = createScale9Sprite(PathTool.getResFrame("actionyearmonster_ch", "actionyearmonster_ch_19"))

	slot4:setScale9Enabled(true)
	slot4:setContentSize(cc.size(258, 44))

	slot3.image = slot4

	slot3:addChild(slot4)

	slot6 = slot0:createhorizontalLabel(uv0("<div fontcolor=#ffd473 fontsize=22 >%s</div>", slot1), Config.ColorData.data_color3[1], 258, 22)

	slot6:setAnchorPoint(0.5, 0.5)
	slot3:addChild(slot6)

	slot10 = cc.size(258, math.max(slot6:getSize().height + 20, slot4:getContentSize().height))

	slot3:setContentSize(slot10)
	slot4:setPosition(cc.p(slot10.width / 2, slot10.height / 2))
	slot6:setPosition(cc.p(slot10.width / 2, slot10.height / 2))

	function slot11()
		doRemoveFromParent(uv0.vertical_array:PopFront().item)
	end

	slot12 = 2

	slot0.vertical_array:PushBack({
		msg = slot1,
		delay_time = slot12,
		item = slot3
	})
	slot0:sortPosition()
	delayRun(slot3.image, slot12, function ()
		uv0()
	end)
end

function ActionyearmonsterSubmitPanel.createhorizontalLabel(slot0, slot1, slot2, slot3, slot4)
	slot6 = createRichLabel(slot4, slot2 or Config.ColorData.data_color3[2], cc.p(0, 1), cc.p(0, 0), 0, 0, slot3)

	slot6:setString(slot1)

	return slot6
end

function ActionyearmonsterSubmitPanel.sortPosition(slot0)
	slot1 = 0
	slot2 = 0

	if slot0.vertical_array:GetSize() > 0 then
		slot4 = slot0.main_container:getContentSize().height / 10 * 7
		slot5 = SCREEN_WIDTH / 2
		slot6 = slot0.vertical_array:Get(slot3 - 1).item:getContentSize().height
		slot7 = nil

		for slot11 = slot0.vertical_array:GetSize(), 1, -1 do
			if tolua.isnull(slot0.vertical_array:Get(slot11 - 1).item) then
				return
			end

			doStopAllActions(slot13)

			if slot3 == slot11 then
				slot13:setPosition(cc.p(slot5, slot4))

				slot7 = slot4 + slot13:getContentSize().height + slot11 * 3
			else
				slot13:setPosition(cc.p(slot5, slot7))

				slot7 = slot7 + slot13:getContentSize().height + slot11 * 3
			end

			slot13.action = slot13:runAction(cc.MoveBy:create(0.5, cc.p(0, slot6)))
		end
	end
end

function ActionyearmonsterSubmitPanel.close_callback(slot0)
	slot0:showEffect(false)

	if slot0.role_vo ~= nil and slot0.role_assets_event ~= nil then
		slot0.role_vo:UnBind(slot0.role_assets_event)

		slot0.role_assets_event = nil
	end

	uv0:openActionyearmonsterSubmitPanel(false)
end
