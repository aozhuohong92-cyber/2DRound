HeroSkinWindow = HeroSkinWindow or BaseClass(BaseView)
slot1 = HeroController:getInstance():getModel()
slot2 = table.sort
slot3 = string.format
slot4 = table.insert

function HeroSkinWindow.__init(slot0)
	slot0.win_type = WinType.Full
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "hero/hero_skin_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("hero", "partnerskin"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/hero", "hero_info_bg_def", true),
			type = ResourcesType.single
		}
	}
	slot0.can_click_btn = true
end

function HeroSkinWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg/hero", "hero_info_bg_def", true), LOADTEXT_TYPE)
	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.hero_name = slot0.main_container:getChildByName("hero_name_bg"):getChildByName("hero_name")

	slot0.hero_name:setString("")

	slot0.title_name = slot0.main_container:getChildByName("hero_name_bg"):getChildByName("title_name")

	slot0.title_name:setString("")

	slot0.close_btn = slot0.main_container:getChildByName("hero_name_bg"):getChildByName("close_btn")
	slot0.hero_draw_icon = slot0.main_container:getChildByName("hero_draw_icon")
	slot0.hero_draw_icon_x, slot0.hero_draw_icon_y = slot0.hero_draw_icon:getPosition()
	slot0.bottom_panel = slot0.main_container:getChildByName("bottom_panel")
	slot0.hero_panel = slot0.bottom_panel:getChildByName("hero_panel")
	slot0.mode_node = slot0.hero_panel:getChildByName("model_node")
	slot0.hero_panel_bg = slot0.hero_panel:getChildByName("bg")
	slot0.line = slot0.hero_panel:getChildByName("line")
	slot0.name = slot0.hero_panel:getChildByName("name")
	slot0.content_scrollview = slot0.hero_panel:getChildByName("content_scrollview")

	slot0.content_scrollview:setScrollBarEnabled(false)

	slot0.content_scrollview_size = slot0.content_scrollview:getContentSize()
	slot0.content_text = createRichLabel(20, cc.c4b(255, 248, 219, 255), cc.p(0.5, 1), cc.p(slot0.content_scrollview_size.width * 0.5, 0), 10, nil, 380)

	slot0.content_scrollview:addChild(slot0.content_text)

	slot0.attr_panel = slot0.bottom_panel:getChildByName("attr_panel")

	slot0.attr_panel:setVisible(false)
	slot0.attr_panel:getChildByName("time_key"):setString(TI18N("有效时间:"))
	slot0.attr_panel:getChildByName("attr_key"):setString(TI18N("属性加成:"))

	slot0.skin_level = slot0.attr_panel:getChildByName("level")

	slot0.skin_level:setString("")

	slot0.skill_tips = slot0.attr_panel:getChildByName("skill_tips")

	slot0.skill_tips:setString(TI18N("10星后替换技能"))
	slot0.skill_tips:setVisible(false)

	slot0.arrow = slot0.attr_panel:getChildByName("arrow")

	slot0.arrow:setVisible(false)

	slot0.old_node = slot0.attr_panel:getChildByName("old_skill_node")
	slot0.new_node = slot0.attr_panel:getChildByName("new_skill_node")
	slot0.old_skill = SkillItem.new(false, true, true, 0.55)

	slot0.old_skill:setVisible(false)
	slot0.old_node:addChild(slot0.old_skill)

	slot0.new_skill = SkillItem.new(false, true, true, 0.55)

	slot0.new_node:addChild(slot0.new_skill)
	slot0.new_skill:setVisible(false)

	slot0.time_val = slot0.attr_panel:getChildByName("time_val")
	slot0.attr_item_list = {}
	slot0.show_btn = slot0.bottom_panel:getChildByName("show_btn")
	slot0.show_btn_icon = slot0.show_btn:getChildByName("icon")

	slot0.show_btn:setVisible(false)

	slot0.left_btn = slot0.bottom_panel:getChildByName("left_btn")

	slot0.left_btn:getChildByName("label"):setString(TI18N("升 级"))

	slot0.right_btn = slot0.bottom_panel:getChildByName("right_btn")

	slot0.right_btn:getChildByName("label"):setString(TI18N("更 换"))
	slot0.left_btn:setVisible(false)
	slot0.right_btn:setVisible(true)
	slot0.right_btn:setPositionX(360)

	slot0.preview_btn = slot0.bottom_panel:getChildByName("preview_btn")

	slot0.preview_btn:getChildByName("label"):setString(TI18N("升级预览"))
	slot0.preview_btn:setVisible(false)

	slot0.tips_btn = slot0.bottom_panel:getChildByName("tips_btn")

	slot0.tips_btn:setVisible(false)

	slot0.active_btn = slot0.bottom_panel:getChildByName("active_btn")

	slot0.active_btn:getChildByName("label"):setString(TI18N("激活"))

	slot0.lay_scrollview = slot0.bottom_panel:getChildByName("lay_scrollview")
	slot0.emptySkin = createRichLabel(22, cc.c4b(100, 50, 35, 255), cc.p(0, 0.5), cc.p(341, 65), nil, nil, 380)

	slot0.emptySkin:setString(TI18N("暂无皮肤"))
	slot0.emptySkin:setVisible(false)
	slot0:adaptationScreen()
end

function HeroSkinWindow.adaptationScreen(slot0)
	slot1 = display.getTop(slot0.main_container)

	slot0.bottom_panel:setPositionY(slot0.bottom_panel:getPositionY() + display.getBottom(slot0.main_container))
end

function HeroSkinWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:onClosedBtn()
	end, true, 2)
	registerButtonEventListener(slot0.left_btn, function ()
		uv0:onLevelUpBtn()
	end, true, 2)
	registerButtonEventListener(slot0.right_btn, function ()
		uv0:onClickRightBtn()
	end, true, 1)
	registerButtonEventListener(slot0.preview_btn, function ()
		if not uv0.hero_vo then
			return
		end

		if not uv0.skin_data_list then
			return
		end

		uv1:openHeroSkinUpgradePreviewWindow(true, uv0.skin_data_list[uv0.select_skin_index], uv0.hero_vo)
	end, true, 1)
	registerButtonEventListener(slot0.tips_btn, function (slot0, slot1, slot2)
		TipsManager:getInstance():showCommonTips(Config.PartnerSkinData.data_const.skin_tip.desc, slot1:getTouchBeganPosition())
	end, true, 1)
	registerButtonEventListener(slot0.show_btn, function ()
		uv0:onClickShowBtn()
	end, true, 2)
	registerButtonEventListener(slot0.active_btn, function ()
		if not uv0.hero_vo then
			return
		end

		if not uv0.skin_data_list then
			return
		end

		uv0:setLockInfo(uv0.skin_data_list[uv0.select_skin_index], uv0.select_skin_index)
	end, true, 2)
	slot0:addGlobalEvent(HeroEvent.Hero_Skin_Info_Event, function ()
		if not uv0.select_skin_index then
			return
		end

		if not uv0.skin_data_list then
			return
		end

		for slot3, slot4 in ipairs(uv0.skin_data_list) do
			if uv1:isUnlockHeroSkin(slot4.skin_id) then
				slot4.is_lock = false
			else
				slot4.is_lock = true
			end
		end

		if uv0.use_skin_index ~= nil then
			uv0:updateSkinList(uv0.use_skin_index)

			uv0.use_skin_index = nil
		else
			uv0:updateSkinList(uv0.select_skin_index)
		end

		uv0.select_skin_index = nil

		uv0:updateSelectSkinInfo(uv0.select_skin_index)
	end)
	slot0:addGlobalEvent(HeroEvent.Hero_Skin_Upgrade_Event, function (slot0)
		if not uv0.select_skin_index then
			return
		end

		if not uv0.skin_data_list then
			return
		end

		if uv0.hero_vo.partner_id ~= slot0.partner_id then
			return
		end

		uv0.select_skin_index = nil

		uv0:openRootWnd(uv0.hero_vo)
	end)
end

function HeroSkinWindow.isNextSkillChange(slot0, slot1)
	if not slot0.hero_vo then
		return
	end

	if not slot0.skin_data_list then
		return
	end

	if not slot1.config then
		return
	end

	if Config.PartnerSkinData.data_skin_info[slot2.next_id] then
		if Config.PartnerData.data_partner_star(getNorKey(slot2.bid, slot0.hero_vo.star)) == nil then
			return
		end

		for slot9, slot10 in ipairs(slot5.skills) do
			if slot10[1] ~= 1 and Config.PartnerSkinData.data_skilltonewskill[getNorKey(slot3.skin_id, slot10[2])] then
				return true
			end
		end
	end

	return false
end

function HeroSkinWindow.onClosedBtn(slot0)
	uv0:openHeroSkinWindow(false)
end

function HeroSkinWindow.onLevelUpBtn(slot0)
	if not slot0.hero_vo then
		return
	end

	if not slot0.skin_data_list then
		return
	end

	if slot0:isNextSkillChange(slot0.skin_data_list[slot0.select_skin_index]) then
		uv0:openHeroSkinUpgradeWindow(true, slot1, slot0.hero_vo)
	else
		uv0:openHeroSkinUpgradeWindow2(true, slot1, slot0.hero_vo)
	end
end

function HeroSkinWindow.onClickRightBtn(slot0)
	if not slot0.hero_vo then
		return
	end

	if not slot0.skin_data_list then
		return
	end

	if slot0.skin_data_list[slot0.select_skin_index] and slot1.is_skin_data then
		if slot0.hero_vo.use_skin ~= slot1.skin_id then
			uv0:sender11019(slot0.hero_vo.partner_id, slot1.skin_id)
		end
	elseif slot0.hero_vo.use_skin ~= 0 then
		uv0:sender11019(slot0.hero_vo.partner_id, 0)
	end

	slot0:onClosedBtn()
end

function HeroSkinWindow.onClickShowBtn(slot0)
	if not slot0.hero_vo then
		return
	end

	if not slot0.skin_data_list then
		return
	end

	if slot0.is_show_attr then
		slot0.is_show_attr = false

		slot0.attr_panel:setVisible(false)
		slot0.hero_panel:setVisible(true)
		slot0:updateHeroInfo(1)

		if slot0.show_btn_icon then
			slot0.show_btn_icon:setScale(-1)
		end
	else
		slot0.is_show_attr = true

		slot0.hero_panel:setVisible(false)

		if slot0.skin_data_list[slot0.select_skin_index] and slot1.is_skin_data then
			slot0.attr_panel:setVisible(true)
			slot0:updateAttrInfo()
		else
			slot0.attr_panel:setVisible(false)
		end

		if slot0.show_btn_icon then
			slot0.show_btn_icon:setScale(1)
		end
	end
end

function HeroSkinWindow.openRootWnd(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.hero_vo = slot1

	if slot1.is_pokedex then
		slot0.lay_scrollview:setPositionY(60)
	else
		slot0.lay_scrollview:setPositionY(98)
	end

	if not (Config.PartnerSkinData.data_partner_bid_info[slot0.hero_vo.bid] or {}) then
		return
	end

	if Config.PartnerData.data_partner_base[slot0.hero_vo.bid] then
		slot0.hero_name:setString(slot3.name)
	end

	if slot1.is_pokedex then
		slot0.preview_btn:setPositionY(290)
	else
		slot0.preview_btn:setPositionY(408)
	end

	slot0.skin_data_list = {}
	slot4 = {}

	for slot8, slot9 in pairs(slot2) do
		if not slot4[Config.PartnerSkinData.data_skin_info[slot9.skin_id] and slot10.series_id or 0] then
			slot4[slot11] = {}
		end

		uv0(slot4[slot11], slot8)
	end

	for slot8, slot9 in pairs(slot4) do
		uv1(slot9, function (slot0, slot1)
			return slot0 < slot1
		end)
	end

	print("----->cur_skin_id", slot0.hero_vo.use_skin or 0)

	for slot9, slot10 in pairs(slot4) do
		if not uv2:getModel():getHeroSkinIdBySeriesId(slot9) then
			for slot15, slot16 in ipairs(slot10) do
				if slot15 == 1 then
					slot11 = slot16
				end

				if slot5 == slot16 then
					slot11 = slot16

					break
				end
			end
		elseif slot5 ~= 0 then
			slot5 = slot11
			slot0.hero_vo.use_skin = slot11
		end

		if uv3:isUnlockHeroSkin(slot11) then
			-- Nothing
		else
			slot12.is_lock = true
		end

		uv0(slot0.skin_data_list, {
			is_skin_data = true,
			is_lock = false,
			skin_id = slot11,
			config = Config.PartnerSkinData.data_skin_info[slot11]
		})
	end

	uv1(slot0.skin_data_list, function (slot0, slot1)
		return slot0.skin_id < slot1.skin_id
	end)
	uv0(slot0.skin_data_list, 1, slot0.hero_vo)

	slot6 = 1

	if slot5 ~= 0 then
		for slot10, slot11 in ipairs(slot0.skin_data_list) do
			if slot11.skin_id == slot5 then
				slot6 = slot10
			end
		end
	end

	slot0.is_show_attr = true

	slot0:updateSkinList(slot6)
end

function HeroSkinWindow.updateSkinList(slot0, slot1)
	if slot0.scroll_view == nil then
		slot2 = slot0.lay_scrollview:getContentSize()
		slot3 = {
			start_y = 0,
			row = 1,
			start_x = 0,
			space_x = 10,
			item_width = 120,
			item_height = 120,
			space_y = 0,
			col = 1,
			need_dynamic = true
		}
		slot0.scroll_view = CommonScrollViewSingleLayout.new(slot0.lay_scrollview, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot2, slot3, cc.p(0, 0))

		slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
		slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.onCellTouched), ScrollViewFuncType.OnCellTouched)

		if math.floor(slot2.width / slot3.item_width) >= #slot0.skin_data_list then
			slot0.scroll_view:setClickEnabled(false)
		end
	end

	slot0.scroll_view:reloadData(slot1 or 1)
end

function HeroSkinWindow.createNewCell(slot0, slot1, slot2)
	slot3 = BackPackItem.new(true, true)

	slot3:setSelfBackground(BackPackConst.quality.orange)
	slot3:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot3
end

function HeroSkinWindow.numberOfCells(slot0)
	if not slot0.skin_data_list then
		return 0
	end

	return #slot0.skin_data_list
end

function HeroSkinWindow.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.skin_data_list[slot2] then
		return
	end

	slot4 = nil

	if slot3.is_skin_data then
		slot1:setItemIcon(PathTool.getHeadIcon(slot3.config.head_id))

		if slot3.is_lock and not slot0.hero_vo.is_pokedex then
			-- Nothing
		end
	else
		if Config.PartnerData.data_partner_star(getNorKey(slot3.bid, slot3.star)) then
			slot1:setItemIcon(PathTool.getHeadIcon(slot6.head_id))
		end

		slot1:setItemIconUnEnabled(false)
	end

	if slot0.select_skin_index and slot0.select_skin_index == slot2 then
		slot1:setSelected(true)
	else
		slot1:setSelected(false)
	end
end

function HeroSkinWindow.onCellTouched(slot0, slot1)
	if not slot0.can_click_btn then
		return
	end

	if not slot1.index then
		return
	end

	if not slot0.skin_data_list[slot1.index] then
		return
	end

	if slot0.select_cell ~= nil then
		slot0.select_cell:setSelected(false)
	end

	slot0.select_cell = slot1

	slot0.select_cell:setSelected(true)
	slot0:updateSelectSkinInfo(slot2)
end

function HeroSkinWindow.updateSelectSkinInfo(slot0, slot1)
	if slot0.select_skin_index and slot0.select_skin_index == slot1 then
		return
	end

	slot0.select_skin_index = slot1
	slot3 = ""

	if slot0.skin_data_list[slot0.select_skin_index].config then
		slot3 = slot2.config.skin_name
	elseif Config.PartnerData.data_partner_library(slot2.bid) then
		slot3 = slot4.title
	end

	slot0.title_name:setString(slot3)

	if slot2.is_skin_data then
		slot0.skin_config = slot2.config

		if slot0.is_show_attr then
			slot0.attr_panel:setVisible(true)
			slot0.tips_btn:setVisible(true)
			slot0:updateAttrInfo()
		else
			slot0.attr_panel:setVisible(false)
			slot0.tips_btn:setVisible(false)
		end

		if slot2.is_lock then
			slot0.active_btn:setVisible(true)
		else
			slot0.active_btn:setVisible(false)

			if slot0.skin_config.next_id and slot0.skin_config.next_id ~= 0 and (uv0:getHeroSkinInfoBySkinID(slot0.skin_config.skin_id) or 0) == 0 then
				slot0.left_btn:setVisible(true)
				slot0.right_btn:setVisible(true)
				slot0.right_btn:setPositionX(504)
				slot0.left_btn:setPositionX(216)
			else
				slot0.left_btn:setVisible(false)
				slot0.tips_btn:setVisible(false)
				slot0.right_btn:setPositionX(360)
			end
		end
	else
		slot0.skin_config = Config.PartnerData.data_partner_library(slot2.bid)

		slot0.attr_panel:setVisible(false)
		slot0.tips_btn:setVisible(false)
		slot0.left_btn:setVisible(false)
		slot0.right_btn:setVisible(true)
		slot0.active_btn:setVisible(false)
		slot0.right_btn:setPositionX(360)
	end

	if slot0.hero_vo.is_pokedex then
		slot0.left_btn:setVisible(false)
		slot0.right_btn:setVisible(false)
		slot0.active_btn:setVisible(false)
		slot0.tips_btn:setVisible(false)

		if Config.PartnerSkinData.data_skin_info[slot0.skin_config and slot0.skin_config.skin_id or 0] then
			for slot10, slot11 in pairs(Config.PartnerSkinData.data_skin_info) do
				if slot11.series_id == slot5.series_id then
					slot6 = 0 + 1
				end
			end

			slot0.preview_btn:setVisible(slot6 > 1)
		else
			slot0.preview_btn:setVisible(false)
		end

		slot0.is_show_attr = false
	else
		slot0.preview_btn:setVisible(slot0.attr_panel:isVisible())
	end

	slot0:updateSkillChange(slot2)
	slot0:updateDrawInfo()

	if not slot0.is_show_attr then
		slot0:updateHeroInfo(2)
	end
end

function HeroSkinWindow.updateSkillChange(slot0, slot1)
	slot0.skill_tips:setVisible(false)
	slot0.arrow:setVisible(false)

	if slot0.old_skill then
		slot0.old_skill:setVisible(false)
	end

	if slot0.new_skill then
		slot0.new_skill:setVisible(false)
	end

	if not slot1.is_skin_data then
		return
	end

	if slot0.hero_vo.is_pokedex then
		return
	end

	if Config.PartnerData.data_partner_star(getNorKey(slot1.config.bid, slot0.hero_vo.star)) == nil then
		return
	end

	slot5, slot6 = nil

	for slot10, slot11 in ipairs(slot4.skills) do
		if slot11[1] ~= 1 and Config.PartnerSkinData.data_skilltonewskill[getNorKey(slot2.skin_id, slot11[2])] then
			slot5 = slot11[2]

			break
		end
	end

	slot8 = Config.SkillData.data_get_skill(slot6)

	if Config.SkillData.data_get_skill(slot5) and slot8 then
		slot0.skill_tips:setVisible(true)
		slot0.arrow:setVisible(true)
		slot0.old_skill:setData(slot7)
		slot0.old_skill:setVisible(true)
		slot0.new_skill:setData(slot8)
		slot0.new_skill:setVisible(true)
	end
end

function HeroSkinWindow.setLockInfo(slot0, slot1, slot2)
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

function HeroSkinWindow.useSkinItemByID(slot0, slot1, slot2)
	if slot1.config then
		CommonAlert.show(uv0(TI18N("已拥有解锁道具,是否消耗<div fontcolor=#%s>%s</div>解锁该皮肤？"), BackPackConst.getWhiteQualityColorStr(slot1.config.quality), slot1.config.name), TI18N("确定"), function ()
			uv0.use_skin_index = uv1

			BackpackController:getInstance():sender10515(uv2.id, 1)
		end, TI18N("取消"), nil, CommonAlert.type.rich, nil, {
			title = TI18N("解锁皮肤")
		})
	end
end

function HeroSkinWindow.checkValidActionTime(slot0, slot1)
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

function HeroSkinWindow.gotoSkinAction(slot0, slot1)
	CommonAlert.show(TI18N("当前暂未拥有该皮肤,是否前往获取？"), TI18N("确定"), function ()
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

function HeroSkinWindow.updateDrawInfo(slot0)
	if not slot0.skin_config then
		return
	end

	slot2 = nil
	slot3 = 0
	slot4 = slot0.skin_data_list[1]

	if slot0.skin_data_list[slot0.select_skin_index].is_skin_data then
		slot2 = Config.PartnerSkinData.data_hero_info(slot1.skin_id)
		slot3 = slot1.config.skin_id
	end

	if slot0.record_skin_id and slot0.record_skin_id == slot3 then
		return
	end

	slot0.record_skin_id = slot3

	if slot0.spine then
		slot0.spine:removeFromParent()

		slot0.spine = nil
	end

	slot0.spine = BaseRole.new(BaseRole.type.partner, slot4, nil, {
		scale = 0.45,
		skin_id = slot3
	})

	slot0.spine:setAnimation(0, PlayerAction.show, true)
	slot0.spine:setCascade(true)
	slot0.spine:setPosition(cc.p(360, 660))
	slot0.spine:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.main_container:addChild(slot0.spine)
	slot0.spine:setCascade(true)
	slot0.spine:setOpacity(0)
	slot0.spine:showShadowUI(true)
	slot0.spine:runAction(cc.FadeIn:create(0.2))
end

function HeroSkinWindow.updateAttrInfo(slot0)
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
	end

	slot2 = 19
	slot4 = 10
	slot5 = cc.size(150, 35)

	for slot9, slot10 in ipairs(slot0.attr_item_list) do
		slot10.bg:setVisible(false)
		slot10.key_label:setVisible(false)
	end

	for slot9, slot10 in ipairs(slot0.skin_config.skin_attr) do
		if slot0.attr_item_list[slot9] == nil then
			slot0.attr_item_list[slot9] = slot0:createAttrItem(120 + (slot9 - 1) * (slot3 + slot4), slot2, slot5)
		else
			slot0.attr_item_list[slot9].bg:setVisible(true)
			slot0.attr_item_list[slot9].key_label:setVisible(true)
		end

		slot12, slot13, slot14 = commonGetAttrInfoByKeyValue(slot10[1], slot10[2])

		slot0.attr_item_list[slot9].key_label:setString(string.format("<img src='%s' scale=1 /> %s + %s", slot12, slot13, slot14))
	end

	slot0.skin_level:setString(TI18N(uv1("等级：%s", slot0.skin_config.level)))
end

function HeroSkinWindow.createAttrItem(slot0, slot1, slot2, slot3)
	slot4 = {
		bg = createImage(slot0.attr_panel, PathTool.getResFrame("hero", "partner_skin_03"), slot1, slot2, cc.p(0, 0.5), true, 0, true)
	}

	slot4.bg:setContentSize(slot3)
	slot4.bg:setCapInsets(cc.rect(15, 15, 1, 1))

	slot4.key_label = createRichLabel(22, cc.c4b(255, 255, 255, 255), cc.p(0, 0.5), cc.p(slot1 + 10, slot2), nil, nil, 380)

	slot0.attr_panel:addChild(slot4.key_label, 2)

	return slot4
end

function HeroSkinWindow.updateHeroInfo(slot0, slot1)
	slot3 = nil
	slot4 = 0
	slot5 = slot0.skin_data_list[1]

	if slot0.skin_data_list[slot0.select_skin_index].is_skin_data then
		slot3 = Config.PartnerSkinData.data_hero_info(slot2.skin_id)
		slot4 = slot2.config.skin_id
	end

	slot0:updateSpine(slot5, slot4, slot1)

	if slot3 then
		slot0.line:setVisible(true)
		slot0.name:setVisible(true)
		slot0.content_scrollview:setVisible(true)
		slot0.hero_panel_bg:setContentSize(cc.size(712, 237))
		slot0.name:setString(slot0.skin_config.skin_name)
		slot0.content_text:setString(slot3.content)

		if slot0.content_text:getContentSize().height < slot0.content_scrollview_size.height then
			slot0.content_scrollview:setTouchEnabled(false)
		end

		slot7 = math.max(slot0.content_scrollview_size.height, slot6.height)

		slot0.content_scrollview:setInnerContainerSize(cc.size(slot0.content_scrollview_size.width, slot7))
		slot0.content_text:setPositionY(slot7 - 5)
	else
		slot0.line:setVisible(false)
		slot0.name:setVisible(false)
		slot0.content_scrollview:setVisible(false)
		slot0.hero_panel_bg:setContentSize(cc.size(285, 237))
	end
end

function HeroSkinWindow.updateSpine(slot0, slot1, slot2, slot3)
	if slot0.record_skin_id and slot0.record_skin_id == slot2 then
		return
	end

	slot0.record_skin_id = slot2

	function slot4()
		if not uv0.spine then
			uv0.spine = BaseRole.new(BaseRole.type.partner, uv1, nil, {
				scale = 0.45,
				skin_id = uv2
			})

			uv0.spine:setAnimation(0, PlayerAction.show, true)
			uv0.spine:setCascade(true)
			uv0.spine:setPosition(cc.p(0, 104))
			uv0.spine:setAnchorPoint(cc.p(0.5, 0.5))
			uv0.mode_node:addChild(uv0.spine)
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

function HeroSkinWindow.getDefaultModeRes(slot0)
	slot1, slot2 = slot0:getPartnerConfig()

	if slot1 and slot2 then
		return slot2.res_id
	end
end

function HeroSkinWindow.getDefaultDrawRes(slot0)
	slot1, slot2 = slot0:getPartnerConfig()

	if slot1 then
		return slot1.draw_res
	end
end

function HeroSkinWindow.getPartnerConfig(slot0)
	if not slot0.hero_vo then
		return
	end

	if slot0.partner_config == nil then
		slot0.partner_config = Config.PartnerData.data_partner_base[slot0.hero_vo.bid]
	end

	if slot0.partner_config and slot0.star_config == nil then
		slot0.star_config = Config.PartnerData.data_partner_star(getNorKey(slot0.partner_config.bid, slot0.partner_config.init_star))
	end

	return slot0.partner_config, slot0.star_config
end

function HeroSkinWindow.close_callback(slot0)
	doStopAllActions(slot0.time_val)

	if slot0.item_load then
		slot0.item_load:DeleteMe()
	end

	slot0.item_load = nil

	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()
	end

	slot0.scroll_view = nil

	if slot0.spine then
		slot0.spine:removeFromParent()
	end

	slot0.spine = nil

	if slot0.old_skill then
		slot0.old_skill:DeleteMe()

		slot0.old_skill = nil
	end

	if slot0.new_skill then
		slot0.new_skill:DeleteMe()

		slot0.new_skill = nil
	end

	uv0:openHeroSkinWindow(false)
end
