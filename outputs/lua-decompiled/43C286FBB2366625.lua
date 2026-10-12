HeroDrawMainTabDraw = class("HeroDrawMainTabDraw", function ()
	return ccui.Widget:create()
end)
slot1 = string.format
slot2 = HeroController:getInstance():getModel()
slot3 = table.insert
slot4 = table.sort

function HeroDrawMainTabDraw.ctor(slot0, slot1)
	slot0.parent = slot1

	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function HeroDrawMainTabDraw.config(slot0)
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.can_click_btn = true
	slot0.is_show_attr = true
end

function HeroDrawMainTabDraw.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("hero/hero_draw_main_tab_draw"))

	slot0:addChild(slot0.root_wnd)

	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.bottom_lay = slot0.main_container:getChildByName("bottom_lay")
	slot0.bottom_lay_y = display.getBottom(slot0.main_container) + slot0.bottom_lay:getPositionY()

	slot0.bottom_lay:setPositionY(slot0.bottom_lay_y)
	slot0.bottom_lay:setVisible(false)

	slot0.ext_panel = slot0.bottom_lay:getChildByName("ext_panel")
	slot0.skin_panel = slot0.ext_panel:getChildByName("skin_panel")

	slot0.skin_panel:setVisible(true)

	slot0.skin_show_btn = slot0.skin_panel:getChildByName("show_btn")
	slot0.show_btn_icon = slot0.skin_show_btn:getChildByName("icon")
	slot0.model_bg = slot0.skin_panel:getChildByName("bg")
	slot0.model_node = slot0.skin_panel:getChildByName("model_node")
	slot0.comfirm_btn = slot0.skin_panel:getChildByName("comfirm_btn")

	slot0.comfirm_btn:getChildByName("label"):setString(TI18N("应用"))
	slot0.skin_panel:getChildByName("time_key"):setString(TI18N("有效时间:"))

	slot0.attr_key = slot0.skin_panel:getChildByName("attr_key")

	slot0.attr_key:setString(TI18N("属性加成:"))

	slot0.time_val = slot0.skin_panel:getChildByName("time_val")
	slot0.attr_item_list = {}
	slot0.vedio_panel = slot0.ext_panel:getChildByName("vedio_panel")
	slot0.vedio_show_btn = slot0.vedio_panel:getChildByName("show_btn")
	slot0.cv_name = slot0.vedio_panel:getChildByName("cv_name")

	slot0.cv_name:setString("")

	slot0.content_scrollview = slot0.vedio_panel:getChildByName("content_scrollview")
	slot0.content_scrollview_size = slot0.content_scrollview:getContentSize()
	slot0.btn_panel = slot0.bottom_lay:getChildByName("btn_panel")
	slot0.skin_btn = slot0.btn_panel:getChildByName("skin_btn")
	slot0.vedio_btn = slot0.btn_panel:getChildByName("vedio_btn")

	slot0.skin_btn:getChildByName("label"):setString(TI18N("皮\n肤"))
	slot0.vedio_btn:getChildByName("label"):setString(TI18N("语\n音"))
	slot0.skin_btn:setVisible(false)

	slot0.back_btn = slot0.bottom_lay:getChildByName("back_btn")

	slot0.back_btn:getChildByName("label"):setString(TI18N("收起"))

	slot0.skin_shop_btn = slot0.bottom_lay:getChildByName("skin_shop_btn")

	slot0.skin_shop_btn:getChildByName("label"):setString(TI18N("时装商城"))
	slot0:checkSkinShopBtnStatus()

	slot0.lay_scrollview1 = slot0.bottom_lay:getChildByName("lay_scrollview1")
	slot0.lay_scrollview2 = slot0.bottom_lay:getChildByName("lay_scrollview2")

	slot0.bottom_lay:setPositionX(720)

	if slot0.parent and slot0.parent.hero_vo and slot0.parent.hero_vo.is_pokedex then
		slot0.btn_bg = slot0.btn_panel:getChildByName("btn_bg")
		slot0.common_1016 = slot0.btn_panel:getChildByName("common_1016")

		slot0.btn_bg:setContentSize(cc.size(150, 108))
		slot0.common_1016:setVisible(false)
		slot0.skin_btn:setVisible(false)
		slot0.skin_btn:setTouchEnabled(false)
	end
end

function HeroDrawMainTabDraw.registerEvents(slot0)
	registerButtonEventListener(slot0.vedio_btn, function ()
		uv0:onClickVedioBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.skin_btn, function ()
		uv0:onClickSkinBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.skin_show_btn, function ()
		uv0:onClickSkinShowBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.vedio_show_btn, function ()
		uv0:onClickVedioShowBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.comfirm_btn, function ()
		uv0:onComfirmBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.back_btn, function ()
		uv0:onClickBackBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.skin_shop_btn, function ()
		uv0:onClickSkinShopBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)

	if slot0.hero_skin_info_event == nil then
		slot0.hero_skin_info_event = GlobalEvent:getInstance():Bind(HeroEvent.Hero_Skin_Info_Event, function (slot0)
			if not uv0.select_skin_index then
				return
			end

			if not uv0.skin_data_list then
				return
			end

			for slot4, slot5 in ipairs(uv0.skin_data_list) do
				if uv1:isUnlockHeroSkin(slot5.skin_id) then
					slot5.is_lock = false
				else
					slot5.is_lock = true
				end
			end

			if uv0.use_skin_index ~= nil then
				if uv0.hero_vo then
					uv0.hero_vo.use_skin = uv0.skin_data_list[uv0.use_skin_index].skin_id or 0
				end

				uv0.must_update = true
				uv0.select_skin_index = 2

				uv0:updateSkinList(uv0.use_skin_index)

				uv0.use_skin_index = nil
			else
				uv0:updateSkinList(uv0.select_skin_index)
			end
		end)
	end

	if slot0.hero_skin_used_event == nil then
		slot0.hero_skin_used_event = GlobalEvent:getInstance():Bind(HeroEvent.Hero_Skin_Used_Event, function (slot0)
			if not uv0.select_skin_index then
				return
			end

			if not uv0.skin_data_list then
				return
			end

			uv0:updateSkinList(uv0.select_skin_index)
		end)
	end

	if not slot0.role_lev_event and slot0.role_vo then
		slot0.role_lev_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "lev" then
				uv0:checkSkinShopBtnStatus()
			end
		end)
	end
end

function HeroDrawMainTabDraw.onComfirmBtn(slot0)
	if not slot0.hero_vo then
		return
	end

	if not slot0.skin_data_list then
		return
	end

	if not slot0.parent then
		return
	end

	if slot0.skin_data_list[slot0.select_skin_index] and slot1.is_skin_data then
		if slot0.hero_vo.use_skin ~= slot1.skin_id then
			uv0:sender11019(slot0.hero_vo.partner_id, slot1.skin_id)
		end
	elseif slot0.hero_vo.use_skin ~= 0 then
		uv0:sender11019(slot0.hero_vo.partner_id, 0)
	end
end

function HeroDrawMainTabDraw.checkSkinShopBtnStatus(slot0)
	if not slot0.role_vo then
		return
	end

	if Config.ChargeMallData.data_const.skin_mall_lev and slot0.role_vo.lev < slot1.val then
		setChildUnEnabled(true, slot0.skin_shop_btn)
	else
		setChildUnEnabled(false, slot0.skin_shop_btn)
	end
end

function HeroDrawMainTabDraw.onClickSkinShopBtn(slot0)
	if not slot0.role_vo then
		return
	end

	if Config.ChargeMallData.data_const.skin_mall_lev and slot0.role_vo.lev < slot1.val then
		message(slot1.desc)

		return
	end

	MallController:getInstance():openSkinShopWindow(true)
end

function HeroDrawMainTabDraw.onClickVedioBtn(slot0)
	slot0.bottom_lay:setPositionX(720)
	slot0.bottom_lay:runAction(cc.EaseSineIn:create(cc.MoveTo:create(0.3, cc.p(0, slot0.bottom_lay_y))))
	slot0.skin_shop_btn:setVisible(false)
	slot0.skin_panel:setVisible(false)
	slot0.lay_scrollview1:setVisible(false)
	slot0.vedio_panel:setVisible(true)
	slot0.lay_scrollview2:setVisible(true)
	slot0:initVedioInfo()
end

function HeroDrawMainTabDraw.onClickSkinBtn(slot0)
	slot0.bottom_lay:setPositionX(720)
	slot0.bottom_lay:runAction(cc.EaseSineIn:create(cc.MoveTo:create(0.3, cc.p(0, slot0.bottom_lay_y))))
	slot0.skin_shop_btn:setVisible(true)
	slot0.skin_panel:setVisible(true)
	slot0.lay_scrollview1:setVisible(true)
	slot0.vedio_panel:setVisible(false)
	slot0.lay_scrollview2:setVisible(false)

	if slot0.is_show_attr then
		slot0:onClickSkinShowBtn()
	end

	slot0:initSkinInfo()
end

function HeroDrawMainTabDraw.onClickBackBtn(slot0)
	slot0.bottom_lay:setPositionX(0)
	slot0.bottom_lay:runAction(cc.EaseSineIn:create(cc.MoveTo:create(0.3, cc.p(720, slot0.bottom_lay_y))))
end

function HeroDrawMainTabDraw.hideAllBottom(slot0, slot1)
	if slot1 then
		slot0.skin_btn:setTouchEnabled(false)
		slot0.vedio_btn:setTouchEnabled(false)
		slot0.bottom_lay:runAction(cc.EaseSineIn:create(cc.MoveTo:create(0.3, cc.p(800, slot0.bottom_lay_y))))
	else
		slot0.bottom_lay:setPositionX(800)
		slot0.bottom_lay:runAction(cc.Sequence:create(cc.EaseSineIn:create(cc.MoveTo:create(0.3, cc.p(720, slot0.bottom_lay_y))), cc.CallFunc:create(function ()
			uv0.skin_btn:setTouchEnabled(true)
			uv0.vedio_btn:setTouchEnabled(true)
		end)))
	end
end

function HeroDrawMainTabDraw.onClickVedioShowBtn(slot0)
	if slot0.select_vedio_data then
		HeroController:getInstance():onPlayHeroVoice(slot0.select_vedio_data.voice, slot0.select_vedio_data.voice_time, slot0.select_vedio_data.pefix)
	end
end

function HeroDrawMainTabDraw.onClickSkinShowBtn(slot0)
	if not slot0.hero_vo then
		return
	end

	if slot0.is_show_attr then
		slot0.is_show_attr = false

		slot0.model_bg:setVisible(false)
		slot0.model_node:setVisible(false)

		if slot0.show_btn_icon then
			slot0.show_btn_icon:setScale(-1)
		end
	else
		slot0.is_show_attr = true

		slot0.model_bg:setVisible(true)
		slot0.model_node:setVisible(true)

		if slot0.show_btn_icon then
			slot0.show_btn_icon:setScale(1)
		end
	end
end

function HeroDrawMainTabDraw.initData(slot0)
	if not slot0.parent then
		return
	end

	if not slot0.parent.hero_vo then
		return
	end

	slot0.hero_vo = slot0.parent.hero_vo
end

function HeroDrawMainTabDraw.initVedioInfo(slot0)
	if not slot0.hero_vo then
		return
	end

	if slot0.init_vedio then
		return
	end

	slot0.init_vedio = true
	slot0.vedio_data_list = Config.PartnerVoiceData.data_skin_info[slot0.hero_vo.bid] or {}

	uv0(slot0.vedio_data_list, function (slot0, slot1)
		return slot0.sort_index < slot1.sort_index
	end)
	slot0:updateVedioList()
end

function HeroDrawMainTabDraw.updateVedioList(slot0)
	if slot0.vedio_scroll_view == nil then
		slot1 = slot0.lay_scrollview2:getContentSize()
		slot0.vedio_scroll_view = CommonScrollViewSingleLayout.new(slot0.lay_scrollview2, cc.p(slot1.width * 0.5, slot1.height * 0.5), ScrollViewDir.vertical, ScrollViewStartPos.top, slot1, {
			start_y = 0,
			row = 1,
			start_x = 0,
			space_x = 5,
			item_width = 675,
			item_height = 60,
			space_y = 0,
			col = 1,
			need_dynamic = true
		}, cc.p(0.5, 0.5))

		slot0.vedio_scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCellVedio), ScrollViewFuncType.CreateNewCell)
		slot0.vedio_scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCellsVedio), ScrollViewFuncType.NumberOfCells)
		slot0.vedio_scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndexVedio), ScrollViewFuncType.UpdateCellByIndex)
		slot0.vedio_scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.onCellTouchedVedio), ScrollViewFuncType.OnCellTouched)
	end

	if #slot0.vedio_data_list == 0 then
		commonShowEmptyIcon(slot0.lay_scrollview2, true, {
			text = TI18N("暂无语音数据")
		})
	else
		commonShowEmptyIcon(slot0.lay_scrollview2, false)
	end

	slot0.is_init_vedio = true

	slot0.vedio_scroll_view:reloadData(1)
end

function HeroDrawMainTabDraw.createNewCellVedio(slot0, slot1, slot2)
	slot3 = ccui.Layout:create()

	slot3:setCascadeOpacityEnabled(true)
	slot3:setAnchorPoint(0.5, 0.5)
	slot3:setTouchEnabled(false)
	slot3:setPosition(slot1 * 0.5, slot2 * 0.5)

	slot1 = 650
	slot2 = 53
	slot4 = cc.size(slot1, slot2)

	slot3:setContentSize(slot4)

	slot3.bg = createImage(slot3, PathTool.getResFrame("herodraw", "hero_draw_22"), slot1 * 0.5, slot2 * 0.5, cc.p(0.5, 0.5), true, nil, true)

	slot3.bg:setContentSize(slot4)

	slot3.name = createLabel(22, cc.c4b(100, 50, 35, 255), nil, 40, slot2 * 0.5, TI18N("名字"), slot3, nil, cc.p(0, 0.5))
	slot3.lay_btn = ccui.Layout:create()

	slot3.lay_btn:setAnchorPoint(0.9, 0.5)
	slot3.lay_btn:setTouchEnabled(true)
	slot3.lay_btn:setPosition(slot1 * 0.9, slot2 * 0.5)
	slot3.lay_btn:setContentSize(slot4)
	slot3:addChild(slot3.lay_btn)

	slot3.use_img = createSprite(PathTool.getResFrame("herodraw", "hero_draw_19"), 590, slot2 * 0.5, slot3.lay_btn, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)

	registerButtonEventListener(slot3.lay_btn, function ()
		uv0:onCellTouchedVedio(uv1)
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)

	function slot3.DeleteMe()
	end

	return slot3
end

function HeroDrawMainTabDraw.numberOfCellsVedio(slot0)
	if not slot0.vedio_data_list then
		return 0
	end

	return #slot0.vedio_data_list
end

function HeroDrawMainTabDraw.updateCellByIndexVedio(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.vedio_data_list[slot2] then
		return
	end

	slot1.name:setString(slot3.name)
end

function HeroDrawMainTabDraw.onCellTouchedVedio(slot0, slot1)
	if not slot1.index then
		return
	end

	if not slot0.vedio_data_list[slot1.index] then
		return
	end

	slot0.select_vedio_data = slot3

	if slot0.vedio_desc == nil then
		slot0.vedio_desc = createRichLabel(22, cc.c4b(255, 255, 255, 255), cc.p(0, 1), cc.p(0, 0), 12, nil, slot0.content_scrollview_size.width)

		slot0.content_scrollview:addChild(slot0.vedio_desc)
	end

	slot0.vedio_desc:setString(slot3.content)

	slot4 = slot0.vedio_desc:getContentSize()

	slot0.content_scrollview:setInnerContainerSize(cc.size(slot0.content_scrollview_size.width, math.max(slot0.content_scrollview_size.height, slot4.height)))

	if slot4.height < slot0.content_scrollview_size.height then
		slot0.content_scrollview:setTouchEnabled(false)
		slot0.vedio_desc:setPositionY(slot5 - (slot5 - slot4.height) / 2)
	else
		slot0.vedio_desc:setPositionY(slot5)
	end

	if slot0.select_vedio_data and not slot0.is_init_vedio then
		HeroController:getInstance():onPlayHeroVoice(slot0.select_vedio_data.voice, slot0.select_vedio_data.voice_time, slot0.select_vedio_data.pefix)
	end

	if slot3.cv_name and slot3.cv_name ~= "" then
		slot0.cv_name:setString(slot3.cv_name)
	else
		slot0.cv_name:setString("")
	end

	slot0.is_init_vedio = false
end

function HeroDrawMainTabDraw.initSkinInfo(slot0)
	if not slot0.hero_vo then
		return
	end

	if slot0.init_skin then
		return
	end

	slot0.init_skin = true
	slot0.skin_data_list = {}

	for slot5, slot6 in pairs(Config.PartnerSkinData.data_partner_bid_info[slot0.hero_vo.bid] or {}) do
		if uv0:isUnlockHeroSkin(slot6.skin_id) then
			-- Nothing
		else
			slot7.is_lock = true
		end

		uv1(slot0.skin_data_list, {
			is_skin_data = true,
			is_lock = false,
			skin_id = slot5,
			config = Config.PartnerSkinData.data_skin_info[slot6.skin_id]
		})
	end

	uv2(slot0.skin_data_list, function (slot0, slot1)
		return slot0.skin_id < slot1.skin_id
	end)
	uv1(slot0.skin_data_list, 1, slot0.hero_vo)

	slot2 = 1

	if (slot0.hero_vo.use_skin or 0) ~= 0 then
		for slot7, slot8 in ipairs(slot0.skin_data_list) do
			if slot8.skin_id == slot3 then
				slot2 = slot7
			end
		end
	end

	slot0:updateSkinList(slot2)
end

function HeroDrawMainTabDraw.updateSkinList(slot0, slot1)
	if slot0.skin_scroll_view == nil then
		slot2 = slot0.lay_scrollview1:getContentSize()
		slot3 = {
			start_y = 0,
			row = 1,
			start_x = 10,
			space_x = 5,
			item_width = 186,
			item_height = 293,
			space_y = 0,
			col = 1,
			need_dynamic = true
		}
		slot0.skin_scroll_view = CommonScrollViewSingleLayout.new(slot0.lay_scrollview1, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot2, slot3, cc.p(0, 0))

		slot0.skin_scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.skin_scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.skin_scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
		slot0.skin_scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.onCellTouched), ScrollViewFuncType.OnCellTouched)

		if math.floor(slot2.width / slot3.item_width) > #slot0.skin_data_list then
			slot0.skin_scroll_view:setClickEnabled(false)
		end
	end

	slot0.skin_scroll_view:reloadData(slot1 or 1)
end

function HeroDrawMainTabDraw.createNewCell(slot0, slot1, slot2)
	slot3 = ccui.Layout:create()

	slot3:setCascadeOpacityEnabled(true)
	slot3:setAnchorPoint(0.5, 0.5)
	slot3:setTouchEnabled(true)

	slot4 = cc.size(slot1, slot2)

	slot3:setContentSize(slot4)

	slot3.hero_icon = createSprite(nil, slot1 * 0.5, slot2 * 0.5, slot3, cc.p(0.5, 0.5))

	slot3.hero_icon:setScale(0.54)

	slot3.bg = createImage(slot3, PathTool.getResFrame("herodraw", "hero_draw_28"), slot1 * 0.5, slot2 * 0.5, cc.p(0.5, 0.5), true, nil, true)

	slot3.bg:setContentSize(slot4)

	slot3.name = createLabel(20, cc.c4b(255, 255, 255, 255), cc.c4b(0, 0, 0, 0), slot1 * 0.5, 24, TI18N("名字"), slot3, 2, cc.p(0.5, 0.5))
	slot3.lock_label = createLabel(24, cc.c4b(255, 255, 255, 255), cc.c4b(27, 74, 114, 255), slot1 * 0.5, slot2 * 0.5, TI18N("未解锁"), slot3, 2, cc.p(0.5, 0.5))

	slot3.lock_label:setVisible(false)

	slot3.select_bg = createImage(slot3, PathTool.getResFrame("common", "common_90019"), slot1 * 0.5, slot2 * 0.5, cc.p(0.5, 0.5), true, nil, true)

	slot3.select_bg:setContentSize(slot4)

	slot3.use_img = createSprite(PathTool.getResFrame("herodraw", "txt_cn_hero_draw_26"), 36, 274, slot3, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)

	slot3.use_img:setVisible(false)
	registerButtonEventListener(slot3, function ()
		uv0:onCellTouched(uv1)
	end, false, REGISTER_BUTTON_SOUND_BUTTON_TYPY)

	function slot3.DeleteMe()
		if uv0.item_load then
			uv0.item_load:DeleteMe()

			uv0.item_load = nil
		end
	end

	return slot3
end

function HeroDrawMainTabDraw.numberOfCells(slot0)
	if not slot0.skin_data_list then
		return 0
	end

	return #slot0.skin_data_list
end

function HeroDrawMainTabDraw.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.skin_data_list[slot2] then
		return
	end

	slot4 = slot3
	slot5, slot6 = nil

	if slot3.is_skin_data then
		slot5 = slot3.config.head_card_id
		slot6 = slot3.config.skin_name
	else
		slot5 = slot3.bid
		slot6 = slot3.name
	end

	if slot1.record_res_id == nil or slot1.record_res_id ~= slot5 then
		slot1.record_res_id = slot5
		slot1.item_load = loadSpriteTextureFromCDN(slot1.hero_icon, PathTool.getPlistImgForDownLoad("bigbg/partnercard", "partnercard_" .. slot5), ResourcesType.single, slot1.item_load, 60, function ()
			if uv0.is_skin_data and uv0.is_lock then
				setChildUnEnabled(true, uv1.hero_icon)
			end
		end)
	end

	if slot3.is_skin_data and slot3.is_lock then
		slot1.name:setVisible(false)
		slot1.select_bg:setVisible(false)
		slot1.use_img:setVisible(false)
		slot1.lock_label:setVisible(true)
		setChildUnEnabled(true, slot1.bg)
		setChildUnEnabled(true, slot1.hero_icon)
	else
		slot1.name:setVisible(true)
		slot1.lock_label:setVisible(false)
		setChildUnEnabled(false, slot1.bg)
		setChildUnEnabled(false, slot1.hero_icon)

		if slot0.hero_vo.use_skin == 0 and slot2 == 1 then
			slot1.use_img:setVisible(true)
		elseif slot0.parent.hero_vo.use_skin == slot3.skin_id then
			slot1.use_img:setVisible(true)
		else
			slot1.use_img:setVisible(false)
		end

		slot1.name:setString(slot6 or "")

		if slot0.select_skin_index and slot0.select_skin_index == slot2 then
			slot1.select_bg:setVisible(true)
		else
			slot1.select_bg:setVisible(false)
		end
	end
end

function HeroDrawMainTabDraw.onCellTouched(slot0, slot1)
	if not slot0.can_click_btn then
		return
	end

	if not slot1.index then
		return
	end

	if not slot0.skin_data_list[slot1.index] then
		return
	end

	if slot3.is_skin_data and slot3.is_lock then
		slot0:setLockInfo(slot3, slot2)

		return
	end

	if slot0.select_cell ~= nil then
		slot0.select_cell.select_bg:setVisible(false)
	end

	slot0.select_cell = slot1

	slot0.select_cell.select_bg:setVisible(true)
	slot0:updateSelectSkinInfo(slot2)
end

function HeroDrawMainTabDraw.updateSelectSkinInfo(slot0, slot1)
	if not slot0.must_update and slot0.select_skin_index and slot0.select_skin_index == slot1 then
		return
	end

	slot0.must_update = nil
	slot0.select_skin_index = slot1

	if slot0.skin_data_list[slot0.select_skin_index].is_skin_data then
		slot0.skin_config = slot2.config

		slot0:updateAttrInfo()
	else
		slot0.skin_config = Config.PartnerData.data_partner_library(slot2.bid)

		slot0:updateAttrInfo()
	end

	if slot0.parent then
		slot0.parent:initHeroDraw(slot0.skin_config.skin_id or 0)
	end

	slot0:updateHeroInfo(2)
end

function HeroDrawMainTabDraw.setLockInfo(slot0, slot1, slot2)
	slot3 = {
		[slot8] = true
	}

	for slot7, slot8 in ipairs(slot1.config.item_id_list) do
		-- Nothing
	end

	slot4 = nil
	slot5 = {}

	for slot10, slot11 in pairs(BackpackController:getInstance():getModel():getBagItemList(BackPackConst.Bag_Code.BACKPACK) or {}) do
		if slot11.config and slot3[slot11.config.id] then
			slot12 = {
				time = slot11.config.client_effect[1][2]
			}

			if slot11.config.client_effect[1] and slot11.config.client_effect[1][2] then
				-- Nothing
			else
				slot12.time = 1
			end

			if slot12.time == 0 then
				slot4 = slot11

				break
			end

			slot12.item_info = slot11

			uv0(slot5, slot12)
		end
	end

	if slot4 then
		slot0:useSkinItemByID(slot4, slot2)

		return
	end

	if #slot5 > 0 then
		table.sort(slot5, function (slot0, slot1)
			return slot1.time < slot0.time
		end)
		slot0:useSkinItemByID(slot5[1].item_info, slot2)
	else
		if slot0:checkValidActionTime(slot1.config) then
			slot0:gotoSkinAction(slot1.config)

			return
		end

		if slot1.config.is_shop == 0 then
			message(TI18N("暂未获取此皮肤，请前往相关活动或玩法中获取！"))
		else
			slot0:gotoSkinAction(slot1.config)
		end
	end
end

function HeroDrawMainTabDraw.useSkinItemByID(slot0, slot1, slot2)
	if slot1.config then
		CommonAlert.show(uv0(TI18N("已拥有解锁道具,是否消耗<div fontcolor=#%s>%s</div>解锁该皮肤？"), BackPackConst.getWhiteQualityColorStr(slot1.config.quality), slot1.config.name), TI18N("确定"), function ()
			uv0.use_skin_index = uv1

			BackpackController:getInstance():sender10515(uv2.id, 1)
		end, TI18N("取消"), nil, CommonAlert.type.rich, nil, {
			title = TI18N("解锁皮肤")
		})
	end
end

function HeroDrawMainTabDraw.checkValidActionTime(slot0, slot1)
	if slot0.is_check_action_time ~= nil then
		return slot0.is_check_action_time
	end

	slot0.is_check_action_time = false

	if slot1 and slot1.action_bid ~= 0 then
		slot2 = 0
		slot3 = 0

		if next(slot1.action_start_time) ~= nil and next(slot1.action_end_time) ~= nil then
			slot2 = os.time({
				year = slot1.action_start_time[1] or 0,
				month = slot1.action_start_time[2] or 0,
				day = slot1.action_start_time[3] or 0,
				hour = slot1.action_start_time[4] or 0,
				min = slot1.action_start_time[5] or 0,
				sec = slot1.action_start_time[6] or 0
			})
			slot3 = os.time({
				year = slot1.action_end_time[1] or 0,
				month = slot1.action_end_time[2] or 0,
				day = slot1.action_end_time[3] or 0,
				hour = slot1.action_end_time[4] or 0,
				min = slot1.action_end_time[5] or 0,
				sec = slot1.action_end_time[6] or 0
			})
		end

		if slot2 ~= 0 and slot3 ~= 0 then
			if slot2 <= GameNet:getInstance():getTime() and slot4 <= slot3 then
				slot0.is_check_action_time = true
			end
		else
			slot0.is_check_action_time = true
		end

		if slot0.is_check_action_time then
			slot0.is_check_action_time = ActionController:getInstance():CheckActionExistByActionBid(slot1.action_bid)
		end
	end

	return slot0.is_check_action_time
end

function HeroDrawMainTabDraw.gotoSkinAction(slot0, slot1)
	CommonAlert.show(TI18N("当前暂未拥有该皮肤,是否前往获取？"), TI18N("确定"), function ()
		if not uv0.checkValidActionTime then
			return
		end

		if uv0:checkValidActionTime(uv1) then
			ActionController:getInstance():openActionMainPanel(true, nil, uv1.action_bid)

			return
		end

		if Config.ExchangeData.data_shop_list[MallConst.MallType.HeroSkin] and slot0.sort ~= 0 then
			MallController:getInstance():openMallPanel(true, MallConst.MallType.HeroSkin)

			return
		end

		message(TI18N("暂无该皮肤获取途径"))
	end, TI18N("取消"), nil, nil, nil, {
		title = TI18N("解锁皮肤")
	})
end

function HeroDrawMainTabDraw.updateAttrInfo(slot0)
	if not slot0.skin_config then
		return
	end

	if uv0:getHeroSkinInfoBySkinID(slot0.skin_config.skin_id) then
		if slot1 == 0 then
			slot0.time_val:setString(TI18N("永久"))
			doStopAllActions(slot0.time_val)
		elseif slot1 - GameNet:getInstance():getTime() <= 0 then
			slot0.time_val:setString(TI18N("00:00:00"))
		else
			commonCountDownTime(slot0.time_val, slot2)
		end
	else
		slot0.time_val:setString(TI18N("永久"))
		doStopAllActions(slot0.time_val)
	end

	for slot5, slot6 in ipairs(slot0.attr_item_list) do
		slot6.key_label:setVisible(false)
	end

	if not slot0.skin_config.skin_attr then
		slot0.attr_key:setString(TI18N("属性加成:  无"))

		return
	else
		slot0.attr_key:setString(TI18N("属性加成:"))
	end

	slot2 = 42
	slot4 = 0
	slot5 = cc.size(130, 35)

	for slot9, slot10 in ipairs(slot0.attr_item_list) do
		slot10.key_label:setVisible(false)
	end

	for slot9, slot10 in ipairs(slot0.skin_config.skin_attr) do
		if slot0.attr_item_list[slot9] == nil then
			slot0.attr_item_list[slot9] = slot0:createAttrItem(130 + (slot9 - 1) * (slot3 + slot4), slot2, slot5)
		else
			slot0.attr_item_list[slot9].key_label:setVisible(true)
		end

		slot12, slot13, slot14 = commonGetAttrInfoByKeyValue(slot10[1], slot10[2])

		slot0.attr_item_list[slot9].key_label:setString(string.format("%s + %s", slot13, slot14))
	end
end

function HeroDrawMainTabDraw.createAttrItem(slot0, slot1, slot2, slot3)
	slot4 = {
		key_label = createRichLabel(22, cc.c4b(255, 255, 255, 255), cc.p(0, 0.5), cc.p(slot1, slot2), nil, nil, 380)
	}

	slot0.skin_panel:addChild(slot4.key_label, 2)

	return slot4
end

function HeroDrawMainTabDraw.updateHeroInfo(slot0, slot1)
	slot3 = nil
	slot4 = 0

	if slot0.skin_data_list[slot0.select_skin_index].is_skin_data then
		slot3 = Config.PartnerSkinData.data_hero_info(slot2.skin_id)
		slot4 = slot2.config.skin_id
	end

	slot0:updateSpine(slot0.hero_vo, slot4, slot1)
end

function HeroDrawMainTabDraw.updateSpine(slot0, slot1, slot2, slot3)
	if slot0.record_skin_id and slot0.record_skin_id == slot2 then
		return
	end

	slot0.record_skin_id = slot2

	function slot4()
		if not uv0.spine then
			uv0.spine = BaseRole.new(BaseRole.type.partner, uv1, nil, {
				scale = 1,
				skin_id = uv2
			})

			uv0.spine:setAnimation(0, PlayerAction.show, true)
			uv0.spine:setCascade(true)
			uv0.spine:setPosition(cc.p(0, 30))
			uv0.spine:setAnchorPoint(cc.p(0, 0))
			uv0.model_node:addChild(uv0.spine)
			uv0.spine:setCascade(true)
			uv0.spine:setOpacity(0)
			uv0.spine:showShadowUI(true)
			uv0.spine:runAction(cc.FadeIn:create(0.2))
		end
	end

	if slot0.spine then
		slot0.can_click_btn = false

		slot0.spine:setCascade(true)

		if slot3 == 2 then
			slot0.spine:runAction(cc.Sequence:create(cc.FadeOut:create(0.2), cc.CallFunc:create(function ()
				doStopAllActions(uv0.spine)
				uv0.spine:removeFromParent()

				uv0.spine = nil
				uv0.can_click_btn = true

				uv1()
			end)))
		else
			doStopAllActions(slot0.spine)
			slot0.spine:removeFromParent()

			slot0.spine = nil
			slot0.can_click_btn = true

			slot4()
		end
	else
		slot4()
	end
end

function HeroDrawMainTabDraw.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)

	if slot1 and not slot0.is_init then
		slot0.is_init = true

		slot0:initData()
	end
end

function HeroDrawMainTabDraw.DeleteMe(slot0)
	doStopAllActions(slot0.bottom_lay)

	if slot0.skin_scroll_view then
		slot0.skin_scroll_view:DeleteMe()

		slot0.skin_scroll_view = nil
	end

	if slot0.vedio_scroll_view then
		slot0.vedio_scroll_view:DeleteMe()

		slot0.vedio_scroll_view = nil
	end

	if slot0.hero_skin_info_event then
		GlobalEvent:getInstance():UnBind(slot0.hero_skin_info_event)

		slot0.hero_skin_info_event = nil
	end

	if slot0.hero_skin_used_event then
		GlobalEvent:getInstance():UnBind(slot0.hero_skin_used_event)

		slot0.hero_skin_used_event = nil
	end

	if slot0.role_vo and slot0.role_lev_event then
		slot0.role_vo:UnBind(slot0.role_lev_event)

		slot0.role_lev_event = nil
	end
end
