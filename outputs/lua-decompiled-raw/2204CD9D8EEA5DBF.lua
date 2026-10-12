GuildsecretareaStartCrusadePanel = GuildsecretareaStartCrusadePanel or BaseClass(BaseView)
slot1 = GuildsecretareaController:getInstance():getModel()

function GuildsecretareaStartCrusadePanel.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.layout_name = "guildsecretarea/guildsecretarea_start_crusade_panel"
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("battle", "battle"),
			type = ResourcesType.plist
		}
	}
end

function GuildsecretareaStartCrusadePanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot0.container, 2)

	slot0.tips_label = slot0.container:getChildByName("tips_label")
	slot0.tips_label_1 = slot0.container:getChildByName("tips_label_1")

	slot0.tips_label:setString(TI18N("公会秘境讨伐已开启"))
	slot0.tips_label_1:setString(TI18N("请在限定时间内讨伐BOSS"))

	slot0.less_time = slot0.container:getChildByName("less_time")
	slot1 = slot0.container:getContentSize()
	slot0.comfirm_btn = slot0.container:getChildByName("comfirm_btn")

	slot0.comfirm_btn:getChildByName("label"):setString(TI18N("前 往"))

	slot0.cancel_btn = slot0.container:getChildByName("cancel_btn")

	slot0.cancel_btn:getChildByName("label"):setString(TI18N("取 消"))

	slot0.boss_icon = slot0.container:getChildByName("boss_icon")
	slot0.item_load_bg = loadSpriteTextureFromCDN(slot0.boss_icon, PathTool.getPlistImgForDownLoad("bigbg/guildsecretarea", "secret_area_result_bg", false), ResourcesType.single, slot0.item_load_bg)
end

function GuildsecretareaStartCrusadePanel.playEnterAnimatian(slot0)
	if not slot0.container then
		return
	end

	commonOpenActionCentreScale(slot0.container)
end

function GuildsecretareaStartCrusadePanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickCloseBtn), false, REGISTER_BUTTON_SOUND_CLOSED_TYPY)
	registerButtonEventListener(slot0.cancel_btn, handler(slot0, slot0.onClickCloseBtn), true, REGISTER_BUTTON_SOUND_CLOSED_TYPY)
	registerButtonEventListener(slot0.comfirm_btn, handler(slot0, slot0.onClickComfirmBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
end

function GuildsecretareaStartCrusadePanel.onClickCloseBtn(slot0)
	uv0:openGuildsecretareaStartCrusadePanel(false)
end

function GuildsecretareaStartCrusadePanel.onClickComfirmBtn(slot0)
	MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.GuildSecretArea)
	uv0:openGuildsecretareaStartCrusadePanel(false)
end

function GuildsecretareaStartCrusadePanel.openRootWnd(slot0)
	playOtherSound("1001")

	if not uv0.start_crusade_data then
		return
	end

	if slot1.end_time - GameNet:getInstance():getTime() <= 0 then
		slot2 = 0
	end

	commonCountDownTime(slot0.less_time, slot2, {
		callback = function (slot0)
			uv0:setTimeFormatString(slot0)
		end
	})
end

function GuildsecretareaStartCrusadePanel.setTimeFormatString(slot0, slot1)
	if slot1 > 0 then
		slot0.less_time:setString(string.format(TI18N("剩余时间: %s"), TimeTool.GetTimeFormatDayIIIIII(slot1)))
	else
		slot0.less_time:setString(TI18N("剩余时间: 00:00"))
	end
end

function GuildsecretareaStartCrusadePanel.close_callback(slot0)
	if slot0.item_load_bg then
		slot0.item_load_bg:DeleteMe()
	end

	slot0.item_load_bg = nil

	uv0:openGuildsecretareaStartCrusadePanel(false)
end
