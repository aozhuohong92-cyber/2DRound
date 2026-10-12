HeroDrawMainWindow = HeroDrawMainWindow or BaseClass(BaseView)
slot1 = HeroController:getInstance():getModel()
slot2 = string.format
slot3 = table.sort
slot4 = table.insert

function HeroDrawMainWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Full
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "hero/hero_draw_main_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("herodraw", "herodraw"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/hero", "hero_draw_bg", true),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/hero", "hero_draw_bg_2", false),
			type = ResourcesType.single
		}
	}
	slot0.max_scale = 1.3
	slot0.min_scale = 0.7

	if Config.PartnerData.data_partner_const.vertical_zoom then
		if slot1.val[1] then
			slot0.min_scale = slot1.val[1]
		end

		if slot1.val[2] then
			slot0.max_scale = slot1.val[2]
		end
	end

	slot0.slider_percent = 50
	slot0.scale_percent = 50
	slot0.must_scale = 1
	slot0.touch_count = 0
	slot0.original_y = 0
	slot0.shard_preview_status = false
	slot0.view_list = {}
	slot0.is_hide = false
end

function HeroDrawMainWindow.open_callback(slot0)
	slot0.gl_view = cc.Director:getInstance():getOpenGLView()
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg/hero", "hero_draw_bg", true), LOADTEXT_TYPE)
	slot0.background:setScale(display.getMaxScale())

	slot0.mainContainer = slot0.root_wnd:getChildByName("main_container")

	slot0.mainContainer:setTouchEnabled(false)

	slot0.mainContainer_size = slot0.mainContainer:getContentSize()
	slot0.container = slot0.mainContainer:getChildByName("container")
	slot0.centre_panel = slot0.mainContainer:getChildByName("centre_panel")

	slot0.centre_panel:setTouchEnabled(false)

	slot0.hero_draw_icon = slot0.centre_panel:getChildByName("hero_draw_icon")
	slot0.hero_draw_icon_pos_x, slot0.hero_draw_icon_pos_y = slot0.hero_draw_icon:getPosition()
	slot0.hero_draw_icon_pos_x1, slot0.hero_draw_icon_pos_y1 = slot0.hero_draw_icon:getPosition()
	slot0.slider = slot0.centre_panel:getChildByName("slider")

	slot0.slider:setBarPercent(3, 97)
	slot0.slider:setScale9Enabled(true)

	slot0.delete_btn = slot0.centre_panel:getChildByName("delete_btn")
	slot0.add_btn = slot0.centre_panel:getChildByName("add_btn")
	slot0.top_panel = slot0.mainContainer:getChildByName("top_panel")

	slot0.top_panel:setTouchEnabled(true)

	slot0.hero_name_bg = slot0.top_panel:getChildByName("hero_name_bg")
	slot0.hero_name = slot0.hero_name_bg:getChildByName("hero_name")
	slot0.title_name = slot0.hero_name_bg:getChildByName("title_name")
	slot0.hide_btn = slot0.top_panel:getChildByName("hide_btn")
	slot0.share_btn = slot0.top_panel:getChildByName("share_btn")
	slot0.bottom_panel = slot0.mainContainer:getChildByName("bottom_panel")

	slot0.bottom_panel:setTouchEnabled(true)

	slot0.close_btn = slot0.bottom_panel:getChildByName("close_btn")
	slot0.bottom_bg = slot0.bottom_panel:getChildByName("bottom_bg")
	slot5 = LOADTEXT_TYPE

	loadSpriteTexture(slot0.bottom_bg, PathTool.getPlistImgForDownLoad("bigbg/hero", "hero_draw_bg_2", false), slot5)

	slot0.tab_btn_list = {}

	for slot5 = 1, 2 do
		slot6 = {
			btn = slot7,
			index = slot5,
			select_bg = slot7:getChildByName("select_img")
		}

		slot6.select_bg:setVisible(false)

		slot6.title = slot0.bottom_panel:getChildByName("tab_btn_" .. slot5):getChildByName("label")

		slot6.title:setTextColor(cc.c4b(215, 226, 227, 255))
		slot6.title:setString(({
			TI18N("英雄形象"),
			TI18N("英雄档案")
		})[slot5])

		slot0.tab_btn_list[slot5] = slot6
	end

	slot0.shard_handle_panel = slot0.mainContainer:getChildByName("shard_handle_panel")
	slot0.confirm_btn = slot0.shard_handle_panel:getChildByName("confirm_btn")
	slot0.cancel_btn = slot0.shard_handle_panel:getChildByName("cancel_btn")
	slot0.erweima_container = slot0.shard_handle_panel:getChildByName("erweima_container")
	slot0.erweima_img = slot0.erweima_container:getChildByName("img")
	slot0.logo_container = slot0.shard_handle_panel:getChildByName("logo_container")
	slot0.logo_img = slot0.logo_container:getChildByName("logo_img")

	slot0.logo_img:setVisible(false)
	slot0.logo_container:getChildByName("label"):setString(TI18N("良心二次元放置策略卡牌"))
	slot0:adaptationScreen()
end

function HeroDrawMainWindow.adaptationScreen(slot0)
	slot1 = display.getTop(slot0.mainContainer)
	slot2 = display.getBottom(slot0.mainContainer)

	slot0.top_panel:setPositionY(slot1 - (slot0.mainContainer_size.height - slot0.top_panel:getPositionY()))

	slot0.bottom_panel_y = slot2 + slot0.bottom_panel:getPositionY()

	slot0.bottom_panel:setPositionY(slot0.bottom_panel_y)
	slot0.cancel_btn:setPositionY(slot2 + 40)
	slot0.confirm_btn:setPositionY(slot2 + 40)
	slot0.erweima_container:setPositionY(slot2 + 125)
	slot0.logo_container:setPositionY(slot1)

	slot0.erweima_init_y = slot2 + 125
	slot0.name_init_y = slot2 + 150
end

function HeroDrawMainWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickBtnClose), true, REGISTER_BUTTON_SOUND_CLOSED_TYPY)
	registerButtonEventListener(slot0.delete_btn, function ()
		uv0:onDeleteBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.add_btn, function ()
		uv0:onAddBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.hide_btn, function ()
		uv0:onHideBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)

	function slot4()
		uv0:onHideBtn()
	end

	slot5 = false

	registerButtonEventListener(slot0.mainContainer, slot4, slot5, REGISTER_BUTTON_SOUND_BUTTON_TYPY)

	for slot4, slot5 in ipairs(slot0.tab_btn_list) do
		registerButtonEventListener(slot5.btn, function ()
			uv0:changeTabIndex(uv1.index)
		end, false, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	end

	slot0.slider:addEventListener(function (slot0, slot1)
		if slot1 == ccui.SliderEventType.percentChanged then
			uv0.slider_percent = uv0.slider:getPercent()

			uv0:setIconScale()
		end
	end)
	registerButtonEventListener(slot0.share_btn, function ()
		if FINAL_CHANNEL == "syios_smzhs" then
			message(TI18N("暂不支持"))

			return
		end

		uv0:enterShardStatus(true)
	end, true, 1)
	registerButtonEventListener(slot0.cancel_btn, function ()
		uv0:enterShardStatus(false)
	end, true, 1)
	registerButtonEventListener(slot0.confirm_btn, function ()
		uv0:shardErweimaImg()
	end, true, 1)

	slot1 = cc.EventListenerTouchAllAtOnce:create()

	slot1:registerScriptHandler(handler(slot0, slot0.onTouchBegin), cc.Handler.EVENT_TOUCHES_BEGAN)
	slot1:registerScriptHandler(handler(slot0, slot0.onTouchMoved), cc.Handler.EVENT_TOUCHES_MOVED)
	slot1:registerScriptHandler(handler(slot0, slot0.onTouchEnded), cc.Handler.EVENT_TOUCHES_ENDED)
	slot0.centre_panel:getEventDispatcher():addEventListenerWithSceneGraphPriority(slot1, slot0.centre_panel)
end

function HeroDrawMainWindow.onClickBtnClose(slot0)
	uv0:openHeroDrawMainWindow(false)
end

function HeroDrawMainWindow.enterShardStatus(slot0, slot1)
	slot0.top_panel:setVisible(not slot1)
	slot0.bottom_panel:setVisible(not slot1)
	slot0.container:setVisible(not slot1)
	slot0.shard_handle_panel:setVisible(slot1)

	if slot1 == true then
		if IS_NEED_SHOW_LOGO == false then
			slot0.logo_img:setVisible(false)
		else
			loadSpriteTexture(slot0.logo_img, PathTool.getLogoRes(), LOADTEXT_TYPE)
			slot0.logo_img:setVisible(true)
		end

		if IS_NEED_SHOW_ERWEIMA == false then
			slot0.erweima_container:setVisible(false)
		else
			slot0.erweima_container:setVisible(true)
			slot0:downErweimaImg()
		end
	end
end

function HeroDrawMainWindow.downErweimaImg(slot0)
	if RoleController:getInstance():getApkData() then
		download_qrcode_png(slot1.message.qrcode_url, function (slot0, slot1)
			if not tolua.isnull(uv0.erweima_img) then
				if slot0 == 0 then
					loadSpriteTexture(uv0.erweima_img, slot1, LOADTEXT_TYPE)

					uv0.qrCodeImage = slot1
				end

				uv0.erweima_img:setScale(130 / uv0.erweima_img:getContentSize().width)
			end
		end)
	end
end

function HeroDrawMainWindow.shardErweimaImg(slot0)
	if not IS_IOS_PLATFORM and callFunc("checkWrite") == "false" then
		return
	end

	slot0:changeShardStatus(false)

	slot1 = "sy_gameshard_image"

	if getRandomSaveName then
		slot1 = getRandomSaveName()
	end

	slot2 = cc.FileUtils:getInstance():getWritablePath() .. slot1 .. ".png"

	delayOnce(function ()
		cc.utils:captureScreen(function (slot0)
			if slot0 then
				saveImageToPhoto(uv0)
				uv1:changeShardStatus(true)
			else
				message("保存失败")
			end
		end, uv0)
	end, 0.01)
end

function HeroDrawMainWindow.changeShardStatus(slot0, slot1)
	slot0.cancel_btn:setVisible(slot1)
	slot0.confirm_btn:setVisible(slot1)
	slot0.add_btn:setVisible(slot1)
	slot0.delete_btn:setVisible(slot1)
	slot0.slider:setVisible(slot1)

	if slot0.share_name == nil and slot0.hero_vo then
		slot0.share_name = createLabel(34, cc.c3b(82, 55, 23), nil, 24, 50, slot0.hero_vo.name, slot0.shard_handle_panel, 0, cc.p(0, 0.5))
	end

	if slot0.share_name then
		slot0.share_name:setVisible(not slot1)
	end

	if slot1 == false then
		slot0.erweima_container:setPositionY(display.getBottom() + 20)
	else
		slot0.erweima_container:setPositionY(slot0.erweima_init_y)
	end
end

function HeroDrawMainWindow.onHideBtn(slot0)
	if slot0.is_hiding then
		return
	end

	slot0.is_hide = not slot0.is_hide
	slot0.is_hiding = true

	function slot1(slot0, slot1, slot2)
		if not slot0 then
			return
		end

		slot0:runAction(cc.EaseSineIn:create(cc.MoveTo:create(0.3, cc.p(slot1, slot2))))
	end

	if slot0.is_hide then
		slot0.mainContainer:setTouchEnabled(true)
		slot0.bottom_panel:runAction(cc.Sequence:create(cc.EaseSineIn:create(cc.MoveTo:create(0.3, cc.p(360, slot0.bottom_panel_y - 140))), cc.CallFunc:create(function ()
			uv0.is_hiding = false
		end)))
		slot0.hide_btn:setTouchEnabled(false)
		slot0.share_btn:setTouchEnabled(false)
		slot0.slider:setTouchEnabled(false)
		slot0.delete_btn:setTouchEnabled(false)
		slot0.add_btn:setTouchEnabled(false)
		slot1(slot0.hero_name_bg, 360, 137)
		slot1(slot0.hide_btn, -40, -109)
		slot1(slot0.share_btn, -40, -34)
		slot1(slot0.slider, 748, 724)
		slot1(slot0.delete_btn, 748, 464)
		slot1(slot0.add_btn, 748, 985)
	else
		slot0.bottom_panel:runAction(cc.Sequence:create(cc.EaseSineIn:create(cc.MoveTo:create(0.3, cc.p(360, slot0.bottom_panel_y))), cc.CallFunc:create(function ()
			uv0.is_hiding = false

			uv0.mainContainer:setTouchEnabled(false)
			uv0.hide_btn:setTouchEnabled(true)
			uv0.share_btn:setTouchEnabled(true)
			uv0.slider:setTouchEnabled(true)
			uv0.delete_btn:setTouchEnabled(true)
			uv0.add_btn:setTouchEnabled(true)
		end)))
		slot1(slot0.hero_name_bg, 360, 10)
		slot1(slot0.hide_btn, 50, -109)
		slot1(slot0.share_btn, 50, -34)
		slot1(slot0.slider, 683, 724)
		slot1(slot0.delete_btn, 683, 464)
		slot1(slot0.add_btn, 683, 985)
	end

	if slot0.view_list[1] then
		slot0.view_list[1]:hideAllBottom(slot0.is_hide)
	end
end

function HeroDrawMainWindow.onDeleteBtn(slot0)
	slot0.slider_percent = slot0.slider_percent - 1

	if slot0.slider_percent <= 0 then
		slot0.slider_percent = 0
	end

	slot0.slider:setPercent(slot0.slider_percent)
	slot0:setIconScale()
end

function HeroDrawMainWindow.onAddBtn(slot0)
	slot0.slider_percent = slot0.slider_percent + 1

	if slot0.slider_percent >= 100 then
		slot0.slider_percent = 100
	end

	slot0.slider:setPercent(slot0.slider_percent)
	slot0:setIconScale()
end

function HeroDrawMainWindow.setIconScale(slot0)
	slot1 = nil
	slot1 = slot0.scale_percent < slot0.slider_percent and 1 + (slot0.slider_percent - slot0.scale_percent) * (slot0.max_scale - 1) / 50 or slot0.slider_percent < slot0.scale_percent and slot0.min_scale + slot0.slider_percent * (1 - slot0.min_scale) / 50 or 1
	slot0.cur_scale = slot1

	slot0.hero_draw_icon:setScale(slot1 * slot0.must_scale)
end

function HeroDrawMainWindow.onTouchBegin(slot0, slot1, slot2)
	return true
end

function HeroDrawMainWindow.onTouchMoved(slot0, slot1, slot2)
	if #slot0.gl_view:getAllTouches() == 1 then
		slot0:onMovePos(slot1[1]:getLocation())

		if slot0.touch_count < 1 then
			slot0.touch_count = 1
		end
	elseif slot0.touch_count < 2 then
		slot0.touch_count = 2
	end
end

function HeroDrawMainWindow.onTouchEnded(slot0, slot1, slot2)
	if #slot0.gl_view:getAllTouches() ~= 0 then
		return
	end

	if slot0.touch_count == 1 then
		slot0:onEndPos(slot1[1]:getLocation())
	elseif slot0.touch_count == 2 then
		return
	end
end

function HeroDrawMainWindow.onMovePos(slot0, slot1)
	if not slot1 then
		return
	end

	if slot0.start_x and slot0.start_y then
		slot2 = slot0.centre_panel:convertToNodeSpace(slot1)
		slot0.hero_cur_iocn_pos_x = slot0.hero_draw_icon_pos_x + slot2.x - slot0.start_x
		slot0.hero_cur_iocn_pos_y = slot0.hero_draw_icon_pos_y + slot2.y - slot0.start_y

		slot0.hero_draw_icon:setPosition(slot0.hero_cur_iocn_pos_x, slot0.hero_cur_iocn_pos_y)
	else
		slot2 = slot0.centre_panel:convertToNodeSpace(slot1)
		slot0.start_x = slot2.x
		slot0.start_y = slot2.y
	end
end

function HeroDrawMainWindow.onEndPos(slot0, slot1)
	if not slot1 then
		return
	end

	if slot0.start_x == nil or slot0.start_y == nil then
		return
	end

	slot2 = slot0.centre_panel:convertToNodeSpace(slot1)
	slot0.hero_draw_icon_pos_x = slot0.hero_draw_icon_pos_x + slot2.x - slot0.start_x
	slot0.hero_draw_icon_pos_y = slot0.hero_draw_icon_pos_y + slot2.y - slot0.start_y
	slot0.start_x = nil
	slot0.start_y = nil
end

function HeroDrawMainWindow.changeTabIndex(slot0, slot1)
	if slot0.select_btn and slot0.select_btn.index == slot1 then
		return
	end

	if slot0.select_btn then
		slot0.select_btn.select_bg:setVisible(false)
		slot0.select_btn.title:setTextColor(cc.c4b(215, 226, 227, 255))
	end

	slot0.select_btn = slot0.tab_btn_list[slot1]

	if slot0.select_btn then
		slot0.select_btn.select_bg:setVisible(true)
		slot0.select_btn.title:setTextColor(cc.c4b(255, 255, 255, 255))
	end

	if slot0.pre_panel ~= nil and slot0.pre_panel.setVisibleStatus then
		slot0.pre_panel:setVisibleStatus(false)
	end

	slot0.pre_panel = slot0:createSubPanel(slot1)

	if slot0.pre_panel ~= nil and slot0.pre_panel.setVisibleStatus then
		slot0.pre_panel:setVisibleStatus(true)
	end

	if slot1 == 1 then
		slot0.centre_panel:setVisible(true)
		slot0.top_panel:setVisible(true)
	else
		slot0.centre_panel:setVisible(false)
		slot0.top_panel:setVisible(false)
	end
end

function HeroDrawMainWindow.createSubPanel(slot0, slot1)
	if slot0.view_list[slot1] == nil then
		if slot1 == 1 then
			slot2 = HeroDrawMainTabDraw.new(slot0)
		elseif slot1 == 2 then
			slot2 = HeroDrawMainTabFiles.new(slot0)
		end

		slot3 = slot0.container:getContentSize()

		slot2:setPosition(cc.p(slot3.width * 0.5, slot3.height * 0.5))
		slot0.container:addChild(slot2)

		slot0.view_list[slot1] = slot2
	end

	return slot2
end

function HeroDrawMainWindow.openRootWnd(slot0, slot1)
	slot2 = slot1 or {}
	slot3 = slot2.index or 1
	slot0.hero_vo = slot2.hero_vo

	if not slot0.hero_vo then
		return
	end

	slot0.hero_name:setString(slot0.hero_vo.name)
	slot0:changeTabIndex(slot3)
	slot0:initHeroDraw(slot0.hero_vo.use_skin)
end

function HeroDrawMainWindow.initHeroDraw(slot0, slot1)
	if not slot0.hero_vo then
		return
	end

	slot2, slot3 = nil
	slot0.must_scale = 1

	if slot1 == nil or slot1 == 0 then
		slot0.library_config = Config.PartnerData.data_partner_library(slot0.hero_vo.bid)

		if slot0.hero_vo.is_pokedex then
			if Config.PartnerData.data_partner_base[slot0.hero_vo.bid] then
				slot2 = slot4.draw_res
			end
		else
			slot2 = slot0.hero_vo.draw_res
		end

		if slot0.library_config then
			slot3 = slot0.library_config.title

			if slot0.library_config.scale ~= 0 then
				slot0.must_scale = slot0.library_config.scale / 100
			end

			if not slot0.is_init_pos and slot0.library_config.draw_offset and next(slot0.library_config.draw_offset) ~= nil then
				slot0.hero_draw_icon_pos_x = slot0.hero_draw_icon_pos_x1 + (slot0.library_config.draw_offset[1][1] or 0)
				slot0.hero_draw_icon_pos_y = slot0.hero_draw_icon_pos_y1 + (slot0.library_config.draw_offset[1][2] or 0)
			end
		end
	elseif Config.PartnerSkinData.data_skin_info[slot1] then
		slot2 = slot4.draw_res
		slot3 = slot4.skin_name

		if slot4.scale ~= 0 then
			slot0.must_scale = slot4.scale / 100
		end

		if not slot0.is_init_pos and slot4.draw_offset and next(slot4.draw_offset) ~= nil then
			slot0.hero_draw_icon_pos_x = slot0.hero_draw_icon_pos_x1 + (slot4.draw_offset[1][1] or 0)
			slot0.hero_draw_icon_pos_y = slot0.hero_draw_icon_pos_y1 + (slot4.draw_offset[1][2] or 0)
		end
	end

	slot0.is_init_pos = true

	if slot0.hero_draw_icon then
		slot0.item_load = loadSpriteTextureFromCDN(slot0.hero_draw_icon, PathTool.getPlistImgForDownLoad("herodraw/herodrawres", slot2 or "jinglingwangzi", false), ResourcesType.single, slot0.item_load)
	end

	slot0.slider:setPercent(slot0.slider_percent)

	if slot0.cur_scale then
		slot0.hero_draw_icon:setScale(slot0.must_scale * slot0.cur_scale)
	else
		slot0.hero_draw_icon:setScale(slot0.must_scale)
	end

	if slot0.hero_cur_iocn_pos_x and slot0.hero_cur_iocn_pos_y then
		slot0.hero_draw_icon:setPosition(slot0.hero_cur_iocn_pos_x, slot0.hero_cur_iocn_pos_y)
	else
		slot0.hero_draw_icon:setPosition(slot0.hero_draw_icon_pos_x, slot0.hero_draw_icon_pos_y)
	end

	slot0.title_name:setString(slot3 or "")
end

function HeroDrawMainWindow.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.view_list) do
		slot5:DeleteMe()
	end

	slot0.view_list = nil

	if slot0.item_load then
		slot0.item_load:DeleteMe()
	end

	slot0.item_load = nil

	uv0:openHeroDrawMainWindow(false)
end
