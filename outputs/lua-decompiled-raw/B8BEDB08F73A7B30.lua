PlanesafkResultPanel = PlanesafkResultPanel or BaseClass(BaseView)
slot0 = PlanesafkController:getInstance()
slot1 = GuildbossController:getInstance():getModel()
slot2 = string.format

function PlanesafkResultPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Tips
	slot0.is_full_screen = false
	slot0.effect_cache_list = {}
	slot0.layout_name = "planesafk/planesafk_result_panel"
	slot0.res_list = {}
	slot0.fight_type = BattleConst.Fight_Type.GuildDun
end

function PlanesafkResultPanel.open_callback(slot0)
	playOtherSound("b_win", AudioManager.AUDIO_TYPE.BATTLE)

	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.title_container = slot0.root_wnd:getChildByName("title_container")
	slot0.title_width = slot0.title_container:getContentSize().width
	slot0.title_height = slot0.title_container:getContentSize().height
	slot0.pass_bg = slot0.container:getChildByName("pass_bg")
	slot1, slot2 = slot0.pass_bg:getPosition()
	slot0.pass_tip = createRichLabel(24, cc.c3b(134, 213, 78), cc.p(0.5, 0.5), cc.p(slot1, slot2), nil, , 10000)

	slot0.container:addChild(slot0.pass_tip)

	slot0.tips = slot0.container:getChildByName("tips")

	slot0.tips:setString(TI18N("恭喜完成本次副本探险"))

	slot0.comfirm_btn = slot0.container:getChildByName("comfirm_btn")

	slot0.comfirm_btn:getChildByName("label"):setString(TI18N("结束探索"))
end

function PlanesafkResultPanel.onCloseBtn(slot0)
	uv0:openPlanesafkResultPanel(false)
end

function PlanesafkResultPanel.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:onCloseBtn()
		end
	end)
	registerButtonEventListener(slot0.comfirm_btn, handler(slot0, slot0.onCloseBtn), true)
end

function PlanesafkResultPanel.openRootWnd(slot0)
	slot0:handleEffect(true)

	slot1 = {
		46800,
		46810,
		46820,
		46830,
		46840
	}

	if Config.PlanesData.data_const.planes_feat_list then
		slot1 = slot2.val
	end

	slot3 = nil

	for slot8, slot9 in ipairs(slot1) do
		if TaskController:getInstance():getModel():getTaskExpListById(slot9) and (slot10.finish == TaskConst.task_status.finish or slot10.finish == TaskConst.task_status.un_finish) then
			slot3 = slot10

			break
		end
	end

	if slot3 then
		slot5 = 0
		slot6 = 0

		if slot3.progress[1] then
			slot5 = slot3.progress[1].target_val
			slot6 = slot3.progress[1].value
		end

		slot0.pass_tip:setString(str)

		if slot3.finish == TaskConst.task_status.finish then
			slot0.pass_tip:setString(uv0("<img src='%s' scale=0.8 />%s(%s/%s)", PathTool.getResFrame("common", "common_1043"), slot3.config.desc, MoneyTool.GetMoneyString(slot6), MoneyTool.GetMoneyString(slot5)))
		else
			slot0.pass_tip:setString(uv0("<div fontcolor=#FFE8B7>%s(%s/%s)</div>", slot3.config.desc, MoneyTool.GetMoneyString(slot6), MoneyTool.GetMoneyString(slot5)))
		end
	else
		slot0.pass_bg:setVisible(false)
		slot0.pass_tip:setVisible(false)
		slot0.tips:setPositionY(210)
	end
end

function PlanesafkResultPanel.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	elseif not tolua.isnull(slot0.title_container) and slot0.play_effect == nil then
		slot0.play_effect = createEffectSpine("E51026", cc.p(slot0.title_width * 0.5, slot0.title_height * 0.5), cc.p(0.5, 0.5), false, PlayerAction.action_1, function ()
			if uv0 and uv0.play_effect and not uv0.is_update_ani then
				uv0.is_update_ani = true

				uv0.play_effect:setAnimation(0, PlayerAction.action_2, true)
			end
		end)

		slot0.title_container:addChild(slot0.play_effect, 1)
	end
end

function PlanesafkResultPanel.close_callback(slot0)
	slot0.container:stopAllActions()
	slot0:handleEffect(false)

	if slot0.item_list then
		for slot4, slot5 in ipairs(slot0.item_list) do
			if slot5 then
				slot5:DeleteMe()
			end
		end
	end

	uv0:openPlanesafkResultPanel(false)
end
