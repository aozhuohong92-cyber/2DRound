ArenapeakchampionGuessInfoPanel = ArenapeakchampionGuessInfoPanel or BaseClass(BaseView)
slot1 = ArenapeakchampionController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.sort

function ArenapeakchampionGuessInfoPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.is_full_screen = false
	slot0.layout_name = "arenapeakchampion/arenapeakchampion_guess_info_panel"
	slot0.res_list = {}
	slot0.show_list = {}
end

function ArenapeakchampionGuessInfoPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.title = slot0.main_panel:getChildByName("win_title")

	slot0.title:setString(TI18N("竞猜"))

	slot0.scroll_container = slot0.main_panel:getChildByName("scroll_container")
	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
end

function ArenapeakchampionGuessInfoPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 1)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickBtnClose), true, 2)
	slot0:addGlobalEvent(ArenapeakchampionEvent.ARENAPEAKCHAMPION_MY_GUESSING_INFO_EVENT, function (slot0)
		if not slot0 then
			return
		end

		uv0:setData(slot0)
	end)
end

function ArenapeakchampionGuessInfoPanel.onClickBtnClose(slot0)
	uv0:openArenapeakchampionGuessInfoPanel(false)
end

function ArenapeakchampionGuessInfoPanel.openRootWnd(slot0)
	uv0:sender27705()
end

function ArenapeakchampionGuessInfoPanel.setData(slot0, slot1)
	slot0.show_list = {}
	slot3 = {}

	for slot7, slot8 in ipairs(slot1.list or {}) do
		if slot8.step ~= 0 then
			if slot8.step == 1 then
				uv0(slot3, slot8)
			else
				uv0(slot0.show_list, slot8)
			end
		end
	end

	table.sort(slot0.show_list, SortTools.tableCommonSorter({
		{
			"step",
			false
		},
		{
			"round",
			true
		}
	}))

	function slot8(slot0, slot1)
		return slot1.round < slot0.round
	end

	table.sort(slot3, slot8)

	for slot8, slot9 in ipairs(slot3) do
		uv0(slot0.show_list, slot9)
	end

	slot0:updateList()
end

function ArenapeakchampionGuessInfoPanel.updateList(slot0)
	if slot0.item_scrollview == nil then
		slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.scroll_container, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.scroll_container:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 0,
			row = 1,
			space_x = 0,
			item_width = 606,
			item_height = 150,
			space_y = 0,
			col = 1
		}, cc.p(0, 0))

		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.item_scrollview:reloadData()

	if #slot0.show_list == 0 then
		commonShowEmptyIcon(slot0.scroll_container, true, {
			text = TI18N("暂无竞猜数据")
		})
	else
		commonShowEmptyIcon(slot0.scroll_container, false)
	end
end

function ArenapeakchampionGuessInfoPanel.createNewCell(slot0, slot1, slot2)
	return ArenapeakchampionGuessInfoItem.new(slot1, slot2)
end

function ArenapeakchampionGuessInfoPanel.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function ArenapeakchampionGuessInfoPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	slot1:setData(slot3)
end

function ArenapeakchampionGuessInfoPanel.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	uv0:openArenapeakchampionGuessInfoPanel(false)
end

ArenapeakchampionGuessInfoItem = class("ArenapeakchampionGuessInfoItem", function ()
	return ccui.Widget:create()
end)

function ArenapeakchampionGuessInfoItem.ctor(slot0, slot1, slot2)
	slot0:configUI(slot1, slot2)
	slot0:register_event()
end

function ArenapeakchampionGuessInfoItem.configUI(slot0, slot1, slot2)
	slot0.size = cc.size(slot1, slot2)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("arenapeakchampion/arenapeakchampion_guess_info_item"))

	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.root_wnd:setPosition(cc.p(slot1 * 0.5, slot2 * 0.5))
	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.left_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.left_head:setHeadLayerScale(0.8)
	slot0.container:getChildByName("left_role"):addChild(slot0.left_head)

	slot0.right_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.right_head:setHeadLayerScale(0.8)
	slot0.container:getChildByName("right_role"):addChild(slot0.right_head)

	slot0.success_img = slot0.container:getChildByName("success_img")
	slot0.check_fight_btn = slot0.container:getChildByName("check_fight_btn")
	slot0.left_name = slot0.container:getChildByName("left_name")
	slot0.right_name = slot0.container:getChildByName("right_name")
	slot0.match_step_label = slot0.container:getChildByName("match_step_label")

	slot0.match_step_label:setString("")

	slot0.guess_label = slot0.container:getChildByName("guess_label")

	slot0.guess_label:setString(TI18N("投注"))

	slot0.success_lable = slot0.container:getChildByName("success_lable")
	slot0.guess_count_info = createRichLabel(22, cc.c4b(100, 50, 35, 255), cc.p(0, 0.5), cc.p(310, 48), nil, , 1000)

	slot0.container:addChild(slot0.guess_count_info)
end

function ArenapeakchampionGuessInfoItem.register_event(slot0)
	registerButtonEventListener(slot0.check_fight_btn, handler(slot0, slot0.onClickFightBtn), true, 2)
end

function ArenapeakchampionGuessInfoItem.onClickFightBtn(slot0)
	if not slot0.data then
		return
	end

	if slot0.data.ret == 0 then
		return
	end

	uv0:openLookFightVedioPanel(slot0.data)
end

function ArenapeakchampionGuessInfoItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0.left_head:setHeadRes(slot0.data.a_face, false, LOADTEXT_TYPE, slot0.data.a_face_file, slot0.data.a_face_update_time)
	slot0.right_head:setHeadRes(slot0.data.b_face, false, LOADTEXT_TYPE, slot0.data.b_face_file, slot0.data.b_face_update_time)
	slot0.left_head:setLev(slot0.data.a_lev)
	slot0.right_head:setLev(slot0.data.b_lev)
	slot0.left_name:setString(slot0.data.a_name)
	slot0.right_name:setString(slot0.data.b_name)

	if slot0.data.ret == 0 then
		slot0.success_img:setVisible(false)
		slot0.check_fight_btn:setVisible(false)
	else
		slot0.success_img:setVisible(true)
		slot0.check_fight_btn:setVisible(true)

		if slot0.data.ret == 1 then
			slot0.success_img:setPositionX(32)
		else
			slot0.success_img:setPositionX(180)
		end
	end

	if slot0.data.target == 1 then
		slot0.guess_label:setPositionX(62)
	elseif slot0.data.target == 2 then
		slot0.guess_label:setPositionX(218)
	else
		slot0.guess_label:setPositionX(-10000)
	end

	slot2, slot3 = uv0:getMacthText(slot0.data.step, slot0.data.round)

	slot0.match_step_label:setString(slot2)
	slot0:setSuccessInfo()
end

function ArenapeakchampionGuessInfoItem.setSuccessInfo(slot0)
	if not slot0.data then
		return
	end

	slot3 = 0
	slot4 = ""

	if slot0.data.ret == 0 then
		slot0.success_lable:setString(TI18N("进行中"))

		slot4 = uv0(TI18N("投注：<img src=%s visible=true scale=0.35 /> %s"), PathTool.getItemRes(Config.ItemData.data_get_data(33).icon), slot0.data.bet)
	elseif slot0.data.ret == 1 then
		if slot0.data.target == 1 then
			slot0.success_lable:setString(TI18N("竞猜成功"))

			slot4 = uv0(TI18N("<div fontcolor=#249003>获得：</div><img src=%s visible=true scale=0.35 /><div fontcolor=#249003> %s</div>"), slot2, slot0.data.get_bet)
		elseif slot0.data.target == 2 then
			slot0.success_lable:setString(TI18N("竞猜失败"))

			slot4 = uv0(TI18N("<div fontcolor=#d95014>损失：</div><img src=%s visible=true scale=0.35 /><div fontcolor=#d95014> %s</div>"), slot2, slot0.data.bet)
		else
			slot0.success_lable:setString(TI18N(""))
		end
	elseif slot0.data.target == 1 then
		slot0.success_lable:setString(TI18N("竞猜失败"))

		slot4 = uv0(TI18N("<div fontcolor=#d95014>损失：</div><img src=%s visible=true scale=0.35 /><div fontcolor=#d95014> %s</div>"), slot2, slot0.data.bet)
	elseif slot0.data.target == 2 then
		slot0.success_lable:setString(TI18N("竞猜成功"))

		slot4 = uv0(TI18N("<div fontcolor=#249003>获得：</div><img src=%s visible=true scale=0.35 /><div fontcolor=#249003> %s</div>"), slot2, slot0.data.get_bet)
	else
		slot0.success_lable:setString(TI18N(""))
	end

	slot0.guess_count_info:setString(slot4)
end

function ArenapeakchampionGuessInfoItem.DeleteMe(slot0)
	if slot0.left_head then
		slot0.left_head:DeleteMe()

		slot0.left_head = nil
	end

	if slot0.right_head then
		slot0.right_head:DeleteMe()

		slot0.right_head = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
