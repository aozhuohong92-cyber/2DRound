ArenapeakchampionMymatchTabRecord = class("ArenapeakchampionMymatchTabRecord", function ()
	return ccui.Widget:create()
end)
slot1 = ArenapeakchampionController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format

function ArenapeakchampionMymatchTabRecord.ctor(slot0, slot1)
	slot0.parent = slot1
	slot0.role_vo = RoleController:getInstance():getRoleVo()

	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function ArenapeakchampionMymatchTabRecord.config(slot0)
end

function ArenapeakchampionMymatchTabRecord.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("arenapeakchampion/arenapeakchampion_mymatch_tab_record"))

	slot0:addChild(slot0.root_wnd)

	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.scroll_container = slot0.container:getChildByName("scroll_container")
end

function ArenapeakchampionMymatchTabRecord.registerEvents(slot0)
	if slot0.arenapeakchampion_my_match_log_event == nil then
		slot0.arenapeakchampion_my_match_log_event = GlobalEvent:getInstance():Bind(ArenapeakchampionEvent.ARENAPEAKCHAMPION_MY_MATCH_LOG_EVENT, function (slot0)
			if not slot0 then
				return
			end

			uv0:setData(slot0)
		end)
	end
end

function ArenapeakchampionMymatchTabRecord.setData(slot0, slot1)
	slot0.show_list = slot1.list or {}

	table.sort(slot0.show_list, function (slot0, slot1)
		return slot1.id < slot0.id
	end)
	slot0:updateList()
end

function ArenapeakchampionMymatchTabRecord.updateList(slot0)
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
			text = TI18N("暂无数据")
		})
	else
		commonShowEmptyIcon(slot0.scroll_container, false)
	end
end

function ArenapeakchampionMymatchTabRecord.createNewCell(slot0, slot1, slot2)
	return ArenapeakchampionMymatchTabRecordItem.new(slot1, slot2)
end

function ArenapeakchampionMymatchTabRecord.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function ArenapeakchampionMymatchTabRecord.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	slot1:setData(slot3)
end

function ArenapeakchampionMymatchTabRecord.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)

	if slot1 and not slot0.is_init then
		slot0.is_init = true

		uv0:sender27708()
	end
end

function ArenapeakchampionMymatchTabRecord.DeleteMe(slot0)
	if slot0.arenapeakchampion_my_match_log_event then
		GlobalEvent:getInstance():UnBind(slot0.arenapeakchampion_my_match_log_event)

		slot0.arenapeakchampion_my_match_log_event = nil
	end

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil
end

ArenapeakchampionMymatchTabRecordItem = class("ArenapeakchampionMymatchTabRecordItem", function ()
	return ccui.Widget:create()
end)

function ArenapeakchampionMymatchTabRecordItem.ctor(slot0, slot1, slot2)
	slot0:configUI(slot1, slot2)
	slot0:register_event()
end

function ArenapeakchampionMymatchTabRecordItem.configUI(slot0, slot1, slot2)
	slot0.size = cc.size(slot1, slot2)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("arenapeakchampion/arenapeakchampion_record_item"))

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

	slot0.result_label = slot0.container:getChildByName("result_label")
	slot0.line = slot0.container:getChildByName("line")
end

function ArenapeakchampionMymatchTabRecordItem.register_event(slot0)
	registerButtonEventListener(slot0.check_fight_btn, handler(slot0, slot0.onClickFightBtn), true, 2)
end

function ArenapeakchampionMymatchTabRecordItem.onClickFightBtn(slot0)
	if not slot0.data then
		return
	end

	uv0:openLookFightVedioPanel(slot0.data)
end

function ArenapeakchampionMymatchTabRecordItem.setData(slot0, slot1)
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
	else
		slot0.success_img:setVisible(true)

		if slot0.data.ret == 1 then
			slot0.success_img:setPositionX(32)
		else
			slot0.success_img:setPositionX(180)
		end
	end

	slot2, slot3 = uv0:getMacthText(slot0.data.step, slot0.data.round)

	slot0.match_step_label:setString(slot2 or "")

	if slot0.data.step == 1 then
		slot0.match_step_label:setPosition(284, 102)
		slot0.line:setVisible(true)
		slot0.result_label:setVisible(true)
		slot0.result_label:setString(TI18N("获得积分:" .. slot0.data.score))
	else
		slot0.line:setVisible(false)
		slot0.result_label:setVisible(false)
		slot0.match_step_label:setPosition(302, 75)
	end
end

function ArenapeakchampionMymatchTabRecordItem.DeleteMe(slot0)
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
