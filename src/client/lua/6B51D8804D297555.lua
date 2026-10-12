slot1 = PlanesController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format
PlanesDunInfoWindow = PlanesDunInfoWindow or BaseClass(BaseView)

function PlanesDunInfoWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "planes/planes_dun_info_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("planes", "planes_info"),
			type = ResourcesType.plist
		}
	}
end

function PlanesDunInfoWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1

	setTextContentList(slot1, {
		{
			"win_title",
			TI18N("副本信息")
		},
		{
			"first_award_txt",
			TI18N("首通奖励")
		},
		{
			"award_txt",
			TI18N("征战奖励预览")
		},
		{
			"progress_title",
			TI18N("当前征战进度值")
		},
		{
			"tips_txt",
			TI18N("在本轮征战中每通过1个选择节点、或击败守卫和首领，将提升进度值")
		}
	})

	slot0.dun_bg_sp = slot1:getChildByName("dun_bg_sp")
	slot0.progress_bg = slot1:getChildByName("progress_bg")
	slot0.progress = slot0.progress_bg:getChildByName("progress")

	slot0.progress:setPercent(0)

	slot0.progress_value = slot0.progress_bg:getChildByName("progress_value")

	slot0.progress_value:setString("0%")

	slot0.progress_size = slot0.progress_bg:getContentSize()
	slot0.progress_bar = slot0.progress_bg:getChildByName("progress_bar")

	slot0.progress_bar:setPositionX(0)

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.btn_begin = slot1:getChildByName("btn_begin")

	slot0.btn_begin:setName("guide_begin_btn")

	slot0.btn_begin_label = slot0.btn_begin:getChildByName("label")

	slot0.btn_begin_label:setString(TI18N("开启征战"))

	slot0.btn_get_award = slot1:getChildByName("btn_get_award")

	slot0.btn_get_award:getChildByName("label"):setString(TI18N("领取"))

	slot0.got_award_sp = slot1:getChildByName("got_award_sp")
	slot0.not_pass_txt = slot1:getChildByName("not_pass_txt")

	slot0.not_pass_txt:setString(TI18N("尚未首通"))

	slot0.name_txt = slot1:getChildByName("name_txt")
	slot0.time_txt = slot1:getChildByName("time_txt")
	slot3 = slot1:getChildByName("first_award_list")
	slot0.first_item_scrollview = CommonScrollViewLayout.new(slot3, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot3:getContentSize(), {
		start_y = 0,
		start_x = 0,
		space_x = 10,
		row = 1,
		space_y = 0,
		col = 0,
		scale = 0.6,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.6,
		item_height = BackPackItem.Height * 0.6
	})
	slot6 = slot1:getChildByName("award_list")
	slot0.award_item_scrollview = CommonScrollViewLayout.new(slot6, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot6:getContentSize(), {
		start_y = 0,
		start_x = 0,
		space_x = 10,
		row = 1,
		space_y = 0,
		col = 0,
		scale = 0.6,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.6,
		item_height = BackPackItem.Height * 0.6
	})
end

function PlanesDunInfoWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickCloseBtn), false, 2)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), true, 2)
	registerButtonEventListener(slot0.btn_begin, handler(slot0, slot0.onClickBeginBtn), true)
	registerButtonEventListener(slot0.btn_get_award, handler(slot0, slot0.onClickGetAwardBtn), true)
	slot0:addGlobalEvent(PlanesEvent.Get_First_Award_Event, function ()
		uv0:updateAwardBtnStatus()
	end)
end

function PlanesDunInfoWindow.onClickCloseBtn(slot0)
	uv0:openPlanesDunInfoWindow(false)
end

function PlanesDunInfoWindow.onClickBeginBtn(slot0)
	if slot0.dun_id then
		uv0:sender23105(slot0.dun_id)
	end

	uv0:openPlanesDunInfoWindow(false)
end

function PlanesDunInfoWindow.onClickGetAwardBtn(slot0)
	if slot0.dun_id then
		uv0:sender23117(slot0.dun_id)
	end
end

function PlanesDunInfoWindow.openRootWnd(slot0, slot1)
	slot0.dun_id = slot1

	slot0:setData()
end

function PlanesDunInfoWindow.setData(slot0)
	if not slot0.dun_id then
		return
	end

	if not Config.SecretDunData.data_dun_info[slot0.dun_id] or not Config.SecretDunData.data_customs[slot0.dun_id] then
		return
	end

	slot3 = uv0:getCurDunId()

	slot0.name_txt:setString(slot1.name)

	if not slot0.desc_txt then
		slot0.desc_txt = createRichLabel(22, cc.c4b(238, 218, 189, 255), cc.p(0.5, 1), cc.p(340, 655), 5, nil, 580)

		slot0.main_container:addChild(slot0.desc_txt)
	end

	slot0.desc_txt:setString(slot2.desc)

	slot9 = ResourcesType.single
	slot10 = slot0.dun_bg_load
	slot0.dun_bg_load = loadSpriteTextureFromCDN(slot0.dun_bg_sp, uv1("resource/planes/dun_bg/dun_bg_%s.png", slot2.res_id), slot9, slot10)
	slot5 = {}

	for slot9, slot10 in pairs(slot2.first_reward) do
		uv2(slot5, {
			bid = slot10[1],
			quantity = slot10[2]
		})
	end

	slot0.first_item_scrollview:setData(slot5)
	slot0.first_item_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.first_item_scrollview:getItemList()) do
			slot5:setDefaultTip()
		end
	end)

	slot6 = {}

	for slot10, slot11 in pairs(slot2.award) do
		uv2(slot6, {
			bid = slot11
		})
	end

	slot0.award_item_scrollview:setData(slot6)
	slot0.award_item_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.award_item_scrollview:getItemList()) do
			slot5:setDefaultTip()
		end
	end)
	commonCountDownTime(slot0.time_txt, uv0:getResetLessTime(), {
		label_type = CommonAlert.type.rich,
		end_title = TI18N("后重置")
	})

	slot8, slot9 = uv0:getCurDunProgressVal()

	if math.floor(slot8 / slot9 * 100) > 100 then
		slot10 = 100
	end

	slot0.progress_value:setString(slot10 .. "%")
	slot0.progress:setPercent(slot10)
	slot0.progress_bar:setPositionX(slot0.progress_size.width * slot10 / 100)

	if slot3 == 0 then
		slot0.btn_begin_label:setString(TI18N("开启征战"))
	else
		slot0.btn_begin_label:setString(TI18N("继续征战"))
	end

	slot0:updateAwardBtnStatus()
end

function PlanesDunInfoWindow.updateAwardBtnStatus(slot0)
	slot1 = uv0:checkIsCanGetAwardByDunId(slot0.dun_id)

	if uv0:checkIsGetAwardByDunId(slot0.dun_id) then
		slot0.btn_get_award:setVisible(false)
		slot0.got_award_sp:setVisible(true)
		slot0.not_pass_txt:setVisible(false)
	elseif not slot1 then
		slot0.got_award_sp:setVisible(false)
		slot0.btn_get_award:setVisible(false)
		slot0.not_pass_txt:setVisible(true)
	else
		slot0.got_award_sp:setVisible(false)
		slot0.btn_get_award:setVisible(true)
		slot0.not_pass_txt:setVisible(false)
	end
end

function PlanesDunInfoWindow.close_callback(slot0)
	if slot0.first_item_scrollview then
		slot0.first_item_scrollview:DeleteMe()

		slot0.first_item_scrollview = nil
	end

	if slot0.award_item_scrollview then
		slot0.award_item_scrollview:DeleteMe()

		slot0.award_item_scrollview = nil
	end

	if slot0.dun_bg_load then
		slot0.dun_bg_load:DeleteMe()

		slot0.dun_bg_load = nil
	end

	uv0:openPlanesDunInfoWindow(false)
end
