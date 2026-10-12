SeerpalaceMainWindow = SeerpalaceMainWindow or BaseClass(BaseView)
slot1 = SeerpalaceController:getInstance():getModel()

function SeerpalaceMainWindow.__init(slot0)
	slot0.win_type = WinType.Full
	slot0.is_full_screen = true
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("seerpalace", "seerpalace"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_66", true),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_67", true),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_77", false),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_78", false),
			type = ResourcesType.single
		}
	}
	slot0.layout_name = "seerpalace/seerpalace_main_window"
	slot0.panel_list = {}
	slot0.tab_list = {}
	slot0.label_list = {}
	slot0.role_vo = RoleController:getInstance():getRoleVo()
end

function SeerpalaceMainWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 1)

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.explain_btn = slot1:getChildByName("explain_btn")
	slot0.btn_shop = slot1:getChildByName("btn_shop")
	slot2 = slot0.btn_shop:getChildByName("label")

	slot2:setString(TI18N("声望商城"))
	UITool.SetTitleColor(slot2)

	slot0.btn_gift = slot1:getChildByName("btn_gift")
	slot3 = slot0.btn_gift:getChildByName("label")

	slot3:setString(TI18N("特权商店"))
	UITool.SetTitleColor(slot3)

	slot0.btn_score_summons = slot1:getChildByName("btn_score_summons")
	slot0.btn_score_summons_label = slot0.btn_score_summons:getChildByName("label")
	slot0.btn_score_summon_Icon = slot0.btn_score_summons:getChildByName("icon")

	if Config.ItemData.data_get_data(SeerpalaceConst.Good_jifen) then
		loadSpriteTexture(slot0.btn_score_summon_Icon, PathTool.getItemRes(slot4.icon), LOADTEXT_TYPE)
	end

	slot0.btn_score_summons_label:setString(slot0.role_vo.predict_point)

	slot0.tips_label = slot1:getChildByName("tips_label")

	slot0.tips_label:setString(TI18N("随机召唤4~5星英雄或其英雄碎片"))
	UITool.SetTitleColor(slot0.tips_label)

	for slot10 = 1, 3 do
		if slot1:getChildByName("res_layout"):getChildByName("score_bg_" .. slot10) then
			slot12 = slot11:getChildByName("score_label")
			slot14 = 0

			if slot10 == 1 then
				slot14 = BackpackController:getInstance():getModel():getBackPackItemNumByBid(SeerpalaceConst.Good_ZhiHui)

				if Config.ItemData.data_get_data(SeerpalaceConst.Good_ZhiHui) then
					slot11:getChildByName("score_image"):loadTexture(PathTool.getItemRes(slot15.icon), LOADTEXT_TYPE)
				end
			elseif slot10 == 2 then
				slot14 = BackpackController:getInstance():getModel():getBackPackItemNumByBid(SeerpalaceConst.Good_XianZhi)

				if Config.ItemData.data_get_data(SeerpalaceConst.Good_XianZhi) then
					slot13:loadTexture(PathTool.getItemRes(slot15.icon), LOADTEXT_TYPE)
				end
			elseif slot10 == 3 then
				slot14 = slot0.role_vo.recruithigh_hero

				if Config.ItemData.data_get_data(SeerpalaceConst.Good_JieJing) then
					slot13:loadTexture(PathTool.getItemRes(slot15.icon), LOADTEXT_TYPE)
				end
			end

			slot12:setString(slot14)

			slot0.label_list[slot10] = slot12
		end
	end

	slot7 = slot1:getChildByName("tab_container")

	for slot12 = 1, 2 do
		if slot7:getChildByName("tab_btn_" .. slot12) then
			slot14 = {
				unselect_bg = slot13:getChildByName("unselect_bg")
			}

			slot14.unselect_bg:setVisible(true)

			slot14.select_bg = slot13:getChildByName("select_bg")

			slot14.select_bg:setVisible(false)

			slot14.lable = slot13:getChildByName("title")

			slot14.lable:setString(({
				TI18N("伟大召唤处"),
				TI18N("英雄转换")
			})[slot12])
			UITool.SetTitleColor(slot14.lable, 2)

			slot14.tab_btn = slot13
			slot14.index = slot12
			slot0.tab_list[slot12] = slot14
		end
	end

	slot0.container = slot1:getChildByName("container")
	slot9 = display.getTop(slot1)
	slot10 = slot1:getContentSize()

	slot7:setPositionY(slot9 - 143)
	slot0.tips_label:setPositionY(slot9 - 190)
	slot6:setPositionY(slot9 - 143)
	slot0.explain_btn:setPositionY(slot9 - 143)
	slot0.btn_shop:setPositionY(slot9 - (slot10.height - slot0.btn_shop:getPositionY()))
	slot0.btn_gift:setPositionY(slot9 - (slot10.height - slot0.btn_gift:getPositionY()))
	slot0.btn_score_summons:setPositionY(slot9 - (slot10.height - slot0.btn_score_summons:getPositionY()))
end

function SeerpalaceMainWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0._onClickCloseBtn), nil, REGISTER_BUTTON_SOUND_CLOSED_TYPY)
	registerButtonEventListener(slot0.btn_shop, handler(slot0, slot0._onClickShopBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.btn_gift, handler(slot0, slot0._onClickGiftBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.btn_score_summons, handler(slot0, slot0._onScoreSummonBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)

	function slot4(slot0, slot1, slot2)
		slot3 = nil

		TipsManager:getInstance():showCommonTips(((uv0.tab_object.index ~= 1 or Config.RecruitHighData.data_seerpalace_const.game_rule1) and Config.RecruitHighData.data_seerpalace_const.game_rule2).desc, slot1:getTouchBeganPosition())
	end

	slot5 = true

	registerButtonEventListener(slot0.explain_btn, slot4, slot5, 2)

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

	slot0:addGlobalEvent(BackpackEvent.ADD_GOODS, function (slot0, slot1)
		uv0:refreshGoodNums(slot0, slot1)
	end)
	slot0:addGlobalEvent(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
		uv0:refreshGoodNums(slot0, slot1)
	end)
	slot0:addGlobalEvent(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
		uv0:refreshGoodNums(slot0, slot1)
	end)

	if slot0.role_vo ~= nil and slot0.role_assets_event == nil then
		slot0.role_assets_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "recruithigh_hero" and uv0.label_list[3] then
				uv0.label_list[3]:setString(slot1)
			elseif slot0 == "predict_point" and uv0.btn_score_summons_label then
				uv0.btn_score_summons_label:setString(slot1)
				uv0:updateBtnRed()
			elseif slot0 == "vip_lev" then
				uv0:updateBtnRed()
			end
		end)
	end

	slot0:addGlobalEvent(VipEvent.PRIVILEGE_INFO, function ()
		uv0:initBtnGift()
	end)
end

function SeerpalaceMainWindow.refreshGoodNums(slot0, slot1, slot2)
	if slot1 == BackPackConst.Bag_Code.BACKPACK then
		for slot6, slot7 in pairs(slot2) do
			if slot7 and slot7.base_id then
				if slot7.base_id == SeerpalaceConst.Good_ZhiHui and slot0.label_list[2] then
					slot0.label_list[1]:setString(BackpackController:getInstance():getModel():getBackPackItemNumByBid(SeerpalaceConst.Good_ZhiHui))
				elseif slot7.base_id == SeerpalaceConst.Good_XianZhi and slot0.label_list[3] then
					slot0.label_list[2]:setString(BackpackController:getInstance():getModel():getBackPackItemNumByBid(SeerpalaceConst.Good_XianZhi))
				end
			end
		end
	end
end

function SeerpalaceMainWindow.changeSelectedTab(slot0, slot1)
	if slot0.tab_object ~= nil and slot0.tab_object.index == slot1 then
		return
	end

	if slot1 == SeerpalaceConst.Tab_Index.Summon then
		slot0.btn_score_summons:setVisible(true)
		SeerpalaceController:getInstance():requestSummonOpen()
	else
		slot0.btn_score_summons:setVisible(false)
	end

	if slot0.tab_object then
		slot0.tab_object.select_bg:setVisible(false)

		slot0.tab_object = nil
	end

	slot0.tab_object = slot0.tab_list[slot1]

	if slot0.tab_object then
		slot0.tab_object.select_bg:setVisible(true)
	end

	if slot1 == SeerpalaceConst.Tab_Index.Summon then
		slot0.tips_label:setVisible(true)
		slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_66", true), LOADTEXT_TYPE)
	elseif slot1 == SeerpalaceConst.Tab_Index.Change then
		slot0.tips_label:setVisible(false)
		slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_67", true), LOADTEXT_TYPE)
	end

	if slot0.select_panel then
		slot0.select_panel:addToParent(false)

		slot0.select_panel = nil
	end

	slot0.select_panel = slot0.panel_list[slot1]

	if slot0.select_panel == nil then
		if slot1 == SeerpalaceConst.Tab_Index.Summon then
			slot0.select_panel = SeerpalaceSummonPanel.new()
		elseif slot1 == SeerpalaceConst.Tab_Index.Change then
			slot0.select_panel = SeerpalaceChangePanel.new()
		end

		if slot0.select_panel then
			slot0.container:addChild(slot0.select_panel)

			slot0.panel_list[slot1] = slot0.select_panel
		end
	end

	if slot0.select_panel then
		slot0.select_panel:addToParent(true)
	end
end

function SeerpalaceMainWindow.openRootWnd(slot0, slot1)
	slot0:changeSelectedTab(slot1 or SeerpalaceConst.Tab_Index.Summon)
	slot0:initBtnGift()
	slot0:updateBtnRed()
end

function SeerpalaceMainWindow.updateBtnRed(slot0)
	if slot0.btn_score_summons then
		addRedPointToNodeByStatus(slot0.btn_score_summons, uv0:getScoreSummonRed())
	end
end

function SeerpalaceMainWindow.initBtnGift(slot0)
	if VipController:getInstance():getModel():getPrivilegeDataById(101) and slot2.status == 1 then
		slot0.btn_score_summons:setPositionY(slot0.btn_gift:getPositionY())
		slot0.btn_gift:setVisible(false)
	end
end

function SeerpalaceMainWindow._onClickCloseBtn(slot0)
	uv0:openSeerpalaceMainWindow(false)
end

function SeerpalaceMainWindow._onClickShopBtn(slot0)
	uv0:openSeerpalaceShopWindow(true)
end

function SeerpalaceMainWindow._onClickGiftBtn(slot0)
	JumpController:getInstance():jumpViewByEvtData({
		7,
		VIPTABCONST.PRIVILEGE
	})
end

function SeerpalaceMainWindow._onScoreSummonBtn(slot0)
	uv0:openSeerpalaceSummonScoreWindow(true)
end

function SeerpalaceMainWindow.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.panel_list) do
		slot5:DeleteMe()
	end

	slot0.panel_list = nil

	if slot0.role_vo ~= nil and slot0.role_assets_event ~= nil then
		slot0.role_vo:UnBind(slot0.role_assets_event)

		slot0.role_assets_event = nil
	end

	uv0:openSeerpalaceMainWindow(false)
end
