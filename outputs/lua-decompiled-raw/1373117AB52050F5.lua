slot0 = {
	myFriend = 2,
	mySelf = 1,
	returnFriend = 3
}
slot2 = InviteCodeController:getInstance():getModel()
InviteCodePanel = class("InviteCodePanel", function ()
	return ccui.Widget:create()
end)

function InviteCodePanel.ctor(slot0)
	slot0.cur_index = nil
	slot0.view_list = {}

	slot0:configUI()
	slot0:register_event()
end

function InviteCodePanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("welfare/invitecode_panel"))

	slot0:addChild(slot0.root_wnd)
	slot0:setPosition(-40, -84)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot6 = LOADTEXT_TYPE

	loadSpriteTexture(slot0.main_container:getChildByName("bg"), PathTool.getPlistImgForDownLoad("bigbg/action", "action_invitecode"), slot6)

	slot0.btn_tips = slot0.main_container:getChildByName("btn_tips")
	slot0.btn_copy = slot0.main_container:getChildByName("btn_copy")
	slot0.btn_shard = slot0.main_container:getChildByName("btn_shard")
	slot0.invite_code = slot0.main_container:getChildByName("Image_17"):getChildByName("invite_code")

	slot0.invite_code:setString("")

	slot0.text_invitecode = slot0.main_container:getChildByName("text_invitecode")

	slot0.text_invitecode:setString("")

	slot0.tab_title = {}

	for slot6 = 1, 3 do
		slot7 = {
			btn = slot0.main_container:getChildByName("tab_" .. slot6)
		}
		slot7.normal = slot7.btn:getChildByName("normal")
		slot7.select = slot7.btn:getChildByName("select")

		slot7.select:setVisible(false)

		slot7.title = slot7.btn:getChildByName("title")

		slot7.title:setTextColor(CommonButton_Color[1])
		slot7.title:enableOutline(CommonButton_Color[4], 2)
		slot7.title:setFontSize(24)
		slot7.title:setString(({
			TI18N("我的推荐码"),
			TI18N("已推荐好友"),
			TI18N("老友召回")
		})[slot6])

		slot7.redpoint = slot7.btn:getChildByName("redpoint")

		slot7.redpoint:setVisible(false)

		slot7.index = slot6
		slot0.tab_title[slot6] = slot7
	end

	if ReturnActionController:getInstance():getModel():getActionIsOpen() == 0 then
		slot0.tab_title[3].btn:setVisible(false)
	end

	slot0:tabChangeView(1)
	uv0:requestProto()
end

function InviteCodePanel.tabChangeView(slot0, slot1)
	if slot0.cur_index == (slot1 or 1) then
		return
	end

	if slot0.cur_tab ~= nil then
		slot0.cur_tab.select:setVisible(false)
		slot0.cur_tab.title:setTextColor(CommonButton_Color[1])
	end

	slot0.cur_index = slot1
	slot0.cur_tab = slot0.tab_title[slot0.cur_index]

	if slot0.cur_tab ~= nil then
		slot0.cur_tab.select:setVisible(true)
		slot0.cur_tab.title:setTextColor(CommonButton_Color[2])
	end

	if slot0.pre_panel ~= nil and slot0.pre_panel.setVisibleStatus then
		slot0.pre_panel:setVisibleStatus(false)
	end

	slot0.pre_panel = slot0:createSubPanel(slot0.cur_index)

	if slot0.pre_panel ~= nil and slot0.pre_panel.setVisibleStatus then
		slot0.pre_panel:setVisibleStatus(true)
	end
end

function InviteCodePanel.createSubPanel(slot0, slot1)
	if slot0.view_list[slot1] == nil then
		if slot1 == uv0.mySelf then
			slot2 = InviteCodeMyPanel.new()
		elseif slot1 == uv0.myFriend then
			slot2 = InviteCodeFriendPanel.new()
		elseif slot1 == uv0.returnFriend then
			slot2 = InviteCodeReturnFriendPanel.new()
		end

		slot2:setPosition(cc.p(slot0.main_container:getContentSize().width / 2, 352))
		slot0.main_container:addChild(slot2)

		slot0.view_list[slot1] = slot2
	end

	return slot2
end

function InviteCodePanel.getInviteCodeData(slot0)
	if uv0:getInviteCode() then
		slot0.invite_code:setString(slot1)
	else
		message(TI18N("获取邀请码失败"))
	end
end

function InviteCodePanel.getAlreadyFriendNum(slot0)
	if slot0.text_invitecode then
		slot0.text_invitecode:setString(string.format(TI18N("已邀请好友：%d人"), uv0:getFirendNum() or 0))
	end
end

function InviteCodePanel.register_event(slot0)
	if not slot0.get_invite_code_event then
		slot0.get_invite_code_event = GlobalEvent:getInstance():Bind(InviteCodeEvent.Get_InviteCode_Event, function ()
			uv0:getInviteCodeData()
		end)
	end

	if not slot0.invite_code_bind_event then
		slot0.invite_code_bind_event = GlobalEvent:getInstance():Bind(InviteCodeEvent.InviteCode_BindRole_Event, function ()
			uv0:getAlreadyFriendNum()
		end)
	end

	if not slot0.update_number_event then
		slot0.update_number_event = GlobalEvent:getInstance():Bind(InviteCodeEvent.InviteCode_BindRole_Updata_Event, function ()
			uv0:getAlreadyFriendNum()
		end)
	end

	if not slot0.return_redpoint_event then
		slot0.return_redpoint_event = GlobalEvent:getInstance():Bind(InviteCodeEvent.Return_InviteCode_Event, function ()
			if uv1.tab_title[3] and uv1.tab_title[3].redpoint then
				uv1.tab_title[3].redpoint:setVisible(uv0:getReturnRedPoint())
			end
		end)
	end

	if not slot0.updata_my_redpoint_event then
		slot0.updata_my_redpoint_event = GlobalEvent:getInstance():Bind(InviteCodeEvent.InviteCode_My_Event, function ()
			if uv1.tab_title[1] and uv1.tab_title[1].redpoint then
				uv1.tab_title[1].redpoint:setVisible(uv0:inviteRedPoint())
			end
		end)
	end

	registerButtonEventListener(slot0.btn_tips, function (slot0, slot1, slot2)
		TipsManager:getInstance():showCommonTips(Config.InviteCodeData.data_const.tips.desc, slot1:getTouchBeganPosition(), nil, , 500)
	end, false, 1)
	registerButtonEventListener(slot0.btn_copy, function ()
		uv0:copyCode()
	end, true, 1)

	function slot4()
		if FINAL_CHANNEL == "syios_smzhs" then
			message(TI18N("暂不支持"))

			return
		end

		uv0:setShardGame()
	end

	slot5 = true

	registerButtonEventListener(slot0.btn_shard, slot4, slot5, 1)

	for slot4, slot5 in pairs(slot0.tab_title) do
		registerButtonEventListener(slot5.btn, function ()
			uv0:tabChangeView(uv1.index)
		end, false, 1)
	end
end

function InviteCodePanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function InviteCodePanel.setShardGame(slot0)
	if not IS_IOS_PLATFORM and callFunc("checkWrite") == "false" then
		return
	end

	if slot0.sp then
		return
	end

	uv0:sender10929()

	slot1 = ViewManager:getInstance():getLayerByTag(ViewMgrTag.LOADING_TAG)
	slot0.sp = createSprite("", SCREEN_WIDTH * 0.5, SCREEN_HEIGHT * 0.5, slot1, cc.p(0.5, 0.5))
	slot0.layout = ccui.Layout:create()

	slot0.layout:setContentSize(cc.size(720, 150))
	slot0.layout:setAnchorPoint(cc.p(0.5, 0))
	slot0.layout:setPosition(360, display.getBottom())
	slot1:addChild(slot0.layout)

	slot2 = RoleController:getInstance():getRoleVo()
	slot3 = RoleController:getInstance():getApkData()
	slot0.sprite_load = createResourcesLoad(PathTool.getWelfareBannerRes("txt_cn_welfare_bg2"), ResourcesType.single, function ()
		if not tolua.isnull(uv0.sp) then
			loadSpriteTexture(uv0.sp, uv1, LOADTEXT_TYPE)
			uv0.sp:setScale(display.getMaxScale())

			if IS_NEED_SHOW_LOGO ~= false then
				createSprite(PathTool.getLogoRes(), 570 * display.getMinScale(), 1200, uv0.sp, cc.p(0.5, 0.5), LOADTEXT_TYPE):setScale(0.45)
			end

			uv0.head = PlayerHead.new(PlayerHead.type.circle)

			uv0.head:setAnchorPoint(0.5, 0.5)
			uv0.head:setPosition(102, 67)
			uv0.head:setHeadRes(uv2.face_id, false, LOADTEXT_TYPE, uv2.face_file, uv2.face_update_time)
			uv0.layout:addChild(uv0.head)

			slot0 = createLabel(30, cc.c4b(255, 228, 186, 255), nil, 161, 89, TI18N(uv2.name), uv0.layout, 2, cc.p(0, 0.5))

			if LoginController:getInstance():getModel():getLoginData() then
				createLabel(27, cc.c4b(246, 201, 141, 255), nil, 161, 40, TI18N("服务器: ") .. uv2.srv_id, uv0.layout, 2, cc.p(0, 0.5)):setString(TI18N("服务器: ") .. slot2.srv_name)
			end

			createLabel(27, cc.c4b(246, 201, 141, 255), nil, SCREEN_WIDTH - 50, 40, TI18N("我的分享码: "), uv0.layout, 2, cc.p(1, 0.5)):setString(string.format(TI18N("我的分享码: %s"), InviteCodeController:getInstance():getModel():getInviteCode()))

			slot6 = createSprite(PathTool.getWelfareBannerRes("txt_cn_welfare_bg3"), 220 * display.getMaxScale(), 270, uv0.sp, cc.p(0.5, 0.5), LOADTEXT_TYPE)
			uv0.er_wei_ma = createSprite(nil, 218 * display.getMaxScale(), 260, uv0.sp, cc.p(0.5, 0.5))

			if PLATFORM_NAME == "demo" then
				loadSpriteTexture(uv0.er_wei_ma, PathTool.getWelfareBannerRes("txt_cn_welfare_bg4"), LOADTEXT_TYPE)
				uv0.er_wei_ma:setScale(220 / uv0.er_wei_ma:getContentSize().width)
			end

			if uv3 then
				download_qrcode_png(uv3.message.qrcode_url, function (slot0, slot1)
					if not tolua.isnull(uv0.er_wei_ma) and slot0 == 0 then
						loadSpriteTexture(uv0.er_wei_ma, slot1, LOADTEXT_TYPE)
						uv0.er_wei_ma:setScale(220 / uv0.er_wei_ma:getContentSize().width)
					end
				end)
			end

			slot7 = cc.FileUtils:getInstance():getWritablePath() .. "GameShard.png"

			delayOnce(function ()
				cc.utils:captureScreen(function (slot0)
					if slot0 then
						saveImageToPhoto(uv0, 1)
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

function InviteCodePanel.copyCode(slot0)
	if uv0:getInviteCode() then
		if cc.Device.copyText then
			cc.Device:copyText(slot1)
			message(TI18N("推荐码已复制成功"))
		else
			message(TI18N("复制失败"))
		end
	else
		message(TI18N("复制推荐码失败"))
	end
end

function InviteCodePanel.DeleteMe(slot0)
	if slot0.sprite_load then
		slot0.sprite_load:DeleteMe()
	end

	slot0.sprite_load = nil

	if not tolua.isnull(slot0.sp) then
		slot0.sp:removeFromParent()

		slot0.sp = nil
	end

	if not tolua.isnull(slot0.layout) then
		slot0.layout:removeFromParent()

		slot0.layout = nil
	end

	for slot4, slot5 in pairs(slot0.view_list) do
		if slot5 and slot5.DeleteMe then
			slot5:DeleteMe()
		end
	end

	slot0.view_list = nil

	if slot0.get_invite_code_event then
		GlobalEvent:getInstance():UnBind(slot0.get_invite_code_event)

		slot0.get_invite_code_event = nil
	end

	if slot0.invite_code_bind_event then
		GlobalEvent:getInstance():UnBind(slot0.invite_code_bind_event)

		slot0.invite_code_bind_event = nil
	end

	if slot0.update_number_event then
		GlobalEvent:getInstance():UnBind(slot0.update_number_event)

		slot0.update_number_event = nil
	end

	if slot0.return_redpoint_event then
		GlobalEvent:getInstance():UnBind(slot0.return_redpoint_event)

		slot0.return_redpoint_event = nil
	end

	if slot0.updata_return_redpoint_event then
		GlobalEvent:getInstance():UnBind(slot0.updata_return_redpoint_event)

		slot0.updata_return_redpoint_event = nil
	end

	if slot0.updata_my_redpoint_event then
		GlobalEvent:getInstance():UnBind(slot0.updata_my_redpoint_event)

		slot0.updata_my_redpoint_event = nil
	end
end
