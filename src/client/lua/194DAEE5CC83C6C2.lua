QRcodeShardPanel = class("QRcodeShardPanel", function ()
	return ccui.Widget:create()
end)

function QRcodeShardPanel.ctor(slot0)
	slot0.er_wei_ma = nil
	slot0.copyData = nil
	slot0.qrCodeImage = nil

	slot0:configUI()
	slot0:register_event()
end

function QRcodeShardPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("welfare/qrcode_shard_panel"))

	slot0:addChild(slot0.root_wnd)
	slot0:setPosition(-40, -161)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.savePhoto = slot0.main_container:getChildByName("savePhoto")

	slot0.savePhoto:setPosition(204, 355)
	slot0.savePhoto:setVisible(true)

	if SAVE_IMAGE_PHOTO == true then
		slot0.savePhoto:setVisible(true)
	end

	slot0.savePhoto:getChildByName("Text_2"):setString(TI18N("保存至相册"))

	slot0.copyURL = slot0.main_container:getChildByName("copyURL")

	slot0.copyURL:setPosition(613, 175)
	slot0.copyURL:getChildByName("Text_2"):setString(TI18N("复制链接"))

	slot0.bg = slot0.main_container:getChildByName("bg")

	if not slot0.item_load then
		slot0.item_load = createResourcesLoad(PathTool.getWelfareBannerRes("txt_cn_welfare_bg1"), ResourcesType.single, function ()
			if not tolua.isnull(uv0.bg) then
				loadSpriteTexture(uv0.bg, uv1, LOADTEXT_TYPE)
			end
		end, slot0.item_load)
	end

	if IS_NEED_SHOW_LOGO ~= false then
		createSprite(PathTool.getLogoRes(), 100, 869, slot0.main_container, cc.p(0.5, 0.5), LOADTEXT_TYPE):setScale(0.4)
	end

	slot0.er_wei_ma = createSprite(nil, 193, 545, slot0.main_container, cc.p(0.5, 0.5))

	if PLATFORM_NAME == "demo" then
		loadSpriteTexture(slot0.er_wei_ma, PathTool.getWelfareBannerRes("txt_cn_welfare_bg4"), LOADTEXT_TYPE)
		slot0.er_wei_ma:setScale(260 / slot0.er_wei_ma:getContentSize().width)
	end

	if RoleController:getInstance():getApkData() then
		download_qrcode_png(slot2.message.qrcode_url, function (slot0, slot1)
			if not tolua.isnull(uv0.er_wei_ma) then
				if slot0 == 0 then
					loadSpriteTexture(uv0.er_wei_ma, slot1, LOADTEXT_TYPE)

					uv0.qrCodeImage = slot1
				end

				uv0.er_wei_ma:setScale(260 / uv0.er_wei_ma:getContentSize().width)
			end
		end)
	end

	slot0.textURL = slot0.main_container:getChildByName("url_panel"):getChildByName("textURL")

	get_apk_url(function (slot0)
		if not tolua.isnull(uv0.textURL) then
			uv0.copyData = slot0

			if slot0 and slot0.success == true and slot0.message then
				if SHOW_APK_URL then
					uv0.copyData.message.url = SHOW_APK_URL
				end

				if slot0.message.url then
					uv0.textURL:setString(slot0.message.url)
				end
			else
				uv0.textURL:setString(TI18N("获取链接失败"))
			end
		end
	end)
end

function QRcodeShardPanel.register_event(slot0)
	registerButtonEventListener(slot0.savePhoto, function ()
		if FINAL_CHANNEL == "syios_smzhs" then
			message(TI18N("暂不支持"))

			return
		end

		uv0:setShardGame()
	end, true, 1)
	registerButtonEventListener(slot0.copyURL, function ()
		if uv0.copyData and uv0.copyData.success == true and uv0.copyData.message and uv0.copyData.message.url then
			if cc.Device.copyText then
				cc.Device:copyText(uv0.copyData.message.url)
				message(TI18N("下载地址已复制成功"))
			else
				message(TI18N("复制失败"))
			end
		else
			message(TI18N("复制链接失败"))
		end
	end, true, 1)
end

function QRcodeShardPanel.setShardGame(slot0)
	if PLATFORM_NAME == "demo" then
		slot0.qrCodeImage = PathTool.getWelfareBannerRes("txt_cn_welfare_bg4")
	end

	if not slot0.qrCodeImage then
		message(TI18N("二维码正在生成中......"))

		return
	end

	if not IS_IOS_PLATFORM and callFunc("checkWrite") == "false" then
		return
	end

	if slot0.sp then
		return
	end

	slot1 = ViewManager:getInstance():getLayerByTag(ViewMgrTag.LOADING_TAG)
	slot0.sp = createSprite("", SCREEN_WIDTH * 0.5, SCREEN_HEIGHT * 0.5, slot1, cc.p(0.5, 0.5))

	slot0.sp:setScale(display.getMaxScale())

	slot0.layout = ccui.Layout:create()

	slot0.layout:setContentSize(cc.size(720, 150))
	slot0.layout:setAnchorPoint(cc.p(0.5, 0))
	slot0.layout:setPosition(360, display.getBottom())
	slot1:addChild(slot0.layout)

	slot2 = RoleController:getInstance():getRoleVo()
	slot0.head = PlayerHead.new(PlayerHead.type.circle)

	slot0.head:setAnchorPoint(0.5, 0.5)
	slot0.head:setPosition(102, 67)
	slot0.head:setHeadRes(slot2.face_id, false, LOADTEXT_TYPE, slot2.face_file, slot2.face_update_time)
	slot0.layout:addChild(slot0.head)
	slot0.head:setVisible(false)

	slot3 = PathTool.getWelfareBannerRes("txt_cn_welfare_bg3")

	createLabel(30, cc.c4b(255, 228, 186, 255), nil, 161, 89, TI18N(slot2.name), slot0.layout, 2, cc.p(0, 0.5)):setVisible(false)
	createLabel(27, cc.c4b(246, 201, 141, 255), nil, 161, 40, TI18N("服务器: ") .. slot2.srv_id, slot0.layout, 2, cc.p(0, 0.5)):setVisible(false)

	if LoginController:getInstance():getModel():getLoginData() then
		slot5:setString(TI18N("服务器: ") .. slot6.srv_name)
	end

	slot7 = createLabel(27, cc.c4b(246, 201, 141, 255), nil, SCREEN_WIDTH - 50, 40, TI18N("我的分享码: "), slot0.layout, 2, cc.p(1, 0.5))

	slot7:setVisible(false)
	slot7:setString(string.format(TI18N("我的分享码: %s"), InviteCodeController:getInstance():getModel():getInviteCode()))

	slot0.sprite_load = createResourcesLoad(PathTool.getWelfareBannerRes("txt_cn_welfare_bg2"), ResourcesType.single, function ()
		if not tolua.isnull(uv0.sp) then
			loadSpriteTexture(uv0.sp, uv1, LOADTEXT_TYPE)

			if IS_NEED_SHOW_LOGO ~= false then
				createSprite(PathTool.getLogoRes(), 570 * display.getMinScale(), 1200, uv0.sp, cc.p(0.5, 0.5), LOADTEXT_TYPE):setScale(0.5)
			end

			uv0.head:setVisible(true)
			uv2:setVisible(true)
			uv3:setVisible(true)
			uv4:setVisible(true)

			slot0 = createSprite(uv5, 220 * display.getMaxScale(), 270, uv0.sp, cc.p(0.5, 0.5), LOADTEXT_TYPE)
			slot1 = createSprite(uv0.qrCodeImage, 218 * display.getMaxScale(), 260, uv0.sp, cc.p(0.5, 0.5), LOADTEXT_TYPE)

			slot1:setScale(220 / slot1:getContentSize().width)

			slot4 = cc.FileUtils:getInstance():getWritablePath() .. "GameShard.png"

			delayOnce(function ()
				cc.utils:captureScreen(function (slot0)
					if slot0 then
						saveImageToPhoto(uv0, 2)
					else
						message(TI18N("保存失败"))
					end

					if uv1.head then
						uv1.head:DeleteMe()

						uv1.head = nil
					end

					if not tolua.isnull(uv1.sp) then
						uv1.sp:removeFromParent()

						uv1.sp = nil
					end

					if not tolua.isnull(uv1.layout) then
						uv1.layout:removeFromParent()

						uv1.layout = nil
					end
				end, uv0)
			end, 1.5)
		end
	end, slot0.sprite_load)
end

function QRcodeShardPanel.setVisibleStatus(slot0, slot1)
	slot1 = slot1 or false

	slot0:setVisible(slot1)

	if slot1 == true then
		InviteCodeController:getInstance():sender19800()
	end
end

function QRcodeShardPanel.DeleteMe(slot0)
	if slot0.item_load then
		slot0.item_load:DeleteMe()
	end

	slot0.item_load = nil

	if not tolua.isnull(slot0.layout) then
		slot0.layout:removeFromParent()

		slot0.layout = nil
	end

	if slot0.sprite_load then
		slot0.sprite_load:DeleteMe()
	end

	slot0.sprite_load = nil

	if not tolua.isnull(slot0.sp) then
		slot0.sp:removeFromParent()

		slot0.sp = nil
	end
end
