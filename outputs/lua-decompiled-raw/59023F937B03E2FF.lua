ActionTreasureGetWindow = ActionTreasureGetWindow or BaseClass(BaseView)
slot0 = Config.DialData.data_const
slot1 = ActionController:getInstance()

function ActionTreasureGetWindow.__init(slot0, slot1, slot2, slot3, slot4)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "augury/augury_get_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("augury", "augury"),
			type = ResourcesType.plist
		}
	}
	slot0.effect_cache_list = {}
	slot0.index = slot2 or 1
	slot0.touchTreasure_type = slot3 or 2
	slot0.func = slot4
	slot0.data = slot1 or {}
	slot0.cache_list = {}
	slot0.can_click = false
end

function ActionTreasureGetWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setBackGroundColorOpacity(180)
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.size = slot0.main_panel:getContentSize()
	slot0.title_model = slot0.root_wnd:getChildByName("titlepanel")
	slot0.bg_top = slot0.main_panel:getChildByName("bg_top")

	if slot0.bg_top_load == nil then
		slot0.bg_top_load = loadImageTextureFromCDN(slot0.bg_top, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_98"), ResourcesType.single, slot0.bg_top_load)
	end

	slot0.bg_bottom = slot0.main_panel:getChildByName("bg_bottom")

	if slot0.bg_bottom_load == nil then
		slot0.bg_bottom_load = loadImageTextureFromCDN(slot0.bg_bottom, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_98"), ResourcesType.single, slot0.bg_bottom_load)
	end

	slot0.close_sp = slot0.main_panel:getChildByName("close_sp")

	if slot0.touchTreasure_type == 1 or slot0.touchTreasure_type == 2 then
		slot0.btn_left = createImage(slot0.main_panel, PathTool.getResFrame("common", "common_1017"), 182, -51, cc.p(0.5, 0.5), true, 0, true)

		slot0.btn_left:setContentSize(cc.size(130, 64))

		slot1 = createLabel(24, Config.ColorData.data_color4[1], Config.ColorData.data_color4[277], 64, 32, TI18N("确定"), slot0.btn_left, 2, cc.p(0.5, 0.5))

		slot0.btn_left:setTouchEnabled(true)
		registerButtonEventListener(slot0.btn_left, function ()
			uv0:openTreasureGetItemWindow(false)
		end, true, 2)

		slot0.btn_right = createImage(slot0.main_panel, PathTool.getResFrame("common", "common_1017"), 559, -51, cc.p(0.5, 0.5), true, 0, true)

		slot0.btn_right:setContentSize(cc.size(130, 64))
		createLabel(24, Config.ColorData.data_color4[1], Config.ColorData.data_color4[277], 64, 32, "", slot0.btn_right, 2, cc.p(0.5, 0.5)):setString(string.format(TI18N("再来%d次"), uv1.treasure_num.val[slot0.index][slot0.touchTreasure_type]))
		slot0.btn_right:setTouchEnabled(true)
		registerButtonEventListener(slot0.btn_right, function ()
			if uv0.touchTreasure_type == 1 or uv0.touchTreasure_type == 2 then
				uv1:send16643(uv0.index, uv0.touchTreasure_type)
			elseif uv0.touchTreasure_type == 3 then
				DialActionController:getInstance():sender16671(uv0.index, 1)
			end

			uv1:openTreasureGetItemWindow(false)
		end, true, 2)
		slot0.close_sp:setVisible(false)
	elseif slot0.touchTreasure_type == 3 then
		slot0.close_sp:setVisible(true)
	elseif slot0.touchTreasure_type == 4 then
		slot0.btn_left = createImage(slot0.main_panel, PathTool.getResFrame("common", "common_1017"), 360, -51, cc.p(0.5, 0.5), true, 0, true)

		slot0.btn_left:setContentSize(cc.size(130, 64))

		slot1 = createLabel(24, Config.ColorData.data_color4[1], Config.ColorData.data_color4[264], 64, 32, TI18N("确定"), slot0.btn_left, 2, cc.p(0.5, 0.5))

		slot0.btn_left:setTouchEnabled(true)
		registerButtonEventListener(slot0.btn_left, function ()
			uv0:openTreasureGetItemWindow(false)

			if uv1.func then
				uv1.func()
			end
		end, true, 2)
	end

	slot0.title_container = slot0.title_model:getChildByName("title_container")
	slot0.title_width = slot0.title_container:getContentSize().width
	slot0.title_height = slot0.title_container:getContentSize().height

	slot0:handleEffect(true)
	slot0:updatData()
end

function ActionTreasureGetWindow.register_event(slot0)
	if slot0.touchTreasure_type == 3 then
		registerButtonEventListener(slot0.background, function ()
			uv0:openTreasureGetItemWindow(false)
		end, false, 2)
	end
end

function ActionTreasureGetWindow.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	elseif not tolua.isnull(slot0.title_container) and slot0.play_effect == nil then
		slot0.play_effect = createEffectSpine(Config.EffectData.data_effect_info[103], cc.p(slot0.title_width * 0.5, slot0.title_height * 0.5), cc.p(0.5, 0.5), false, PlayerAction.action_1)

		slot0.title_container:addChild(slot0.play_effect, 1)
	end
end

function ActionTreasureGetWindow.updatData(slot0)
	if not slot0.data or next(slot0.data) == nil then
		return
	end

	slot2 = 0
	slot3 = {
		[slot2 + 1] = {
			bid = slot8.bid,
			quantity = slot8.num
		}
	}
	slot0.space = 20
	slot0.ref_height = 119
	slot0.ref_width = 119

	for slot7, slot8 in pairs(slot0.data) do
		-- Nothing
	end

	slot0.row = math.ceil(slot2 / 5)

	if not slot0.scroll_view then
		slot4 = cc.size(720, 440)
		slot0.scroll_view = createScrollView(slot4.width, slot4.height, slot0.size.width / 2, 15, slot0.main_panel, ccui.ScrollViewDir.vertical)

		slot0.scroll_view:setAnchorPoint(cc.p(0.5, 0))
	end

	slot0.scroll_height = slot0.scroll_view:getContentSize().height
	slot0.scroll_width = slot0.scroll_view:getContentSize().width
	slot0.max_height = math.max(slot0.space + (slot0.space + slot0.ref_height + 45) * slot0.row, slot0.scroll_height)

	slot0.scroll_view:setInnerContainerSize(cc.size(slot0.scroll_width, slot0.max_height))

	if slot2 >= 5 then
		slot5 = 5
	end

	slot7 = (slot0.scroll_width - (slot5 * slot0.ref_width + (slot5 - 1) * slot0.space)) * 0.5
	slot0.action_effect = {}

	for slot11, slot12 in ipairs(slot3) do
		delayRun(slot0.main_panel, slot11 * 10 / display.DEFAULT_FPS, function ()
			function slot0()
				if uv0.action_effect[uv1] then
					uv0.action_effect[uv1]:runAction(cc.RemoveSelf:create(true))

					uv0.action_effect[uv1] = nil
				end
			end

			slot1 = uv2 + uv0.ref_width * 0.5 + (uv1 - 1) % 5 * (uv0.ref_width + uv0.space)

			if uv0.row <= 1 then
				slot2 = uv0.max_height - math.floor((uv1 - 1) / 5) * (uv0.ref_height + uv0.space + 45) - uv0.ref_height / 2 - 40 - 100
			end

			uv0.action_effect[uv1] = createEffectSpine(Config.EffectData.data_effect_info[156], cc.p(slot1, slot2), cc.p(0.5, 0.5), false, PlayerAction.action_3, slot0, cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A8888)

			uv0.scroll_view:addChild(uv0.action_effect[uv1], 1)
			uv0.action_effect[uv1]:registerSpineEventHandler(function (slot0)
				if slot0.eventData.name == "appear" then
					slot1 = BackPackItem.new(false, true)

					slot1:setData(uv0)
					slot1:setDefaultTip()

					if Config.ItemData.data_get_data(uv0.bid).quality >= 3 then
						slot3 = PlayerAction.action_2

						if slot2.quality >= 4 then
							slot3 = PlayerAction.action_1
						end

						slot1:showItemEffect(true, 156, slot3, true)
					end

					if slot2 then
						slot1:setGoodsName(slot2.name, nil, 22, BackPackConst.quality_color[slot2.quality])
					end

					slot3 = uv1 + uv2.ref_width * 0.5 + (uv3 - 1) % 5 * (uv2.ref_width + uv2.space)

					if uv2.row <= 1 then
						slot4 = uv2.max_height - math.floor((uv3 - 1) / 5) * (uv2.ref_height + uv2.space + 45) - uv2.ref_height / 2 - 40 - 100
					end

					slot1:setPosition(cc.p(slot3, slot4))
					uv2.scroll_view:addChild(slot1)
					table.insert(uv2.cache_list, slot1)

					if math.ceil(uv3 / 5) > 2 then
						uv2.scroll_view:scrollToPercentVertical(slot5 / uv2.row * 100, 0.5, true)
					end
				end
			end, sp.EventType.ANIMATION_EVENT)
		end)
	end
end

function ActionTreasureGetWindow.openRootWnd(slot0, slot1)
	playOtherSound("c_get")

	slot0.can_click = false

	delayRun(slot0.background, 2, function ()
		uv0.can_click = true
	end)
end

function ActionTreasureGetWindow.close_callback(slot0)
	uv0:openTreasureGetItemWindow(false)

	if slot0.bg_top_load then
		slot0.bg_top_load:DeleteMe()

		slot0.bg_top_load = nil
	end

	if slot0.bg_bottom_load then
		slot0.bg_bottom_load:DeleteMe()

		slot0.bg_bottom_load = nil
	end

	slot4 = false

	slot0:handleEffect(slot4)

	for slot4, slot5 in pairs(slot0.cache_list) do
		if slot5 and slot5.DeleteMe then
			slot5:DeleteMe()
		end
	end

	slot0.cache_list = nil
end
