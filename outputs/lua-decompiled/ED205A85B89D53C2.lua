ActionFestvalLoginWindow = ActionFestvalLoginWindow or BaseClass(BaseView)
slot0 = ActionController:getInstance()
slot1 = Config.FunctionData.data_festval_const

function ActionFestvalLoginWindow.__init(slot0, slot1)
	slot0.holiday_bid = slot1
	slot0.is_full_screen = true
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "action/action_festval_login_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("festvallogin", "festvallogin"),
			type = ResourcesType.plist
		}
	}
end

function ActionFestvalLoginWindow.open_callback(slot0)
	slot1 = slot0.root_wnd:getChildByName("bg")

	slot1:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot2 = slot0.main_container:getChildByName("good_cons")
	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.festvalTime = slot1:getChildByName("festval_time")

	slot0.festvalTime:setString("")

	slot3 = "txt_cn_action_festval_login_bg"
	slot4 = PathTool.getResFrame("festvallogin", "10003")

	if slot0.holiday_bid == ActionRankCommonType.common_day then
		slot0.festvalTime:setPosition(slot0.festvalTime:getPositionX() - 185, slot0.festvalTime:getPositionY() + 64)
	elseif slot0.holiday_bid == ActionRankCommonType.festval_day then
		slot3 = "txt_cn_action_festval_login_bg1"
		slot4 = PathTool.getResFrame("festvallogin", "10004")
	elseif slot0.holiday_bid == ActionRankCommonType.lover_day then
		slot3 = "txt_cn_action_festval_login_bg2"
		slot4 = PathTool.getResFrame("festvallogin", "10003")
	end

	if uv0[slot0.holiday_bid] then
		slot0.festvalTime:setColor(slot0:colorChangeData(slot5.color))
		slot0.festvalTime:setPosition(slot5.pos[1][1], slot5.pos[1][2])
	end

	slot0.close_btn:loadTexture(slot4, LOADTEXT_TYPE_PLIST)
	slot0.close_btn:ignoreContentAdaptWithSize(true)
	slot0.close_btn:setPositionX(SCREEN_WIDTH - 100 * display.getMaxScale())
	slot0.close_btn:setPositionY(SCREEN_HEIGHT - 50 * display.getMaxScale())

	slot6 = slot0.root_wnd:getChildByName("background")

	if not slot0.item_load then
		slot0.item_load = createResourcesLoad(PathTool.getPlistImgForDownLoad("bigbg/action", slot3), ResourcesType.single, function ()
			if not tolua.isnull(uv0) then
				loadSpriteTexture(uv0, uv1, LOADTEXT_TYPE)
				uv0:setScale(display.getMaxScale())
			end
		end, slot0.item_load)
	end

	slot8 = slot2:getContentSize()
	slot0.item_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 5), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot8.width, slot8.height - 8), {
		start_y = 8,
		item_width = 679,
		start_x = 8,
		space_x = 5,
		row = 0,
		item_height = 172,
		space_y = 4,
		col = 1,
		need_dynamic = true,
		item_class = ActionFestvalItem
	})

	slot0.item_scrollview:setSwallowTouches(false)
end

function ActionFestvalLoginWindow.colorChangeData(slot0, slot1)
	slot2 = "ff"
	slot3 = "ff"
	slot4 = "ff"
	slot5 = "ff"
	slot3 = string.sub(slot1, 3, 4)
	slot4 = string.sub(slot1, 5, 6)
	slot5 = string.sub(slot1, 7, 8)

	if string.sub(slot1, 1, 2) == "" then
		slot2 = "ff"
	end

	if slot3 == "" then
		slot3 = "ff"
	end

	if slot4 == "" then
		slot4 = "ff"
	end

	if slot5 == "" then
		slot5 = "ff"
	end

	return cc.c4b(tonumber("0x" .. slot2), tonumber("0x" .. slot3), tonumber("0x" .. slot4), tonumber("0x" .. slot5))
end

function ActionFestvalLoginWindow.openRootWnd(slot0)
	uv0:cs16603(slot0.holiday_bid)
end

function ActionFestvalLoginWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openFestvalLoginWindow(false)
	end, true, 2)
	slot0:addGlobalEvent(ActionEvent.UPDATE_HOLIDAY_SIGNLE, function (slot0)
		if slot0.bid == uv0.holiday_bid and uv0.item_scrollview and slot0.aim_list then
			uv1:getModel():sortItemList(slot0.aim_list)

			slot0.special_aim = uv0:getFirstCanNotReceiveAim(slot0.aim_list)

			uv0.item_scrollview:setData(slot0.aim_list, nil, nil, slot0)

			if slot0.args and (keyfind("args_key", 24, slot0.args) or nil) then
				uv0.festvalTime:setString(slot2.args_str)
			end
		end
	end)
end

function ActionFestvalLoginWindow.getFirstCanNotReceiveAim(slot0, slot1)
	slot2 = 0

	for slot6, slot7 in ipairs(slot1) do
		if slot7.status == 0 then
			slot2 = slot7.aim

			break
		end
	end

	return slot2
end

function ActionFestvalLoginWindow.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.item_load then
		slot0.item_load:DeleteMe()
	end

	slot0.item_load = nil

	uv0:openFestvalLoginWindow(false)
end

ActionFestvalItem = class("ActionFestvalItem", function ()
	return ccui.Widget:create()
end)

function ActionFestvalItem.ctor(slot0)
	slot0.ctrl = ActionController:getInstance()

	slot0:configUI()
	slot0:register_event()
end

function ActionFestvalItem.configUI(slot0)
	slot0.size = cc.size(679, 172)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("action/action_festval_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.goods_con = slot0.main_container:getChildByName("goods_con")
	slot0.has_bg = slot0.main_container:getChildByName("has_bg")
	slot0.tips_label = slot0.main_container:getChildByName("tips_label")

	slot0.tips_label:setString(TI18N("未满足条件"))

	slot0.btn_get = slot0.main_container:getChildByName("btn_get")

	if slot0.btn_get:getTitleRenderer() ~= nil then
		slot2:enableOutline(Config.ColorData.data_color4[278], 2)
	end

	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.goods_con, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot0.goods_con:getContentSize(), {
		start_y = 4,
		start_x = 3,
		space_x = 15,
		row = 1,
		space_y = 4,
		col = 0,
		scale = 0.85,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.85,
		item_height = BackPackItem.Height * 0.85
	})

	slot0.item_scrollview:setSwallowTouches(false)

	slot0.title_txt = createRichLabel(26, 1, cc.p(0, 0.5), cc.p(15, 149))

	slot0.root_wnd:addChild(slot0.title_txt)
end

function ActionFestvalItem.setExtendData(slot0, slot1)
	slot0.extend_data = slot1
end

function ActionFestvalItem.setData(slot0, slot1)
	slot0.data = slot1

	if slot1.status == 0 then
		if slot0.extend_data.special_aim and slot0.extend_data.special_aim == slot1.aim then
			slot0.tips_label:setString(TI18N("明日可领"))
			slot0.tips_label:setTextColor(cc.c3b(40, 155, 20))
		else
			slot0.tips_label:setString(TI18N("未满足条件"))
			slot0.tips_label:setTextColor(cc.c3b(104, 69, 42))
		end
	end

	slot0.title_txt:setString(slot1.aim_str)
	slot0.tips_label:setVisible(slot1.status == 0)
	slot0.btn_get:setVisible(slot1.status == 1)
	slot0.has_bg:setVisible(slot1.status == 2)

	slot3 = {}

	for slot7, slot8 in pairs(slot1.item_list) do
		slot9 = deepCopy(Config.ItemData.data_get_data(slot8.bid))
		slot9.quantity = slot8.num

		table.insert(slot3, slot9)
	end

	slot0.item_scrollview:setData(slot3)
	slot0.item_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.item_scrollview:getItemList()) do
			slot5:setDefaultTip()
			slot5:setSwallowTouches(false)

			if slot5:getData() and slot6.id then
				slot7 = slot6.id

				for slot12, slot13 in pairs(uv0.extend_data.item_effect_list) do
					if slot7 and slot7 == slot13.bid then
						if slot6.quality >= 4 then
							slot5:showItemEffect(true, 263, PlayerAction.action_1, true, 1.1)
						else
							slot5:showItemEffect(true, 263, PlayerAction.action_2, true, 1.1)
						end
					end
				end
			end
		end
	end)
end

function ActionFestvalItem.register_event(slot0)
	registerButtonEventListener(slot0.btn_get, function ()
		if uv0.data then
			uv0.ctrl:cs16604(uv0.extend_data.bid, uv0.data.aim)
		end
	end, true, 1)
end

function ActionFestvalItem.DeleteMe(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
