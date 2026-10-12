ActivityItem = class("ActivityItem", function ()
	return ccui.Widget:create()
end)

function ActivityItem.ctor(slot0)
	slot0.is_double = false
	slot0.list_item = {}

	slot0:createRootWnd()
	slot0:registerEvent()
end

function ActivityItem.createRootWnd(slot0)
	slot0.count = nil
	slot0.rootWnd = createCSBNote(PathTool.getTargetCSB("activity/activity_item"))

	slot0:setAnchorPoint(cc.p(0, 1))
	slot0:addChild(slot0.rootWnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(605, 165))

	slot0.mainContainer = slot0.rootWnd:getChildByName("main_container")
	slot0.itemMask = slot0.mainContainer:getChildByName("itemMask")
	slot0.textLimit = slot0.itemMask:getChildByName("textLimit")

	slot0.textLimit:setString(TI18N("敬请期待"))
	slot0.itemMask:setLocalZOrder(11)
	UITool.SetTitleColor(slot0.textLimit)

	slot0.btnRule = slot0.mainContainer:getChildByName("btnRule")

	slot0.btnRule:setTouchEnabled(false)

	slot0.textTimeStart = slot0.mainContainer:getChildByName("textTimeStart")

	slot0.textTimeStart:setString("")
	slot0.textTimeStart:setVisible(false)

	slot0.itemBG = slot0.mainContainer:getChildByName("itemBG")
	slot0.redPoint = slot0.mainContainer:getChildByName("redPoint")

	slot0.redPoint:setVisible(false)
end

function ActivityItem.setData(slot0, slot1)
	slot0.activityData = slot1

	slot0:changeItemData(slot1)

	if slot1 and slot1.id then
		slot0:setName("guide_activity_item_" .. slot1.id)
	end
end

function ActivityItem.getData(slot0)
	return slot0.activityData
end

function ActivityItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function ActivityItem.registerEvent(slot0)
	if slot0.btnRule then
		slot0.btnRule:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				if uv0.activityData.id == ActivityConst.limit_index.escort then
					MainuiController:getInstance():openCommonExplainView(true, Config.EscortData.data_explain)
				elseif uv0.activityData.id == ActivityConst.limit_index.union then
					MainuiController:getInstance():openCommonExplainView(true, Config.GuildDunData.data_explain)
				elseif uv0.activityData.id == ActivityConst.limit_index.fightFirst then
					-- Nothing
				elseif uv0.activityData.id == ActivityConst.limit_index.allGod then
					MainuiController:getInstance():openCommonExplainView(true, Config.ZsWarData.data_explain)
				elseif uv0.activityData.id == ActivityConst.limit_index.guildwar then
					MainuiController:getInstance():openCommonExplainView(true, Config.GuildWarData.data_explain)
				elseif uv0.activityData.id == ActivityConst.limit_index.champion then
					MainuiController:getInstance():openCommonExplainView(true, Config.ArenaChampionData.data_explain)
				elseif uv0.activityData.id == ActivityConst.limit_index.ladder then
					MainuiController:getInstance():openCommonExplainView(true, Config.SkyLadderData.data_explain)
				end
			end
		end)
	end

	slot0:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0.touch_end = slot0:getTouchEndPosition()
			slot2 = true

			if uv0.touch_began ~= nil then
				slot2 = math.abs(uv0.touch_end.x - uv0.touch_began.x) <= 20 and math.abs(uv0.touch_end.y - uv0.touch_began.y) <= 20
			end

			if slot2 == true then
				playButtonSound2()

				if uv0.callback then
					uv0:callback()
				end
			end
		elseif slot1 == ccui.TouchEventType.moved then
			-- Nothing
		elseif slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()
		elseif slot1 == ccui.TouchEventType.canceled then
			-- Nothing
		end
	end)
end

function ActivityItem.updateRedStatus(slot0)
	if slot0.activityData then
		slot1 = false

		if slot0.activityData.id == ActivityConst.limit_index.union then
			if GuildbossController:getInstance():getModel():getChangeCount() == true and ActivityController:getInstance():getBossActivityDoubleTime() == true and ActivityController:getInstance():getFirstComeGuild() == true then
				slot1 = true
			end
		elseif slot0.activityData.id == ActivityConst.limit_index.guildwar then
			slot1 = GuildwarController:getInstance():getModel():checkGuildGuildWarRedStatus()
		elseif slot0.activityData.id == ActivityConst.limit_index.ladder then
			slot1 = LadderController:getInstance():getModel():checkLadderRedStatus()
		end

		slot0.redPoint:setVisible(slot1)
	end
end

function ActivityItem.changeItemData(slot0, slot1)
	if slot1.val[1] then
		for slot5, slot6 in pairs(slot1.val[1]) do
			if not slot0.list_item[slot5] then
				slot7 = BackPackItem.new(nil, true, nil, 0.5)

				if slot0.mainContainer then
					slot0.mainContainer:addChild(slot7, 1)
				end

				slot0.list_item[slot5] = slot7
			end

			if slot0.list_item[slot5] then
				slot0.list_item[slot5]:setPosition(cc.p(40 * slot5 + 24 * slot5 - 1, 67))
				slot0.list_item[slot5]:setBaseData(slot6)
				slot0.list_item[slot5]:setDoubleIcon(slot0.is_double)
				slot0.list_item[slot5]:setDefaultTip()
			end
		end
	end

	slot0:limitItemData(slot1)

	if slot1.desc and slot0.textTimeStart then
		slot0.textTimeStart:setString(slot1.desc)
		slot0.textTimeStart:setVisible(true)
	end
end

function ActivityItem.limitItemData(slot0, slot1)
	slot2 = RoleController:getInstance():getRoleVo()

	loadSpriteTexture(slot0.itemBG, PathTool.getTargetRes("activity/activity_big", "txt_cn_activity_item_" .. slot1.id, false, false), LOADTEXT_TYPE)

	if slot1.is_open == 1 then
		if MainuiController:getInstance():checkIsOpenByActivate(slot1.activate) == true then
			slot0:setTouchEnabled(true)
			slot0:handleEffect(true)
			slot0.itemMask:setVisible(false)

			if slot0.btnRule then
				slot0.btnRule:setTouchEnabled(true)
			end

			if slot1.id == ActivityConst.limit_index.union and slot2.gname == "" then
				slot0.textLimit:setString(TI18N("当前未加入公会"))
				slot0:handleEffect(false)
				slot0.itemMask:setVisible(true)
				slot0.itemMask:setTouchEnabled(true)
			end
		else
			slot0:handleEffect(false)

			if slot0.btnRule then
				slot0.btnRule:setTouchEnabled(false)
			end

			slot0.textLimit:setString(slot1.lock_desc)
		end
	elseif slot1.id == ActivityConst.limit_index.union and slot2.gname ~= "" then
		slot0.textLimit:setString(TI18N("公会副本玩法暂未开启"))
	end
end

function ActivityItem.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	elseif not tolua.isnull(slot0.mainContainer) and slot0.play_effect == nil then
		slot0.play_effect = createEffectSpine(PathTool.getEffectRes(505), cc.p(slot0.itemBG:getContentSize().width - 106, 28), cc.p(1, 0), true, PlayerAction.action)

		slot0.mainContainer:addChild(slot0.play_effect, 1)
	end
end

function ActivityItem.DeleteMe(slot0)
	if slot0.list_item and next(slot0.list_item) ~= nil then
		for slot4, slot5 in ipairs(slot0.list_item) do
			if slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end
	end

	slot0.list_item = {}

	slot0:handleEffect(false)
	slot0:removeAllChildren()
	slot0:removeFromParent()

	slot0.count = nil
end
