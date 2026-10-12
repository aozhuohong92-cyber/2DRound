BattlDramaSwapRewardWindow = BattlDramaSwapRewardWindow or BaseClass(BaseView)
slot0 = BattleDramaController:getInstance()

function BattlDramaSwapRewardWindow.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.layout_name = "battledrama/battle_drama_swap_reward_view"
	slot0.space = 40
	slot0.col = 4
	slot0.cache_list = {}
	slot0.can_close = false
	slot0.view_tag = ViewMgrTag.MSG_TAG
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.effect_cache_list = {}
	slot0.is_csb_action = true
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_12"),
			type = ResourcesType.single
		}
	}
end

function BattlDramaSwapRewardWindow.open_callback(slot0)
	slot1 = slot0.root_wnd:getChildByName("backpanel")

	slot1:setScale(display.getMaxScale())

	slot0.background = slot1:getChildByName("background")
	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.back_panel = slot0.main_container:getChildByName("back_panel")

	slot0.back_panel:setScale(display.getMaxScale())

	slot0.image_top_bg = createScale9Sprite(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_12"), slot0.back_panel:getContentSize().width / 2, slot0.back_panel:getContentSize().height, LOADTEXT_TYPE, slot0.back_panel)

	slot0.image_top_bg:setAnchorPoint(cc.p(0.5, 1))
	slot0.image_top_bg:setContentSize(cc.size(SCREEN_WIDTH + 100, 252.5))

	slot0.image_bottom_bg = createScale9Sprite(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_12"), slot0.back_panel:getContentSize().width / 2, 0, LOADTEXT_TYPE, slot0.back_panel)

	slot0.image_bottom_bg:setContentSize(cc.size(SCREEN_WIDTH + 100, 252.5))
	slot0.image_bottom_bg:setScaleY(-1)
	slot0.image_bottom_bg:setAnchorPoint(cc.p(0.5, 1))

	slot0.comfirm_btn = slot0.main_container:getChildByName("comfirm_btn")

	slot0.comfirm_btn:setTitleText(TI18N("确定"))
	slot0.comfirm_btn:getTitleRenderer():enableOutline(cc.c4b(196, 90, 20, 255), 2)

	slot0.scroll_view = slot0.main_container:getChildByName("scroll_view")

	slot0.scroll_view:setScrollBarEnabled(false)
	slot0.scroll_view:setSwallowTouches(false)

	slot0.scroll_width = slot0.scroll_view:getContentSize().width
	slot0.scroll_height = slot0.scroll_view:getContentSize().height
	slot3 = slot0.root_wnd:getChildByName("titlepanel")

	slot3:setPositionY(slot0.back_panel:getContentSize().height + slot0.back_panel:getPositionY() + slot3:getContentSize().height / 2)

	slot0.time_label = createRichLabel(22, 1, cc.p(0.5, 0.5), cc.p(slot0.main_container:getContentSize().width / 2 + 5, 35), nil, , 1000)

	slot0.time_label:setString(TI18N("10秒后关闭"))
	slot0.main_container:addChild(slot0.time_label)

	slot0.title_container = slot3:getChildByName("title_container")
	slot0.title_width = slot0.title_container:getContentSize().width
	slot0.title_height = slot0.title_container:getContentSize().height
end

function BattlDramaSwapRewardWindow.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended and uv0.can_close == true then
			uv1:openDramSwapRewardView(false)
		end
	end)

	if slot0.comfirm_btn then
		slot0.comfirm_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended and uv0.can_close == true then
				uv1:openDramSwapRewardView(false)
			end
		end)
	end
end

function BattlDramaSwapRewardWindow.openRootWnd(slot0, slot1)
	slot0:handleEffect(true)

	slot0.data = slot1

	slot0:updateData()
end

function BattlDramaSwapRewardWindow.updateData(slot0)
	if slot0.data then
		slot1 = #slot0.data.items
		slot2 = 4
		slot0.row = math.ceil(slot1 / slot2)
		slot0.space = 10
		slot0.max_height = math.max(slot0.space + (slot0.space + BackPackItem.Height) * slot0.row, slot0.scroll_view:getContentSize().height)

		slot0.scroll_view:setInnerContainerSize(cc.size(slot0.scroll_view:getContentSize().width, slot0.max_height))

		if slot2 <= slot1 then
			slot1 = slot2
		end

		slot0.start_x = (slot0.scroll_view:getContentSize().width - (slot1 * BackPackItem.Width + (slot1 - 1) * slot0.space)) * 0.5

		if slot0.row == 1 then
			slot0.start_y = slot0.max_height * 0.5
		else
			slot0.start_y = slot0.max_height - slot0.space - BackPackItem.Height * 0.5
		end

		for slot8, slot9 in ipairs(slot0.data.items) do
			slot10 = BackPackItem.new(true, true)

			slot10:setBaseData(slot9.bid, slot9.num)
			slot10:setPosition(cc.p(slot0.start_x + BackPackItem.Width * 0.5 + (slot8 - 1) % slot2 * (BackPackItem.Width + slot0.space), slot0.start_y - math.floor((slot8 - 1) / slot2) * (BackPackItem.Height + slot0.space)))
			slot0.scroll_view:addChild(slot10)

			slot0.cache_list[slot8] = slot10
		end

		GlobalTimeTicket:getInstance():add(function ()
			uv0.can_close = true

			uv0:updateTimer()
		end, 0.5, 1)
	end
end

function BattlDramaSwapRewardWindow.ItemAciton(slot0)
	if slot0.cache_list then
		slot1 = 0

		for slot5, slot6 in pairs(slot0.cache_list) do
			if slot6 then
				delayRun(slot0.root_wnd, 0.1 * (slot5 - 1), function ()
					uv0:setVisible(true)
					uv0:runAction(cc.Sequence:create(cc.ScaleTo:create(0.1, 1), cc.CallFunc:create(function ()
						uv0 = uv0 + 1

						if tableLen(uv1.cache_list) <= uv0 then
							-- Nothing
						end
					end)))
				end)
			end
		end
	end
end

function BattlDramaSwapRewardWindow.updateTimer(slot0)
	slot1 = 10

	GlobalTimeTicket:getInstance():add(function ()
		uv0 = uv0 - 1

		if uv1.time_label and not tolua.isnull(uv1.time_label) then
			uv1.time_label:setString(math.ceil(uv0) .. TI18N("秒后关闭"))
		end

		if slot0 <= 0 then
			uv2:openDramSwapRewardView(false)
			GlobalTimeTicket:getInstance():remove("close_swap_reward")
		end
	end, 1, 0, "close_swap_reward")
end

function BattlDramaSwapRewardWindow.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	elseif not tolua.isnull(slot0.title_container) and slot0.play_effect == nil then
		slot0.play_effect = createEffectSpine(PathTool.getEffectRes(103), cc.p(slot0.title_width * 0.5, slot0.title_height * 0.5), cc.p(0.5, 0.5), false, PlayerAction.action_3)

		slot0.title_container:addChild(slot0.play_effect, 1)
	end
end

function BattlDramaSwapRewardWindow.close_callback(slot0)
	slot0.render_list = {}

	for slot4, slot5 in ipairs(slot0.cache_list) do
		if slot5 and slot5.DeleteMe then
			slot5:DeleteMe()
		end
	end

	slot0.cache_list = {}

	slot0:handleEffect(false)
	GlobalEvent:getInstance():Fire(BattleEvent.CLOSE_RESULT_VIEW)
	uv0:openDramSwapRewardView(false)
end
