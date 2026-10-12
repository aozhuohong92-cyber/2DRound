RolePersonalSpaceTabInfoPanel = class("RolePersonalSpaceTabInfoPanel", function ()
	return ccui.Widget:create()
end)
slot1 = RoleController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format

function RolePersonalSpaceTabInfoPanel.ctor(slot0, slot1)
	slot0.parent = slot1
	slot0.role_vo = RoleController:getInstance():getRoleVo()

	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function RolePersonalSpaceTabInfoPanel.config(slot0)
	NoticeController:getInstance():sender10813()
end

function RolePersonalSpaceTabInfoPanel.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("roleinfo/role_personal_space_tab_info_panel"))

	slot0:addChild(slot0.root_wnd)

	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0.main_container:setSwallowTouches(false)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.title_img = slot0.main_panel:getChildByName("title_img")
	slot0.title_btn = slot0.main_panel:getChildByName("title_btn")
	slot0.honor_img = slot0.main_panel:getChildByName("honor_img")
	slot0.attr_panel = slot0.main_container:getChildByName("attr_panel")
	slot0.attr_item_list = {}

	for slot6 = 1, 4 do
		slot7 = {
			attr_icon = slot0.attr_panel:getChildByName("attr_icon" .. slot6),
			attr_key = slot0.attr_panel:getChildByName("attr_key" .. slot6)
		}

		slot7.attr_key:setString(({
			TI18N("等级:"),
			TI18N("公会:"),
			TI18N("粉丝:"),
			TI18N("段位:")
		})[slot6])

		slot7.attr_value = slot0.attr_panel:getChildByName("attr_value" .. slot6)
		slot0.attr_item_list[slot6] = slot7
	end

	slot0.province_key = slot0.attr_panel:getChildByName("province_key")

	slot0.province_key:setString(TI18N("省市:"))

	slot0.province_value = slot0.attr_panel:getChildByName("province_value")
	slot0.city_key = slot0.attr_panel:getChildByName("city_key")

	slot0.city_key:setString(TI18N("地区:"))

	slot0.city_value = slot0.attr_panel:getChildByName("city_value")
	slot0.province_btn = slot0.attr_panel:getChildByName("province_btn")
	slot0.city_btn = slot0.attr_panel:getChildByName("city_btn")
	slot0.combobox_panel = slot0.main_container:getChildByName("combobox_panel")
	slot0.combobox_bg = slot0.combobox_panel:getChildByName("bg")
	slot0.combobox_bg_size = slot0.combobox_bg:getContentSize()
	slot0.combobox_max_size = cc.size(175, 190)
	slot0.look_btn = slot0.attr_panel:getChildByName("look_btn")
	slot0.role_head_node = slot0.main_container:getChildByName("role_head_node")

	slot0.role_head_node:setPositionX(338)

	slot0.role_head = PlayerHead.new(PlayerHead.type.other, nil, cc.size(117, 117), PathTool.getResFrame("rolepersonalspace", "role_personal_space_34"), PathTool.getResFrame("rolepersonalspace", "role_personal_space_35"))

	slot0.role_head:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.role_head_node:addChild(slot0.role_head)

	slot0.role_name = slot0.main_container:getChildByName("role_name")
	slot0.chang_name = slot0.main_container:getChildByName("chang_name")
	slot0.change_name_btn = slot0.main_container:getChildByName("change_name_btn")
	slot8 = "follow_btn"
	slot0.follow_btn = slot0.main_container:getChildByName(slot8)
	slot0.set_btn_list = {}

	for slot8 = 1, 4 do
		slot0.set_btn_list[slot8] = {
			btn = slot0.main_container:getChildByName("set_btn_" .. slot8)
		}
		slot0.set_btn_list[slot8].label = slot0.set_btn_list[slot8].btn:getChildByName("label")
	end

	slot5, slot6 = nil

	if slot0.parent.role_type == RoleConst.role_type.eOther then
		slot0.province_btn:setVisible(false)
		slot0.city_btn:setVisible(false)
		slot0.chang_name:setVisible(false)
		slot0.change_name_btn:setVisible(false)

		slot5 = {
			[1.0] = "role_personal_space_22",
			[3.0] = "role_personal_space_20"
		}
		slot6 = {
			TI18N("举报"),
			TI18N("关注"),
			TI18N("家园"),
			TI18N("加好友")
		}
	else
		slot0.follow_btn:setVisible(false)
		slot0.role_head:addCallBack(function ()
			uv0:openRoleDecorateView(true)
		end)
		slot0.chang_name:setString(TI18N("更换"))

		slot5 = {
			"role_personal_space_18",
			"role_personal_space_19",
			"role_personal_space_20",
			"role_personal_space_21"
		}
		slot6 = {
			TI18N("冒险形象"),
			TI18N("称号"),
			TI18N("家园"),
			TI18N("系统设置")
		}
	end

	for slot10, slot11 in ipairs(slot0.set_btn_list) do
		if slot5[slot10] then
			slot11.btn:loadTexture(PathTool.getResFrame("rolepersonalspace", slot5[slot10]), LOADTEXT_TYPE_PLIST)
		end

		if slot6[slot10] then
			slot11.label:setString(slot6[slot10])
		end
	end

	slot7 = slot0.main_container:getChildByName("hero_node")

	slot7:setContentSize(600, 108)

	slot0.scroll_view_size = slot7:getContentSize()
	slot0.scroll_view = createScrollView(slot0.scroll_view_size.width + 20, slot0.scroll_view_size.height, -25, -25, slot7, ccui.ScrollViewDir.horizontal)

	slot7:setPosition(45, 155)

	slot0.tips_panel = slot0.main_container:getChildByName("tips_panel")
	slot0.tips_title_img = slot0.tips_panel:getChildByName("title_img")

	slot0.tips_title_img:setScale(0.8)

	slot0.tips_name = slot0.tips_panel:getChildByName("name")

	slot0:onShowTipsPanel(false)
	slot0:onHideComboboxPanel()
end

function RolePersonalSpaceTabInfoPanel.registerEvents(slot0)
	registerButtonEventListener(slot0.province_btn, function ()
		uv0:onProvinceBtn()
	end, false, 1)
	registerButtonEventListener(slot0.city_btn, function ()
		uv0:onCityBtn()
	end, false, 1)
	registerButtonEventListener(slot0.change_name_btn, function ()
		uv0:onChangNameBtn()
	end, true, 1)
	registerButtonEventListener(slot0.title_btn, function ()
		uv0:onTitleBtn()
	end, false, 1)
	registerButtonEventListener(slot0.look_btn, function ()
		uv0:onClickLookBtn()
	end, true, 1)

	function slot4()
		uv0:onHideComboboxPanel()
		uv0:onShowTipsPanel(false)
	end

	slot5 = false

	registerButtonEventListener(slot0.main_container, slot4, slot5, 0)

	for slot4, slot5 in ipairs(slot0.set_btn_list) do
		registerButtonEventListener(slot5.btn, function ()
			uv0:onSetBtn(uv1)
		end, true, 1)
	end

	if slot0.All_Feedback_Event_Data == nil then
		slot0.All_Feedback_Event_Data = GlobalEvent:getInstance():Bind(NoticeEvent.All_Feedback_Event_Data, function ()
			if #uv0.set_btn_list >= 4 then
				addRedPointToNodeByStatus(uv0.set_btn_list[4], NoticeController:getInstance():getModel():getRedStatus() or false, 6, 6, nil)
			end
		end)
	end

	if slot0.parent.role_type == RoleConst.role_type.eMySelf then
		if slot0.role_vo and slot0.role_update_event == nil then
			slot0.role_update_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
				if slot0 == "face_id" or slot0 == "face_update_time" then
					uv0:updateRoleHead()
				elseif slot0 == "avatar_base_id" then
					uv0:updateHeadBg(slot1)
				elseif slot0 == "name" then
					uv0.role_name:setString(slot1)
				elseif slot0 == "sex" then
					-- Nothing
				elseif slot0 == "backdrop_id" then
					uv0:setBackgroundRes(slot1)
				end
			end)
		end

		if slot0.get_title_list_event == nil then
			slot0.get_title_list_event = GlobalEvent:getInstance():Bind(RoleEvent.GetTitleList, function (slot0)
				if not slot0 then
					return
				end

				uv0:updateHonorInfo(slot0.base_id)
			end)
		end

		if slot0.use_title_event == nil then
			slot0.use_title_event = GlobalEvent:getInstance():Bind(RoleEvent.UseTitle, function (slot0)
				if not slot0 then
					return
				end

				uv0:updateHonorInfo(slot0)
			end)
		end

		if not slot0.update_fun_form then
			slot0.update_fun_form = GlobalEvent:getInstance():Bind(HeroEvent.Update_Fun_Form, function (slot0)
				if slot0 and slot0.type and slot0.type == PartnerConst.Fun_Form.PersonalSpace then
					uv0:updateMySelfHeroInfo(slot0)
				end
			end)
		end

		if not slot0.role_fans_rank_event then
			slot0.role_fans_rank_event = GlobalEvent:getInstance():Bind(RoleEvent.ROLE_FANS_RANK_EVENT, function (slot0)
				if not slot0 then
					return
				end

				uv0:updateMyRankInfo(slot0)
			end)
		end

		if not slot0.role_city_event then
			slot0.role_city_event = GlobalEvent:getInstance():Bind(RoleEvent.ROLE_CITY_EVENT, function (slot0)
				if not slot0 then
					return
				end

				if uv0.record_city_id then
					uv0:setProvinceAndCity(uv0.record_city_id)
					uv0.role_vo:setRoleAttribute("city_id", uv0.record_city_id)

					uv0.record_city_id = nil
				end
			end)
		end
	elseif not slot0.role_follow_event then
		slot0.role_follow_event = GlobalEvent:getInstance():Bind(RoleEvent.ROLE_FOLLOW_EVENT, function (slot0)
			if not slot0 then
				return
			end

			if not uv0.parent then
				return
			end

			if uv0.parent.other_data then
				if uv0.parent.other_data.is_fanse and uv0.parent.other_data.is_fanse == 1 then
					uv0.parent.other_data.fans_num = uv0.parent.other_data.fans_num - 1
					uv0.parent.other_data.is_fanse = slot0.flag

					uv0:updateFollowInfo(uv0.parent.other_data.fans_num)
				else
					uv0.parent.other_data.fans_num = uv0.parent.other_data.fans_num + 1
					uv0.parent.other_data.is_fanse = slot0.flag

					uv0:updateFollowInfo(uv0.parent.other_data.fans_num)
				end
			end
		end)
	end
end

function RolePersonalSpaceTabInfoPanel.updateRoleHead(slot0)
	if slot0.role_vo == nil then
		return
	end

	slot0.role_head:setHeadRes(slot0.role_vo.face_id, false, LOADTEXT_TYPE, slot0.role_vo.face_file, slot0.role_vo.face_update_time)
end

function RolePersonalSpaceTabInfoPanel.onProvinceBtn(slot0)
	slot0:onShowTipsPanel(false)

	slot1 = nil

	if slot0.province_config_list == nil then
		slot0.province_config_list = {}

		for slot6, slot7 in pairs(Config.RoleData.data_province_list or {}) do
			uv0(slot0.province_config_list, slot7)
		end

		table.sort(slot0.province_config_list, function (slot0, slot1)
			return slot0.province_id < slot1.province_id
		end)
	end

	slot0.combobox_panel:setPositionX(232)
	slot0:updateComboboxList(slot0.province_config_list, 1)
end

function RolePersonalSpaceTabInfoPanel.onCityBtn(slot0)
	slot0:onShowTipsPanel(false)

	if slot0:getCurrentCityList() then
		slot0.combobox_panel:setPositionX(482)
		slot0:updateComboboxList(slot1, 2)
	end
end

function RolePersonalSpaceTabInfoPanel.getCurrentCityList(slot0)
	if not slot0.city_config then
		return
	end

	if Config.RoleData.data_city_list[slot0.city_config.province_id] then
		table.sort(slot1, function (slot0, slot1)
			return slot0.city_id < slot1.city_id
		end)
	end

	return slot1
end

function RolePersonalSpaceTabInfoPanel.onHideComboboxPanel(slot0)
	if slot0.combobox_panel then
		slot0.combobox_panel:setPositionX(-10000)
	end
end

function RolePersonalSpaceTabInfoPanel.onChangNameBtn(slot0)
	if isQingmingShield and isQingmingShield() then
		return
	end

	if not slot0.role_vo then
		return
	end

	if slot0.parent.role_type == RoleConst.role_type.eMySelf then
		if slot0.role_vo.sex == 2 then
			uv0:openRoleChangeNameView(true)

			return
		end

		slot2 = nil
		slot0.set_name_alert = CommonAlert.showInputApply((slot0.role_vo == nil or slot0.role_vo.is_first_rename ~= TRUE or TI18N("首次更改免费哦~")) and string.format(TI18N("<div fontcolor=#a95f0f>改名需消耗200 <img src=%s scale=0.3 visible=true /></div>"), PathTool.getItemRes(Config.ItemData.data_get_data(3).icon)), TI18N("请输入名字(限制6字)"), TI18N("确 定"), function (slot0)
			if slot0 == nil or slot0 == "" then
				message(TI18N("名字不合法"))

				return
			end

			if not uv0.role_vo then
				return
			end

			uv1:changeRoleName(string.gsub(slot0, "\n", ""), uv0.role_vo.sex)
		end, TI18N("取 消"), nil, true, nil, 20, CommonAlert.type.rich, FALSE, cc.size(270, 80), 12, {
			off_y = -15
		}, true)

		slot0.set_name_alert.alert_txt:setPositionY(20)
		slot0.set_name_alert.line:setVisible(false)

		slot3 = createLabel(26, Config.ColorData.data_color4[175], nil, 75, 75, TI18N("名字："), slot0.set_name_alert.alert_panel)
	end
end

function RolePersonalSpaceTabInfoPanel.onFollowBtn(slot0)
end

function RolePersonalSpaceTabInfoPanel.closeSetNameAlert(slot0)
	if slot0.set_name_alert then
		slot0.set_name_alert:close()

		slot0.set_name_alert = nil
	end
end

function RolePersonalSpaceTabInfoPanel.onTitleBtn(slot0)
	if not slot0.parent then
		return
	end

	if slot0.parent.role_type == RoleConst.role_type.eMySelf then
		uv0:openRoleDecorateView(true, 5)
	end
end

function RolePersonalSpaceTabInfoPanel.onSetBtn(slot0, slot1)
	if not slot0.parent then
		return
	end

	if not slot0.role_vo then
		return
	end

	if slot1 == 1 then
		if slot0.parent.role_type == RoleConst.role_type.eMySelf then
			uv0:openRoleDecorateView(true, 3)
		elseif slot0.parent.other_data then
			uv0:openRoleReportedPanel(true, slot0.parent.other_data.rid, slot0.parent.other_data.srv_id, slot0.parent.other_data.name)
		end
	elseif slot1 == 2 then
		if slot0.parent.role_type == RoleConst.role_type.eMySelf then
			uv0:openRoleDecorateView(true, 4)
		elseif slot0.parent.other_data then
			uv0:send25801(slot0.parent.other_data.rid, slot0.parent.other_data.srv_id)
		end
	elseif slot1 == 3 then
		if Config.HomeData.data_const.open_lev and slot0.role_vo.lev < slot2.val then
			message(slot2.desc)

			return
		end

		if slot0.parent.role_type == RoleConst.role_type.eMySelf then
			if slot0.role_vo.is_open_home == 1 then
				HomeworldController:getInstance():requestOpenMyHomeworld()
				slot0.parent:onClosedBtn()
			else
				message(TI18N("暂未开启家园"))
			end
		elseif slot0.parent.other_data then
			if slot0.parent.other_data.is_open_home == 1 then
				HomeworldController:getInstance():sender26003(slot0.parent.other_data.rid, slot0.parent.other_data.srv_id)
				slot0.parent:onClosedBtn()
			else
				message(TI18N("对方暂未拥有家园"))
			end
		end
	elseif slot1 == 4 then
		if slot0.parent.role_type == RoleConst.role_type.eMySelf then
			uv0:openRoleSystemSetPanel(true)
		elseif slot0.parent.other_data then
			if slot0.parent.other_data.is_friend == 1 then
				ChatController:getInstance():openChatPanel(ChatConst.Channel.Friend, "friend", slot0.parent.other_data)
				slot0.parent:onClosedBtn()
			else
				FriendController:getInstance():addOther(slot0.parent.other_data.srv_id, slot0.parent.other_data.rid)
			end
		end
	end
end

function RolePersonalSpaceTabInfoPanel.onClickLookBtn(slot0)
	slot0:onHideComboboxPanel()
	slot0:onShowTipsPanel(true)
end

function RolePersonalSpaceTabInfoPanel.onClickHeroItemByIndex(slot0, slot1)
	if not slot0.role_vo then
		return
	end

	if not slot0.hero_list then
		return
	end

	if slot0.parent.role_type == RoleConst.role_type.eMySelf then
		if slot0.hero_list[slot1] == nil then
			uv0:openRoleHeroShowFormPanel(true)
		else
			HeroController:getInstance():openHeroTipsPanel(true, slot2, {
				is_show_form_btn = true
			})
		end
	else
		if not slot2 then
			return
		end

		LookController:getInstance():sender11061(slot2.rid, slot2.srv_id, slot2.id)
	end
end

function RolePersonalSpaceTabInfoPanel.setBackgroundRes(slot0, slot1)
	if not slot1 then
		return
	end

	if slot1 == 0 then
		res_id = PathTool.getPlistImgForDownLoad("rolepersonalspace/rolepersonalspace_head", "100000")
	elseif Config.ItemData.data_get_data(slot1) then
		res_id = PathTool.getPlistImgForDownLoad("rolepersonalspace/rolepersonalspace_head", slot2.icon)
	else
		res_id = PathTool.getPlistImgForDownLoad("rolepersonalspace/rolepersonalspace_head", "100000")
	end

	if slot0.record_title_img_res == nil or slot0.record_title_img_res ~= res_id then
		slot0.record_title_img_res = res_id
		slot0.item_load_title_img_res = loadSpriteTextureFromCDN(slot0.title_img, res_id, ResourcesType.single, slot0.item_load_title_img_res)
	end
end

function RolePersonalSpaceTabInfoPanel.setData(slot0)
	if not slot0.role_vo then
		return
	end

	if not slot0.parent then
		return
	end

	if slot0.parent.role_type == RoleConst.role_type.eMySelf then
		slot0:setBackgroundRes(slot0.role_vo.backdrop_id)
		slot0.attr_item_list[1].attr_value:setString(slot0.role_vo.lev)

		if slot0.role_vo.gname and slot0.role_vo.gname == "" then
			slot0.attr_item_list[2].attr_value:setString(TI18N("未加入公会"))
		else
			slot0.attr_item_list[2].attr_value:setString(slot0.role_vo.gname)
		end

		slot0.attr_item_list[3].attr_value:setString(slot0.role_vo.fans_num)
		slot0:updateElitelev(slot0.role_vo.arena_elite_lev)
		slot0.role_head:setHeadRes(slot0.role_vo.face_id, false, LOADTEXT_TYPE, slot0.role_vo.face_file, slot0.role_vo.face_update_time)
		slot0:updateHeadBg(slot0.role_vo.avatar_base_id)
		slot0.role_name:setString(slot0.role_vo.name)
		slot0:setProvinceAndCity(slot0.role_vo.city_id)
		setChildUnEnabled(slot0.role_vo.is_open_home ~= 1, slot0.set_btn_list[3].btn)
		setChildUnEnabled(false, slot0.set_btn_list[3].label)
		uv0:sender23300()
		HeroController:getInstance():sender11211(PartnerConst.Fun_Form.PersonalSpace)
	else
		if slot0.parent.other_data then
			slot0:setBackgroundRes(slot0.parent.other_data.backdrop_id)
			slot0.role_head:setHeadRes(slot0.parent.other_data.face_id, false, LOADTEXT_TYPE, slot0.parent.other_data.face_file, slot0.parent.other_data.face_update_time)
			slot0:updateHeadBg(slot0.parent.other_data.avatar_bid)
			slot0.role_name:setString(slot0.parent.other_data.name)
			slot0:updateFollowInfo(slot0.parent.other_data.fans_num)

			if slot0.parent.other_data.is_friend == 1 then
				if slot0.set_btn_list[4] then
					slot0.set_btn_list[4].label:setString(TI18N("私聊"))
					slot0.set_btn_list[4].btn:loadTexture(PathTool.getResFrame("rolepersonalspace", "role_personal_space_25"), LOADTEXT_TYPE_PLIST)
				end
			elseif slot0.set_btn_list[4] then
				slot0.set_btn_list[4].label:setString(TI18N("加好友"))
				slot0.set_btn_list[4].btn:loadTexture(PathTool.getResFrame("rolepersonalspace", "role_personal_space_24"), LOADTEXT_TYPE_PLIST)
			end

			setChildUnEnabled(slot0.parent.other_data.is_open_home ~= 1, slot0.set_btn_list[3].btn)
			setChildUnEnabled(false, slot0.set_btn_list[3].label)
			slot0.attr_item_list[1].attr_value:setString(slot0.parent.other_data.lev)

			if slot0.parent.other_data.gname and slot0.parent.other_data.gname == "" then
				slot0.attr_item_list[2].attr_value:setString(TI18N("未加入公会"))
			else
				slot0.attr_item_list[2].attr_value:setString(slot0.parent.other_data.gname)
			end

			slot0.attr_item_list[3].attr_value:setString(slot0.parent.other_data.fans_num)
			slot0:updateElitelev(slot0.parent.other_data.elite_lev)
			slot0:setProvinceAndCity(slot0.parent.other_data.city_id)
			slot0:updateOtherHeroInfo()
			slot0:updateHonorInfo(slot0.parent.other_data.honor)

			if slot0.parent.other_data.is_be_fanse == TRUE then
				slot0.follow_btn:setVisible(true)
			else
				slot0.follow_btn:setVisible(false)
			end
		end

		slot0:updateHeadBg()
	end
end

function RolePersonalSpaceTabInfoPanel.updateElitelev(slot0, slot1)
	if not slot1 then
		return
	end

	if Config.ArenaEliteData.data_elite_level_fun(slot1) and slot0.attr_item_list[4] then
		slot0.attr_item_list[4].attr_value:setString(slot2.name)
	end
end

function RolePersonalSpaceTabInfoPanel.updateFollowInfo(slot0, slot1)
	if slot0.parent.other_data.is_fanse and slot0.parent.other_data.is_fanse == 1 then
		if slot0.set_btn_list[2] then
			slot0.set_btn_list[2].label:setString(TI18N("取消关注"))
			slot0.set_btn_list[2].btn:loadTexture(PathTool.getResFrame("rolepersonalspace", "role_personal_space_26"), LOADTEXT_TYPE_PLIST)
		end
	elseif slot0.set_btn_list[2] then
		slot0.set_btn_list[2].label:setString(TI18N("关注"))
		slot0.set_btn_list[2].btn:loadTexture(PathTool.getResFrame("rolepersonalspace", "role_personal_space_23"), LOADTEXT_TYPE_PLIST)
	end

	if slot0.attr_item_list[3] then
		slot0.attr_item_list[3].attr_value:setString(slot1)
	end
end

function RolePersonalSpaceTabInfoPanel.updateMySelfHeroInfo(slot0, slot1)
	if not slot1 then
		return
	end

	slot5 = 0
	slot12 = math.min(6 * 116, slot0.scroll_view_size.width)

	slot0.scroll_view:setInnerContainerSize(cc.size(slot12, slot0.scroll_view_size.height))

	slot7 = {
		[slot12.pos] = slot12.id
	}

	for slot11, slot12 in ipairs(slot1.pos_info) do
		-- Nothing
	end

	slot0.hero_list = {}

	for slot12 = 1, 6 do
		hero_item = HeroExhibitionItem.new(0.9, true)

		hero_item:addCallBack(function ()
			uv0:onClickHeroItemByIndex(uv1)
		end)

		if slot7[slot12] then
			if HeroController:getInstance():getModel():getHeroById(slot7[slot12]) then
				slot0.hero_list[slot12] = slot13

				hero_item:setPosition(slot5 + slot2 * 0.5 + (slot12 - 1) * slot2, slot0.scroll_view_size.height * 0.5)
				hero_item:setData(slot13)
				hero_item:showAddIcon(false)
				hero_item:setBgOpacity(255)
				slot0.scroll_view:addChild(hero_item)
			else
				hero_item:setData(nil)
				hero_item:showAddIcon(true)
				hero_item:setBgOpacity(128)
			end
		else
			hero_item:setData(nil)
			hero_item:setBgOpacity(128)
			hero_item:showAddIcon(true)
			hero_item:setPosition(slot5 + slot2 * 0.5 + (slot12 - 1) * slot2, slot0.scroll_view_size.height * 0.5)
			slot0.scroll_view:addChild(hero_item)
		end
	end
end

function RolePersonalSpaceTabInfoPanel.updateOtherHeroInfo(slot0)
	if not slot0.parent then
		return
	end

	if not slot0.parent.other_data then
		return
	end

	slot4 = 0

	slot0.scroll_view:setInnerContainerSize(cc.size(math.min(6 * 116, slot0.scroll_view_size.width), slot0.scroll_view_size.height))

	slot0.hero_list = {}
	slot6 = slot0.parent.other_data.rid
	slot7 = slot0.parent.other_data.srv_id
	slot9 = {
		[slot14.pos] = slot14
	}

	for slot13, slot14 in ipairs(slot0.parent.other_data.room_partner_list) do
		-- Nothing
	end

	for slot13 = 1, 6 do
		hero_item = HeroExhibitionItem.new(0.9, true)

		hero_item:addCallBack(function ()
			uv0:onClickHeroItemByIndex(uv1)
		end)

		if slot9[slot13] then
			if hero_model:getHeroById(slot9[slot13]) then
				slot0.hero_list[slot13] = slot14

				hero_item:setPosition(slot4 + slot1 * 0.5 + (slot13 - 1) * slot1, slot0.scroll_view_size.height * 0.5)
				hero_item:setData(slot14)
				hero_item:showAddIcon(false)
				hero_item:setBgOpacity(255)
				slot0.scroll_view:addChild(hero_item)
			else
				hero_item:setData(nil)
				hero_item:showAddIcon(true)
				hero_item:setBgOpacity(128)
			end
		else
			hero_item:setData(nil)
			hero_item:setBgOpacity(128)
			hero_item:showAddIcon(true)
			hero_item:setPosition(slot4 + slot1 * 0.5 + (slot13 - 1) * slot1, slot0.scroll_view_size.height * 0.5)
			slot0.scroll_view:addChild(hero_item)
		end
	end

	for slot13, slot14 in ipairs(slot8) do
		slot0.hero_list[slot13] = slot14
	end
end

function RolePersonalSpaceTabInfoPanel.updateHeadBg(slot0, slot1)
	if Config.AvatarData.data_avatar[slot1] then
		slot0.role_head:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot2.res_id or 1), false, false), nil, false, slot2.offy)
		slot0.role_head:setHeadBgScale(1)
		slot0.role_head:setEffectBgScale(1)
	end
end

function RolePersonalSpaceTabInfoPanel.updateHonorInfo(slot0, slot1)
	if not slot1 then
		return
	end

	if Config.HonorData.data_title[slot1] and slot2.res_id then
		slot0.item_load_title = createResourcesLoad(PathTool.getTargetRes("honor", "txt_cn_honor_" .. slot2.res_id, false, false), ResourcesType.single, function ()
			if not tolua.isnull(uv0.honor_img) then
				loadSpriteTexture(uv0.honor_img, uv1, LOADTEXT_TYPE)
			end
		end, slot0.item_load_title)
	end
end

function RolePersonalSpaceTabInfoPanel.updateComboboxList(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	if slot0.combobox_scrollview == nil then
		slot0.combobox_scrollview = CommonScrollViewSingleLayout.new(slot0.combobox_panel, cc.p(4, 3), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.combobox_max_size, {
			start_y = 0,
			once_num = 1,
			start_x = 2,
			row = 1,
			delay = 1,
			space_x = 0,
			item_width = 165,
			space_y = 0,
			col = 1,
			item_height = 42
		}, cc.p(0, 0))

		slot0.combobox_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.combobox_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.combobox_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	if next(slot1) ~= nil then
		if #slot1 > 4 then
			slot0.combobox_scrollview:setClickEnabled(true)
			slot0.combobox_bg:setContentSize(slot0.combobox_bg_size)
		else
			slot0.combobox_scrollview:setClickEnabled(false)
			slot0.combobox_bg:setContentSize(cc.size(slot0.combobox_bg_size.width, slot4 * slot3 + slot0.combobox_bg_size.height - slot0.combobox_max_size.height))
		end

		slot0.show_list = slot1
		slot5 = nil

		for slot9, slot10 in ipairs(slot0.show_list) do
			if slot2 == 1 then
				if slot0.city_config and slot10.province_id and slot0.city_config.province_id == slot10.province_id then
					slot5 = slot9
				end
			elseif slot10.city_id and slot0.city_id and slot0.city_id == slot10.city_id then
				slot5 = slot9
			end
		end

		slot0.combobox_scrollview:reloadData(slot5)
	end
end

function RolePersonalSpaceTabInfoPanel.createNewCell(slot0, slot1, slot2)
	slot3 = ccui.Layout:create()

	slot3:setCascadeOpacityEnabled(true)
	slot3:setAnchorPoint(0.5, 0.5)
	slot3:setTouchEnabled(true)
	slot3:setContentSize(cc.size(slot1, slot2))

	slot4 = cc.size(slot1, slot2 - 2)
	slot3.bg = createImage(slot3, PathTool.getResFrame("common", "common_90058"), 0, 2, cc.p(0, 0), true, 0, true)

	slot3.bg:setContentSize(slot4)
	slot3.bg:setOpacity(90)
	slot3.bg:setCapInsets(cc.rect(15, 15, 1, 1))

	slot3.select_bg = createImage(slot3, PathTool.getResFrame("common", "common_90058_1"), 0, 2, cc.p(0, 0), true, 0, true)

	slot3.select_bg:setContentSize(slot4)
	slot3.select_bg:setCapInsets(cc.rect(8, 10, 2, 1))
	slot3.select_bg:setVisible(false)

	slot3.label = createLabel(22, cc.c4b(255, 249, 218, 255), nil, 10, slot2 * 0.5, "", slot3, nil, cc.p(0, 0.5))
	slot3.mark_img = createSprite(PathTool.getResFrame("common", "common_1043"), slot1 - 10, slot2 * 0.5 + 2, slot3, cc.p(1, 0.5), LOADTEXT_TYPE_PLIST)

	slot3.mark_img:setScale(0.8)
	slot3:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.began then
			uv0.select_bg:setVisible(true)

			uv0.touch_began = slot0:getTouchBeganPosition()
		elseif slot1 == ccui.TouchEventType.moved then
			uv0.select_bg:setVisible(false)
		elseif slot1 == ccui.TouchEventType.ended then
			slot3 = slot0:getTouchEndPosition()

			if uv0.touch_began and slot3 and (math.abs(slot3.x - slot2.x) > 10 or math.abs(slot3.y - slot2.y) > 10) then
				return
			end

			playButtonSound2()
			uv1:setCellTouched(uv0)
		end
	end)

	return slot3
end

function RolePersonalSpaceTabInfoPanel.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function RolePersonalSpaceTabInfoPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	slot1.select_bg:setVisible(false)

	if slot3.province_name then
		slot1.label:setString(slot3.province_name)

		if slot0.city_config and slot0.city_config.province_id == slot3.province_id then
			slot1.mark_img:setVisible(true)
		else
			slot1.mark_img:setVisible(false)
		end
	elseif slot3.city_name then
		slot1.label:setString(slot3.city_name)

		if slot0.city_id and slot0.city_id == slot3.city_id then
			slot1.mark_img:setVisible(true)
		else
			slot1.mark_img:setVisible(false)
		end
	end
end

function RolePersonalSpaceTabInfoPanel.setCellTouched(slot0, slot1)
	if not slot0.show_list[slot1.index] then
		return
	end

	slot0.record_city_id = nil

	if slot3.province_name then
		if Config.RoleData.data_city_list[slot3.province_id] and next(slot4) ~= nil then
			table.sort(slot4, function (slot0, slot1)
				return slot0.city_id < slot1.city_id
			end)
			slot0:setProvinceAndCity(slot4[1].city_id)

			slot0.record_city_id = slot4[1].city_id
		end
	elseif slot3.city_name then
		slot0:setProvinceAndCity(slot3.city_id)

		slot0.record_city_id = slot3.city_id
	end

	if slot0.record_city_id ~= nil then
		uv0:send25800(slot0.record_city_id)
	end

	slot0:onHideComboboxPanel()
end

function RolePersonalSpaceTabInfoPanel.setProvinceAndCity(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.city_id = slot1
	slot0.city_config = Config.RoleData.data_city_id_to_province_id(slot0.city_id)

	if slot0.city_config then
		slot0.province_value:setString(slot0.city_config.province_name)
		slot0.city_value:setString(slot0.city_config.city_name)
	else
		slot0.province_value:setString(TI18N("未设置"))
		slot0.city_value:setString(TI18N("未设置"))
	end
end

function RolePersonalSpaceTabInfoPanel.onShowTipsPanel(slot0, slot1)
	if not slot0.tips_panel then
		return
	end

	if slot1 then
		slot0.tips_panel:setPositionX(252)

		if slot0.tips_label1 == nil then
			slot0.tips_label1 = createRichLabel(20, cc.c4b(224, 191, 152, 255), cc.p(0, 1), cc.p(25, 220), nil, , 240)

			slot0.tips_panel:addChild(slot0.tips_label1)
		end

		slot0.tips_label1:setString(Config.RoleData.data_role_const.fans_tips_text1.desc)

		if slot0.tips_label2 == nil then
			slot0.tips_label2 = createRichLabel(20, cc.c4b(224, 191, 152, 255), cc.p(0, 1), cc.p(25, 86), nil, , 240)

			slot0.tips_panel:addChild(slot0.tips_label2)
		end

		slot0.tips_label2:setString(Config.RoleData.data_role_const.fans_tips_text2.desc)

		if slot0.my_rank == nil then
			slot0.my_rank = createRichLabel(20, cc.c4b(255, 125, 39, 255), cc.p(0, 1), cc.p(25, 20), nil, , 600)

			slot0.tips_panel:addChild(slot0.my_rank)
		end

		if Config.AvatarData.data_avatar[(Config.RoleData.data_role_const.fans_avatar_id or {}).val] then
			if not slot0.item_load_tips then
				slot0.item_load_tips = loadSpriteTextureFromCDN(slot0.tips_title_img, PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot5.res_id or 1), false, false), ResourcesType.single, slot0.item_load_tips)
			end

			slot0.tips_name:setString(slot5.name)
		end

		if slot0.parent.role_type == RoleConst.role_type.eMySelf then
			if slot0.rank_btn == nil then
				slot0.rank_btn = createRichLabel(22, cc.c3b(36, 144, 3), cc.p(0, 1), cc.p(286, 20))

				slot0.rank_btn:setString(uv0("<div href=xxx>%s</div>", TI18N("前往排行榜")))
				slot0.tips_panel:addChild(slot0.rank_btn)
				slot0.rank_btn:addTouchLinkListener(function (slot0, slot1, slot2, slot3)
					RankController:getInstance():openRankView(true, RankConstant.RankType.fans)
				end, {
					"click",
					"href"
				})
			end

			if not slot0.init_rank_data then
				uv1:send25802()

				slot0.init_rank_data = true
			end
		elseif slot0.parent.other_data then
			if slot0.parent.other_data.fans_rank and slot0.parent.other_data.fans_rank == 0 then
				slot0.my_rank:setString(TI18N("他的排名:未上榜"))
			else
				slot0.my_rank:setString(uv0(TI18N("他的排名:%s"), slot0.parent.other_data.fans_rank))
			end
		end
	else
		slot0.tips_panel:setPositionX(-10000)
	end
end

function RolePersonalSpaceTabInfoPanel.updateMyRankInfo(slot0, slot1)
	if slot0.my_rank then
		if slot1.rank == 0 then
			slot0.my_rank:setString(TI18N("我的排名:未上榜"))
		else
			slot0.my_rank:setString(uv0(TI18N("我的排名:%s"), slot1.rank))
		end
	end
end

function RolePersonalSpaceTabInfoPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)

	if slot1 then
		GlobalEvent:getInstance():Fire(RoleEvent.ROLE_PS_CHANGE_PANEL_EVENT)

		if not slot0.is_init then
			slot0:setData()
		end
	end
end

function RolePersonalSpaceTabInfoPanel.DeleteMe(slot0)
	if slot0.get_title_list_event then
		GlobalEvent:getInstance():UnBind(slot0.get_title_list_event)

		slot0.get_title_list_event = nil
	end

	if slot0.use_title_event then
		GlobalEvent:getInstance():UnBind(slot0.use_title_event)

		slot0.use_title_event = nil
	end

	if slot0.form_drama_event then
		GlobalEvent:getInstance():UnBind(slot0.form_drama_event)

		slot0.form_drama_event = nil
	end

	if slot0.role_fans_rank_event then
		GlobalEvent:getInstance():UnBind(slot0.role_fans_rank_event)

		slot0.role_fans_rank_event = nil
	end

	if slot0.All_Feedback_Event_Data then
		GlobalEvent:getInstance():UnBind(slot0.All_Feedback_Event_Data)

		slot0.All_Feedback_Event_Data = nil
	end

	if slot0.role_city_event then
		GlobalEvent:getInstance():UnBind(slot0.role_city_event)

		slot0.role_city_event = nil
	end

	if slot0.update_fun_form then
		GlobalEvent:getInstance():UnBind(slot0.update_fun_form)

		slot0.update_fun_form = nil
	end

	if slot0.role_follow_event then
		GlobalEvent:getInstance():UnBind(slot0.role_follow_event)

		slot0.role_follow_event = nil
	end

	if slot0.item_load_tips then
		slot0.item_load_tips:DeleteMe()

		slot0.item_load_tips = nil
	end

	if slot0.item_load_title then
		slot0.item_load_title:DeleteMe()

		slot0.item_load_title = nil
	end

	if slot0.item_load_title_img_res then
		slot0.item_load_title_img_res:DeleteMe()

		slot0.item_load_title_img_res = nil
	end

	if slot0.combobox_scrollview then
		slot0.combobox_scrollview:DeleteMe()

		slot0.combobox_scrollview = nil
	end

	if slot0.role_update_event and slot0.role_vo then
		slot0.role_update_event = slot0.role_vo:UnBind(slot0.role_update_event)
		slot0.role_update_event = nil
	end
end
