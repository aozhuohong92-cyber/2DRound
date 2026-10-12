EmoguoshiRandomView = class("EmoguoshiRandomView", function ()
	return ccui.Widget:create()
end)
slot0 = EmoguoshiController:getInstance()
slot1 = 1
slot2 = 2
slot3 = 3
slot4 = 4

function EmoguoshiRandomView.ctor(slot0, slot1, slot2)
	slot0.tab_btn_list = {}
	slot0.show_up_prop = {}

	slot0:configUI()
	slot0:register_event()
end

function EmoguoshiRandomView.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Mini
	slot0.layout_name = "emoguoshitujian/emoguoshi_zhaohuan_panel"
	slot0.res_list = {}
	slot0.tab_btn_list = {}
	slot0.show_up_prop = {}
end

function EmoguoshiRandomView.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("emoguoshitujian/emoguoshi_zhaohuan_panel"))
	slot6 = 0.5
	slot7 = 0.5

	slot0.root_wnd:setAnchorPoint(cc.p(slot6, slot7))
	slot0:addChild(slot0.root_wnd)

	slot0.background = slot0.root_wnd:getChildByName("Image_bg")

	slot0.root_wnd:getChildByName("background"):setTouchEnabled(false)

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.img_guoshe = slot0.main_panel:getChildByName("Image_guohe")
	slot0.btn_one = slot0.main_panel:getChildByName("btn_summon_1")
	slot0.btn_ten = slot0.main_panel:getChildByName("btn_summon_10")
	slot0.check_box = slot0.main_panel:getChildByName("Panel_2"):getChildByName("CheckBox_1")

	slot0.check_box:setSelected(false)

	slot0.img_guoshi = slot0.main_panel:getChildByName("Image_guoshi")
	slot0.img_up = slot0.main_panel:getChildByName("Image_2")
	slot0.img_select_up = slot0.img_up:getChildByName("Image_3")

	slot0.img_select_up:setUnifySizeEnabled(true)

	slot0.label_times = slot0.main_panel:getChildByName("tips")
	slot0.item_info = slot0.main_panel:getChildByName("item_info")
	slot0.have_num = slot0.item_info:getChildByName("num")

	slot0.have_num:setString("0")

	slot0.sprite_3 = slot0.item_info:getChildByName("Sprite_3")
	slot1 = slot0.main_panel:getChildByName("tab_panel")
	slot2 = {}

	for slot6, slot7 in pairs(Config.EmoguoshitujianData.data_get_random_data) do
		table.insert(slot2, slot7)
	end

	function slot6(slot0, slot1)
		return slot0.bid < slot1.bid
	end

	table.sort(slot2, slot6)

	for slot6 = 1, 4 do
		if slot2[slot6] then
			slot0.tab_btn_list[slot8.bid] = slot1:getChildByName("Button_" .. slot6)
		end
	end

	slot0.default_bid = slot2[1].bid

	slot0:changeTag(uv0:getLastSelectChouJiangBid() or slot0.default_bid)
	slot0:updateLeftTimes()

	slot0.effect_node_bg = slot0.root_wnd:getChildByName("Node_1")

	slot0.effect_node_bg:setGlobalZOrder(10)
end

function EmoguoshiRandomView.register_event(slot0)
	slot0.background:setTouchEnabled(true)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openEmoguoRandomView(false)
		end
	end)
	slot0.btn_one:setTouchEnabled(true)
	registerButtonEventListener(slot0.btn_one, function ()
		uv0:checkZhaoHuan(uv0.btn_one.type)
	end, true)
	slot0.btn_ten:setTouchEnabled(true)
	registerButtonEventListener(slot0.btn_ten, function ()
		uv0:checkZhaoHuan(uv0.btn_ten.type)
	end, true)
	slot0.img_up:setTouchEnabled(true)

	function slot4()
		uv0:openEmoguoRandomSelectUpView(true, uv1.show_tag, function (slot0)
			uv0.show_up_prop[uv0.show_tag] = slot0

			uv1:setLastUpItem(uv0.show_tag, slot0)
			uv0:updateUpImg()
		end, uv1.show_up_prop[uv1.show_tag])
	end

	slot5 = true

	registerButtonEventListener(slot0.img_up, slot4, slot5)

	for slot4, slot5 in pairs(slot0.tab_btn_list) do
		registerButtonEventListener(slot5, function ()
			uv0:changeTag(uv1)
		end, true)
	end

	slot0.even_handle_list = {
		CHOUJIANG_TIMES = GlobalEvent:getInstance():Bind(EmoguoshiEvent.CHOUJIANG_TIMES, function (...)
			uv0:updateLeftTimes()
			uv0:updateNeed()
		end),
		CHOUJIANG_RET = GlobalEvent:getInstance():Bind(EmoguoshiEvent.CHOUJIANG_RET, function (slot0)
			uv0:onChouJiangRet(slot0.result > 0)
		end)
	}
end

function EmoguoshiRandomView.onChouJiangRet(slot0, slot1)
	slot0.img_guoshi:setVisible(false)

	slot3 = createEffectSpine("E51332", cc.p(0, 0), cc.p(0.5, 0.5), false, "action1", function (...)
		if uv0.effect_node_bg.sp then
			uv0.effect_node_bg.sp:runAction(cc.RemoveSelf:create(true))

			uv0.effect_node_bg.sp = nil
		end

		uv0.img_guoshi:setVisible(true)
	end)

	slot3:setGlobalZOrder(10)
	slot0.effect_node_bg:addChild(slot3)

	slot0.effect_node_bg.sp = slot3
end

function EmoguoshiRandomView.checkZhaoHuan(slot0, slot1)
	uv0:reqChouJiang(slot0.show_tag, slot1, slot0:getSelectUpIndexProp().id)
end

function EmoguoshiRandomView.setBtnInfo(slot0, slot1, slot2, slot3)
	slot4 = slot1:getChildByName("Sprite_7")
	slot5 = slot1:getChildByName("count")
	slot7 = nil

	if Config.ItemData.data_get_data(slot2) then
		slot7 = PathTool.getItemRes(slot6.icon)
	end

	loadSpriteTexture(slot4, slot7, LOADTEXT_TYPE)
	slot5:setString(slot3)
end

function EmoguoshiRandomView.updateNeed(slot0, ...)
	if not Config.EmoguoshitujianData.data_get_random_data[slot0.show_tag] then
		return
	end

	slot4 = Config.EmoguoshitujianData.data_const.emo_choujaing_times.val - uv0:getHaveChouJiangTimes()
	slot5 = slot1.one_need_items2[1]

	if slot5[2] <= BackpackController:getInstance():getModel():getItemNumByBid(slot5[1]) then
		slot0.btn_one.type = uv1

		slot0:setBtnInfo(slot0.btn_one, slot1.one_need_items2[1][1], slot1.one_need_items2[1][2])
	elseif slot4 > 0 then
		slot0.btn_one.type = uv2

		slot0:setBtnInfo(slot0.btn_one, slot1.one_need_items1[1][1], slot1.one_need_items1[1][2])
	else
		slot0.btn_one.type = uv1

		slot0:setBtnInfo(slot0.btn_one, slot1.one_need_items2[1][1], slot1.one_need_items2[1][2])
	end

	slot7 = slot1.ten_need_items2[1]

	if slot7[2] <= BackpackController:getInstance():getModel():getItemNumByBid(slot7[1]) then
		slot0.btn_ten.type = uv3

		slot0:setBtnInfo(slot0.btn_ten, slot1.ten_need_items2[1][1], slot1.ten_need_items2[1][2])
	elseif slot4 >= 10 then
		slot0.btn_ten.type = uv4

		slot0:setBtnInfo(slot0.btn_ten, slot1.ten_need_items1[1][1], slot1.ten_need_items1[1][2])
	else
		slot0.btn_ten.type = uv3

		slot0:setBtnInfo(slot0.btn_ten, slot1.ten_need_items2[1][1], slot1.ten_need_items2[1][2])
	end
end

function EmoguoshiRandomView.updateLeftTimes(slot0, ...)
	slot1 = uv0:getHaveChouJiangTimes()
	slot2 = Config.EmoguoshitujianData.data_const.emo_choujaing_times.val

	slot0.label_times:setString(string.format(TI18N("每日钻石抽取上限：%d/%d"), slot1, slot2))

	slot3 = slot2 - slot1
	slot4 = Config.EmoguoshitujianData.data_const.emo_zhaohuan_xiaohao.val

	loadSpriteTexture(PathTool.getItemRes(slot4), LOADTEXT_TYPE_PLIST)
	slot0.have_num:setString(BackpackController:getInstance():getModel():getItemNumByBid(slot4))
end

function EmoguoshiRandomView.getSelectUpIndexProp(slot0, ...)
	if not slot0.show_up_prop[slot0.show_tag] then
		slot0.show_up_prop[slot0.show_tag] = uv0:getLastUpItem(slot0.show_tag)
	end

	if not slot0.show_up_prop[slot0.show_tag] then
		if not Config.EmoguoshitujianData.data_get_random_do_data[slot0.show_tag] then
			return
		end

		slot2 = {}

		for slot6, slot7 in pairs(slot1) do
			table.insert(slot2, slot7.group_id)
		end

		slot3 = {}

		for slot7, slot8 in pairs(slot2) do
			for slot13, slot14 in pairs(Config.EmoguoshitujianData.data_get_random_group_data[slot8]) do
				table.insert(slot3, deepCopy(slot14))
			end
		end

		table.sort(slot3, function (slot0, slot1)
			if slot0.group_id ~= slot1.group_id then
				return slot0.group_id < slot1.group_id
			end

			return slot0.id < slot1.id
		end)

		slot0.show_up_prop[slot0.show_tag] = slot3[math.random(1, #slot3)]
	end

	return slot0.show_up_prop[slot0.show_tag]
end

function EmoguoshiRandomView.updateUpImg(slot0, ...)
	if not slot0:getSelectUpIndexProp() then
		return
	end

	slot0.img_select_up:loadTexture(PathTool.getItemRes(Config.ItemData.data_get_data(slot1.item_id).icon), LOADTEXT_TYPE)
end

function EmoguoshiRandomView.changeTag(slot0, slot1)
	if not Config.EmoguoshitujianData.data_get_random_data[slot1] then
		return
	end

	if uv0:getShopJiFen() < slot2.need_jifen then
		if not slot0.show_tag then
			slot0.show_tag = -1

			slot0:changeTag(slot0.default_bid)

			return
		end

		message(TI18N("未解锁，请前往规则处查看详情"))

		return
	end

	for slot7, slot8 in pairs(slot0.tab_btn_list) do
		slot8:setBright(slot1 == slot7)
	end

	slot0.show_tag = slot1

	print("EmoguoshiRandomView:changeTag====" .. slot1)
	uv0:setLastSelectChouJiangBid(slot1)
	slot0:updateUpImg()
	slot0:updateNeed()
	slot0.img_guoshe:loadTexture(string.format("resource/bigbg/emoguoshitujian/%s", ({
		[10002.0] = "emoguoshi_13.png",
		[10001.0] = "emoguoshi_14.png",
		[10003.0] = "emoguoshi_12.png",
		[10004.0] = "emoguoshi_11.png"
	})[slot1]), LOADTEXT_TYPE)
	GlobalEvent:getInstance():Fire(EmoguoshiEvent.CHOUJIANG_CHANGE_TAG, slot1)
end

function EmoguoshiRandomView.DeleteMe(slot0)
	for slot4, slot5 in pairs(slot0.even_handle_list) do
		GlobalEvent:getInstance():UnBind(slot5)
	end

	slot0.even_handle_list = {}

	uv0:setChouJiangSkillTag(slot0.check_box:isSelected())
	uv0:checkSaveChouJiangData()
end
