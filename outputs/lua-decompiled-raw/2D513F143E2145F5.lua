BattlDramaPassVedioView = BattlDramaPassVedioView or BaseClass(BaseView)
slot0 = BattleDramaController:getInstance()
slot1 = BattleDramaController:getInstance():getModel()
slot2 = {
	Fastest = 1,
	Lowest = 2,
	Lately = 3
}

function BattlDramaPassVedioView.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "battledrama/battle_drama_vedio_view"
	slot0.res_list = {}
end

function BattlDramaPassVedioView.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("title_label"):setString(TI18N("通关录像"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot3 = slot1:getChildByName("item_container")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot3, cc.p(0, -2), ScrollViewDir.vertical, ScrollViewStartPos.top, slot3:getContentSize(), {
		start_y = 0,
		item_width = 600,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 136,
		space_y = 5,
		col = 1,
		item_class = DramaPassVedioItem
	})

	slot0.item_scrollview:setSwallowTouches(false)
	slot0.item_scrollview:setBounceEnabled(false)
end

function BattlDramaPassVedioView.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0._onClickCloseBtn), nil, 2)
	registerButtonEventListener(slot0.background, handler(slot0, slot0._onClickCloseBtn), nil, 2)
	slot0:addGlobalEvent(Battle_dramaEvent.UpdatePassVedioDataEvent, function (slot0)
		uv0:setData(slot0)
	end)
end

function BattlDramaPassVedioView._onClickCloseBtn(slot0)
	uv0:openDramaPassVedioView(false)
end

function BattlDramaPassVedioView.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot3 = {}

	for slot7 = 1, 3 do
		table.insert(slot3, function (slot0)
			for slot4, slot5 in pairs(uv0) do
				if slot5.type == slot0 then
					return slot5
				end
			end
		end(slot7) or {
			type = slot7
		})
	end

	slot0.item_scrollview:setData(slot3)
end

function BattlDramaPassVedioView.openRootWnd(slot0)
	if uv0:getDramaData() then
		uv1:send13015(slot1.dun_id)
	end
end

function BattlDramaPassVedioView.close_callback(slot0)
	uv0:openDramaPassVedioView(false)
end

DramaPassVedioItem = class("DramaPassVedioItem", function ()
	return ccui.Widget:create()
end)

function DramaPassVedioItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function DramaPassVedioItem.configUI(slot0)
	slot0.size = cc.size(600, 136)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("battledrama/battle_drama_vedio_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.type_label = slot0.root_wnd:getChildByName("type_label")
	slot0.empty_label = slot0.root_wnd:getChildByName("empty_label")

	slot0.empty_label:setString(TI18N("虚位以待"))

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.name_label = slot0.container:getChildByName("name_label")
	slot0.desc_label = slot0.container:getChildByName("desc_label")
	slot0.check_btn = slot0.container:getChildByName("check_btn")

	slot0.check_btn:setTitleText(TI18N("查看"))
end

function DramaPassVedioItem.register_event(slot0)
	registerButtonEventListener(slot0.check_btn, handler(slot0, slot0._onClickCheckBtn))
end

function DramaPassVedioItem._onClickCheckBtn(slot0)
	if slot0.data and slot0.data.repaly_id and slot0.data.sid then
		BattleController:getInstance():csRecordBattle(slot0.data.repaly_id, slot0.data.sid)
	end
end

function DramaPassVedioItem.setData(slot0, slot1)
	slot0.data = slot1 or {}

	if not slot0.data.type then
		return
	end

	if slot0.data.type == 1 then
		slot0.type_label:setString(TI18N("最快"))
	elseif slot0.data.type == 2 then
		slot0.type_label:setString(TI18N("最低"))
	elseif slot0.data.type == 3 then
		slot0.type_label:setString(TI18N("最近"))
	end

	if slot0.data.rid == nil then
		slot0.empty_label:setVisible(true)
		slot0.container:setVisible(false)
	else
		slot0.empty_label:setVisible(false)
		slot0.container:setVisible(true)
		slot0.name_label:setString(slot0.data.name)

		if not slot0.player_head then
			slot0.player_head = PlayerHead.new(PlayerHead.type.circle)

			slot0.player_head:setHeadRes(slot0.data.face_id, false, LOADTEXT_TYPE, slot0.data.face_file, slot0.data.face_update_time)
			slot0.player_head:setPosition(80, slot0.size.height / 2)
			slot0.container:addChild(slot0.player_head)
		end

		if slot0.data.type == 1 then
			slot0.desc_label:setString(string.format(TI18N("通关时间:%s"), TimeTool.GetTimeFormat(slot0.data.time)))
		elseif slot0.data.type == 2 then
			slot0.desc_label:setString(string.format(TI18N("最低战力:%d"), slot0.data.power))
		elseif slot0.data.type == 3 then
			slot0.desc_label:setString(string.format(TI18N("通关时间:%s"), TimeTool.GetTimeFormat(slot0.data.time)))
		end
	end
end

function DramaPassVedioItem.DeleteMe(slot0)
	if slot0.player_head then
		slot0.player_head:DeleteMe()

		slot0.player_head = nil
	end
end
