slot1 = PetardActionController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format
PetardActionMainPanel = class("PetardActionMainPanel", function ()
	return ccui.Widget:create()
end)

function PetardActionMainPanel.ctor(slot0, slot1)
	slot0.holiday_bid = slot1 or ActionRankCommonType.petard
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("actionpetard", "actionpetard"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/action", "txt_cn_action_petard", true),
			type = ResourcesType.single
		}
	}
	slot0._init_flag = false
	slot0.lantern_list = {}
	slot0.resources_load = ResourcesLoad.New(true)

	slot0.resources_load:addAllList(slot0.res_list, function ()
		uv0:loadResListCompleted()
	end)
end

function PetardActionMainPanel.loadResListCompleted(slot0)
	slot0:configUI()
	slot0:registerEvent()
	uv0:sender27000()

	slot0._init_flag = true

	slot0:updateItemNum()
end

function PetardActionMainPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("petard/petard_action_panel"))

	slot0.root_wnd:setPosition(-40, -82)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1
	slot6 = PathTool.getPlistImgForDownLoad("bigbg/action", "txt_cn_action_petard", true)

	slot1:getChildByName("image_bg"):loadTexture(slot6, LOADTEXT_TYPE)

	slot0.item_object_list = {}

	for slot6 = 1, 2 do
		if slot1:getChildByName("item_num_bg_" .. slot6) then
			slot8 = {
				item_num_txt = slot7:getChildByName("item_num_txt"),
				add_item_btn = slot7:getChildByName("add_item_btn")
			}
			slot9 = slot7:getChildByName("item_icon")
			slot10 = nil

			if slot6 == 1 and Config.HolidayPetardData.data_const.meteor_bid then
				slot10 = Config.HolidayPetardData.data_const.meteor_bid.val
			elseif Config.HolidayPetardData.data_const.firework_bid then
				slot10 = Config.HolidayPetardData.data_const.firework_bid.val
			end

			if Config.ItemData.data_get_data(slot10) then
				slot8.item_bid = slot10

				loadSpriteTexture(slot9, PathTool.getItemRes(slot11.icon), LOADTEXT_TYPE)
			end

			uv0(slot0.item_object_list, slot8)
		end
	end

	slot0.shop_btn = slot1:getChildByName("shop_btn")

	slot0.shop_btn:getChildByName("label"):setString(TI18N("兑换商城"))

	slot0.put_btn = slot1:getChildByName("put_btn")

	slot0.put_btn:getChildByName("label"):setString(TI18N("燃放烟花"))

	slot0.btn_rule = slot1:getChildByName("btn_rule")
	slot0.time_txt = slot1:getChildByName("time_txt")
	slot0.petard_hot_txt = slot1:getChildByName("petard_hot_txt")
	slot0.progress = slot1:getChildByName("progress")

	slot0.progress:setScale9Enabled(true)
	slot0.progress:setPercent(0)

	slot0.lantern_panel = slot1:getChildByName("lantern_panel")
	slot0.hot_val_image = slot1:getChildByName("hot_val_image")
	slot0.hot_val_txt = slot0.hot_val_image:getChildByName("label")

	slot1:getChildByName("action_tips"):setString(TI18N("秋日祭，放烟花，花火兑好礼"))
	slot1:getChildByName("item_num_title"):setString(TI18N("当前拥有:"))

	if Config.HolidayPetardData.data_const.holiday_time then
		slot0.time_txt:setString(TI18N("活动时间：") .. slot3.desc)
	end
end

function PetardActionMainPanel.registerEvent(slot0)
	for slot4, slot5 in ipairs(slot0.item_object_list) do
		if slot5.add_item_btn then
			registerButtonEventListener(slot5.add_item_btn, function ()
				uv0:onClickAddItemBtn(uv1)
			end, true)
		end
	end

	registerButtonEventListener(slot0.shop_btn, handler(slot0, slot0.onClickShopBtn), true)
	registerButtonEventListener(slot0.put_btn, handler(slot0, slot0.onClickPutBtn), true)
	registerButtonEventListener(slot0.btn_rule, handler(slot0, slot0.onClickRuleBtn), true)

	if not slot0.get_petard_data_event then
		slot0.get_petard_data_event = GlobalEvent:getInstance():Bind(PetardActionEvent.Get_Base_Info_Event, function ()
			uv0:setData()
		end)
	end

	if not slot0.update_add_good_event then
		slot0.update_add_good_event = GlobalEvent:getInstance():Bind(BackpackEvent.ADD_GOODS, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
				return
			end

			uv0:updateItemNum(slot1)
		end)
	end

	if not slot0.update_delete_good_event then
		slot0.update_delete_good_event = GlobalEvent:getInstance():Bind(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
				return
			end

			uv0:updateItemNum(slot1)
		end)
	end

	if not slot0.update_modify_good_event then
		slot0.update_modify_good_event = GlobalEvent:getInstance():Bind(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
				return
			end

			uv0:updateItemNum(slot1)
		end)
	end
end

function PetardActionMainPanel.onClickAddItemBtn(slot0, slot1)
	if ActionController:getInstance():getActionSubTabVo(ActionRankCommonType.exercise_1) and slot2.action_operate and slot2.action_operate.tab_list[slot3.bid] then
		slot2.action_operate:handleSelectedTab(slot2.action_operate.tab_list[slot3.bid])
	else
		message(TI18N("该活动已结束"))
	end
end

function PetardActionMainPanel.onClickShopBtn(slot0)
	MallController:getInstance():openMallActionWindow(true, slot0.holiday_bid)
end

function PetardActionMainPanel.onClickPutBtn(slot0)
	uv0:openSelectItemWindow(true)
end

function PetardActionMainPanel.onClickRuleBtn(slot0, slot1, slot2, slot3)
	if Config.HolidayPetardData.data_const.holiday_rule then
		TipsManager:getInstance():showCommonTips(slot4.desc, slot2:getTouchBeganPosition())
	end
end

function PetardActionMainPanel.setVisibleStatus(slot0, slot1)
	slot1 = slot1 or false

	slot0:setVisible(slot1)

	if slot1 == true and slot0._init_flag == true then
		uv0:sender27000()
	end
end

function PetardActionMainPanel.setData(slot0)
	if not uv0:getPetardBaseInfo() or next(slot1) == nil then
		return
	end

	slot0.petard_hot_txt:setString(uv1(TI18N("全服烟花热度：%d/%d"), slot1.score or 0, uv0:getMaxPetardHotVal()))

	function slot4(slot0)
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
	end

	slot5 = 60
	slot6 = (720 - slot5 * 2) / (Config.HolidayPetardData.data_award_length - 1)
	slot7 = slot5
	slot8 = 0
	slot9 = false

	for slot13, slot14 in ipairs(Config.HolidayPetardData.data_award) do
		if not slot0.lantern_list[slot13] then
			slot15 = PetardLanternItem.new()

			slot0.lantern_panel:addChild(slot15)

			slot0.lantern_list[slot13] = slot15
		end

		slot15:setData({
			cfg = slot14,
			state = slot4(slot14.id)
		})
		slot15:setPosition(cc.p(slot5 + (slot13 - 1) * slot6, 174))

		if not slot9 then
			slot7 = slot17
			slot8 = slot14.count / 1000 * slot3

			if slot16.state == PetardActionConst.Lantern_State.Lock then
				slot9 = true
			end
		end
	end

	slot0.hot_val_image:setPositionX(slot7)
	slot0.hot_val_txt:setString(slot8)

	if slot3 <= slot2 then
		slot0.progress:setPercent(100)
	else
		slot10 = 0
		slot11 = 720
		slot13 = 0

		for slot17, slot18 in ipairs(Config.HolidayPetardData.data_award) do
			slot19 = slot18.count / 1000 * slot3

			if slot17 == 1 then
				if slot2 <= slot19 then
					slot13 = slot2 / slot19 * 60

					break
				else
					slot13 = slot12
				end
			elseif slot2 <= slot19 then
				slot13 = slot13 + (slot2 - slot10) / (slot19 - slot10) * slot6

				break
			else
				slot13 = slot13 + slot6
			end

			slot10 = slot19
		end

		slot0.progress:setPercent(slot13 / slot11 * 100)
	end
end

function PetardActionMainPanel.updateItemNum(slot0, slot1)
	if slot1 then
		for slot5, slot6 in pairs(slot1) do
			for slot10, slot11 in pairs(slot0.item_object_list) do
				if slot6.base_id and slot11.item_bid and slot6.base_id == slot11.item_bid and slot11.item_num_txt then
					slot11.item_num_txt:setString(BackpackController:getInstance():getModel():getItemNumByBid(slot11.item_bid))

					break
				end
			end
		end
	else
		for slot5, slot6 in pairs(slot0.item_object_list) do
			if slot6.item_bid and slot6.item_num_txt then
				slot6.item_num_txt:setString(BackpackController:getInstance():getModel():getItemNumByBid(slot6.item_bid))
			end
		end
	end
end

function PetardActionMainPanel.DeleteMe(slot0)
	doStopAllActions(slot0.main_container)

	if slot0.resources_load then
		slot0.resources_load:DeleteMe()

		slot0.resources_load = nil
	end

	for slot4, slot5 in pairs(slot0.lantern_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	if slot0.get_petard_data_event then
		GlobalEvent:getInstance():UnBind(slot0.get_petard_data_event)

		slot0.get_petard_data_event = nil
	end

	if slot0.update_add_good_event then
		GlobalEvent:getInstance():UnBind(slot0.update_add_good_event)

		slot0.update_add_good_event = nil
	end

	if slot0.update_delete_good_event then
		GlobalEvent:getInstance():UnBind(slot0.update_delete_good_event)

		slot0.update_delete_good_event = nil
	end

	if slot0.update_modify_good_event then
		GlobalEvent:getInstance():UnBind(slot0.update_modify_good_event)

		slot0.update_modify_good_event = nil
	end
end

PetardLanternItem = class("PetardLanternItem", function ()
	return ccui.Widget:create()
end)

function PetardLanternItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function PetardLanternItem.configUI(slot0)
	slot0.size = cc.size(105, 167)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)
	slot0:setAnchorPoint(cc.p(0.5, 1))

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("petard/petard_lantern_item"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot2
	slot0.lantern_image = slot2:getChildByName("lantern_image")
	slot0.node_sp = slot2:getChildByName("node_sp")
	slot0.got_sp = slot2:getChildByName("got_sp")
end

function PetardLanternItem.register_event(slot0)
	registerButtonEventListener(slot0.main_container, handler(slot0, slot0.onClickItem), true)
end

function PetardLanternItem.onClickItem(slot0)
	if not slot0.data then
		return
	end

	if slot0.data.state == PetardActionConst.Lantern_State.CanGet then
		uv0:sender27007(slot0.data.cfg.id)
	else
		uv0:openPetardAwardWindow(true)
	end
end

function PetardLanternItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0.main_container:setRotation(0)
	slot0.lantern_image:setOpacity(255)
	slot0.got_sp:setVisible(false)
	slot0:handleLanternEffect(slot0.data.state == PetardActionConst.Lantern_State.CanGet)
	slot0.lantern_image:setVisible(slot0.data.state ~= PetardActionConst.Lantern_State.CanGet)

	if slot0.data.state == PetardActionConst.Lantern_State.Lock then
		slot0.lantern_image:loadTexture(PathTool.getResFrame("actionpetard", "actionpetard_1001"), LOADTEXT_TYPE_PLIST)
		loadSpriteTexture(slot0.node_sp, PathTool.getResFrame("actionpetard", "actionpetard_1003"), LOADTEXT_TYPE_PLIST)
	elseif slot0.data.state ~= PetardActionConst.Lantern_State.CanGet then
		slot0.lantern_image:loadTexture(PathTool.getResFrame("actionpetard", "actionpetard_1000"), LOADTEXT_TYPE_PLIST)
		loadSpriteTexture(slot0.node_sp, PathTool.getResFrame("actionpetard", "actionpetard_1002"), LOADTEXT_TYPE_PLIST)
		slot0.lantern_image:setOpacity(153)
		slot0.got_sp:setVisible(true)
	end
end

function PetardLanternItem.handleLanternEffect(slot0, slot1)
	if slot1 == false then
		if slot0.lantern_effect then
			slot0.lantern_effect:clearTracks()
			slot0.lantern_effect:removeFromParent()

			slot0.lantern_effect = nil
		end
	elseif not tolua.isnull(slot0.main_container) and slot0.lantern_effect == nil then
		slot0.lantern_effect = createEffectSpine(Config.EffectData.data_effect_info[333], cc.p(slot0.size.width * 0.5, slot0.size.height * 0.5), cc.p(0.5, 0.5), true, PlayerAction.action)

		slot0.main_container:addChild(slot0.lantern_effect)
	end
end

function PetardLanternItem.DeleteMe(slot0)
	slot0:handleLanternEffect(false)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
