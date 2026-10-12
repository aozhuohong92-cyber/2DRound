AdventureMineWindow = AdventureMineWindow or BaseClass(BaseView)
slot0 = AdventureController:getInstance()
slot1 = AdventureController:getInstance():getUiModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.sort
slot5 = table.remove
slot6 = math.floor
slot7 = GameNet:getInstance()
slot8 = RoleController:getInstance():getRoleVo()

function AdventureMineWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.view_tag = ViewMgrTag.WIN_TAG
	slot0.win_type = WinType.Full
	slot0.layout_name = "adventure/adventure_mine_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("adventure", "adventurewindow"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("adventure", "adventuremine"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("quest", "quest"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/adventure", "adventure_mine_bg", true),
			type = ResourcesType.single
		}
	}
	slot0.had_register = false
	slot0.box_list = nil
	slot0.dic_mine_data = {}
	slot0.mine_item_list = {}
	slot0.update_all_mine_time = 5

	if Config.AdventureMineData.data_const.diamond_attack then
		slot0.max_buy_count = slot1.val
	else
		slot0.max_buy_count = 3
	end

	if Config.AdventureMineData.data_const.free_attack then
		slot0.max_free_count = slot2.val
	else
		slot0.max_free_count = 10
	end
end

function AdventureMineWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg/adventure", "adventure_mine_bg", true), LOADTEXT_TYPE)
	slot0.background:setScale(display.getMaxScale())

	slot0.top_container = slot0.root_wnd:getChildByName("top_container")
	slot0.title_container = slot0.top_container:getChildByName("title_container")

	slot0:playEnterAnimatianByObj(slot0.title_container, 1)

	slot0.top_title = slot0.title_container:getChildByName("label")
	slot0.title_background = slot0.title_container:getChildByName("title")
	slot0.explain_btn = slot0.top_container:getChildByName("explain_btn")

	slot0.explain_btn:getChildByName("label"):setString(TI18N("玩法说明"))

	slot0.record_btn = slot0.top_container:getChildByName("record_btn")

	slot0.record_btn:getChildByName("label"):setString(TI18N("防守记录"))

	slot0.bottom_container = slot0.root_wnd:getChildByName("bottom_container")
	slot0.return_btn = slot0.bottom_container:getChildByName("return_btn")
	slot0.moon_btn = slot0.bottom_container:getChildByName("moon_btn")

	slot0.moon_btn:getChildByName("label"):setString(TI18N("水晶秘境"))

	slot0.gotoadventure_btn = slot0.bottom_container:getChildByName("gotoadventure_btn")

	slot0.gotoadventure_btn:getChildByName("label"):setString(TI18N("继续冒险"))

	slot0.my_mine_btn = slot0.bottom_container:getChildByName("my_mine_btn")

	slot0.my_mine_btn:getChildByName("my_mine_label"):setString(TI18N("我的灵矿"))
	slot0.bottom_container:getChildByName("reward_label"):setString(TI18N("挑战奖励:"))

	slot0.challenged_count_label = slot0.bottom_container:getChildByName("change_num")

	slot0.bottom_container:getChildByName("end_time_title"):setString(TI18N("冒险重置"))

	slot0.end_time_value = slot0.bottom_container:getChildByName("end_time_value")
	slot0.occupy_count = createRichLabel(20, cc.c4b(255, 255, 255, 255), cc.p(0, 0.5), cc.p(20, 340), 6, nil, 900)

	slot0.bottom_container:addChild(slot0.occupy_count)

	slot1 = slot0.bottom_container:getChildByName("buy_panel")

	slot1:getChildByName("key"):setString(TI18N("挑战次数:"))

	slot0.buy_count_label = slot1:getChildByName("label")
	slot0.buy_btn = slot1:getChildByName("add_btn")
	slot0.buy_tips = createRichLabel(20, cc.c4b(255, 255, 255, 255), cc.p(0.5, 0.5), cc.p(0, -16), nil, , 600)

	slot1:addChild(slot0.buy_tips)

	slot0.list_conatiner = slot0.bottom_container:getChildByName("list_conatiner")
	slot2 = slot0.bottom_container:getChildByName("progress_container")
	slot0.progress = slot2:getChildByName("progress")

	slot0.progress:setScale9Enabled(true)

	if Config.AdventureMineData.data_box_reward and next(slot4) ~= nil then
		slot0.box_list = {}

		uv0(slot4, function (slot0, slot1)
			return slot0.num < slot1.num
		end)

		slot5 = slot4[#slot4].num
		slot0.max_num = slot5

		for slot10, slot11 in ipairs(slot4) do
			slot12 = {
				box = slot15,
				lable = createLabel(22, cc.c4b(100, 50, 35, 255), nil, slot13, -10, slot11.num, slot2, nil, cc.p(0.5, 0.5)),
				btn = createButton(slot2, "", slot13, slot3.height * 0.5, cc.size(52, 70), PathTool.getResFrame("common", "common_99998"))
			}
			slot13 = slot2:getContentSize().width / slot5 * slot11.num - 5

			slot2:addChild(createEffectSpine(PathTool.getEffectRes(slot11.effect_id or 110), cc.p(slot13, 8), cc.p(0.5, 0.5), true, PlayerAction.action_1))
			slot12.btn:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended then
					uv0:onClickBoxBtn(uv1, slot0:getTouchBeganPosition())
				end
			end)

			slot12.config = slot11
			slot12.pos = slot0.root_wnd:convertToNodeSpace(slot2:convertToWorldSpace(cc.p(slot13, slot3.height * 0.5)))
			slot0.box_list[slot11.num] = slot12
		end
	end

	slot0.cell_container = slot0.root_wnd:getChildByName("cell_container")
	slot0.cell_container_size = slot0.cell_container:getContentSize()
end

function AdventureMineWindow.register_event(slot0)
	registerButtonEventListener(slot0.return_btn, function ()
		uv0:openAdventureMineWindow(false)
	end, true, REGISTER_BUTTON_SOUND_CLOSED_TYPY)
	registerButtonEventListener(slot0.my_mine_btn, function ()
		uv0:openAdventureMineMyInfoPanel(true)
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.buy_btn, function ()
		uv0:onBuyBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.explain_btn, function (slot0, slot1, slot2)
		MainuiController:getInstance():openCommonExplainView(true, Config.AdventureMineData.data_explain, TI18N("玩法规则"))
	end, true, 1)
	registerButtonEventListener(slot0.record_btn, function ()
		uv0:openAdventureMineFightRecordPanel(true)
	end, true, 1)
	registerButtonEventListener(slot0.moon_btn, function ()
		uv0:openAdventureMineLayerPanel(true, {
			floor = uv1.floor_id
		})
	end, true, 1, nil, 0.9)
	registerButtonEventListener(slot0.gotoadventure_btn, function ()
		uv0:onGotoAdventure()
	end, true, 1, nil, 0.9)
	slot0:addGlobalEvent(AdventureEvent.ADVENTURE_MINE_BASE_INFO_EVENT, function (slot0)
		if not slot0 then
			return
		end

		if uv0.is_show_open_effect then
			uv0.is_show_open_effect = false

			uv0:playEnterEffect(true)
		end

		uv0.update_all_mine_step = uv0.update_all_mine_time

		uv0:updateMineList(slot0)
		uv1:setMineCountRedpoint(false)

		if uv0.open_setting then
			uv0:gotoAdventureFloorRoom(uv0.open_setting)

			uv0.open_setting = nil
		end
	end)
	slot0:addGlobalEvent(AdventureEvent.ADVENTURE_MINE_BOX_LIST_EVENT, function (slot0)
		if not slot0 then
			return
		end

		uv0:updateBoxInfo(slot0)
	end)
	slot0:addGlobalEvent(AdventureEvent.ADVENTURE_MINE_RECEIVE_BOX_EVENT, function (slot0)
		if not slot0 then
			return
		end

		if uv0.dic_receive_num then
			uv0.dic_receive_num[slot0.num] = true
		end

		uv0:updateBoxInfoByNum(slot0.num, 3)
	end)
	slot0:addGlobalEvent(AdventureEvent.ADVENTURE_MINE_BUY_COUNT_EVENT, function (slot0)
		if not slot0 then
			return
		end

		uv0:updateBuyInfo(slot0)
	end)
	slot0:addGlobalEvent(AdventureEvent.ADVENTURE_MINE_RECORD_RED_POINT_EVENT, function (slot0)
		uv0:checkRedpoint()
	end)
end

function AdventureMineWindow.gotoAdventureFloorRoom(slot0, slot1)
	if not slot0.mine_list then
		return
	end

	if not slot1 then
		return
	end

	slot3 = nil

	for slot7, slot8 in pairs(slot0.mine_list) do
		if slot8.room_id == ({
			floor = slot0.floor_id,
			room_id = slot1.room_id or 0
		}).room_id then
			slot3 = slot8

			break
		end
	end

	if not slot3 then
		return
	end

	if slot3.rid == 0 then
		slot2.show_type = 0

		uv0:openAdventureMineFightPanel(true, slot2)
	elseif uv1 and uv1.rid == slot3.rid and uv1.srv_id == slot3.srv_id then
		slot2.show_type = 2

		uv0:openAdventureMineFightPanel(true, slot2)
	else
		slot2.show_type = 1

		uv0:openAdventureMineFightPanel(true, slot2)
	end
end

function AdventureMineWindow.onGotoAdventure(slot0)
	if uv0:getAdventureBaseData() then
		if slot1.id and slot1.id == slot1.current_id then
			if Config.AdventureMineData.data_floor_data[slot1.current_id] then
				uv1:setMustChangeWindow()
				uv1:send20620(13, AdventureEvenHandleType.handle, {})
			end
		else
			uv1:requestEnterAdventure(true)
		end
	else
		uv1:requestEnterAdventure(true)
	end
end

function AdventureMineWindow.checkRedpoint(slot0)
	if uv0:isMineRecordRedpoint() then
		addRedPointToNodeByStatus(slot0.my_mine_btn, true, 5, 5)
		addRedPointToNodeByStatus(slot0.record_btn, true, 5, 5)
	else
		addRedPointToNodeByStatus(slot0.my_mine_btn, false, 5, 5)
		addRedPointToNodeByStatus(slot0.record_btn, false, 5, 5)
	end
end

function AdventureMineWindow.onBuyBtn(slot0, slot1)
	if not slot0.max_buy_count then
		return
	end

	if not slot0.buy_count then
		return
	end

	if slot0.max_buy_count <= slot0.buy_count then
		if slot1 then
			message(TI18N("已达到今日挑战次数上限"))
		else
			message(TI18N("购买次数已达上限"))
		end

		return
	end

	slot2 = Config.ItemData.data_assets_label2id.gold
	slot3 = 50

	if Config.AdventureMineData.data_const.diamond_cost then
		slot3 = slot4.val
	end

	slot5 = PathTool.getItemRes(Config.ItemData.data_get_data(slot2).icon)
	slot6 = nil

	CommonAlert.show((not slot1 or uv0(TI18N("挑战次数不足, 是否花费 <img src='%s' scale=0.3 /> %s购买一次挑战次数？"), slot5, slot3, slot4.val)) and uv0(TI18N("是否花费 <img src='%s' scale=0.3 /> %s购买一次挑战次数？"), slot5, slot3, slot4.val), TI18N("确定"), function ()
		uv0.is_send_fight = uv1

		uv2:send20655()
	end, TI18N("取消"), nil, CommonAlert.type.rich)
end

function AdventureMineWindow.onClickBoxBtn(slot0, slot1, slot2)
	if not slot0.box_list then
		return
	end

	if not slot0.dic_receive_num then
		return
	end

	if not slot0.had_combat_num then
		return
	end

	if slot0.dic_receive_num[slot1.num] then
		slot0:showRewardItems(slot1.items, slot2, slot1.num)
	elseif slot1.num <= slot0.had_combat_num then
		uv0:send20648(slot1.num)
	else
		slot0:showRewardItems(slot1.items, slot2, slot1.num)
	end
end

function AdventureMineWindow.showRewardItems(slot0, slot1, slot2, slot3)
	if not slot0.tips_layer then
		slot0.tips_layer = ccui.Layout:create()

		slot0.tips_layer:setContentSize(slot0.root_wnd:getContentSize())
		slot0.root_wnd:addChild(slot0.tips_layer)
		slot0.tips_layer:setTouchEnabled(true)
		registerButtonEventListener(slot0.tips_layer, function ()
			uv0.tips_bg:removeFromParent()

			uv0.tips_bg = nil

			uv0.tips_layer:removeFromParent()

			uv0.tips_layer = nil
		end, false, 1)
	end

	slot5 = {}

	if not slot0.tips_bg then
		slot0.tips_bg = createImage(slot0.tips_layer, PathTool.getResFrame("common", "common_1056"), slot4.width * 0.5, 100, cc.p(0, 0), true, 10, true)

		slot0.tips_bg:setTouchEnabled(true)
	end

	if slot0.tips_bg then
		slot0.tips_bg:setContentSize(cc.size(BackPackItem.Width * #slot1 + 50, BackPackItem.Height + 50))

		slot6 = cc.p(0.5, 0)

		if slot0.tips_bg:getContentSize().width * 0.5 + slot2.x >= 720 then
			slot6 = cc.p(0.86, 0)
		end

		slot0.tips_bg:setAnchorPoint(slot6)
		slot0.tips_bg:setPosition(slot0.box_list[slot3].pos.x, slot0.box_list[slot3].pos.y + 30)
	end

	slot6 = slot0.tips_bg:getContentSize()

	for slot11, slot12 in pairs(slot1) do
		if not slot5[slot11] then
			slot5[slot11] = BackPackItem.new(nil, true, nil, 0.8)

			slot5[slot11]:setAnchorPoint(cc.p(0.5, 0.5))
			slot0.tips_bg:addChild(slot5[slot11])
			slot5[slot11]:setBaseData(slot12[1])
			slot5[slot11]:setPosition(cc.p(25 + BackPackItem.Width * 0.5 + (slot11 - 1) * BackPackItem.Width, 100))
			slot5[slot11]:setDefaultTip()

			slot0.text_num = createLabel(22, cc.c4b(255, 238, 221, 255), nil, 60, -25, "", slot5[slot11], nil, cc.p(0.5, 0.5))

			slot0.text_num:setString("x" .. slot12[2])
		else
			slot5[slot11]:setBaseData(slot12[1])
			slot5[slot11]:setPosition(cc.p(slot7 + (slot11 - 1) * BackPackItem.Width, 100))
			slot0.text_num:setString("x" .. slot12[2])
		end
	end
end

function AdventureMineWindow.openRootWnd(slot0, slot1)
	if tolua.isnull(slot0.root_wnd) then
		return
	end

	slot2 = slot1 or {}
	slot0.is_show_open_effect = slot2.is_show_open_effect or false
	slot0.floor_id = slot2.floor_id
	slot0.open_setting = slot2.open_setting
	slot0.base_data = uv0:getAdventureBaseData()

	if not slot0.base_data then
		return
	end

	if not slot0.floor_id then
		return
	end

	slot0.base_data.current_id = slot0.floor_id

	slot0:sendUpdateMineData(1)
	uv1:send20647()
	slot0:checkRedpoint()
	slot0:updateBaseData()
end

function AdventureMineWindow.sendUpdateMineData(slot0, slot1)
	if slot0.floor_id then
		uv0:send20640(slot0.floor_id, slot1)
	end
end

function AdventureMineWindow.updateMineList(slot0, slot1)
	if not slot0.cell_container then
		return
	end

	slot0.floor_id = slot1.floor

	slot0:updateBuyInfo(slot1)
	uv0:setMineOccupyCount(slot1.occupy_count)
	slot0.occupy_count:setString(uv1(TI18N("当前占领：<div fontcolor=#14ff32>%s/%s</div>"), slot1.occupy_count, uv0:getMineLockCount() or 0))

	slot0.mine_list = {}

	for slot6, slot7 in ipairs(slot0.mine_item_list) do
		slot7:setVisible(false)
	end

	for slot6, slot7 in ipairs(slot1.list) do
		slot0.mine_list[slot7.room_id] = slot7
	end

	slot3 = 1
	slot5 = 10
	slot8 = slot5 + (slot0.cell_container_size.width - slot5 * 2) / 5 * 0.5
	slot9 = slot0.cell_container_size.height - 132 * 0.5

	for slot13, slot14 in pairs(slot0.mine_list) do
		if slot0.mine_item_list[slot3] == nil then
			slot0.mine_item_list[slot3] = AdventureMineItem.new(slot0)

			slot0.cell_container:addChild(slot0.mine_item_list[slot3])
		else
			slot0.mine_item_list[slot3]:setVisible(true)
		end

		slot16 = (slot13 - 1) % 5

		slot0.mine_item_list[slot3]:setPosition(slot8 + slot16 * slot6, slot9 - uv2((slot13 - 1) / 5) * slot7)
		slot0.mine_item_list[slot3]:setData(slot14, slot16)

		slot3 = slot3 + 1
	end
end

function AdventureMineWindow.updateBuyInfo(slot0, slot1)
	if not slot1 then
		return
	end

	if not slot0.buy_count_label then
		return
	end

	if not slot0.buy_tips then
		return
	end

	slot0.buy_count = slot1.buy_count

	uv0:setMineBuyCount(slot0.buy_count)
	uv0:setChallengeCount(slot1.count)
	slot0.buy_count_label:setString(uv1(TI18N("%s/%s"), slot1.count or 0, slot0.max_free_count))

	if slot0.max_buy_count - slot0.buy_count < 0 then
		slot2 = 0
	end

	slot0.buy_tips:setString(uv1(TI18N("(剩余购买次数：<div fontcolor=#14ff32>%s</div>)"), slot2))
end

function AdventureMineWindow.updateBaseData(slot0)
	if not slot0.floor_id then
		return
	end

	if Config.AdventureMineData.data_floor_data[slot0.floor_id] then
		slot0.top_title:setString(slot1.name)
	else
		slot0.top_title:setString(TI18N("公共灵矿1层"))
	end

	slot0:updateEndTime()
end

function AdventureMineWindow.updateBoxInfo(slot0, slot1)
	if not slot0.box_list then
		return
	end

	if not slot0.max_num then
		return
	end

	slot0.had_combat_num = slot1.had_combat_num or 0

	slot0.challenged_count_label:setString(uv0(TI18N("(挑战%s次)"), slot0.had_combat_num))
	slot0.progress:setPercent(slot0.had_combat_num * 100 / slot0.max_num)

	slot0.dic_receive_num = {}

	for slot5, slot6 in ipairs(slot1.num_list) do
		slot0.dic_receive_num[slot6.num] = true
	end

	for slot5, slot6 in pairs(slot0.box_list) do
		if slot6.config then
			if slot0.dic_receive_num[slot6.config.num] then
				slot0:updateBoxInfoByNum(slot6.config.num, 3)
			elseif slot6.config.num <= slot0.had_combat_num then
				slot0:updateBoxInfoByNum(slot6.config.num, 2)
			else
				slot0:updateBoxInfoByNum(slot6.config.num, 1)
			end
		end
	end
end

function AdventureMineWindow.updateBoxInfoByNum(slot0, slot1, slot2)
	if not slot0.box_list then
		return
	end

	if slot0.box_list[slot1] and slot0.box_list[slot1].box then
		if slot2 == 1 then
			slot0.box_list[slot1].box:setAnimation(0, PlayerAction.action_1, true)
		elseif slot2 == 2 then
			slot0.box_list[slot1].box:setAnimation(0, PlayerAction.action_2, true)
		else
			slot0.box_list[slot1].box:setAnimation(0, PlayerAction.action_3, true)
		end
	end
end

function AdventureMineWindow.updateEndTime(slot0)
	if slot0.base_data == nil then
		return
	end

	if slot0.timeticket == nil then
		slot0.update_all_mine_step = slot0.update_all_mine_time

		slot0:countDownEndTime()

		slot0.timeticket = GlobalTimeTicket:getInstance():add(function ()
			uv0:countDownEndTime()
		end, 1)
	end
end

function AdventureMineWindow.countDownEndTime(slot0)
	if slot0.base_data == nil then
		slot0:clearEneTime()

		return
	end

	if slot0.base_data.end_time - uv0:getTime() <= 0 then
		slot1 = 0

		slot0:clearEneTime()
	end

	slot0.end_time_value:setString(TimeTool.GetTimeFormat(slot1))

	slot0.update_all_mine_step = slot0.update_all_mine_step - 1

	if slot0.update_all_mine_step == 0 then
		slot0.update_all_mine_step = slot0.update_all_mine_time

		slot0:sendUpdateMineData()
	end
end

function AdventureMineWindow.clearEneTime(slot0)
	if slot0.timeticket then
		GlobalTimeTicket:getInstance():remove(slot0.timeticket)

		slot0.timeticket = nil
	end
end

function AdventureMineWindow.playEnterEffect(slot0, slot1)
	if not slot1 then
		if slot0.enter_effect then
			slot0.enter_effect:removeFromParent()

			slot0.enter_effect = nil
		end
	else
		if slot0.enter_effect == nil then
			slot0.enter_effect = createEffectSpine(PathTool.getEffectRes(157), cc.p(SCREEN_WIDTH * 0.5, SCREEN_HEIGHT * 0.5), cc.p(0.5, 0.5), false, PlayerAction.action_1)

			slot0.root_wnd:addChild(slot0.enter_effect, 1)
		end

		slot0.enter_effect:setVisible(true)
		slot0.enter_effect:setAnimation(0, PlayerAction.action_1, false)

		if slot0.had_register == false and slot0.enter_effect then
			slot0.had_register = true

			slot0.enter_effect:registerSpineEventHandler(function ()
				uv0.enter_effect:setVisible(false)
			end, sp.EventType.ANIMATION_COMPLETE)
		end
	end
end

function AdventureMineWindow.close_callback(slot0)
	slot0:clearEneTime()
	slot0:playEnterEffect(false)
	uv0:openAdventureMineWindow(false)
end

AdventureMineItem = class("AdventureMineItem", function ()
	return ccui.Layout:create()
end)

function AdventureMineItem.ctor(slot0, slot1)
	slot0.parents = slot1
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("adventure/adventure_mine_item"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.icon = slot0.container:getChildByName("icon")
	slot0.namebg = slot0.container:getChildByName("namebg")
	slot0.serve_name = slot0.container:getChildByName("serve_name")
	slot0.name = slot0.container:getChildByName("name")
	slot0.mark_img = slot0.container:getChildByName("mark_img")
	slot0.level = slot0.container:getChildByName("level")
	slot0.level_bg = slot0.container:getChildByName("level_bg")
	slot0.head_img = slot0.container:getChildByName("head_img")
	slot0.head_item = PlayerHead.new(PlayerHead.type.circle)

	slot0.head_item:setScale(0.65)
	slot0.container:addChild(slot0.head_item)
	slot0:registerEvent()
end

function AdventureMineItem.registerEvent(slot0)
	slot0.container:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if not uv0.data then
				return
			end

			if not uv0.parents then
				return
			end

			if uv0.data.rid == 0 then
				uv1:openAdventureMineFightPanel(true, {
					floor = uv0.parents.floor_id,
					room_id = uv0.data.room_id,
					show_type = 0
				})
			elseif uv2 and uv2.rid == uv0.data.rid and uv2.srv_id == uv0.data.srv_id then
				slot2.show_type = 2

				uv1:openAdventureMineFightPanel(true, slot2)
			else
				slot2.show_type = 1

				uv1:openAdventureMineFightPanel(true, slot2)
			end
		end
	end)
end

function AdventureMineItem.setData(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	slot0.data = slot1
	slot0.config = Config.AdventureMineData.data_mine_data(slot1.mine_id)

	if not slot0.config then
		return
	end

	if slot0.config.res_id == nil or slot3 == "" then
		slot3 = 1001
	end

	slot4 = PathTool.getPlistImgForDownLoad("adventure/mine_icon", slot3, false)

	if slot0.record_res == nil or slot0.record_res ~= slot4 then
		slot0.record_res = slot4
		slot0.item_load = loadSpriteTextureFromCDN(slot0.icon, slot4, ResourcesType.single, slot0.item_load)
	end

	slot0.level:setString(slot0.config.star or 0)

	if slot0.data.rid == 0 then
		slot0.mark_img:setVisible(false)
		slot0.serve_name:setVisible(false)
		slot0.head_img:setVisible(false)
		slot0.head_item:setVisible(false)
		slot0.name:setPositionY(20)
		slot0.name:setString(slot1.name)
		slot0.name:setColor(cc.c4b(255, 255, 255, 255))
	elseif uv0 and uv0.rid == slot1.rid and uv0.srv_id == slot1.srv_id then
		slot0.mark_img:setVisible(true)
		slot0.serve_name:setVisible(false)
		slot0.head_img:setVisible(false)
		slot0.head_item:setVisible(false)
		slot0.name:setPositionY(20)
		slot0.name:setString(TI18N("我的灵矿"))
		slot0.name:setColor(cc.c4b(20, 255, 50, 255))
	else
		slot0.mark_img:setVisible(false)
		slot0.serve_name:setVisible(true)
		slot0.name:setPositionY(10)
		slot0.serve_name:setString(uv1("[%s]", getServerName(slot1.srv_id) or TI18N("异域")))
		slot0.name:setString(slot1.name)
		slot0.serve_name:setColor(cc.c4b(255, 139, 127, 255))
		slot0.name:setColor(cc.c4b(255, 139, 127, 255))
		slot0.head_img:setVisible(true)
		slot0.head_item:setVisible(true)
		slot0.head_item:setHeadRes(slot0.data.face, false, LOADTEXT_TYPE, slot0.data.face_file, slot0.data.face_update_time)
		slot0.head_item:setLev(slot0.data.lev or 0)

		if slot2 and slot2 == 4 then
			slot0.head_item:setPosition(5, 90)
			slot0.head_img:setPosition(20, 60)
			slot0.head_img:setScaleX(-1)
		else
			slot0.head_item:setPosition(135, 90)
			slot0.head_img:setPosition(118, 60)
			slot0.head_img:setScaleX(1)
		end
	end

	if slot2 then
		slot0:setZOrder(5 - slot2)
	end

	if slot1.status == 2 then
		slot0:showEffect(true)
		slot0:fightStatus(false)
	elseif slot1.status == 1 then
		slot0:fightStatus(true)
		slot0:showEffect(false)
	else
		slot0:showEffect(false)
		slot0:fightStatus(false)
	end
end

function AdventureMineItem.fightStatus(slot0, slot1)
	if slot1 == false then
		if slot0.fight_effect then
			slot0.fight_effect:setVisible(false)
			slot0.fight_effect:removeFromParent()

			slot0.fight_effect = nil
		end
	elseif slot0.fight_effect == nil then
		slot0.fight_effect = createEffectSpine(PathTool.getEffectRes(186), cc.p(70, 118), cc.p(0.5, 0.5), true, PlayerAction.action)

		slot0.fight_effect:setScale(1)
		slot0:addChild(slot0.fight_effect, 10)
	end
end

function AdventureMineItem.showEffect(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.play_effect == nil then
			slot0.play_effect = createEffectSpine("E23014", cc.p(73, 55), cc.p(0.5, 0.5), true, PlayerAction.action)

			slot0:addChild(slot0.play_effect, 1)
		end
	elseif slot0.play_effect then
		slot0.play_effect:setVisible(false)
		slot0.play_effect:removeFromParent()

		slot0.play_effect = nil
	end
end

function AdventureMineItem.DeleteMe(slot0)
	if slot0.item_load then
		slot0.item_load:DeleteMe()
	end

	slot0.item_load = nil

	slot0:showEffect(false)
	slot0:fightStatus(false)
end
