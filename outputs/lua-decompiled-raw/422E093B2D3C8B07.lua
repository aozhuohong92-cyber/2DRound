LadderBattleResultWindow = LadderBattleResultWindow or BaseClass(BaseView)
slot0 = RoleController:getInstance():getRoleVo()
slot1 = string.format
slot2 = LadderController:getInstance()

function LadderBattleResultWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Tips
	slot0.layout_name = "ladder/ladder_battle_result_window"
	slot0.effect_cache_list = {}
	slot0.item_list = {}
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("ladder", "ladder"),
			type = ResourcesType.plist
		}
	}
end

function LadderBattleResultWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")

	slot1:getChildByName("get_title"):setString(TI18N([[
获
得
奖
励]]))

	slot0.success_bg = slot1:getChildByName("success_bg")
	slot0.fail_bg = slot1:getChildByName("fail_bg")
	slot0.confirm_btn = slot1:getChildByName("confirm_btn")

	slot0.confirm_btn:getChildByName("label"):setString(TI18N("确定"))
	slot0.confirm_btn:setVisible(false)

	slot0.time_label = slot1:getChildByName("time_label")
	slot0.left_time = 10

	slot0.time_label:setString(TI18N("10秒后关闭"))

	slot0.harm_btn = slot1:getChildByName("harm_btn")

	slot0.harm_btn:setVisible(false)
	slot0.harm_btn:getChildByName("harm_lab"):setString(TI18N("数据统计"))

	slot0.top_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.top_head:setScale(0.8)
	slot0.top_head:setPosition(153, 377)
	slot1:addChild(slot0.top_head)

	slot0.top_name = slot1:getChildByName("top_name")
	slot0.top_result = createRichLabel(22, cc.c3b(255, 232, 183), cc.p(0, 0.5), cc.p(380, 377))

	slot1:addChild(slot0.top_result)

	slot0.bottom_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.bottom_head:setScale(0.8)
	slot0.bottom_head:setPosition(153, 275)
	slot1:addChild(slot0.bottom_head)

	slot0.bottom_name = slot1:getChildByName("bottom_name")
	slot0.bottom_result = createRichLabel(22, cc.c3b(255, 232, 183), cc.p(0, 0.5), cc.p(380, 275))

	slot1:addChild(slot0.bottom_result)

	slot0.title_container = slot0.root_wnd:getChildByName("title_container")
	slot0.title_width = slot0.title_container:getContentSize().width
	slot0.title_height = slot0.title_container:getContentSize().height
	slot0.container = slot1
	slot0.fight_text = createLabel(24, cc.c4b(255, 238, 172, 255), nil, 360, 438, "", slot0.container, nil, cc.p(0.5, 0.5))

	if Config.BattleBgData.data_fight_name[BattleConst.Fight_Type.LadderWar] then
		slot0.fight_text:setString(TI18N("当前战斗：") .. slot2)
	end

	slot0.comfirm_btn = createButton(slot0.container, TI18N("确定"), 620, 580, cc.size(162, 62), PathTool.getResFrame("common", "common_1017"), 24, Config.ColorData.data_color4[1])

	slot0.comfirm_btn:setPosition(slot0.container:getContentSize().width / 2 - 170, 47)
	slot0.comfirm_btn:enableOutline(Config.ColorData.data_color4[264], 2)
	slot0.comfirm_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0:_onClickBtnClose()
		end
	end)

	slot0.cancel_btn = createButton(slot0.container, TI18N("返回玩法"), 620, 580, cc.size(162, 62), PathTool.getResFrame("common", "common_1018"), 24, Config.ColorData.data_color4[1])

	slot0.cancel_btn:setPosition(slot0.container:getContentSize().width / 2 + 170, 47)
	slot0.cancel_btn:enableOutline(Config.ColorData.data_color4[263], 2)
	slot0.cancel_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			BattleResultReturnMgr:returnByFightType(BattleConst.Fight_Type.LadderWar)
			uv0:_onClickBtnClose()
		end
	end)
end

function LadderBattleResultWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0._onClickBtnClose), false, 2)
	registerButtonEventListener(slot0.harm_btn, handler(slot0, slot0._onClickHarmBtn), true)
end

function LadderBattleResultWindow._onClickHarmBtn(slot0)
	if slot0.data then
		BattleController:getInstance():openBattleHarmInfoView(true, slot0.data, {
			fight_type = BattleConst.Fight_Type.LadderWar
		})
	end
end

function LadderBattleResultWindow._onClickBtnClose(slot0)
	uv0:openLadderBattleResultWindow(false)
end

function LadderBattleResultWindow.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	else
		slot2 = 103
		slot3 = PlayerAction.action_2

		if slot0.data.result == 2 then
			slot2 = 104
			slot3 = PlayerAction.action

			slot0.title_container:setPositionY(912)
		end

		if not tolua.isnull(slot0.title_container) and slot0.play_effect == nil then
			slot0.play_effect = createEffectSpine(PathTool.getEffectRes(slot2), cc.p(slot0.title_width * 0.5, slot0.title_height * 0.5), cc.p(0.5, 0.5), false, slot3)

			slot0.title_container:addChild(slot0.play_effect, 1)
		end
	end
end

function LadderBattleResultWindow.openRootWnd(slot0, slot1)
	playOtherSound("c_arenasettlement", AudioManager.AUDIO_TYPE.COMMON)

	if slot1 ~= nil then
		BattleResultMgr:getInstance():setWaitShowPanel(true)

		slot0.data = slot1

		slot0:setBaseInfo()
		slot0:setRewardsList()
		slot0.success_bg:setVisible(slot1.result == 1)
		slot0.fail_bg:setVisible(slot1.result == 2)
		slot0:handleEffect(true)
		slot0:openCloseWindowTimer(true)

		if slot1.hurt_statistics then
			slot0.harm_btn:setVisible(true)
		end
	end
end

function LadderBattleResultWindow.setBaseInfo(slot0)
	if slot0.data == nil then
		return
	end

	slot0.top_head:setHeadRes(uv0.face_id, false, LOADTEXT_TYPE, uv0.face_file, uv0.face_update_time)
	slot0.top_name:setString(uv0.name)
	slot0.top_head:setLev(uv0.lev)
	slot0.bottom_head:setHeadRes(slot0.data.def_face, false, LOADTEXT_TYPE, slot0.data.def_face_file, slot0.data.def_face_update_time)
	slot0.bottom_name:setString(slot0.data.def_name)
	slot0.bottom_head:setLev(slot0.data.def_lev)

	slot1 = ""
	slot2 = PathTool.getResFrame("common", "common_1086")
	slot3 = PathTool.getResFrame("common", "common_1087")

	if slot0.data.atk_change_rank == 0 then
		slot1 = uv1(TI18N("排名:%s"), (slot0.data.atk_rank and slot4 ~= 0 or TI18N("暂无")) and tostring(slot4))
	elseif slot0.data.atk_change_rank > 0 then
		if slot0.data.is_change_best_rank == 1 then
			slot1 = uv1(TI18N("排名:<div fontcolor=#14ff32>%s</div><img src=%s scale=1 />"), slot4, slot2) .. uv1("    <img src=%s scale=1 />", PathTool.getResFrame("ladder", "txt_cn_ladder_highest"))
		end
	else
		slot1 = uv1(TI18N("排名:<div fontcolor=#ff5050>%s</div><img src=%s scale=1 />"), slot4, slot3)
	end

	slot0.top_result:setString(slot1)

	slot5 = ""
	slot6 = (slot0.data.def_rank and slot6 ~= 0 or TI18N("暂无")) and tostring(slot6)

	slot0.bottom_result:setString((slot0.data.def_change_rank ~= 0 or uv1(TI18N("排名:%s"), slot6)) and (slot0.data.def_change_rank <= 1 or uv1(TI18N("排名:<div fontcolor=#14ff32>%s</div><img src=%s scale=1 />"), slot6, slot2)) and uv1(TI18N("排名:<div fontcolor=#ff5050>%s</div><img src=%s scale=1 />"), slot6, slot3))
end

function LadderBattleResultWindow.setRewardsList(slot0)
	if slot0.data == nil or slot0.data.reward == nil or next(slot0.data.reward) == nil then
		return
	end

	slot1 = 0.8
	slot2 = 40 / #slot0.data.reward
	slot3 = 0
	slot4 = 164
	slot5 = nil
	slot6 = 1
	slot7 = nil

	for slot11, slot12 in ipairs(slot0.data.reward) do
		if Config.ItemData.data_get_data(slot12.bid) then
			if slot0.item_list[slot6] == nil then
				slot7 = BackPackItem.new(false, true, false, slot1, false, true)

				slot0.container:addChild(slot7)
				table.insert(slot0.item_list, slot7)
			end

			slot7 = slot0.item_list[slot6]

			slot7:setPosition(212 + (BackPackItem.Width * slot1 + slot2) * (slot6 - 1) + BackPackItem.Width * slot1 * 0.5, slot4)
			slot7:setBaseData(slot12.bid, slot12.num)
			slot7:setExtendDesc(true, slot5.name, 1)

			slot6 = slot6 + 1
		end
	end
end

function LadderBattleResultWindow.openCloseWindowTimer(slot0, slot1)
	if slot1 then
		if slot0.close_timer == nil then
			slot0.close_timer = GlobalTimeTicket:getInstance():add(function ()
				uv0.left_time = uv0.left_time - 1

				if uv0.left_time > 0 then
					uv0.time_label:setString(string.format(TI18N("%d秒后关闭"), uv0.left_time))
				else
					GlobalTimeTicket:getInstance():remove(uv0.close_timer)

					uv0.close_timer = nil

					uv0:_onClickBtnClose()
				end
			end, 1)
		end
	elseif slot0.close_timer ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.close_timer)

		slot0.close_timer = nil
	end
end

function LadderBattleResultWindow.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.item_list) do
		slot5:DeleteMe()
	end

	slot0.item_list = nil

	if slot0.top_head then
		slot0.top_head:DeleteMe()

		slot0.top_head = nil
	end

	if slot0.bottom_head then
		slot0.bottom_head:DeleteMe()

		slot0.bottom_head = nil
	end

	doStopAllActions(slot0.container)
	slot0:handleEffect(false)
	slot0:openCloseWindowTimer(false)
	GlobalEvent:getInstance():Fire(BattleEvent.CLOSE_RESULT_VIEW)
	uv0:openLadderBattleResultWindow(false)
end
