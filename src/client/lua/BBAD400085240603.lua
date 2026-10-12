BattleBuffListView = BattleBuffListView or BaseClass(BaseView)
slot1 = BattleController:getInstance():getModel()
slot2 = table.insert

function BattleBuffListView.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.layout_name = "battle/battle_buff_list_view"
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
end

function BattleBuffListView.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot0.container, 2)

	slot0.arrow_sp = slot0.container:getChildByName("Sprite_2")

	slot0.arrow_sp:setVisible(false)

	slot1 = slot0.container:getChildByName("list_panel")
	slot0.buff_scrollview = CommonScrollViewLayout.new(slot1, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot1:getContentSize(), {
		start_y = 0,
		item_width = 566,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 154,
		space_y = 0,
		col = 1,
		need_dynamic = true,
		item_class = BattleBuffListItem
	})

	slot0.buff_scrollview:setSwallowTouches(false)
end

function BattleBuffListView.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0._onClickCloseBtn), false, 2)
end

function BattleBuffListView._onClickCloseBtn(slot0)
	uv0:openBattleBuffListView(false)
end

function BattleBuffListView.openRootWnd(slot0, slot1, slot2, slot3)
	slot0.group = slot2
	slot0.partner_bid = slot3

	slot0:setData(slot1)
end

function BattleBuffListView.setData(slot0, slot1)
	slot0.data = slot1 or {}
	slot2 = {}

	for slot6, slot7 in ipairs(slot0.data) do
		for slot11, slot12 in pairs(slot7.buff_infos) do
			if Config.SkillData.data_get_buff[slot12.buff_id] then
				if slot2[slot13] == nil then
					slot2[slot13] = {
						num = 0,
						res_id = slot7.res_id,
						name = slot15.name,
						remain_round = slot12.remain_round or slot7.remain_round,
						desc = slot15.desc,
						buff_id = slot13
					}
				end

				slot2[slot13].num = slot2[slot13].num + 1
			end
		end
	end

	slot3 = {}

	for slot7, slot8 in pairs(slot2) do
		uv0(slot3, slot8)
	end

	table.sort(slot3, function (slot0, slot1)
		if slot0.res_id == slot1.res_id then
			return slot0.buff_id < slot1.buff_id
		else
			return slot0.res_id < slot1.res_id
		end
	end)
	slot0.arrow_sp:setVisible(#slot3 >= 5)
	slot0.buff_scrollview:setData(slot3)
	slot0.buff_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.buff_scrollview:getItemList()) do
			slot5:setLineShow(slot4 ~= 1)
		end
	end)
end

function BattleBuffListView.checkIsChosedBuffList(slot0, slot1, slot2)
	if slot0.group == slot1 and slot0.partner_bid == slot2 then
		return true
	end

	return false
end

function BattleBuffListView.close_callback(slot0)
	if slot0.buff_scrollview then
		slot0.buff_scrollview:DeleteMe()

		slot0.buff_scrollview = nil
	end

	uv0:openBattleBuffListView(false)
end

BattleBuffListItem = class("BattleBuffListItem", function ()
	return ccui.Widget:create()
end)

function BattleBuffListItem.ctor(slot0, slot1)
	slot0:configUI()
	slot0:register_event()
end

function BattleBuffListItem.configUI(slot0)
	slot0.size = cc.size(566, 154)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("battle/battle_buff_list_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.line = slot0.container:getChildByName("line")
	slot0.buff_icon = slot0.container:getChildByName("buff_icon")
	slot0.name_label = slot0.container:getChildByName("name_label")
	slot0.round_label = slot0.container:getChildByName("round_label")
end

function BattleBuffListItem.register_event(slot0)
end

function BattleBuffListItem.setData(slot0, slot1)
	slot0.data = slot1 or {}

	if PathTool.getBigBuffRes(slot1.res_id) then
		loadSpriteTexture(slot0.buff_icon, slot2, LOADTEXT_TYPE)
	end

	slot0.name_label:setString("【" .. (slot1.name or "") .. "】" .. "*" .. (slot1.num or 1))

	if not slot1.remain_round or slot1.remain_round > 30 then
		slot0.round_label:setVisible(false)
	else
		slot0.round_label:setVisible(true)
		slot0.round_label:setString(string.format(TI18N("%d回合后失效"), slot1.remain_round))
	end

	if not slot0.buff_desc then
		slot0.buff_desc = createRichLabel(22, cc.c3b(224, 191, 152), cc.p(0, 1), cc.p(33, 85), 5, nil, 500)

		slot0.container:addChild(slot0.buff_desc)
	end

	slot0.buff_desc:setString(slot1.desc or "")
end

function BattleBuffListItem.setLineShow(slot0, slot1)
	slot0.line:setVisible(slot1)
end

function BattleBuffListItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
