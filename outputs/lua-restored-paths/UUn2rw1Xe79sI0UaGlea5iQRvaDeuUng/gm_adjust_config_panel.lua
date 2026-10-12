slot0 = table.insert
slot1 = table.sort
GmAdjustConfigPanel = GmAdjustConfigPanel or BaseClass(CommonUI)

function GmAdjustConfigPanel.__init(slot0, slot1)
	if PathTool.isFileExist("config_gm.lua") then
		require("config_gm")
	end

	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG

	slot0:createRootWnd()

	slot0.config_btn_list = {}
	slot0.sub_btn_list = {}
	slot0.input_item_list = {}
	slot0.is_open = true
end

function GmAdjustConfigPanel.createRootWnd(slot0)
	slot0.root_wnd = ccui.Layout:create()

	slot0.root_wnd:setTouchEnabled(true)
	slot0.root_wnd:setContentSize(cc.size(SCREEN_WIDTH, SCREEN_HEIGHT))
	slot0.root_wnd:setAnchorPoint(0, 0)

	slot0.mask_bg = ccui.Layout:create()

	slot0.mask_bg:setContentSize(cc.size(SCREEN_WIDTH, SCREEN_HEIGHT))
	slot0.mask_bg:setAnchorPoint(0, 0)
	slot0.mask_bg:setBackGroundColor(cc.c3b(80, 80, 80))
	slot0.mask_bg:setBackGroundColorOpacity(250)
	slot0.mask_bg:setBackGroundColorType(1)
	slot0.root_wnd:addChild(slot0.mask_bg)

	slot0.container = ccui.Layout:create()

	slot0.container:setContentSize(cc.size(SCREEN_WIDTH, SCREEN_HEIGHT))
	slot0.container:setAnchorPoint(0, 0)
	slot0.root_wnd:addChild(slot0.container)
	ViewManager:getInstance():getLayerByTag(slot0.view_tag):addChild(slot0.root_wnd)

	slot0.close_btn = CustomButton.New(slot0.container, PathTool.getResFrame("common", "common_1028"), nil, nil, LOADTEXT_TYPE_PLIST)

	slot0.close_btn:setPosition(cc.p(680, 1200))
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0:hide()
		end
	end)

	slot0.tips_txt = createRichLabel(22, cc.c4b(46, 139, 87, 255), cc.p(0, 1), cc.p(10, 1250), 5, nil, 640)

	slot0.tips_txt:setString([[
修改配置GM指北:
1、左侧为配置列表，选择想要修改的配置表名称后，右侧将列出该配置表中每个分页的内容。
2、选择右侧配置名称进入修改界面。
3、输入想要修改的键值后点击搜索按钮，将列出该键值对应的配置，点击输入框即可进行修改。]])
	slot0.container:addChild(slot0.tips_txt)

	slot0.cfg_btn_scroll_view = CommonScrollViewSingleLayout.new(slot0.container, cc.p(30, 100), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(300, 880), {
		start_y = 0,
		item_height = 30,
		start_x = 0,
		space_y = 5,
		col = 1,
		space_x = 0,
		row = 0,
		item_width = 300
	}, cc.p(0, 0))

	slot0.cfg_btn_scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.cfg_btn_scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.cfg_btn_scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	slot0.cfg_btn_scroll_view:setSwallowTouches(false)

	slot0.sub_btn_scroll_view = CommonScrollViewSingleLayout.new(slot0.container, cc.p(350, 100), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(400, 880), {
		start_y = 0,
		item_height = 30,
		start_x = 0,
		space_y = 5,
		col = 1,
		space_x = 0,
		row = 0,
		item_width = 400
	}, cc.p(0, 0))

	slot0.sub_btn_scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell_2), ScrollViewFuncType.CreateNewCell)
	slot0.sub_btn_scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells_2), ScrollViewFuncType.NumberOfCells)
	slot0.sub_btn_scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex_2), ScrollViewFuncType.UpdateCellByIndex)
	slot0.sub_btn_scroll_view:setSwallowTouches(false)
	slot0:showConfigList()
end

function GmAdjustConfigPanel.createNewCell(slot0)
	slot1 = configButton.new()

	slot1:addCallBack(handler(slot0, slot0.onClickCfgKey))

	return slot1
end

function GmAdjustConfigPanel.numberOfCells(slot0)
	if not slot0.config_btn_list then
		return 0
	end

	return #slot0.config_btn_list
end

function GmAdjustConfigPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.config_btn_list[slot2] then
		return
	end

	slot1:setData(slot3)
end

function GmAdjustConfigPanel.createNewCell_2(slot0)
	slot1 = subConfigButton.new()

	slot1:addCallBack(handler(slot0, slot0.onClickSubCfgKey))

	return slot1
end

function GmAdjustConfigPanel.numberOfCells_2(slot0)
	if not slot0.sub_btn_list then
		return 0
	end

	return #slot0.sub_btn_list
end

function GmAdjustConfigPanel.updateCellByIndex_2(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.sub_btn_list[slot2] then
		return
	end

	slot1:setData(slot3)
end

function GmAdjustConfigPanel.open(slot0)
	slot0.root_wnd:setVisible(true)
	slot0.root_wnd:setPosition(cc.p(0, 0))

	slot0.is_open = true
end

function GmAdjustConfigPanel.hide(slot0)
	slot0.root_wnd:setVisible(false)
	slot0.root_wnd:setPosition(cc.p(-1000, 0))

	slot0.is_open = false
end

function GmAdjustConfigPanel.isOpen(slot0)
	return slot0.is_open
end

function GmAdjustConfigPanel.showConfigList(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(Config) do
		if not Config_Gm_Show or Config_Gm_Show[slot5] then
			uv0(slot1, {
				key = slot5
			})
		end
	end

	uv1(slot1, function (slot0, slot1)
		return string.sub(slot0.key, 1, 1) < string.sub(slot1.key, 1, 1)
	end)

	slot0.config_btn_list = slot1

	slot0.cfg_btn_scroll_view:reloadData()
end

function GmAdjustConfigPanel.onClickCfgKey(slot0, slot1, slot2)
	if slot0.cur_node then
		slot0.cur_node:setIsSelect(false)
	end

	slot2:setIsSelect(true)

	slot0.cur_node = slot2

	slot0:showSubConfigListByKey(slot1)
end

function GmAdjustConfigPanel.showSubConfigListByKey(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.cur_config = Config[slot1] or {}
	slot2 = {}

	for slot6, slot7 in pairs(slot0.cur_config) do
		if type(slot7) == "table" or type(slot7) == "function" then
			uv0(slot2, {
				key = slot6,
				f_key = slot1
			})
		end
	end

	uv1(slot2, function (slot0, slot1)
		return string.sub(slot0.key, 6, 6) < string.sub(slot1.key, 6, 6)
	end)

	slot0.sub_btn_list = slot2

	slot0.sub_btn_scroll_view:reloadData()
end

function GmAdjustConfigPanel.onClickSubCfgKey(slot0, slot1)
	if not slot1 or not slot0.cur_config then
		return
	end

	if slot0.cur_config[slot1] then
		slot0:showChangeLayer(true, slot2, slot1)
	end
end

function GmAdjustConfigPanel.showChangeLayer(slot0, slot1, slot2, slot3)
	if slot1 == true then
		slot0.cur_cfg_data = slot2 or {}

		if not slot0.change_layer then
			slot0.change_layer = ccui.Layout:create()

			slot0.change_layer:setTouchEnabled(true)
			slot0.change_layer:setContentSize(cc.size(SCREEN_WIDTH, SCREEN_HEIGHT))
			slot0.change_layer:setAnchorPoint(0, 0)
			slot0.change_layer:setBackGroundColor(cc.c3b(238, 238, 209))
			slot0.change_layer:setBackGroundColorType(1)
			slot0.container:addChild(slot0.change_layer)

			slot0.close_layer_btn = CustomButton.New(slot0.change_layer, PathTool.getResFrame("common", "common_1050"), nil, nil, LOADTEXT_TYPE_PLIST)

			slot0.close_layer_btn:setPosition(cc.p(360, 100))
			slot0.close_layer_btn:setBtnLabel(TI18N("关闭"))
			slot0.close_layer_btn:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended then
					uv0:showChangeLayer(false)
				end
			end)

			slot4 = createLabel(24, 2, nil, 180, 1100, TI18N("键值:"), slot0.change_layer, nil, cc.p(0.5, 0.5))
			slot0.key_input = ccui.EditBox:create(cc.size(220, 60), PathTool.getResFrame("common", "common_1021"), LOADTEXT_TYPE_PLIST)

			slot0.key_input:setInputMode(cc.EDITBOX_INPUT_MODE_SINGLELINE)
			slot0.key_input:setInputFlag(cc.EDITBOX_INPUT_FLAG_INITIAL_CAPS_WORD)
			slot0.key_input:setReturnType(cc.KEYBOARD_RETURNTYPE_DEFAULT)
			slot0.key_input:setAnchorPoint(0.5, 0.5)
			slot0.change_layer:addChild(slot0.key_input)
			slot0.key_input:setPosition(360, 1100)
			slot0.key_input:setFontColor(cc.c3b(0, 0, 0))
			slot0.key_input:setFontSize(28)

			slot0.search_btn = CustomButton.New(slot0.change_layer, PathTool.getResFrame("common", "common_1093"), nil, nil, LOADTEXT_TYPE_PLIST)

			slot0.search_btn:setPosition(cc.p(520, 1100))
			slot0.search_btn:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended and uv0.key_input:getText() and slot2 ~= "" then
					uv0:showChangeCfgListByKey(slot2, uv1)
				end
			end)

			slot0.search_tips = createLabel(16, 2, nil, 360, 1050, "", slot0.change_layer, nil, cc.p(0.5, 0.5))
		end

		slot0.change_layer:setVisible(true)

		if type(slot0.cur_cfg_data) == "table" then
			slot5 = TI18N("可搜索的键值:")

			for slot9, slot10 in pairs(slot0.cur_cfg_data) do
				slot4 = 0 + 1

				if StringUtil.getStrLen(slot5) > 70 then
					slot5 = slot5 .. "..."

					break
				else
					slot5 = slot5 .. slot9 .. "、"
				end
			end

			slot0.search_tips:setString(slot5)
		else
			slot0.search_tips:setString("")
		end

		if slot0.input_item_scrollview then
			slot0.input_item_list = {}

			slot0.input_item_scrollview:reloadData()
		end

		slot0.key_input:setText("")
	elseif slot0.change_layer then
		slot0.change_layer:setVisible(false)
	end
end

function GmAdjustConfigPanel.showChangeCfgListByKey(slot0, slot1, slot2)
	if not slot1 or not slot0.cur_cfg_data then
		return
	end

	slot3 = nil

	if type(slot0.cur_cfg_data) == "table" then
		slot3 = slot0.cur_cfg_data[slot1] or slot0.cur_cfg_data[tonumber(slot1)]
	elseif type(slot0.cur_cfg_data) == "function" then
		slot3 = slot0.cur_cfg_data(slot1) or slot0.cur_cfg_data(tonumber(slot1))
	end

	if not slot3 or type(slot3) ~= "table" then
		message(TI18N("找不到相关配置数据"))

		return
	end

	slot5 = {}

	for slot9, slot10 in pairs(slot3) do
		uv0({}, {
			key = slot9,
			cfg = slot10,
			father_cfg = slot3,
			father_key = slot2
		})
	end

	if not slot0.input_item_scrollview then
		slot0.input_item_scrollview = CommonScrollViewSingleLayout.new(slot0.change_layer, cc.p(100, 140), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(520, 880), {
			start_y = 0,
			item_height = 30,
			start_x = 0,
			space_y = 5,
			col = 1,
			space_x = 0,
			row = 0,
			item_width = 200
		}, cc.p(0, 0))

		slot0.input_item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell_3), ScrollViewFuncType.CreateNewCell)
		slot0.input_item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells_3), ScrollViewFuncType.NumberOfCells)
		slot0.input_item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex_3), ScrollViewFuncType.UpdateCellByIndex)
		slot0.input_item_scrollview:setSwallowTouches(false)
	end

	slot0.input_item_list = slot4

	slot0.input_item_scrollview:reloadData()
end

function GmAdjustConfigPanel.createNewCell_3(slot0)
	return InputItem.new()
end

function GmAdjustConfigPanel.numberOfCells_3(slot0)
	if not slot0.input_item_list then
		return 0
	end

	return #slot0.input_item_list
end

function GmAdjustConfigPanel.updateCellByIndex_3(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.input_item_list[slot2] then
		return
	end

	slot1:setData(slot3)
end

function GmAdjustConfigPanel.close(slot0)
	if tolua.isnull(slot0.root_wnd) then
		return
	end

	slot0:__close()
end

function GmAdjustConfigPanel.__close(slot0)
	if slot0.cfg_btn_scroll_view then
		slot0.cfg_btn_scroll_view:DeleteMe()

		slot0.cfg_btn_scroll_view = nil
	end

	if slot0.sub_btn_scroll_view then
		slot0.sub_btn_scroll_view:DeleteMe()

		slot0.sub_btn_scroll_view = nil
	end

	if slot0.input_item_scrollview then
		slot0.input_item_scrollview:DeleteMe()

		slot0.input_item_scrollview = nil
	end

	doRemoveFromParent(slot0.root_wnd)
end

configButton = class("configButton", function ()
	return ccui.Layout:create()
end)

function configButton.ctor(slot0)
	slot0:configUI()
	slot0:registerEvent()
end

function configButton.configUI(slot0)
	slot0.size = cc.size(300, 30)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.cfg_name = createLabel(24, 1, nil, 0, slot0.size.height * 0.5, "", slot0, nil, cc.p(0, 0.5))
end

function configButton.registerEvent(slot0)
	registerButtonEventListener(slot0, function ()
		if uv0.callback then
			uv0.callback(uv0.cfg_key, uv0)
		end
	end, true)
end

function configButton.setData(slot0, slot1)
	slot0.data = slot1 or {}
	slot0.cfg_key = slot1.key or ""

	slot0.cfg_name:setString(slot0.cfg_key)
	slot0:setIsSelect(slot1.is_select)
end

function configButton.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function configButton.setIsSelect(slot0, slot1)
	slot0.data.is_select = slot1 or false

	if slot0.data.is_select == true then
		if not slot0.select_sp then
			slot0.select_sp = createSprite(PathTool.getResFrame("common", "common_1043"), slot0.size.width - 10, slot0.size.height * 0.5, slot0, cc.p(1, 0.5), LOADTEXT_TYPE_PLIST)
		end

		slot0.select_sp:setVisible(true)
	elseif slot0.select_sp then
		slot0.select_sp:setVisible(false)
	end
end

function configButton.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end

subConfigButton = class("subConfigButton", function ()
	return ccui.Layout:create()
end)

function subConfigButton.ctor(slot0)
	slot0:configUI()
	slot0:registerEvent()
end

function subConfigButton.configUI(slot0)
	slot0.size = cc.size(400, 30)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.cfg_name = createLabel(28, 274, nil, 0, slot0.size.height * 0.5, "", slot0, nil, cc.p(0, 0.5))
end

function subConfigButton.registerEvent(slot0)
	registerButtonEventListener(slot0, function ()
		if uv0.callback then
			uv0.callback(uv0.cfg_key)
		end
	end, true)
end

function subConfigButton.setData(slot0, slot1)
	slot0.cfg_key = slot1.key or ""
	slot2 = slot1.f_key
	slot3 = ""

	slot0.cfg_name:setString((not Config_Gm_Cfg_Name or not slot2 or not Config_Gm_Cfg_Name[slot2] or not Config_Gm_Cfg_Name[slot2][slot0.cfg_key] or Config_Gm_Cfg_Name[slot2][slot0.cfg_key]) and slot0.cfg_key)
end

function subConfigButton.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function subConfigButton.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end

InputItem = class("InputItem", function ()
	return ccui.Layout:create()
end)

function InputItem.ctor(slot0)
	slot0:configUI()
	slot0:registerEvent()
end

function InputItem.configUI(slot0)
	slot0.size = cc.size(200, 30)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.key_name = createLabel(24, 274, nil, 0, slot0.size.height * 0.5, "", slot0, nil, cc.p(0, 0.5))
	slot0.input_box = ccui.EditBox:create(cc.size(200, 30), PathTool.getResFrame("common", "common_1021"), LOADTEXT_TYPE_PLIST)

	slot0.input_box:setInputMode(cc.EDITBOX_INPUT_MODE_SINGLELINE)
	slot0.input_box:setInputFlag(cc.EDITBOX_INPUT_FLAG_INITIAL_CAPS_WORD)
	slot0.input_box:setReturnType(cc.KEYBOARD_RETURNTYPE_DEFAULT)
	slot0.input_box:setAnchorPoint(0, 0.5)
	slot0:addChild(slot0.input_box)
	slot0.input_box:setPosition(0, slot0.size.height * 0.5)
	slot0.input_box:setFontColor(cc.c3b(0, 0, 0))
end

function InputItem.registerEvent(slot0)
	function slot1(slot0, slot1)
		if slot0 == "began" then
			slot1._text_ = slot1:getText()

			return false
		elseif slot0 == "return" and slot1._text_ ~= slot1:getText() then
			return true
		end
	end

	slot0.input_box:registerScriptEditBoxHandler(function (slot0, slot1)
		if uv0(slot0, slot1) then
			if uv1.val_type == "number" then
				slot2 = tonumber(uv1.input_box:getText())
			elseif uv1.val_type == "table" then
				slot2 = GmStrToTable(slot2)
			end

			if uv1.data and uv1.data.father_cfg then
				uv1.data.father_cfg[uv1.data.key] = slot2

				message("修改成功")
			end
		end
	end)
end

function InputItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1
	slot2 = {}
	slot3 = slot1.father_key or ""

	if Config_Gm_Sym_Name and Config_Gm_Sym_Name[slot3] then
		slot2 = Config_Gm_Sym_Name[slot3]
	end

	slot0.key_name:setString(slot2[slot1.key] or slot1.key or "")
	slot0.input_box:setPositionX(slot0.key_name:getContentSize().width + 10)

	slot0.val_type = type(slot1.cfg)

	if type(slot1.cfg) == "table" then
		slot0.input_box:setText(GmTableToStr(slot1.cfg))
	else
		slot0.input_box:setText(slot1.cfg)
	end
end

function InputItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function InputItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end

function GmTableToStr(slot0)
	if slot0 == nil then
		return ""
	end

	slot1 = "{"
	slot2 = 1

	for slot6, slot7 in pairs(slot0) do
		slot8 = ","

		if slot2 == 1 then
			slot8 = ""
		end

		slot1 = slot6 == slot2 and slot1 .. slot8 .. GmToStringEx(slot7) or (type(slot6) == "number" or type(slot6) == "string") and slot1 .. slot8 .. GmToStringEx(slot7) .. slot8 .. "[" .. GmToStringEx(slot6) .. "]=" .. GmToStringEx(slot7) or type(slot6) == "userdata" and slot1 .. slot8 .. GmToStringEx(slot7) .. slot8 .. "[" .. GmToStringEx(slot6) .. "]=" .. GmToStringEx(slot7) .. slot8 .. "*s" .. GmTableToStr(getmetatable(slot6)) .. "*e" .. "=" .. GmToStringEx(slot7) or slot1 .. slot8 .. GmToStringEx(slot7) .. slot8 .. "[" .. GmToStringEx(slot6) .. "]=" .. GmToStringEx(slot7) .. slot8 .. "*s" .. GmTableToStr(getmetatable(slot6)) .. "*e" .. "=" .. GmToStringEx(slot7) .. slot8 .. slot6 .. "=" .. GmToStringEx(slot7)
		slot2 = slot2 + 1
	end

	return slot1 .. "}"
end

function GmStrToTable(slot0)
	if slot0 == nil or type(slot0) ~= "string" then
		return
	end

	return loadstring("return " .. slot0)()
end

function GmToStringEx(slot0)
	if type(slot0) == "table" then
		return GmTableToStr(slot0)
	elseif type(slot0) == "string" then
		return "'" .. slot0 .. "'"
	else
		return tostring(slot0)
	end
end
