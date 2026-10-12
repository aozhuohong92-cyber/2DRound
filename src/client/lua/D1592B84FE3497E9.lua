ActiontermbeginsFightResultPanel = ActiontermbeginsFightResultPanel or BaseClass(BaseView)
slot0 = ActiontermbeginsController:getInstance()
slot1 = ActiontermbeginsController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert

function ActiontermbeginsFightResultPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Tips
	slot0.is_full_screen = false
	slot0.effect_cache_list = {}
	slot0.layout_name = "actiontermbegins/action_term_begins_fight_result_panel"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("guildboss", "guildboss"),
			type = ResourcesType.plist
		}
	}
	slot0.fight_type = BattleConst.Fight_Type.GuildDun
end

function ActiontermbeginsFightResultPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")
	slot0.title_container = slot0.root_wnd:getChildByName("title_container")
	slot0.title_width = slot0.title_container:getContentSize().width
	slot0.title_height = slot0.title_container:getContentSize().height
	slot0.harm_btn = slot1:getChildByName("harm_btn")

	slot0.harm_btn:setVisible(false)
	slot0.harm_btn:getChildByName("harm_lab"):setString(TI18N("数据统计"))

	slot0.partner_item = HeroExhibitionItem.new(1, false)

	slot0.partner_item:setPosition(560, 192)
	slot1:addChild(slot0.partner_item)

	slot0.dps_value = slot1:getChildByName("dps_value")
	slot0.container = slot1
	slot0.fight_text = createLabel(24, cc.c4b(255, 238, 172, 255), nil, 360, 380, "", slot0.container, nil, cc.p(0.5, 0.5))
	slot0.item_scrollview = slot0.container:getChildByName("item_scrollview")

	slot0.item_scrollview:setScrollBarEnabled(false)

	slot0.comfirm_btn = createButton(slot0.container, TI18N("确 定"), 620, 500, cc.size(162, 62), PathTool.getResFrame("common", "common_1017"), 24, Config.ColorData.data_color4[1])

	slot0.comfirm_btn:setPosition(slot0.container:getContentSize().width / 2 - 170, 42)
	slot0.comfirm_btn:enableOutline(Config.ColorData.data_color4[264], 2)
	slot0.comfirm_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:openActiontermbeginsFightResultPanel(false)
		end
	end)

	slot0.cancel_btn = createButton(slot0.container, TI18N("返回玩法"), 620, 500, cc.size(162, 62), PathTool.getResFrame("common", "common_1018"), 24, Config.ColorData.data_color4[1])

	slot0.cancel_btn:setPosition(slot0.container:getContentSize().width / 2 + 170, 42)
	slot0.cancel_btn:enableOutline(Config.ColorData.data_color4[263], 2)
	slot0.cancel_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if BaseView.winMap[#BaseView.winMap - 1] and slot2.layout_name == "actiontermbegins/action_term_begins_main_window" then
				uv0:openActiontermbeginsFightResultPanel(false)
			else
				MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.TermBegins, {
					index = 2
				})
			end
		end
	end)
end

function ActiontermbeginsFightResultPanel.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openActiontermbeginsFightResultPanel(false)
		end
	end)
	registerButtonEventListener(slot0.harm_btn, handler(slot0, slot0._onClickHarmBtn), true)
end

function ActiontermbeginsFightResultPanel._onClickHarmBtn(slot0)
	if slot0.data and next(slot0.data) ~= nil then
		BattleController:getInstance():openBattleHarmInfoView(true, slot0.data)
	end
end

function ActiontermbeginsFightResultPanel.openRootWnd(slot0, slot1, slot2)
	slot1 = slot1 or {}
	slot0.fight_type = BattleConst.Fight_Type.TermBeginsBoss

	if slot0.fight_text and Config.BattleBgData.data_fight_name[slot0.fight_type] then
		slot0.fight_text:setString(TI18N("当前战斗：") .. slot3)
	end

	slot0:handleEffect(true)

	if slot1 ~= nil then
		slot0.data = slot1

		slot0.dps_value:setString(string.format(TI18N("总伤害：%s"), slot1.all_dps))
		slot0.partner_item:setData(HeroController:getInstance():getModel():getHeroById(slot1.best_partner))
		slot0:createRewardsList(slot1.award_list)
		slot0.harm_btn:setVisible(true)
	end
end

function ActiontermbeginsFightResultPanel.createRewardsList(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot2 = {}

	for slot6, slot7 in ipairs(slot1) do
		uv0(slot2, {
			slot7.bid,
			slot7.num
		})
	end

	slot0.item_list = commonShowSingleRowItemList(slot0.item_scrollview, slot0.item_list, slot2, {
		scale = 0.75,
		max_count = 3
	})
end

function ActiontermbeginsFightResultPanel.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	elseif not tolua.isnull(slot0.title_container) and slot0.play_effect == nil then
		slot0.play_effect = createEffectSpine(PathTool.getEffectRes(103), cc.p(slot0.title_width * 0.5, slot0.title_height * 0.5), cc.p(0.5, 0.5), false, PlayerAction.action_2)

		slot0.title_container:addChild(slot0.play_effect, 1)
	end
end

function ActiontermbeginsFightResultPanel.close_callback(slot0)
	slot0.container:stopAllActions()

	if slot0.partner_item then
		slot0.partner_item:DeleteMe()

		slot0.partner_item = nil
	end

	slot0:handleEffect(false)
	uv0:openActiontermbeginsFightResultPanel(false)
end
