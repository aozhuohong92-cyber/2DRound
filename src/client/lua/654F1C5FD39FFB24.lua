VersionView = class("VersionView", function ()
	return ccui.Widget:create()
end)

function VersionView.ctor(slot0)
	slot0.size = cc.size(SCREEN_WIDTH, SCREEN_HEIGHT)

	slot0:setContentSize(slot0.size)

	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("login/login_version_view"))

	slot0:addChild(slot0.root_wnd)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width / 2, slot0.size.height / 2)

	slot0.imgAge = slot0.root_wnd:getChildByName("container"):getChildByName("Image_2")

	slot0.imgAge:setScale(0.5)
	slot0.imgAge:setAnchorPoint(0.5, 0.5)
	slot0.imgAge:setPositionY(display.getTop() - 70 + display.getTop() - slot0.size.height)
	slot0.imgAge:setPositionX(slot0.imgAge:getPositionX() + 50)
	slot0.imgAge:setVisible(IS_IOS_PLATFORM == false)

	slot0.progress_bg = slot0.root_wnd:getChildByName("progeass_container")
	slot0.notice_title = slot0.progress_bg:getChildByName("notice_title")
	slot0.notice_content = slot0.progress_bg:getChildByName("notice_content")
	slot0.bg_img = slot0.progress_bg:getChildByName("bg_img")

	slot0.bg_img:setContentSize(cc.size(SCREEN_WIDTH, slot0.bg_img:getContentSize().height))

	slot0.progress = slot0.progress_bg:getChildByName("progress")

	slot0.progress:setScale9Enabled(true)
	slot0.progress:setPercent(0)
	slot0.progress:setContentSize(cc.size(SCREEN_WIDTH, slot0.progress:getContentSize().height))

	slot0.particle_ui = slot0.progress:getChildByName("particle_ui")
	slot0.txt_progress = slot0.progress:getChildByName("txt_progress")
	slot0.desc_label = slot0.progress_bg:getChildByName("desc_label")

	math.randomseed(os.time())
	slot0.desc_label:setString(Config.LoadingDescData.data_desc[math.random(1, Config.LoadingDescData.data_desc_length)])

	slot0.notice_bg = slot0.root_wnd:getChildByName("notice_bg")
	slot0.update_notice_wifi = slot0.notice_bg:getChildByName("update_notice_wifi")

	slot0.update_notice_wifi:setString(TI18N("(建议您在wifi状态下更新游戏)"))

	slot0.notice_label = slot0.notice_bg:getChildByName("notice_label")

	slot0.notice_label:setTextAreaSize(cc.size(slot0.notice_bg:getContentSize().width - slot0.notice_label:getPositionX() * 2, 130))

	if slot0.notice_label:getVirtualRenderer() then
		slot5:setLineSpacing(10)
	end

	slot0.cancel_btn = slot0.notice_bg:getChildByName("cancel_btn")
	slot0.notice_btn = slot0.notice_bg:getChildByName("notice_btn")

	if slot0.cancel_btn:getChildByName("label") then
		slot6:setString(TI18N("取消"))
	end

	if slot0.notice_btn:getChildByName("label") then
		slot6:setString(TI18N("确定"))
	end

	if slot0.notice_bg:getChildByName("win_title") then
		slot7:setString(TI18N("下载更新"))
	end

	slot0.close_btn = slot0.notice_bg:getChildByName("close_btn")

	slot0.notice_bg:setPositionY(display.cy)
	slot0.notice_bg:setVisible(false)
	slot0.bg_img:setVisible(false)
	slot0.progress:setVisible(false)
	slot0.desc_label:setVisible(false)

	if slot0.notice_title then
		slot0.notice_title:setString(TI18N("健康游戏忠告"))

		if IS_IOS_PLATFORM == true then
			slot0.notice_content:setString(TI18N("抵制不良游戏，拒绝盗版游戏．注意自我保护，谨防受骗上当．\n适度游戏益脑，沉迷游戏伤身．合理安排时间，享受健康生活．"))
		else
			slot0.notice_content:setString(TI18N([[
抵制不良游戏，拒绝盗版游戏．注意自我保护，谨防受骗上当．
适度游戏益脑，沉迷游戏伤身．合理安排时间，享受健康生活．
本网络游戏适合年满16周岁以上的用户使用
审批文号：新广出审[2016]3457号  出版物号：ISBN 978-7-7979-1933-3]]))
		end
	end
end

function VersionView.update(slot0, slot1, slot2)
	slot0:checkIsMakeLiftBetter()

	slot0.percent = slot1

	slot0.progress:setPercent(slot0.percent)
	slot0.particle_ui:setPositionX(slot0.percent / 100 * SCREEN_WIDTH + 7)
	slot0.txt_progress:setString((slot2 or "") .. "  " .. slot0.percent .. "%")
end

function VersionView.checkIsMakeLiftBetter(slot0)
	slot1 = false

	if slot0.need_show ~= (MAKELIFEBETTER ~= true) then
		slot0.need_show = slot1

		if slot0.need_show == false then
			slot0.bg_img:setVisible(false)
			slot0.progress:setVisible(false)
			slot0.desc_label:setVisible(false)
			slot0.desc_label:setPositionY(11)

			if slot0.notice_title then
				slot0.notice_title:setVisible(false)
				slot0.notice_content:setVisible(false)
			end
		else
			slot0.bg_img:setVisible(true)
			slot0.progress:setVisible(true)
			slot0.desc_label:setVisible(true)
			slot0.desc_label:setPositionY(47)

			if slot0.notice_title then
				slot0.notice_title:setVisible(true)
				slot0.notice_content:setVisible(true)
			end
		end
	end
end

function VersionView.setTips(slot0, slot1)
	slot0.txt_progress:setString(slot1)
end

function VersionView.setVersionTips(slot0, slot1)
	if slot0.is_set_version then
		-- Nothing
	end

	slot0.is_set_version = true

	slot0.txt_progress:setString(slot1)
end

function VersionView.showNotice(slot0, slot1, slot2)
	if slot2 and slot2 < 8 then
		slot1()

		return
	end

	slot0.notice_bg:setVisible(true)

	if slot2 and slot2 ~= 0 and not tolua.isnull(slot0.notice_label) then
		slot0.notice_label:setString(string.format(TI18N("    检查到游戏当前版本需要更新,本次更新的文件大小约为:%.2fMB,点击确认即可进行下载更新,点击取消退出游戏。"), slot2 / 1024))
	end

	slot0.notice_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.began then
			uv0()
			uv1.notice_bg:setVisible(false)
		end
	end)

	slot3 = cc.Application:getInstance():getTargetPlatform()

	slot0.cancel_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.began then
			if cc.PLATFORM_OS_IPHONE == uv0 or cc.PLATFORM_OS_IPAD == uv0 or cc.PLATFORM_OS_ANDROID == uv0 then
				device.sdkCallFunc("sdkExit")
			elseif cc.PLATFORM_OS_WINDOWS == uv0 then
				cc.Director:getInstance():endToLua()
			end
		end
	end)

	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.began then
				if cc.PLATFORM_OS_IPHONE == uv0 or cc.PLATFORM_OS_IPAD == uv0 or cc.PLATFORM_OS_ANDROID == uv0 then
					device.sdkCallFunc("sdkExit")
				elseif cc.PLATFORM_OS_WINDOWS == uv0 then
					cc.Director:getInstance():endToLua()
				end
			end
		end)
	end
end

function VersionView.setSpineVisible(slot0, slot1)
end

function VersionView.DeleteMe(slot0)
end

function deepCopy(slot0)
	slot1 = {}

	return (function (slot0)
		if type(slot0) ~= "table" then
			return slot0
		elseif uv0[slot0] then
			return uv0[slot0]
		end

		uv0[slot0] = {}

		for slot5, slot6 in pairs(slot0) do
			slot1[uv1(slot5)] = uv1(slot6)
		end

		return setmetatable(slot1, getmetatable(slot0))
	end)(slot0)
end

if not is_change_print then
	slot0 = deepCopy(print)
	is_change_print = true

	function print(...)
		if not DEBUG_MODE and PLATFORM_NAME ~= "demo" then
			return
		end

		uv0(...)
	end
end
