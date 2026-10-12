slot1 = CrossarenaController:getInstance():getModel()
slot2 = string.format
CrossArenaResultWindow = CrossArenaResultWindow or BaseClass(BaseView)

function CrossArenaResultWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Tips
	slot0.layout_name = "crossarena/crossarena_result_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("crossarena_result", "crossarena_result"),
			type = ResourcesType.plist
		}
	}
	slot0.award_item_list = {}
	slot0.show_ani_num = 0
	slot0.is_get_award = false
end

function CrossArenaResultWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.success_bg = slot0.container:getChildByName("success_bg")
	slot0.fail_bg = slot0.container:getChildByName("fail_bg")
	slot0.cancel_btn = slot0.container:getChildByName("cancel_btn")

	slot0.cancel_btn:getChildByName("label"):setString(TI18N("回到竞技场"))

	slot0.confirm_btn = slot0.container:getChildByName("confirm_btn")

	slot0.confirm_btn:getChildByName("label"):setString(TI18N("确定"))

	slot0.harm_btn = slot0.container:getChildByName("harm_btn")

	slot0.harm_btn:getChildByName("harm_lab"):setString(TI18N("数据统计"))
	slot0.container:getChildByName("title_award"):setString(TI18N("奖励选择"))

	slot0.top_name = slot0.container:getChildByName("top_name")
	slot0.bottom_name = slot0.container:getChildByName("bottom_name")
	slot0.free_time_txt = slot0.container:getChildByName("free_time_txt")

	slot0.free_time_txt:setString(TI18N("免费开启次数:1"))

	slot0.title_container = slot0.root_wnd:getChildByName("title_container")
	slot0.title_width = slot0.title_container:getContentSize().width
	slot0.title_height = slot0.title_container:getContentSize().height
	slot0.top_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.top_head:setScale(0.8)
	slot0.top_head:setPosition(153, 475)
	slot0.container:addChild(slot0.top_head)

	slot0.top_result = createRichLabel(24, 275, cc.p(0, 0.5), cc.p(380, 475))

	slot0.container:addChild(slot0.top_result)

	slot0.bottom_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.bottom_head:setScale(0.8)
	slot0.bottom_head:setPosition(153, 355)
	slot0.container:addChild(slot0.bottom_head)

	slot0.bottom_result = createRichLabel(24, 275, cc.p(0, 0.5), cc.p(380, 355))

	slot0.container:addChild(slot0.bottom_result)

	slot0.fight_text = createLabel(24, cc.c4b(255, 238, 172, 255), nil, 360, 543, "", slot0.container, nil, cc.p(0.5, 0.5))

	if Config.BattleBgData.data_fight_name[BattleConst.Fight_Type.CrossArenaWar] then
		slot0.fight_text:setString(TI18N("当前战斗：") .. slot1)
	end
end

function CrossArenaResultWindow.register_event(slot0)
	registerButtonEventListener(slot0.confirm_btn, function ()
		if uv0:checkIsCanCloseWindow() then
			uv1:openCrossarenaResultWindow(false)
		end
	end, true, 2)
	registerButtonEventListener(slot0.cancel_btn, function ()
		if uv0:checkIsCanCloseWindow() then
			uv1:openCrossarenaResultWindow(false)

			if not uv1:getCrossarenaMainRoot() then
				MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.crossarenawar)
			end
		end
	end, true)
	registerButtonEventListener(slot0.harm_btn, handler(slot0, slot0._onClickHarmBtn), true)
	slot0:addGlobalEvent(CrossarenaEvent.Update_Card_Info_Event, function (slot0)
		uv0:setRewardsList(slot0)
	end)
end

function CrossArenaResultWindow.checkIsCanCloseWindow(slot0)
	if not slot0.is_get_award then
		slot5 = math.random(1, 3)

		uv0:sender25613(slot5)

		for slot5, slot6 in pairs(slot0.award_item_list) do
			slot6:setTouchEnabled(false)
		end

		return false
	end

	if slot0.show_ani_num > 0 then
		return false
	end

	return true
end

function CrossArenaResultWindow._onClickHarmBtn(slot0)
	if slot0.data and slot0.data.all_hurt_statistics then
		table.sort(slot0.data.all_hurt_statistics, function (slot0, slot1)
			return slot0.round < slot1.round
		end)

		for slot5, slot6 in ipairs(slot0.data.all_hurt_statistics) do
			slot6.atk_name = RoleController:getInstance():getRoleVo().name
			slot6.target_role_name = slot0.data.tar_name
		end

		BattleController:getInstance():openBattleHarmInfoView(true, slot0.data.all_hurt_statistics)
	end
end

function CrossArenaResultWindow.openRootWnd(slot0, slot1)
	playOtherSound("c_arenasettlement", AudioManager.AUDIO_TYPE.COMMON)
	uv0:sender25612()

	if slot1 ~= nil then
		BattleResultMgr:getInstance():setWaitShowPanel(true)

		slot0.data = slot1

		slot0:setBaseInfo()
		slot0.success_bg:setVisible(slot1.result == 1)
		slot0.fail_bg:setVisible(slot1.result == 2)
		slot0:handleEffect(true)
		slot0.harm_btn:setVisible(true)
	end
end

function CrossArenaResultWindow.setBaseInfo(slot0)
	if not slot0.data then
		return
	end

	if not RoleController:getInstance():getRoleVo() then
		return
	end

	slot0.top_head:setHeadRes(slot1.face_id, false, LOADTEXT_TYPE, slot1.face_file, slot1.face_update_time)
	slot0.top_head:setLev(slot1.lev)
	slot0.top_name:setString(slot1.name)
	slot0.bottom_head:setHeadRes(slot0.data.tar_face, false, LOADTEXT_TYPE, slot0.data.face_file, slot0.data.face_update_time)
	slot0.bottom_name:setString(slot0.data.tar_name)
	slot0.bottom_head:setLev(slot0.data.tar_lev)

	slot2 = ""

	slot0.top_result:setString((slot0.data.get_score ~= 0 or uv0("积分:%s", slot0.data.score)) and (slot0.data.result ~= 1 or uv0("积分:<div fontcolor=#ffcc00>%s    </div><img src=%s scale=1 visible=true /><div fontcolor=#ffcc00>%s</div>", slot0.data.score, PathTool.getResFrame("common", "common_1086"), slot0.data.get_score)) and uv0("积分:<div fontcolor=#e14737>%s    </div><img src=%s scale=1 visible=true />><div fontcolor=#ff3a3a>%s</div>", slot0.data.score, PathTool.getResFrame("common", "common_1087"), slot0.data.get_score))

	slot3 = ""

	slot0.bottom_result:setString((slot0.data.lose_score ~= 0 or uv0("积分:%s", slot0.data.tar_score)) and (slot0.data.result ~= 1 or uv0("积分:<div fontcolor=#ffffff>%s    </div><img src=%s scale=1 visible=true /><div fontcolor=#ff3a3a>%s</div>", slot0.data.tar_score, PathTool.getResFrame("common", "common_1087"), math.abs(slot0.data.lose_score))) and uv0("积分:<div fontcolor=#ffffff>%s    </div><img src=%s scale=1 visible=true />><div fontcolor=#ffcc00>%s</div>", slot0.data.tar_score, PathTool.getResFrame("common", "common_1086"), math.abs(slot0.data.lose_score)))
end

function CrossArenaResultWindow.setRewardsList(slot0, slot1)
	if not slot1 then
		return
	end

	slot7 = "pos"

	table.sort(slot1, SortTools.KeyLowerSorter(slot7))

	slot2 = 145
	slot3 = 20

	for slot7, slot8 in ipairs(slot1) do
		if not slot0.award_item_list[slot7] then
			slot0.award_item_list[slot7] = CrossareanResultItem.New(slot0.container, handler(slot0, slot0.showAniCallBack))
		end

		slot9:setPosition(cc.p(slot2 + (slot7 - 1) * (slot3 + 195), 165))
		slot9:setData(slot8)

		if slot8.status ~= 0 then
			slot0.is_get_award = true
		end
	end
end

function CrossArenaResultWindow.showAniCallBack(slot0, slot1, slot2)
	if slot1 ~= nil then
		if slot1 == true then
			slot0.show_ani_num = slot0.show_ani_num + 1
		else
			slot0.show_ani_num = slot0.show_ani_num - 1
		end

		slot0.free_time_txt:setVisible(false)
	end

	if slot2 == true then
		for slot6, slot7 in pairs(slot0.award_item_list) do
			slot7:setTouchEnabled(false)
		end
	end
end

function CrossArenaResultWindow.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	else
		slot2 = 103
		slot3 = PlayerAction.action_2

		if slot0.data and slot0.data.result == 2 then
			slot2 = 104
			slot3 = PlayerAction.action

			slot0.title_container:setPositionY(996)
		end

		if not tolua.isnull(slot0.title_container) and slot0.play_effect == nil then
			slot0.play_effect = createEffectSpine(PathTool.getEffectRes(slot2), cc.p(slot0.title_width * 0.5, slot0.title_height * 0.5), cc.p(0.5, 0.5), false, slot3)

			slot0.title_container:addChild(slot0.play_effect, 1)
		end
	end
end

function CrossArenaResultWindow.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.award_item_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	slot0:handleEffect(false)
	GlobalEvent:getInstance():Fire(BattleEvent.CLOSE_RESULT_VIEW)
	uv0:openCrossarenaResultWindow(false)
end

CrossareanResultItem = CrossareanResultItem or BaseClass()

function CrossareanResultItem.__init(slot0, slot1, slot2)
	slot0.is_init = false
	slot0.open_status = false
	slot0.parent = slot1
	slot0.callback = slot2

	slot0:createRoorWnd()
	slot0:registerEvent()
end

function CrossareanResultItem.createRoorWnd(slot0)
	slot0.size = cc.size(195, 144)
	slot0.root_wnd = ccui.Layout:create()

	slot0.root_wnd:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.root_wnd:setTouchEnabled(true)

	if not tolua.isnull(slot0.parent) then
		slot0.parent:addChild(slot0.root_wnd)
	end

	slot0.container = ccui.Layout:create()

	slot0.container:setContentSize(slot0.size)
	slot0.container:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.container:setPosition(cc.p(slot0.size.width / 2, slot0.size.height / 2))
	slot0.container:setTouchEnabled(false)
	slot0.root_wnd:addChild(slot0.container)

	slot0.image_bg = createImage(slot0.container, PathTool.getResFrame("crossarena_result", "crossarena_result_3"), slot0.size.width / 2, slot0.size.height / 2, cc.p(0.5, 0.5), true)

	slot0.image_bg:setTouchEnabled(false)
end

function CrossareanResultItem.registerEvent(slot0)
	registerButtonEventListener(slot0.root_wnd, function ()
		uv0:_onClickAwardItem()
	end, true, nil, nil, nil, 0.5)
end

function CrossareanResultItem._onClickAwardItem(slot0)
	if slot0.data then
		uv0:sender25613(slot0.data.pos)

		if slot0.callback then
			slot0.callback(nil, true)
		end
	end
end

function CrossareanResultItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	if not slot0.effect_id and slot1.reward and slot1.reward[1] then
		if Config.ItemData.data_get_data(slot1.reward[1].item_id) and BackPackConst.quality.orange <= slot3.quality then
			slot0.effect_id = 1201
		else
			slot0.effect_id = 1202
		end
	end

	if slot0.data and slot0.data.status == 0 then
		slot0.data = slot1

		if slot1.status == 1 then
			delayRun(slot0.container, 0.3, function ()
				uv0:showRotateAni(true)
			end)
		elseif slot1.status == 2 then
			slot0:showRotateAni()
		end
	else
		slot0.data = slot1

		if slot0.data and slot0.data.status == 2 and slot0.item_node then
			slot0.item_node:setGotIcon(true)

			if slot0.buy_btn then
				slot0.buy_btn:setVisible(false)
			end
		end
	end
end

function CrossareanResultItem.showRotateAni(slot0, slot1)
	if slot0.open_status then
		return
	end

	slot0.container:stopAllActions()
	slot0.root_wnd:setTouchEnabled(false)

	if not slot1 then
		slot0:handleEffect(true, PlayerAction.action_1)
	end

	slot2 = cc.DelayTime:create(0.3)
	slot3 = cc.ScaleTo:create(0.1, 0.01, 1.2)

	function slot4()
		if not uv0.item_node then
			uv0.item_node = BackPackItem.new(true, true)

			uv0.item_node:setAnchorPoint(0.5, 0.5)
			uv0.item_node:setScale(0.8)
			uv0.item_node:setPosition(cc.p(uv0.size.width / 2, uv0.size.height / 2 + 10))
			uv0.item_node:setDefaultTip()
			uv0.container:addChild(uv0.item_node)
		end

		if uv0.data.reward and uv0.data.reward[1] then
			slot0 = uv0.data.reward[1].item_id

			uv0.item_node:setBaseData(slot0, uv0.data.reward[1].num)
			uv0.item_node:setExtendDesc(true)

			if Config.ItemData.data_get_data(slot0) and BackPackConst.quality.orange <= slot2.quality then
				uv0.image_bg:loadTexture(PathTool.getResFrame("crossarena_result", "crossarena_result_1"), LOADTEXT_TYPE_PLIST)

				uv0.effect_id = 1201
			else
				uv0.image_bg:loadTexture(PathTool.getResFrame("crossarena_result", "crossarena_result_2"), LOADTEXT_TYPE_PLIST)

				uv0.effect_id = 1202
			end
		end
	end

	slot5 = cc.ScaleTo:create(0.1, 1)

	function slot6()
		if uv0 then
			if not uv1.buy_btn then
				slot0 = cc.size(161, 54)
				uv1.buy_btn = createButton(uv1.container, nil, uv1.size.width * 0.5, -40, slot0, PathTool.getResFrame("common", "common_1027"))

				uv1.buy_btn:addTouchEventListener(handler(uv1, uv1._onClickBuyBtn))

				uv1.buy_btn_label = createRichLabel(26, 1, cc.p(0.5, 0.5), cc.p(slot0.width / 2, slot0.height / 2))

				uv1.buy_btn:addChild(uv1.buy_btn_label)
			end

			if uv1.buy_btn_label and uv1.data.val and uv1.data.val[1] then
				if Config.ItemData.data_get_data(uv1.data.val[1].item_id) then
					uv1.buy_btn_label:setString(uv2(TI18N("<img src=%s scale=0.3 /><div fontcolor=#712804>%d 获取</div>"), PathTool.getItemRes(slot2.icon), uv1.data.val[1].num))
				end
			end
		else
			uv1:handleEffect(true, PlayerAction.action_2)
		end

		if uv1.data and uv1.data.status == 2 and uv1.item_node then
			uv1.item_node:setGotIcon(true)

			if uv1.buy_btn then
				uv1.buy_btn:setVisible(false)
			end
		end

		if uv1.callback then
			uv1.callback(false)
		end

		uv1.open_status = true
	end

	if slot0.callback then
		slot0.callback(true)
	end

	slot0.container:runAction(cc.Sequence:create(slot2, slot3, cc.CallFunc:create(slot4), slot5, cc.CallFunc:create(slot6)))
end

function CrossareanResultItem._onClickBuyBtn(slot0, slot1, slot2)
	if slot2 == ccui.TouchEventType.ended and slot0.data and slot0.data.pos then
		uv0:sender25613(slot0.data.pos)
	end
end

function CrossareanResultItem.handleEffect(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	elseif slot0.effect_id then
		if not tolua.isnull(slot0.root_wnd) and slot0.play_effect == nil then
			slot0.play_effect = createEffectSpine(PathTool.getEffectRes(slot0.effect_id), cc.p(slot0.size.width / 2, slot0.size.height / 2 + 10), cc.p(0.5, 0.5), false, slot2)

			slot0.root_wnd:addChild(slot0.play_effect, 99)
		elseif slot0.play_effect then
			slot0.play_effect:setToSetupPose()
			slot0.play_effect:setAnimation(0, slot2, false)
		end
	end
end

function CrossareanResultItem.setPosition(slot0, slot1)
	if slot0.root_wnd then
		slot0.root_wnd:setPosition(slot1)
	end
end

function CrossareanResultItem.setTouchEnabled(slot0, slot1)
	if slot0.root_wnd then
		slot0.root_wnd:setTouchEnabled(slot1)
	end
end

function CrossareanResultItem.__delete(slot0)
	slot0:handleEffect(false)

	if slot0.item_node then
		slot0.item_node:DeleteMe()

		slot0.item_node = nil
	end
end
