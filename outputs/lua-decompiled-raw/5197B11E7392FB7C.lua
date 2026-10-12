EquipmentCompRecordWindow = EquipmentCompRecordWindow or BaseClass(BaseView)
slot0 = ForgeHouseController:getInstance()

function EquipmentCompRecordWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "forgehouse/forgehouse_comp_record"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_3"),
			type = ResourcesType.single
		}
	}
end

function EquipmentCompRecordWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("Image_2"):getChildByName("Text_1_0"):setString(TI18N("合成记录"))

	slot0.empty_bg = slot1:getChildByName("empty_bg")
	slot0.empty_label = slot0.empty_bg:getChildByName("empty_label")

	slot0.empty_label:setPositionX(125)
	slot0.empty_bg:setVisible(false)
	loadSpriteTexture(slot0.empty_bg, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_3"), LOADTEXT_TYPE)

	slot0.item_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot1:getChildByName("good_cons"):getContentSize(), {
		need_dynamic == true,
		start_y = 0,
		item_width = 651,
		start_x = 10,
		space_x = 0,
		row = 0,
		item_height = 197,
		space_y = 0,
		col = 1,
		item_class = EquipmentCompRecordItem
	})

	slot0.item_scrollview:setSwallowTouches(false)

	slot0.btn_sure = slot1:getChildByName("btn_sure")

	slot0.btn_sure:getChildByName("Text_1"):setString(TI18N("确 定"))
end

function EquipmentCompRecordWindow.register_event(slot0)
	slot0:addGlobalEvent(ForgeHouseEvent.Composite_Record, function (slot0)
		if not slot0 or next(slot0) == nil then
			return
		end

		if next(slot0.logs) ~= nil then
			uv0.empty_bg:setVisible(false)
		else
			uv0.empty_bg:setVisible(true)
		end

		if uv0.item_scrollview then
			uv0.item_scrollview:setData(slot0.logs)
		end
	end)
	registerButtonEventListener(slot0.btn_sure, function ()
		uv0:openEquipmentCompRecordWindow(false)
	end, true, 1)
end

function EquipmentCompRecordWindow.openRootWnd(slot0)
	uv0:send11082()
end

function EquipmentCompRecordWindow.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	uv0:openEquipmentCompRecordWindow(false)
end

EquipmentCompRecordItem = class("EquipmentCompRecordItem", function ()
	return ccui.Widget:create()
end)

function EquipmentCompRecordItem.ctor(slot0)
	slot0:configUI()
end

function EquipmentCompRecordItem.configUI(slot0)
	slot0.size = cc.size(651, 197)

	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("forgehouse/forgehouse_comp_record_item"))

	slot0:addChild(slot0.root_wnd)

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot1:getChildByName("Text_1"):setString(TI18N("合成物品："))
	slot1:getChildByName("Text_1_0"):setString(TI18N("材料消耗："))

	slot0.time_text = slot1:getChildByName("time_text")

	slot0.time_text:setString("")

	slot0.consume_text = slot1:getChildByName("consume_text")

	slot0.consume_text:setString("")

	slot2 = slot1:getChildByName("good_cons")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 13,
		start_x = 0,
		space_x = 10,
		row = 1,
		space_y = 0,
		col = 0,
		scale = 0.8,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.8,
		item_height = BackPackItem.Height * 0.8
	})

	slot0.item_scrollview:setSwallowTouches(false)

	slot5 = slot1:getChildByName("consume_item")

	slot5:setScale(0.4)
	loadSpriteTexture(slot5, PathTool.getItemRes(Config.ItemData.data_get_data(1).icon), LOADTEXT_TYPE)
end

function EquipmentCompRecordItem.setData(slot0, slot1)
	if not slot1 or next(slot1) == nil then
		return
	end

	slot7 = slot1.time

	slot0.time_text:setString(TimeTool.getYMDHMS(slot7))
	slot0.consume_text:setString(slot1.coin)

	slot2 = {}

	for slot6, slot7 in pairs(slot1.items) do
		if deepCopy(Config.ItemData.data_get_data(slot7.bid)) then
			slot8.quantity = slot7.num

			table.insert(slot2, slot8)
		end
	end

	slot0.item_scrollview:setData(slot2)
	slot0.item_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.item_scrollview:getItemList()) do
			slot5:setDefaultTip()
			slot5:setSwallowTouches(false)
		end
	end)
end

function EquipmentCompRecordItem.DeleteMe(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
