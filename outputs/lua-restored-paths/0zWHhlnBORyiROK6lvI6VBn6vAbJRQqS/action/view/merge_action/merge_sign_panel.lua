MergeSignPanel = class("MergeSignPanel", function ()
	return ccui.Widget:create()
end)

function MergeSignPanel.ctor(slot0, slot1, slot2)
	slot0.ctrl = WelfareController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.role_vo = RoleController:getInstance():getRoleVo()

	slot0:configUI()

	slot0.holiday_bid = slot1

	slot0:register_event()
end

function MergeSignPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("welfare/merge_seven_goal_panel"))

	slot0:addChild(slot0.root_wnd)
	slot0.root_wnd:setPosition(cc.p(-40, -60))
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("background")
	slot0.bg_sprite = slot0.main_container:getChildByName("Image_bg")

	if not slot0.item_load then
		slot0.item_load = loadSpriteTextureFromCDN(slot0.bg_sprite, PathTool.getTargetRes("bigbg/action", "txt_cn_action_merge_sign_panel", false, false), ResourcesType.single, slot0.item_load)
	end

	slot2 = slot0.main_container:getChildByName("title")

	slot2:setString(TI18N("七日登陆即可领取！"))
	slot2:setPositionY(631)

	slot0.touchTotleDay = {}

	for slot7 = 1, 7 do
		slot8 = {
			btn = slot0.main_container:getChildByName("layerReward"):getChildByName("reward_" .. slot7)
		}
		slot8.red_point = slot8.btn:getChildByName("redpoint")

		slot8.red_point:setVisible(false)
		slot8.btn:getChildByName("day"):setString(TI18N("第") .. slot7 .. TI18N("天"))

		slot8.textName = slot8.btn:getChildByName("name")

		slot8.textName:setString("")

		slot8.getImg = slot8.btn:getChildByName("get")

		slot8.getImg:setVisible(false)

		slot8.rewardImage = slot8.btn:getChildByName("rewardImage")
		slot8.show_day_icon = slot8.btn:getChildByName("rewardItem")

		slot8.show_day_icon:setScale(0.8)

		slot8.rewardItem = BackPackItem.new(true, true, false, 0.8)

		slot8.rewardItem:setDefaultTip(true)
		slot8.rewardItem:setAnchorPoint(cc.p(0.5, 0.5))
		slot8.rewardItem:setPosition(cc.p(slot8.rewardImage:getContentSize().width / 2, slot8.rewardImage:getContentSize().height / 2))
		slot8.rewardImage:addChild(slot8.rewardItem)

		slot0.touchTotleDay[slot7] = slot8

		slot8.btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				ActionController:getInstance():cs16604(uv0.holiday_bid, uv1)
			end
		end)
	end

	slot0.main_container:getChildByName("time_txt"):setString(TI18N("剩余时间: "))

	slot0.time_label = slot0.main_container:getChildByName("time_num")

	slot0.time_label:setString(TI18N("00:00:00"))
end

function MergeSignPanel.createList(slot0, slot1)
	commonCountDownTime(slot0.time_label, slot1.remain_sec)

	slot3 = slot1.finish

	for slot7, slot8 in ipairs(slot1.aim_list) do
		slot9 = slot8.item_list[1].bid

		slot0.touchTotleDay[slot7].rewardItem:setGoodsName(Config.ItemData.data_get_data(slot9).name, nil, 20, 274)
		slot0.touchTotleDay[slot7].rewardItem:setBaseData(slot9, slot8.item_list[1].num)

		if slot8.status == 1 then
			slot0.touchTotleDay[slot7].red_point:setVisible(true)
			slot0.touchTotleDay[slot7].getImg:setVisible(false)
		elseif slot8.status == 2 then
			slot0.touchTotleDay[slot7].red_point:setVisible(false)
			slot0.touchTotleDay[slot7].getImg:setVisible(true)
		else
			slot0.touchTotleDay[slot7].red_point:setVisible(false)
			slot0.touchTotleDay[slot7].getImg:setVisible(false)
		end
	end
end

function MergeSignPanel.register_event(slot0)
	if not slot0.merge_sign_even_event then
		slot0.merge_sign_even_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_HOLIDAY_SIGNLE, function (slot0)
			if slot0.bid == uv0.holiday_bid then
				uv0.data = slot0

				uv0:createList(slot0)
			end
		end)
	end
end

function MergeSignPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
	ActionController:getInstance():cs16603(slot0.holiday_bid)
end

function MergeSignPanel.DeleteMe(slot0)
	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	if slot0.merge_sign_even_event then
		slot0.merge_sign_even_event = GlobalEvent:getInstance():UnBind(slot0.merge_sign_even_event)
		slot0.merge_sign_even_event = nil
	end
end
