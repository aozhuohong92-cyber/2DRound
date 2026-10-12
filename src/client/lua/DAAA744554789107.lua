BattlDramaHookRewardWindow = BattlDramaHookRewardWindow or BaseClass(BaseView)
slot0 = BattleDramaController:getInstance()
slot1 = BattleDramaController:getInstance():getModel()
slot2 = RoleController:getInstance():getRoleVo()

function BattlDramaHookRewardWindow.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "battledrama/battle_drama_hook_reward_windows"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("levupgrade", "levupgrade"),
			type = ResourcesType.plist
		}
	}
	slot0.is_csb_action = true
	slot0.can_click = false
end

function BattlDramaHookRewardWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot1:getChildByName("get_title"):setString(TI18N("获得物品"))

	slot0.head_icon = PlayerHead.new(PlayerHead.type.circle)

	slot0.head_icon:setPosition(183, 404)
	slot0.head_icon:setHeadRes(uv0.face_id, false, LOADTEXT_TYPE, uv0.face_file, uv0.face_update_time)
	slot0.head_icon:setScale(0.8)
	slot1:addChild(slot0.head_icon)

	slot2 = slot1:getChildByName("progress_container")
	slot0.progress = slot2:getChildByName("progress")
	slot0.progress_width = slot2:getContentSize().width
	slot0.progress_bar = slot2:getChildByName("progress_bar")
	slot0.title_container = slot1:getChildByName("title_container")
	slot0.title_width = slot0.title_container:getContentSize().width
	slot0.title_height = slot0.title_container:getContentSize().height
	slot0.guidesign_rewards_quick_btn = slot1:getChildByName("guidesign_rewards_quick_btn")
	slot0.vip_notice_label = slot0.guidesign_rewards_quick_btn:getChildByName("label")

	slot0.vip_notice_label:setString(TI18N("获得来自vip、称号的收益加成"))

	slot0.level = slot1:getChildByName("level")
	slot0.progress_val = slot1:getChildByName("progress_val")
	slot0.time_value = slot1:getChildByName("time_value")
	slot0.list_view = slot0.root_wnd:getChildByName("list_view")
	slot0.time_type_title = slot1:getChildByName("time_title")
	slot0.main_container = slot1
	slot0.progress_container = slot2
end

function BattlDramaHookRewardWindow.register_event(slot0)
	if slot0.background then
		slot0.background:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				uv0:closeThisWindow()
			end
		end)
	end

	if slot0.guidesign_rewards_quick_btn then
		slot0.guidesign_rewards_quick_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				uv0:closeThisWindow()
			end
		end)
	end
end

function BattlDramaHookRewardWindow.closeThisWindow(slot0)
	if slot0.can_click == false then
		return
	end

	playButtonSound2()
	uv0:openDramHookRewardView(false)
end

function BattlDramaHookRewardWindow.openRootWnd(slot0, slot1)
	playOtherSound("c_get")

	slot0.can_click = false

	delayRun(slot0.main_container, 0.3, function ()
		uv0.can_click = true
	end)

	if slot1 then
		slot0.result_type = slot1.type

		if slot0.result_type == 1 then
			slot0.time_type_title:setString(TI18N("挂机收益："))
		elseif slot0.result_type == 2 then
			slot0.time_type_title:setString(TI18N("快速作战："))
		end

		slot0:handleEffect(true)
		slot0:createItemList(slot1.items)
		slot0:setBaseInfo(slot1)

		if slot1.vip_buff then
			if slot1.vip_buff == 0 then
				slot0.vip_notice_label:setString(TI18N("vip可获额外收益加成"))
			elseif slot1.honor_buff and slot1.honor_buff ~= 0 then
				slot0.vip_notice_label:setString(TI18N("获得来自vip、称号的收益加成"))
			else
				slot0.vip_notice_label:setString(TI18N("获得来自vip的收益加成"))
			end
		end
	end
end

function BattlDramaHookRewardWindow.setBaseInfo(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot0.level:setString("LV." .. slot1.new_lev)
	slot0.time_value:setString(TimeTool.GetTimeFormat(slot1.time))

	slot3 = slot1.old_exp
	slot6 = slot1.new_exp
	slot7 = Config.RoleData.data_role_attr[slot1.new_lev]

	if Config.RoleData.data_role_attr[slot1.old_lev] == nil or slot7 == nil then
		return
	end

	slot0.progress_val:setString(slot6 .. "/" .. slot7.exp_max)

	slot0.old_exp_progress = 100 * slot3 / slot4.exp_max

	slot0.progress:setPercent(slot0.old_exp_progress)
	slot0.progress_bar:setPositionX(slot0.old_exp_progress * 0.01 * slot0.progress_width + 5)

	slot0.old_role_lev = slot2
	slot0.old_role_exp = slot3
	slot0.new_role_lev = slot5
	slot0.new_role_exp = slot6

	slot0:showProgressEffect()
end

function BattlDramaHookRewardWindow.showProgressEffect(slot0)
	slot2 = Config.RoleData.data_role_attr[slot0.old_role_lev].exp_max
	slot3 = slot0.old_role_exp / slot2 * 100
	slot4 = slot0.new_role_exp / slot2 * 100

	if slot0.old_role_lev ~= slot0.new_role_lev then
		slot4 = 100
	end

	GlobalTimeTicket:getInstance():add(function ()
		uv0 = uv0 + 1

		if uv1 < uv0 then
			if uv2.old_role_lev == uv2.new_role_lev then
				uv3 = uv4[uv2.new_role_lev].exp_max
				uv0 = uv2.new_role_exp / uv3 * 100

				uv2.progress:setPercent(uv0)
				uv2.progress_bar:setPositionX(uv0 * 0.01 * uv2.progress_width + 5)
				uv2.progress_val:setString(string.format("%d/%d", uv2.new_role_exp, tonumber(uv3)))
				GlobalTimeTicket:getInstance():remove("battle_drema_hook_reward_timer")
			else
				uv2.old_role_lev = uv2.old_role_lev + 1
				uv0 = 0
				uv1 = 100
				uv3 = Config.RoleData.data_role_attr[uv2.old_role_lev].exp_max

				if uv2.old_role_lev == uv2.new_role_lev then
					uv1 = uv2.new_role_exp / Config.RoleData.data_role_attr[uv2.new_role_lev].exp_max * 100
				end
			end
		else
			uv2.progress:setPercent(uv0)
			uv2.progress_bar:setPositionX(uv0 * 0.01 * uv2.progress_width + 5)
			uv2.progress_val:setString(string.format("%d/%d", uv2.new_role_exp, tonumber(uv3)))
		end
	end, 0.01, 0, "battle_drema_hook_reward_timer")
end

function BattlDramaHookRewardWindow.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	else
		slot2 = 278
		slot3 = PlayerAction.action_1

		if slot0.result_type == 2 then
			slot3 = PlayerAction.action_2
		end

		if not tolua.isnull(slot0.title_container) and slot0.play_effect == nil then
			slot0.play_effect = createEffectSpine(PathTool.getEffectRes(slot2), cc.p(slot0.title_width * 0.5, slot0.title_height * 0.5), cc.p(0.5, 0.5), false, slot3)

			slot0.title_container:addChild(slot0.play_effect, 1)
		end
	end
end

function BattlDramaHookRewardWindow.createItemList(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		return
	end

	if slot0.scroll_view == nil then
		slot0.scroll_view = CommonScrollViewLayout.new(slot0.list_view, nil, nil, nil, slot0.list_view:getContentSize(), {
			start_y = 0,
			item_width = 120,
			start_x = 94,
			delay = 6,
			space_x = 20,
			row = 4,
			item_height = 145,
			space_y = 10,
			col = 4,
			need_dynamic = true,
			item_class = BattlDramaHookRewardItem
		})
	end

	slot0.scroll_view:setData(slot1)
end

function BattlDramaHookRewardWindow.close_callback(slot0)
	GlobalTimeTicket:getInstance():remove("battle_drema_hook_reward_timer")

	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()
	end

	slot0.scroll_view = nil

	if slot0.head_icon then
		slot0.head_icon:DeleteMe()
	end

	slot0.head_icon = nil

	if slot0.result_type and slot0.result_type == 1 then
		GlobalEvent:getInstance():Fire(BattleEvent.CLOSE_RESULT_VIEW)
	end

	uv0:openDramHookRewardView(false)
end

BattlDramaHookRewardItem = class("BattlDramaHookRewardItem", function ()
	return ccui.Layout:create()
end)

function BattlDramaHookRewardItem.ctor(slot0)
	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(cc.size(120, 145))
	slot0:setCascadeOpacityEnabled(true)

	slot0.item = BackPackItem.new(false, true, false, 1, false, true)

	slot0.item:setPosition(60, 85)
	slot0:addChild(slot0.item)

	slot0.item_name_label = createLabel(24, cc.c4b(255, 232, 135, 255), nil, 60, 0, "", slot0, nil, cc.p(0.5, 0))

	slot0:registerEvent()
end

function BattlDramaHookRewardItem.registerEvent(slot0)
	slot0:registerScriptHandler(function (slot0)
		if slot0 == "enter" then
			uv0:setOpacity(0)
			uv0:setScale(2)
			uv0:runAction(cc.Spawn:create(cc.FadeIn:create(0.1), cc.ScaleTo:create(0.1, 1)))
		elseif slot0 == "exit" then
			-- Nothing
		end
	end)
end

function BattlDramaHookRewardItem.setData(slot0, slot1)
	if slot1 then
		slot0.item:setBaseData(slot1.bid, slot1.num)

		if Config.ItemData.data_get_data(slot1.bid) then
			slot0.item_name_label:setString(slot2.name)
		end
	end
end

function BattlDramaHookRewardItem.suspendAllActions(slot0)
end

function BattlDramaHookRewardItem.DeleteMe(slot0)
	if slot0.item then
		slot0.item:DeleteMe()
	end

	slot0.item = nil

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
