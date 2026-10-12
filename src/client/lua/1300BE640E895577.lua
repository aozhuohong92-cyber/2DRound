slot1 = PetardActionController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format
PetardSelectItemWindow = PetardSelectItemWindow or BaseClass(BaseView)

function PetardSelectItemWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "petard/petard_select_item_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("actionpetard_chose", "actionpetard_chose"),
			type = ResourcesType.plist
		}
	}
end

function PetardSelectItemWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1

	slot0:playEnterAnimatianByObj(slot1, 1)

	slot0.close_btn = slot1:getChildByName("close_btn")

	slot1:getChildByName("win_title"):setString(TI18N("燃放烟花"))
	slot1:getChildByName("tips_txt"):setString(TI18N("请选择要燃放的烟花"))
	slot1:getChildByName("num_title"):setString(TI18N("使用数量："))

	slot0.num_txt = slot1:getChildByName("num_txt")
	slot0.confirm_btn = slot1:getChildByName("confirm_btn")
	slot5 = TI18N

	slot0.confirm_btn:getChildByName("label"):setString(slot5("确定燃放"))

	slot0.item_object_list = {}

	for slot5 = 1, 2 do
		if slot1:getChildByName("item_bg_" .. slot5) then
			slot7 = {
				item_bg = slot6,
				select_image = slot6:getChildByName("select_image")
			}

			slot7.select_image:setVisible(false)

			slot7.get_btn = slot6:getChildByName("get_btn")

			slot7.get_btn:getChildByName("label"):setString(TI18N("获取"))

			slot7.name_txt = slot6:getChildByName("name_txt")
			slot7.desc_txt = slot6:getChildByName("desc_txt")
			slot7.item_node = BackPackItem.new(false, true, nil, nil, nil, true)

			slot7.item_node:setPosition(cc.p(134, 190))
			slot6:addChild(slot7.item_node)

			slot8 = nil

			if slot5 == 1 then
				slot8 = Config.HolidayPetardData.data_const.meteor_bid

				if Config.HolidayPetardData.data_const.firework_rule1 then
					slot7.desc_txt:setString(slot9.desc)
				end
			else
				slot8 = Config.HolidayPetardData.data_const.firework_bid

				if Config.HolidayPetardData.data_const.firework_rule2 then
					slot7.desc_txt:setString(slot9.desc)
				end
			end

			if slot8 and Config.ItemData.data_get_data(slot8.val) then
				slot10 = BackpackController:getInstance():getModel():getItemNumByBid(slot9.id)
				slot7.item_bid = slot9.id
				slot7.have_num = slot10

				slot7.item_node:setData(slot9)
				slot7.item_node:setNum2(slot10)
				slot7.name_txt:setString(slot9.name)
			end

			uv0(slot0.item_object_list, slot7)
		end
	end

	slot0.slider = slot1:getChildByName("slider")

	slot0.slider:setBarPercent(10, 90)

	slot0.plus_btn = slot1:getChildByName("plus_btn")
	slot0.min_btn = slot1:getChildByName("min_btn")
	slot0.max_btn = slot1:getChildByName("max_btn")
end

function PetardSelectItemWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickCloseBtn), false, 2)

	slot4 = handler(slot0, slot0.onClickCloseBtn)
	slot5 = true

	registerButtonEventListener(slot0.close_btn, slot4, slot5, 2)

	for slot4, slot5 in ipairs(slot0.item_object_list) do
		if slot5.get_btn then
			registerButtonEventListener(slot5.get_btn, handler(slot0, slot0.onClickGetBtn), true)
		end

		if slot5.item_bg then
			registerButtonEventListener(slot5.item_bg, function ()
				uv0:onClickItemBg(uv1)
			end, false)
		end
	end

	slot0.slider:addEventListener(function (slot0, slot1)
		if slot1 == ccui.SliderEventType.percentChanged then
			uv0:setChoseItemInfoByPercent(uv0.slider:getPercent())
		end
	end)
	registerButtonEventListener(slot0.min_btn, function ()
		if uv0.slider:getPercent() == 0 then
			return
		end

		if uv0.cur_chose_num == 0 then
			return
		end

		uv0.cur_chose_num = uv0.cur_chose_num - 1

		uv0:setChoseItemInfoByNum(uv0.cur_chose_num)
	end, true)
	registerButtonEventListener(slot0.plus_btn, function ()
		if uv0.slider:getPercent() == 100 then
			return
		end

		if uv0.cur_item_max_num <= uv0.cur_chose_num then
			return
		end

		uv0.cur_chose_num = uv0.cur_chose_num + 1

		uv0:setChoseItemInfoByNum(uv0.cur_chose_num)
	end, true)
	registerButtonEventListener(slot0.max_btn, function ()
		if uv0.slider:getPercent() == 100 then
			return
		end

		if uv0.cur_item_max_num <= uv0.cur_chose_num then
			return
		end

		uv0.cur_chose_num = uv0.cur_item_max_num

		uv0:setChoseItemInfoByNum(uv0.cur_chose_num)
	end, true)
	registerButtonEventListener(slot0.confirm_btn, function ()
		uv0:onClickComfirmBtn()
	end, true)
end

function PetardSelectItemWindow.onClickComfirmBtn(slot0)
	if not slot0.cur_index then
		return
	end

	if not slot0.item_object_list[slot0.cur_index] then
		return
	end

	if slot1.have_num > 0 then
		if Config.HolidayPetardData.data_const.firework_bid and slot2.val == slot1.item_bid then
			if uv0:checkCanUseBigPetard() then
				MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene)
				MainSceneController:getInstance():moveToCenterPos()
				MainSceneController:getInstance():showMainSceneEffect(true, 342, nil, slot0.cur_chose_num or 1)
				uv1:openSelectItemWindow(false)
			end
		else
			uv1:openPetardEffectWindow(true, slot0.cur_chose_num or 1)
			uv1:openSelectItemWindow(false)
		end
	else
		message(TI18N("道具数量不足"))
	end
end

function PetardSelectItemWindow.setChoseItemInfoByPercent(slot0, slot1)
	if not slot0.cur_item_max_num then
		return
	end

	slot0:setChoseItemInfoByNum(math.floor(slot1 * slot0.cur_item_max_num * 0.01))
end

function PetardSelectItemWindow.setChoseItemInfoByNum(slot0, slot1)
	slot0.cur_chose_num = slot1
	slot2 = slot0.cur_item_max_num or 1

	if slot0.cur_chose_num < 1 then
		slot0.cur_chose_num = 1
	elseif slot2 < slot0.cur_chose_num then
		slot0.cur_chose_num = slot2
	end

	if slot0.cur_chose_num / slot2 * 100 < 1 then
		slot3 = math.ceil(slot3)
	end

	slot0.slider:setPercent(slot3)
	slot0.num_txt:setString(slot0.cur_chose_num)
end

function PetardSelectItemWindow.onClickGetBtn(slot0)
	if ActionController:getInstance():getActionSubTabVo(ActionRankCommonType.exercise_1) and slot1.action_operate and slot1.action_operate.tab_list[slot2.bid] then
		slot1.action_operate:handleSelectedTab(slot1.action_operate.tab_list[slot2.bid])
		uv0:openSelectItemWindow(false)
	elseif slot2 then
		slot1:openActionMainPanel(true, MainuiConst.icon.festival, slot2.bid)
		uv0:openSelectItemWindow(false)
	else
		message(TI18N("该活动已结束"))
	end
end

function PetardSelectItemWindow.onClickItemBg(slot0, slot1)
	if slot0.cur_index and slot0.cur_index == slot1 then
		return
	end

	for slot5, slot6 in ipairs(slot0.item_object_list) do
		if slot6.select_image then
			slot6.select_image:setVisible(slot5 == slot1)
		end
	end

	slot0.cur_index = slot1

	slot0:updateChoseItemInfo()
	slot0:setChoseItemInfoByNum(1)
end

function PetardSelectItemWindow.updateChoseItemInfo(slot0)
	if not slot0.cur_index or not slot0.item_object_list then
		return
	end

	if not slot0.item_object_list[slot0.cur_index] then
		return
	end

	slot0.cur_item_max_num = slot1.have_num

	if not slot0.cur_item_max_num or slot0.cur_item_max_num <= 0 then
		slot0.cur_item_max_num = 1
	end
end

function PetardSelectItemWindow.onClickCloseBtn(slot0)
	uv0:openSelectItemWindow(false)
end

function PetardSelectItemWindow.openRootWnd(slot0)
	slot0:onClickItemBg(slot0:getDefaultIndex())
end

function PetardSelectItemWindow.getDefaultIndex(slot0)
	slot1 = 1

	if slot0.item_object_list[2] and slot2.have_num > 0 then
		slot1 = 2
	end

	return slot1
end

function PetardSelectItemWindow.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.item_object_list) do
		if slot5.item_node then
			slot5.item_node:DeleteMe()

			slot5.item_node = nil
		end
	end

	uv0:openSelectItemWindow(false)
end
