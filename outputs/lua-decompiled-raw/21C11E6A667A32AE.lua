slot1 = ActionController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format
ActionSweetAwardWindow = ActionSweetAwardWindow or BaseClass(BaseView)

function ActionSweetAwardWindow.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "seven_goal/seven_goal_adventure_lev_reward"
end

function ActionSweetAwardWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("Text_1"):setString(TI18N("活动奖励"))

	slot2 = slot1:getChildByName("good_cons")
	slot0.award_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 0,
		item_width = 608,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 167,
		space_y = 10,
		col = 1,
		need_dynamic = true,
		item_class = ActionSweetAwardItem
	})

	slot0.award_scrollview:setSwallowTouches(false)

	slot0.btn_close = slot1:getChildByName("btn_close")
end

function ActionSweetAwardWindow.register_event(slot0)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openActionSweetAwardWindow(false)
	end, true, 2)
	slot0:addGlobalEvent(ActionEvent.Update_Sweet_Data_Event, function ()
		uv0:setData()
	end)
end

function ActionSweetAwardWindow.openRootWnd(slot0)
	slot0:setData()
end

function ActionSweetAwardWindow.setData(slot0)
	if not uv0:getSweetData() then
		return
	end

	slot2 = slot1.acc_score / slot1.max_acc_score * 1000
	slot4 = {}

	for slot8, slot9 in ipairs(Config.HolidayValentinesData.data_award) do
		uv1(slot4, {
			cfg = slot9,
			cur_hot = slot1.acc_score,
			state = function (slot0, slot1)
				slot2 = nil
				slot2 = (slot1 > uv0 or PetardActionConst.Lantern_State.CanGet) and PetardActionConst.Lantern_State.Lock

				for slot6, slot7 in pairs(uv1.reward or {}) do
					if slot7.id == slot0 then
						slot2 = PetardActionConst.Lantern_State.Got

						break
					end
				end

				return slot2
			end(slot9.id, slot9.count)
		})
	end

	slot0.award_scrollview:setData(slot4)
end

function ActionSweetAwardWindow.close_callback(slot0)
	if slot0.award_scrollview then
		slot0.award_scrollview:DeleteMe()

		slot0.award_scrollview = nil
	end

	uv0:openActionSweetAwardWindow(false)
end

ActionSweetAwardItem = class("ActionSweetAwardItem", function ()
	return ccui.Widget:create()
end)

function ActionSweetAwardItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function ActionSweetAwardItem.configUI(slot0)
	slot0.size = cc.size(608, 167)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("seven_goal/seven_goal_adventure_lev_reward_item"))

	slot0:addChild(slot0.root_wnd)

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.title_name = slot1:getChildByName("title_name")
	slot0.btn_get = slot1:getChildByName("btn_get")
	slot0.btn_get_label = slot0.btn_get:getChildByName("Text_1")

	slot0.btn_get_label:setString(TI18N("领取"))

	slot0.has_spr = slot1:getChildByName("has_spr")

	slot0.has_spr:setVisible(false)

	slot0.num_txt = slot1:getChildByName("num_txt")
	slot2 = slot1:getChildByName("good_cons")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 5,
		start_x = 0,
		space_x = 10,
		row = 1,
		space_y = 0,
		col = 0,
		scale = 0.8,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.8,
		item_height = BackPackItem.Height * 0.8
	})

	slot0.item_scrollview:setSwallowTouches(false)
end

function ActionSweetAwardItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot4 = slot1.cur_hot or 0

	if not slot1.cfg or not slot1.state then
		return
	end

	slot0.award_id = slot2.id
	slot5 = uv0:getSweetMaxScore()

	slot0.title_name:setString(uv1(TI18N("积分累计达到%d"), slot2.count / 1000 * slot5))

	slot11 = "(%d/%d)"

	slot0.num_txt:setString(uv1(slot11, slot4, slot2.count / 1000 * slot5))
	slot0.num_txt:setVisible(true)

	slot6 = {}

	for slot10, slot11 in ipairs(slot2.award) do
		if deepCopy(Config.ItemData.data_get_data(slot11[1])) then
			slot12.quantity = slot11[2]

			uv2(slot6, slot12)
		end
	end

	if #slot6 > 4 then
		slot0.item_scrollview:setClickEnabled(true)
	else
		slot0.item_scrollview:setClickEnabled(false)
	end

	slot0.item_scrollview:setData(slot6)
	slot0.item_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.item_scrollview:getItemList()) do
			slot5:setDefaultTip()
			slot5:setSwallowTouches(false)
		end
	end)
	slot0.btn_get:setVisible(slot3 ~= PetardActionConst.Lantern_State.Got)
	slot0.has_spr:setVisible(slot3 == PetardActionConst.Lantern_State.Got)

	if slot3 == PetardActionConst.Lantern_State.Lock then
		setChildUnEnabled(true, slot0.btn_get)
		slot0.btn_get:setTouchEnabled(false)
	else
		setChildUnEnabled(false, slot0.btn_get)
		slot0.btn_get:setTouchEnabled(true)
	end
end

function ActionSweetAwardItem.register_event(slot0)
	registerButtonEventListener(slot0.btn_get, handler(slot0, slot0.onClickGetBtn), true)
end

function ActionSweetAwardItem.onClickGetBtn(slot0)
	if slot0.award_id then
		uv0:sender28501({
			{
				id = slot0.award_id
			}
		})
	end
end

function ActionSweetAwardItem.DeleteMe(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
