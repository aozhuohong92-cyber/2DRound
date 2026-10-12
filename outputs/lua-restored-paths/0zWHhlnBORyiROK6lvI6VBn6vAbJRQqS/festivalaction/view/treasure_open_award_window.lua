TreasureOpenAwardWindow = TreasureOpenAwardWindow or BaseClass(BaseView)
slot0 = FestivalActionController:getInstance()
slot1 = Config.HolidaySnatchData.data_join_goods_list
slot2 = string.format

function TreasureOpenAwardWindow.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "festivalaction/treasure_open_award_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/festivalaction", "txt_cn_festival_treasure_open"),
			type = ResourcesType.single
		}
	}
end

function TreasureOpenAwardWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.open_award_bg = loadSpriteTextureFromCDN(slot0.main_container:getChildByName("bg"), PathTool.getPlistImgForDownLoad("bigbg/festivalaction", "txt_cn_festival_treasure_open"), ResourcesType.single, slot0.open_award_bg)
	slot0.btn_close = slot0.main_container:getChildByName("btn_close")

	slot0.main_container:getChildByName("Text_1"):setString(TI18N("幸运号码："))
	slot0.main_container:getChildByName("Text_1_0"):setString(TI18N("恭喜获得："))

	slot0.get_award_text = slot0.main_container:getChildByName("get_award_text")

	slot0.get_award_text:setString("")
	slot0.main_container:getChildByName("Text_1_0_1"):setString(TI18N("我的号码："))
	slot0.main_container:getChildByName("Text_1_0_1_0"):setString(TI18N("我的参与人次："))

	slot0.no_join_text = slot0.main_container:getChildByName("no_join_text")

	slot0.no_join_text:setVisible(false)

	slot0.role_name = slot0.main_container:getChildByName("role_name")

	slot0.role_name:setString("")

	slot0.server_name = slot0.main_container:getChildByName("server_name")

	slot0.server_name:setString("")

	slot3 = slot0.main_container:getChildByName("num_scroll")
	slot0.my_number_scroll = CommonScrollViewLayout.new(slot3, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot3:getContentSize(), {
		start_y = 0,
		item_width = 100,
		start_x = 0,
		space_x = -15,
		row = 1,
		item_height = 30,
		space_y = 0,
		col = 5,
		need_dynamic = true,
		item_class = OpenLotteryNumberItem
	})

	slot0.my_number_scroll:setSwallowTouches(false)

	slot0.goods_item = BackPackItem.new(nil, true, nil, 0.7, false)

	slot0.main_container:addChild(slot0.goods_item)
	slot0.goods_item:setPosition(cc.p(389, 257))

	slot0.play_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.main_container:addChild(slot0.play_head)
	slot0.play_head:setPosition(cc.p(127, 349))
	slot0.play_head:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.play_head:setTouchEnabled(true)

	slot0.open_num = CommonNum.new(17, slot0.main_container, "", 10, cc.p(0, 0))

	slot0.open_num:setPosition(350, 375)

	slot0.my_join_num = createRichLabel(24, FestivalActionConst.ColorConst[5], cc.p(0, 0.5), cc.p(500, 150), nil, nil, 100)

	slot0.main_container:addChild(slot0.my_join_num)
end

function TreasureOpenAwardWindow.openRootWnd(slot0, slot1)
	uv0:sender25702(slot1.pos or 0)
end

function TreasureOpenAwardWindow.register_event(slot0)
	slot0:addGlobalEvent(FestivalActionEvent.Treasure_OpenStatus_Event, function (slot0)
		if slot0.win_num ~= 0 then
			uv0.data = slot0

			uv0:setData(slot0)
		end
	end)
	registerButtonEventListener(slot0.play_head, function (slot0, slot1, slot2)
		if uv0.data then
			slot4 = cc.p(slot1:getTouchEndPosition().x + 320, slot1:getTouchEndPosition().y)
			slot6 = uv0.data.srv_id

			if RoleController:getInstance():getRoleVo().rid == uv0.data.rid and slot3.srv_id == slot6 then
				return
			end

			ChatController:getInstance():openFriendInfo({
				rid = slot5,
				srv_id = slot6
			}, slot4)
		end
	end, true, 1)
	registerButtonEventListener(slot0.background, function ()
		uv0:openTreasureOpenAwardView(false)
	end, false, 2)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openTreasureOpenAwardView(false)
	end, true, 2)
end

function TreasureOpenAwardWindow.setData(slot0, slot1)
	slot0.open_num:setNum(slot1.win_num)
	slot0.play_head:setHeadRes(slot1.win_face)
	slot0.play_head:setLev(slot1.win_lev)
	slot0.role_name:setString(slot1.win_name)
	slot0.server_name:setString(getServerName(slot1.srv_id))

	if uv0 and uv0[slot1.id] then
		slot0.get_award_text:setString(uv0[slot1.id].name)

		if slot0.goods_item then
			slot0.goods_item:setBaseData(uv0[slot1.id].award[1][1], uv0[slot1.id].award[1][2])
		end
	end

	slot0.my_join_num:setString(uv1(TI18N("<div fontcolor=b7ff46>%d</div>次"), #slot1.buy_nums))
	slot0.my_number_scroll:setData(slot1.buy_nums, nil, nil, slot1.win_num)
end

function TreasureOpenAwardWindow.close_callback(slot0)
	doStopAllActions(slot0.main_container)

	if slot0.open_award_bg then
		slot0.open_award_bg:DeleteMe()

		slot0.open_award_bg = nil
	end

	if slot0.goods_item then
		slot0.goods_item:DeleteMe()

		slot0.goods_item = nil
	end

	if slot0.play_head then
		slot0.play_head:DeleteMe()

		slot0.play_head = nil
	end

	if slot0.open_num then
		slot0.open_num:DeleteMe()

		slot0.open_num = nil
	end

	if slot0.my_number_scroll then
		slot0.my_number_scroll:DeleteMe()

		slot0.my_number_scroll = nil
	end

	uv0:openTreasureOpenAwardView(false)
end

OpenLotteryNumberItem = class("OpenLotteryNumberItem", function ()
	return ccui.Widget:create()
end)

function OpenLotteryNumberItem.ctor(slot0)
	slot0:configNumberUI()
end

function OpenLotteryNumberItem.configNumberUI(slot0)
	slot0:setContentSize(cc.size(100, 30))
end

function OpenLotteryNumberItem.setExtendData(slot0, slot1)
	slot0.open_win_num = slot1
end

function OpenLotteryNumberItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	if not slot0.luckly_num then
		slot0.luckly_num = createLabel(22, FestivalActionConst.ColorConst[5], nil, 0, 15, "", slot0, nil, cc.p(0, 0.5))
	end

	if slot0.open_win_num == slot1.num then
		slot0.luckly_num:setTextColor(FestivalActionConst.ColorConst[6])
	else
		slot0.luckly_num:setTextColor(FestivalActionConst.ColorConst[5])
	end

	slot0.luckly_num:setString(slot1.num)
end

function OpenLotteryNumberItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
