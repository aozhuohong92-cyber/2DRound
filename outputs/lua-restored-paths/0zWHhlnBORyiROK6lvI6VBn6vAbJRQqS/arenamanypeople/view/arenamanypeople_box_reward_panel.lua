ArenaManyPeopleBoxRewardPanel = ArenaManyPeopleBoxRewardPanel or BaseClass(BaseView)
slot1 = ArenaManyPeopleController:getInstance():getModel()
slot2 = string.format
slot3 = table.sort
slot4 = table.insert

function ArenaManyPeopleBoxRewardPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = false
	slot0.layout_name = "arenamanypeople/amp_box_reward_panel"
	slot0.res_list = {}
	slot0.show_list = {}
end

function ArenaManyPeopleBoxRewardPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")

	ActionHelp.itemScaleAction(slot0.main_panel)

	slot0.title = slot0.main_panel:getChildByName("win_title")

	slot0.title:setString(TI18N("奖 励"))

	slot0.tips_lab = slot0.main_panel:getChildByName("tips_lab")
	slot0.scroll_container = slot0.main_panel:getChildByName("scroll_container")
	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
end

function ArenaManyPeopleBoxRewardPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 1)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickBtnClose), true, 2)
	slot0:addGlobalEvent(ArenaManyPeopleEvent.ARENAMANYPOEPLE_RECEIVE_BOX_EVENT, function (slot0)
		if not slot0 then
			return
		end

		uv0.dic_receive[slot0.id] = 2

		if uv0.item_scrollview then
			uv0.item_scrollview:resetCurrentItems()
		end
	end)
end

function ArenaManyPeopleBoxRewardPanel.onClickBtnClose(slot0)
	uv0:openArenaManyPeopleBoxRewardPanel(false)
end

function ArenaManyPeopleBoxRewardPanel.openRootWnd(slot0)
	slot0.my_team_info = uv0:getMyTeamInfo()
	slot0.my_info = uv0:getMyInfo()

	if not slot0.my_team_info or not slot0.my_info then
		return
	end

	slot0.score_lev = slot0.my_info.score_lev or 0
	slot0.dic_receive = {}

	for slot5, slot6 in ipairs(slot0.my_team_info.award_list or {}) do
		slot0.dic_receive[slot6.award_id] = slot6.status
	end

	if Config.HolidayArenaTeamData.data_elite_level[slot0.my_info.score_lev] then
		slot0.tips_lab:setString(uv1(TI18N("我的段位：%s段位"), slot2.name))
	end

	slot0:setData()
end

function ArenaManyPeopleBoxRewardPanel.setData(slot0)
	if Config.HolidayArenaTeamData.data_elite_award then
		slot2 = {}

		for slot6, slot7 in pairs(slot1) do
			uv0(slot2, slot7)
		end

		slot0.show_list = slot2

		uv1(slot0.show_list, function (slot0, slot1)
			return slot0.lev < slot1.lev
		end)
	end

	slot0:updateList()
end

function ArenaManyPeopleBoxRewardPanel.updateList(slot0)
	if slot0.item_scrollview == nil then
		slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.scroll_container, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.scroll_container:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 0,
			row = 1,
			space_x = 0,
			item_width = 600,
			item_height = 153,
			space_y = 0,
			col = 1
		}, cc.p(0, 0))

		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	if #slot0.show_list == 0 then
		commonShowEmptyIcon(slot0.scroll_container, true, {
			text = TI18N("暂无奖励信息")
		})
	else
		commonShowEmptyIcon(slot0.scroll_container, false)
	end

	slot0.item_scrollview:reloadData()
end

function ArenaManyPeopleBoxRewardPanel.createNewCell(slot0, slot1, slot2)
	return ArenaManyPeopleBoxRewardItem.new(slot1, slot2, slot0)
end

function ArenaManyPeopleBoxRewardPanel.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function ArenaManyPeopleBoxRewardPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	slot1:setData(slot3, slot0.score_lev)
end

function ArenaManyPeopleBoxRewardPanel.close_callback(slot0)
	doStopAllActions(slot0.main_panel)

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	uv0:openArenaManyPeopleBoxRewardPanel(false)
end

ArenaManyPeopleBoxRewardItem = class("ArenaManyPeopleBoxRewardItem", function ()
	return ccui.Widget:create()
end)

function ArenaManyPeopleBoxRewardItem.ctor(slot0, slot1, slot2, slot3)
	slot0.parent = slot3

	slot0:configUI(slot1, slot2)
	slot0:register_event()
end

function ArenaManyPeopleBoxRewardItem.configUI(slot0, slot1, slot2)
	slot0.size = cc.size(slot1, slot2)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("arenamanypeople/amp_box_reward_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.left_name = slot0.main_container:getChildByName("left_name")
	slot0.receive_img = slot0.main_container:getChildByName("receive_img")
	slot0.comfirm_btn = slot0.main_container:getChildByName("comfirm_btn")
	slot0.comfirm_btn_label = slot0.comfirm_btn:getChildByName("label")

	slot0.comfirm_btn_label:setString(TI18N("领 取"))

	slot0.item_scrollview = slot0.main_container:getChildByName("item_scrollview")

	slot0.item_scrollview:setScrollBarEnabled(false)
end

function ArenaManyPeopleBoxRewardItem.register_event(slot0)
	registerButtonEventListener(slot0.comfirm_btn, handler(slot0, slot0.onClickComfirmBtn), true, 2)
end

function ArenaManyPeopleBoxRewardItem.onClickComfirmBtn(slot0)
	if not slot0.data then
		return
	end

	if not slot0.parent then
		return
	end

	if slot0.parent.dic_receive[slot0.data.lev] == 0 then
		message(TI18N("未满足领取条件"))

		return
	elseif slot0.parent.dic_receive[slot0.data.lev] == 1 then
		uv0:sender29031(slot0.data.lev)
	end
end

function ArenaManyPeopleBoxRewardItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	if not slot0.parent then
		return
	end

	slot0.data = slot1

	if Config.HolidayArenaTeamData.data_elite_level[slot1.lev] then
		slot0.left_name:setString(uv0(TI18N("%s段位"), slot2.name))
	end

	if slot0.parent.dic_receive[slot1.lev] == 2 then
		slot0.comfirm_btn:setVisible(false)
		slot0.receive_img:setVisible(true)
	elseif slot0.parent.dic_receive[slot1.lev] == 1 then
		slot0.comfirm_btn:setVisible(true)
		slot0.receive_img:setVisible(false)
		setChildUnEnabled(false, slot0.comfirm_btn)
		slot0.comfirm_btn_label:enableOutline(Config.ColorData.data_color4[264], 2)
	else
		slot0.comfirm_btn:setVisible(true)
		slot0.receive_img:setVisible(false)
		setChildUnEnabled(true, slot0.comfirm_btn)
		slot0.comfirm_btn_label:disableEffect(cc.LabelEffect.OUTLINE)
	end

	slot0.item_list = commonShowSingleRowItemList(slot0.item_scrollview, slot0.item_list, slot1.award, {
		scale = 0.7,
		max_count = 3
	})
end

function ArenaManyPeopleBoxRewardItem.DeleteMe(slot0)
	if slot0.item_list then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end

		slot0.item_list = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
