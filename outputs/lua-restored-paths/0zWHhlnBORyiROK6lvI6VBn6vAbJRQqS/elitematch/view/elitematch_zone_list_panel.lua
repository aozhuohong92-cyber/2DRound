ElitematchZoneListPanel = ElitematchZoneListPanel or BaseClass(BaseView)
slot0 = ElitematchController:getInstance()
slot1 = string.format
slot2 = table.insert
slot3 = table.sort

function ElitematchZoneListPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = false
	slot0.layout_name = "elitematch/elitematch_zone_list_panel"
	slot0.res_list = {}
end

function ElitematchZoneListPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.title = slot0.main_panel:getChildByName("win_title")

	slot0.title:setString(TI18N("查看赛区"))

	slot0.tips = slot0.main_panel:getChildByName("tips")

	slot0.tips:setString(TI18N("在列表中选择需要查看的赛区"))

	slot0.scroll_container = slot0.main_container:getChildByName("scroll_container")
	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
end

function ElitematchZoneListPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 1)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickBtnClose), true, 1)
end

function ElitematchZoneListPanel.onClickBtnClose(slot0)
	uv0:openElitematchZoneListPanel(false)
end

function ElitematchZoneListPanel.openRootWnd(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	slot0.callback = slot2
	slot0.show_list = {}

	if Config.ArenaEliteData.data_zone then
		for slot7, slot8 in ipairs(slot3) do
			if slot8.id <= slot1 then
				uv0(slot0.show_list, slot8)
			end
		end
	end

	table.sort(slot0.show_list, function (slot0, slot1)
		return slot0.id < slot1.id
	end)
	slot0:updateList()
end

function ElitematchZoneListPanel.updateList(slot0, slot1)
	if slot0.item_scrollview == nil then
		slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.scroll_container, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.scroll_container:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 0,
			row = 1,
			space_x = 0,
			item_width = 600,
			item_height = 96,
			space_y = 0,
			col = 1
		}, cc.p(0, 0))

		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	if #slot0.show_list == 0 then
		slot0:showEmptyIcon(true)
	else
		slot0:showEmptyIcon(false)
	end

	slot0.item_scrollview:reloadData()
end

function ElitematchZoneListPanel.createNewCell(slot0, slot1, slot2)
	slot3 = ElitematchZoneItem.new(slot1, slot2)

	slot3:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot3
end

function ElitematchZoneListPanel.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function ElitematchZoneListPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	slot1:setData(slot3)
end

function ElitematchZoneListPanel.onCellTouched(slot0, slot1)
	if slot0.show_list[slot1.index] then
		if slot0.callback then
			slot0.callback(slot3.id)
		end

		slot0:onClickBtnClose()
	end
end

function ElitematchZoneListPanel.showEmptyIcon(slot0, slot1)
	if not slot0.empty_con and slot1 == false then
		return
	end

	if not slot0.empty_con then
		slot3 = cc.size(200, 200)
		slot0.empty_con = ccui.Widget:create()

		slot0.empty_con:setContentSize(slot3)
		slot0.empty_con:setAnchorPoint(cc.p(0.5, 0))
		slot0.empty_con:setPosition(cc.p(slot0.main_panel:getContentSize().width / 2, 330))
		slot0.main_panel:addChild(slot0.empty_con, 10)

		slot5 = createImage(slot0.empty_con, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_3"), slot3.width / 2, slot3.height / 2, cc.p(0.5, 0.5), false)
		slot0.empty_label = createLabel(26, Config.ColorData.data_color4[175], nil, slot3.width / 2, -10, "", slot0.empty_con, 0, cc.p(0.5, 0))
	end

	slot0.empty_label:setString(TI18N("暂无数据"))
	slot0.empty_con:setVisible(slot1)
end

function ElitematchZoneListPanel.close_callback(slot0)
	slot0.data = nil

	uv0:openElitematchZoneListPanel(false)
end

ElitematchZoneItem = class("ElitematchZoneItem", function ()
	return ccui.Widget:create()
end)

function ElitematchZoneItem.ctor(slot0, slot1, slot2)
	slot0:configUI(slot1, slot2)
	slot0:register_event()
end

function ElitematchZoneItem.configUI(slot0, slot1, slot2)
	slot0.size = cc.size(slot1, slot2)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("elitematch/elitematch_zone_item"))

	slot0:addChild(slot0.root_wnd)

	slot4 = slot0.root_wnd:getChildByName("main_container")
	slot0.icon = slot4:getChildByName("icon")
	slot0.zone_name = slot4:getChildByName("zone_name")
	slot0.comfirm_btn = slot4:getChildByName("comfirm_btn")

	slot0.comfirm_btn:getChildByName("label"):setString(TI18N("查 看"))
end

function ElitematchZoneItem.register_event(slot0)
	registerButtonEventListener(slot0.comfirm_btn, handler(slot0, slot0.onClickComfirmBtn), true, 2)
end

function ElitematchZoneItem.onClickComfirmBtn(slot0)
	if not slot0.data then
		return
	end

	if slot0.callback then
		slot0.callback()
	end
end

function ElitematchZoneItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function ElitematchZoneItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0.zone_name:setString(uv0("%s  %s", slot0.data.name, TI18N("赛区")))

	slot0.item_load = loadSpriteTextureFromCDN(slot0.icon, PathTool.getPlistImgForDownLoad("elitematch/elitematch_zone_icon", slot0.data.icon, false), ResourcesType.single, slot0.item_load)
end

function ElitematchZoneItem.DeleteMe(slot0)
	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
