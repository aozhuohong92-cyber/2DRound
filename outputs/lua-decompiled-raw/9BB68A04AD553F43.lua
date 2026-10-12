HeroSoulWeaponChangePanel = HeroSoulWeaponChangePanel or BaseClass(BaseView)
slot1 = HeroController:getInstance():getModel()

function HeroSoulWeaponChangePanel.__init(slot0, slot1)
	slot0.is_full_screen = false
	slot0.title_str = ""
	slot0.layout_name = "hero/hero_soul_weapon_change_panel"
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("hero", "hero"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("halidom", "halidom"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("tips", "tips"),
			type = ResourcesType.plist
		}
	}
	slot0.data = slot1
	slot0.cur_status = HeroConst.soulWeapon.status.lock
	slot0.cell_list = {}
	slot0.active_list = {}
	slot0.skill_list = {}
	slot0.select_hero_list = {}
	slot0.select_hero_id_list = {}
	slot0.cost_data = {}
	slot0.hero_id = 0
	slot0.hero_bid = 0
	slot0.hero_need_num = 0
	slot0.is_item_cost_full = true
	slot0.is_hero_cost_full = false
end

function HeroSoulWeaponChangePanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.close_btn = slot0.root_wnd:getChildByName("close_btn")
	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.title = slot0.main_panel:getChildByName("title"):getChildByName("label")
	slot0.detail = slot0.main_panel:getChildByName("detail")
	slot0.soulWeapon_icon = slot0.detail:getChildByName("soulWeapon")
	slot0.soulWeapon_item = slot0.soulWeapon_icon:getChildByName("item_layout")
	slot0.soulWeapon_level_bg = slot0.soulWeapon_icon:getChildByName("level_bg")

	slot0.soulWeapon_level_bg:setVisible(false)

	slot0.soulWeapon_level = slot0.soulWeapon_level_bg:getChildByName("level")
	slot0.detail_strong = slot0.main_panel:getChildByName("detail_strong")
	slot0.soulWeapon_icon_strong = slot0.detail_strong:getChildByName("soulWeapon")
	slot0.soulWeapon_item_strong = slot0.soulWeapon_icon_strong:getChildByName("item_layout")
	slot0.soulWeapon_level_bg_strong = slot0.soulWeapon_icon_strong:getChildByName("level_bg")

	slot0.soulWeapon_level_bg_strong:setVisible(true)

	slot0.soulWeapon_level_strong = slot0.soulWeapon_level_bg_strong:getChildByName("level")
	slot0.soulWeapon_level_strong_desc = slot0.soulWeapon_icon_strong:getChildByName("desc_bg"):getChildByName("label")
	slot0.soulWeapon_icon_strong_next_lv = slot0.detail_strong:getChildByName("soulWeapon_after")
	slot0.soulWeapon_item_strong_next_lv = slot0.soulWeapon_icon_strong_next_lv:getChildByName("item_layout")
	slot0.soulWeapon_level_bg_strong_next_lv = slot0.soulWeapon_icon_strong_next_lv:getChildByName("level_bg")

	slot0.soulWeapon_level_bg_strong_next_lv:setVisible(true)

	slot0.soulWeapon_level_strong_next_lv = slot0.soulWeapon_level_bg_strong_next_lv:getChildByName("level")
	slot0.soulWeapon_icon_strong_next_lv_desc = slot0.soulWeapon_icon_strong_next_lv:getChildByName("desc_bg"):getChildByName("label")
	slot0.attribute = slot0.main_panel:getChildByName("attribute")
	slot0.buff = slot0.main_panel:getChildByName("buff")
	slot0.buff_layout = slot0.buff:getChildByName("scroll")
	slot0.cost = slot0.main_panel:getChildByName("cost")
	slot0.cost_bg = slot0.cost:getChildByName("item_bg")

	slot0.cost_bg:setVisible(false)

	slot0.cost_item = slot0.cost_bg:getChildByName("item")
	slot0.cost_num = slot0.cost_bg:getChildByName("cost_num")
	slot0.help_btn = slot0.main_panel:getChildByName("help_btn")
	slot0.goto_btn = slot0.main_panel:getChildByName("btn_goto")
end

function HeroSoulWeaponChangePanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickCloseBtn), false, 1)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), false, 1)
	registerButtonEventListener(slot0.help_btn, handler(slot0, slot0.onClickCloseBtn), true, 1)
	registerButtonEventListener(slot0.goto_btn, handler(slot0, slot0.onClickChange), true, 1)

	if not slot0.update_go_btn_status then
		slot0.update_go_btn_status = GlobalEvent:getInstance():Bind(HeroEvent.SOUL_WEAPON_UPDATA_STATE, function (slot0)
			uv0:update(slot0)
		end)
	end

	if not slot0.select_hero_event then
		slot0.select_hero_event = GlobalEvent:getInstance():Bind(HeroEvent.Select_Hero_Event, function (slot0)
			if slot0 then
				uv0:updateSelectHero(slot0)
			end
		end)
	end
end

function HeroSoulWeaponChangePanel.onClickCloseBtn(slot0)
	uv0:openSoulWeaponChangePanel(false)
end

function HeroSoulWeaponChangePanel.onClickChange(slot0)
	if #slot0.cost_data == 0 then
		return
	end

	if slot0.cost_data[1][1] == 2 and not slot0.is_item_cost_full then
		message("强化材料不足！")

		return
	end

	if slot0.cost_data[1][1] == 1 and not slot0.is_hero_cost_full then
		message("没有足够的英雄进行强化！")

		return
	end

	slot1 = {}

	table.insert(slot1, {
		partner_bid = slot0.hero_bid,
		expend1 = slot0.select_hero_id_list
	})
	uv0:send11401(slot0.data.hero_id, slot0.data.weapon_id, slot1)

	slot0.select_hero_list = {}
	slot0.select_hero_id_list = {}
	slot0.cost_data = {}
	slot0.hero_id = 0
	slot0.hero_bid = 0
	slot0.hero_need_num = 0
	slot0.is_item_cost_full = true
	slot0.is_hero_cost_full = false
end

function HeroSoulWeaponChangePanel.openRootWnd(slot0, slot1, slot2)
	slot0.data = slot1
	slot0.weapon_name = slot1.weapon_name
	slot0.hero_name = slot1.hero_name
	slot0.score = slot1.score
	slot0.desc_text = slot1.desc
	slot0.buff_list = slot1.buff_list
	slot0.buff_desc_list = {}
	slot0.cur_status_text = "觉醒"
	slot0.cur_status = slot1.status

	slot0.detail_strong:setVisible(false)

	if slot0.cur_status == HeroConst.soulWeapon.status.strengthen then
		slot0.cur_status_text = "强化"

		slot0.detail:setVisible(false)
		slot0.detail_strong:setVisible(true)
		slot0.soulWeapon_level_bg:setVisible(true)
	end

	slot0.active_lev_list = {}

	for slot7, slot8 in pairs(Config.PartnerExclusiveData.data_exclusive_skills) do
		if slot0.data.weapon_id == slot7 then
			slot0.active_lev_list = slot8
		end
	end

	for slot7, slot8 in pairs(slot0.data.lev_list) do
		if slot8.active_lev <= slot0.data.weapon_lev then
			table.insert(slot0.active_list, slot7)
		end
	end

	slot0:setTitle()
	slot0:setAttribute()
	slot0:setBuff()
	slot0:setCost()
end

function HeroSoulWeaponChangePanel.setTitle(slot0)
	slot0:textTranslate()

	slot0.score_num = slot0.detail:getChildByName("common_num")
	slot1 = CommonNum.new(17, slot0.score_num, slot0.score, -2, cc.p(0, 0.5))

	slot1:setScale(0.7)
	slot1:setPositionY(15)
	slot0.soulWeapon_item:setBackGroundImage(PathTool.getResFrame("common", "common_1010"), LOADTEXT_TYPE_PLIST)

	slot2 = PathTool.getItemRes(slot0.data.weapon_id, false)
	slot3 = slot0.soulWeapon_item:getChildByName("Image_3")

	slot3:setContentSize(cc.size(95, 95))
	slot3:loadTexture(slot2, LOADTEXT_TYPE)
	slot0.soulWeapon_item_strong:setBackGroundImage(PathTool.getResFrame("common", "common_1010"), LOADTEXT_TYPE_PLIST)
	slot0.soulWeapon_item_strong_next_lv:setBackGroundImage(PathTool.getResFrame("common", "common_1010"), LOADTEXT_TYPE_PLIST)

	slot4 = slot0.soulWeapon_item_strong:getChildByName("Image_3")
	slot5 = slot0.soulWeapon_item_strong_next_lv:getChildByName("Image_3")

	slot4:setContentSize(cc.size(95, 95))
	slot4:loadTexture(slot2, LOADTEXT_TYPE)
	slot5:setContentSize(cc.size(95, 95))
	slot5:loadTexture(slot2, LOADTEXT_TYPE)
	slot0.soulWeapon_level:setString(slot0.data.weapon_lev)
	slot0.soulWeapon_level_strong:setString(slot0.data.weapon_lev)
	slot0.soulWeapon_level_strong_next_lv:setString(slot0.data.weapon_lev + 1)
	slot0.soulWeapon_level_strong_desc:setString(slot0.data.weapon_name .. "+" .. slot0.data.weapon_lev)
	slot0.soulWeapon_icon_strong_next_lv_desc:setString(slot0.data.weapon_name .. "+" .. slot0.data.weapon_lev + 1)
	slot0.soulWeapon_level_bg:setVisible(false)
end

function HeroSoulWeaponChangePanel.textTranslate(slot0)
	slot0.title:setString(TI18N("大海秘宝" .. slot0.cur_status_text))
	slot0.detail:getChildByName("weapon_name"):setString(TI18N(slot0.weapon_name))
	slot0.detail:getChildByName("belong"):setString(TI18N(slot0.hero_name) .. TI18N("专属"))
	slot0.detail:getChildByName("score"):setString(TI18N("评分:"))
	slot0.attribute:getChildByName("baseTitle"):setString(TI18N("基础属性"))
	slot0.buff:getChildByName("baseTitle"):setString(TI18N("强化属性"))
	slot0.goto_btn:getChildByName("label"):setString(TI18N(slot0.cur_status_text))
end

function HeroSoulWeaponChangePanel.setAttribute(slot0)
	slot0.attribute_list = {}
	slot1 = Config.PartnerExclusiveData.data_exclusive_upgrade_info

	for slot5 = 1, 4 do
		slot0.attribute:getChildByName("attr_bg_" .. slot5):setVisible(false)
	end

	for slot5, slot6 in pairs(slot0.data.attr) do
		slot7 = slot0.attribute:getChildByName("attr_bg_" .. slot5)

		slot7:setVisible(true)

		slot7.icon = slot7:getChildByName("icon")

		slot7.icon:setScale(0.8)

		slot7.attr_name = slot7:getChildByName("attr_name")
		slot7.arrow = slot7:getChildByName("arrow")
		slot7.attr_name_2 = slot7:getChildByName("attr_name_2")
		slot7.value = slot7:getChildByName("value")

		slot7.value:setString("+" .. slot6[2])

		slot7.data = slot6
		slot7.res = nil

		slot0:setAttrConfig(slot7, slot6[1])

		if slot7.percent == true then
			slot7.value:setString(slot6[2] / 10 .. "%")
		end

		slot7.icon:loadTexture(slot7.res, LOADTEXT_TYPE_PLIST)
		table.insert(slot0.attribute_list, slot7)
	end

	if slot0.data.weapon_lev == Config.PartnerExclusiveData.data_const.exclusive_max_lev.val then
		for slot6 = 1, 4 do
			slot0.attribute_list[slot6].arrow:setVisible(true)
			slot0.attribute_list[slot6].attr_name_2:setVisible(false)
		end

		return
	end

	if slot0.data.weapon_lev > 0 and slot0.cur_status == HeroConst.soulWeapon.status.strengthen then
		for slot7, slot8 in pairs(slot1[slot0.data.weapon_id .. "_" .. slot0.data.weapon_lev + 1].base_attr) do
			slot0.attribute_list[slot7].arrow:setVisible(true)
			slot0.attribute_list[slot7].attr_name_2:setVisible(true)
			slot0.attribute_list[slot7].attr_name_2:setString("+" .. slot8[2])

			if slot0.attribute_list[slot7].percent == true then
				slot0.attribute_list[slot7].attr_name_2:setString("+" .. slot8[2] / 10 .. "%")
			end

			slot0.attribute_list[slot7].attr_name_2:setTextColor(cc.c3b(0, 128, 0))
			slot0.soulWeapon_level_bg:setVisible(true)
		end
	end
end

function HeroSoulWeaponChangePanel.setAttrConfig(slot0, slot1, slot2)
	if slot2 == HeroConst.soulWeapon.attr.attack then
		slot1.res = PathTool.getResFrame("common", "common_90021", false, "common")

		slot1.attr_name:setString(TI18N("攻击"))
	end

	if slot2 == HeroConst.soulWeapon.attr.defense then
		slot1.res = PathTool.getResFrame("common", "common_90023", false, "common")

		slot1.attr_name:setString(TI18N("防御"))
	end

	if slot2 == HeroConst.soulWeapon.attr.hitPoint then
		slot1.res = PathTool.getResFrame("common", "common_90022", false, "common")

		slot1.attr_name:setString(TI18N("生命"))
	end

	if slot2 == HeroConst.soulWeapon.attr.speed then
		slot1.res = PathTool.getResFrame("common", "common_90038", false, "common")

		slot1.attr_name:setString(TI18N("速度"))
	end

	if slot2 == HeroConst.soulWeapon.attr.hit_rate then
		slot1.res = PathTool.getResFrame("common", "common_90021_2", false, "common")

		slot1.attr_name:setString(TI18N("命中"))

		slot1.percent = true
	end

	if slot2 == HeroConst.soulWeapon.attr.dodge_rate then
		slot1.res = PathTool.getResFrame("common", "common_90021_4", false, "common")

		slot1.attr_name:setString(TI18N("闪避"))

		slot1.percent = true
	end

	if slot2 == HeroConst.soulWeapon.attr.dodge_magic then
		slot1.res = PathTool.getResFrame("common", "common_90037", false, "common")

		slot1.attr_name:setString(TI18N("抗控"))

		slot1.percent = true
	end

	if slot2 == HeroConst.soulWeapon.attr.tenacity then
		slot1.res = PathTool.getResFrame("common", "common_90021_1", false, "common")

		slot1.attr_name:setString(TI18N("抗暴"))

		slot1.percent = true
	end
end

function HeroSoulWeaponChangePanel.setBuff(slot0)
	if not slot0.item_scrollview then
		slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.buff_layout, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.buff_layout:getContentSize(), {
			start_y = 0,
			item_height = 80,
			start_x = 2,
			space_y = 5,
			col = 1,
			space_x = 0,
			row = 1,
			item_width = 250
		}, cc.p(0, 0))

		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.item_scrollview:reloadData()
end

function HeroSoulWeaponChangePanel.createNewCell(slot0)
	slot1 = HeroSoulWeaponBuffItem.new()

	table.insert(slot0.cell_list, slot1)

	return slot1
end

function HeroSoulWeaponChangePanel.numberOfCells(slot0)
	if not slot0.buff_list then
		return 0
	end

	return #slot0.buff_list
end

function HeroSoulWeaponChangePanel.updateCellByIndex(slot0, slot1, slot2)
	for slot6, slot7 in pairs(slot0.buff_list) do
		slot1:setDate(slot7, slot2, slot0.data, slot0.active_list)
	end
end

function HeroSoulWeaponChangePanel.setCost(slot0)
	slot1 = Config.PartnerExclusiveData.data_exclusive_upgrade_info

	if slot0.data.weapon_lev == 0 then
		slot0.data.weapon_lev = 1
	end

	slot0.cost_data = slot1[slot0.data.weapon_id .. "_" .. slot0.data.weapon_lev + 1].consume

	if slot0.cost_item_list and #slot0.cost_item_list ~= 0 then
		for slot6, slot7 in pairs(slot0.cost_item_list) do
			slot7:DeleteMe()
		end
	end

	slot0.cost_item_list = {}

	for slot6, slot7 in pairs(slot2) do
		if slot7[1] == 1 then
			slot0.hero_item = HeroExhibitionItem.new(0.8, true)

			slot0.hero_item:addCallBack(function ()
				uv0:_onClickHeroItemData(uv1[1][2], uv1[1][4])
			end)
			slot0.cost:addChild(slot0.hero_item)
			slot0.hero_item:setData(Config.PartnerData.data_partner_base_fun(slot2[1][2]))
			slot0.hero_item:setHeadUnEnabled(true)

			slot0.hero_need_num = slot2[1][3]

			slot0.hero_item.num_label:setString(string.format("%s/%s", 0, slot2[1][3]))
			slot0.hero_item.num_label:setVisible(true)
			table.insert(slot0.cost_item_list, slot6, slot0.hero_item)
			table.insert(slot0.select_hero_list, slot6, slot0.hero_item)
		end

		if slot7[1] == 2 then
			slot8 = BackPackItem.new(1, true, nil, 0.8, false, true)

			slot8:setBaseData(slot2[1][2])
			slot0.cost:addChild(slot8)

			slot10 = cc.c3b(255, 255, 255)

			if (BackpackController:getInstance():getModel():getItemNumByBid(slot2[1][2]) or 0) < slot2[1][3] then
				slot10 = cc.c3b(255, 0, 0)
				slot0.is_item_cost_full = false
			end

			if slot0.cost_need_num then
				slot0.cost_need_num = nil
			end

			slot0.cost_need_num = createLabel(22, slot10, cc.c3b(0, 0, 0), slot8.Width, 0, slot2[1][3] .. "/" .. slot9, slot8, 2, cc.p(1, 0))

			table.insert(slot0.cost_item_list, slot6, slot8)
		end
	end

	slot3 = slot0.cost:getContentSize()

	for slot9, slot10 in pairs(slot0.cost_item_list) do
		slot10:setPosition(slot3.width * 0.5, slot3.height * 0.5 + 10)
	end
end

function HeroSoulWeaponChangePanel._onClickHeroItemData(slot0, slot1, slot2)
	slot3 = {
		select_condition = {},
		dic_selected = slot0.hero_item.dic_select_list
	}
	slot3.select_condition.bid = slot1
	slot3.select_condition.star = slot2
	slot3.select_count = 1
	slot3.form_type = HeroConst.SelectHeroType.eSuperAdvance

	uv0:openHeroSelectHeroPanel(true, slot3)
end

function HeroSoulWeaponChangePanel.update(slot0, slot1)
	if slot1.lev > 0 then
		slot7 = "强化"

		slot0.goto_btn:getChildByName("label"):setString(TI18N(slot7))
		slot0.detail:setVisible(false)
		slot0.detail_strong:setVisible(true)

		slot0.data.weapon_lev = slot1.lev
		slot0.data.attr = Config.PartnerExclusiveData.data_exclusive_upgrade_info[slot0.data.weapon_id .. "_" .. slot0.data.weapon_lev].base_attr
		slot0.active_list = {}

		for slot7, slot8 in pairs(slot0.active_lev_list) do
			if slot8.active_lev <= slot0.data.weapon_lev then
				table.insert(slot0.active_list, slot7)
			end
		end

		if slot1.lev == Config.PartnerExclusiveData.data_const.exclusive_max_lev.val then
			slot0.detail:setVisible(true)
			slot0.detail_strong:setVisible(false)
			slot0.goto_btn:setVisible(false)
			slot0.cost:setVisible(false)

			return
		end

		slot0.cur_status_text = "强化"

		slot0.title:setString(TI18N("大海秘宝" .. slot0.cur_status_text))
		slot0.soulWeapon_level:setString(slot0.data.weapon_lev)
		slot0.soulWeapon_level_strong:setString(slot0.data.weapon_lev)
		slot0.soulWeapon_level_strong_next_lv:setString(slot0.data.weapon_lev + 1)
		slot0.soulWeapon_level_strong_desc:setString(slot0.data.weapon_name .. "+" .. slot0.data.weapon_lev)
		slot0.soulWeapon_icon_strong_next_lv_desc:setString(slot0.data.weapon_name .. "+" .. slot0.data.weapon_lev + 1)

		slot0.cur_status = HeroConst.soulWeapon.status.strengthen

		slot0:setAttribute()
		slot0:setBuff()
		slot0:setCost()
	end
end

function HeroSoulWeaponChangePanel.updateSelectHero(slot0, slot1)
	slot0.select_hero_id_list = {}

	for slot6, slot7 in pairs(slot1) do
		slot0.hero_bid = slot7.bid

		table.insert(slot0.select_hero_id_list, {
			partner_id = slot7.id
		})
	end

	if #slot0.select_hero_id_list ~= slot0.hero_need_num then
		slot0.is_hero_cost_full = false

		return
	end

	slot0.is_hero_cost_full = true

	slot0.hero_item.num_label:setString(#slot0.select_hero_id_list .. "/" .. slot0.hero_need_num)
	slot0.hero_item:setHeadUnEnabled(false)
end

function HeroSoulWeaponChangePanel.close_callback(slot0)
	if slot0.update_go_btn_status then
		GlobalEvent:getInstance():UnBind(slot0.update_go_btn_status)

		slot0.update_go_btn_status = nil
	end

	if slot0.select_hero_event then
		GlobalEvent:getInstance():UnBind(slot0.select_hero_event)

		slot0.select_hero_event = nil
	end
end

HeroSoulWeaponBuffItem = class("HeroSoulWeaponBuffItem", function ()
	return ccui.Widget:create()
end)

function HeroSoulWeaponBuffItem.ctor(slot0, slot1)
	slot0.data = slot1
	slot0.size = cc.size(200, 80)

	slot0:setContentSize(slot0.size)
	slot0:setPosition(cc.p(0, 0.5))
	slot0:setUI()
end

function HeroSoulWeaponBuffItem.setUI(slot0)
	slot0.active = createImage(slot0, PathTool.getResFrame("hero", "soulweapon_4", false, "soulweapon"), 0, 80, cc.p(0, 1), true)

	slot0.active:setScale(1.3)

	if not slot0.desc then
		slot0.desc = createLabel(22, cc.c3b(101, 63, 47), nil, 50, 80, "未知强化", slot0, 0, cc.p(0, 1))
	end

	slot0.desc:setWidth(500)
	slot0.desc:setAlignment(0, cc.TEXT_ALIGNMENT_LEFT)
end

function HeroSoulWeaponBuffItem.setDate(slot0, slot1, slot2, slot3, slot4)
	slot5 = {}

	for slot10, slot11 in pairs(Config.PartnerExclusiveData.data_exclusive_skills) do
		if slot3.weapon_id == slot10 then
			slot5 = slot11
		end
	end

	slot10 = slot5[slot2].desc

	slot0.desc:setString(slot10)

	for slot10, slot11 in pairs(slot4) do
		if slot11 == slot2 then
			slot0.active:loadTexture(PathTool.getResFrame("hero", "soulweapon_3", false, "soulweapon"), LOADTEXT_TYPE_PLIST)
			slot0.desc:setTextColor(cc.c3b(0, 128, 0))
		end
	end
end
