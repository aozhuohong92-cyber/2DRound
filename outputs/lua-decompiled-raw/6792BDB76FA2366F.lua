GuildsecretareaEndCrusadePanel = GuildsecretareaEndCrusadePanel or BaseClass(BaseView)
slot1 = GuildsecretareaController:getInstance():getModel()
slot2 = table.insert

function GuildsecretareaEndCrusadePanel.__init(slot0, slot1)
	slot0.win_type = WinType.Mini
	slot0.layout_name = "guildsecretarea/guildsecretarea_end_crusade_panel"
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("guildsecretarea_result", "guildsecretarea_result"),
			type = ResourcesType.plist
		}
	}
	slot0.result = slot1
	slot0.fight_type = BattleConst.Fight_Type.GuildSecretArea
end

function GuildsecretareaEndCrusadePanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot0.container, 2)

	slot0.container_size = slot0.container:getContentSize()
	slot0.fight_text = slot0.container:getChildByName("fight_text")
	slot0.pass_time = slot0.container:getChildByName("pass_time")
	slot0.comfirm_btn = slot0.container:getChildByName("comfirm_btn")

	slot0.comfirm_btn:getChildByName("label"):setString(TI18N("前往宝库"))

	slot0.cancel_btn = slot0.container:getChildByName("cancel_btn")

	slot0.cancel_btn:getChildByName("label"):setString(TI18N("取 消"))

	slot0.boss_icon = slot0.container:getChildByName("boss_icon")
	slot0.item_load_bg = loadSpriteTextureFromCDN(slot0.boss_icon, PathTool.getPlistImgForDownLoad("bigbg/guildsecretarea", "secret_area_result_bg", false), ResourcesType.single, slot0.item_load_bg)
	slot0.result_icon = slot0.container:getChildByName("result_icon")
	slot0.reward_panel = slot0.container:getChildByName("reward_panel")
	slot0.market_scroll_view = slot0.reward_panel:getChildByName("scroll_view")
	slot0.reward_panel_1 = slot0.container:getChildByName("reward_panel_1")

	slot0.reward_panel_1:getChildByName("title_name"):setString(TI18N("个人排名奖励"))

	slot0.scroll_view = slot0.reward_panel_1:getChildByName("scroll_view")

	if slot0.result == 1 then
		slot0.container:setPositionY(730)
		slot0.fight_text:setString((Config.BattleBgData.data_fight_name[slot0.fight_type] or TI18N("公会秘境")) .. TI18N("讨伐成功!"))
		loadSpriteTexture(slot0.result_icon, PathTool.getResFrame("guildsecretarea_result", "txt_cn_guildsecretarea_result_6"), LOADTEXT_TYPE_PLIST)
		slot0.reward_panel:getChildByName("title_name"):setString(TI18N("公会宝库奖励"))
		slot0.reward_panel:getChildByName("title_tips"):setString(TI18N("(以下物品已放入公会宝库)"))
	else
		slot0.fight_text:setString(slot2 .. TI18N("讨伐失败!"))
		loadSpriteTexture(slot0.result_icon, PathTool.getResFrame("guildsecretarea_result", "txt_cn_guildsecretarea_result_5"), LOADTEXT_TYPE_PLIST)
		slot0.reward_panel:setVisible(false)
		slot0.pass_time:setVisible(false)
		slot0.comfirm_btn:setVisible(false)
		slot0.cancel_btn:setVisible(false)
		slot0.reward_panel_1:setPositionY(438)
		slot0.scroll_view:setContentSize(cc.size(414, 342))
	end
end

function GuildsecretareaEndCrusadePanel.playEnterAnimatian(slot0)
	if not slot0.container then
		return
	end

	commonOpenActionCentreScale(slot0.container)
end

function GuildsecretareaEndCrusadePanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickCloseBtn), false, REGISTER_BUTTON_SOUND_CLOSED_TYPY)
	registerButtonEventListener(slot0.cancel_btn, handler(slot0, slot0.onClickCloseBtn), true, REGISTER_BUTTON_SOUND_CLOSED_TYPY)
	registerButtonEventListener(slot0.comfirm_btn, handler(slot0, slot0.onClickComfirmBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
end

function GuildsecretareaEndCrusadePanel.onClickCloseBtn(slot0)
	uv0:openGuildsecretareaEndCrusadePanel(false)
end

function GuildsecretareaEndCrusadePanel.onClickComfirmBtn(slot0)
	GuildmarketplaceController:getInstance():openGuildmarketplaceMainWindow(true)
	uv0:openGuildsecretareaEndCrusadePanel(false)
end

function GuildsecretareaEndCrusadePanel.openRootWnd(slot0, slot1)
	if not slot1 then
		return
	end

	if slot1.flag == 1 then
		playOtherSound("b_win", AudioManager.AUDIO_TYPE.BATTLE)

		slot0.market_reward_list = slot1.market_reward

		slot0:updateMarketRewardlist()
		slot0.pass_time:setString(TI18N("通关时间：") .. TimeTool.GetTimeFormatDayIIIIIIII(slot1.time))
	else
		AudioManager:getInstance():playMusic(AudioManager.AUDIO_TYPE.BATTLE, "b_lose", false)
	end

	slot0.reward_list = slot1.boss_reward

	slot0:updateRewardlist()
end

function GuildsecretareaEndCrusadePanel.updateRewardlist(slot0)
	if not slot0.reward_list then
		return
	end

	if slot0.scrollview_list == nil then
		slot0.scrollview_list = CommonScrollViewSingleLayout.new(slot0.scroll_view, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.scroll_view:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 0,
			row = 1,
			delay = 1,
			space_x = 0,
			item_width = 100,
			item_height = 100,
			space_y = 0,
			col = 4
		}, cc.p(0, 0))

		slot0.scrollview_list:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.scrollview_list:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.scrollview_list:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.scrollview_list:reloadData()

	if #slot0.reward_list == 0 then
		commonShowEmptyIcon(slot0.scroll_view, true, {
			font_size = 22,
			offset_y = 36,
			scale = 0.5,
			text = TI18N("暂无奖励")
		})
	else
		commonShowEmptyIcon(slot0.scroll_view, false)
	end
end

function GuildsecretareaEndCrusadePanel.createNewCell(slot0, slot1, slot2)
	slot3 = BackPackItem.new(true, true, false, 0.7)

	slot3:setSwallowTouches(false)
	slot3:setDefaultTip()

	return slot3
end

function GuildsecretareaEndCrusadePanel.numberOfCells(slot0)
	if not slot0.reward_list then
		return 0
	end

	return #slot0.reward_list
end

function GuildsecretareaEndCrusadePanel.updateCellByIndex(slot0, slot1, slot2)
	if slot0.reward_list[slot2] then
		slot1:setBaseData(slot3.bid, slot3.num)
	end
end

function GuildsecretareaEndCrusadePanel.updateMarketRewardlist(slot0)
	if not slot0.market_reward_list then
		return
	end

	if slot0.scrollview_list1 == nil then
		slot0.scrollview_list1 = CommonScrollViewSingleLayout.new(slot0.market_scroll_view, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.market_scroll_view:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 0,
			row = 1,
			delay = 1,
			space_x = 0,
			item_width = 100,
			item_height = 100,
			space_y = 0,
			col = 4
		}, cc.p(0, 0))

		slot0.scrollview_list1:registerScriptHandlerSingle(handler(slot0, slot0.marketcreateNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.scrollview_list1:registerScriptHandlerSingle(handler(slot0, slot0.marketnumberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.scrollview_list1:registerScriptHandlerSingle(handler(slot0, slot0.marketupdateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.scrollview_list1:reloadData()

	if #slot0.market_reward_list == 0 then
		commonShowEmptyIcon(slot0.market_scroll_view, true, {
			font_size = 22,
			offset_y = 36,
			scale = 0.5,
			text = TI18N("暂无奖励")
		})
	else
		commonShowEmptyIcon(slot0.market_scroll_view, false)
	end
end

function GuildsecretareaEndCrusadePanel.marketcreateNewCell(slot0, slot1, slot2)
	slot3 = BackPackItem.new(true, true, false, 0.7)

	slot3:setSwallowTouches(false)
	slot3:setDefaultTip()

	return slot3
end

function GuildsecretareaEndCrusadePanel.marketnumberOfCells(slot0)
	if not slot0.market_reward_list then
		return 0
	end

	return #slot0.market_reward_list
end

function GuildsecretareaEndCrusadePanel.marketupdateCellByIndex(slot0, slot1, slot2)
	if slot0.market_reward_list[slot2] then
		slot1:setBaseData(slot3.id, slot3.num)
	end
end

function GuildsecretareaEndCrusadePanel.close_callback(slot0)
	if slot0.scrollview_list then
		slot0.scrollview_list:DeleteMe()
	end

	slot0.scrollview_list = nil

	if slot0.scrollview_list1 then
		slot0.scrollview_list1:DeleteMe()
	end

	slot0.scrollview_list1 = nil

	uv0:openGuildsecretareaEndCrusadePanel(false)
end
