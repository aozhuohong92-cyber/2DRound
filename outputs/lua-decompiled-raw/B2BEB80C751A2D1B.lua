AuguryWindow = AuguryWindow or BaseClass(BaseView)
slot0 = BackpackController:getInstance():getModel()
slot1 = AuguryController:getInstance()

function AuguryWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.layout_name = "augury/augury_window"
	slot0.cur_type = 0
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("augury", "augury"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_30", true),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_31"),
			type = ResourcesType.single
		}
	}
	slot0.tab_list = {}
	slot0.select_type = 1
	slot0.view_list = {}
	slot0.effect_cache_list = {}
	slot0.is_init = true
	slot0.quality_list = {
		3,
		2,
		5,
		4,
		1
	}
	slot0.old_quality = 0
	slot0.is_play_effect = false
end

function AuguryWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_30", true), LOADTEXT_TYPE)
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.mainContainer = slot0.root_wnd:getChildByName("main_container")
	slot0.container = slot0.mainContainer:getChildByName("container")
	slot0.effect_panel = slot0.mainContainer:getChildByName("effect_panel")

	slot0.effect_panel:setVisible(false)
	slot0.effect_panel:setTouchEnabled(false)

	for slot5 = 1, 4 do
		slot6 = {
			btn = slot7,
			label = slot7:getChildByName("label"),
			unselect_bg = slot7:getChildByName("bg"),
			index = slot5
		}

		slot0.mainContainer:getChildByName("tab_btn_" .. slot5):setTouchEnabled(true)
		slot6.label:setString(({
			TI18N(""),
			TI18N("海底监狱"),
			TI18N("星命背包"),
			TI18N("星命商城")
		})[slot5])

		slot0.tab_list[slot5] = slot6
	end

	slot0.close_btn = slot0.mainContainer:getChildByName("close_btn")
	slot0.flash_btn = slot0.mainContainer:getChildByName("flash_btn")
	slot2 = slot0.flash_btn:getChildByName("label")

	slot2:setString(TI18N("刷新运势"))
	UITool.SetTitleColor(slot2)

	slot0.one_cost_config = Config.StarDivinationData.data_divination_const.divine_change
	slot0.ten_cost_config = Config.StarDivinationData.data_divination_const.divine_change10
	slot0.one_call_label = createRichLabel(24, 1, cc.p(0.5, 0.5), cc.p(155, 65))

	slot0.one_call_label:setString(string.format(TI18N("<img src=%s visible=true scale=0.3 /> <div fontColor=#ffffff fontsize=22 > %s</div>"), PathTool.getItemRes(Config.ItemData.data_get_data(slot0.one_cost_config.val[1]).icon), slot0.one_cost_config.val[2]))
	slot0.mainContainer:addChild(slot0.one_call_label)

	slot0.ten_gold_label = createRichLabel(24, 1, cc.p(0.5, 0.5), cc.p(565, 65))

	slot0.ten_gold_label:setString(string.format(TI18N("<img src=%s visible=true scale=0.3 /> <div fontColor=#ffffff fontsize=22 > %s</div>"), PathTool.getItemRes(Config.ItemData.data_get_data(slot0.ten_cost_config.val[1]).icon), slot0.ten_cost_config.val[2]))
	slot0.mainContainer:addChild(slot0.ten_gold_label)

	slot0.gold_btn = slot0.mainContainer:getChildByName("gold_btn")
	slot9 = slot0.gold_btn:getChildByName("label")

	slot9:setString(slot0.ten_cost_config.desc)
	slot9:setLocalZOrder(99)

	slot0.call_btn = slot0.mainContainer:getChildByName("call_btn")
	slot10 = slot0.call_btn:getChildByName("label")

	slot10:setString(slot0.one_cost_config.desc)
	slot10:setLocalZOrder(99)

	slot0.item_container = slot0.mainContainer:getChildByName("item_container_1")
	slot0.item_label_1 = slot0.item_container:getChildByName("label")
	slot0.item_config_1 = Config.StarDivinationData.data_divination_const.up_item

	if slot0.item_config_1 and Config.ItemData.data_get_data(slot0.item_config_1.val) then
		loadSpriteTexture(slot0.item_container:getChildByName("img"), PathTool.getItemRes(slot12.icon), LOADTEXT_TYPE)
	end

	slot0.other_item_container = slot0.mainContainer:getChildByName("item_container_2")
	slot0.item_label_2 = slot0.other_item_container:getChildByName("label")
	slot0.item_config_2 = Config.StarDivinationData.data_divination_const.exchange_item

	if slot0.item_config_2 and Config.ItemData.data_get_data(slot0.item_config_2.val) then
		loadSpriteTexture(slot0.other_item_container:getChildByName("img"), PathTool.getItemRes(slot13.icon), LOADTEXT_TYPE)
	end

	slot0:createDesc()
end

function AuguryWindow.register_event(slot0)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openMainView(false)
		end
	end)
	slot0.item_container:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.item_config_1 then
				BackpackController:getInstance():openTipsSource(true, uv0.item_config_1.val)
			end
		end
	end)
	slot0.other_item_container:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.item_config_2 then
				BackpackController:getInstance():openTipsSource(true, uv0.item_config_2.val)
			end
		end
	end)
	slot0.flash_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if (StartowerController:getInstance():getModel():getNowTowerId() or 0) < 10 then
				message(TI18N("无需刷新，当前仅可抽取白羊座命格"))

				return
			end

			uv0:openAlertWidnow(true, 3)
		end
	end)
	slot0.gold_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			if uv0.is_play_effect then
				return
			end

			playButtonSound2()
			uv1:openAlertWidnow(true, 2)
		end
	end)

	function slot4(slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			if uv0.is_play_effect then
				return
			end

			playButtonSound2()

			if uv1:getModel():checkHaveFreeTimes() == true then
				uv1:sender11331(1, 1)
			else
				uv1:openAlertWidnow(true, 1)
			end
		end
	end

	slot0.call_btn:addTouchEventListener(slot4)

	for slot4, slot5 in pairs(slot0.tab_list) do
		slot5.btn:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				uv0:clickBtn(uv1.index)
			end
		end)
	end

	if not slot0.augury_success_event then
		slot0.augury_success_event = GlobalEvent:getInstance():Bind(AuguryEvent.Augury_Success_Event, function (slot0)
			uv0.success_data = slot0

			uv0:playActionEffect(slot0)
		end)
	end

	if not slot0.update_data_event then
		slot0.update_data_event = GlobalEvent:getInstance():Bind(AuguryEvent.Update_Event, function ()
			if Config.StarDivinationData.data_divination_flash_name[uv0:getModel():getLuck() or 0] then
				uv1.now_lucky:setString(string.format(TI18N("当前运势：<div fontcolor=#cc6031>%s</div>"), slot1.star_name))
				uv1.tips_desc:setString(string.format(TI18N("获得%s座命格几率提升"), slot1.star_name))
			end

			uv1:checkOneCallStatus()
			uv1.call_num:setString(string.format(TI18N("再抽<div fontcolor=#35ff14>%s</div>次"), uv0:getModel():getLessCount() or 0))

			if uv1.is_init == true then
				uv1:handleEffect(true)

				uv1.is_init = false

				if uv1.old_quality ~= (uv0:getModel():getQuality() or 1) then
					uv1:createQualityEffect(slot3)

					uv1.old_quality = slot3
				end
			end
		end)
	end

	if not slot0.goods_add_event then
		slot0.goods_add_event = GlobalEvent:getInstance():Bind(BackpackEvent.ADD_GOODS, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
				return
			end

			if uv0.item_config_1 == nil then
				return
			end

			for slot5, slot6 in pairs(slot1) do
				if slot6.base_id == uv0.item_config_1.val then
					uv0:updateItemSum()

					break
				end
			end
		end)
	end

	if not slot0.goods_update_event then
		slot0.goods_update_event = GlobalEvent:getInstance():Bind(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
				return
			end

			if uv0.item_config_1 == nil then
				return
			end

			for slot5, slot6 in pairs(slot1) do
				if slot6.base_id == uv0.item_config_1.val then
					uv0:updateItemSum()

					break
				end
			end
		end)
	end

	if slot0.role_assets_event == nil then
		if slot0.role_vo == nil then
			slot0.role_vo = RoleController:getInstance():getRoleVo()
		end

		if slot0.role_vo then
			slot0.role_assets_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
				if slot0 == "star_point" then
					uv0:updateHaveAssert()
				end
			end)
		end
	end
end

function AuguryWindow.createDesc(slot0)
	slot1 = slot0.container:getContentSize()
	slot0.now_lucky = createRichLabel(26, cc.c4b(106, 64, 34, 255), cc.p(0, 0), cc.p(245, 200), 0, 0, 500)

	slot0.container:addChild(slot0.now_lucky)

	slot0.call_num = createRichLabel(26, cc.c4b(255, 215, 119, 255), cc.p(0.5, 0), cc.p(slot1.width / 2, 67), 0, 0, 500)

	slot0.container:addChild(slot0.call_num)

	slot0.must_label = createRichLabel(26, cc.c4b(255, 215, 119, 255), cc.p(0.5, 0), cc.p(slot1.width / 2, 33), 0, 0, 500)

	slot0.must_label:setString(string.format(TI18N("必出紫色以上命格")))
	slot0.container:addChild(slot0.must_label)

	slot0.tips_desc = createRichLabel(24, Config.ColorData.data_color4[175], cc.p(0.5, 0), cc.p(360, 160), 0, 0, 500)

	slot0.container:addChild(slot0.tips_desc)
end

function AuguryWindow.updateHaveAssert(slot0)
	if slot0.role_vo == nil then
		return
	end

	slot0.item_label_2:setString(slot0.role_vo.star_point or 0)
end

function AuguryWindow.updateItemSum(slot0)
	if slot0.item_config_1 == nil then
		return
	end

	slot0.item_label_1:setString(uv0:getBackPackItemNumByBid(slot0.item_config_1.val))
end

function AuguryWindow.openRootWnd(slot0)
	uv0:sender11330()

	slot0.is_play_effect = false

	slot0:updateHaveAssert()
	slot0:updateItemSum()
end

function AuguryWindow.checkOneCallStatus(slot0)
	if uv0:getModel():checkHaveFreeTimes() == true then
		slot0.one_call_label:setString(TI18N("本次免费"))
	elseif slot0.one_cost_config then
		slot0.one_call_label:setString(string.format(TI18N("<img src=%s visible=true scale=0.3 /> <div fontColor=#ffffff fontsize=22 > %s</div>"), PathTool.getItemRes(Config.ItemData.data_get_data(slot0.one_cost_config.val[1]).icon), slot0.one_cost_config.val[2]))
	end
end

function AuguryWindow.clickBtn(slot0, slot1)
	if (slot1 or 1) == 1 then
		MainuiController:getInstance():openCommonExplainView(true, Config.StarDivinationData.data_explain, TI18N("规则说明"))
	elseif slot1 == 2 then
		MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.startower)
	elseif slot1 == 3 then
		-- Nothing
	elseif slot1 == 4 then
		-- Nothing
	end
end

function AuguryWindow.handleEffect(slot0, slot1)
	if slot1 == false then
		for slot5, slot6 in pairs(slot0.effect_cache_list) do
			slot6:removeFromParent()
		end

		slot0.effect_cache_list = {}
	else
		slot6 = -150
		slot7 = 430

		for slot6, slot7 in ipairs({
			{
				is_loop = true,
				res = Config.EffectData.data_effect_info[137],
				action = PlayerAction.action,
				pos = cc.p(360, 457)
			},
			{
				is_loop = true,
				res = Config.EffectData.data_effect_info[138],
				action = PlayerAction.action_6,
				pos = cc.p(270, 425)
			},
			{
				is_loop = true,
				res = Config.EffectData.data_effect_info[138],
				action = PlayerAction.action_7,
				pos = cc.p(slot6, slot7)
			}
		}) do
			delayRun(slot0.container, (slot6 - 1) * 5 / display.DEFAULT_FPS, function ()
				uv0.effect_cache_list[uv1] = createEffectSpine(uv2.res, uv2.pos, cc.p(0.5, 0.5), uv2.is_loop, uv2.action)

				if uv1 == 1 then
					uv0.container:addChild(uv0.effect_cache_list[uv1], uv1)
				elseif uv1 == 2 then
					uv0.call_btn:addChild(uv0.effect_cache_list[uv1], uv1)
				elseif uv1 == 3 then
					uv0.gold_btn:addChild(uv0.effect_cache_list[uv1], uv1)
				end
			end)
		end
	end
end

function AuguryWindow.createQualityEffect(slot0, slot1)
	if not tolua.isnull(slot0.quality_effect) then
		slot0.quality_effect:removeFromParent()

		slot0.quality_effect = nil
	end

	slot0.quality_effect = createSpineByName(Config.EffectData.data_effect_info[138])

	slot0.quality_effect:setAnimation(0, "action" .. (slot0.quality_list[slot1] or 1), true)
	slot0.container:addChild(slot0.quality_effect, 10)
	slot0.quality_effect:setPosition(cc.p(360, 454))
end

function AuguryWindow.playActionEffect(slot0)
	if slot0.is_play_effect then
		return
	end

	slot0.is_play_effect = true

	slot0.effect_panel:setVisible(true)
	slot0.effect_panel:setTouchEnabled(true)

	slot0.he_effect = createEffectSpine(Config.EffectData.data_effect_info[139], cc.p(360, 485), cc.p(0.5, 0.5), false, "action" .. slot0.quality_list[slot0.old_quality], function ()
		if uv0.he_effect then
			uv0.he_effect:runAction(cc.RemoveSelf:create(true))

			uv0.he_effect = nil
		end
	end, cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A8888)

	slot0.effect_panel:addChild(slot0.he_effect, 1)
	slot0.he_effect:registerSpineEventHandler(function (slot0)
		if slot0.eventData.name == "appear" then
			uv0:playEffect()
		end
	end, sp.EventType.ANIMATION_EVENT)
end

function AuguryWindow.playEffect(slot0)
	slot3 = "action6"
	slot0.boom_effect = createEffectSpine(Config.EffectData.data_effect_info[139], cc.p(360, 485), cc.p(0.5, 0.5), false, slot3, function ()
		if uv0.boom_effect then
			uv0.boom_effect:runAction(cc.RemoveSelf:create(true))

			uv0.boom_effect = nil
			uv0.is_play_effect = false
		end

		uv0.effect_panel:setVisible(false)
		uv0.effect_panel:setTouchEnabled(false)
	end, cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A8888)

	slot0.boom_effect:setAnimation(0, slot3, true)
	slot0.effect_panel:addChild(slot0.boom_effect, 1)
	slot0.boom_effect:registerSpineEventHandler(function (slot0)
		if slot0.eventData.name == "appear" then
			uv0:openGetWidnow(true, uv1.success_data)

			if uv1.old_quality ~= (uv0:getModel():getQuality() or 1) then
				uv1:createQualityEffect(slot1)

				uv1.old_quality = slot1
			end
		end
	end, sp.EventType.ANIMATION_EVENT)
end

function AuguryWindow.setPanelData(slot0)
end

function AuguryWindow.close_callback(slot0)
	slot0.is_play_effect = false

	if slot0.role_assets_event then
		if slot0.role_vo then
			slot0.role_vo:UnBind(slot0.role_assets_event)
		end

		slot0.role_assets_event = nil
	end

	slot0.role_vo = nil

	if slot0.goods_add_event then
		GlobalEvent:getInstance():UnBind(slot0.goods_add_event)

		slot0.goods_add_event = nil
	end

	if slot0.goods_update_event then
		GlobalEvent:getInstance():UnBind(slot0.goods_update_event)

		slot0.goods_update_event = nil
	end

	uv0:openMainView(false)

	if slot0.augury_success_event then
		GlobalEvent:getInstance():UnBind(slot0.augury_success_event)

		slot0.augury_success_event = nil
	end

	if slot0.update_data_event then
		GlobalEvent:getInstance():UnBind(slot0.update_data_event)

		slot0.update_data_event = nil
	end

	slot0:handleEffect(false)

	if not tolua.isnull(slot0.quality_effect) then
		slot0.quality_effect:removeFromParent()

		slot0.quality_effect = nil
	end
end
