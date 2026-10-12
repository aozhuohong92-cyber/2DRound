HomePetOnWayEventPanel = HomePetOnWayEventPanel or BaseClass(BaseView)
slot0 = HomepetController:getInstance()

function HomePetOnWayEventPanel.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {}
	slot0.layout_name = "homepet/home_pet_on_way_event_panel"
end

function HomePetOnWayEventPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.title_img = slot0.main_container:getChildByName("title_img")
	slot0.name_img = slot0.main_container:getChildByName("name_img")
end

function HomePetOnWayEventPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:onClosedBtn()
	end, false, 2)
end

function HomePetOnWayEventPanel.onClosedBtn(slot0)
	if slot0.event_data then
		if slot0.event_data.award and next(slot0.event_data.award) ~= nil then
			-- Nothing
		end

		HomepetController:getInstance():openHomePetEventInfoPanel(true, {
			evt_id = slot0.event_data.evt_id,
			item_id = slot0.event_data.award[1].id
		})
	end

	uv0:openHomePetOnWayEventPanel(false)
end

function HomePetOnWayEventPanel.onEventBtn(slot0)
end

function HomePetOnWayEventPanel.openRootWnd(slot0, slot1)
	slot0.event_data = (slot1 or {}).event_data or {}

	if not slot0.event_data then
		return
	end

	slot3 = PathTool.getPlistImgForDownLoad("bigbg/homepet", "home_pet_way_bg", false)

	if slot0.record_title_img_res == nil or slot0.record_title_img_res ~= slot3 then
		slot0.record_title_img_res = slot3
		slot0.item_load_title_img_res = loadSpriteTextureFromCDN(slot0.title_img, slot3, ResourcesType.single, slot0.item_load_title_img_res)
	end

	slot0.config = Config.HomePetData.data_event_info[slot0.event_data.evt_sid]

	if not slot0.config then
		return
	end

	if slot0.config.type == HomepetConst.event_type.ePhoto then
		slot4 = PathTool.getPlistImgForDownLoad("bigbg/homepet", "home_pet_way_photo", false)

		if slot0.record_name_img_res == nil or slot0.record_name_img_res ~= slot4 then
			slot0.record_name_img_res = slot4
			slot0.item_load_name_img_res = loadSpriteTextureFromCDN(slot0.name_img, slot4, ResourcesType.single, slot0.item_load_name_img_res)
		end
	else
		slot4 = PathTool.getPlistImgForDownLoad("bigbg/homepet", "home_pet_way_letter", false)

		if slot0.record_name_img_res == nil or slot0.record_name_img_res ~= slot4 then
			slot0.record_name_img_res = slot4
			slot0.item_load_name_img_res = loadSpriteTextureFromCDN(slot0.name_img, slot4, ResourcesType.single, slot0.item_load_name_img_res)
		end
	end
end

function HomePetOnWayEventPanel.close_callback(slot0)
	if slot0.item_load_title_img_res then
		slot0.item_load_title_img_res:DeleteMe()

		item_load_title_img_res = nil
	end

	if slot0.item_load_name_img_res then
		slot0.item_load_name_img_res:DeleteMe()

		item_load_name_img_res = nil
	end

	uv0:openHomePetOnWayEventPanel(false)
end
