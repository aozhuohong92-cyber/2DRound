AuguryGetWindow = AuguryGetWindow or BaseClass(BaseView)

function AuguryGetWindow.__init(slot0, slot1)
	slot0.ctrl = AuguryController:getInstance()
	slot0.is_full_screen = false
	slot0.layout_name = "augury/augury_get_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("augury", "augury"),
			type = ResourcesType.plist
		}
	}
	slot0.effect_cache_list = {}
	slot0.win_type = WinType.Big
	slot0.data = slot1
	slot0.cache_list = {}
	slot0.can_click = false
end

function AuguryGetWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.size = slot0.main_panel:getContentSize()
	slot0.title_model = slot0.root_wnd:getChildByName("titlepanel")
	slot0.title_container = slot0.title_model:getChildByName("title_container")
	slot0.title_width = slot0.title_container:getContentSize().width
	slot0.title_height = slot0.title_container:getContentSize().height

	slot0:handleEffect(true)
	slot0:updatData()
end

function AuguryGetWindow.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			if uv0.can_click == false then
				return
			end

			playCloseSound()
			uv0.ctrl:openGetWidnow(false)
		end
	end)
end

function AuguryGetWindow.handleEffect(slot0, slot1)
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

function AuguryGetWindow.updatData(slot0)
	if not slot0.data then
		return
	end

	slot2 = 0
	slot3 = {
		[slot2 + 1] = {
			bid = slot8.item_id,
			quantity = slot8.num
		}
	}
	slot0.space = 20
	slot0.ref_height = 119
	slot0.ref_width = 119

	for slot7, slot8 in pairs(slot0.data.award or {}) do
		-- Nothing
	end

	slot0.row = math.ceil(slot2 / 5)
	slot0.is_one = false

	if not slot0.scroll_view then
		slot4 = cc.size(720, 440)

		if slot2 <= 3 then
			slot0.is_one = true
			slot4 = cc.size(720, 400)
		end

		slot0.scroll_view = createScrollView(slot4.width, slot4.height, slot0.size.width / 2, 15, slot0.main_panel, ccui.ScrollViewDir.vertical)

		slot0.scroll_view:setAnchorPoint(cc.p(0.5, 0))
	end

	slot0.scroll_height = slot0.scroll_view:getContentSize().height
	slot0.scroll_width = slot0.scroll_view:getContentSize().width
	slot0.max_height = math.max(slot0.space + (slot0.space + slot0.ref_height + 45) * slot0.row, slot0.scroll_height)
	slot8 = cc.size

	slot0.scroll_view:setInnerContainerSize(slot8(slot0.scroll_width, slot0.max_height))

	slot0.action_effect = {}

	for slot8, slot9 in ipairs(slot3) do
		delayRun(slot0.main_panel, slot8 * 10 / display.DEFAULT_FPS, function ()
			function slot0()
				if uv0.action_effect[uv1] then
					uv0.action_effect[uv1]:runAction(cc.RemoveSelf:create(true))

					uv0.action_effect[uv1] = nil
				end
			end

			slot1 = 12 + uv0.ref_width * 0.5 + (uv1 - 1) % 5 * (uv0.ref_width + uv0.space)

			if uv0.is_one == true then
				slot1 = uv0.scroll_width / 2
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

					slot3 = 15 + uv1.ref_width * 0.5 + (uv2 - 1) % 5 * (uv1.ref_width + uv1.space)

					if uv1.is_one == true then
						slot3 = uv1.scroll_width / 2
						slot4 = uv1.max_height - math.floor((uv2 - 1) / 5) * (uv1.ref_height + uv1.space + 45) - uv1.ref_height / 2 - 40 - 100
					end

					slot1:setPosition(cc.p(slot3, slot4))
					uv1.scroll_view:addChild(slot1)
					table.insert(uv1.cache_list, slot1)
				end
			end, sp.EventType.ANIMATION_EVENT)
		end)
	end
end

function AuguryGetWindow.openRootWnd(slot0, slot1)
	slot0.can_click = false

	delayRun(slot0.background, 2, function ()
		uv0.can_click = true
	end)
end

function AuguryGetWindow.setPanelData(slot0)
end

function AuguryGetWindow.close_callback(slot0)
	slot0.ctrl:openGetWidnow(false)

	slot4 = false

	slot0:handleEffect(slot4)

	for slot4, slot5 in pairs(slot0.cache_list) do
		if slot5 and slot5.DeleteMe then
			slot5:DeleteMe()
		end
	end

	slot0.cache_list = nil
end
