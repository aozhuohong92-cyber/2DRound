ArenaLoopResultWindow = ArenaLoopResultWindow or BaseClass(BaseView)
slot0 = RoleController:getInstance():getRoleVo()
slot1 = string.format
slot2 = ArenaController:getInstance()

function ArenaLoopResultWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Tips
	slot0.layout_name = "arena/arena_loop_result_window"
	slot0.effect_cache_list = {}
	slot0.item_list = {}
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("arena", "arenaloop"),
			type = ResourcesType.plist
		}
	}
end

function ArenaLoopResultWindow.open_callback(slot0)
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
	slot0.confirm_btn:getChildByName("label"):enableOutline(Config.ColorData.data_color4[264], 2)

	slot0.cancel_btn = slot1:getChildByName("cancel_btn")

	slot0.cancel_btn:getChildByName("label"):setString(TI18N("回到竞技场"))
	slot0.cancel_btn:getChildByName("label"):enableOutline(Config.ColorData.data_color4[263], 2)

	slot0.harm_btn = slot1:getChildByName("harm_btn")

	slot0.harm_btn:setVisible(false)
	slot0.harm_btn:getChildByName("harm_lab"):setString(TI18N("数据统计"))

	slot0.top_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.top_head:setScale(0.8)
	slot0.top_head:setPosition(153, 317)
	slot1:addChild(slot0.top_head)

	slot0.top_name = slot1:getChildByName("top_name")
	slot0.top_result = createRichLabel(24, cc.c3b(255, 204, 0), cc.p(0, 0.5), cc.p(380, 317))

	slot1:addChild(slot0.top_result)

	slot0.bottom_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.bottom_head:setScale(0.8)
	slot0.bottom_head:setPosition(153, 215)
	slot1:addChild(slot0.bottom_head)

	slot0.bottom_name = slot1:getChildByName("bottom_name")
	slot0.bottom_result = createRichLabel(24, 1, cc.p(0, 0.5), cc.p(380, 215))

	slot1:addChild(slot0.bottom_result)

	slot0.title_container = slot0.root_wnd:getChildByName("title_container")
	slot0.title_width = slot0.title_container:getContentSize().width
	slot0.title_height = slot0.title_container:getContentSize().height
	slot0.container = slot1
	slot0.fight_text = createLabel(24, cc.c4b(255, 238, 172, 255), nil, 360, 378, "", slot0.container, nil, cc.p(0.5, 0.5))

	if Config.BattleBgData.data_fight_name[BattleConst.Fight_Type.Arena] then
		slot0.fight_text:setString(TI18N("当前战斗：") .. slot2)
	end
end

function ArenaLoopResultWindow.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openLoopResultWindow(false)
		end
	end)
	slot0.confirm_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openLoopResultWindow(false)
		end
	end)
	slot0.cancel_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openLoopResultWindow(false)

			if uv0:getArenaRoot() == nil then
				MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.arena_call)
			end
		end
	end)
	registerButtonEventListener(slot0.harm_btn, handler(slot0, slot0._onClickHarmBtn), true)
end

function ArenaLoopResultWindow._onClickHarmBtn(slot0)
	if slot0.data then
		BattleController:getInstance():openBattleHarmInfoView(true, slot0.data, {
			fight_type = BattleConst.Fight_Type.Arena
		})
	end
end

function ArenaLoopResultWindow.handleEffect(slot0, slot1)
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

function ArenaLoopResultWindow.openRootWnd(slot0, slot1)
	if slot1 ~= nil then
		BattleResultMgr:getInstance():setWaitShowPanel(true)

		slot0.data = slot1

		slot0:setBaseInfo()
		slot0:setRewardsList()
		slot0.success_bg:setVisible(slot1.result == 1)
		slot0.fail_bg:setVisible(slot1.result == 2)
		slot0:handleEffect(true)
		slot0.harm_btn:setVisible(true)

		if slot1.result == 1 then
			playOtherSound("b_win", AudioManager.AUDIO_TYPE.BATTLE)
		end
	end
end

function ArenaLoopResultWindow.setBaseInfo(slot0)
	if slot0.data == nil then
		return
	end

	slot0.top_head:setHeadRes(uv0.face_id, false, LOADTEXT_TYPE, uv0.face_file, uv0.face_update_time)
	slot0.top_name:setString(uv0.name)
	slot0.top_head:setLev(uv0.lev)
	slot0.bottom_head:setHeadRes(slot0.data.tar_face, false, LOADTEXT_TYPE, slot0.data.face_file, slot0.data.face_update_time)
	slot0.bottom_name:setString(slot0.data.tar_name)
	slot0.bottom_head:setLev(slot0.data.tar_lev)

	if Config.ArenaData.data_const.score_iocn then
		slot2 = ""

		slot0.top_result:setString((slot0.data.get_score ~= 0 or uv1("<img src=%s scale=0.3 visible=true /> %s", PathTool.getItemRes(slot1.val), slot0.data.score)) and (slot0.data.result ~= 1 or uv1("<img src=%s scale=0.3 visible=true /> <div fontcolor=#ffcc00>%s    </div><img src=%s scale=1 visible=true /><div fontcolor=#ffcc00>%s</div>", PathTool.getItemRes(slot1.val), slot0.data.score, PathTool.getResFrame("common", "common_1086"), slot0.data.get_score)) and uv1("<img src=%s scale=0.3 visible=true /> <div fontcolor=#e14737>%s    </div><img src=%s scale=1 visible=true />><div fontcolor=#ff3a3a>%s</div>", PathTool.getItemRes(slot1.val), slot0.data.score, PathTool.getResFrame("common", "common_1087"), slot0.data.get_score))

		slot3 = ""

		slot0.bottom_result:setString((slot0.data.lose_score ~= 0 or uv1("<img src=%s scale=0.3 visible=true />%s", PathTool.getItemRes(slot1.val), slot0.data.tar_score)) and (slot0.data.result ~= 1 or uv1("<img src=%s scale=0.3 visible=true /> <div fontcolor=#ffffff>%s    </div><img src=%s scale=1 visible=true /><div fontcolor=#ff3a3a>%s</div>", PathTool.getItemRes(slot1.val), slot0.data.tar_score, PathTool.getResFrame("common", "common_1087"), math.abs(slot0.data.lose_score))) and uv1("<img src=%s scale=0.3 visible=true /> <div fontcolor=#ffffff>%s    </div><img src=%s scale=1 visible=true />><div fontcolor=#ffcc00>%s</div>", PathTool.getItemRes(slot1.val), slot0.data.tar_score, PathTool.getResFrame("common", "common_1086"), math.abs(slot0.data.lose_score)))
	end
end

function ArenaLoopResultWindow.setRewardsList(slot0)
	if slot0.data == nil or slot0.data.items == nil or next(slot0.data.items) == nil then
		return
	end

	slot1 = 0.8
	slot2 = 40
	slot3 = 0
	slot4 = 104
	slot5 = nil
	slot6 = 1
	slot7 = nil

	for slot11, slot12 in ipairs(slot0.data.items) do
		if Config.ItemData.data_get_data(slot12.bid) then
			if slot0.item_list[slot6] == nil then
				slot7 = BackPackItem.new(false, true, false, slot1, false, true)

				slot0.container:addChild(slot7)
				table.insert(slot0.item_list, slot7)
			end

			slot7 = slot0.item_list[slot6]

			slot7:setPosition(312 + (BackPackItem.Width * slot1 + slot2) * (slot6 - 1) + BackPackItem.Width * slot1 * 0.5, slot4)
			slot7:setBaseData(slot12.bid, slot12.num)
			slot7:setExtendDesc(true, slot5.name, 1)

			slot6 = slot6 + 1
		end
	end
end

function ArenaLoopResultWindow.close_callback(slot0)
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
	GlobalEvent:getInstance():Fire(BattleEvent.CLOSE_RESULT_VIEW)
	uv0:openLoopResultWindow(false)
end
