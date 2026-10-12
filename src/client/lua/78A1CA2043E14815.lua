ActiontermbeginsPanel = class("ActiontermbeginsPanel", function ()
	return ccui.Widget:create()
end)

function ActiontermbeginsPanel.ctor(slot0, slot1, slot2)
	slot0.holiday_bid = slot1

	slot0:configUI()
	slot0:register_event()
end

function ActiontermbeginsPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("actiontermbegins/action_term_begins_panel"))

	slot0.root_wnd:setPosition(-40, -82)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot0.title_img = slot0.root_wnd:getChildByName("main_container"):getChildByName("title_img")

	if not slot0.item_load then
		slot0.item_load = createResourcesLoad(PathTool.getPlistImgForDownLoad("bigbg/termbegins", "action_term_begins_bg", true), ResourcesType.single, function ()
			if not tolua.isnull(uv0.title_img) then
				loadSpriteTexture(uv0.title_img, uv1, LOADTEXT_TYPE)
			end
		end, slot0.item_load)
	end

	slot0.item_scrollview = slot1:getChildByName("item_scrollview")

	slot0.item_scrollview:setScrollBarEnabled(false)

	if Config.HolidayTermBeginsData.data_const.action_pre_reward and not slot0.item_list then
		slot0.item_list = commonShowSingleRowItemList(slot0.item_scrollview, slot0.item_list, slot2.val, {
			scale = 0.9,
			max_count = 5,
			is_center = true,
			show_effect_id = 263
		})
	end

	slot0.time_title = slot1:getChildByName("time_title")

	slot0.time_title:setString(TI18N("活动时间:"))

	slot0.time_val = slot1:getChildByName("time_val")

	slot0.time_val:setString("")
	slot1:getChildByName("Text_1"):setString(TI18N("世界排名:"))
	slot1:getChildByName("Text_2"):setString(TI18N("捐献数量:"))
	slot1:getChildByName("Text_3"):setString(TI18N("击败怪物:"))

	slot0.fight_score_1 = slot1:getChildByName("fight_score_1")
	slot0.fight_score_2 = slot1:getChildByName("fight_score_2")
	slot0.fight_score_3 = slot1:getChildByName("fight_score_3")
	slot0.comfirm_btn = slot1:getChildByName("comfirm_btn")
	slot0.comfirm_label = slot0.comfirm_btn:getChildByName("label")

	slot0.comfirm_label:setString(TI18N("前往挑战"))
	ActiontermbeginsController:getInstance():sender26711()
	slot0:updateComfirmRedPoint(ActionController:getInstance():getHolidayAweradsStatus(slot0.holiday_bid))
end

function ActiontermbeginsPanel.register_event(slot0)
	if not slot0.update_action_even_event then
		slot0.update_action_even_event = GlobalEvent:getInstance():Bind(ActiontermbeginsEvent.ACTION_TERM_BEGINS_EVENT, function (slot0)
			if not slot0 then
				return
			end

			uv0:setData(slot0)
		end)
	end

	if not slot0.update_holiday_red_event then
		slot0.update_holiday_red_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_HOLIDAY_TAB_STATUS, function (slot0, slot1)
			uv0:updateComfirmRedPoint(slot1)
		end)
	end

	registerButtonEventListener(slot0.comfirm_btn, function ()
		uv0:onComfirmBtn()
	end, true, 2)
end

function ActiontermbeginsPanel.updateComfirmRedPoint(slot0, slot1)
	if not slot0.holiday_bid then
		return
	end

	if slot1 and slot1.bid == slot0.holiday_bid then
		if slot1.status then
			addRedPointToNodeByStatus(slot0.comfirm_btn, true, 5, 5)
		else
			addRedPointToNodeByStatus(slot0.comfirm_btn, false, 5, 5)
		end
	end
end

function ActiontermbeginsPanel.onComfirmBtn(slot0)
	MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.TermBegins)
end

function ActiontermbeginsPanel.setData(slot0, slot1)
	if slot1.rank == 0 then
		slot0.fight_score_1:setString(TI18N("暂无"))
	else
		slot0.fight_score_1:setString(string.format(TI18N("前%s%%"), slot1.rank))
	end

	slot0.fight_score_2:setString(slot1.count)
	slot0.fight_score_3:setString(slot1.order)

	if Config.HolidayTermBeginsData.data_round_info[slot1.round] then
		slot0.time_val:setString(slot2.action_time)
	end
end

function ActiontermbeginsPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function ActiontermbeginsPanel.DeleteMe(slot0)
	if slot0.update_action_even_event then
		GlobalEvent:getInstance():UnBind(slot0.update_action_even_event)

		slot0.update_action_even_event = nil
	end

	if slot0.update_holiday_red_event then
		GlobalEvent:getInstance():UnBind(slot0.update_holiday_red_event)

		slot0.update_holiday_red_event = nil
	end

	if slot0.item_list then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end

		slot0.item_list = nil
	end

	doStopAllActions(slot0.item_scrollview)

	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end
end
