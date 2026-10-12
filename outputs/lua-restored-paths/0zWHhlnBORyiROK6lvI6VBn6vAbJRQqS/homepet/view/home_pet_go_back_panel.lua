HomePetGoBackPanel = HomePetGoBackPanel or BaseClass(BaseView)
slot1 = HomepetController:getInstance():getModel()

function HomePetGoBackPanel.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {}
	slot0.layout_name = "homepet/home_pet_go_back_panel"
	slot0.homepet_vo = uv0:getHomePetVo()
end

function HomePetGoBackPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.title_img = slot0.main_container:getChildByName("title_img")
	slot0.pet_name = slot0.main_container:getChildByName("pet_name")
	slot0.pet_desc = slot0.main_container:getChildByName("pet_desc")
	slot0.txt_cn_common_notice_1 = slot0.main_container:getChildByName("txt_cn_common_notice_1")
end

function HomePetGoBackPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:onClosedBtn()
	end, false, 2)
end

function HomePetGoBackPanel.onClosedBtn(slot0)
	uv0:openHomePetGoBackPanel(false)
end

function HomePetGoBackPanel.openRootWnd(slot0, slot1)
	if not slot0.homepet_vo then
		return
	end

	slot0.event_data = (slot1 or {}).event_data

	if not slot0.event_data then
		return
	end

	slot0.config = Config.HomePetData.data_event_info[slot0.event_data.evt_sid]

	if not slot0.config then
		return
	end

	slot3 = nil

	if slot0.config.s_id == 1 then
		slot3 = PathTool.getPlistImgForDownLoad("bigbg/homepet", "home_pet_go_out_bg", false)
	elseif slot0.config.s_id == 2 then
		slot3 = PathTool.getPlistImgForDownLoad("bigbg/homepet", "home_pet_go_back_bg", false)

		slot0.txt_cn_common_notice_1:setPositionY(-25)
	end

	if slot3 and slot0.record_title_img_res == nil or slot0.record_title_img_res ~= slot3 then
		slot0.record_title_img_res = slot3
		slot0.item_load_title_img_res = loadSpriteTextureFromCDN(slot0.title_img, slot3, ResourcesType.single, slot0.item_load_title_img_res)
	end
end

function HomePetGoBackPanel.close_callback(slot0)
	if slot0.item_load_title_img_res then
		slot0.item_load_title_img_res:DeleteMe()

		item_load_title_img_res = nil
	end

	if slot0.event_data and slot0.event_data.evt_id then
		if slot0.config and slot0.config.s_id == 1 then
			uv0:sender26106(slot0.event_data.evt_id)
			uv0:setWaitNextEvent(false)
		else
			HomepetController:getInstance():openHomePetRewardPanel(true, {
				event_data = slot0.event_data
			})
		end
	end

	slot0.event_data = nil

	uv0:openHomePetGoBackPanel(false)
end
