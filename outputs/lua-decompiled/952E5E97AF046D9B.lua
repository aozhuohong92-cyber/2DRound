ActionTimeElfinSummonGainWindow = ActionTimeElfinSummonGainWindow or BaseClass(BaseView)
slot1 = TimesummonController:getInstance():getModel()

function ActionTimeElfinSummonGainWindow.__init(slot0, slot1)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.item_list = {}
	slot0.win_type = WinType.Full
	slot0.is_action_ing = false
	slot0.is_call = slot1 or TRUE
	slot0.is_show_title = false
	slot0.music_info = AudioManager:getInstance():getMusicInfo()
	slot0.elfin_summon_type = 1
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("partnersummon", "partnersummon"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_12"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "txt_cn_bigbg_18"),
			type = ResourcesType.single
		}
	}
	slot0.config_data = Config.HolidaySpriteLotteryData.data_summon
end

function ActionTimeElfinSummonGainWindow.createRootWnd(slot0)
	slot0.size = cc.size(SCREEN_WIDTH, SCREEN_HEIGHT)
	slot0.root_wnd = ccui.Layout:create()

	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.root_wnd:setPosition(cc.p(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2))
	slot0.root_wnd:setContentSize(slot0.size)
	showLayoutRect(slot0.root_wnd, 255)
	AudioManager:getInstance():preLoadEffect(AudioManager.AUDIO_TYPE.Recruit, "recruit_action")
	AudioManager:getInstance():preLoadEffect(AudioManager.AUDIO_TYPE.Recruit, "recruit_action2")
	AudioManager:getInstance():preLoadEffect(AudioManager.AUDIO_TYPE.Recruit, "result_01")
	AudioManager:getInstance():preLoadEffect(AudioManager.AUDIO_TYPE.COMMON, "c_get")

	slot0.source_container = ccui.Layout:create()

	slot0.source_container:setTouchEnabled(true)
	slot0.source_container:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.source_container:setOpacity(255)
	slot0.source_container:setContentSize(cc.size(SCREEN_WIDTH, SCREEN_HEIGHT))
	slot0.source_container:setCascadeOpacityEnabled(true)
	slot0.source_container:setScale(display.getMaxScale())
	slot0.source_container:setPosition(cc.p(slot0.size.width / 2, SCREEN_HEIGHT / 2))
	slot0.root_wnd:addChild(slot0.source_container)

	slot0.draw_container = ccui.Layout:create()

	slot0.draw_container:setTouchEnabled(false)
	slot0.draw_container:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.draw_container:setContentSize(cc.size(SCREEN_WIDTH, SCREEN_HEIGHT))
	slot0.draw_container:setPosition(cc.p(slot0.size.width / 2, SCREEN_HEIGHT / 2))
	slot0.root_wnd:addChild(slot0.draw_container)

	slot0.image_bg = createSprite(nil, SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2, slot0.source_container, cc.p(0.5, 0.5), LOADTEXT_TYPE)

	slot0.image_bg:setVisible(false)
	slot0.image_bg:setScale(display.getMaxScale())

	slot0.image_top_bg = createScale9Sprite(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_12"), SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2 + 55, LOADTEXT_TYPE, slot0.source_container)

	slot0.image_top_bg:setAnchorPoint(cc.p(0.5, 0))
	slot0.image_top_bg:setVisible(false)
	slot0.image_top_bg:setContentSize(cc.size(SCREEN_WIDTH + 100, 220))

	slot2 = createSprite(PathTool.getResFrame("partnersummon", "partnersummon_line"), slot0.image_top_bg:getContentSize().width / 2, slot0.image_top_bg:getContentSize().height - 5, image_top_bg, cc.p(0, 0.5), LOADTEXT_PLIST)

	createSprite(PathTool.getResFrame("partnersummon", "partnersummon_line"), slot0.image_top_bg:getContentSize().width / 2, slot0.image_top_bg:getContentSize().height - 5, image_top_bg, cc.p(0, 0.5), LOADTEXT_PLIST):setScaleX(-1)

	slot0.image_bottom_bg = createScale9Sprite(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_12"), SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2 + 55, LOADTEXT_TYPE, slot0.source_container)

	slot0.image_bottom_bg:setContentSize(cc.size(SCREEN_WIDTH + 100, 220))
	slot0.image_bottom_bg:setScaleY(-1)
	slot0.image_bottom_bg:setVisible(false)
	slot0.image_bottom_bg:setAnchorPoint(cc.p(0.5, 0))

	slot0.title_bg = createSprite(PathTool.getPlistImgForDownLoad("bigbg", "txt_cn_bigbg_18"), SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2 + 525, slot0.source_container, cc.p(0.5, 0.5), LOADTEXT_TYPE)

	slot0.title_bg:setVisible(false)
	slot0.title_bg:setScale(1.5)

	slot0.item_container = ccui.Layout:create()

	slot0.item_container:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.item_container:setOpacity(255)
	slot0.item_container:setContentSize(cc.size(SCREEN_WIDTH, 440))
	slot0.item_container:setCascadeOpacityEnabled(true)
	slot0.item_container:setPosition(cc.p(slot0.size.width / 2, SCREEN_HEIGHT / 2))
	slot0.item_container:setVisible(false)
	slot0.root_wnd:addChild(slot0.item_container)

	if slot0.is_call == TRUE then
		slot0.again_btn = createButton(slot0.item_container, TI18N("再抽一次"), 165, -55, cc.size(220, 77), PathTool.getResFrame("partnersummon", "partnersummon_btn_2"))

		slot0.again_btn:setRichText(TI18N("<div fontColor=#ffffff fontsize=30 outline=2,#020019>再抽一次</div>"))

		slot0.item_label = createRichLabel(32, 1, cc.p(0.5, 0.5), cc.p(110, 100), 0, 0, 500)

		slot0.item_label:setString("")
		slot0.again_btn:addChild(slot0.item_label)

		slot0.comfirm_btn = createButton(slot0.item_container, TI18N("确定"), 560, -55, cc.size(220, 77), PathTool.getResFrame("partnersummon", "partnersummon_btn"))

		slot0.comfirm_btn:setRichText(TI18N("<div fontColor=#ffffff fontsize=30 outline=2,#020019>确定</div>"))
	end

	slot0:resgiter_event()
end

function ActionTimeElfinSummonGainWindow.openRootWnd(slot0, slot1, slot2, slot3)
	BattleResultMgr:getInstance():setWaitShowPanel(true)

	slot0.tiems = slot1.times
	slot0.group_id = slot1.group_id or 0
	slot0.reward_list = slot1.rewards
	slot0.elfin_summon_type = slot3 or 1
	slot0.config_data = Config.HolidaySpriteLotteryData.data_summon

	if slot0.config_data[slot1.group_id] then
		slot0.one_icon_item = slot4.loss_item_once[1][1]
		slot0.five_icon_item = slot4.loss_item_ten[1][1]

		slot0.again_btn:setVisible(true)
		slot0.comfirm_btn:setPosition(cc.p(560, -55))
	else
		slot0.again_btn:setVisible(false)
		slot0.comfirm_btn:setPosition(cc.p(slot0.item_container:getContentSize().width / 2, -55))
	end

	slot0.bg_res_id = PathTool.getPlistImgForDownLoad("bigbg/partnersummon", "partnersummon_call_bg_300", true)
	slot0.resources_bg_load = loadSpriteTextureFromCDN(slot0.image_bg, slot0.bg_res_id, ResourcesType.single, slot0.resources_bg_load)

	slot0:callAction(slot1)
end

function ActionTimeElfinSummonGainWindow.callAction(slot0, slot1)
	slot0.is_action_ing = true

	slot0:updateEffectAction()
end

function ActionTimeElfinSummonGainWindow.updateEffectAction(slot0)
	slot1 = PlayerAction.action

	if slot0.config_data[slot0.group_id] then
		slot1 = slot0.config_data[slot0.group_id].action_name
	end

	slot2 = "recruit_action"

	if slot0.group_id and slot0.group_id ~= 0 then
		slot2 = "recruit_" .. slot1
	end

	slot0.recuit_music = AudioManager:getInstance():playEffect(AudioManager.AUDIO_TYPE.Recruit, slot2, false)

	slot0:clickSkilAction()
end

function ActionTimeElfinSummonGainWindow.showDrawEffect1(slot0, slot1)
	if slot1 == true then
		if not tolua.isnull(slot0.source_container) and slot0.draw_effect_1 == nil then
			slot0.draw_effect_1 = createEffectSpine(Config.EffectData.data_effect_info[1313], cc.p(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2), cc.p(0.5, 0.5), true, PlayerAction.action_1)

			slot0.source_container:addChild(slot0.draw_effect_1)
		end
	elseif slot0.draw_effect_1 then
		slot0.draw_effect_1:clearTracks()
		slot0.draw_effect_1:removeFromParent()

		slot0.draw_effect_1 = nil
	end
end

function ActionTimeElfinSummonGainWindow.showDrawEffect2(slot0, slot1)
	if slot1 == true then
		if not tolua.isnull(slot0.source_container) and slot0.draw_effect_2 == nil then
			slot0.draw_effect_2 = createEffectSpine(Config.EffectData.data_effect_info[1313], cc.p(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2), cc.p(0.5, 0.5), true, PlayerAction.action_2)

			slot0.source_container:addChild(slot0.draw_effect_2)
		end
	elseif slot0.draw_effect_2 then
		slot0.draw_effect_2:clearTracks()
		slot0.draw_effect_2:removeFromParent()

		slot0.draw_effect_2 = nil
	end
end

function ActionTimeElfinSummonGainWindow.showDrawEffect3(slot0, slot1)
	if slot1 == true then
		if not tolua.isnull(slot0.source_container) and slot0.draw_effect_3 == nil then
			slot0.draw_effect_3 = createEffectSpine(Config.EffectData.data_effect_info[1317], cc.p(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2), cc.p(0.5, 0.5), true, PlayerAction.action_2)

			slot0.source_container:addChild(slot0.draw_effect_3)
		elseif slot0.draw_effect_3 then
			slot0.draw_effect_3:setToSetupPose()
			slot0.draw_effect_3:setAnimation(0, PlayerAction.action_2, true)
		end
	elseif slot0.draw_effect_3 then
		slot0.draw_effect_3:clearTracks()
		slot0.draw_effect_3:removeFromParent()

		slot0.draw_effect_3 = nil
	end
end

function ActionTimeElfinSummonGainWindow.showDrawEffect4(slot0, slot1)
	if slot1 == true then
		if not tolua.isnull(slot0.draw_container) and slot0.draw_effect_4 == nil then
			slot0.draw_effect_4 = createEffectSpine(Config.EffectData.data_effect_info[1313], cc.p(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2), cc.p(0.5, 0.5), true, PlayerAction.action_3)

			slot0.draw_container:addChild(slot0.draw_effect_4, 1)
		end
	elseif slot0.draw_effect_4 then
		slot0.draw_effect_4:clearTracks()
		slot0.draw_effect_4:removeFromParent()

		slot0.draw_effect_4 = nil
	end
end

function ActionTimeElfinSummonGainWindow.updateItemData(slot0, slot1)
	slot0.is_action_ing = false

	slot0.item_container:setVisible(true)
	slot0.image_top_bg:setVisible(true)
	slot0.image_bottom_bg:setVisible(true)
	slot0.image_bg:setVisible(true)
	slot0:showDrawEffect4(true)
	slot0.title_bg:setVisible(true)

	slot2 = #slot1
	slot3 = 5
	slot0.row = math.ceil(slot2 / slot3)
	slot0.space = 20
	slot0.max_height = math.max(slot0.space + (slot0.space + 20 + BackPackItem.Height) * slot0.row, slot0.item_container:getContentSize().height)

	slot0.title_bg:setPosition(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2 + 320)

	if slot3 <= slot2 then
		slot2 = slot3
	end

	slot0.start_x = (slot0.item_container:getContentSize().width - (slot2 * BackPackItem.Width + (slot2 - 1) * slot0.space)) * 0.5

	if slot0.row == 1 then
		slot0.start_y = slot0.max_height * 0.5 + 65
	else
		slot0.start_y = slot0.max_height - slot0.space - BackPackItem.Height * 0.5
	end

	slot0.show_elfin_tips = {}
	slot6 = false

	for slot10, slot11 in ipairs(slot1) do
		slot12 = BackPackItem.new(false, true)

		slot12:setAnchorPoint(cc.p(0.5, 0.5))
		slot12:setBaseData(slot11.base_id, slot11.num)
		slot12:setScale(1.2)
		slot12:setOpacity(0)
		slot12:setDefaultTip()

		slot12.config = Config.ItemData.data_get_data(slot11.base_id)

		slot0.item_container:addChild(slot12)
		slot12:setPosition(cc.p(slot0.start_x + BackPackItem.Width * 0.5 + (slot10 - 1) % slot3 * (BackPackItem.Width + slot0.space), slot0.start_y - math.floor((slot10 - 1) / slot3) * (BackPackItem.Height + slot0.space + 20)))

		slot0.item_list[slot10] = slot12

		if slot0.elfin_summon_type == 2 then
			slot15 = Config.HolidaySpriteLotteryData.data_const.sprite_lottery_rare_list

			if slot12.config and BackPackConst.checkIsElfin(slot12.config.type) and slot15 then
				for slot19, slot20 in pairs(slot15.val) do
					if slot12.config.quality == slot20 then
						table.insert(slot0.show_elfin_tips, slot12.config)
					end
				end
			end
		end

		if BackPackConst.checkIsElfin(slot12.config.type) and slot12.config.quality == BackPackConst.quality.orange then
			slot6 = true
		end
	end

	if slot6 == true then
		slot0:showDrawEffect1(false)
		slot0:showDrawEffect2(false)
		slot0:showDrawEffect3(true)

		slot0.bg_res_id = PathTool.getPlistImgForDownLoad("bigbg/partnersummon", "partnersummon_call_bg_400", true)
	else
		slot0:showDrawEffect1(true)
		slot0:showDrawEffect2(true)
		slot0:showDrawEffect3(false)

		slot0.bg_res_id = PathTool.getPlistImgForDownLoad("bigbg/partnersummon", "partnersummon_call_bg_300", true)
	end

	slot0.resources_bg_load = loadSpriteTextureFromCDN(slot0.image_bg, slot0.bg_res_id, ResourcesType.single, slot0.resources_bg_load)

	AudioManager:getInstance():playEffect(AudioManager.AUDIO_TYPE.COMMON, "c_get", false)
	delayOnce(function ()
		if uv0.item_list then
			for slot3, slot4 in ipairs(uv0.item_list) do
				if slot4 and slot4 then
					slot4:runAction(cc.Sequence:create(cc.DelayTime:create(0.1 * slot3), cc.Spawn:create(cc.FadeIn:create(0.1), cc.ScaleTo:create(0.1, 1), cc.CallFunc:create(function ()
						uv0:playItemSound()
						uv0:showItemEffect(true, 156, PlayerAction.action_3, false)
					end), cc.CallFunc:create(function ()
						if uv0.config and BackPackConst.checkIsElfin(uv0.config.type) and BackPackConst.quality.purple <= uv0.config.quality then
							uv0:showItemEffect(false)

							slot0 = 1750
							slot1 = PlayerAction.action_1

							if BackPackConst.quality.orange <= uv0.config.quality then
								slot1 = PlayerAction.action_2
							end

							uv0:showItemEffect(true, slot0, slot1, true)
						end
					end))))
				end
			end
		end
	end, 0.2)

	if slot0.is_call == TRUE then
		if slot0.tiems == 10 and slot0.item_label and slot0.five_icon_item then
			slot0.again_btn:setRichText(TI18N("<div fontColor=#ffffff fontsize=34 outline=2,#020019>再抽十次</div>"))
			slot0:updateTenSummon()
		else
			slot0.again_btn:setRichText(TI18N("<div fontColor=#ffffff fontsize=34 outline=2,#020019>再抽一次</div>"))
			slot0:updateSingleSummon()
		end
	end

	if slot0.item_list then
		slot7 = #slot0.item_list * 0.1
	end

	delayOnce(function ()
		uv0:checkElfinTips()
	end, slot7 + 0.7)
end

function ActionTimeElfinSummonGainWindow.updateTenSummon(slot0)
	if slot0.tiems <= BackpackController:getInstance():getModel():getItemNumByBid(slot0.five_icon_item) then
		slot0._item_enough = true

		slot0.item_label:setString(string.format(TI18N("<img src=%s visible=true scale=0.5 /><div fontColor=#35ff14 outline=2,#000000>%d</div><div fontColor=#ffffff outline=2,#000000>/%d</div>"), PathTool.getItemRes(Config.ItemData.data_get_data(slot0.five_icon_item).icon), slot1, slot0.tiems))
	else
		slot0._item_enough = false

		slot0.item_label:setString(string.format(TI18N("<img src=%s visible=true scale=0.5 /><div fontColor=#e14737 outline=2,#000000>%d</div><div fontColor=#ffffff outline=2,#000000>/%d</div>"), PathTool.getItemRes(slot2), slot1, slot0.tiems))
	end
end

function ActionTimeElfinSummonGainWindow.updateSingleSummon(slot0)
	if not slot0.one_icon_item then
		return
	end

	slot1 = BackpackController:getInstance():getModel():getItemNumByBid(slot0.one_icon_item)

	if not Config.ItemData.data_get_data(slot0.one_icon_item) then
		return
	end

	if slot0.tiems <= slot1 then
		slot0._item_enough = true

		slot0.item_label:setString(string.format(TI18N("<img src=%s visible=true scale=0.5 /><div fontColor=#35ff14 outline=2,#000000>%d</div><div fontColor=#ffffff outline=2,#000000>/%d</div>"), PathTool.getItemRes(slot2.icon), slot1, slot0.tiems))
	else
		slot0._item_enough = false

		slot0.item_label:setString(string.format(TI18N("<img src=%s visible=true scale=0.5 /><div fontColor=#e14737 outline=2,#000000>%d</div><div fontColor=#ffffff outline=2,#000000>/%d</div>"), PathTool.getItemRes(slot3), slot1, slot0.tiems))
	end
end

function ActionTimeElfinSummonGainWindow.showAlert(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if slot0.alert then
		slot0.alert:close()

		slot0.alert = nil
	end

	function slot7()
		if uv0.alert then
			uv0.alert:close()

			uv0.alert = nil
		end
	end

	slot0.alert = CommonAlert.show(string.format(TI18N("是否使用<img src=%s visible=true scale=0.3 /><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#020019>(拥有:</div><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#020019>)\n</div>"), PathTool.getItemRes(slot2), slot1, RoleController:getInstance():getRoleVo().gold + RoleController:getInstance():getRoleVo().red_gold) .. string.format(TI18N("<div fontColor=#020019>购买</div><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#020019>%s(同时附赠</div><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#020019>次招募)</div>"), slot4, slot3, slot5), TI18N("确定"), slot6, TI18N("取消"), nil, CommonAlert.type.rich, nil)
end

function ActionTimeElfinSummonGainWindow.clickSkilAction(slot0, slot1)
	if slot0.is_action_ing == false then
		return
	end

	if slot0.item_list and next(slot0.item_list or {}) ~= nil then
		for slot5, slot6 in ipairs(slot0.item_list) do
			if slot6 and slot6:getRootWnd() then
				slot6:getRootWnd():setScale(1)
				slot6:getRootWnd():stopAllActions()
			end
		end
	end

	if slot0.title_effect and slot0.is_show_title == false and slot0.title_effect then
		slot0.title_effect:runAction(cc.RemoveSelf:create(true))

		slot0.title_effect = nil
	end

	if not slot0.title_effect then
		slot0.is_show_title = true

		slot0.title_bg:runAction(cc.Sequence:create(cc.CallFunc:create(function ()
			uv0.title_bg:setVisible(true)
		end), cc.DelayTime:create(0.1), cc.ScaleTo:create(0.1, 1)))
	end

	if slot0.reward_list and slot0.is_call == TRUE then
		slot0:updateItemData(slot0.reward_list)
	elseif slot0.is_call == FALSE then
		-- Nothing
	end
end

function ActionTimeElfinSummonGainWindow.resgiter_event(slot0)
	if slot0.source_container then
		slot0.source_container:setTouchEnabled(true)
		slot0.source_container:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()

				if uv0.is_action_ing then
					uv0:clickSkilAction()
				end
			end
		end)
	end

	if slot0.again_btn then
		slot0.again_btn:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				uv0.show_elfin_tips = {}

				if uv0._item_enough then
					if uv0.elfin_summon_type == 2 then
						ElfinController:getInstance():send26551(uv0.tiems, 4, true)
					else
						TimesummonController:getInstance():send26522(uv0.tiems, 4, true)
					end

					return
				end

				slot2 = uv0.config_data[uv0.group_id]

				if uv0.tiems == 1 then
					uv0:showAlert(slot2.loss_gold_once[1][2], Config.ItemData.data_get_data(slot2.loss_gold_once[1][1]).icon, Config.ItemData.data_get_data(slot2.gain_once[1][1]).name or "", slot2.gain_once[1][2], 1, function ()
						if uv0.elfin_summon_type == 2 then
							ElfinController:getInstance():send26551(1, 3, true)
						else
							TimesummonController:getInstance():send26522(1, 3, true)
						end
					end)
				else
					uv0:showAlert(slot2.loss_gold_ten[1][2], Config.ItemData.data_get_data(slot2.loss_gold_ten[1][1]).icon, Config.ItemData.data_get_data(slot2.gain_ten[1][1]).name or "", slot2.gain_ten[1][2], 10, function ()
						if uv0.elfin_summon_type == 2 then
							ElfinController:getInstance():send26551(10, 3, true)
						else
							TimesummonController:getInstance():send26522(10, 3, true)
						end
					end)
				end
			end
		end)
	end

	if slot0.comfirm_btn then
		slot0.comfirm_btn:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				uv0:openActionTimeElfinSummonGainWindow(false)
			end
		end)
	end

	if not slot0.elfin_check_show_tips_event then
		slot0.elfin_check_show_tips_event = GlobalEvent:getInstance():Bind(ElfinEvent.Elfin_Check_Show_Tips_Event, function ()
			delayOnce(function ()
				uv0:checkElfinTips()
			end, 0.1)
		end)
	end
end

function ActionTimeElfinSummonGainWindow.checkElfinTips(slot0)
	if ElfinController:getInstance().elfin_info_wnd and ElfinController:getInstance().elfin_info_wnd:isOpen() == true then
		return
	end

	if slot0.show_elfin_tips and next(slot0.show_elfin_tips or {}) ~= nil and table.remove(slot0.show_elfin_tips, 1) then
		ElfinController:getInstance():openElfinInfoWindow(true, slot1)
	end
end

function ActionTimeElfinSummonGainWindow.close_callback(slot0)
	slot0.show_elfin_tips = {}

	GlobalEvent:getInstance():Fire(PokedexEvent.Call_End_Event)

	if slot0.item_list and next(slot0.item_list or {}) ~= nil then
		for slot4, slot5 in ipairs(slot0.item_list) do
			if slot5 then
				slot5:DeleteMe()
			end
		end

		slot0.item_list = {}
	end

	slot0:showDrawEffect1(false)
	slot0:showDrawEffect2(false)
	slot0:showDrawEffect3(false)
	slot0:showDrawEffect4(false)

	if slot0.resources_bg_load then
		slot0.resources_bg_load:DeleteMe()
	end

	slot0.resources_bg_load = nil

	if slot0.elfin_check_show_tips_event then
		GlobalEvent:getInstance():UnBind(slot0.elfin_check_show_tips_event)

		slot0.elfin_check_show_tips_event = nil
	end

	GlobalEvent:getInstance():Fire(BattleEvent.NEXT_SHOW_RESULT_VIEW)
	uv0:openActionTimeElfinSummonGainWindow(false)
end
