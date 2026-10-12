HeroBagWindow = HeroBagWindow or BaseClass(BaseView)
slot1 = HeroController:getInstance():getModel()
slot2 = string.format
slot3 = table.sort
slot4 = table.insert

function HeroBagWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Full
	slot0.layout_name = "hero/hero_bag_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("herobag", "herobag"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/hero", "hero_bag_bg", true),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/hero", "hero_bag_bg_1", false),
			type = ResourcesType.single
		}
	}
	slot0.hero_bag_list = {}
	slot0.dic_pokedex_info = {}
	slot0.select_camp = 0
	slot0.is_must_reset = true
	slot0.btn_pos_list = {}
end

function HeroBagWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg/hero", "hero_bag_bg", true), LOADTEXT_TYPE)
	slot0.background:setScale(display.getMaxScale())

	slot0.mainContainer = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.mainContainer, 1)

	slot0.container = slot0.mainContainer:getChildByName("container")
	slot0.box_1 = slot0.mainContainer:getChildByName("box_1")

	slot0.box_1:loadTexture(PathTool.getPlistImgForDownLoad("bigbg/hero", "hero_bag_bg_1", false), LOADTEXT_TYPE)

	slot0.no_vedio_image = slot0.container:getChildByName("no_vedio_image")
	slot0.no_vedio_label = slot0.container:getChildByName("no_vedio_label")

	slot0.no_vedio_image:setVisible(false)
	slot0.no_vedio_label:setVisible(false)
	slot0.no_vedio_label:setString(TI18N("一个英雄都没有哦，快去召唤吧"))

	slot0.lay_scrollview = slot0.container:getChildByName("lay_scrollview")
	slot0.con_panel = slot0.container:getChildByName("con_panel")
	slot0.img_line = slot0.container:getChildByName("img_line")
	slot1 = slot0.container:getChildByName("camp_node")
	slot0.camp_node = slot1
	slot0.camp_btn_list = {}
	slot0.camp_redpoint_list = {}
	slot0.camp_btn_list[0] = slot1:getChildByName("camp_btn0")
	slot0.camp_btn_list[1] = slot1:getChildByName("camp_btn1")
	slot0.camp_btn_list[2] = slot1:getChildByName("camp_btn2")
	slot0.camp_btn_list[3] = slot1:getChildByName("camp_btn3")
	slot0.camp_btn_list[4] = slot1:getChildByName("camp_btn4")
	slot0.camp_btn_list[5] = slot1:getChildByName("camp_btn5")
	slot0.img_select = slot1:getChildByName("img_select")
	slot2, slot3 = slot0.camp_btn_list[0]:getPosition()

	slot0.img_select:setPosition(slot2 - 0.5, slot3 + 1)

	slot0.camp_btn_size = slot0.camp_btn_list[1]:getContentSize()
	slot0.tab_btn_list = {}

	for slot10 = 1, 4 do
		slot11 = {
			btn = slot12,
			index = ({
				HeroConst.BagTab.eBagHero,
				HeroConst.BagTab.eBagPokedex,
				HeroConst.BagTab.eElfin,
				HeroConst.BagTab.eHalidom
			})[slot10],
			select_bg = slot12:getChildByName("select_img")
		}
		slot12 = slot0.container:getChildByName("tab_container"):getChildByName("tab_btn_" .. slot10)

		slot11.select_bg:setVisible(false)

		slot11.title = slot12:getChildByName("label")

		slot11.title:setString(({
			TI18N("英雄"),
			TI18N("图鉴"),
			TI18N("幽灵"),
			TI18N("信念")
		})[slot10])
		slot11.title:setTextColor(cc.c4b(248, 194, 60, 255))
		slot11.title:setFontSize(24)

		slot11.red_point = slot12:getChildByName("red_point")

		slot11.red_point:setVisible(false)

		slot0.tab_btn_list[slot11.index] = slot11
	end

	slot0.embattle_btn = slot0.container:getChildByName("embattle_btn")
	slot0.item_buy_panel = slot0.container:getChildByName("item_buy_panel")
	slot0.hero_label = slot0.item_buy_panel:getChildByName("label")
	slot0.add_btn = slot0.item_buy_panel:getChildByName("add_btn")
	slot0.library_btn = slot0.container:getChildByName("library_btn")

	if slot0.library_btn:getChildByName("label") then
		slot7:setString(TI18N("图书馆"))
	end

	slot0.library_btn:setVisible(false)
	slot0:updateTabBtnStatus()
end

function HeroBagWindow.register_event(slot0)
	slot4 = handler(slot0, slot0._onClickBtnEmbattle)
	slot5 = true

	registerButtonEventListener(slot0.embattle_btn, slot4, slot5, 2)

	for slot4, slot5 in ipairs(slot0.tab_btn_list) do
		registerButtonEventListener(slot5.btn, function ()
			uv0:changeTabIndex(uv1.index)
		end, false, 2)
	end

	for slot4, slot5 in pairs(slot0.camp_btn_list) do
		registerButtonEventListener(slot5, function ()
			uv0:_onClickBtnShowByIndex(uv1)
		end, true, 2)
	end

	registerButtonEventListener(slot0.add_btn, handler(slot0, slot0.onClickAddBtn), true, 2)
	registerButtonEventListener(slot0.library_btn, handler(slot0, slot0.onClickLibraryBtn), true, 2)
	slot0:addGlobalEvent(HeroEvent.All_Hero_Detail_Info_Event, function (slot0)
		HeroCalculate.checkAllHeroRedPoint()
	end)
	slot0:addGlobalEvent(HeroEvent.Buy_Hero_Max_Count_Event, function ()
		uv0:updateHeroMaxInfo()
	end)
	slot0:addGlobalEvent(HeroEvent.Form_Drama_Event, function ()
		uv0:updateEmbattleBtnRedPoint()
	end)
	slot0:addGlobalEvent(HeroEvent.Hero_Data_Add, function ()
		uv0.hero_bag_list = uv1:getAllHeroArray()
		uv0.is_must_reset = true

		uv0:updateHeroList(uv0.select_camp)

		uv0.is_must_reset = false

		uv0:updateEmbattleBtnRedPoint()
		uv0:updateHeroMaxInfo()
	end)
	slot0:addGlobalEvent(HeroEvent.Del_Hero_Event, function ()
		uv0.hero_bag_list = uv1:getAllHeroArray()
		uv0.is_must_reset = true

		uv0:updateHeroList(uv0.select_camp)

		uv0.is_must_reset = false

		uv0:updateHeroMaxInfo()
	end)
	slot0:addGlobalEvent(HeroEvent.All_Hero_RedPoint_Event, function (slot0)
		uv0:updateHeroBagRedpoint(slot0)
	end)
	slot0:addGlobalEvent(HeroEvent.All_Hero_Base_Info_Event, function (slot0)
		uv0.hero_bag_list = uv1:getAllHeroArray()
		uv0.is_must_reset = true

		uv0:updateHeroList(uv0.select_camp)

		uv0.is_must_reset = false

		uv0:updateEmbattleBtnRedPoint()
		uv0:updateHeroMaxInfo()
	end)
	slot0:addGlobalEvent(HalidomEvent.Update_Halidom_Red_Event, function (slot0)
		uv0:updateHeroBagHalidomRedStatus(true)
	end)
	slot0:addGlobalEvent(ElfinEvent.Update_Elfin_Red_Event, function (slot0)
		uv0:updateHeroBagElfinRedStatus()
	end)
	slot0:addGlobalEvent(BackpackEvent.ADD_GOODS, function (slot0, slot1)
		if not uv0.list_view then
			return
		end

		if slot0 ~= BackPackConst.Bag_Code.EQUIPS then
			for slot5, slot6 in pairs(slot1) do
				if slot6.base_id == uv1.upgrade_star_cost_id or slot6.base_id == uv1.upgrade_star_cost_id_2 then
					uv0.list_view:resetCurrentItems()
				end
			end
		end
	end)
	slot0:addGlobalEvent(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
		if not uv0.list_view then
			return
		end

		if slot0 ~= BackPackConst.Bag_Code.EQUIPS then
			for slot5, slot6 in pairs(slot1) do
				if slot6.base_id == uv1.upgrade_star_cost_id or slot6.base_id == uv1.upgrade_star_cost_id_2 then
					uv0.list_view:resetCurrentItems()
				end
			end
		end
	end)
	slot0:addGlobalEvent(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
		if not uv0.list_view then
			return
		end

		if slot0 ~= BackPackConst.Bag_Code.EQUIPS then
			for slot5, slot6 in pairs(slot1) do
				if slot6.base_id == uv1.upgrade_star_cost_id or slot6.base_id == uv1.upgrade_star_cost_id_2 then
					uv0.list_view:resetCurrentItems()
				end
			end
		end
	end)
	slot0:addGlobalEvent(GuideEvent.Update_Guide_Open_Event, function ()
		if uv0.select_btn and uv0.select_btn.index == HeroConst.BagTab.eBagHero and uv0.select_camp == 0 and uv0.list_view then
			uv0.list_view:resetCurrentItems()
		end
	end)

	if not slot0.role_assets_event then
		if slot0.role_vo == nil then
			slot0.role_vo = RoleController:getInstance():getRoleVo()
		end

		if slot0.role_vo then
			slot0.role_assets_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
				if slot0 == "lev" then
					uv0:updateTabBtnStatus()
					uv0:setLibraryBtnStatus()
				end
			end)
		end
	end
end

function HeroBagWindow.setLibraryBtnStatus(slot0, slot1)
	if not RoleController:getInstance():getRoleVo() then
		return
	end

	if Config.PartnerData.data_partner_const.library_level then
		if slot2.lev < slot3.val then
			setChildUnEnabled(true, slot0.library_btn)
		else
			setChildUnEnabled(false, slot0.library_btn)
		end
	else
		setChildUnEnabled(false, slot0.library_btn)
	end
end

function HeroBagWindow._onClickBtnClose(slot0)
	uv0:openHeroBagWindow(false)
end

function HeroBagWindow._onClickBtnEmbattle(slot0)
	uv0:openFormMainWindow(true)
end

function HeroBagWindow._onClickBtnShowByIndex(slot0, slot1)
	if slot0.img_select and slot0.camp_btn_list[slot1] then
		slot2, slot3 = slot0.camp_btn_list[slot1]:getPosition()

		slot0.img_select:setPosition(slot2 - 0.5, slot3 + 1)
	end

	if slot0.select_btn then
		if slot0.select_btn.index == HeroConst.BagTab.eBagHero or slot0.select_btn.index == HeroConst.BagTab.eBagPokedex then
			slot0:updateHeroList(slot1)
		elseif slot0.select_btn.index == HeroConst.BagTab.eHalidom and slot0.halidom_panel then
			slot0.halidom_panel:choseHalidomByCamp(slot1)
		end
	end
end

function HeroBagWindow.onClickAddBtn(slot0)
	if Config.PartnerData.data_partner_buy[uv0:getHeroBuyNum() + 1] then
		CommonAlert.show(uv1(TI18N("是否花费<img src='%s' scale=0.3 />%s扩充%s个英雄位置数量上限？"), PathTool.getItemRes(Config.ItemData.data_get_data(slot2.expend[1][1] or 3).icon), slot2.expend[1][2] or 100, slot2.add_num), TI18N("确定"), function ()
			uv0:sender11009()
		end, TI18N("取消"), nil, CommonAlert.type.rich)
	else
		message(TI18N("购买次数已达上限"))
	end
end

function HeroBagWindow.onClickLibraryBtn(slot0)
	if not RoleController:getInstance():getRoleVo() then
		return
	end

	if Config.PartnerData.data_partner_const.library_level and slot1.lev < slot2.val then
		message(slot2.desc)

		return
	end

	HeroController:getInstance():openHeroLibraryMainWindow(true)
end

function HeroBagWindow.updateTabBtnStatus(slot0)
	if not slot0.tab_btn_list then
		return
	end

	for slot4, slot5 in ipairs(slot0.tab_btn_list) do
		slot6 = true

		if slot5.index == HeroConst.BagTab.eHalidom then
			slot6 = HalidomController:getInstance():getModel():checkHalidomIsOpen(true)
		elseif slot5.index == HeroConst.BagTab.eElfin then
			slot6 = ElfinController:getInstance():getModel():checkElfinIsOpen(true)
		end

		if slot5.btn then
			setChildUnEnabled(not slot6, slot5.btn)
		end
	end
end

function HeroBagWindow.changeTabIndex(slot0, slot1)
	if slot0.select_btn and slot0.select_btn.index == slot1 then
		return
	end

	if slot1 == HeroConst.BagTab.eHalidom then
		if not HalidomController:getInstance():getModel():checkHalidomIsOpen() then
			return
		end
	elseif slot1 == HeroConst.BagTab.eElfin and not ElfinController:getInstance():getModel():checkElfinIsOpen() then
		return
	end

	if slot0.select_btn then
		slot0.select_btn.select_bg:setVisible(false)
		slot0.select_btn.title:setTextColor(cc.c4b(248, 194, 60, 255))
		slot0.select_btn.title:setFontSize(24)
	end

	slot0.select_btn = slot0.tab_btn_list[slot1]

	if slot0.select_btn then
		slot0.select_btn.select_bg:setVisible(true)
		slot0.select_btn.title:setTextColor(cc.c4b(255, 255, 255, 255))
		slot0.select_btn.title:setFontSize(28)
	end

	if slot0.library_btn then
		slot0.library_btn:setVisible(false)
	end

	if slot1 == HeroConst.BagTab.eBagHero then
		slot0.lay_scrollview:setVisible(true)
		slot0.con_panel:setVisible(false)
		slot0:setCampBtnPos(1)

		slot0.select_camp = 0

		slot0.item_buy_panel:setVisible(true)
		slot0:updateHeroMaxInfo()
	elseif slot1 == HeroConst.BagTab.eBagPokedex then
		slot0.lay_scrollview:setVisible(true)
		slot0.con_panel:setVisible(false)
		slot0:setCampBtnPos(2)

		slot0.select_camp = 1

		slot0.item_buy_panel:setVisible(false)
	elseif slot1 == HeroConst.BagTab.eHalidom then
		if not slot0.halidom_panel then
			slot0.halidom_panel = HalidomMainPanel.new(handler(slot0, slot0._onChangeSelectCamp))

			slot0.con_panel:addChild(slot0.halidom_panel)
		end

		if slot0.elfin_panel then
			slot0.elfin_panel:setVisible(false)
		end

		slot0.halidom_panel:setVisible(true)
		slot0.lay_scrollview:setVisible(false)
		slot0.con_panel:setVisible(true)
		slot0:setCampBtnPos(2)

		slot0.select_camp = 1

		slot0.item_buy_panel:setVisible(false)
		slot0.no_vedio_image:setVisible(false)
		slot0.no_vedio_label:setVisible(false)
	elseif slot1 == HeroConst.BagTab.eElfin then
		if not slot0.elfin_panel then
			slot0.elfin_panel = ElfinMainPanel.new(slot0.sub_type)

			slot0.con_panel:addChild(slot0.elfin_panel)
		end

		if slot0.halidom_panel then
			slot0.halidom_panel:setVisible(false)
		end

		slot0.elfin_panel:setVisible(true)
		slot0.lay_scrollview:setVisible(false)
		slot0.con_panel:setVisible(true)
		slot0.item_buy_panel:setVisible(false)
		slot0.no_vedio_image:setVisible(false)
		slot0.no_vedio_label:setVisible(false)
	end

	slot0.img_line:setVisible(slot1 ~= HeroConst.BagTab.eElfin)
	slot0.camp_node:setVisible(slot1 ~= HeroConst.BagTab.eElfin)
	slot0:updateHeroBagHalidomRedStatus()
	slot0:updateHeroBagElfinRedStatus()

	slot0.is_must_reset = true

	slot0:_onClickBtnShowByIndex(slot0.select_camp)

	slot0.is_must_reset = false
end

function HeroBagWindow._onChangeSelectCamp(slot0, slot1)
	if slot0.img_select and slot0.camp_btn_list[slot1] then
		slot2, slot3 = slot0.camp_btn_list[slot1]:getPosition()

		slot0.img_select:setPosition(slot2 - 0.5, slot3 + 1)
	end
end

function HeroBagWindow.updateHeroBagRedpoint(slot0, slot1)
	if slot0.redpoint_status == nil then
		slot0.redpoint_status = {}
	end

	for slot5, slot6 in ipairs(slot1) do
		slot0.redpoint_status[slot6.bid] = slot6.status
	end

	slot2 = false

	for slot6, slot7 in pairs(slot0.redpoint_status) do
		if slot7 == true then
			slot2 = true

			break
		end
	end

	if slot0.tab_btn_list[HeroConst.BagTab.eBagHero] then
		slot3.red_point:setVisible(slot2)
	end

	if slot0.select_btn and slot0.select_btn.index == HeroConst.BagTab.eBagHero and slot0.list_view then
		slot0.list_view:resetCurrentItems()
	end
end

function HeroBagWindow.updateHeroBagHalidomRedStatus(slot0, slot1)
	if slot0.tab_btn_list[HeroConst.BagTab.eHalidom] then
		slot4.red_point:setVisible(HalidomController:getInstance():getModel():getHalidomRedStatus())
	end

	if slot0.select_btn and slot0.select_btn.index == HeroConst.BagTab.eHalidom then
		if slot1 or not slot0.halidom_camp_red or next(slot0.halidom_camp_red) == nil then
			slot0.halidom_camp_red = {}

			for slot8, slot9 in pairs(Config.HalidomData.data_base) do
				if slot0.camp_btn_list[slot9.camp] then
					slot11 = false

					if slot2:checkHalidomIsUnlock(slot9.id) then
						if slot2:getHalidomDataById(slot9.id) and next(slot12) ~= nil and (slot12:getRedStatusByType(HalidomConst.Red_Type.Lvup) or slot12:getRedStatusByType(HalidomConst.Red_Type.Step)) then
							slot11 = true
						end
					elseif slot2:checkHalidomIsCanUnlock(slot9.id) then
						slot11 = true
					end

					slot0.halidom_camp_red[slot9.camp] = slot11

					slot0:setRedPointcamp(slot9.camp, slot11)
				end
			end
		elseif slot0.halidom_camp_red then
			for slot8, slot9 in pairs(slot0.camp_btn_list) do
				if slot8 ~= 0 then
					slot0:setRedPointcamp(slot8, slot0.halidom_camp_red[slot8])
				end
			end
		end
	else
		for slot8, slot9 in pairs(slot0.camp_btn_list) do
			if slot8 ~= 0 then
				slot0:setRedPointcamp(slot8, false)
			end
		end
	end
end

function HeroBagWindow.updateHeroBagElfinRedStatus(slot0)
	if slot0.tab_btn_list[HeroConst.BagTab.eElfin] then
		slot3.red_point:setVisible(ElfinController:getInstance():getModel():getElfinRedStatus())
	end
end

function HeroBagWindow.setRedPointcamp(slot0, slot1, slot2)
	if slot2 then
		if slot0.camp_redpoint_list[slot1] == nil then
			slot4, slot5 = slot0.camp_btn_list[slot1]:getPosition()
			red_res = PathTool.getResFrame("mainui", "mainui_1009")
			slot0.camp_redpoint_list[slot1] = createSprite(red_res, 0, 0, slot0.camp_node, cc.p(1, 1), LOADTEXT_TYPE_PLIST)

			slot0.camp_redpoint_list[slot1]:setPosition(slot4 + slot0.camp_btn_size.width * 0.5, slot5 + slot0.camp_btn_size.height * 0.5)
		end

		slot0.camp_redpoint_list[slot1]:setVisible(slot2)
	elseif slot0.camp_redpoint_list[slot1] then
		slot0.camp_redpoint_list[slot1]:setVisible(false)
	end
end

function HeroBagWindow.updateEmbattleBtnRedPoint(slot0)
	if not uv0 then
		return
	end

	slot1 = false
	slot2 = 1
	slot3 = HallowsController:getInstance():getModel():getHallowsList() or {}
	slot4 = uv0:getAllHeroArray()
	slot5 = {}
	slot7 = {
		[slot13.bid] = true
	}

	for slot11, slot12 in pairs(uv0:getMyPosList()) do
		if slot12.id and uv0:getHeroById(slot12.id) and slot13.bid then
			-- Nothing
		end
	end

	for slot11 = 1, slot2 do
		if (uv0.use_hallows_id or 0) == 0 then
			for slot16, slot17 in ipairs(slot3) do
				if slot17.id and slot5[slot17.id] == nil then
					slot1 = true

					break
				end
			end
		elseif slot12 then
			slot5[slot12] = true
		end

		if #uv0:getMyPosList(slot11) < 5 then
			slot18 = slot4

			for slot18 = 1, slot4.GetSize(slot18) do
				if slot4:Get(slot18 - 1) and slot19.bid and slot7[slot19.bid] == nil then
					slot1 = true

					break
				end
			end
		end
	end

	addRedPointToNodeByStatus(slot0.embattle_btn, slot1, 5, 0, nil, 2)
end

function HeroBagWindow.openRootWnd(slot0, slot1, slot2)
	slot0.sub_type = slot2

	if (slot1 or HeroConst.BagTab.eBagHero) == HeroConst.BagTab.eHalidom then
		slot5 = RoleController:getInstance():getRoleVo()

		if not Config.HalidomData.data_const.halidom_open_lev or not slot5 or slot5.lev < slot4.val then
			slot3 = HeroConst.BagTab.eBagHero
		end
	elseif slot3 == HeroConst.BagTab.eElfin and not ElfinController:getInstance():getModel():checkElfinIsOpen(true) then
		slot3 = HeroConst.BagTab.eBagHero
	end

	slot0.dic_had_hero_info = HeroController:getInstance():getModel():getHadHeroInfo()

	slot0:initHeroBagList()
	slot0:changeTabIndex(slot3)
	HeroCalculate.checkAllHeroRedPoint()
	slot0:updateEmbattleBtnRedPoint()
	slot0:setLibraryBtnStatus()
end

function HeroBagWindow.initHeroBagList(slot0)
	slot0.hero_bag_list = uv0:getAllHeroArray()
	slot0.dic_pokedex_info = uv0:getHeroPokedexList()
end

function HeroBagWindow.updateHeroMaxInfo(slot0)
	if slot0.hero_label then
		slot1, slot2 = uv0:getHeroMaxCount()

		slot0.hero_label:setString(uv1("%s/%s", slot2, slot1))
	end
end

function HeroBagWindow.setCampBtnPos(slot0, slot1)
	if slot0.btn_pos_list[slot1] == nil then
		slot0.btn_pos_list[slot1] = {}
		slot2 = 20
		slot3 = 58
		slot4 = 5

		if slot1 == 1 then
			slot4 = 6
		end

		for slot9 = 1, slot4 do
			slot0.btn_pos_list[slot1][slot9] = -(slot3 * slot4 + slot2 * (slot4 - 1)) * 0.5 + slot3 * 0.5 + (slot9 - 1) * (slot3 + slot2)
		end
	end

	if slot1 == 1 then
		slot5 = true

		slot0.camp_btn_list[0]:setVisible(slot5)

		for slot5 = 0, 5 do
			slot0.camp_btn_list[slot5]:setPositionX(slot0.btn_pos_list[slot1][slot5 + 1] or 0)
		end
	else
		slot5 = false

		slot0.camp_btn_list[0]:setVisible(slot5)

		for slot5 = 1, 5 do
			slot0.camp_btn_list[slot5]:setPositionX(slot0.btn_pos_list[slot1][slot5] or 0)
		end
	end
end

function HeroBagWindow.updateHeroList(slot0, slot1)
	if not slot0.is_must_reset and (slot1 or 1) == slot0.select_camp then
		return
	end

	if not slot0.list_view then
		slot5 = slot0.lay_scrollview:getContentSize()
		slot0.list_view = CommonScrollViewSingleLayout.new(slot0.lay_scrollview, cc.p(slot5.width * 0.5, slot5.height * 0.5), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(600, 680), {
			start_y = 4,
			start_x = 0,
			delay = 1,
			space_x = 0,
			item_width = 150,
			item_height = 136,
			space_y = 0,
			col = 4,
			need_dynamic = true
		}, cc.p(0.5, 0.5))

		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.select_camp = slot2
	slot3 = 0

	if slot0.select_btn and slot0.select_btn.index == HeroConst.BagTab.eBagPokedex then
		if #(slot0.dic_pokedex_info[slot0.select_camp] or {}) > 0 then
			slot0.show_list = slot4
		else
			slot0.show_list = {}
		end
	else
		slot5 = {}
		slot6 = {}
		slot10 = slot0.hero_bag_list or Array.New()

		for slot10 = 1, slot4.GetSize(slot10) do
			slot11 = slot4:Get(slot10 - 1)

			if slot2 == 0 or slot2 == slot11.camp_type then
				if slot11.isFormDrama and slot11:isFormDrama() then
					uv0(slot5, slot11)
				else
					uv0(slot6, slot11)
				end
			end
		end

		if #slot6 + #slot5 > 0 then
			slot7 = SortTools.tableCommonSorter({
				{
					"star",
					true
				},
				{
					"power",
					true
				},
				{
					"lev",
					true
				},
				{
					"sort_order",
					true
				}
			})

			uv1(slot5, slot7)
			uv1(slot6, slot7)

			for slot12 = #slot5, 1, -1 do
				uv0(slot6, 1, slot5[slot12])
			end

			slot0.show_list = slot6
		else
			slot0.show_list = {}
		end
	end

	slot0.list_view:reloadData()

	if slot3 == 0 then
		slot0.no_vedio_image:setVisible(true)
		slot0.no_vedio_label:setVisible(true)

		return
	else
		slot0.no_vedio_image:setVisible(false)
		slot0.no_vedio_label:setVisible(false)
	end
end

function HeroBagWindow.selectHero(slot0, slot1, slot2)
	if not slot2 then
		return
	end

	if not slot1 then
		return
	end

	slot3 = HeroConst.BagTab.eBagHero

	if slot0.select_btn then
		slot3 = slot0.select_btn.index or HeroConst.BagTab.eBagHero
	end

	HeroController:getInstance():openHeroMainInfoWindow(true, slot2, slot0.show_list, {
		show_model_type = slot3
	})
end

function HeroBagWindow.createNewCell(slot0, slot1, slot2)
	slot3 = HeroExhibitionItem.new(1, true)

	slot3:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot3
end

function HeroBagWindow.numberOfCells(slot0)
	return #slot0.show_list
end

function HeroBagWindow.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if slot0.show_list[slot2] then
		if slot0.select_btn then
			if slot0.select_btn.index == HeroConst.BagTab.eBagPokedex then
				slot4 = HeroController:getInstance():getModel():getHadHeroInfo()
				slot5 = nil

				slot1:setHeadUnEnabled(not slot0.dic_had_hero_info[slot3.bid] or slot3.star > slot0.dic_had_hero_info[slot3.bid])

				if slot1.partner_type then
					setChildUnEnabled(slot5, slot1.partner_type)
				end

				slot1:showRedPoint(false)
				slot1:showFightImg(false)

				slot1.from_type = HeroConst.ExhibitionItemType.eBagPokedex
			elseif slot0.select_btn.index == HeroConst.BagTab.eBagHero then
				slot1:setHeadUnEnabled(false)

				if slot1.partner_type then
					setChildUnEnabled(false, slot1.partner_type)
				end

				if HeroCalculate.isCheckHeroRedPointByHeroVo(slot3) then
					slot1:showRedPoint(HeroCalculate.checkSingleHeroRedPoint(slot3), 10, 5)
				else
					slot1:showRedPoint(false)
				end

				slot1.from_type = HeroConst.ExhibitionItemType.eHeroBag

				if slot3:isFormDrama() then
					slot1:showFightImg(true)
				else
					slot1:showFightImg(false)
				end
			end
		end

		slot1:setData(slot3)
	end
end

function HeroBagWindow.onCellTouched(slot0, slot1)
	if slot0.show_list[slot1.index] then
		slot0:selectHero(slot1, slot3)
	end
end

function HeroBagWindow.close_callback(slot0)
	if slot0.list_view then
		slot0.list_view:DeleteMe()

		slot0.list_view = nil
	end

	if slot0.halidom_panel then
		slot0.halidom_panel:DeleteMe()

		slot0.halidom_panel = nil
	end

	if slot0.elfin_panel then
		slot0.elfin_panel:DeleteMe()

		slot0.elfin_panel = nil
	end

	if slot0.role_assets_event and slot0.role_vo then
		slot0.role_vo:UnBind(slot0.role_assets_event)

		slot0.role_assets_event = nil
	end

	uv0:openHeroBagWindow(false)
end
