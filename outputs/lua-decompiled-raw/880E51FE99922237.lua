ItemExhibitionView = ItemExhibitionView or BaseClass(BaseView)
slot0 = MainuiController:getInstance()

function ItemExhibitionView.__init(slot0, slot1, slot2, slot3)
	slot0.win_type = WinType.Mini
	slot0.layout_name = "mainui/item_exhibition_view"
	slot0.start_y = 20
	slot0.space = 50
	slot0.col = 4
	slot0.cache_list = {}
	slot0.extend = slot1 or {}
	slot0.can_close = false
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.open_type = slot2 or MainuiConst.item_open_type.normal
	slot0.ref_class = slot3 or ItemExhibitionList
	slot0.ref_width = width or 119
	slot0.ref_height = height or 119
	slot0.effect_cache_list = {}
	slot0.is_csb_action = true
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("levupgrade", "levupgrade"),
			type = ResourcesType.plist
		}
	}
end

function ItemExhibitionView.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.center_x = slot1:getContentSize().width * 0.5
	slot0.title_container = slot1:getChildByName("title_container")
	slot0.title_width = slot0.title_container:getContentSize().width
	slot0.title_height = slot0.title_container:getContentSize().height
	slot0.scroll_view = slot0.root_wnd:getChildByName("scroll_view")

	slot0.scroll_view:setScrollBarEnabled(false)

	slot0.scroll_width = slot0.scroll_view:getContentSize().width
	slot0.scroll_height = slot0.scroll_view:getContentSize().height
	slot0.notice_label = slot0.root_wnd:getChildByName("notice_label")
	slot0.confirm_btn = slot1:getChildByName("confirm_btn")
	slot0.close_btn = slot1:getChildByName("close_btn")

	slot0.close_btn:setName("guide_close_btn")

	slot0.close_btn_label = slot0.close_btn:getChildByName("label")
	slot0.fun_btn = slot1:getChildByName("fun_btn")
	slot0.fun_btn_label = slot0.fun_btn:getChildByName("label")

	if slot0.open_type == MainuiConst.item_open_type.normal then
		slot0.close_btn:setVisible(false)
		slot0.fun_btn:setVisible(false)
		slot0.confirm_btn:setVisible(true)
	elseif slot0.open_type == MainuiConst.item_open_type.seerpalace then
		slot0.close_btn:setVisible(true)
		slot0.fun_btn:setVisible(true)
		slot0.confirm_btn:setVisible(false)
		slot0.close_btn_label:setString(TI18N("确定"))
		slot0.fun_btn_label:setString(TI18N("再次召唤"))
	elseif slot0.open_type == MainuiConst.item_open_type.heavendial then
		slot0.close_btn:setVisible(true)
		slot0.fun_btn:setVisible(true)
		slot0.confirm_btn:setVisible(false)
		slot0.close_btn_label:setString(TI18N("确定"))

		if slot0.extend.times == 10 then
			slot0.fun_btn_label:setString(string.format(TI18N("维修%d次"), slot0.extend.times))
		else
			slot0.fun_btn_label:setString(TI18N("再次维修"))
		end
	end

	slot0.main_container = slot1
end

function ItemExhibitionView.register_event(slot0)
	slot0.confirm_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0:onClickClose()
		end
	end)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended and (not uv0.open_type or uv0.open_type == MainuiConst.item_open_type.normal) then
			uv0:onClickClose()
		end
	end)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:onClickClose()
	end, true, 2)
	registerButtonEventListener(slot0.fun_btn, function ()
		uv0:onClickFunBtn()
	end, true, 2)
end

function ItemExhibitionView.onClickClose(slot0)
	uv0:openGetItemView(false)
	GlobalEvent:getInstance():Fire(BattleEvent.NEXT_SHOW_RESULT_VIEW)
end

function ItemExhibitionView.onClickFunBtn(slot0)
	if slot0.open_type == MainuiConst.item_open_type.seerpalace then
		if SeerpalaceController:getInstance():getModel():getLastSummonGroupId() and slot1 ~= 0 then
			SeerpalaceController:getInstance():requestSeerpalaceSummon(slot1)
		end

		slot0:onClickClose()
	elseif slot0.open_type == MainuiConst.item_open_type.heavendial then
		slot2 = slot0.extend.group_id

		if slot0.extend.times and slot2 then
			if not Config.HolyEqmLotteryData.data_group[slot2] or not slot3.loss_item_once or not slot3.loss_item_once[1] then
				return
			end

			slot5 = BackpackController:getInstance():getModel():getItemNumByBid(slot3.loss_item_once[1][1])

			if slot1 == 1 and HeavenController:getInstance():getModel():getHeavenDialIsFreeById(slot2) then
				HeavenController:getInstance():sender25217(slot2, slot1, 1)
			elseif slot1 <= slot5 then
				HeavenController:getInstance():sender25217(slot2, slot1, 4)
			elseif slot3.gain_once and slot3.gain_once[1] then
				slot8 = slot3.gain_once[1][2]

				if Config.ItemData.data_get_data(slot3.gain_once[1][1]) and slot7 and slot8 then
					slot10 = RoleController:getInstance():getRoleVo()
					slot11 = slot3.loss_gold_once

					if slot1 == 10 then
						slot11 = slot3.loss_gold_ten
					end

					slot12 = string.format(TI18N("是否使用<img src=%s visible=true scale=0.4 /><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#289b14>(拥有:</div><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#289b14>)维修<div fontColor=#289b14 fontsize= 26>%d</div>次\n</div>"), PathTool.getItemRes(3), slot11, slot10.gold, slot1) .. string.format(TI18N("维修后可获得<div fontColor=#289b14 fontsize= 26>%d</div><div fontColor=#d95014 fontsize= 26>%s</div><div fontColor=#289b14>(同时附赠</div><div fontColor=#289b14 fontsize= 26>%d</div>次随机奖励)</div>"), slot8 * slot1, slot9.name, slot1)

					function ()
						HeavenController:getInstance():sender25217(uv0, uv1, 3)
					end()
				end
			end
		end

		slot0:onClickClose()
	end
end

function ItemExhibitionView.openRootWnd(slot0, slot1, slot2)
	BattleResultMgr:getInstance():setWaitShowPanel(true)
	slot0:handleEffect(true)

	slot0.can_close = false
	slot0.render_list = slot1

	if slot2 ~= 0 and not tolua.isnull(slot0.main_container) then
		if slot2 > 10 and slot2 < 1000 then
			slot0.notice_label:setString(string.format(TI18N("恭喜你在%s竞猜中押注成功"), ArenaConst.getMatchStepDesc2(math.floor(slot2 * 0.1), slot2 % 10)))
		elseif slot2 == 3 then
			if not ArenapeakchampionController:getInstance():getModel() then
				return
			end

			if slot3:getMainData() and slot4.step ~= 0 then
				slot0.notice_label:setString(string.format(TI18N("恭喜你在 %s 竞猜中押注成功"), slot3:getMacthText(slot4.step, slot4.round)))
			else
				slot0.notice_label:setString(TI18N("恭喜你在巅峰冠军赛竞猜中押注成功"))
			end
		end
	end

	slot0:updateData()
end

function ItemExhibitionView.updateData(slot0)
	slot0.cache_list = {}
	slot1 = #slot0.render_list
	slot0.row = math.ceil(slot1 / slot0.col)
	slot0.max_height = math.max(slot0.start_y + (slot0.space + slot0.ref_height) * slot0.row, slot0.scroll_height)

	slot0.scroll_view:setInnerContainerSize(cc.size(slot0.scroll_width, slot0.max_height))

	if slot0.col <= slot1 then
		slot1 = slot0.col
	end

	slot0.start_x = (slot0.scroll_width - (slot1 * slot0.ref_width + (slot1 - 1) * slot0.space)) * 0.5

	if slot0.row == 1 then
		slot0.start_y = slot0.max_height * 0.5
	else
		slot0.start_y = slot0.max_height - slot0.start_y - slot0.ref_height * 0.5
	end

	slot0.action_effect = {}

	for slot7, slot8 in ipairs(slot0.render_list) do
		delayRun(slot0.root_wnd, slot7 * 0.1, function ()
			uv0.action_effect[uv1] = createEffectSpine(Config.EffectData.data_effect_info[156], cc.p(uv0.start_x + uv0.ref_width * 0.5 + (uv1 - 1) % uv0.col * (uv0.ref_width + uv0.space), uv0.start_y - math.floor((uv1 - 1) / uv0.col) * (uv0.ref_height + uv0.space)), cc.p(0.5, 0.5), false, PlayerAction.action_3, function ()
				if uv0.action_effect[uv1] then
					uv0.action_effect[uv1]:runAction(cc.RemoveSelf:create(true))

					uv0.action_effect[uv1] = nil
				end
			end, cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A8888)

			uv0.scroll_view:addChild(uv0.action_effect[uv1], 1)
			uv0.action_effect[uv1]:registerSpineEventHandler(function (slot0)
				if slot0.eventData.name == "appear" then
					slot1 = uv0.ref_class.new(uv1)

					slot1:setData(uv2, uv0.extend)
					slot1:setPosition(cc.p(uv0.start_x + uv0.ref_width * 0.5 + (uv1 - 1) % uv0.col * (uv0.ref_width + uv0.space), uv0.start_y - math.floor((uv1 - 1) / uv0.col) * (uv0.ref_height + uv0.space) + 15))
					uv0.scroll_view:addChild(slot1)
					table.insert(uv0.cache_list, slot1)
				end
			end, sp.EventType.ANIMATION_EVENT)
		end)
	end
end

function ItemExhibitionView.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	elseif not tolua.isnull(slot0.title_container) and slot0.play_effect == nil then
		slot0.play_effect = createEffectSpine(PathTool.getEffectRes(274), cc.p(slot0.title_width * 0.5, slot0.title_height * 0.5), cc.p(0.5, 0.5), false, PlayerAction.action_3)

		slot0.title_container:addChild(slot0.play_effect, 1)
	end
end

function ItemExhibitionView.close_callback(slot0)
	slot0:finalClose()
	uv0:openGetItemView(false)
end

function ItemExhibitionView.finalClose(slot0)
	for slot4, slot5 in ipairs(slot0.cache_list) do
		if slot5 and slot5.DeleteMe then
			slot5:DeleteMe()
		end
	end

	slot0.cache_list = {}

	slot0:handleEffect(false)

	slot0.render_list = {}

	GlobalEvent:getInstance():Fire(MainuiEvent.CLOSE_ITEM_VIEW, slot0.extend)
	GlobalEvent:getInstance():Fire(EventId.CAN_OPEN_LEVUPGRADE, true)
	GlobalEvent:getInstance():Fire(PokedexEvent.Call_End_Event)
end
