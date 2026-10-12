ActionSpecialVipWindow = ActionSpecialVipWindow or BaseClass(BaseView)
slot0 = ActionController:getInstance()

function ActionSpecialVipWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "action/action_special_vip_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/specialvip", "txt_cn_specialvip_1_bg"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/specialvip", "txt_cn_specialvip_2_bg"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/specialvip", "txt_cn_specialvip_2"),
			type = ResourcesType.single
		}
	}
end

function ActionSpecialVipWindow.open_callback(slot0)
	slot0.backgroud = slot0.root_wnd:getChildByName("backgroud")

	if slot0.backgroud ~= nil then
		slot0.backgroud:setScale(display.getMaxScale())
	end

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot2 = slot0.root_wnd:getChildByName("main_container"):getChildByName("image_bg")
	slot3 = "txt_cn_specialvip_2_bg"

	if PLATFORM_NAME == "9377" or PLATFORM_NAME == "9377ios" then
		slot3 = "txt_cn_specialvip_1_bg"
	elseif PLATFORM_NAME == "icebird" or PLATFORM_NAME == "bingniao" then
		slot3 = "txt_cn_specialvip_3_bg"
	end

	if not slot0.image_bg_load then
		slot0.image_bg_load = loadSpriteTextureFromCDN(slot2, PathTool.getPlistImgForDownLoad("bigbg/specialvip", slot3), ResourcesType.single, slot0.image_bg_load)
	end

	slot5 = "txt_cn_specialvip_2"

	if PLATFORM_NAME == "icebird" or PLATFORM_NAME == "bingniao" then
		slot5 = "txt_cn_specialvip_1"
	end

	slot0.goto_verifi = createImage(slot1, PathTool.getPlistImgForDownLoad("bigbg/specialvip", slot5), 200, 275, cc.p(0.5, 0.5), false)

	slot0.goto_verifi:setTouchEnabled(true)
end

function ActionSpecialVipWindow.openRootWnd(slot0)
end

function ActionSpecialVipWindow.register_event(slot0)
	registerButtonEventListener(slot0.backgroud, function ()
		uv0:openActionSpecialVIPWindow(false)
	end, false, 2)
	registerButtonEventListener(slot0.goto_verifi, function ()
		uv0:jumpPlatfrom()
	end, true, 1)
end

function ActionSpecialVipWindow.jumpPlatfrom(slot0)
	if RoleController:getInstance():getRoleVo() == nil then
		return
	end

	slot2, slot3 = unpack(Split(slot1.srv_id, "_"))

	if PLATFORM_NAME == "9377" then
		sdkCallFunc("openUrl", string.format("https://wvw.9377.cn/api/getVipLink.php?type=1&sid=%s", slot3))
	elseif PLATFORM_NAME == "9377ios" then
		sdkCallFunc("openSyW", string.format("https://wvw.9377.cn/api/getVipLink.php?type=2&sid=%s", slot3))
	elseif PLATFORM_NAME == "icebird" or PLATFORM_NAME == "bingniao" then
		if IS_IOS_PLATFORM == true then
			sdkCallFunc("openSyW", string.format("https://oauth.aiyinghun.com/static/slqykf.html?sid=%s", slot3))
		else
			sdkCallFunc("openUrl", slot4)
		end
	elseif IS_IOS_PLATFORM == true then
		sdkCallFunc("openSyW", "http://q.url.cn/cdCkXl?_type=wpa&qidian=true")
	else
		sdkCallFunc("openUrl", "http://q.url.cn/cdCkXl?_type=wpa&qidian=true")
	end
end

function ActionSpecialVipWindow.close_callback(slot0)
	if slot0.image_bg_load then
		slot0.image_bg_load:DeleteMe()

		slot0.image_bg_load = nil
	end

	uv0:openActionSpecialVIPWindow(false)
end
