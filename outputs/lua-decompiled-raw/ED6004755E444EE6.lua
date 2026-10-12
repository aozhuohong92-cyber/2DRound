slot1 = PlanesafkController:getInstance():getModel()
PlanesafkBuffChoseWindow = PlanesafkBuffChoseWindow or BaseClass(BaseView)

function PlanesafkBuffChoseWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "planes/planes_buff_chose"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("planes", "planes_buff"),
			type = ResourcesType.plist
		}
	}
	slot0.buff_item_list = {}
end

function PlanesafkBuffChoseWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1

	slot0:playEnterAnimatianByObj(slot1, 2)
	setTextContentList(slot1, {
		{
			"tips_txt",
			"请选择需要的遗物"
		}
	})

	slot0.btn_chose = slot1:getChildByName("btn_chose")

	slot0.btn_chose:getChildByName("label"):setString(TI18N("确认选择"))
	slot0.btn_chose:setVisible(false)
end

function PlanesafkBuffChoseWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickCloseBtn), false, 2)
	registerButtonEventListener(slot0.btn_chose, handler(slot0, slot0.onClickChoseBtn), true)
end

function PlanesafkBuffChoseWindow.onClickCloseBtn(slot0)
	uv0:openPlanesafkBuffChoseWindow(false)
end

function PlanesafkBuffChoseWindow.onClickChoseBtn(slot0)
	if slot0.cur_buff_item and slot0.data then
		slot1 = slot0.cur_buff_item:getBuffId()

		uv0:sender28600(slot0.data.line, slot0.data.index, 1, {
			{
				val2 = 0,
				type = PlanesafkConst.Proto_28600._5,
				val1 = slot1
			}
		}, {
			buff_id = slot1,
			world_pos = slot0.cur_buff_item:convertToWorldSpace(cc.p(0, 0)),
			data = slot0.data
		})
	end
end

function PlanesafkBuffChoseWindow.openRootWnd(slot0, slot1, slot2)
	slot0.data = slot2

	slot0:setData(slot1)
end

function PlanesafkBuffChoseWindow.setData(slot0, slot1)
	if not slot1 or next(slot1) == nil then
		return
	end

	slot5 = slot0.main_container:getContentSize().width * 0.5 - (200 + 20)

	for slot9, slot10 in ipairs(slot1) do
		if Config.PlanesData.data_buff[slot10] then
			if not slot0.buff_item_list[slot9] then
				slot12 = PlanesBuffItem.new(handler(slot0, slot0.onClickCallBack))

				slot0.main_container:addChild(slot12)

				slot0.buff_item_list[slot9] = slot12
			end

			slot12:setData(slot11)
			slot12:setPosition(slot5 + (slot9 - 1) * (slot4 + slot3), 290)
		end
	end
end

function PlanesafkBuffChoseWindow.onClickCallBack(slot0, slot1)
	if slot0.cur_buff_item then
		slot0.cur_buff_item:setIsSelect(false)
	end

	slot1:setIsSelect(true)

	slot0.cur_buff_item = slot1

	slot0.btn_chose:setPositionX(slot1:getPositionX())
	slot0.btn_chose:setVisible(true)
end

function PlanesafkBuffChoseWindow.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.buff_item_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	uv0:openPlanesafkBuffChoseWindow(false)
end
