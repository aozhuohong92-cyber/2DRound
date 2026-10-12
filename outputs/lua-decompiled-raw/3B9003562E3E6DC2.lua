GmCmd = GmCmd or {}

function GmCmd.show_from_chat(slot0, slot1)
	if slot1 == "@sgmcmd" then
		SHOW_GM = not SHOW_GM

		if slot0.open_button == nil then
			ViewManager:getInstance():initMainFunBar()
		end

		slot0.open_button:setVisible(SHOW_GM)

		return true
	elseif slot1 == "@showfps" then
		CC_SHOW_FPS = not CC_SHOW_FPS

		cc.Director:getInstance():setDisplayStats(CC_SHOW_FPS)

		return true
	elseif slot1 == "@gmclearversionfile" then
		slot0:clearVerFile()

		return true
	end

	return false
end

function GmCmd.add_gm_button(slot0, slot1)
	if not slot0.is_init then
		ProtoMgr:RegisterCmdCallback(10391, "handle10391", slot0)
		ProtoMgr:RegisterCmdCallback(10399, "handle10399", slot0)

		slot0.root_wnd = slot1

		slot0:initTouch()

		slot0.view_height = 400
		slot0.view_width = 720
		slot0.view_in_height = display.height
		slot0.edit_list = SysEnv:getInstance():getTable(SysEnv.keys.gm_eidt_list)
		slot0.edit_list_index = #slot0.edit_list
		slot0.edit_max = 10
		slot0.scroll_view = createScrollView(slot0.view_width, slot0.view_height, 0, -slot0.view_height, nil)

		slot0.scroll_view:setAnchorPoint(cc.p(0, 1))
		slot0.scroll_view:setVisible(false)
		slot0.scroll_view:setPosition(0, 0)
		slot0.scroll_view:setContentSize(cc.size(slot0.view_width, slot0.view_height))
		slot0.scroll_view:setInnerContainerSize(cc.size(slot0.view_width, slot0.view_in_height))
		showLayoutRect(slot0.scroll_view)

		slot0.open_button = slot0:addButton(slot1, "GM", display.getLeft(slot0.root_wnd) + 200, display.getTop(slot0.root_wnd) - 50, 1, 99, function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				if uv0.in_move then
					uv0.in_move = false

					return
				end

				if not uv0.is_init_button then
					uv0:init_button()
				end

				uv0.scroll_view:setVisible(not uv0.scroll_view:isVisible())
			elseif slot1 == ccui.TouchEventType.began then
				uv0.touch_time = GameNet:getInstance():getTime()
			elseif slot1 == ccui.TouchEventType.moved then
				if uv0.in_move or GameNet:getInstance():getTime() - uv0.touch_time > 1 then
					slot0:setPosition(slot0:getTouchMovePosition())

					uv0.in_move = true
				end
			end
		end)

		slot0.open_button:setAnchorPoint(cc.p(0.5, 1))
		slot0.open_button:setContentSize(cc.size(120, 59))
		GlobalKeybordEvent:getInstance():add(function ()
			uv0:changeGm(-1)
		end, cc.Handler.EVENT_KEYBOARD_RELEASED, 28, 0)
		GlobalKeybordEvent:getInstance():add(function ()
			uv0:changeGm(1)
		end, cc.Handler.EVENT_KEYBOARD_RELEASED, 29, 0)
		GlobalKeybordEvent:getInstance():add(function ()
			uv0:gm_callback(uv0.gm_editbox)
		end, cc.Handler.EVENT_KEYBOARD_RELEASED, cc.KeyCode.KEY_ENTER, 0)
		slot0.open_button:addChild(slot0.scroll_view)

		slot0.button_height = 59
		slot0.button_width = 120
		slot0.gm_editbox = createEditBox(slot0.open_button, PathTool.getResFrame("common", "common_90018"), cc.size(300, 45), nil, 25, nil, 25, "命令", nil, , LOADTEXT_TYPE_PLIST)

		if #slot0.edit_list > 0 then
			slot0.gm_editbox:setText(slot0.edit_list[#slot0.edit_list].msg)
		end

		slot0.gm_editbox:setPosition(slot0.open_button:getContentSize().width + slot0.gm_editbox:getContentSize().width / 2 + 10, slot0.open_button:getContentSize().height / 2)
		slot0.gm_editbox:registerScriptEditBoxHandler(function (slot0, slot1)
			if slot0 == "return" then
				uv0:gm_callback(slot1)
			end
		end)

		if not SHOW_GM then
			slot0.open_button:setVisible(false)
		end

		slot0.is_init = true
	end
end

function GmCmd.req1190(slot0)
	if not slot0.root_1190 then
		slot0.root_1190 = ccui.Widget:create()

		slot0.root_wnd:addChild(slot0.root_1190)
	end

	delayRun(slot0.root_1190, 8, function ()
		Send(1190, {})
		uv0:req1190()
	end)
end

function GmCmd.handle10391(slot0, slot1)
	slot3 = assert(loadstring(slot1.data or ""))() or "error"

	if slot1.type == 1 then
		if type(slot3) == "table" then
			slot3 = luaTable2Str("", slot3)
		end

		Send(10391, {
			msg = tostring(slot3)
		})
	end
end

function GmCmd.handle10399(slot0, slot1)
	if slot1.code == 99 then
		print_log("==========server==error=====start==>\n" .. slot1.msg .. "\n============server===error=====end==")
	else
		message(slot1.msg)
		print("gm==recv==>", slot1.msg)
	end
end

function GmCmd.show(slot0)
	if slot0.open_button then
		slot0.open_button:setVisible(true)
	end
end

function GmCmd.showGmList(slot0, slot1, slot2)
	if slot1.layout == nil then
		slot3 = ccui.Layout:create()

		slot3:setAnchorPoint(cc.p(0, 1))
		showLayoutRect(slot3)

		slot4 = 4
		slot5 = math.ceil(#slot2 / slot4)
		slot6 = slot0.button_width * slot4 + 50
		slot7 = slot0.button_height * slot5 + (slot5 + 1) * 4

		slot3:setContentSize(slot6, slot7)
		slot0.scroll_view:addChild(slot3)

		slot1.layout = slot3
		slot1.is_visible = true
		slot1.button_list = {}
		slot9 = slot0.button_width / 2
		slot10 = slot7 - 4

		if slot0.scroll_view:getContentSize().width <= cc.p(slot1:getPosition()).x - slot0.button_width / 2 + slot6 then
			slot11 = slot11 - slot6
		end

		if slot11 <= 0 then
			slot11 = 0
		end

		slot15 = slot11
		slot16 = slot8.y - slot0.button_height

		slot3:setPosition(slot15, slot16)

		slot9 = -0.5 * slot0.button_width

		for slot15, slot16 in pairs(slot2) do
			if not (type(slot16) == "table") and Config.GmData.data_list[slot16] == nil then
				return
			end

			slot18 = slot17 and slot16.name or Config.GmData.data_list[slot16].tips
			slot19 = slot17 and slot16.fun or function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended then
					slot2 = {
						msg = Config.GmData.data_list[uv0].info
					}

					print("gm===send", slot2.msg)
					BaseController:SendProtocal(10399, slot2)

					uv1.button_click_time[uv2] = (uv1.button_click_time[uv2] or 0) + 1

					slot0:setTitleColor(uv1:time2Color(uv1.button_click_time[uv2]))
				end
			end

			if slot3:getContentSize().width < slot9 + slot0.button_width + 10 then
				slot9 = 0.5 * slot0.button_width + 10
				slot10 = slot10 - slot0.button_height - 4
			end

			table.insert(slot1.button_list, slot0:addButtonList(slot3, slot18, slot9, slot10, 1, 1, slot19 or function (...)
			end, slot0:time2Color(slot0.button_click_time[slot18], slot15)))
		end
	else
		slot1.is_visible = not slot1.is_visible

		slot1.layout:setVisible(slot1.is_visible)
	end

	if slot0.last_sender and slot0.last_sender ~= slot1 then
		slot0.last_sender.layout:setVisible(false)

		slot0.last_sender.is_visible = false
	end

	slot0.last_sender = slot1
end

function GmCmd.addButtonList(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)
	slot9 = ccui.Button:create()
	slot10 = PathTool.getResFrame("common", "common_1017")

	if slot6 == 1 then
		slot10 = PathTool.getResFrame("common", "common_1018")
	end

	slot9:loadTextures(slot10, "", "", LOADTEXT_TYPE_PLIST)
	slot9:setAnchorPoint(cc.p(0.5, 1))
	slot9:setTitleText(slot2)
	slot9:setTitleFontSize(18)
	slot9:setScale9Enabled(true)
	slot9:setTitleFontName(DEFAULT_FONT)
	slot9:setContentSize(cc.size(slot0.button_width, slot0.button_height))
	slot9:setTitleColor(slot8 or Config.ColorData.data_color3[1])
	slot9:setPosition(slot3, slot4)
	slot9:addTouchEventListener(function (slot0, slot1)
		uv0(slot0, slot1)
	end)
	slot1:addChild(slot9, slot6 or 0)

	return slot9
end

function GmCmd.init_button(slot0)
	slot1 = {}
	slot0.button_click_time = SaveLocalData:getInstance():readTableForKey(SaveLocalData.key_value.gm_cmd) or {}
	slot2 = {}

	for slot6, slot7 in pairs(slot0.button_click_time) do
		table.insert(slot2, {
			name = slot6,
			time = slot7
		})
	end

	table.sort(slot2, function (slot0, slot1)
		return slot1.time < slot0.time
	end)

	slot3 = {
		[slot8.tips] = {
			slot7,
			slot8
		}
	}

	for slot7, slot8 in pairs(Config.GmData.data_list or {}) do
		if slot8.is_show ~= FALSE then
			table.insert(slot1, {
				slot8.tips,
				function (slot0, slot1)
					if slot1 == ccui.TouchEventType.ended then
						if uv0.list and #uv0.list > 0 then
							uv1:showGmList(slot0, uv0.list)
						else
							if uv1.last_sender then
								uv1.last_sender.layout:setVisible(false)

								uv1.last_sender.is_visible = false
								uv1.last_sender = nil
							end

							slot2 = {
								msg = uv0.info
							}

							print("gm===send", slot2.msg)
							BaseController:SendProtocal(10399, slot2)
						end

						uv1.button_click_time[uv0.tips] = (uv1.button_click_time[uv0.tips] or 0) + 1

						slot0:setTitleColor(uv1:time2Color(uv1.button_click_time[uv0.tips]))
						SaveLocalData:getInstance():writeLuaData(SaveLocalData.key_value.gm_cmd, uv1.button_click_time)
					end
				end
			})
		end
	end

	slot4 = {}
	slot5 = {}

	for slot9 = 1, #slot2 do
		if slot3[slot2[slot9].name] and #slot3[slot2[slot9].name][2].list == 0 then
			table.insert(slot4, slot3[slot2[slot9].name][1])

			if #slot4 >= 9 then
				break
			end
		end
	end

	slot6 = LOGIN_MODE == "1" and "默认登录" or "不默认登录"
	slot0.is_auto = true

	for slot12, slot13 in pairs({
		{
			"软重启",
			"restart"
		},
		{
			"ui",
			"f1"
		},
		{
			"纹理信息",
			"dumpTextureInfo"
		},
		{
			"热更游戏",
			"hot_fix"
		},
		{
			"输出",
			"f4"
		},
		{
			"关闭GM",
			"closeMe"
		},
		{
			"删网络层",
			"stopNet"
		},
		{
			"开网络层",
			"restartNet"
		},
		{
			"只是断网",
			"disconnect"
		},
		{
			"请求网络",
			"reconnect"
		},
		{
			"战斗调试",
			"battle_debug"
		},
		{
			"UI调试",
			"ui_debug"
		},
		{
			"内存变量",
			"ui_var"
		},
		{
			"清空版本",
			"clearVerFile"
		},
		{
			"清除纹理",
			"takePhoto"
		},
		{
			"打印纹理",
			"dumpCachedTextureInfo"
		},
		{
			"乱点",
			"random_click"
		},
		{
			"打印内存",
			"showSysSize"
		},
		{
			"退出战斗",
			"exitbattle"
		},
		{
			"FPS",
			"closeFPS"
		},
		{
			"网络ping",
			"net_ping"
		},
		{
			"wx_share",
			"wx_share"
		},
		{
			"wx_share_url",
			"wx_share_url"
		},
		{
			"savePhoto",
			"savePhoto"
		},
		{
			"time_ticket",
			"time_ticket"
		},
		{
			"加qq群",
			"join_qq"
		},
		{
			"模块UI文件重载",
			"reloadluafile"
		},
		{
			"输出新手资源",
			"saveResourcesList"
		},
		{
			"贝塞尔曲线",
			"showBezierPos"
		},
		{
			"监测模拟器",
			"checkInEmulator"
		},
		{
			"当前节点数",
			"getNodeTotal"
		},
		{
			"代金劵",
			"testPerfer"
		},
		{
			"自定义头像",
			"openCustomWindow"
		}
	}) do
		if slot0[slot13[2]] then
			table.insert({}, {
				name = slot13[1],
				fun = function (slot0, slot1)
					if slot1 == ccui.TouchEventType.ended then
						uv0[uv1](uv0, slot0, slot1)
					end
				end
			})
		end
	end

	table.insert(slot1, 1, {
		"基础功能",
		function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				uv0:showGmList(slot0, uv1)
			end
		end
	})
	table.insert(slot1, 2, {
		"自己常用",
		function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				uv0:showGmList(slot0, uv1)
			end
		end
	})
	table.insert(slot1, 3, {
		"修改配置",
		function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				uv0:showConfigPanel()
			end
		end
	})

	slot10 = math.ceil(#slot1 / 5)
	slot11 = -0.5 * slot0.button_width

	for slot16, slot17 in pairs(slot1) do
		slot18, slot19 = unpack(slot17)

		if -0.5 * slot0.button_width + slot0.button_width + 10 > slot0.view_width - slot0.button_width then
			slot11 = 0.5 * slot0.button_width + 10
			slot12 = slot0.view_in_height - 4 - slot0.button_height - 4
		end

		slot20 = slot0:time2Color(slot0.button_click_time[slot18], index)

		if slot18 == "联盟战" then
			slot21 = 0
		end

		slot21 = slot0:addButtonList(slot0.scroll_view, slot18, slot11, slot12, 1, 0, slot19 or function (...)
		end, slot20)
	end

	slot0.is_init_button = true
end

function GmCmd.testPerfer(slot0)
	sdkPerfer_prize()
end

function GmCmd.getNodeTotal(slot0)
	slot2 = {
		ViewManager:getInstance():getBaseLayout():getChildren()
	}
	slot3 = 0

	while slot3 < #slot2 do
		for slot7, slot8 in pairs(slot2[slot3 + 1]) do
			if not tolua.isnull(slot8) and slot8.getChildren then
				table.insert(slot2, slot8:getChildren())
			end
		end
	end

	print(string.format("当前实际节点数:%d, 当前总节点:%d, 当前GM命令节点:%d", slot3 - slot0:getButtonNodeTotal(), slot3, slot0:getButtonNodeTotal()))
end

function GmCmd.getButtonNodeTotal(slot0)
	slot2 = {
		slot0.open_button:getChildren()
	}
	slot3 = 0

	while slot3 < #slot2 do
		for slot7, slot8 in pairs(slot2[slot3 + 1]) do
			if not tolua.isnull(slot8) and slot8.getChildren then
				table.insert(slot2, slot8:getChildren())
			end
		end
	end

	return slot3
end

function GmCmd.saveResourcesList(slot0)
	slot2 = ResourcesCacheMgr:getInstance():getLoadRes()
	slot3 = __down_spine_list

	if SysEnv:getInstance():loadResourcesFile() == nil then
		slot1 = {}
	end

	for slot10, slot11 in pairs({
		"v9o8qm1Y40cbOAlh6LDp0kMDi5CzXlsO/E88888",
		"v9o8qm1Y40cbOAlh6LDp0kMDi5CzXlsO/H99999",
		"v9o8qm1Y40cbOAlh6LDp0kMDi5CzXlsO/E51006",
		"v9o8qm1Y40cbOAlh6LDp0kMDi5CzXlsO/E65004",
		"v9o8qm1Y40cbOAlh6LDp0kMDi5CzXlsO/E65012",
		"v9o8qm1Y40cbOAlh6LDp0kMDi5CzXlsO/E31316",
		"v9o8qm1Y40cbOAlh6LDp0kMDi5CzXlsO/E20986",
		"v9o8qm1Y40cbOAlh6LDp0kMDi5CzXlsO/E50094",
		"v9o8qm1Y40cbOAlh6LDp0kMDi5CzXlsO/E51008",
		"v9o8qm1Y40cbOAlh6LDp0kMDi5CzXlsO/E50130",
		"fonts/",
		"SI4YKjtXKGfkpPZhfeZcJEE6b4gGZbox/",
		"shaders/",
		"sound/",
		"resource/platform/",
		"resource/item/",
		"resource/headicon/",
		"resource/strongericon/",
		"resource/headcircle/",
		"resource/skillicon/",
		"resource/bufficon/",
		"resource/campicon/",
		"resource/bigbg/txt_cn_bigbg_20.png",
		"resource/bigbg/bigbg_3.png",
		"resource/functionicon/",
		"resource/honor"
	}) do
		table.insert({}, slot11)
	end

	for slot10, slot11 in pairs(slot2) do
		slot5(slot6, slot11)
	end

	for slot10, slot11 in pairs(slot3) do
		slot5(slot6, "v9o8qm1Y40cbOAlh6LDp0kMDi5CzXlsO/" .. slot11)
	end

	for slot10, slot11 in pairs(slot6) do
		slot12 = true

		for slot16, slot17 in ipairs(slot1) do
			if slot11 == slot17 then
				slot12 = false

				break
			end
		end

		if slot12 == true then
			slot5(slot1, slot11)
		end
	end

	SysEnv:getInstance():saveResourcesFile(slot1)
end

function GmCmd.showBezierPos(slot0)
	if not slot0.bezierPanel then
		slot0.bezierPanel = AdjustBezierPanel.New()
	end

	if slot0.bezierPanel:isOpen() == false then
		slot0.bezierPanel:open()
	end
end

function GmCmd.random_click(slot0)
	if cc.GLView.handleTouchesEnd == nil then
		return
	end

	if slot0.start_click == nil then
		slot0.start_click = false
	end

	slot1 = cc.Director:getInstance():getOpenGLView():getFrameSize()
	slot0.start_click = not slot0.start_click

	slot0.gm_editbox:setVisible(not slot0.start_click)

	if slot0.start_click == true then
		slot0.scroll_view:setVisible(false)

		if slot0.start_click_time == nil then
			slot0.start_click_time = GlobalTimeTicket:getInstance():add(function ()
				cc.Director:getInstance():getOpenGLView():handleTouchesEnd(math.random(0, uv0.width), uv0.height - math.random(0, uv0.height))
			end, 0.2)
		end
	elseif slot0.start_click_time ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.start_click_time)

		slot0.start_click_time = nil
	end
end

function GmCmd.savePhoto(slot0)
	cc.utils:captureScreen(function (slot0)
		if slot0 then
			saveImageToPhoto(uv0)
		else
			message("=====aaaaa")
		end
	end, cc.FileUtils:getInstance():getWritablePath() .. "CaptureScreenTest.png")
end

function GmCmd.wx_share(slot0)
	cc.utils:captureScreen(function (slot0)
		if slot0 then
			wx_scene = ((wx_scene or 0) + 1) % 2

			wxSharePhoto("title", "content", uv0, nil, wx_scene)
		else
			message("=====aaaaa")
		end
	end, cc.FileUtils:getInstance():getWritablePath() .. "CaptureScreenTest.png")
end

function GmCmd.checkInEmulator(slot0)
	if device.callFunc("inEmulator") ~= "" then
		if string.sub(slot1, 1, 1) == "1" then
			CommonAlert.show(TI18N("模拟器登录  ") .. slot1, TI18N("确定"), nil, TI18N("取消"))
		else
			CommonAlert.show(TI18N("手机登录  ") .. slot1, TI18N("确定"), nil, TI18N("取消"))
		end
	else
		message("旧版本一律认为是模拟器")
	end
end

function GmCmd.wx_share_url(slot0)
	cc.utils:captureScreen(function (slot0)
		doRemoveFromParent(wx_image)

		wx_image = createImage(uv0.root_wnd, uv1, 100, 100)

		wx_image:setScale(0.2)

		if slot0 then
			wx_scene = ((wx_scene or 0) + 1) % 2

			wxShareUrl("title", "content", "http://tech.qq.com/zt2012/tmtdecode/252.htm", uv1, wx_scene)
		else
			message("=====aaaaa")
		end
	end, cc.FileUtils:getInstance():getWritablePath() .. "CaptureScreenTest.png")
end

function GmCmd.time_ticket(slot0)
	AudioManager:getInstance():showLoadMuiscPath()
end

function GmCmd.join_qq(slot0)
	QQ_GROUP_LIST = QQ_GROUP_LIST or {
		{
			ios = "mqqapi://card/show_pslcard?src_type=internal&version=1&uin=431023033&key=6d9cdcb70ec56076639ca6faa535bafb4896680d47d4627e612e535944c94320&card_type=group&source=external",
			android = "mqqopensdkapi://bizAgent/qm/qr?url=http%3A%2F%2Fqm.qq.com%2Fcgi-bin%2Fqm%2Fqr%3Ffrom%3Dapp%26p%3Dandroid%26k%3D" .. "ItSajVspkR0fkSBeoH9dNr7qYFpMeOoG"
		}
	}

	joinQQGroup()
end

function GmCmd.reloadluafile(slot0)
	slot1 = NewModelFile or {}

	for slot5, slot6 in pairs(slot1) do
		if slot1[slot5] and package.loaded[slot7] ~= nil then
			package.loaded[slot7] = nil

			require(slot7)
		end
	end
end

function GmCmd.takePhoto(slot0)
	display.removeUnusedTextures()
end

function GmCmd.dumpCachedTextureInfo(slot0)
	print(cc.Director:getInstance():getTextureCache():dumpCachedTextureInfo())
	print(string.format("\n当前lua内存为 ====> %smb", math.floor(collectgarbage("count") / 1024)))
end

function GmCmd.battle_debug(slot0)
	require("0zWHhlnBORyiROK6lvI6VBn6vAbJRQqS/battle/battle_debug")
	BattleDebug:getInstance()
end

function GmCmd.ui_debug(slot0)
	require("common/debug_ui_helper")
	DebugUIHelper:getInstance(slot0.open_button):open()
	slot0.scroll_view:setVisible(false)
end

function GmCmd.ui_var(slot0)
	require("common/debug_ui_var")
	DebugUIVar:getInstance():open()
	slot0.scroll_view:setVisible(false)
end

function GmCmd.showSysSize(slot0)
	message("当前内存为:" .. device.sysTotalSize() .. "       " .. EQUIPMENT_QUALITY)
end

function GmCmd.exitbattle(slot0)
	BattleController:getInstance():csFightExit()
end

function GmCmd.closeFPS(slot0)
	slot0.is_auto = not slot0.is_auto

	cc.Director:getInstance():setDisplayStats(slot0.is_auto)
end

function GmCmd.restart(slot0)
end

function GmCmd.stopNet(slot0)
end

function GmCmd.restartNet(slot0)
end

function GmCmd.disconnect(slot0)
	GameNet:getInstance():DisconnectByClient(false)
end

function GmCmd.reconnect(slot0)
	GameNet:getInstance():Connect()
end

function GmCmd.dumpTextureInfo(slot0, ...)
	slot3 = nil

	for slot7, slot8 in pairs(Split(cc.Director:getInstance():getTextureCache():getCachedTextureInfo(), "\n")) do
		if #Split(slot8, "/res/") > 1 then
			slot9 = string.gsub(Split(slot8, "/res/")[2], "\".+=>", " ")
		end
	end

	for slot7, slot8 in pairs(__spine_list) do
		print(slot7, slot8)
	end

	if tolua.isnull(slot0.rem_box) then
		GmCmd:dumpTextureInfo2()
		GlobalTimeTicket:getInstance():add(function ()
			GmCmd:dumpTextureInfo2()
		end, xzy and 2 or 5, 0, "dumpTextureInfo_timer")
	else
		GlobalTimeTicket:getInstance():remove("dumpTextureInfo_timer")
		slot0.rem_box:removeFromParent()

		slot0.rem_box = nil
	end
end

function GmCmd.dumpTextureInfo2(slot0)
	slot2 = {}
	slot4 = {}
	slot5 = {}
	slot6 = {}
	slot7 = {}
	slot8 = {}
	slot9 = ""
	slot10 = {}
	slot11 = {}
	slot13 = 0

	for slot17, slot18 in pairs(Split(cc.Director:getInstance():getTextureCache():getCachedTextureInfo(), "\n")) do
		if string.find(slot18, "v9o8qm1Y40cbOAlh6LDp0kMDi5CzXlsO") then
			args = Split(slot18, "/res/")

			if not slot11[Split(Split(args[2], "\"")[1], "/")[2]] then
				slot12 = 0 + 1

				table.insert(slot10, slot19)
			end

			slot11[slot19] = true
		elseif string.find(slot18, "scene") then
			args = Split(slot18, "/res/")

			if tonumber(Split(Split(args[2], "\"")[1], "/")[2]) then
				if not slot6[slot19] then
					table.insert(slot4, slot19)
				end

				slot6[slot19] = true
			end
		elseif string.find(slot18, "resource") then
			args = Split(slot18, "/res/")

			if string.find(Split(args[2], "\"")[1], ".jpg") or string.find(slot19, ".png") then
				if not slot7[slot19] then
					table.insert(slot8, slot19)
				end

				slot7[slot1] = true
			end
		end
	end

	collectgarbage("collect")

	slot14 = collectgarbage("count")
	slot15 = string.format("骨骼数据:[<div fontcolor=#ffff00>%s</div>]", table.concat(slot10, ","))
	slot16 = string.format("骨骼数量:[总个数<div fontcolor=#ffff00>%s</div>]", slot12)
	slot17 = string.format("场景数据:[<div fontcolor=#ffff00>%s</div>]", table.concat(slot4, ","))
	slot18 = string.format("UI数据:[<div fontcolor=#ffff00>%s</div>]", table.concat(slot8, ",\n"))
	slot19 = string.format("当前纹理占用内存:<div fontcolor=#ffff00>%s</div>", Split(slot3[#slot3], " for ")[2])
	slot20 = string.format("当前 LUA占用内存:<div fontcolor=#ffff00>%d KB </div>(%.2f MB)", slot14, slot14 / 1024)

	if not slot0.rem_box and slot0.open_button then
		slot0.rem_box = createRichLabel(16, 70, cc.p(0, 0), cc.p(0, 0), 0, 0, 400)

		slot0.open_button:getParent():addChild(slot0.rem_box)

		slot21 = ccui.Layout:create()

		slot21:setAnchorPoint(0, 0)
		showLayoutRect(slot21)
		slot0.rem_box:addChild(slot21, -1)

		slot0.rem_box_back = slot21

		slot21:setTouchEnabled(true)
		slot21:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.moved then
				uv0.rem_box:setPosition(slot0:getTouchMovePosition())
			end
		end)
	end

	if slot0.rem_box then
		slot0.rem_box:setString(string.format([[
<div>内存管理监控 ver1.0.0
%s
%s
%s
%s
%s
%s</div>]], slot15, slot16, slot17, slot18, slot19, slot20))
		slot0.rem_box_back:setContentSize(slot0.rem_box:getContentSize())
	end
end

function GmCmd.autoTask(slot0)
end

function GmCmd.time2Color(slot0, slot1, slot2)
	if slot1 then
		if slot1 < 10 then
			return Config.ColorData.data_color3[1]
		elseif slot1 < 50 then
			return Config.ColorData.data_color3[1]
		else
			return Config.ColorData.data_color3[1]
		end
	elseif slot2 == 1 then
		return Config.ColorData.data_color3[5]
	else
		return Config.ColorData.data_color3[1]
	end
end

function GmCmd.changeGm(slot0, slot1)
	if slot0.edit_list_index + slot1 > #slot0.edit_list then
		slot2 = 1
	elseif slot2 < 1 then
		slot2 = #slot0.edit_list
	end

	slot0.edit_list_index = slot2

	if slot0.edit_list[slot2] then
		slot0.gm_editbox:setText(slot0.edit_list[slot2].msg)
	end
end

function GmCmd.gm_callback(slot0, slot1)
	slot2 = {
		msg = slot3
	}
	slot3 = slot1:getText()

	if slot3 ~= "" then
		if slot0.edit_max < #slot0.edit_list then
			table.remove(slot0.edit_list, 1)
		end

		keydelete("msg", slot3, slot0.edit_list)
		table.insert(slot0.edit_list, {
			msg = slot3
		})
		SysEnv:getInstance():set(SysEnv.keys.gm_eidt_list, slot0.edit_list, true)

		slot0.edit_list_index = #slot0.edit_list

		if string.find(slot3, "TC") ~= nil then
			ViewManager:getInstance():getMainScene():addChild(DebugProtocal.create(tonumber(string.sub(slot3, 3, 6))), 999)

			return
		elseif string.find(slot3, "@") ~= nil then
			if string.sub(slot3, 2, string.len(slot3)) == "showfps" then
				CC_SHOW_FPS = not CC_SHOW_FPS

				cc.Director:getInstance():setDisplayStats(CC_SHOW_FPS)
			elseif slot4 == "cs" then
				slot6 = 6
				slot6 = MainSceneController:getInstance():getMainScene():getCurTimeType() == 1 and 18 or 6

				MainSceneController:getInstance():changeMainCityTimeType(slot6)
				HomeworldController:getInstance():changeHomeTimeType(slot6)
			else
				loadstring(slot4)()
			end

			return
		elseif string.find(slot3, "#") ~= nil then
			cc.Director:getInstance():getScheduler():setTimeScale(tonumber(string.sub(slot3, 2, string.len(slot3))))

			return
		elseif string.find(slot3, "~") ~= nil then
			GuideController:getInstance():startPlayGuide(true, tonumber(string.sub(slot3, 2, string.len(slot3))), true)

			return
		elseif string.find(slot3, "goto") ~= nil then
			slot5 = Split(string.sub(slot3, 5, string.len(slot3)), ",")

			GlobalEvent:getInstance():Fire(BigworldEvent.GotoPosByGrid, tonumber(slot5[1]), tonumber(slot5[2]))

			return
		elseif string.find(slot3, "play") ~= nil then
			slot4 = string.sub(slot3, 6)

			cc.Director:getInstance():getScheduler():setTimeScale(0.3)

			return
		elseif string.find(slot3, "/") ~= nil then
			slot4 = string.sub(slot3, 2, string.len(slot3))
			slot5 = string.gsub(slot4, "/", ".")
			package.loaded[slot4] = nil
			package.loaded[slot5] = nil

			require(slot4)
			Debug.info("重载文件", slot4, slot5)

			return
		end

		if SpineTypeByFristLetter[string.sub(slot3, 1, 1)] ~= nil and type(tonumber(string.sub(slot3, 2, 6))) == "number" then
			slot8 = slot7 == "role" and PlayerAction.DefaultStand or nil

			if string.len(string.sub(slot3, 8)) < 3 then
				slot6 = nil
			else
				slot8 = slot8 and (slot6 ~= "stand2" or PlayerAction.DefaultStand) and slot6
			end

			if slot7 == "hero" and slot6 ~= PlayerAction.DefaultStand and slot6 ~= "hurt" and slot6 ~= "die" then
				slot8 = "other"
			end

			slot9, slot10 = PathTool.getSpineByName(string.sub(slot3, 1, 6), slot8)

			if isFileExist(slot9) then
				slot11 = ccui.Widget:create()

				slot11:setContentSize(cc.size(100, 100))
				slot11:setAnchorPoint(cc.p(0.5, 0.5))
				slot11:setPosition(display.width / 2, display.height / 2)

				slot12 = createSpineByName(slot3, slot8)

				slot12:setAnchorPoint(cc.p(0.5, 0.5))
				slot12:setPosition(50, 50)
				slot11:addChild(slot12)

				slot11.spine = slot12
				slot13, slot14 = nil

				if slot4 == "E" then
					slot12:setAnimation(0, PlayerAction.action, true)

					slot13 = -200
					slot14 = 1
				else
					slot12:setAnimation(0, slot6 or PlayerAction.DefaultStand, true)

					slot13 = -50
					slot14 = 0
				end

				slot11.val = {
					0,
					0
				}

				DebugValue:addSlider(slot11, 50, slot13, {
					set_fun = function (slot0)
						if slot0[1] == 2.5 then
							uv0.val[2] = uv0.val[2] + 1
						else
							uv0.val[2] = 0
						end

						uv0.spine:setScale(slot0[1])
					end
				}, 1, {
					0.5,
					2.5,
					1
				})
				ViewManager:getInstance():getMainScene():addChild(slot11, 999)

				return
			end
		end

		slot8, slot9 = pcall(function ()
			return loadstring("return {" .. uv0 .. "}")()
		end)

		if slot8 and type(slot9) == "table" and type(slot9[1]) == "number" then
			slot0.proto = slot0.proto or require("mmtZgQAwkKz4pG9sW05wVoadNxAlGKg9.net.proto_mate") or {}

			if slot0.proto.send[slot9[1]] then
				BaseController:SendProtocal(slot9[1], function (slot0, slot1)
					for slot6, slot7 in pairs(slot0) do
						if slot7.type == "array" then
							-- Nothing
						elseif slot7.type == "string" or slot7.type == "byte" then
							slot2[slot7.name] = slot1[slot7.name] or slot1[slot6] or ""
						else
							slot2[slot7.name] = slot1[slot7.name] or slot1[slot6] or 0
						end
					end

					return {
						[slot7.name] = f(slot7.fields, slot1[slot7.name] or slot1[slot6] or {})
					}
				end(slot10, slot9[2] or {}))

				return
			end
		end

		print("gm===send", slot2.msg)
		BaseController:SendProtocal(10399, slot2)
	end
end

function GmCmd.f1(slot0)
	slot1 = ViewManager:getInstance():getLayerByTag(ViewMgrTag.UI_TAG)

	slot1:setVisible(not slot1:isVisible())
end

function GmCmd.f2(slot0)
end

function GmCmd.f3(slot0)
end

function GmCmd.f4(slot0)
	if not slot0.gm_print then
		__global_print = __global_print or {}
		slot0.gm_print = deepCopy(print)

		function print(...)
			if #__global_print > 50 then
				table.remove(__global_print, #__global_print)
			end

			table.insert(__global_print, 1, {
				...
			})
			uv0.gm_print(...)
		end
	end

	function slot1()
		slot0 = ""
		slot4 = 30

		for slot4 = 1, math.min(slot4, #__global_print) do
			for slot9, slot10 in pairs(__global_print[slot4]) do
				slot5 = "" .. tostring(slot10) .. "    "
			end

			slot0 = slot0 .. slot5 .. "\n"
		end

		ErrorMessage.show(slot0, "最近30条输出，每秒刷新")
	end

	ErrorMessage:getInstance():setCloseCallBack(function ()
		GlobalTimeTicket:getInstance():remove("show_msg")
	end)
	slot1()
	GlobalTimeTicket:getInstance():add(slot1, 1, 0, "show_msg")
end

function GmCmd.f5(slot0)
end

function GmCmd.sendCmd(slot0, slot1)
end

function GmCmd.f7(slot0)
end

function GmCmd.hot_fix(slot0)
	for slot4, slot5 in pairs(package.loaded) do
		if string.find(slot4, "ePoCrKQkWA3vpiOwu2oNfOh02MOeNheW") ~= nil or string.find(slot4, "0zWHhlnBORyiROK6lvI6VBn6vAbJRQqS") ~= nil or string.find(slot4, "UUn2rw1Xe79sI0UaGlea5iQRvaDeuUng") ~= nil then
			package.loaded[slot4] = nil

			require(slot4)
		end
	end

	message("热更游戏完成")
end

function GmCmd.debug_open(slot0, slot1, slot2)
end

function GmCmd.lj(slot0)
	if slot0.filter_list == nil then
		slot0.filter_list = filterTest()
	else
		for slot4, slot5 in pairs(slot0.filter_list) do
			slot5:removeFromParent()
		end

		slot0.filter_list = nil
	end
end

function GmCmd.net_ping(slot0)
	if slot0.ping_label == nil then
		slot0.ping_label = cc.Label:createWithTTF("100", DEFAULT_FONT, 16)

		slot0.ping_label:setTextColor(cc.c4b(255, 0, 0, 255))
		slot0.ping_label:setAnchorPoint(1, 0)
		slot0.ping_label:setPosition(600, 20)
		ProtoMgr:RegisterCmdCallback(1198, "handle1198", slot0)
		slot0.open_button:addChild(slot0.ping_label, 100000)
	end

	if slot0.ping_timer_id then
		GlobalTimeTicket:getInstance():remove(slot0.ping_timer_id)

		slot0.ping_timer_id = nil

		slot0.ping_label:setVisible(false)
	else
		slot0.ping_label:setVisible(true)

		slot0.ping_timer_id = GlobalTimeTicket:getInstance():add(function ()
			Send(1198, {
				time = uv0.get_ping_time()
			})
		end, 1)
	end
end

function GmCmd.get_ping_time(slot0)
	return math.ceil(os.clock() * 1000) + 1000000000
end

function GmCmd.handle1198(slot0, slot1)
	slot0.ping_label:setString(string.format("ms:%s,msg_len:%s", slot0.get_ping_time() - slot1.time, List.Size(GameNet:getInstance().msg_list)))
end

function GmCmd.clearVerFile(slot0)
	restart(function ()
		__clear_ver_file = true
	end)
end

function GmCmd.addButton(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)
	slot9 = ccui.Button:create()

	slot9:loadTextures(PathTool.getResFrame("common", "common_1017"), "", "", LOADTEXT_TYPE_PLIST)
	slot9:setTitleText(slot2)
	slot9:setTitleFontSize(18)
	slot9:setScale9Enabled(true)
	slot9:setTitleFontName(DEFAULT_FONT)
	slot9:setTitleColor(slot8 or Config.ColorData.data_color3[1])
	slot9:setPosition(slot3, slot4)
	slot9:addTouchEventListener(function (slot0, slot1)
		uv0(slot0, slot1)
	end)
	slot1:addChild(slot9, slot6 or 0)

	return slot9
end

function GmCmd.log(slot0, slot1)
	slot0.gm_editbox:setText("@" .. SaveLocalData:writeLuaTable(slot1))
end

function GmCmd.closeMe(slot0)
	slot0.open_button:setVisible(not slot0.open_button:isVisible())
end

function GmCmd.initTouch(slot0)
	slot1 = ViewManager:getInstance():getLayerByTag(ViewMgrTag.DEBUG_TAG)

	slot1:setContentSize(display.width + 4, display.height + 4)
	slot1:setAnchorPoint(0.5, 0.5)
	slot1:setPosition(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2)
	slot1:setTouchEnabled(true)
	slot1:setSwallowTouches(false)
	delayRun(slot1, LOW_PERFORMANCE_TIMEOUT, function ()
		uv0:setLowPerformance(true, uv1)
	end)
	slot1:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0:showTouchEffect(uv1, slot0:convertToNodeSpace(slot0:getTouchEndPosition()))
			uv0:setLowPerformance(false, uv1)

			if uv1 and not tolua.isnull(uv1) then
				uv1:stopAllActions()
				delayRun(uv1, LOW_PERFORMANCE_TIMEOUT, function ()
					uv0:setLowPerformance(true, uv1)
				end)
			end
		end
	end)
end

function GmCmd.setLowPerformance(slot0, slot1, slot2)
	if slot1 == slot0.last_status then
		return
	end

	slot0.last_status = slot1
	slot3 = display.DEFAULT_FPS

	if slot1 then
		slot3 = display.DEFAULT_FPS / 2

		showLayoutRect(slot2, 160)
		AudioManager:getInstance():pauseMusic()
		display.removeUnusedTextures()
		collectgarbage("collect")
	else
		slot3 = display.DEFAULT_FPS

		showLayoutRect(slot2, 0)
		AudioManager:getInstance():resumeMusic()
	end
end

function GmCmd.clearTouchEffect(slot0)
	if not tolua.isnull(slot0.touch_effect) then
		slot0.touch_effect:setVisible(false)
		slot0.touch_effect:clearTracks()
		slot0.touch_effect:runAction(cc.RemoveSelf:create(true))

		slot0.touch_effect = nil
	end
end

function GmCmd.showTouchEffect(slot0, slot1, slot2)
	slot0:clearTouchEffect()

	if Config.EffectData.data_effect_info[197] and slot4 ~= "" then
		slot0.touch_effect = createEffectSpine(slot4, slot2, cc.p(0.5, 0.5), false, PlayerAction.action, function (slot0)
			uv0:clearTouchEffect()
		end)

		if not tolua.isnull(slot1) then
			slot1:addChild(slot0.touch_effect)
		end
	end
end

function GmCmd.showConfigPanel(slot0)
	if not slot0.adjustConfigPanel then
		slot0.adjustConfigPanel = GmAdjustConfigPanel.New()
	end

	if slot0.adjustConfigPanel:isOpen() == false then
		slot0.adjustConfigPanel:open()
	end
end

function GmCmd.openCustomWindow(slot0)
	MainuiController:getInstance():openCustomHeadImgWin(true)
end

function GmCmd.takePhot(slot0)
end

function GmCmd.uploadPhoto(slot0, slot1)
end
