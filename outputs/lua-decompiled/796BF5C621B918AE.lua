HomePetEventInfoPanel = HomePetEventInfoPanel or BaseClass(BaseView)
slot1 = HomepetController:getInstance():getModel()

function HomePetEventInfoPanel.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("homepet_eventinfo", "homepet_eventinfo"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/homepet", "home_pet_proto_line"),
			type = ResourcesType.single
		}
	}
	slot0.layout_name = "homepet/home_pet_event_info_panel"
end

function HomePetEventInfoPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.title_img = slot0.main_container:getChildByName("title_img")
	slot1 = PathTool.getPlistImgForDownLoad("bigbg/homepet", "home_pet_proto_bg", false)

	if slot0.record_title_img_res == nil or slot0.record_title_img_res ~= slot1 then
		slot0.record_title_img_res = slot1
		slot0.item_load_title_img_res = loadSpriteTextureFromCDN(slot0.title_img, slot1, ResourcesType.single, slot0.item_load_title_img_res)
	end

	slot0.line_img_1 = slot0.main_container:getChildByName("line_img_1")
	slot0.line_img_2 = slot0.main_container:getChildByName("line_img_2")
	slot0.line_img_3 = slot0.main_container:getChildByName("line_img_3")
	slot0.title_name = slot0.main_container:getChildByName("title_name")
	slot0.content_label = createRichLabel(26, cc.c4b(100, 50, 35, 255), cc.p(0, 1), cc.p(65, 423), 22, nil, 550)

	slot0.main_container:addChild(slot0.content_label)

	slot0.proto_img = slot0.main_container:getChildByName("proto_img")
	slot0.proto_border = slot0.main_container:getChildByName("proto_border")
	slot0.ssr_bg = slot0.main_container:getChildByName("ssr_bg")
	slot0.ssr_img = slot0.main_container:getChildByName("ssr_img")
	slot0.tips_label = slot0.main_container:getChildByName("tips_label")

	slot0.tips_label:setString(TI18N("可在收藏中再次查阅"))

	slot0.remove_btn = slot0.main_container:getChildByName("remove_btn")
	slot0.save_btn = slot0.main_container:getChildByName("save_btn")

	slot0.save_btn:setVisible(false)

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.btn_goto = slot0.main_container:getChildByName("btn_goto")

	slot0.btn_goto:getChildByName("label"):setString(TI18N("设为空间背景"))
end

function HomePetEventInfoPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:onClosedBtn()
	end, false, 2)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:onClosedBtn()
	end, true, 2)
	registerButtonEventListener(slot0.remove_btn, function ()
		uv0:onRemoveBtn()
	end, true, 1)
	registerButtonEventListener(slot0.btn_goto, function ()
		uv0:onGotoBtn()
	end, true, 1)
end

function HomePetEventInfoPanel.onClosedBtn(slot0)
	uv0:openHomePetEventInfoPanel(false)
end

function HomePetEventInfoPanel.onGotoBtn(slot0)
	if not slot0.item_config then
		return
	end

	RoleController:getInstance():openRoleDecorateView(true, 5, {
		id = slot0.item_config.id
	})
end

function HomePetEventInfoPanel.onRemoveBtn(slot0)
	if not slot0.item_config then
		return
	end

	if not slot0.id then
		return
	end

	CommonAlert.show(TI18N("确定要删除吗？"), TI18N("删除"), function ()
		uv0:sender26113(uv1.item_config.type, uv1.id)
	end, TI18N("取消"))
end

function HomePetEventInfoPanel.openRootWnd(slot0, slot1)
	slot2 = slot1 or {}
	slot0.evt_id = slot2.evt_id
	slot0.item_id = slot2.item_id or 0
	slot0.id = slot2.id
	slot0.item_config = Config.ItemData.data_get_data(slot0.item_id)

	if not slot0.item_config then
		return
	end

	if slot0.item_config.type == BackPackConst.item_type.HOME_PET_PHOTO then
		slot0:setProtoEvent()
	else
		slot0:setInfoEvent()
		slot0.btn_goto:setVisible(false)
	end

	if not slot0.evt_id then
		slot0.tips_label:setVisible(false)
	else
		slot0.btn_goto:setVisible(false)
		slot0.remove_btn:setVisible(false)
	end
end

function HomePetEventInfoPanel.setInfoEvent(slot0)
	slot5 = false

	for slot5 = 1, 3 do
		if slot0["line_img_" .. slot5] then
			loadSpriteTexture(slot0["line_img_" .. slot5], PathTool.getPlistImgForDownLoad("bigbg/homepet", "home_pet_proto_line", slot5), LOADTEXT_TYPE)
		end
	end

	if slot0.item_config ~= nil then
		slot0.title_name:setString(slot0.item_config.use_desc)
		slot0.content_label:setString(slot0.item_config.desc)
	end
end

function HomePetEventInfoPanel.setProtoEvent(slot0)
	slot0.proto_border:setVisible(true)
	slot0.ssr_bg:setVisible(true)
	slot0.ssr_img:setVisible(true)
	slot0.proto_img:setVisible(true)

	if slot0.item_config ~= nil then
		slot1 = PathTool.getPlistImgForDownLoad("homepet_item", slot0.item_config.icon, true)

		if slot0.record_proto_img_res == nil or slot0.record_proto_img_res ~= slot1 then
			slot0.record_proto_img_res = slot1
			slot0.item_load_proto_img_res = loadSpriteTextureFromCDN(slot0.proto_img, slot1, ResourcesType.single, slot0.item_load_proto_img_res)
		end

		slot3 = PathTool.getResFrame("homepet_eventinfo", "homepet_eventinfo_" .. uv0:getHomepetResNameByQuality(slot0.item_config.quality))

		if slot0.record_ssr_res == nil or slot0.record_ssr_res ~= slot3 then
			slot0.record_ssr_res = slot3

			loadSpriteTexture(slot0.ssr_img, slot3, LOADTEXT_TYPE_PLIST)
		end
	end
end

function HomePetEventInfoPanel.close_callback(slot0)
	if slot0.item_load_title_img_res then
		slot0.item_load_title_img_res:DeleteMe()

		item_load_title_img_res = nil
	end

	if slot0.item_load_proto_img_res then
		slot0.item_load_proto_img_res:DeleteMe()

		item_load_proto_img_res = nil
	end

	if slot0.evt_id then
		uv0:sender26106(slot0.evt_id)
		uv0:setWaitNextEvent(false)
	end

	slot0.evt_id = nil

	uv0:openHomePetEventInfoPanel(false)
end
