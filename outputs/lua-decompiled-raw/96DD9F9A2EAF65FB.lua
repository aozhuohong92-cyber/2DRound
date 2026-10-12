slot1 = PetardActionController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format
PetardAwardWindow = PetardAwardWindow or BaseClass(BaseView)

function PetardAwardWindow.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "seven_goal/seven_goal_adventure_lev_reward"
end

function PetardAwardWindow.open_callback(slot0)
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
		item_class = PetardAwardItem
	})

	slot0.award_scrollview:setSwallowTouches(false)

	slot0.btn_close = slot1:getChildByName("btn_close")
end

function PetardAwardWindow.register_event(slot0)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openPetardAwardWindow(false)
	end, true, 2)
	slot0:addGlobalEvent(PetardActionEvent.Get_Base_Info_Event, function ()
		uv0:setData()
	end)
end

function PetardAwardWindow.openRootWnd(slot0)
	slot0:setData()
end

function PetardAwardWindow.setData(slot0)
	if not uv0:getPetardBaseInfo() then
		return
	end

	slot3 = {}

	for slot7, slot8 in ipairs(Config.HolidayPetardData.data_award) do
		uv1(slot3, {
			cfg = slot8,
			cur_hot = slot1.score,
			state = function (slot0)
				slot1 = PetardActionConst.Lantern_State.Lock

				for slot5, slot6 in pairs(uv0.score_award or {}) do
					if slot6.id == slot0 then
						if slot6.status == 1 then
							slot1 = PetardActionConst.Lantern_State.CanGet

							break
						end

						if slot6.status == 2 then
							slot1 = PetardActionConst.Lantern_State.Got
						end

						break
					end
				end

				return slot1
			end(slot8.id)
		})
	end

	slot0.award_scrollview:setData(slot3)
end

function PetardAwardWindow.close_callback(slot0)
	if slot0.award_scrollview then
		slot0.award_scrollview:DeleteMe()

		slot0.award_scrollview = nil
	end

	uv0:openPetardAwardWindow(false)
end

PetardAwardItem = class("PetardAwardItem", function ()
	return ccui.Widget:create()
end)

function PetardAwardItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function PetardAwardItem.configUI(slot0)
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

function PetardAwardItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot4 = slot1.cur_hot or 0

	if not slot1.cfg or not slot1.state then
		return
	end

	slot0.award_id = slot2.id
	slot5 = uv0:getMaxPetardHotVal()

	slot0.title_name:setString(uv1(TI18N("全服烟花热度达到%d"), slot2.count / 1000 * slot5))

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

function PetardAwardItem.register_event(slot0)
	registerButtonEventListener(slot0.btn_get, handler(slot0, slot0.onClickGetBtn), true)
end

function PetardAwardItem.onClickGetBtn(slot0)
	if slot0.award_id then
		uv0:sender27007(slot0.award_id)
	end
end

function PetardAwardItem.DeleteMe(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
