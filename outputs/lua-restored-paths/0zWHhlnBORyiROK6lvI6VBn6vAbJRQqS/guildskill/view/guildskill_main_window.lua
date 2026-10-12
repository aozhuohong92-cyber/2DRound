GuildskillMainWindow = GuildskillMainWindow or BaseClass(BaseView)
slot1 = GuildskillController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format
slot4 = RoleController:getInstance():getRoleVo()
slot5 = BackpackController:getInstance():getModel()

function GuildskillMainWindow.__init(slot0)
	slot0.win_type = WinType.Full
	slot0.is_full_screen = true
	slot0.tab_list = {}
	slot0.attr_list = {}
	slot0.item_list = {}
	slot0.singe_att_list = {}
	slot0.attr_value_list = {}
	slot0.cur_info_group_id = 0
	slot0.backpack_item_list = {}
	slot0.upgrade_cost_list = {}
	slot0.cur_index = 1
	slot0.layout_name = "guildskill/guildskill_main_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("guildskill", "guildskill"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("guildskill", "guild_skill_bg", true),
			type = ResourcesType.single
		}
	}
	slot0.pvp_max_lv = 160

	if Config.GuildSkillData.data_const.pvp_max_lv then
		slot0.pvp_max_lv = slot1.val
	end

	slot0.pvp_item_pos_list = {
		{
			151,
			226
		},
		{
			220,
			385
		},
		{
			454,
			386
		},
		{
			524,
			227
		}
	}
	slot0.actin_pvp_item_pos_list = {
		{
			115,
			252
		},
		{
			195,
			410
		},
		{
			482,
			410
		},
		{
			561,
			246
		}
	}
	slot0.actin_item_pos_list = {
		{
			338,
			388
		},
		{
			490,
			298
		},
		{
			489,
			168
		},
		{
			338,
			80
		},
		{
			190,
			168
		},
		{
			190,
			306
		}
	}
	slot0.handle_pos = cc.p(315, 32)
	slot0.pvp_handle_pos = cc.p(544, 44)
	slot0.cost_pos = {
		cc.p(138, 97),
		cc.p(491, 97)
	}
	slot0.pvp_cost_pos = {
		cc.p(87, 46),
		cc.p(306, 46)
	}
	slot0.box_pos_height = 122
	slot0.pvp_box_pos_height = 165
	slot0.attr_pos_x = {}
	slot0.pvp_attr_pos_x = {
		80,
		330,
		nil,
		80,
		330
	}
	slot0.single_item_pos_y = 0
	slot0.pvp_single_item_pos_y = 292
	slot0.is_pvp_show = true
	slot0.pvp_select_index = 1
	slot0.career_action_list = {
		[GuildskillConst.index.physics] = {
			"action1",
			"action5",
			"action11",
			"action55"
		},
		[GuildskillConst.index.defence] = {
			"action2",
			"action6",
			"action22",
			"action66"
		},
		[GuildskillConst.index.assist] = {
			"action3",
			"action7",
			"action33",
			"action77"
		},
		[GuildskillConst.index.magic] = {
			"action4",
			"action8",
			"action44",
			"action88"
		}
	}
	slot0.pvp_icon_res = {
		[GuildskillConst.index.physics] = {
			"guildskill_3_6",
			"guildskill_3_6",
			"guildskill_3_2",
			"guildskill_3_3"
		},
		[GuildskillConst.index.magic] = {
			"guildskill_2_6",
			"guildskill_2_6",
			"guildskill_2_2",
			"guildskill_2_3"
		},
		[GuildskillConst.index.defence] = {
			"guildskill_4_6",
			"guildskill_4_6",
			"guildskill_4_1",
			"guildskill_4_4"
		},
		[GuildskillConst.index.assist] = {
			"guildskill_5_6",
			"guildskill_5_6",
			"guildskill_5_1",
			"guildskill_5_7"
		}
	}
end

function GuildskillMainWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")
	slot7 = "guild_skill_bg"

	slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("guildskill", slot7, true), LOADTEXT_TYPE)
	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.container_size = slot0.main_container:getContentSize()

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.top_panel = slot0.main_container:getChildByName("top_panel")
	slot0.bottom_panel = slot0.main_container:getChildByName("bottom_panel")
	slot0.title_name = slot0.top_panel:getChildByName("title_name")

	slot0.title_name:setString(TI18N("公会技能"))
	UITool.SetTitleColor(slot0.title_name)

	slot0.explain_btn = slot0.top_panel:getChildByName("explain_btn")
	slot0.change_btn = slot0.top_panel:getChildByName("change_btn")

	for slot7 = 1, 4 do
		if slot0.top_panel:getChildByName("tab_container"):getChildByName("tab_btn_" .. slot7) then
			slot9 = slot8:getChildByName("title")

			slot8:getChildByName("select_bg"):setVisible(false)
			slot9:setString(({
				TI18N("战士职业"),
				TI18N("法师职业"),
				TI18N("坦克职业"),
				TI18N("辅助职业")
			})[slot7] or "")

			slot13 = ({
				GuildskillConst.index.physics,
				GuildskillConst.index.magic,
				GuildskillConst.index.defence,
				GuildskillConst.index.assist
			})[slot7] or GuildskillConst.index.physics

			slot9:setTextColor(cc.c4b(255, 255, 255, 255))
			slot9:enableOutline(cc.c4b(2, 0, 25, 255))

			slot8.select_bg = slot11
			slot8.career = slot13
			slot8.label = slot9
			slot8.tips = slot8:getChildByName("tips")
			slot8.index = slot7
			slot0.tab_list[slot13] = slot8
		end
	end

	slot0.career_desc = createRichLabel(24, cc.c3b(211, 186, 128), cc.p(0.5, 0.5), cc.p(360, -36), nil, nil, 500)

	slot0.top_panel:addChild(slot0.career_desc)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.middle_bg = slot0.main_panel:getChildByName("middle_bg")
	slot0.middle_icon = slot0.main_panel:getChildByName("middle_icon")
	slot0.power_click = slot0.top_panel:getChildByName("power_click")
	slot0.score_title = slot0.power_click:getChildByName("score_title")

	slot0.score_title:setString(TI18N("PVP战力："))

	slot0.fight_label = CommonNum.new(20, slot0.power_click, 99999, -2, cc.p(0.5, 0.5))

	slot0.fight_label:setPosition(148, 29)

	slot7 = "selected"
	slot0.selected = slot0.main_panel:getChildByName(slot7)

	breatheShineAction(slot0.selected)

	for slot7 = 1, 6 do
		if slot0.main_panel:getChildByName("item_" .. slot7) then
			if slot7 <= 4 then
				registerButtonEventListener(slot9, function ()
					uv0:onItemBtn(uv1)
				end, true, 2)
			end

			slot0.item_list[slot7] = {
				node = slot9,
				lev = slot0.main_panel:getChildByName("item_lev_" .. slot7),
				index = slot7,
				x = slot9:getPositionX(),
				y = slot9:getPositionY(),
				status = nil,
				data = nil,
				config = nil
			}
		end
	end

	slot0.single_item_attr_container = slot0.main_panel:getChildByName("single_item_attr_container")
	slot0.single_item_pos_y = slot0.single_item_attr_container:getPositionY()
	slot0.attr_title = slot0.single_item_attr_container:getChildByName("attr_title")
	slot0.attr_value = slot0.single_item_attr_container:getChildByName("attr_value")
	slot0.lev_upgrade_model = slot0.main_panel:getChildByName("lev_upgrade_model")
	slot0.box_bg = slot0.bottom_panel:getChildByName("box_bg")
	slot0.Sprite_5 = slot0.bottom_panel:getChildByName("Sprite_5")
	slot0.close_btn = slot0.bottom_panel:getChildByName("close_btn")
	slot0.reset_btn = slot0.bottom_panel:getChildByName("reset_btn")
	slot0.reset_btn_label = slot0.reset_btn:getChildByName("label")

	slot0.reset_btn_label:setPositionX(26)
	slot0.reset_btn_label:setString("")

	slot0.attr_desc = slot0.bottom_panel:getChildByName("attr_desc")

	slot0.attr_desc:setString(TI18N([[
加
成
总
览]]))

	slot0.scroll_view = slot0.bottom_panel:getChildByName("scroll_view")

	slot0.scroll_view:setScrollBarEnabled(false)

	slot4 = slot0.scroll_view:getContentSize()
	slot6 = 0
	slot7 = 0

	if Config.GuildSkillData.data_const["attr_show_" .. slot0.cur_index] and slot5.val then
		slot8 = math.ceil(#slot5.val / 3)
		slot17 = cc.size

		slot0.scroll_view:setInnerContainerSize(slot17(slot4.width, math.max(slot8 * 42 + (slot8 + 1) * 13, slot4.height)))

		for slot17, slot18 in ipairs(slot5.val) do
			if slot17 == 3 or slot17 == 6 then
				slot6 = (slot17 - 1) % 3 * (200 + 8) - 16
			end

			slot0.attr_pos_x[slot17] = slot6 + 6
			slot0.attr_list[slot17] = createRichLabel(22, cc.c3b(111, 79, 63), cc.p(0, 0.5), cc.p(slot0.attr_pos_x[slot17], slot13 - (7 + slot10 * 0.5 + math.floor((slot17 - 1) / 3) * (slot10 + slot12)) - 2))

			slot0.scroll_view:addChild(slot0.attr_list[slot17])
		end
	end

	slot0.pvp_explain_btn = slot0.bottom_panel:getChildByName("pvp_explain_btn")
	slot0.cost_container = slot0.bottom_panel:getChildByName("cost_container")
	slot0.handle_btn = slot0.cost_container:getChildByName("handle_btn")
	slot0.handle_btn_label = slot0.handle_btn:getChildByName("label")
	slot11 = ""

	slot0.handle_btn_label:setString(slot11)
	UITool.SetTitleColor(slot0.handle_btn_label)

	slot0.cost_bg_list = {}

	for slot11 = 1, 2 do
		slot12 = slot0.cost_container:getChildByName("cost_bg_" .. slot11)
		slot0.cost_bg_list[slot11] = {
			cost_bg = slot12,
			cost_icon = slot12:getChildByName("cost_icon"),
			cost_txt = slot12:getChildByName("cost_txt")
		}

		UITool.SetLightColor(slot0.cost_bg_list[slot11].cost_txt)
	end

	slot0:adaptationScreen()
end

function GuildskillMainWindow.adaptationScreen(slot0)
	slot1 = display.getTop(slot0.main_container)
	slot2 = display.getBottom(slot0.main_container)
	slot3 = display.getLeft(slot0.main_container)
	slot4 = display.getRight(slot0.main_container)

	slot0.top_panel:setPositionY(slot1 - (slot0.container_size.height - slot0.top_panel:getPositionY()))

	slot7 = slot0.power_click:getPositionY()

	if slot1 - slot0.container_size.height > 16 then
		slot6 = 16
	elseif slot6 < 0 then
		slot6 = 0
	end

	slot0.power_click:setPositionY(slot7 - slot6)
	slot0.bottom_panel:setPositionY(slot2 + slot0.bottom_panel:getPositionY())
end

function GuildskillMainWindow.register_event(slot0)
	registerButtonEventListener(slot0.explain_btn, function (slot0, slot1, slot2)
		if Config.GuildSkillData.data_const.game_rule then
			TipsManager:getInstance():showCommonTips(slot3.desc, slot1:getTouchBeganPosition(), nil, nil, 500)
		end
	end, true, 1)

	function slot4(slot0, slot1, slot2)
		if Config.GuildSkillData.data_const.pvp_game_rule then
			TipsManager:getInstance():showCommonTips(slot3.desc, slot1:getTouchBeganPosition(), nil, nil, 500)
		end
	end

	slot5 = true

	registerButtonEventListener(slot0.pvp_explain_btn, slot4, slot5, 1, nil, 0.8)

	for slot4, slot5 in pairs(slot0.tab_list) do
		slot5:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playTabButtonSound()
				uv0:changeSelectedTab(uv1.career, uv1.index)
			end
		end)
	end

	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openGuildSkillMainWindow(false)
	end, true, 2)
	registerButtonEventListener(slot0.reset_btn, function ()
		uv0:onResetBtn()
	end, true, 2)
	registerButtonEventListener(slot0.handle_btn, function ()
		uv0:onHandleBtn()
	end, true, 2)
	registerButtonEventListener(slot0.change_btn, function ()
		uv0:onChangeBtn()
	end, true, 2)
	slot0:addGlobalEvent(GuildskillEvent.UpdateGuildSkillEvent, function (slot0)
		if uv0.selected_tab and uv0.selected_tab.career == slot0 then
			uv0:updateShowSkillInfo(slot0)
		end
	end)
	slot0:addGlobalEvent(GuildskillEvent.Guild_Pvp_Skill_Info_Event, function ()
		if uv0.selected_tab then
			uv0:updateShowSkillInfo(uv0.selected_tab.career)
		end
	end)
	slot0:addGlobalEvent(GuildskillEvent.Guild_Pvp_Career_Info_Event, function (slot0)
		if uv0.selected_tab and uv0.selected_tab.career == slot0 then
			uv0:updatePvPSkillList(slot0)
		end
	end)
	slot0:addGlobalEvent(GuildskillEvent.Guild_Pvp_Career_Update_Event, function (slot0, slot1, slot2)
		if uv0.selected_tab and uv0.selected_tab.career == slot0 then
			uv0:updatePowerInfo(slot0, slot1, slot2)
		end
	end)
	slot0:addGlobalEvent(GuildskillEvent.Guild_Pvp_Career_Break_Event, function (slot0)
		if uv0.selected_tab and uv0.selected_tab.career == slot0 then
			if uv1:getPvpskillInfoByCareer(slot0) and #slot1.attr_formation ~= 0 then
				uv0.is_pvp_show = true
			end

			uv0:updateShowSkillInfo(slot0)
		end
	end)
	slot0:addGlobalEvent(GuildskillEvent.ResetGuildSkillEvent, function (slot0)
		if uv0.selected_tab and uv0.selected_tab.career == slot0 then
			uv0:updateSkillList(slot0, nil, true)
		end
	end)

	if slot0.update_skillstatus_event == nil then
		slot0.update_skillstatus_event = GlobalEvent:getInstance():Bind(GuildskillEvent.UpdateSkillStatusEvent, function (slot0, slot1)
			if uv0.selected_tab and uv0.selected_tab.career == slot0 then
				uv0:updateGotoeLabelShowStatus(slot0)
				uv0:updateSkillItemById(slot1)
			end
		end)
	end

	if slot0.update_skillupgrade_event == nil then
		slot0.update_skillupgrade_event = GlobalEvent:getInstance():Bind(GuildskillEvent.UpdateSkilUpgradeEvent, function (slot0, slot1)
			if uv0.selected_tab and uv0.selected_tab.career == slot0 then
				uv0:updateSkillList(slot0, true)
			end
		end)
	end

	if slot0.update_guild_skill_red_event == nil then
		slot0.update_guild_skill_red_event = GlobalEvent:getInstance():Bind(GuildEvent.UpdateGuildRedStatus, function (slot0, slot1)
			uv0:updateGuildSkillRed(slot0, slot1)
		end)
	end

	if uv2 and slot0.update_role_assets_event == nil then
		slot0.update_role_assets_event = uv2:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if uv0.selected_item and uv0.upgrade_cost_list then
				if uv0.upgrade_cost_list.base_list and uv0.upgrade_cost_list.base_list[slot0] then
					uv0:updateCostInfo()
				elseif uv0.upgrade_cost_list.asset_list and uv0.upgrade_cost_list.asset_list[slot0] then
					uv0:updateCostInfo()
				end
			end
		end)
	end

	if slot0.add_item_data_event == nil then
		slot0.add_item_data_event = GlobalEvent:getInstance():Bind(BackpackEvent.ADD_GOODS, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
				return
			end

			uv0:updateCostInfo()
		end)
	end

	if slot0.update_item_data_event == nil then
		slot0.update_item_data_event = GlobalEvent:getInstance():Bind(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
				return
			end

			uv0:updateCostInfo()
		end)
	end
end

function GuildskillMainWindow.updatePowerInfo(slot0, slot1, slot2, slot3)
	if not slot1 then
		return
	end

	if not uv0:getPvpskillInfoByCareer(slot1) then
		return
	end

	slot6 = 0

	for slot10, slot11 in ipairs(slot4.attr_formation) do
		if Config.GuildSkillData.data_pvp_attr_info(getNorKey(slot11.id, slot11.lev)) then
			slot5 = 0 + slot13.power
		end

		if slot2 == 2 and slot3 == slot11.id then
			if Config.GuildSkillData.data_pvp_attr_info(getNorKey(slot11.id, slot11.lev - 1)) then
				slot6 = slot13.power - slot15.power
			else
				return
			end
		end
	end

	if Config.GuildSkillData.data_pvp_skill_info(getNorKey(slot1, slot4.skill_lev)) then
		slot5 = slot5 + slot8.power

		if slot2 == 1 then
			if Config.GuildSkillData.data_pvp_skill_info(getNorKey(slot1, slot4.skill_lev - 1)) then
				slot6 = slot8.power - slot10.power
			else
				return
			end
		end
	end

	if slot6 <= 0 then
		return
	end

	GlobalMessageMgr:getInstance():showPowerMove(slot6, PathTool.getResFrame("common", "txt_cn_common_90002_1"), slot5 - slot6, {
		res_offset_x = -30
	})
end

function GuildskillMainWindow.onResetBtn(slot0)
	if slot0.selected_tab and slot0.selected_tab.career then
		if slot0.is_pvp_show then
			for slot6, slot7 in ipairs(uv0:getPvpskillInfoByCareer(slot0.selected_tab.career).attr_formation) do
				slot2 = 0 + slot7.lev
			end

			if slot2 > 0 then
				GuildskillController:getInstance():openGuildskillResetPanel(true, slot0.selected_tab.career, 2)
			end
		elseif uv0:getCareerSkillInfo(slot0.selected_tab.career) and slot1.had_skill_up then
			GuildskillController:getInstance():openGuildskillResetPanel(true, slot0.selected_tab.career, 1)
		end
	end
end

function GuildskillMainWindow.onChangeBtn(slot0)
	if slot0.is_show_action then
		return
	end

	if slot0.selected_tab and slot0.selected_tab.career then
		slot1 = slot0.selected_tab.career
		slot3 = uv0:getCareerSkillInfo(slot1)

		if not uv0:getPvpskillInfoByCareer(slot1) then
			return
		end

		if not slot3 then
			return
		end

		if #slot2.attr_formation == 0 then
			slot5 = 40

			if Config.GuildSkillData.data_const.max_lv then
				slot5 = slot4.val
			end

			message(uv1(TI18N("本系技能达%s重天时开启"), slot5))

			return
		end

		slot0.is_pvp_show = not slot0.is_pvp_show

		slot0:changeShowSkillInfo(slot1, true)
	end
end

function GuildskillMainWindow.updateChangeBtnImg(slot0)
	slot1 = nil

	if slot0.record_chang_btn_res ~= ((not slot0.is_pvp_show or PathTool.getResFrame("guildskill", "txt_cn_guildskill_905")) and PathTool.getResFrame("guildskill", "txt_cn_guildskill_906")) then
		slot0.record_chang_btn_res = slot1

		slot0.change_btn:loadTexture(slot1, LOADTEXT_TYPE_PLIST)
	end
end

function GuildskillMainWindow.onHandleBtn(slot0)
	if slot0.is_pvp_show then
		if slot0.selected_item and slot0.selected_item.data and slot0.selected_tab and slot0.selected_tab.career then
			uv0:send23707(slot0.selected_tab.career, slot0.selected_item.data.id)
		end
	elseif slot0.selected_item and slot0.selected_item.data and slot0.selected_item.config then
		if slot0.selected_item.config.lev >= 20 and slot0.selected_item.data.status == GuildskillConst.status.activity then
			if slot0.selected_tab and slot0.selected_tab.career then
				uv0:send23706(slot0.selected_tab.career)
			end
		else
			uv0:requestActivitySkill(slot0.selected_item.data.id)
		end
	end
end

function GuildskillMainWindow.onClickPvpSkillItem(slot0)
	if slot0.is_pvp_show and slot0.selected_tab and slot0.selected_tab.career then
		uv0:openGuildskillLevelUpPanel(true, slot0.selected_tab.career)
	end
end

function GuildskillMainWindow.onItemBtn(slot0, slot1)
	slot0.selected_item = slot0.item_list[slot1]

	if slot0.selected_item == nil then
		return
	end

	slot0.pvp_select_index = slot1

	if not tolua.isnull(slot0.selected_item.node) and slot0.pvp_item_pos_list[slot1] then
		slot0.selected:setPosition(slot0.pvp_item_pos_list[slot1][1], slot0.pvp_item_pos_list[slot1][2])
	end

	slot3 = slot0.selected_item.data

	if slot0.selected_item.config and slot3 then
		if slot2.client_attr and type(slot2.client_attr[1]) == "table" and #slot2.client_attr[1] >= 2 then
			if Config.GuildSkillData.data_pvp_attr_info(getNorKey(slot3.id, slot3.lev + 1)) then
				if slot5.client_attr and type(slot5.client_attr[1]) == "table" and #slot5.client_attr[1] >= 2 then
					slot0:updateSingleAttr(slot2.client_attr[1][1], slot5.client_attr[1][2] - slot2.client_attr[1][2], slot2.desc)
				end
			else
				slot0:updateSingleAttr(slot2.client_attr[1][1], slot2.client_attr[1][2], slot2.desc)
			end
		end

		slot0:updateCostInfo()
	end
end

function GuildskillMainWindow.openRootWnd(slot0, slot1)
	RoleController:getInstance():sender10986(RoleConst.red_point.red_point_2)
	RoleController:getInstance():getModel():updateRedPointData(RoleConst.red_point.red_point_2)
	GuildController:getInstance():getModel():updateGuildRedStatus(GuildConst.red_index.all_skill, false)

	slot2 = 1

	if slot0.tab_list[slot1 or GuildskillConst.index.physics] then
		slot2 = slot0.tab_list[slot1].index
	end

	slot0:changeSelectedTab(slot1, slot2)
	slot0:updateGuildSkillRed()
end

function GuildskillMainWindow.updateGuildSkillRed(slot0, slot1, slot2)
	if slot1 == nil then
		for slot6, slot7 in pairs(slot0.tab_list) do
			if slot7.tips then
				slot7.tips:setVisible(uv0:getRedStatus(slot7.career))
			end
		end
	elseif slot1 == GuildConst.red_index.skill_2 or slot1 == GuildConst.red_index.pvp_skill_2 then
		if slot0.tab_list[GuildskillConst.index.magic] and slot3.tips then
			slot3.tips:setVisible(slot2)
		end
	elseif slot1 == GuildConst.red_index.skill_3 or slot1 == GuildConst.red_index.pvp_skill_3 then
		if slot0.tab_list[GuildskillConst.index.physics] and slot3.tips then
			slot3.tips:setVisible(slot2)
		end
	elseif slot1 == GuildConst.red_index.skill_4 or slot1 == GuildConst.red_index.pvp_skill_4 then
		if slot0.tab_list[GuildskillConst.index.defence] and slot3.tips then
			slot3.tips:setVisible(slot2)
		end
	elseif (slot1 == GuildConst.red_index.skill_5 or slot1 == GuildConst.red_index.pvp_skill_5) and slot0.tab_list[GuildskillConst.index.assist] and slot3.tips then
		slot3.tips:setVisible(slot2)
	end
end

function GuildskillMainWindow.changeSelectedTab(slot0, slot1, slot2)
	if slot0.is_show_action then
		return
	end

	if slot0.selected_tab ~= nil and slot0.selected_tab.career == slot1 then
		return
	end

	slot0.cur_index = slot2

	if slot0.selected_tab then
		slot0.selected_tab.select_bg:setVisible(false)

		slot0.selected_tab = nil
	end

	slot0.selected_tab = slot0.tab_list[slot1]

	if slot0.selected_tab then
		slot0.selected_tab.select_bg:setVisible(true)
	end

	if uv0:getCareerSkillInfo(slot1) == nil then
		uv1:requestCareerSkillInfo(slot1)
	elseif uv0:getPvpskillInfo() ~= nil then
		slot0:updateShowSkillInfo(slot1)
	end
end

function GuildskillMainWindow.updateShowSkillInfo(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot3 = uv0:getCareerSkillInfo(slot1)

	if not uv0:getPvpskillInfoByCareer(slot1) then
		return
	end

	if not slot3 then
		return
	end

	slot4 = false

	if not slot0.is_first_show then
		slot0.is_first_show = true
		slot4 = true
	end

	if #slot2.attr_formation == 0 then
		if slot0.is_pvp_show then
			slot4 = true
		end

		slot0.is_pvp_show = false
	end

	slot0:changeShowSkillInfo(slot1, slot4)
end

function GuildskillMainWindow.changeShowSkillInfo(slot0, slot1, slot2)
	slot0:updateChangeBtnImg()

	if slot0.is_pvp_show then
		slot0.power_click:setVisible(true)
		slot0.pvp_explain_btn:setVisible(true)
		slot0.handle_btn:setPosition(slot0.pvp_handle_pos)

		slot6 = cc.size

		slot0.box_bg:setContentSize(slot6(678, slot0.pvp_box_pos_height))

		for slot6, slot7 in ipairs(slot0.cost_bg_list) do
			if slot0.pvp_cost_pos[slot6] then
				slot7.cost_bg:setPosition(slot0.pvp_cost_pos[slot6])
			end
		end

		if slot0.max_lev_label then
			slot0.max_lev_label:setVisible(false)
		end

		slot0.single_item_attr_container:setPositionY(slot0.pvp_single_item_pos_y)
		slot0:updatePvPSkillList(slot1, slot2)

		if slot0.levupgrade_effect then
			slot0.levupgrade_effect:setVisible(false)
		end
	else
		slot0.power_click:setVisible(false)
		slot0.pvp_explain_btn:setVisible(false)
		slot0.handle_btn:setPosition(slot0.handle_pos)

		slot6 = cc.size

		slot0.box_bg:setContentSize(slot6(678, slot0.box_pos_height))

		for slot6, slot7 in ipairs(slot0.cost_bg_list) do
			if slot0.cost_pos[slot6] then
				slot7.cost_bg:setPosition(slot0.cost_pos[slot6])
			end
		end

		if slot0.pvp_max_lev_label then
			slot0.pvp_max_lev_label:setVisible(false)
		end

		if slot0.pvp_skill_item then
			slot0.pvp_skill_item:setVisible(false)
		end

		if slot0.pvp_tips_lable then
			slot0.pvp_tips_lable:setVisible(false)
		end

		if slot0.show_pvp_tips then
			slot0.show_pvp_tips:setVisible(false)
		end

		slot0.single_item_attr_container:setPositionY(slot0.single_item_pos_y)
		slot0:updateSkillList(slot1, nil, true)
	end

	uv0:updateGuildRedStatus(uv0:getCareerKey(slot1), false)
	slot0:updateMiddleBg(slot1, slot2)
	slot0:updateSkillItemIcon(slot1, slot2)
end

function GuildskillMainWindow.updateSkillItemIcon(slot0, slot1, slot2)
	slot3 = ""

	if slot2 and slot0.selected then
		slot0.is_show_action = true

		slot0.selected:setVisible(false)
		slot0.selected:runAction(cc.Sequence:create(cc.DelayTime:create(0.5), cc.CallFunc:create(function ()
			uv0.is_show_action = false

			uv0.selected:setVisible(true)
		end)))
	end

	for slot7, slot8 in ipairs(slot0.item_list) do
		if slot0.is_pvp_show then
			if not tolua.isnull(slot8.node) then
				if slot7 > 4 then
					slot8.node:setVisible(false)
					slot8.lev:setVisible(false)
				else
					if slot0.pvp_icon_res[slot1] then
						slot3 = slot0.pvp_icon_res[slot1][slot7] or "guildskill_2_1"
					end

					slot8.node:loadTexture(PathTool.getResFrame("guildskill", slot3), LOADTEXT_TYPE_PLIST)

					if slot0.pvp_item_pos_list[slot7] then
						slot10 = slot0.actin_pvp_item_pos_list[slot7]

						if slot2 and slot10 then
							if slot10 then
								slot0:attrIconRunAction(slot8.node, slot10[1], slot10[2], slot9[1], slot9[2])
								slot0:attrIconRunAction(slot8.lev, slot10[1], slot10[2] - 37, slot9[1], slot9[2] - 37)
							else
								slot8.node:setPosition(slot9[1], slot9[2])
								slot8.lev:setPosition(slot9[1], slot9[2] - 37)
							end
						else
							slot8.node:setPosition(slot9[1], slot9[2])
							slot8.lev:setPosition(slot9[1], slot9[2] - 37)
						end
					end
				end
			end
		elseif not tolua.isnull(slot8.node) then
			slot8.node:loadTexture(PathTool.getResFrame("guildskill", uv0("guildskill_%s_%s", slot1, slot7)), LOADTEXT_TYPE_PLIST)

			if slot7 > 4 then
				slot8.node:setVisible(true)
				slot8.lev:setVisible(true)
			end

			slot9 = slot0.actin_item_pos_list[slot7]

			if slot2 and slot9 then
				slot0:attrIconRunAction(slot8.node, slot9[1], slot9[2], slot8.x, slot8.y)
				slot0:attrIconRunAction(slot8.lev, slot9[1] - 37, slot9[2], slot8.x, slot8.y - 37)
			else
				slot8.node:setPosition(slot8.x, slot8.y)
				slot8.lev:setPosition(slot8.x, slot8.y - 37)
			end
		end
	end
end

function GuildskillMainWindow.attrIconRunAction(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot1 then
		slot1:setPosition(slot2, slot3)
		slot1:setOpacity(0)
		slot1:setScale(0.6)

		slot6 = 0.2

		slot1:runAction(cc.Sequence:create(cc.DelayTime:create(0.29), cc.Spawn:create(cc.EaseBackOut:create(cc.MoveTo:create(slot6, cc.p(slot4, slot5))), cc.EaseBackOut:create(cc.ScaleTo:create(slot6, 1)), cc.FadeIn:create(slot6))))
	end
end

function GuildskillMainWindow.skillItemRunAction(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot1 then
		slot1:setPosition(slot2, slot3)
		slot1:setOpacity(0)
		slot1:setScale(0.6)

		slot6 = 0.2

		slot1:runAction(cc.Sequence:create(cc.DelayTime:create(0.29), cc.Spawn:create(cc.EaseBackOut:create(cc.MoveTo:create(slot6, cc.p(slot4, slot5))), cc.EaseBackOut:create(cc.ScaleTo:create(slot6, 1)), cc.FadeIn:create(slot6))))
	end
end

function GuildskillMainWindow.updateSkillAttrNameAndVal(slot0, slot1)
	if slot0.is_pvp_show then
		slot2 = {
			[slot6] = slot0.item_list[slot6].config
		}

		for slot6 = 1, 4 do
			if slot0.item_list[slot6] then
				-- Nothing
			end
		end

		function slot3(slot0, slot1)
			slot3 = uv1[slot0]

			if uv0.attr_list[slot1] and slot3 and slot3.client_attr and slot3.client_attr[1] then
				slot2:setPositionX(uv0.pvp_attr_pos_x[slot1])

				if #slot3.client_attr[1] >= 2 then
					uv0:updateAttrItem(slot2, slot3.client_attr[1][2], slot3.client_attr[1][1], slot3.desc)
				end
			end
		end

		slot3(1, 1)
		slot3(2, 4)
		slot3(3, 2)
		slot3(4, 5)

		if slot0.attr_list[3] then
			slot0.attr_list[3]:setVisible(false)
		end

		if slot0.attr_list[6] then
			slot0.attr_list[6]:setVisible(false)
		end

		return
	end

	slot4 = 0
	slot5 = 0

	if Config.GuildSkillData.data_const["attr_show_" .. slot0.cur_index] and slot3.val then
		for slot9, slot10 in ipairs(slot3.val) do
			if slot0.attr_list[slot9] then
				if slot0.attr_pos_x[slot9] then
					slot11:setPositionX(slot0.attr_pos_x[slot9])
				end

				slot11:setVisible(true)
				slot0:updateAttrItem(slot11, slot0.attr_value_list[slot10], slot10)
			end
		end
	end
end

function GuildskillMainWindow.updateAttrItem(slot0, slot1, slot2, slot3, slot4)
	slot2 = slot2 or 0

	if slot4 == nil then
		slot4 = Config.AttrData.data_key_to_name[slot3] and slot5 or ""
	end

	slot5 = ""

	slot1:setString(string.format("<img src='%s' scale=1.0 /><div fontcolor=#6f4f3f> %s</div><div fontsize=24 fontcolor=#249004> %s</div>", PathTool.getResFrame("common", PathTool.getAttrIconByStr(slot3)), slot4, PartnerCalculate.isShowPerByStr(slot3) == true and "+" .. slot2 * 0.1 .. "%" or "+" .. slot2))
end

function GuildskillMainWindow.updateSkillItemById(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot2 = {}

	for slot6, slot7 in ipairs(slot0.item_list) do
		if slot7.data and slot7.data.id == slot1 and not tolua.isnull(slot7.node) then
			if slot7.status ~= slot7.data.status then
				slot7.status = slot7.data.status

				setChildUnEnabled(slot7.status ~= GuildskillConst.status.activity, slot7.node)
			end

			if slot7.config then
				for slot11, slot12 in ipairs(slot7.config.attr_list) do
					if type(slot12) == "table" and #slot12 >= 2 then
						if slot0.attr_value_list[slot12[1]] == nil then
							slot0.attr_value_list[slot12[1]] = 0
						end

						slot0.attr_value_list[slot12[1]] = slot0.attr_value_list[slot12[1]] + slot12[2]

						uv0(slot2, slot12[1])
					end
				end
			end

			break
		end
	end

	slot0:updateSkillAttrNameAndVal()

	if slot0.selected_item and not tolua.isnull(slot0.selected_item.node) then
		slot3, slot4 = slot0.selected_item.node:getPosition()

		slot0:handleUpgradeEffect(true, cc.p(slot3, slot4))
	end

	slot3 = 1

	if slot0.cur_skill_info and slot0.cur_skill_info.skill_ids then
		for slot7, slot8 in ipairs(slot0.cur_skill_info.skill_ids) do
			if slot8.status == GuildskillConst.status.un_activity then
				slot3 = slot7

				break
			end
		end

		slot0:changeSelectedItem(slot3, true)
	end
end

function GuildskillMainWindow.handleUpgradeEffect(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.upgrade_effect ~= nil then
			slot0.upgrade_effect:removeFromParent()

			slot0.upgrade_effect = nil
		end
	else
		function slot3()
			if not tolua.isnull(uv0.upgrade_effect) then
				uv0.upgrade_effect:setVisible(false)
			end
		end

		if slot0.upgrade_effect == nil then
			if not tolua.isnull(slot0.main_panel) then
				slot0.upgrade_effect = createEffectSpine(PathTool.getEffectRes(150), slot2, cc.p(0.5, 0.5), false, PlayerAction.action)

				slot0.main_panel:addChild(slot0.upgrade_effect)
			end

			slot0.upgrade_effect:registerSpineEventHandler(slot3, sp.EventType.ANIMATION_COMPLETE)
		end

		slot0.upgrade_effect:setPosition(slot2)
		slot0.upgrade_effect:setVisible(true)
		slot0.upgrade_effect:setAnimation(0, PlayerAction.action, false)
	end
end

function GuildskillMainWindow.handleLevUpgradeEffect(slot0, slot1, slot2, slot3)
	if slot1 == false then
		if slot0.levupgrade_effect ~= nil then
			slot0.levupgrade_effect:removeFromParent()

			slot0.levupgrade_effect = nil
		end
	else
		function slot4()
			if not tolua.isnull(uv0.levupgrade_effect) then
				uv0.levupgrade_effect:setVisible(false)
			end
		end

		if slot0.levupgrade_effect == nil then
			if not tolua.isnull(slot0.lev_upgrade_model) then
				slot7 = slot0.lev_upgrade_model:getContentSize()
				slot0.levupgrade_effect = createEffectSpine(PathTool.getEffectRes(152), cc.p(slot7.width * 0.5, slot7.height * 0.5), cc.p(0.5, 0.5), slot3 or false, slot2 or PlayerAction.action_1)

				slot0.lev_upgrade_model:addChild(slot0.levupgrade_effect, 2)
			end

			slot0.levupgrade_effect:registerSpineEventHandler(slot4, sp.EventType.ANIMATION_COMPLETE)
		else
			slot0.levupgrade_effect:setVisible(true)
		end

		slot0.levupgrade_effect:setAnimation(0, slot5, slot6)
	end
end

function GuildskillMainWindow.updateGotoeLabelShowStatus(slot0, slot1)
	if slot1 == nil then
		return
	end

	if uv0:getCareerSkillInfo(slot1) then
		if slot2.had_skill_up then
			slot0.reset_btn:setVisible(true)
		else
			slot0.reset_btn:setVisible(false)
		end
	end
end

function GuildskillMainWindow.updatePvPSkillList(slot0, slot1, slot2)
	if slot1 == nil then
		return
	end

	if not slot0.is_pvp_show then
		return
	end

	for slot9, slot10 in ipairs(uv0:getPvpskillInfoByCareer(slot1).attr_formation) do
		slot4 = 0 + slot10.lev
		slot13 = Config.GuildSkillData.data_pvp_attr_info(getNorKey(slot10.id, slot10.lev))

		if slot0.item_list[slot9] and slot13 then
			slot11.data = slot10
			slot11.config = slot13
			slot5 = 0 + slot13.power

			if not tolua.isnull(slot11.node) then
				if slot11.status ~= (slot10.lev == 0) then
					slot11.status = slot14

					setChildUnEnabled(slot14, slot11.node)
				end

				if slot11.is_ontouch_status ~= true then
					slot11.is_ontouch_status = true

					slot11.node:setTouchEnabled(true)
				end
			end

			if not tolua.isnull(slot11.lev) then
				slot11.lev:setString(slot10.lev)
			end
		end
	end

	slot0:onItemBtn(slot0.pvp_select_index)

	if slot0.pvp_skill_item == nil then
		slot0.pvp_skill_item = SkillItem.new(true, true, false, 1, true)

		slot0.pvp_skill_item:setPosition(338, 114)
		slot0.pvp_skill_item:setCascadeOpacityEnabled(true)
		slot0.pvp_skill_item:addCallBack(function ()
			uv0:onClickPvpSkillItem()
		end)
		slot0.main_panel:addChild(slot0.pvp_skill_item)
	else
		slot0.pvp_skill_item:setVisible(true)
	end

	if slot2 then
		slot0:skillItemRunAction(slot0.pvp_skill_item, 338, 90, 338, 114)
	end

	if slot3.skill_lev <= 0 then
		slot6 = 1
	end

	if Config.GuildSkillData.data_pvp_skill_info(getNorKey(slot1, slot6)) then
		if slot3.skill_lev == 0 then
			slot0.pvp_skill_item:showLevel(false)
			slot0.pvp_skill_item:setData(Config.SkillData.data_get_skill(slot8.skill_id))
			slot0.pvp_skill_item:showLockIcon(true)
			slot0.pvp_skill_item:showUnEnabled(true)
		else
			slot5 = slot5 + slot8.power

			slot0.pvp_skill_item:showLevel(true)
			slot0.pvp_skill_item:setData(slot9)
			slot0.pvp_skill_item:showLockIcon(false)
			slot0.pvp_skill_item:showUnEnabled(false)
		end

		slot0.pvp_skill_item:showArrowRedPoint(uv0:checkGuildPvpOnlySkillRedpoit(slot1, slot3.skill_lev, slot3.attr_formation))
		slot0.pvp_skill_item:showName(true, slot9.name, nil, 22, true, cc.c4b(255, 239, 215, 255), PathTool.getResFrame("common", "common_90003"), cc.size(168, 31))
	end

	if slot0.pvp_tips_lable == nil then
		slot0.pvp_tips_lable = createRichLabel(24, cc.c3b(149, 83, 34), cc.p(0.5, 0.5), cc.p(315, 116), nil, nil, 500)

		slot0.pvp_tips_lable:setString(uv1(TI18N("(以上<div fontcolor=#249003>属性</div>和<div fontcolor=#249003>技能</div>仅在PVP战斗中生效)")))
		slot0.cost_container:addChild(slot0.pvp_tips_lable)
	else
		slot0.pvp_tips_lable:setVisible(true)
	end

	slot0.fight_label:setNum(slot5)
	slot0:updateSkillAttrNameAndVal()

	if slot4 > 0 then
		slot0.reset_btn:setVisible(true)
		slot0.reset_btn_label:setString(TI18N("重置本系PVP技能"))
	else
		slot0.reset_btn:setVisible(false)
	end

	slot0.career_desc:setString(slot0:getPvpDescText(slot1, slot4))
end

function GuildskillMainWindow.getPvpDescText(slot0, slot1, slot2)
	if slot1 == GuildskillConst.index.physics then
		return uv0(TI18N("战士天赋总等级<div fontcolor='#249003'>(%s/%s)</div>"), slot2, slot0.pvp_max_lv)
	elseif slot1 == GuildskillConst.index.magic then
		return uv0(TI18N("法师天赋总等级<div fontcolor='#249003'>(%s/%s)</div>"), slot2, slot0.pvp_max_lv)
	elseif slot1 == GuildskillConst.index.defence then
		return uv0(TI18N("坦克天赋总等级<div fontcolor='#249003'>(%s/%s)</div>"), slot2, slot0.pvp_max_lv)
	elseif slot1 == GuildskillConst.index.assist then
		return uv0(TI18N("辅助天赋总等级<div fontcolor='#249003'>(%s/%s)</div>"), slot2, slot0.pvp_max_lv)
	else
		return ""
	end
end

function GuildskillMainWindow.updateSkillList(slot0, slot1, slot2, slot3)
	if slot1 == nil then
		return
	end

	if slot0.is_pvp_show then
		return
	end

	if uv0:getCareerSkillInfo(slot1) then
		if not slot3 and slot0.cur_info_group_id == slot4.group_id then
			return
		end

		slot0.cur_info_group_id = slot4.group_id
		slot0.cur_skill_info = slot4

		if slot4.had_skill_up then
			slot0.reset_btn:setVisible(true)
			slot0.reset_btn_label:setString(TI18N("重置本系常规技能"))
		else
			slot0.reset_btn:setVisible(false)
		end

		if Config.GuildSkillData.data_group[getNorKey(slot1, slot4.group_id)] ~= nil then
			slot0.career_desc:setString(uv1("%s<div fontcolor='#249003'>(%s/%s)</div>", slot5.group_name, slot5.group_seq, uv0:getCareerGroupMax(slot1)))
		end

		if slot4.skill_ids then
			slot6 = 0
			slot7, slot8 = nil

			for slot12, slot13 in ipairs(slot4.skill_ids) do
				slot8 = Config.GuildSkillData.data_info(slot13.id)

				if slot0.item_list[slot12] and slot8 then
					slot7.data = slot13
					slot7.config = slot8

					if not tolua.isnull(slot7.node) then
						if slot7.status ~= slot13.status then
							slot7.status = slot13.status

							setChildUnEnabled(slot13.status ~= GuildskillConst.status.activity, slot7.node)
						end

						if slot7.is_ontouch_status ~= false then
							slot7.is_ontouch_status = false

							slot7.node:setTouchEnabled(false)
						end
					end

					if not tolua.isnull(slot7.lev) then
						slot7.lev:setString(slot8.lev)
					end
				end

				if slot13.status == GuildskillConst.status.un_activity and slot6 == 0 then
					slot6 = slot12
				end
			end

			if slot6 == 0 then
				slot6 = 1
			end

			slot0:changeSelectedItem(slot6, true)
		end

		slot0:calculateTotalAttr()
	end

	if slot2 == true then
		slot0:handleLevUpgradeEffect(true)
	end
end

function GuildskillMainWindow.updateMiddleBg(slot0, slot1, slot2)
	if slot0.Sprite_5 then
		if slot0.is_pvp_show then
			loadSpriteTexture(slot0.Sprite_5, PathTool.getResFrame("guildskill", "guildskill_903"), LOADTEXT_TYPE_PLIST)
			slot0.attr_desc:setString(TI18N([[
PVP
 加
 成
 总
 览]]))
			slot0.attr_desc:setPositionX(19)
		else
			loadSpriteTexture(slot0.Sprite_5, PathTool.getResFrame("guildskill", "guildskill_902"), LOADTEXT_TYPE_PLIST)
			slot0.attr_desc:setString(TI18N([[
加
成
总
览]]))
			slot0.attr_desc:setPositionX(27)
		end
	end

	if slot0.career_action_list[slot1] then
		slot3, slot4, slot5 = nil

		if slot2 then
			slot4 = false

			if slot0.is_pvp_show then
				slot3 = slot0.career_action_list[slot1][2]
				slot5 = slot0.career_action_list[slot1][4]
			else
				slot3 = slot0.career_action_list[slot1][1]
				slot5 = slot0.career_action_list[slot1][3]
			end
		else
			slot4 = true
			slot3 = (not slot0.is_pvp_show or slot0.career_action_list[slot1][4]) and slot0.career_action_list[slot1][3]
		end

		slot0:showCareerActionEffect(true, slot3, slot4, slot5)
	end
end

function GuildskillMainWindow.showCareerActionEffect(slot0, slot1, slot2, slot3, slot4)
	if slot1 then
		slot0.record_career_action = slot2 or "action11"
		slot0.change_action = slot4

		if slot0.career_action_effect == nil then
			slot7 = slot0.lev_upgrade_model:getContentSize()
			slot0.career_action_effect = createEffectSpine("E27951", cc.p(slot7.width * 0.5, slot7.height * 0.5), cc.p(0.5, 0.5), slot3 or false, slot5)

			slot0.lev_upgrade_model:addChild(slot0.career_action_effect, 1)
			slot0.career_action_effect:registerSpineEventHandler(function ()
				if uv0.change_action and uv0.record_career_action ~= uv0.change_action then
					uv0.record_career_action = uv0.change_action
					uv0.change_action = nil

					if uv0.career_action_effect then
						uv0.career_action_effect:setAnimation(0, uv0.record_career_action, true)
					end
				end
			end, sp.EventType.ANIMATION_COMPLETE)
		else
			slot0.career_action_effect:setAnimation(0, slot5, slot6)
		end
	elseif slot0.career_action_effect then
		slot0.career_action_effect:removeFromParent()

		slot0.career_action_effect = nil
	end
end

function GuildskillMainWindow.calculateTotalAttr(slot0)
	if slot0.cur_skill_info == nil then
		return
	end

	slot1 = {}

	if slot0.cur_skill_info.group_ids and next(slot0.cur_skill_info.group_ids) then
		for slot5, slot6 in ipairs(slot0.cur_skill_info.group_ids) do
			if Config.GuildSkillData.data_info_group[slot6.group_id] == nil then
				return
			end

			for slot11, slot12 in ipairs(slot7) do
				uv0(slot1, slot12.id)
			end
		end
	end

	if slot0.cur_skill_info.skill_ids and next(slot0.cur_skill_info.skill_ids) then
		for slot5, slot6 in ipairs(slot0.cur_skill_info.skill_ids) do
			if slot6.status == GuildskillConst.status.activity then
				uv0(slot1, slot6.id)
			end
		end
	end

	slot2 = {}

	for slot6, slot7 in ipairs(slot1) do
		if Config.GuildSkillData.data_info(slot7) ~= nil then
			for slot12, slot13 in ipairs(slot8.attr_list) do
				if slot2[slot13[1]] == nil then
					slot2[slot13[1]] = 0
				end

				slot2[slot13[1]] = slot2[slot13[1]] + slot13[2]
			end
		end
	end

	slot0.attr_value_list = slot2

	slot0:updateSkillAttrNameAndVal()
end

function GuildskillMainWindow.updateSingleAttr(slot0, slot1, slot2, slot3)
	if slot0.attr_title and slot0.attr_value then
		slot4 = nil

		if slot3 and slot3 or Config.AttrData.data_key_to_name[slot1] then
			slot0.attr_title:setString(slot4)

			if PartnerCalculate.isShowPerByStr(slot1) == true then
				slot0.attr_value:setString("+" .. slot2 * 0.1 .. "%")
			else
				slot0.attr_value:setString("+" .. slot2)
			end
		end
	end
end

function GuildskillMainWindow.changeSelectedItem(slot0, slot1, slot2)
	if slot0.selected_item and not slot2 and slot0.selected_item.index == slot1 then
		return
	end

	slot0.selected_item = slot0.item_list[slot1]

	if slot0.selected_item == nil then
		return
	end

	if not tolua.isnull(slot0.selected_item.node) then
		slot0.selected:setPosition(slot0.selected_item.x, slot0.selected_item.y)
	end

	if slot0.selected_item.config then
		slot4, slot5 = nil

		for slot9, slot10 in ipairs(slot3.attr_list) do
			if type(slot10) == "table" and #slot10 >= 2 then
				slot0:updateSingleAttr(slot10[1], slot10[2])
			end
		end

		slot0:updateCostInfo()
	end
end

function GuildskillMainWindow.updateCostInfo(slot0)
	if slot0.selected_item == nil or slot0.selected_item.config == nil or slot0.selected_item.data == nil then
		return
	end

	if not slot0.selected_tab then
		return
	end

	slot1 = slot0.selected_item.config

	if slot0.is_pvp_show then
		if Config.GuildSkillData.data_pvp_attr_max_lev[slot0.selected_item.data.id] and slot1.lev and slot3 <= slot1.lev then
			for slot7, slot8 in ipairs(slot0.cost_bg_list) do
				slot8.cost_bg:setVisible(false)
			end

			slot0.handle_btn:setVisible(false)

			if slot0.pvp_max_lev_label == nil then
				slot0.pvp_max_lev_label = createRichLabel(24, cc.c3b(100, 50, 35), cc.p(0.5, 0.5), cc.p(315, 44), nil, nil, 500)

				slot0.pvp_max_lev_label:setString(TI18N("属性已达最大等级"))
				slot0.cost_container:addChild(slot0.pvp_max_lev_label)
			else
				slot0.pvp_max_lev_label:setVisible(true)
			end
		else
			slot0:updateCostDetailInfo(slot1.loss)
		end
	elseif slot1.lev >= 40 and slot2.status == GuildskillConst.status.activity then
		for slot6, slot7 in ipairs(slot0.cost_bg_list) do
			slot7.cost_bg:setVisible(false)
		end

		if slot0.max_lev_label == nil then
			slot0.max_lev_label = createRichLabel(24, cc.c3b(100, 50, 35), cc.p(0.5, 0.5), cc.p(315, 97), nil, nil, 500)

			slot0.cost_container:addChild(slot0.max_lev_label)
		else
			slot0.max_lev_label:setVisible(true)
		end

		if uv0:getPvpskillInfoByCareer(slot0.selected_tab.career or GuildskillConst.index.physics) and slot4.attr_formation and #slot4.attr_formation == 0 then
			slot0.max_lev_label:setString(TI18N("突破后获得全新的<div fontcolor=#249003>PVP属性</div>和<div fontcolor=#249003>技能</div>"))
			slot0.max_lev_label:setPositionY(97)
			setChildUnEnabled(false, slot0.handle_btn)
			slot0.handle_btn_label:enableOutline(Config.ColorData.data_color4[264], 2)
			slot0.handle_btn:setVisible(true)
			slot0.handle_btn_label:setString(TI18N("突 破"))
		else
			slot0.max_lev_label:setString(TI18N("<div fontcolor=#249003>属性已达最大重天</div>"))
			slot0.max_lev_label:setPositionY(73)
			slot0.handle_btn:setVisible(false)
		end
	else
		slot0:updateCostDetailInfo(slot1.loss)
	end
end

function GuildskillMainWindow.updateCostDetailInfo(slot0, slot1)
	for slot5, slot6 in ipairs(slot0.cost_bg_list) do
		slot6.cost_bg:setVisible(true)
	end

	slot0.handle_btn:setVisible(true)

	if slot0.max_lev_label then
		slot0.max_lev_label:setVisible(false)
	end

	if slot0.pvp_max_lev_label then
		slot0.pvp_max_lev_label:setVisible(false)
	end

	if slot0.upgrade_cost_list == nil then
		slot0.upgrade_cost_list = {}
	end

	slot0.upgrade_cost_list.item_list = {}
	slot0.upgrade_cost_list.asset_list = {}

	if slot1 then
		slot2 = true

		for slot6 = 1, 2 do
			slot9 = slot0.cost_bg_list[slot6].cost_txt

			if slot1[slot6] then
				slot11 = slot7[2]
				slot12 = 0

				if Config.ItemData.data_get_data(slot7[1]) then
					slot0.cost_bg_list[slot6].cost_icon:loadTexture(PathTool.getItemRes(slot13.icon), LOADTEXT_TYPE)

					slot12 = BackpackController:getInstance():getModel():getItemNumByBid(slot10)

					slot9:setString(MoneyTool.GetMoneyString(slot12) .. "/" .. MoneyTool.GetMoneyString(slot11))

					if slot11 <= slot12 then
						slot9:setTextColor(cc.c3b(255, 246, 228))
					else
						slot2 = false

						slot9:setTextColor(cc.c3b(255, 139, 139))
					end
				end

				if Config.ItemData.data_assets_id2label[slot10] ~= nil then
					slot0.upgrade_cost_list.asset_list[slot14] = true
				else
					slot0.upgrade_cost_list.item_list[slot10] = true
				end
			else
				slot9:setString("")
			end
		end

		slot0:checkUpgradeCostStatus(slot2)
	end
end

function GuildskillMainWindow.checkUpgradeCostStatus(slot0, slot1)
	if slot0.selected_item == nil or slot0.selected_item.config == nil then
		return
	end

	slot3 = 0

	if ((slot0.selected_item.config.guild_lev == nil or slot2.guild_lev <= uv0.guild_lev) and (slot1 == false and 1 or 2) or 3) == 1 then
		setChildUnEnabled(true, slot0.handle_btn)
		slot0.handle_btn_label:disableEffect()
		slot0.handle_btn_label:setString(TI18N("消耗不足"))
	elseif slot3 == 2 then
		setChildUnEnabled(false, slot0.handle_btn)
		slot0.handle_btn_label:enableOutline(Config.ColorData.data_color4[264], 2)
	elseif slot3 == 3 then
		setChildUnEnabled(true, slot0.handle_btn)
		slot0.handle_btn_label:disableEffect()
		slot0.handle_btn_label:setString(TI18N("条件不足"))
	end

	if slot3 == 2 then
		if slot0.is_pvp_show then
			slot0.handle_btn_label:setString(TI18N("升 级"))

			slot5 = true

			if slot0.item_list[slot0.pvp_select_index] and slot4.config then
				for slot9, slot10 in ipairs(slot0.item_list) do
					if slot9 <= 4 and slot10.data and slot10.data.lev and slot10.data.lev < slot4.config.need_lev then
						slot5 = false

						break
					end
				end
			end

			if not slot5 then
				setChildUnEnabled(true, slot0.handle_btn)
				slot0.handle_btn_label:disableEffect()

				if slot0.show_pvp_tips == nil then
					slot0.show_pvp_tips = createLabel(20, cc.c3b(255, 0, 0), nil, 544, 0, "", slot0.cost_container, nil, cc.p(0.5, 0.5))
				else
					slot0.show_pvp_tips:setVisible(true)
				end

				slot0.show_pvp_tips:setString(uv1(TI18N("其他属性达%s级"), slot4.config.need_lev))
			else
				setChildUnEnabled(false, slot0.handle_btn)
				slot0.handle_btn_label:enableOutline(Config.ColorData.data_color4[264], 2)

				if slot0.show_pvp_tips then
					slot0.show_pvp_tips:setVisible(false)
				end
			end
		else
			slot0.handle_btn_label:setString(TI18N("点 亮"))

			if slot0.show_pvp_tips then
				slot0.show_pvp_tips:setVisible(false)
			end
		end
	elseif slot0.show_pvp_tips then
		slot0.show_pvp_tips:setVisible(false)
	end
end

function GuildskillMainWindow.changeNeedItemInfo(slot0, slot1)
	if slot0.upgrade_cost_list == nil or slot0.upgrade_cost_list.item_list == nil then
		return
	end

	if slot1 == nil or next(slot1) == nil then
		return
	end

	slot2 = {
		[slot7.base_id] = true
	}

	for slot6, slot7 in pairs(slot1) do
		if slot7.base_id then
			-- Nothing
		end
	end

	slot3 = false
	slot0.auto_buy_item_price = 0

	for slot7, slot8 in pairs(slot0.upgrade_cost_list.item_list) do
		if slot2[slot7] == true then
			slot3 = true
			slot9 = uv0:getBackPackItemNumByBid(slot7)

			if slot8.item and slot8.item.setNeedNum then
				slot8.item:setNeedNum(slot8.need_num, slot9)

				if slot9 < slot8.need_num then
					slot0.auto_buy_item_price = slot0.auto_buy_item_price + slot0:getItemPrice(slot7) * (slot8.need_num - slot9)
					slot8.condition_status = true
				else
					slot8.condition_status = true
				end
			end
		end
	end

	if slot3 == true then
		slot0:checkUpgradeCostStatus()
	end
end

function GuildskillMainWindow.close_callback(slot0)
	slot0:handleUpgradeEffect(false)
	slot0:handleLevUpgradeEffect(false)

	if not tolua.isnull(slot0.selected) then
		slot0.selected:stopAllActions()
	end

	if slot0.fight_label then
		slot0.fight_label:DeleteMe()

		slot0.fight_label = nil
	end

	for slot4, slot5 in pairs(slot0.backpack_item_list) do
		slot5:DeleteMe()
	end

	slot0.backpack_item_list = {}

	if slot0.update_guildskill_event then
		GlobalEvent:getInstance():UnBind(slot0.update_guildskill_event)

		slot0.update_guildskill_event = nil
	end

	if slot0.reset_guildskill_event then
		GlobalEvent:getInstance():UnBind(slot0.reset_guildskill_event)

		slot0.reset_guildskill_event = nil
	end

	if slot0.update_skillstatus_event then
		GlobalEvent:getInstance():UnBind(slot0.update_skillstatus_event)

		slot0.update_skillstatus_event = nil
	end

	if slot0.update_skillupgrade_event then
		GlobalEvent:getInstance():UnBind(slot0.update_skillupgrade_event)

		slot0.update_skillupgrade_event = nil
	end

	if slot0.update_guild_skill_red_event then
		GlobalEvent:getInstance():UnBind(slot0.update_guild_skill_red_event)

		slot0.update_guild_skill_red_event = nil
	end

	if slot0.add_item_data_event then
		GlobalEvent:getInstance():UnBind(slot0.add_item_data_event)

		slot0.add_item_data_event = nil
	end

	if slot0.update_item_data_event then
		GlobalEvent:getInstance():UnBind(slot0.update_item_data_event)

		slot0.update_item_data_event = nil
	end

	if uv0 and slot0.update_role_assets_event ~= nil then
		uv0:UnBind(slot0.update_role_assets_event)

		slot0.update_role_assets_event = nil
	end

	uv1:openGuildSkillMainWindow(false)
end
