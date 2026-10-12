DebugUIVar = DebugUIVar or BaseClass()

function DebugUIVar.__init(slot0)
	DebugUIVar.Instance = slot0

	slot0:initUI()
	slot0:registerEvents()

	slot0.vars = {}
	slot0.delList = {}

	slot0:updateInfo()
end

function DebugUIVar.getInstance(slot0)
	if DebugUIVar.Instance == nil then
		DebugUIVar.New()
	end

	return DebugUIVar.Instance
end

function DebugUIVar.initUI(slot0)
	slot0.root = ccui.Layout:create()

	ViewManager:addToLayerByTag(slot0.root, ViewMgrTag.DEBUG_TAG, 100)
	slot0.root:setContentSize(cc.size(SCREEN_WIDTH + 200, SCREEN_HEIGHT + 200))

	slot1 = cc.size(700, 460)
	slot0.container = ccui.Layout:create()

	slot0.root:addChild(slot0.container, 20)
	slot0.container:setBackGroundColor(cc.c3b(255, 255, 255))
	slot0.container:setBackGroundColorOpacity(255)
	slot0.container:setBackGroundColorType(1)
	slot0.container:setContentSize(slot1)
	slot0.container:setAnchorPoint(0.5, 0.5)
	slot0.container:setPosition(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2)

	slot0.close_btn = CustomButton.New(slot0.container, PathTool.getResFrame("common", "common_1028"), nil, nil, LOADTEXT_TYPE_PLIST)

	slot0.close_btn:setAnchorPoint(cc.p(1, 1))
	slot0.close_btn:setPosition(slot1.width - 2, slot1.height + 10)

	slot2 = slot1.height - 20
	slot3 = 10
	slot0.label_var = createWithSystemFont("", DEFAULT_FONT, 16)

	slot0.label_var:setAnchorPoint(0, 0)
	slot0.label_var:setPosition(slot3, slot2)
	slot0.container:addChild(slot0.label_var)
	slot0.label_var:setTextColor(cc.c4b(0, 0, 0, 255))

	slot2 = slot2 - 25
	slot0.label_info = createWithSystemFont("", DEFAULT_FONT, 16)

	slot0.label_info:setAnchorPoint(0, 0)
	slot0.label_info:setPosition(slot3, slot2)
	slot0.container:addChild(slot0.label_info)
	slot0.label_info:setTextColor(cc.c4b(0, 0, 0, 255))

	slot0.root_btn = ccui.Button:create()

	slot0.container:addChild(slot0.root_btn)
	slot0.root_btn:setTitleColor(cc.c3b(0, 0, 0))
	slot0.root_btn:setContentSize(cc.size(30, 25))
	slot0.root_btn:setAnchorPoint(0, 0)
	slot0.root_btn:setPosition(slot1.width - 35, slot2)
	slot0.root_btn:setTitleText("root")

	slot0.parent_btn = ccui.Button:create()

	slot0.container:addChild(slot0.parent_btn)
	slot0.parent_btn:setTitleColor(cc.c3b(0, 0, 0))
	slot0.parent_btn:setContentSize(cc.size(30, 25))
	slot0.parent_btn:setAnchorPoint(0, 0)
	slot0.parent_btn:setPosition(slot1.width - 70, slot2)
	slot0.parent_btn:setTitleText("父层")

	slot0.back_btn = ccui.Button:create()

	slot0.container:addChild(slot0.back_btn)
	slot0.back_btn:setTitleColor(cc.c3b(0, 0, 0))
	slot0.back_btn:setContentSize(cc.size(30, 25))
	slot0.back_btn:setAnchorPoint(0, 0)
	slot0.back_btn:setPosition(slot1.width - 105, slot2)
	slot0.back_btn:setTitleText("返回")

	slot0.finder = createEditBox(slot0.container, PathTool.getResFrame("common", "common_1048"), cc.size(250, 25), Config.ColorData.data_color3[5], 26, Config.ColorData.data_color3[1], 26, "name", cc.p(330, slot2), 18, LOADTEXT_TYPE_PLIST)

	slot0.finder:setAnchorPoint(0, 0)
	slot0.finder:setText("")

	slot0.var_layer = ccui.ScrollView:create()

	slot0.container:addChild(slot0.var_layer)
	slot0.var_layer:setContentSize(cc.size(slot1.width - 20, slot2 - 12))
	slot0.var_layer:setInnerContainerSize(slot0.var_layer:getContentSize())
	slot0.var_layer:setAnchorPoint(0, 0)
	slot0.var_layer:setPosition(3, 10)
	slot0.var_layer:setSwallowTouches(true)
	slot0.var_layer:setBounceEnabled(true)
	slot0.var_layer:setClippingEnabled(true)
	slot0.var_layer:setScrollBarEnabled(false)
end

function DebugUIVar.updateInfo(slot0)
	slot0.list = slot0:getTableVar()

	slot0.label_var:setString(table.concat(slot0.vars, "."))

	slot0.keys = {}
	slot1 = 0
	slot2 = 0
	slot3 = 0
	slot5 = 0

	if string.find(slot0.finder:getText() or "", "@") then
		slot4 = string.sub(slot4, 2, string.len(slot4))
		slot5 = 1
	elseif string.find(slot4, "/") then
		slot4 = string.sub(slot4, 2, string.len(slot4))
		slot5 = 2
	elseif string.find(slot4, "#") then
		slot4 = string.sub(slot4, 2, string.len(slot4))
		slot5 = 3
	end

	for slot9, slot10 in pairs(slot0.list) do
		if slot5 == 0 and string.find(tostring(slot9), slot4) or slot5 == 1 and string.find(type(slot10), slot4) or slot5 == 2 and string.find(tostring(slot9), slot4) == 1 or slot5 == 3 and type(slot10) == "table" and slot10[slot4] then
			table.insert(slot0.keys, slot9)

			slot1 = slot1 + 1

			if type(slot10) == "function" then
				slot2 = slot2 + 1
			elseif type(slot10) == "table" then
				slot3 = slot3 + 1
			end
		end
	end

	slot0.label_info:setString(string.format("变量数量:%d function:%d table:%d", slot1, slot2, slot3))

	slot0.h = 35

	slot0:deleteObj(slot0.itemContainer)

	slot0.y = math.max(slot0.h * slot1, slot0.var_layer:getContentSize().height)
	slot0.w = slot0.var_layer:getContentSize().width

	slot0.var_layer:setInnerContainerSize(cc.size(slot0.w, slot0.y))

	slot0.itemContainer = ccui.Layout:create()

	slot0.var_layer:addChild(slot0.itemContainer)
	slot0:createItems()
end

function DebugUIVar.deleteObj(slot0, slot1)
	if not slot1 then
		return
	end

	slot1:setVisible(false)
	table.insert(slot0.delList, slot1)

	if not slot0.deling then
		slot0.deling = true

		slot0:doDel()
	end
end

function DebugUIVar.doDel(slot0)
	if not next(slot0.delList) then
		slot0.deling = nil

		return
	end

	if slot0.delList[1]:getChildrenCount() < 10 then
		doRemoveFromParent(slot1)
		table.remove(slot0.delList, 1)
		print("=====================", #slot0.delList)
	else
		for slot6 = 1, 10 do
			doRemoveFromParent(slot1:getChildren()[slot6])
		end
	end

	delayRun(slot0.container, 0.02, function ()
		uv0:doDel()
	end)
end

function DebugUIVar.createItems(slot0)
	if not next(slot0.keys) then
		return
	end

	for slot5 = 1, math.min(5, #slot0.keys) do
		slot0.y = slot0.y - slot0.h
		slot7 = slot0:createItem(slot0.list, table.remove(slot0.keys, 1), slot0.w)

		slot0.itemContainer:addChild(slot7)
		slot7:setPositionY(slot0.y)
	end

	delayRun(slot0.itemContainer, 0.015, function ()
		uv0:createItems()
	end)
end

function DebugUIVar.createItem(slot0, slot1, slot2, slot3)
	if slot0.label_var:getString() == "package.loaded" then
		slot4 = require(slot2) or slot1[slot2]
	end

	slot8 = 24
	slot9 = createWithSystemFont("", DEFAULT_FONT, 16)

	slot9:setAnchorPoint(1, 0)
	slot9:setPositionX(210 - 10)
	slot9:setTextColor(cc.c4b(0, 0, 0, 255))
	ccui.Layout:create():addChild(slot9)
	slot9:setString(tostring(slot2))

	if type(slot4) == "function" or slot6 == "userdata" or slot6 == "thread" or slot6 == "table" and not slot0:checkVarLen(slot4, 10) then
		slot10 = createWithSystemFont("", DEFAULT_FONT, 16)

		slot10:setAnchorPoint(0, 0)
		slot10:setPositionX(slot7)
		slot10:setTextColor(cc.c4b(0, 0, 0, 255))
		slot5:addChild(slot10)

		if slot6 == "userdata" and tolua.type(slot4) then
			slot10:setString(tostring(slot4) .. ":" .. tolua.type(slot4))
		else
			slot10:setString(tostring(slot4))
		end
	else
		createEditBox(slot5, PathTool.getResFrame("common", "common_1048"), cc.size(250, 35), Config.ColorData.data_color3[5], 14, Config.ColorData.data_color3[1], 14, "name", cc.p(slot7, 0), 18, LOADTEXT_TYPE_PLIST):setAnchorPoint(0, 0)

		if slot6 == "table" then
			slot10:setText(slot0:luaTable2Str(slot4))
		else
			slot10:setText(tostring(slot4))
		end

		slot10:registerScriptEditBoxHandler(function (slot0, slot1)
			if slot0 == "return" then
				if uv0 == "number" then
					uv1[uv2] = tonumber(slot1:getText())
				elseif uv0 == "table" then
					uv1[uv2] = loadstring("return " .. slot1:getText())()
				else
					uv1[uv2] = slot1:getText()
				end
			end
		end)
	end

	slot11 = ccui.Button:create()

	if slot0.label_var:getString() == "package.loaded" then
		slot11:setTitleColor(cc.c3b(0, 0, 0))
		slot11:setContentSize(cc.size(30, 35))
		slot11:setAnchorPoint(1, 0)
		slot11:setPosition(slot3 - 5, 0)
		slot11:setTitleText("重载")
		slot5:addChild(slot11)
		handleTouchEnded(slot11, function ()
			package.loaded[uv0] = nil

			require(uv0)
		end)
	else
		slot11:setTitleColor(cc.c3b(0, 0, 0))
		slot11:setContentSize(cc.size(30, 35))
		slot11:setAnchorPoint(1, 0)
		slot11:setPosition(slot10, 0)
		slot11:setTitleText("删除")
		slot5:addChild(slot11)
		handleTouchEnded(slot11, function ()
			uv0[uv1] = nil

			uv2:updateInfo()
		end)
	end

	if slot6 == "table" then
		slot11 = ccui.Button:create()

		slot11:setTitleColor(cc.c3b(0, 0, 0))
		slot11:setContentSize(cc.size(30, 35))
		slot11:setAnchorPoint(1, 0)
		slot11:setPosition(slot10 - 60, 0)
		slot11:setTitleText("打开")
		slot5:addChild(slot11)
		handleTouchEnded(slot11, function ()
			table.insert(uv0.vars, uv1)

			uv0.back_var = nil

			uv0.finder:setText("")
			uv0:updateInfo()
		end)
	elseif slot6 == "userdata" and slot4.getBoundingBox then
		slot11 = ccui.Button:create()

		slot11:setTitleColor(cc.c3b(0, 0, 0))
		slot11:setContentSize(cc.size(30, 35))
		slot11:setAnchorPoint(1, 0)
		slot11:setPosition(slot10 - 60, 0)
		slot11:setTitleText("调试")
		slot5:addChild(slot11)
		handleTouchEnded(slot11, function ()
			require("common/debug_ui_helper")
			DebugUIHelper:getInstance(uv0):open()
		end)
	end

	return slot5
end

function DebugUIVar.luaTable2Str(slot0, slot1, slot2)
	slot2 = slot2 or 0
	slot3 = "{"

	for slot7, slot8 in pairs(slot1) do
		if type(slot7) == "string" then
			slot7 = string.format("%q", slot7)
		end

		formatting = "" .. "[" .. slot7 .. "]" .. " = "
		slot3 = type(slot8) == "table" and slot3 .. formatting .. slot0:luaTable2Str(slot8, slot2 + 1) .. slot10 .. "," or slot3 .. formatting .. slot0:luaTable2Str(slot8, slot2 + 1) .. slot10 .. "," .. formatting .. ((slot9 ~= "string" or string.format("%q", slot8)) and tostring(slot8)) .. ","
	end

	return slot3 .. "}"
end

function DebugUIVar.getTableVar(slot0)
	slot1 = slot0.vo or _G
	slot2 = nil

	for slot6, slot7 in ipairs(slot0.vars) do
		if slot1[slot7] then
			if slot1[slot7].Instance and (slot1.__init or slot1.ctor or slot1.registerEvents or slot1.RegisterProtocal) then
				slot1 = slot1:getInstance()
			elseif slot1.New then
				slot1 = getSuperClass(slot1)
			end

			slot2 = slot7
		else
			slot0.vars[slot6] = nil
		end
	end

	return slot1
end

function DebugUIVar.checkVarLen(slot0, slot1, slot2)
	for slot6, slot7 in pairs(slot1) do
		slot2 = slot2 - 1

		if type(slot7) == "function" then
			return false
		elseif slot2 < 0 then
			return false
		elseif type(slot7) == "table" and not slot0:checkVarLen(slot7, slot2) then
			return false
		end
	end

	return slot2
end

function DebugUIVar.registerEvents(slot0)
	handleTouchEnded(slot0.close_btn, function ()
		uv0:close()
	end)
	handleTouchEnded(slot0.root_btn, function ()
		if #uv0.vars == 0 then
			return
		end

		uv0.back_var = uv0.vars[1]
		uv0.vars = {}

		uv0.finder:setText("")
		uv0:updateInfo()
	end)
	handleTouchEnded(slot0.parent_btn, function ()
		if #uv0.vars == 0 then
			return
		end

		uv0.back_var = table.remove(uv0.vars)

		uv0.finder:setText("")
		uv0:updateInfo()
	end)
	handleTouchEnded(slot0.back_btn, function ()
		if #uv0.vars == 0 and not uv0.back_var then
			return
		end

		if uv0.back_var then
			table.insert(uv0.vars, uv0.back_var)

			uv0.back_var = nil
		else
			uv0.back_var = table.remove(uv0.vars)
		end

		uv0.finder:setText("")
		uv0:updateInfo()
	end)
	slot0.container:setTouchEnabled(true)
	slot0.container:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.moved then
			slot0:setPosition(slot0:getParent():convertToNodeSpaceAR(slot0:getTouchMovePosition()))
		end
	end)
	slot0.finder:registerScriptEditBoxHandler(function (slot0, slot1)
		if slot0 == "return" then
			uv0:updateInfo()
		end
	end)
end

function DebugUIVar.downUpLoad(slot0, slot1)
	slot2 = cc.XMLHttpRequest:new()
	slot2.responseType = cc.XMLHTTPREQUEST_RESPONSE_JSON
	slot4 = ""

	slot2:open("POST", "")
	slot2:registerScriptHandler(function ()
		if uv0.readyState == 4 and uv0.status >= 200 and uv0.status < 207 then
			print("Http Status Code:" .. uv0.statusText)

			slot0 = unicode2utf8(uv0.response)
		else
			print("下载文件失败", uv1)
		end
	end)
	slot2:send()
end

function DebugUIVar.open(slot0, slot1)
	slot0.root:setVisible(true)

	if slot0.vo ~= slot1 then
		slot0.vars = {}
		slot0.vo = slot1

		slot0:updateInfo()
	end
end

function DebugUIVar.close(slot0)
	slot0.root:setVisible(false)
end
