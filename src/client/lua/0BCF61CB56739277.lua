AnimateYuanzhenKitchenPanel = class("AnimateYuanzhenKitchenPanel", function ()
	return ccui.Widget:create()
end)
slot0 = AnimateActionController:getInstance()
slot1 = Config.HolidayMakeData.data_make_lev_list

function AnimateYuanzhenKitchenPanel.ctor(slot0, slot1)
	slot0.net_load = false
	slot0.holiday_id = nil
	slot0.holiday_reward_bid = nil

	slot0:loadResources()
end

function AnimateYuanzhenKitchenPanel.loadResources(slot0)
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("animateaction", "animateaction_yaunzhen"),
			type = ResourcesType.plist
		}
	}
	slot0.resources_load = ResourcesLoad.New(true)

	slot0.resources_load:addAllList(slot0.res_list, function ()
		if uv0.loadResListCompleted then
			uv0:loadResListCompleted()
		end
	end)
end

function AnimateYuanzhenKitchenPanel.loadResListCompleted(slot0)
	slot0:configUI()
	slot0:register_event()
end

function AnimateYuanzhenKitchenPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("animateaction/animate_yuanzhen_kiechen_panel"))

	slot0.root_wnd:setPosition(-40, -82)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot0.title_img = slot0.root_wnd:getChildByName("main_container"):getChildByName("title_img")

	if not slot0.item_load then
		slot0.item_load = createResourcesLoad(PathTool.getTargetRes("bigbg/animateaction", "txt_cn_animateaction_2", false, false), ResourcesType.single, function ()
			if not tolua.isnull(uv0.title_img) then
				loadSpriteTexture(uv0.title_img, uv1, LOADTEXT_TYPE)
			end
		end, slot0.item_load)
	end

	slot0.btn_collect = slot1:getChildByName("btn_collect")

	slot0.btn_collect:getChildByName("Text_5"):setString(TI18N("获取材料"))

	slot0.btn_goto = slot1:getChildByName("btn_goto")

	slot0.btn_goto:getChildByName("Text_5_0"):setString(TI18N("制作福卡"))

	slot0.btn_reward = slot1:getChildByName("btn_reward")
	slot0.time_text = slot1:getChildByName("time_text")
	slot6 = ""

	slot0.time_text:setString(slot6)

	slot0.kitchen_tesk_list = {}

	for slot6 = 1, 4 do
		slot0.kitchen_tesk_list[slot6] = slot1:getChildByName("task_text_" .. slot6)
	end

	slot3 = createRichLabel(26, cc.c4b(255, 236, 194, 255), cc.p(0.5, 0.5), cc.p(slot1:getContentSize().width / 2 - 78, 606), nil, nil, 500)

	slot1:addChild(slot3)
	slot3:setString(string.format(TI18N("欢迎来到 <div fontcolor=#64e678 >%s</div> 的中秋厨房"), RoleController:getInstance():getRoleVo().name))
end

function AnimateYuanzhenKitchenPanel.register_event(slot0)
	if not slot0.festval_kitchen_event then
		slot0.festval_kitchen_event = GlobalEvent:getInstance():Bind(AnimateActionEvent.YuanZhenFestval_Kitchen, function (slot0)
			if not slot0 or next(slot0) == nil then
				return
			end

			uv0.kitchen_tesk_list[1]:setString(string.format(TI18N("收集材料: %d"), slot0.show_list[2].num))
			uv0.kitchen_tesk_list[2]:setString(string.format(TI18N("制作福卡: %d"), slot0.show_list[1].num))
			uv0.kitchen_tesk_list[3]:setString(string.format(TI18N("击败怪物: %d"), slot0.show_list[3].num))
			uv0.kitchen_tesk_list[4]:setString(string.format(TI18N("第%d级"), slot0.lev))
			uv0.time_text:setString(string.format(TI18N("活动时间: %s- %s"), TimeTool.getMD2(slot0.start_time), TimeTool.getMD2(slot0.end_time)))

			uv0.make_lev = slot0.lev
			uv0.cur_exp = slot0.exp
			uv0.holiday_id = slot0.camp_id
			uv0.holiday_reward_bid = slot0.group_id
			uv0.net_load = true
		end)
	end

	if not slot0.kitchen_get_lev_event then
		slot0.kitchen_get_lev_event = GlobalEvent:getInstance():Bind(AnimateActionEvent.YuanZhenFestval_Kitchen_Lev, function (slot0)
			if uv0.holiday_id then
				slot1 = false
				slot5 = uv0.holiday_id

				for slot5, slot6 in pairs(uv1[slot5]) do
					if uv2:getModel():getKitchenLevData(slot6.lev) == false and slot6.lev <= uv0.make_lev then
						slot1 = true

						break
					end
				end

				addRedPointToNodeByStatus(uv0.btn_reward, slot1)
			end
		end)
	end

	registerButtonEventListener(slot0.btn_collect, function ()
		if uv0.net_load == true then
			MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.YuanZhenFight)
		else
			message(TI18N("网络加载中......"))
		end
	end, true, 1)
	registerButtonEventListener(slot0.btn_goto, function ()
		if uv0.net_load == true then
			uv1:openAnimateYuanzhenGotoKitchenWindow(true, uv0.holiday_id, uv0.make_lev, uv0.holiday_reward_bid, uv0.cur_exp)
		else
			message(TI18N("网络加载中......"))
		end
	end, true, 1)
	registerButtonEventListener(slot0.btn_reward, function ()
		if uv0.net_load == true then
			uv1:openAnimateYuanzhenKitchenLevWindow(true, uv0.holiday_id)
		else
			message(TI18N("网络加载中......"))
		end
	end, true, 1)
end

function AnimateYuanzhenKitchenPanel.setVisibleStatus(slot0, slot1)
	slot1 = slot1 or false

	slot0:setVisible(slot1)

	if slot1 == true then
		uv0:sender24804()
		uv0:sender24805()
	end
end

function AnimateYuanzhenKitchenPanel.DeleteMe(slot0)
	if slot0.resources_load then
		slot0.resources_load:DeleteMe()

		slot0.resources_load = nil
	end

	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	if slot0.festval_kitchen_event then
		GlobalEvent:getInstance():UnBind(slot0.festval_kitchen_event)

		slot0.festval_kitchen_event = nil
	end

	if slot0.kitchen_get_lev_event then
		GlobalEvent:getInstance():UnBind(slot0.kitchen_get_lev_event)

		slot0.kitchen_get_lev_event = nil
	end
end
