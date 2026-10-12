RolePhotoChooseWindow = RolePhotoChooseWindow or BaseClass(BaseView)

function RolePhotoChooseWindow.__init(slot0)
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "face/face_photo_choose"
end

function RolePhotoChooseWindow.open_callback(slot0)
	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("title_container"):getChildByName("title_label"):setString(TI18N("操作提示"))
	UITool.SetTitleColor(slot1:getChildByName("title_container"):getChildByName("title_label"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.gallery_btn = slot1:getChildByName("gallery_btn")

	slot0.gallery_btn:getChildByName("label"):setString(TI18N("打开相册"))

	slot0.takephoto_btn = slot1:getChildByName("takephoto_btn")

	slot0.takephoto_btn:getChildByName("label"):setString(TI18N("打开照相机"))
end

function RolePhotoChooseWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		RoleController:getInstance():openRolePhotoChooseWindow(false)
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
end

function RolePhotoChooseWindow.openRootWnd(slot0)
end

function RolePhotoChooseWindow.close_callback(slot0)
	RoleController:getInstance():openRolePhotoChooseWindow(false)
end
