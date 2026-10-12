slot1 = PlanesafkController:getInstance():getModel()
slot2 = table.sort
slot3 = table.insert
PlanesafkBuffListPanel = PlanesafkBuffListPanel or BaseClass(BaseView)

function PlanesafkBuffListPanel.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "planes/planes_buff_list"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("planes", "planes_buff"),
			type = ResourcesType.plist
		}
	}
end

function PlanesafkBuffListPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1

	slot0:playEnterAnimatianByObj(slot1, 1)
	slot1:getChildByName("win_title"):setString(TI18N("遗物收集"))
	slot1:getChildByName("tips_txt"):setString(TI18N("遗物只会在本次长环岛冒险玩法中生效，结束冒险后，遗物将会被清空"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot2 = slot1:getChildByName("item_list")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 0,
		item_width = 195,
		start_x = 0,
		space_x = 5,
		row = 0,
		item_height = 362,
		space_y = 5,
		col = 3,
		item_class = PlanesBuffItem
	})
end

function PlanesafkBuffListPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickCloseBtn), false, 2)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), true, 2)
	slot0:addGlobalEvent(PlanesafkEvent.Get_Buff_Data_Event, function (slot0)
		uv0:setData(slot0)
	end)
end

function PlanesafkBuffListPanel.onClickCloseBtn(slot0)
	uv0:openPlanesafkBuffListPanel(false)
end

function PlanesafkBuffListPanel.openRootWnd(slot0)
	uv0:sender28620()
end

function PlanesafkBuffListPanel.setData(slot0, slot1)
	if not slot1 or next(slot1) == nil then
		commonShowEmptyIcon(slot0.main_container, true, {
			text = TI18N("暂无遗物数据")
		})

		return
	end

	slot2 = {}

	for slot6, slot7 in pairs(slot1) do
		if Config.PlanesData.data_buff[slot7.buff_id] then
			uv0(slot2, deepCopy(slot8))
		end
	end

	uv1(slot2, function (slot0, slot1)
		return slot1.quality < slot0.quality
	end)
	slot0.item_scrollview:setData(slot2)
end

function PlanesafkBuffListPanel.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	uv0:openPlanesafkBuffListPanel(false)
end
