CustomHeadImgWindow = CustomHeadImgWindow or BaseClass(BaseView)
slot0 = MainuiController:getInstance()
slot1 = table.insert
slot2 = string.format

function CustomHeadImgWindow.__init(slot0)
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "mainui/custom_headimg_window"
	slot0.update_load_file = ""
end

function CustomHeadImgWindow.open_callback(slot0)
	slot1 = slot0.root_wnd:getChildByName("background")

	slot1:setTouchEnabled(true)
	slot1:setScale(display.getMaxScale())

	slot2 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot2, 2)
	slot2:getChildByName("title_container"):getChildByName("title_label"):setString(TI18N("自定义头像预览"))

	slot0.player_head = PlayerHead.new(PlayerHead.type.circle)

	slot2:getChildByName("head_node"):addChild(slot0.player_head)

	slot0.close_btn = slot2:getChildByName("close_btn")
	slot0.gallery_btn = slot2:getChildByName("gallery_btn")

	slot0.gallery_btn:getChildByName("label"):setString(TI18N("打开相册"))

	slot0.takephoto_btn = slot2:getChildByName("takephoto_btn")

	slot0.takephoto_btn:getChildByName("label"):setString(TI18N("打开相机"))

	slot0.upload_btn = slot2:getChildByName("upload_btn")

	slot0.upload_btn:getChildByName("label"):setString(TI18N("确定上传"))

	slot0.docs_label = slot2:getChildByName("Text_1")

	slot0.docs_label:setString(TI18N("当前你的头像"))
end

function CustomHeadImgWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openCustomHeadImgWin(false)
	end, true, 1)
	registerButtonEventListener(slot0.gallery_btn, function ()
		if TencentCos:getInstance():getSecretid() and slot0 ~= "" then
			callWebcamOpenPhotoGallery()
		else
			message(TI18N("数据异常,请关闭之后再做尝试"))
		end
	end, true, 1)
	registerButtonEventListener(slot0.takephoto_btn, function ()
		if TencentCos:getInstance():getSecretid() and slot0 ~= "" then
			callWebcamTakePhoto()
		else
			message(TI18N("数据异常,请关闭之后再做尝试"))
		end
	end, true, 1)
	registerButtonEventListener(slot0.upload_btn, function ()
		if uv0.update_load_file == "" then
			message(TI18N("请选择需要上传的照片"))
		else
			if uv0.role_vo.custom_face_file ~= "" then
				TencentCos:getInstance():upLoadHeadFile(uv0.role_vo.custom_face_file, uv0.update_load_file)
			end

			uv1:openCustomHeadImgWin(false)
		end
	end, true, 1)

	if slot0.role_vo ~= nil and slot0.role_assets_event == nil then
		slot0.role_assets_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if (slot0 == "face_file" or slot0 == "face_update_time" or slot0 == "custom_face_file") and uv0.player_head then
				uv0.player_head:setHeadRes(uv0.role_vo.face_id, false, LOADTEXT_TYPE, uv0.role_vo.face_file, uv0.role_vo.face_update_time)
			end
		end)
	end
end

function CustomHeadImgWindow.openRootWnd(slot0)
	slot0.role_vo = RoleController:getInstance():getRoleVo()

	slot0.player_head:setHeadRes(slot0.role_vo.face_id, false, LOADTEXT_TYPE, slot0.role_vo.face_file, slot0.role_vo.face_update_time)
end

function CustomHeadImgWindow.updateSelectHeadImg(slot0, slot1)
	display.removeImage(slot1)
	slot0.docs_label:setString(TI18N("是否上传并使用该自定义头像"))

	slot0.update_load_file = slot1

	slot0.player_head:setHeadRes(slot1, true)
end

function CustomHeadImgWindow.close_callback(slot0)
	if slot0.role_vo ~= nil and slot0.role_assets_event ~= nil then
		slot0.role_vo:UnBind(slot0.role_assets_event)

		slot0.role_assets_event = nil
	end

	uv0:openCustomHeadImgWin(false)
end
