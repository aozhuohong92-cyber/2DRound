HeroExpeditWindow = HeroExpeditWindow or BaseClass(BaseView)
slot0 = HeroExpeditController:getInstance()
slot1 = 360
slot2 = Config.ExpeditionData.data_sign_info
slot3 = Config.ExpeditionData.data_sign_info_length
slot4 = 5

function HeroExpeditWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.layout_name = "heroexpedit/hero_expedit_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("heroexpedit", "heroexpedit"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/heroexpedit", "heroexpedit_bg", true),
			type = ResourcesType.single
		}
	}
	slot0.box_index = 0
	slot0.model_index = 1
	slot0.box_list = {}
	slot0.point_list = {}
	slot0.facial_list = {}
	slot0.play_effect = {}
end

function HeroExpeditWindow.open_callback(slot0)
	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.expedit_bg = slot0.root_wnd:getChildByName("bg")
	slot0.close_btn = slot0.main_container:getChildByName("btn_return")
	slot0.map_layer = slot0.main_container:getChildByName("map_layer")
	slot0.btn_employ = slot0.main_container:getChildByName("btn_employ")

	slot0.btn_employ:getChildByName("Text_1"):setString(TI18N("好友助阵"))

	slot0.btn_shop = slot0.main_container:getChildByName("btn_shop")

	slot0.btn_shop:getChildByName("Text_1_0"):setString(TI18N("远征商城"))

	slot0.btn_rule = slot0.main_container:getChildByName("btn_rule")
	slot0.get_reward_bg = slot0.main_container:getChildByName("get_reward_bg")

	slot0.get_reward_bg:getChildByName("Image_2"):getChildByName("Text_2"):setString(TI18N("今日已获取奖励："))

	slot1 = slot0.main_container:getChildByName("top_panel")

	slot1:setPositionY(display.getTop() - MainuiController:getInstance():getMainUi():getTopViewHeight() + 12)

	slot0.expedit_title = slot1:getChildByName("Text_10")

	slot0.expedit_title:setString(TI18N("英雄远征"))

	slot0.model_name_text = {
		TI18N(" （普通）"),
		TI18N(" （困难）"),
		TI18N(" （地狱）")
	}
	slot0.model_name = slot1:getChildByName("model_name")

	slot0.model_name:setString("")

	slot0.expedit_reward = {}

	for slot7 = 1, 2 do
		slot0.expedit_reward[slot7] = createRichLabel(24, cc.c4b(255, 246, 199, 255), cc.p(0, 0.5), cc.p(0, 0), nil, , 250)

		slot0.get_reward_bg:addChild(slot0.expedit_reward[slot7])
		slot0.expedit_reward[slot7]:setPosition(35, ({
			72,
			33
		})[slot7])
	end
end

function HeroExpeditWindow.register_event(slot0)
	slot0:addGlobalEvent(HeroExpeditEvent.HeroExpeditViewEvent, function (slot0)
		if not slot0 then
			return
		end

		uv0:setExpeditLevelMessage(slot0)
	end)
	slot0:addGlobalEvent(HeroExpeditEvent.Get_Box_Event, function (slot0)
		uv0:checkBoxStatus(2, slot0)
	end)
	slot0:addGlobalEvent(HeroExpeditEvent.MeHelp_RedPoint_Event, function (slot0)
		addRedPointToNodeByStatus(uv1.btn_employ, uv0:getModel():getHeroSendRedPoint())
	end)
	slot0:addGlobalEvent(HeroExpeditEvent.Expedit_Clear_Event, function (slot0)
		uv0:clearGuard(slot0.guard_id)
	end)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openHeroExpeditView(false)
	end, true, 2)
	registerButtonEventListener(slot0.btn_employ, function ()
		uv0:openEmpolyPanelView(true)
	end, true, 1)
	registerButtonEventListener(slot0.btn_shop, function ()
		MallController:getInstance():openMallPanel(true, MallConst.MallType.FriendShop)
	end, true, 1)
	registerButtonEventListener(slot0.btn_rule, function (slot0, slot1, slot2)
		TipsManager:getInstance():showCommonTips(Config.ExpeditionData.data_const.game_rule.desc, slot1:getTouchBeganPosition(), nil, , 500)
	end, true, 1)
end

function HeroExpeditWindow.setExpeditLevelMessage(slot0, slot1)
	for slot5, slot6 in pairs(slot1.rewards) do
		slot0.expedit_reward[slot5]:setString(string.format("<img src=%s visible=true scale=0.35 />  %d", PathTool.getItemRes(Config.ItemData.data_get_data(slot6.bid).icon), slot6.num))
	end

	if uv0:getModel():getDifferentChoose() == 4 then
		slot0.expedit_title:setPositionX(188)
	else
		slot0.model_name:setString(slot0.model_name_text[slot2] or "")
	end

	if slot0.point_list[slot1.guard_id] then
		setChildUnEnabled(false, slot0.point_list[slot1.guard_id])

		slot3 = slot1.guard_id or 1
		slot5 = false

		for slot9, slot10 in pairs(uv0:getModel():getExpeditBoxData()) do
			if slot10 == slot1.guard_id - 1 then
				slot5 = true

				break
			end
		end

		if (slot5 == true and slot3 - 2 or slot3 - 1) <= 0 then
			slot3 = 1
		end

		if not slot0.facial_list[slot1.guard_id] then
			slot0.point_list[slot1.guard_id]:setContentSize(cc.size(38, 100))

			slot0.facial_list[slot1.guard_id] = createSprite(PathTool.getResFrame("heroexpedit", "heroexpedit_8"), 0, 40, slot0.point_list[slot1.guard_id], cc.p(0, 0), LOADTEXT_TYPE_PLIST, 1)
		elseif slot0.facial_list[slot1.guard_id] then
			loadSpriteTexture(slot0.facial_list[slot1.guard_id], PathTool.getResFrame("heroexpedit", "heroexpedit_8"))
		end

		if slot0.facial_list[slot3] then
			loadSpriteTexture(slot0.facial_list[slot3], PathTool.getResFrame("heroexpedit", "heroexpedit_7"))
		end

		if slot1.guard_id == uv1 - 1 and slot0.facial_list[slot1.guard_id] then
			loadSpriteTexture(slot0.facial_list[slot1.guard_id], PathTool.getResFrame("heroexpedit", "heroexpedit_8"))
		end
	end

	if uv1 < slot1.guard_id and slot0.facial_list[uv1 - 1] then
		loadSpriteTexture(slot0.facial_list[uv1 - 1], PathTool.getResFrame("heroexpedit", "heroexpedit_7"))
	end

	slot4 = 0

	for slot8, slot9 in pairs(uv0:getModel():getExpeditBoxData()) do
		if slot9 == slot1.guard_id - 1 then
			slot4 = 1

			for slot13, slot14 in pairs(slot1.reward) do
				if slot14.reward_id == slot1.guard_id - 1 then
					slot4 = 2

					break
				end
			end
		end
	end

	slot0:checkBoxStatus(slot4, slot1.guard_id - 1)
end

function HeroExpeditWindow.checkBoxStatus(slot0, slot1, slot2)
	if slot2 <= 0 then
		return
	end

	slot4 = 0

	for slot8, slot9 in pairs(uv0:getModel():getExpeditBoxData()) do
		if slot9 == slot2 then
			slot4 = slot8

			break
		end
	end

	slot0:updateTaskList(slot1, slot4)
end

function HeroExpeditWindow.registerEvent(slot0)
	slot4 = cc.EventListenerTouchOneByOne:create()

	slot4:registerScriptHandler(function (slot0, slot1)
		uv0.touch_point = nil

		doStopAllActions(uv0.expedit_bg)

		return true
	end, cc.Handler.EVENT_TOUCH_BEGAN)
	slot4:registerScriptHandler(function (slot0, slot1)
		uv0.touch_point = slot0:getDelta()

		uv0.expedit_bg:setPositionX(uv0:setBorder(uv0.touch_point.x))
	end, cc.Handler.EVENT_TOUCH_MOVED)
	slot4:registerScriptHandler(function (slot0, slot1)
	end, cc.Handler.EVENT_TOUCH_ENDED)
	slot0.map_layer:getEventDispatcher():addEventListenerWithSceneGraphPriority(slot4, slot0.map_layer)
end

function HeroExpeditWindow.setBorder(slot0, slot1)
	if slot0.move_pos <= slot0.expedit_bg:getPositionX() + slot1 then
		slot2 = slot0.move_pos
	end

	if slot2 <= uv0 - (slot0.move_pos - uv0) then
		slot2 = uv0 - (slot0.move_pos - uv0)
	end

	return slot2
end

function HeroExpeditWindow.updateTaskList(slot0, slot1, slot2)
	slot3 = PlayerAction.action_1

	if slot1 == 0 then
		slot3 = PlayerAction.action_1
	elseif slot1 == 1 then
		slot3 = PlayerAction.action_2
	elseif slot1 == 2 then
		slot3 = PlayerAction.action_3
	end

	if slot0.play_effect[slot2] then
		slot0.play_effect[slot2]:clearTracks()
		slot0.play_effect[slot2]:removeFromParent()

		slot0.play_effect[slot2] = nil
	end

	if not tolua.isnull(slot0.box_list[slot2]) and slot0.play_effect[slot2] == nil then
		slot0.play_effect[slot2] = createEffectSpine(PathTool.getEffectRes(110), cc.p(slot0.box_list[slot2]:getContentSize().width * 0.5, 15), cc.p(0, 0), true, slot3)

		slot0.box_list[slot2]:addChild(slot0.play_effect[slot2])
	end
end

function HeroExpeditWindow.openRootWnd(slot0)
	if uv0:getModel():getExpeditData() or next(slot1) ~= nil then
		slot0.expedit_bg:ignoreContentAdaptWithSize(true)
		slot0.expedit_bg:loadTexture(PathTool.getPlistImgForDownLoad("bigbg/heroexpedit", "heroexpedit_bg", true), LOADTEXT_TYPE)

		slot0.move_pos = slot0.expedit_bg:getContentSize().width * 0.5

		slot0.expedit_bg:setScale(display.getMaxScale())

		slot1.guard_id = slot1.guard_id or 1
		slot0.move_pos = slot0.move_pos or 540

		if slot1.guard_id <= 3 then
			slot0.expedit_bg:setPositionX(slot0.move_pos)
		end
	end

	addRedPointToNodeByStatus(slot0.btn_employ, uv0:getModel():getHeroSendRedPoint())
	slot0:registerEvent()
	slot0:createBoxOrPoint()
end

function HeroExpeditWindow.createBoxOrPoint(slot0)
	slot1 = {
		{
			373,
			760
		},
		{
			721,
			679
		},
		{
			351,
			468
		},
		{
			609,
			250
		},
		{
			902,
			499
		}
	}
	slot2 = {
		0,
		0,
		0,
		0,
		0,
		0,
		0
	}
	slot3 = uv0:getModel():getExpeditBoxData()

	if not uv0:getModel():getExpeditData() or next(slot4) == nil then
		return
	end

	if next(slot4) ~= nil then
		for slot8, slot9 in pairs(slot3) do
			if slot9 <= slot4.guard_id then
				slot2[slot8] = 1
			end

			for slot13, slot14 in pairs(slot4.reward) do
				if slot9 == slot14.reward_id then
					slot2[slot8] = 2
				end
			end
		end
	end

	for slot8 = 1, uv1 do
		delayRun(slot0.main_container, slot8 * 2 / 60, function ()
			if uv0[uv1].type == 1 then
				uv2.point_list[uv1] = ccui.Layout:create()

				uv2.point_list[uv1]:setTouchEnabled(true)
				uv2.point_list[uv1]:setAnchorPoint(0.5, 0)
				uv2.point_list[uv1]:setPosition(uv0[uv1].pos[1][1], uv0[uv1].pos[1][2])
				uv2.expedit_bg:addChild(uv2.point_list[uv1])
				createImage(uv2.point_list[uv1], PathTool.getResFrame("heroexpedit", "heroexpedit_6"), 0, 0, cc.p(0, 0), true, 1, false)

				if uv1 == uv3.guard_id then
					if not uv2.facial_list[uv1] then
						uv2.point_list[uv1]:setContentSize(cc.size(38, 100))

						uv2.facial_list[uv1] = createSprite(PathTool.getResFrame("heroexpedit", "heroexpedit_8"), 0, 40, uv2.point_list[uv1], cc.p(0, 0), LOADTEXT_TYPE_PLIST, 1)
					end
				elseif uv1 < uv3.guard_id then
					if not uv2.facial_list[uv1] then
						uv2.point_list[uv1]:setContentSize(cc.size(38, 100))

						uv2.facial_list[uv1] = createSprite(PathTool.getResFrame("heroexpedit", "heroexpedit_7"), 0, 40, uv2.point_list[uv1], cc.p(0, 0), LOADTEXT_TYPE_PLIST, 1)
					end
				else
					setChildUnEnabled(true, uv2.point_list[uv1])
					uv2.point_list[uv1]:setContentSize(cc.size(38, 40))
				end

				registerButtonEventListener(uv2.point_list[uv1], function ()
					uv0:sender24401(uv1)
				end, true, 1)
			elseif uv0[uv1].type == 2 then
				uv2.box_index = uv2.box_index + 1
				uv2.box_list[uv2.box_index] = ccui.Layout:create()

				uv2.box_list[uv2.box_index]:setTouchEnabled(true)
				registerButtonEventListener(uv2.box_list[uv2.box_index], function ()
					if uv1 <= uv0:getGrardID() then
						uv0:sender24402(uv1)
					else
						uv0:sender24401(uv1)
					end
				end, true, 1)
				uv2.box_list[uv2.box_index]:setContentSize(cc.size(62, 44))
				uv2.box_list[uv2.box_index]:setAnchorPoint(0.5, 0.5)
				uv2.box_list[uv2.box_index]:setPosition(uv0[uv1].pos[1][1], uv0[uv1].pos[1][2])
				uv2.expedit_bg:addChild(uv2.box_list[uv2.box_index])
				uv2:updateTaskList(uv5[uv2.box_index], uv2.box_index)
			end
		end)
	end

	uv0:sender24400()
end

function HeroExpeditWindow.clearGuard(slot0, slot1)
	if (slot1 or 1) - 1 < 1 then
		slot1 = 1
	end

	for slot7, slot8 in pairs(uv0:getModel():getExpeditBoxData()) do
		if slot8 <= slot1 then
			-- Nothing
		end

		slot0:updateTaskList(({
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			[slot7] = 1
		})[slot7], slot7)
	end

	for slot7 = 1, slot1 do
		if slot0.point_list[slot7] then
			setChildUnEnabled(false, slot0.point_list[slot7])
		end

		if not slot0.facial_list[slot7] and slot0.point_list[slot7] then
			slot0.facial_list[slot7] = createSprite(PathTool.getResFrame("heroexpedit", "heroexpedit_7"), 0, 40, slot0.point_list[slot7], cc.p(0, 0), LOADTEXT_TYPE_PLIST, 1)
		elseif slot0.facial_list[slot7] then
			loadSpriteTexture(slot0.facial_list[slot7], PathTool.getResFrame("heroexpedit", "heroexpedit_7"))
		end
	end
end

function HeroExpeditWindow.close_callback(slot0)
	if slot0.play_effect and next(slot0.play_effect or {}) ~= nil then
		for slot4 = 1, uv0 do
			if slot0.play_effect[slot4] then
				slot0.play_effect[slot4]:clearTracks()
				slot0.play_effect[slot4]:removeFromParent()

				slot0.play_effect[slot4] = nil
			end
		end
	end

	slot0.play_effect = {}

	uv1:openHeroExpeditView(false)
end
