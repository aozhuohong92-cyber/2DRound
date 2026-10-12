HeroResetWindow = HeroResetWindow or BaseClass(BaseView)
slot1 = HeroController:getInstance():getModel()
slot2 = string.format
slot3 = table.sort
slot4 = table.insert
slot5 = Config.PartnerData.data_get_compound_info
slot6 = Config.PartnerData.data_partner_const
slot7 = RoleController:getInstance():getRoleVo()

function HeroResetWindow.__init(slot0, slot1)
	slot0.res_index = slot1 or HeroConst.SacrificeType.eHeroFuse
	slot0.is_full_screen = true
	slot0.win_type = WinType.Full
	slot0.layout_name = "hero/hero_reset_window"

	slot0:loadResResources(slot0.res_index)

	slot0.dic_select_partner_vo = {}
	slot0.select_count = 0
	slot0.select_max_count = 15
	slot0.cur_chip_count = 0
	slot0.view_list = {}
	slot0.is_play_efffect = false
	slot0.panel_list = {}
	slot0.setting = {
		y = -14
	}
end

function HeroResetWindow.loadResResources(slot0, slot1)
	if slot1 == HeroConst.SacrificeType.eHeroFuse then
		slot0.res_list = {
			{
				path = PathTool.getPlistImgForDownLoad("bigbg/hero", HeroConst.CampBgRes[HeroConst.CampType.eWater], true),
				type = ResourcesType.single
			},
			{
				path = PathTool.getPlistImgForDownLoad("bigbg/hero", HeroConst.CampBottomBgRes[HeroConst.CampType.eWater], false),
				type = ResourcesType.single
			},
			{
				path = PathTool.getPlistImgForDownLoad("hero", "hero"),
				type = ResourcesType.plist
			}
		}
	elseif slot2 == HeroConst.SacrificeType.eHeroSacrifice then
		slot0.res_list = {
			{
				path = PathTool.getPlistImgForDownLoad("bigbg/hero", "hero_reset_bg", true),
				type = ResourcesType.single
			},
			{
				path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_3", false),
				type = ResourcesType.single
			}
		}
	elseif slot2 == HeroConst.SacrificeType.eHeroReplace then
		slot0.res_list = {
			{
				path = PathTool.getPlistImgForDownLoad("bigbg/action", "txt_cn_hero_convert_bg", true),
				type = ResourcesType.single
			},
			{
				path = PathTool.getPlistImgForDownLoad("bigbg/action", "txt_cn_hero_convert_stage", false),
				type = ResourcesType.single
			}
		}
	elseif slot2 == HeroConst.SacrificeType.eHeroDisband then
		slot0.res_list = {
			{
				path = PathTool.getPlistImgForDownLoad("actionheroreset", "actionheroreset"),
				type = ResourcesType.plist
			},
			{
				path = PathTool.getPlistImgForDownLoad("bigbg/hero", "hero_return_bg", true),
				type = ResourcesType.single
			}
		}
	end
end

function HeroResetWindow.open_callback(slot0)
	slot0.main_panel = slot0.root_wnd:getChildByName("main_container")
	slot0.reset_container = slot0.main_panel:getChildByName("reset_container")

	slot0.reset_container:setZOrder(2)
	slot0.reset_container:setVisible(true)

	slot0.tab_list = {}
	slot0.tab_container = slot0.main_panel:getChildByName("tab_container")
	slot4 = 3

	slot0.tab_container:setZOrder(slot4)

	for slot4 = 1, 5 do
		if slot0.tab_container:getChildByName("tab_btn_" .. slot4) then
			slot6 = {
				unselect_bg = slot5:getChildByName("unselect_bg")
			}

			slot6.unselect_bg:setVisible(true)

			slot6.select_bg = slot5:getChildByName("select_bg")

			slot6.select_bg:setVisible(false)

			slot6.lable = slot5:getChildByName("title")
			slot6.tab_btn = slot5
			slot6.index = slot4
			slot6.is_hide = false
			slot0.tab_list[slot4] = slot6
		end
	end

	slot0:adaptationScreen()
end

function HeroResetWindow.updateTab(slot0, slot1)
	slot0.tab_type_list = {
		HeroConst.SacrificeType.eHeroFuse,
		HeroConst.SacrificeType.eHeroSacrifice
	}

	if not uv0 then
		return
	end

	if uv1.hero_exchange_limit and uv1.hero_exchange_limit.val <= uv0.lev then
		table.insert(slot0.tab_type_list, HeroConst.SacrificeType.eHeroReplace)
	end

	if uv1.hero_return_limit and uv1.hero_return_limit.val <= uv0.lev then
		table.insert(slot0.tab_type_list, HeroConst.SacrificeType.eHeroDisband)
	end

	if uv1.hero_super_up and uv1.hero_super_up.val <= uv0.lev then
		table.insert(slot0.tab_type_list, HeroConst.SacrificeType.eSuperAdvance)
	end

	if slot0.tab_list[#slot0.tab_type_list] then
		slot0.tab_list[slot2].select_bg:loadTexture(PathTool.getResFrame("common", "common_2027"), LOADTEXT_TYPE_PLIST)
		slot0.tab_list[slot2].unselect_bg:loadTexture(PathTool.getResFrame("common", "common_2026"), LOADTEXT_TYPE_PLIST)
		slot0.tab_list[slot2].select_bg:setScale9Enabled(true)
		slot0.tab_list[slot2].unselect_bg:setScale9Enabled(true)
		slot0.tab_list[slot2].select_bg:setCapInsets(cc.rect(25, 25, 1, 11))
		slot0.tab_list[slot2].unselect_bg:setCapInsets(cc.rect(25, 25, 1, 11))
	end

	for slot6, slot7 in ipairs(slot0.tab_list) do
		if slot0.tab_type_list[slot6] then
			slot7.is_hide = false
			slot7.type = slot0.tab_type_list[slot6]

			slot7.lable:setString(HeroConst.tabType[slot7.type])

			if slot0.select_index and slot0.select_index == slot7.type then
				slot0.cur_tab_index = slot6
			end
		else
			slot7.is_hide = true

			if slot0.cur_tab_index and slot0.cur_tab_index == slot6 then
				slot0.cur_tab_index = 1
			end
		end

		slot7.tab_btn:setVisible(not slot7.is_hide)
	end

	if slot0.cur_tab_index == nil then
		slot0.cur_tab_index = 1
	end

	if slot0.tab_container then
		slot0.tab_container:setPositionX(360 + (5 - #slot0.tab_type_list) * 143 / 2)
	end

	slot0:changeSelectedTab(slot0.cur_tab_index, slot1)
end

function HeroResetWindow.adaptationScreen(slot0)
	slot2 = display.getBottom(slot0.main_panel)
	slot3 = display.getLeft(slot0.main_panel)
	slot4 = display.getRight(slot0.main_panel)

	slot0.tab_container:setPositionY(display.getTop(slot0.main_panel) - (slot0.main_panel:getContentSize().height - slot0.tab_container:getPositionY()))
end

function HeroResetWindow.register_event(slot0)
	for slot4, slot5 in pairs(slot0.tab_list) do
		if slot5.tab_btn then
			slot5.tab_btn:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended then
					playTabButtonSound()
					uv0:changeSelectedTab(uv1.index)
				end
			end)
		end
	end
end

function HeroResetWindow.changeSelectedTab(slot0, slot1, slot2)
	if not slot0.tab_type_list then
		return
	end

	if slot0.tab_object ~= nil and slot0.tab_object.index == slot1 then
		return
	end

	if slot0.tab_object then
		slot0.tab_object.select_bg:setVisible(false)

		slot0.tab_object = nil
	end

	if not slot0.tab_type_list[slot1] then
		return
	end

	slot0.cur_tab_index = slot1
	slot0.select_index = slot3
	slot0.tab_object = slot0.tab_list[slot0.cur_tab_index]

	if slot0.tab_object then
		slot0.tab_object.select_bg:setVisible(true)
	end

	if slot0.select_panel and slot0.select_panel.setVisibleStatus then
		slot0.select_panel:setVisibleStatus(false)
	end

	slot0.select_panel = slot0:createPanel(slot0.select_index, slot2)

	if slot0.select_panel and slot0.select_panel.setVisibleStatus then
		slot0.select_panel:setVisibleStatus(true)
	end
end

function HeroResetWindow.createPanel(slot0, slot1, slot2)
	if slot0.view_list[slot1] == nil then
		if slot1 == HeroConst.SacrificeType.eHeroFuse then
			slot3 = HeroUpgradeStarFusePanel.new(slot2)
		elseif slot1 == HeroConst.SacrificeType.eHeroReplace then
			slot3 = ActionHeroConvertPanel.new(slot0)
		elseif slot1 == HeroConst.SacrificeType.eHeroSacrifice then
			slot3 = HeroSacrificePanel.new()
		elseif slot1 == HeroConst.SacrificeType.eHeroDisband then
			slot3 = HeroResetPanel.new()
		elseif slot1 == HeroConst.SacrificeType.eSuperAdvance then
			slot3 = HeroUpgradeStarSuperAdvancePanel.new()
		end

		slot3:setPosition(cc.p(0, 0))
		slot0.reset_container:addChild(slot3)

		slot0.view_list[slot1] = slot3
	end

	return slot3
end

function HeroResetWindow.openRootWnd(slot0, slot1, slot2)
	slot0.select_index = slot1 or HeroConst.SacrificeType.eHeroFuse
	slot0.is_send_proto = nil

	slot0:updateTab(slot2 or nil)
end

function HeroResetWindow.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.view_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	uv0:openHeroResetWindow(false)
end
