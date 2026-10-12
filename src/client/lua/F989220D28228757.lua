StartWorkPanel = class("StartWorkPanel", function ()
	return ccui.Widget:create()
end)
slot0 = string.format

function StartWorkPanel.ctor(slot0, slot1)
	slot0.holiday_bid = slot1
	slot0.btn_reward_list = {}

	slot0:loadResources()
end

function StartWorkPanel.loadResources(slot0)
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("startwork", "startwork"),
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

function StartWorkPanel.loadResListCompleted(slot0)
	slot0:createRootWnd()
	slot0:roundSprite()
	slot0:registerEvent()
end

function StartWorkPanel.createRootWnd(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("welfare/start_work_panel"))

	slot0:addChild(slot0.root_wnd)
	slot0:setPosition(-40, -80)
	slot0:setAnchorPoint(0, 0)

	if not slot0.load_bg then
		slot0.load_bg = loadSpriteTextureFromCDN(slot0.root_wnd:getChildByName("main_container"):getChildByName("bg"), PathTool.getPlistImgForDownLoad("bigbg/welfare", "welfare_startwork"), ResourcesType.single)
	end

	slot0.holiday_time = slot1:getChildByName("Text_7")

	slot0.holiday_time:setString(TI18N("活动时间："))

	slot7 = TI18N

	slot1:getChildByName("Text_8"):setString(slot7("活动说明：周六、周日、周一登录可领取"))

	for slot7 = 1, 3 do
		slot8 = {
			btn = slot1:getChildByName("week_gift_" .. slot7)
		}
		slot8.flag = slot8.btn:getChildByName("flag")
		slot8.round = slot8.btn:getChildByName("Sprite_2")

		slot8.flag:setVisible(false)

		slot8.text_1 = slot8.btn:getChildByName("reward_bg"):getChildByName("text_1")

		slot8.text_1:setString("")

		slot8.text_2 = slot8.btn:getChildByName("reward_bg"):getChildByName("text_2")

		slot8.text_2:setString("")

		slot0.btn_reward_list[slot7] = slot8
	end

	ActionController:getInstance():cs16603(slot0.holiday_bid)
end

function StartWorkPanel.roundSprite(slot0)
	for slot4 = 1, 3 do
		if slot0.btn_reward_list and slot0.btn_reward_list[slot4] and slot0.btn_reward_list[slot4].round then
			loadSpriteTexture(slot0.btn_reward_list[slot4].round, PathTool.getResFrame("startwork", "startwork0" .. slot4 + 1), LOADTEXT_TYPE_PLIST)
		end
	end
end

function StartWorkPanel.stopRoundAction(slot0)
	for slot4, slot5 in pairs(slot0.btn_reward_list) do
		if slot5.round then
			doStopAllActions(slot5.round)
		end
	end
end

function StartWorkPanel.signReward(slot0, slot1)
	if not slot1.aim_list or next(slot1.aim_list) == nil then
		return
	end

	slot0:stopRoundAction()

	for slot5, slot6 in ipairs(slot1.aim_list) do
		if slot6.status == 1 then
			slot0.btn_reward_list[slot5].flag:setVisible(false)

			slot7 = cc.SkewTo:create(0.3, 3, 0)
			slot8 = cc.SkewTo:create(0.3, -3, 0)

			slot0.btn_reward_list[slot5].round:runAction(cc.RepeatForever:create(cc.Sequence:create(slot7, slot8, slot7, slot8, cc.SkewTo:create(0.4, 0, 0), cc.DelayTime:create(1))))
		elseif slot6.status == 2 then
			slot0.btn_reward_list[slot5].flag:setVisible(true)
			loadSpriteTexture(slot0.btn_reward_list[slot5].flag, PathTool.getResFrame("startwork", "txt_cn_startwork02"), LOADTEXT_TYPE_PLIST)
		elseif slot6.status == 3 then
			slot0.btn_reward_list[slot5].flag:setVisible(true)
			loadSpriteTexture(slot0.btn_reward_list[slot5].flag, PathTool.getResFrame("startwork", "txt_cn_startwork01"), LOADTEXT_TYPE_PLIST)
		else
			slot0.btn_reward_list[slot5].flag:setVisible(false)
		end

		if slot6.item_list then
			for slot10, slot11 in ipairs(slot6.item_list) do
				if slot10 == 1 then
					if Config.ItemData.data_get_data(slot11.bid) then
						slot0.btn_reward_list[slot5].text_1:setString(uv0("%s*%d", slot12.name, slot11.num))
					end
				elseif Config.ItemData.data_get_data(slot11.bid) then
					slot0.btn_reward_list[slot5].text_2:setString(uv0("%s*%d", slot12.name, slot11.num))
				end
			end
		end
	end
end

function StartWorkPanel.holidayTime(slot0, slot1)
	if slot1.args then
		slot2, slot3 = nil

		if keyfind("args_key", 1, slot1.args) or nil then
			slot2 = slot4.args_val
		end

		if keyfind("args_key", 2, slot1.args) or nil then
			slot3 = slot5.args_val
		end

		if slot2 and slot3 then
			slot0.holiday_time:setString(uv0(TI18N("活动时间：%s 至 %s"), TimeTool.getYMD2(slot2), TimeTool.getYMD2(slot3)))
		end
	end
end

function StartWorkPanel.registerEvent(slot0)
	if slot0.start_welfare_event == nil then
		slot0.start_welfare_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_HOLIDAY_SIGNLE, function (slot0)
			if slot0.bid == uv0.holiday_bid then
				uv0.data = slot0

				uv0:signReward(slot0)
				uv0:holidayTime(slot0)
			end
		end)
	end

	for slot4, slot5 in pairs(slot0.btn_reward_list) do
		registerButtonEventListener(slot5.btn, function ()
			if not uv0.data then
				return
			end

			if uv0.data.aim_list[uv1] and uv0.data.aim_list[uv1].aim then
				ActionController:getInstance():cs16604(uv0.holiday_bid, uv0.data.aim_list[uv1].aim)
			end
		end)
	end
end

function StartWorkPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function StartWorkPanel.DeleteMe(slot0)
	slot0:stopRoundAction()

	if slot0.resources_load then
		slot0.resources_load:DeleteMe()

		slot0.resources_load = nil
	end

	if slot0.start_welfare_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.start_welfare_event)

		slot0.start_welfare_event = nil
	end

	if slot0.load_bg then
		slot0.load_bg:DeleteMe()
	end

	slot0.load_bg = nil
end
