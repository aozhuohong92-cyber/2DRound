ElitematchRewardPanel = ElitematchRewardPanel or BaseClass(BaseView)
slot0 = ElitematchController:getInstance()
slot1 = string.format
slot2 = table.insert
slot3 = table.sort

function ElitematchRewardPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = false
	slot0.layout_name = "elitematch/elitematch_reward_panel"
	slot0.res_list = {}
	slot0.dic_reward_list = {}
	slot0.show_list = {}
end

function ElitematchRewardPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot5 = 1

	slot0:playEnterAnimatianByObj(slot0.main_container, slot5)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.tab_container = slot0.main_panel:getChildByName("tab_container")
	slot1 = {
		TI18N("首达奖励"),
		TI18N("段位奖励")
	}
	slot0.tab_list = {}

	for slot5 = 1, 2 do
		if slot0.tab_container:getChildByName("tab_btn_" .. slot5) then
			slot7 = {
				select_bg = slot6:getChildByName("select_bg")
			}

			slot7.select_bg:setVisible(false)

			slot7.unselect_bg = slot6:getChildByName("unselect_bg")
			slot7.title = slot6:getChildByName("title")

			slot7.title:setTextColor(cc.c4b(207, 181, 147, 255))

			if slot1[slot5] then
				slot7.title:setString(slot1[slot5])
			end

			slot7.tab_btn = slot6
			slot7.index = slot5
			slot0.tab_list[slot5] = slot7
		end
	end

	slot0.title = slot0.main_panel:getChildByName("win_title")
	slot5 = TI18N

	slot0.title:setString(slot5("奖励预览"))

	slot0.col_name_list = {
		{
			TI18N("段位"),
			TI18N("奖励")
		},
		{
			TI18N("段位"),
			TI18N("奖励")
		},
		{
			TI18N("排名"),
			TI18N("奖励")
		}
	}
	slot0.col_name_label = {}

	for slot5 = 1, 2 do
		slot0.col_name_label[slot5] = slot0.main_panel:getChildByName("col_name" .. slot5)
	end

	slot0.scroll_container = slot0.main_panel:getChildByName("scroll_container")
	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.top_label = slot0.main_panel:getChildByName("top_label")
	slot0.bottom_label = slot0.main_panel:getChildByName("bottom_label")
	slot0.bottom_left_label = slot0.main_panel:getChildByName("bottom_left_label")
end

function ElitematchRewardPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 1)

	slot4 = handler(slot0, slot0.onClickBtnClose)
	slot5 = true

	registerButtonEventListener(slot0.close_btn, slot4, slot5, 2)

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

function ElitematchRewardPanel.onClickBtnClose(slot0)
	uv0:openElitematchRewardPanel(false)
end

function ElitematchRewardPanel.changeSelectedTab(slot0, slot1)
	if slot0.tab_object ~= nil and slot0.tab_object.index == slot1 then
		return
	end

	if slot0.tab_object then
		slot0.tab_object.select_bg:setVisible(false)
		slot0.tab_object.title:setTextColor(cc.c4b(207, 181, 147, 255))

		slot0.tab_object = nil
	end

	slot0.tab_object = slot0.tab_list[slot1]

	if slot0.tab_object then
		slot0.tab_object.select_bg:setVisible(true)
		slot0.tab_object.title:setTextColor(cc.c4b(255, 237, 214, 255))
	end

	if slot0.col_name_list[slot1] then
		for slot5, slot6 in ipairs(slot0.col_name_label) do
			if slot0.col_name_list[slot1][slot5] then
				slot6:setString(slot0.col_name_list[slot1][slot5])
			end
		end
	end

	slot2 = Config.ArenaEliteData.data_elite_level[slot0.level_id]

	if slot1 == 1 then
		slot0.top_label:setString(TI18N("每个赛季首次提升对应段位可手动领取"))

		if slot2 then
			slot0.bottom_label:setString(TI18N("当前你的段位为:") .. slot2.name)
		end

		slot0.bottom_left_label:setString("")
	elseif slot1 == 2 then
		slot0.top_label:setString(TI18N("分别在上,下赛季结束后发放"))

		if slot2 then
			slot0.bottom_label:setString(TI18N("当前你的段位为:") .. slot2.name)
		end

		slot0.bottom_left_label:setString("")
	end

	slot0:updateList(slot1)
end

function ElitematchRewardPanel.openRootWnd(slot0, slot1, slot2, slot3)
	slot0.level_id = slot2 or 1
	slot0.rank = slot3 or 0

	slot0:initData()
	slot0:changeSelectedTab(slot1 or 1)
end

function ElitematchRewardPanel.initData(slot0)
	slot0.dic_reward_list[1] = {}
	slot0.dic_reward_list[2] = {}
	slot0.dic_reward_list[3] = {}

	if Config.ArenaEliteData.data_elite_level then
		for slot5, slot6 in pairs(slot1) do
			if #slot6.lev_award > 0 then
				uv0(slot0.dic_reward_list[1], {
					id = slot6.id,
					reward = slot6.lev_award,
					config = slot6
				})
			end

			if #slot6.award > 0 then
				uv0(slot0.dic_reward_list[2], {
					id = slot6.id,
					reward = slot6.award_client,
					config = slot6
				})
			end
		end
	end

	uv1(slot0.dic_reward_list[1], function (slot0, slot1)
		return slot1.id < slot0.id
	end)
	uv1(slot0.dic_reward_list[2], function (slot0, slot1)
		return slot1.id < slot0.id
	end)
end

function ElitematchRewardPanel.updateList(slot0, slot1)
	if not slot1 then
		return
	end

	if slot0.item_scrollview == nil then
		slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.scroll_container, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.scroll_container:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 0,
			row = 1,
			space_x = 0,
			item_width = 628,
			item_height = 138,
			space_y = 0,
			col = 1
		}, cc.p(0, 0))

		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.show_list = slot0.dic_reward_list[slot1]

	slot0.item_scrollview:reloadData()
end

function ElitematchRewardPanel.createNewCell(slot0, slot1, slot2)
	return ElitematchRewardItem.new()
end

function ElitematchRewardPanel.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function ElitematchRewardPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	if not slot0.tab_object then
		return
	end

	slot1:setData(slot3, slot0.tab_object.index)
end

function ElitematchRewardPanel.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	uv0:openElitematchRewardPanel(false)
end

ElitematchRewardItem = class("ElitematchRewardItem", function ()
	return ccui.Widget:create()
end)

function ElitematchRewardItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function ElitematchRewardItem.configUI(slot0)
	slot0.size = cc.size(628, 138)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("elitematch/elitematch_reward_item"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("container")
	slot0.icon = slot2:getChildByName("icon")
	slot0.level_name = slot2:getChildByName("level_name")
	slot0.level_name2 = slot2:getChildByName("level_name2")

	slot0.level_name2:enableOutline(cc.c3b(0, 0, 0), 2)

	slot0.item_scrollview = slot2:getChildByName("item_scrollview")

	slot0.item_scrollview:setScrollBarEnabled(false)
	slot0.item_scrollview:setSwallowTouches(false)

	slot0.setting = {
		scale = 0.8,
		max_count = 3
	}
end

function ElitematchRewardItem.register_event(slot0)
end

function ElitematchRewardItem.setData(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	if not slot2 then
		return
	end

	slot0.data = slot1

	if slot2 == 3 then
		slot0.icon:setVisible(true)
		slot0.level_name:setVisible(false)
		slot0.level_name2:setVisible(false)

		if slot1.id == 1 then
			loadSpriteTexture(slot0.icon, PathTool.getResFrame("common", "common_2001"), LOADTEXT_TYPE_PLIST)
		elseif slot1.id == 2 then
			loadSpriteTexture(slot0.icon, PathTool.getResFrame("common", "common_2002"), LOADTEXT_TYPE_PLIST)
		elseif slot1.id == 3 then
			loadSpriteTexture(slot0.icon, PathTool.getResFrame("common", "common_2003"), LOADTEXT_TYPE_PLIST)
		else
			slot0.icon:setVisible(false)
			slot0.level_name:setVisible(true)
			slot0.level_name:setString(slot1.name)
		end
	else
		slot0.level_name:setVisible(false)
		slot0.level_name2:setVisible(true)

		if slot1.config then
			slot0.level_name2:setString(slot1.config.name)
			slot0.icon:setVisible(true)

			if slot1.config.little_ico == nil or slot3 == "" then
				slot3 = "icon_iron"
			end

			slot0.item_load = loadSpriteTextureFromCDN(slot0.icon, PathTool.getPlistImgForDownLoad("elitematch/elitematch_icon", slot3, false), ResourcesType.single, slot0.item_load)
		end
	end

	slot0.item_list = commonShowSingleRowItemList(slot0.item_scrollview, slot0.item_list, slot1.reward or {}, slot0.setting)
end

function ElitematchRewardItem.DeleteMe(slot0)
	if slot0.item_list then
		for slot4, slot5 in ipairs(slot0.item_list) do
			slot5:DeleteMe()
		end
	end

	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
