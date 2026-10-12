slot1 = HomeworldController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format
HomeworldUnitInfoWindow = HomeworldUnitInfoWindow or BaseClass(BaseView)

function HomeworldUnitInfoWindow.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "homeworld/homeworld_unit_info_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("homeworld", "homeworld"),
			type = ResourcesType.plist
		}
	}
	slot0.goto_id = {}
	slot0.source_list = {}
end

function HomeworldUnitInfoWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("win_title"):setString(TI18N("家具信息"))
	slot1:getChildByName("num_title"):setString(TI18N("获取来源"))

	slot0.sp_icon = slot1:getChildByName("sp_icon")
	slot0.soft_label = slot1:getChildByName("soft_label")
	slot0.grid_label = slot1:getChildByName("grid_label")
	slot5 = "close_btn"
	slot0.close_btn = slot1:getChildByName(slot5)

	for slot5 = 1, 4 do
		if slot1:getChildByName("source_bg_" .. slot5) then
			slot7 = {
				index = slot5,
				source_bg = slot6
			}

			slot7.source_bg:setVisible(false)

			slot7.btn = slot6:getChildByName("btn_go")
			slot7.label = slot6:getChildByName("desc_txt")

			uv0(slot0.source_list, slot7)
		end
	end
end

function HomeworldUnitInfoWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openFurnitureInfoWindow(false)
	end, false, 2)

	function slot4()
		uv0:openFurnitureInfoWindow(false)
	end

	slot5 = true

	registerButtonEventListener(slot0.close_btn, slot4, slot5, 2)

	for slot4, slot5 in pairs(slot0.source_list) do
		registerButtonEventListener(slot5.btn, function ()
			if uv0.goto_id[uv1.index] then
				uv0:JumpSourceType(uv0.goto_id[uv1.index])
			end
		end, true, 1)
	end
end

function HomeworldUnitInfoWindow.JumpSourceType(slot0, slot1)
	if slot1 == 132 then
		HomeworldController:getInstance():openHomeworldShopWindow(true, {
			index = 1
		})
	elseif slot1 == 133 then
		HomeworldController:getInstance():openHomeworldShopWindow(true, {
			index = 2
		})
	elseif slot1 == 134 then
		HomeworldController:getInstance():openHomeworldShopWindow(true, {
			index = 3
		})
	elseif slot1 == 135 then
		HomeworldController:getInstance():openHomeperBag()
	end
end

function HomeworldUnitInfoWindow.openRootWnd(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.unit_config = Config.HomeData.data_home_unit(slot1)

	slot0:setData()
end

function HomeworldUnitInfoWindow.setData(slot0)
	if not slot0.unit_config then
		return
	end

	if not slot0.name_label then
		slot0.name_label = createRichLabel(22, 274, cc.p(0, 0.5), cc.p(207, 420), nil, , 450)

		slot0.main_container:addChild(slot0.name_label)
	end

	slot1 = ""

	if Config.HomeData.data_suit[slot0.unit_config.set_id] then
		slot1 = ((not Config.ItemData.data_get_data(slot0.unit_config.bid) or uv0("<div fontcolor=%s>%s</div>", BackPackConst.getWhiteQualityColorStr(slot2.quality), slot0.unit_config.name)) and slot0.unit_config.name) .. uv0(TI18N(" <div fontcolor=955322>【所属主题:%s】</div>"), slot3.name)
	end

	slot0.name_label:setString(slot1)
	loadSpriteTexture(slot0.sp_icon, PathTool.getFurnitureNormalRes(slot0.unit_config.icon), LOADTEXT_TYPE)

	if not slot0.desc_txt then
		slot0.desc_txt = createRichLabel(20, cc.c4b(134, 79, 53, 255), cc.p(0, 0.5), cc.p(207, 376), 5, nil, 380)

		slot0.main_container:addChild(slot0.desc_txt)
	end

	slot0.desc_txt:setString(slot0.unit_config.desc)
	slot0.soft_label:setString(uv0(TI18N("舒适度+%d"), slot0.unit_config.soft))
	slot0.grid_label:setString(uv0(TI18N("占地:%s"), slot0.unit_config.grid_desc))

	slot5 = Config.SourceData.data_source_data

	if slot0.unit_config.soruce_id then
		for slot9, slot10 in ipairs(slot0.unit_config.soruce_id) do
			slot0.source_list[slot9].source_bg:setVisible(true)
			slot0.source_list[slot9].label:setString(slot5[slot10[1]].name)

			slot0.goto_id[slot9] = slot10[1]
		end
	end
end

function HomeworldUnitInfoWindow.close_callback(slot0)
	uv0:openFurnitureInfoWindow(false)
end
