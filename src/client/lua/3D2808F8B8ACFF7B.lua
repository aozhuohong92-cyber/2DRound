HeroLookDrawWindow = HeroLookDrawWindow or BaseClass(BaseView)
slot0 = string.format

function HeroLookDrawWindow.__init(slot0)
	slot0.ctrl = HeroController:getInstance()
	slot1 = slot0.ctrl
	slot0.model = slot1:getModel()
	slot0.win_type = WinType.Full
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "hero/hero_look_draw_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("herodraw", "herodraw"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/hero", "hero_draw_bg", true),
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
end

function HeroLookDrawWindow.open_callback(slot0)
	slot0.gl_view = cc.Director:getInstance():getOpenGLView()
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg/hero", "hero_draw_bg", true), LOADTEXT_TYPE)
	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)
	slot0.main_container:setTouchEnabled(false)

	slot0.hero_draw_icon = slot0.main_container:getChildByName("hero_draw_icon")
	slot0.hero_draw_icon_pos_x, slot0.hero_draw_icon_pos_y = slot0.hero_draw_icon:getPosition()
	slot0.slider = slot0.main_container:getChildByName("slider")

	slot0.slider:setBarPercent(3, 97)
	slot0.slider:setScale9Enabled(true)

	slot0.name = slot0.main_container:getChildByName("name")
	slot0.delete_btn = slot0.main_container:getChildByName("delete_btn")
	slot0.add_btn = slot0.main_container:getChildByName("add_btn")
	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.bottom_lay = slot0.main_container:getChildByName("bottom_lay")
	slot0.top_lay = slot0.main_container:getChildByName("top_lay")
	slot0.story_btn = slot0.main_container:getChildByName("story_btn")
	slot0.shard_preview_btn = slot0.main_container:getChildByName("shard_preview_btn")
	slot0.shard_handle_panel = slot0.main_container:getChildByName("shard_handle_panel")
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

function HeroLookDrawWindow.adaptationScreen(slot0)
	slot1 = display.getTop(slot0.main_container)
	slot2 = display.getBottom(slot0.main_container)
	slot5 = slot2 + 98

	slot0.slider:setPositionY(slot5)
	slot0.delete_btn:setPositionY(slot5)
	slot0.add_btn:setPositionY(slot5)
	slot0.name:setPositionY(slot2 + 150)
	slot0.shard_preview_btn:setPositionY(slot2 + 40)
	slot0.cancel_btn:setPositionY(slot2 + 40)
	slot0.confirm_btn:setPositionY(slot2 + 40)
	slot0.story_btn:setPositionY(slot2 + 40)
	slot0.erweima_container:setPositionY(slot2 + 125)
	slot0.logo_container:setPositionY(slot1)
	slot0.close_btn:setPositionY(slot1 - 80)
	slot0.bottom_lay:setPositionY(slot2)
	slot0.bottom_lay:setContentSize(cc.size(SCREEN_WIDTH, MainuiController:getInstance():getMainUi():getTopViewHeight()))
	slot0.top_lay:setPositionY(slot1)
	slot0.top_lay:setContentSize(cc.size(SCREEN_WIDTH, MainuiController:getInstance():getMainUi():getTopViewHeight()))

	slot0.erweima_init_y = slot2 + 125
	slot0.name_init_y = slot2 + 150
	slot0.handle_init_y = slot5
end

function HeroLookDrawWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0.ctrl:openHeroLookDrawWindow(false)
	end, true, 2)
	registerButtonEventListener(slot0.delete_btn, function ()
		uv0:onDeleteBtn()
	end, true, 2)
	registerButtonEventListener(slot0.add_btn, function ()
		uv0:onAddBtn()
	end, true, 2)
	registerButtonEventListener(slot0.story_btn, function ()
		uv0:onClickStoryBtn()
	end, true, 1)
	registerButtonEventListener(slot0.shard_preview_btn, function ()
		if FINAL_CHANNEL == "syios_smzhs" then
			message(TI18N("暂不支持"))

			return
		end

		uv0:enterShardStatus(true)
	end, true, 1)
	registerButtonEventListener(slot0.cancel_btn, function ()
		if uv0.share_type == HeroConst.ShareType.eHeroInfoShare then
			uv0:enterShardStatus(false)
		elseif uv0.share_type == HeroConst.ShareType.eLibraryInfoShare then
			uv0.ctrl:openHeroLookDrawWindow(false)
		end
	end, true, 1)
	registerButtonEventListener(slot0.confirm_btn, function ()
		uv0:shardErweimaImg()
	end, true, 1)
	slot0.slider:addEventListener(function (slot0, slot1)
		if slot1 == ccui.SliderEventType.percentChanged then
			uv0.slider_percent = uv0.slider:getPercent()

			uv0:setIconScale()
		end
	end)

	slot1 = cc.EventListenerTouchAllAtOnce:create()

	slot1:registerScriptHandler(handler(slot0, slot0.onTouchBegin), cc.Handler.EVENT_TOUCHES_BEGAN)
	slot1:registerScriptHandler(handler(slot0, slot0.onTouchMoved), cc.Handler.EVENT_TOUCHES_MOVED)
	slot1:registerScriptHandler(handler(slot0, slot0.onTouchEnded), cc.Handler.EVENT_TOUCHES_ENDED)
	slot0.main_container:getEventDispatcher():addEventListenerWithSceneGraphPriority(slot1, slot0.main_container)
end

function HeroLookDrawWindow.enterShardStatus(slot0, slot1)
	slot0.shard_preview_status = slot1

	slot0.story_btn:setVisible(not slot1)
	slot0.close_btn:setVisible(not slot1)
	slot0.shard_preview_btn:setVisible(not slot1)
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

function HeroLookDrawWindow.downErweimaImg(slot0)
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

function HeroLookDrawWindow.shardErweimaImg(slot0)
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

function HeroLookDrawWindow.changeShardStatus(slot0, slot1)
	slot0.cancel_btn:setVisible(slot1)
	slot0.confirm_btn:setVisible(slot1)
	slot0.add_btn:setVisible(slot1)
	slot0.delete_btn:setVisible(slot1)
	slot0.slider:setVisible(slot1)

	if slot1 == false then
		slot2 = display.getBottom()

		slot0.erweima_container:setPositionY(slot2 + 20)
		slot0.name:setPositionY(slot2 + 60)
	else
		slot0.erweima_container:setPositionY(slot0.erweima_init_y)
		slot0.name:setPositionY(slot0.name_init_y)
	end
end

function HeroLookDrawWindow.onTouchBegin(slot0, slot1, slot2)
	return true
end

function HeroLookDrawWindow.onTouchMoved(slot0, slot1, slot2)
	if #slot0.gl_view:getAllTouches() == 1 then
		slot0:onMovePos(slot1[1]:getLocation())

		if slot0.touch_count < 1 then
			slot0.touch_count = 1
		end
	elseif slot0.touch_count < 2 then
		slot0.touch_count = 2
	end
end

function HeroLookDrawWindow.onTouchEnded(slot0, slot1, slot2)
	if #slot0.gl_view:getAllTouches() ~= 0 then
		return
	end

	if slot0.touch_count == 1 then
		slot0:onEndPos(slot1[1]:getLocation())
	elseif slot0.touch_count == 2 then
		return
	end
end

function HeroLookDrawWindow.onMovePos(slot0, slot1)
	if not slot1 then
		return
	end

	if slot0.start_x and slot0.start_y then
		slot2 = slot0.main_container:convertToNodeSpace(slot1)

		slot0.hero_draw_icon:setPosition(slot0.hero_draw_icon_pos_x + slot2.x - slot0.start_x, slot0.hero_draw_icon_pos_y + slot2.y - slot0.start_y)
	else
		slot2 = slot0.main_container:convertToNodeSpace(slot1)
		slot0.start_x = slot2.x
		slot0.start_y = slot2.y
	end
end

function HeroLookDrawWindow.onEndPos(slot0, slot1)
	if not slot1 then
		return
	end

	if slot0.start_x == nil or slot0.start_y == nil then
		return
	end

	slot2 = slot0.main_container:convertToNodeSpace(slot1)
	slot0.hero_draw_icon_pos_x = slot0.hero_draw_icon_pos_x + slot2.x - slot0.start_x
	slot0.hero_draw_icon_pos_y = slot0.hero_draw_icon_pos_y + slot2.y - slot0.start_y
	slot0.start_x = nil
	slot0.start_y = nil
end

function HeroLookDrawWindow.onDeleteBtn(slot0)
	slot0.slider_percent = slot0.slider_percent - 1

	if slot0.slider_percent <= 0 then
		slot0.slider_percent = 0
	end

	slot0.slider:setPercent(slot0.slider_percent)
	slot0:setIconScale()
end

function HeroLookDrawWindow.onAddBtn(slot0)
	slot0.slider_percent = slot0.slider_percent + 1

	if slot0.slider_percent >= 100 then
		slot0.slider_percent = 100
	end

	slot0.slider:setPercent(slot0.slider_percent)
	slot0:setIconScale()
end

function HeroLookDrawWindow.onClickStoryBtn(slot0)
	if not slot0.partner_config or not slot0.library_config then
		return
	end

	if slot0.library_config.story == nil or slot0.library_config.story == "" then
		message(TI18N("该英雄暂无传记"))

		return
	end

	slot0.ctrl:openHeroLibraryStoryPanel(true, uv0("%s %s", slot0.library_config.title, slot0.partner_config.name), slot0.library_config.story)
end

function HeroLookDrawWindow.setIconScale(slot0)
	slot1 = nil

	slot0.hero_draw_icon:setScale((slot0.scale_percent < slot0.slider_percent and 1 + (slot0.slider_percent - slot0.scale_percent) * (slot0.max_scale - 1) / 50 or slot0.slider_percent < slot0.scale_percent and slot0.min_scale + slot0.slider_percent * (1 - slot0.min_scale) / 50 or 1) * slot0.must_scale)
end

function HeroLookDrawWindow.openRootWnd(slot0, slot1, slot2, slot3, slot4)
	if not slot3 then
		return
	end

	slot0.hero_vo = slot3
	slot4 = slot4 or HeroConst.ShareType.eHeroInfoShare
	slot5 = slot3.bid
	slot0.partner_config = Config.PartnerData.data_partner_base[slot5]
	slot0.library_config = Config.PartnerData.data_partner_library(slot5)
	slot0.must_scale = 1

	if slot0.hero_vo.use_skin == nil or slot0.hero_vo.use_skin == 0 then
		if slot7 then
			if slot7.scale ~= 0 then
				slot0.must_scale = slot7.scale / 100
			end

			if slot7.draw_offset and next(slot7.draw_offset) ~= nil then
				slot0.hero_draw_icon_pos_x = slot0.hero_draw_icon_pos_x + (slot7.draw_offset[1][1] or 0)
				slot0.hero_draw_icon_pos_y = slot0.hero_draw_icon_pos_y + (slot7.draw_offset[1][2] or 0)
			end
		end
	elseif Config.PartnerSkinData.data_skin_info[slot0.hero_vo.use_skin] then
		if slot8.scale ~= 0 then
			slot0.must_scale = slot8.scale / 100
		end

		if slot8.draw_offset and next(slot8.draw_offset) ~= nil then
			slot0.hero_draw_icon_pos_x = slot0.hero_draw_icon_pos_x + (slot8.draw_offset[1][1] or 0)
			slot0.hero_draw_icon_pos_y = slot0.hero_draw_icon_pos_y + (slot8.draw_offset[1][2] or 0)
		end
	end

	if slot0.hero_draw_icon then
		slot0.item_load = loadSpriteTextureFromCDN(slot0.hero_draw_icon, PathTool.getPlistImgForDownLoad("herodraw/herodrawres", slot1 or "jinglingwangzi", false), ResourcesType.single, slot0.item_load)
	end

	slot0.slider:setPercent(slot0.slider_percent)
	slot0.hero_draw_icon:setScale(slot0.must_scale)
	slot0.hero_draw_icon:setPosition(slot0.hero_draw_icon_pos_x, slot0.hero_draw_icon_pos_y)
	slot0.name:setString(slot2 or "")

	if slot4 == HeroConst.ShareType.eHeroInfoShare then
		slot0:enterShardStatus(false)
	elseif slot4 == HeroConst.ShareType.eLibraryInfoShare then
		slot0:enterShardStatus(true)
	end

	slot0.share_type = slot4
end

function HeroLookDrawWindow.close_callback(slot0)
	if slot0.item_load then
		slot0.item_load:DeleteMe()
	end

	slot0.item_load = nil

	slot0.ctrl:openHeroLookDrawWindow(false)
end
