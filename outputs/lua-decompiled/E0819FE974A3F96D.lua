FruitTreasurePropTips = FruitTreasurePropTips or BaseClass(BaseView)
slot0 = string.format
slot1 = table.insert
slot3 = FruitTreasureController:getInstance():getModel()

function FruitTreasurePropTips.__init(slot0)
	slot0.ctrl = BackpackController:getInstance()
	slot0.is_full_screen = false
	slot0.title_str = ""
	slot0.layout_name = "fruit_treasure/fruit_prop_tips"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("tips", "tips"),
			type = ResourcesType.plist
		}
	}
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.exstr_list = {}
end

function FruitTreasurePropTips.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_panel = slot0.root_wnd:getChildByName("n_ui")
	slot0.main_panel_init_size = slot0.main_panel:getContentSize()
	slot0.n_arr_prop = slot0.main_panel:getChildByName("n_arr_prop")
	slot0.n_top = slot0.main_panel:getChildByName("n_top")
	slot0.temp_node = slot0.main_panel:getChildByName("fruit_prop_item")
	slot0.temp_node_height = slot0.temp_node:getContentSize().height
	slot0.close_btn = slot0.n_top:getChildByName("b_close")
end

function FruitTreasurePropTips.register_event(slot0)
	if slot0.background then
		slot0.background:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				uv0:close()
			end
		end)
	end

	if slot0.close_btn then
		registerButtonEventListener(slot0.close_btn, function ()
			uv0:close()
		end, true, 2)
	end
end

function FruitTreasurePropTips.openRootWnd(slot0)
	slot0.data = uv0.cultivateData

	slot0:setBaseInfo()
end

function FruitTreasurePropTips.adjustContentSizeAndPos(slot0)
	slot2 = slot0.main_panel_init_size.height + (10 + slot0.temp_node_height) * (#uv0:getExStrlist(slot0.data.id) - 1) + 10

	slot0.main_panel:setContentSize(cc.size(slot0.main_panel_init_size.width, slot2))
	slot0.n_top:setPositionY(slot2)
	slot0.n_arr_prop:setPositionY(slot2 - 60)
end

function FruitTreasurePropTips.setBaseInfo(slot0)
	if slot0.data == nil then
		return
	end

	slot1 = slot0.data

	for slot6, slot7 in pairs(uv0:getExStrlist(slot0.data.id)) do
		slot0.exstr_list[slot6] = slot0.temp_node:clone()

		slot0.exstr_list[slot6]:setVisible(true)
		slot0.n_arr_prop:addChild(slot0.exstr_list[slot6])
		slot0.exstr_list[slot6]:addChild(createRichLabel(22, cc.c4b(255, 255, 255, 255), cc.p(0, 0.5), cc.p(15, 35), 5, nil, 450))

		slot9 = ""

		slot8:setString((slot6 > slot0.data.star or uv1("<img src='%s' scale=1 /> <div fontcolor=#249003>%s</div>", PathTool.getResFrame("hero", "hero_info_1"), slot2[slot6])) and uv1("<img src='%s' scale=1 /> <div fontcolor=#C25B08>%s</div>", PathTool.getResFrame("common", "hero_info_2"), slot2[slot6]))
	end

	slot0:adjustContentSizeAndPos()
end

function FruitTreasurePropTips.close_callback(slot0)
end
