MainUiNoticeView = class("MainUiNoticeView", function ()
	return ccui.Layout:create()
end)
slot0 = table.insert
slot1 = table.remove

function MainUiNoticeView.ctor(slot0)
	slot0:initConfig()
	slot0:createRootWnd()
	slot0:registerEvent()
end

function MainUiNoticeView.initConfig(slot0)
	slot0.finish_list = {}
	slot0.be_in_show = false
	slot0.cur_info = {}
	slot0.resources_load_finish = false
	slot0.world_buff_list = {}
end

function MainUiNoticeView.createRootWnd(slot0)
	slot0:setContentSize(cc.size(SCREEN_WIDTH, SCREEN_HEIGHT))
	slot0:setAnchorPoint(cc.p(0, 0))
	ViewManager:getInstance():addToLayerByTag(slot0, ViewMgrTag.MSG_TAG, 10)

	slot0.item = createCSBNote(PathTool.getTargetCSB("task/task_notice_item"))

	slot0.item:setAnchorPoint(cc.p(0.5, 1))
	slot0.item:setPosition(SCREEN_WIDTH * 0.5, display.getTop())
	slot0:addChild(slot0.item)

	slot0.container = slot0.item:getChildByName("container")

	slot0.container:setVisible(false)

	slot0.task_img = slot0.container:getChildByName("task_img")
	slot0.task_name = slot0.container:getChildByName("task_name")
	slot0.task_desc = slot0.container:getChildByName("task_desc")

	UITool.SetLightColor(slot0.task_desc)

	slot0.target_height = slot0.container:getContentSize().height

	slot0.container:setPositionY(slot0.target_height)
end

function MainUiNoticeView.registerEvent(slot0)
	if slot0.update_quest_finish_event == nil then
		slot0.update_quest_finish_event = GlobalEvent:getInstance():Bind(TaskEvent.UpdateTaskList, function (slot0, slot1)
			uv0:fillFinishData(slot1, TaskConst.type.quest)
		end)
	end

	if slot0.update_feat_finish_event == nil then
		slot0.update_feat_finish_event = GlobalEvent:getInstance():Bind(TaskEvent.UpdateFeatList, function (slot0)
			uv0:fillFinishData(slot0, TaskConst.type.feat)
		end)
	end

	if slot0.update_exp_finish_event == nil then
		slot0.update_exp_finish_event = GlobalEvent:getInstance():Bind(TaskEvent.TASK_EXP_FINISH_TIPS_EVENT, function (slot0)
			uv0:fillFinishData(slot0, TaskConst.type.exp)
		end)
	end

	slot0.container:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0:doMoveOut()

			if uv0.cur_info then
				TaskController:getInstance():openTaskMainWindow(true, uv0.cur_info.type)
			end
		end
	end)
end

function MainUiNoticeView.fillFinishData(slot0, slot1, slot2)
	if GuideController:getInstance():isInGuide() then
		return
	end

	if StoryController:getInstance():getModel():isStoryState() then
		return
	end

	if slot1 == nil or next(slot1) == nil then
		return
	end

	for slot6, slot7 in ipairs(slot1) do
		uv0(slot0.finish_list, {
			id = slot7,
			type = slot2
		})
	end

	slot0:doMoveFinishItem()
end

function MainUiNoticeView.doMoveFinishItem(slot0)
	if slot0.be_in_show == true then
		return
	end

	if slot0.finish_list == nil or next(slot0.finish_list) == nil then
		return
	end

	slot0.be_in_show = true

	if uv0(slot0.finish_list, 1) then
		if slot1.type == TaskConst.type.quest then
			slot0.cur_info = TaskController:getInstance():getModel():getTaskById(slot1.id)
		elseif slot1.type == TaskConst.type.feat then
			slot0.cur_info = slot2:getFeatById(slot1.id)
		elseif slot1.type == TaskConst.type.exp then
			slot0.cur_info = slot2:getTaskExpListById(slot1.id)
		end
	end

	if slot0.cur_info and slot0.cur_info.config then
		slot2 = "quest_item_icon"

		if slot0.cur_info.type == TaskConst.type.feat then
			slot0.task_name:setString(TI18N("成就达成"))

			slot2 = "quest_item_icon_2"
		elseif slot0.cur_info.type == TaskConst.type.exp then
			slot0.task_name:setString(slot0.cur_info.config.name)

			if slot0.cur_info.config.hide == TRUE then
				slot2 = "quest_item_icon_4"

				slot0:showItemEffect(true)
			else
				slot2 = "quest_item_icon_3"
			end
		else
			slot0.task_name:setString(TI18N("日常完成"))

			slot2 = "quest_item_icon"
		end

		if StringUtil.SubStringGetTotalIndex(slot0.cur_info:getTaskContent()) > 14 then
			slot3 = StringUtil.SubStringUTF8(slot3, 1, 14) .. "..."
		end

		slot0.task_desc:setString(slot3)

		slot0.load_resources = createResourcesLoad(PathTool.getPlistImgForDownLoad("bigbg/quest", slot2), ResourcesType.single, function ()
			loadSpriteTexture(uv0.task_img, PathTool.getPlistImgForDownLoad("bigbg/quest", uv1), LOADTEXT_TYPE)
		end, slot0.load_resources)

		slot0:doMoveIn()
	end
end

function MainUiNoticeView.doMoveIn(slot0)
	slot0.container:setVisible(true)
	slot0.container:setOpacity(0)
	slot0.container:setPositionY(slot0.target_height)
	slot0.container:runAction(cc.Sequence:create(cc.Spawn:create(cc.FadeIn:create(0.3), cc.MoveTo:create(0.3, cc.p(0, 0))), cc.DelayTime:create(3), cc.Spawn:create(cc.FadeOut:create(0.3), cc.MoveTo:create(0.3, cc.p(0, slot0.target_height))), cc.CallFunc:create(function ()
		uv0:doMoveOut()
	end)))
end

function MainUiNoticeView.doMoveOut(slot0)
	slot0.be_in_show = false

	slot0.container:stopAllActions()
	slot0.container:setVisible(false)
	slot0.container:setOpacity(0)
	slot0.container:setPositionY(slot0.target_height)

	if slot0.load_resources then
		slot0.load_resources:DeleteMe()

		slot0.load_resources = nil
	end

	slot0:showItemEffect(false)
	slot0:doMoveFinishItem()
end

function MainUiNoticeView.showItemEffect(slot0, slot1)
	if slot1 == true then
		if slot0.play_effect == nil then
			slot2, slot3 = slot0.task_img:getPosition()
			slot0.play_effect = createEffectSpine("E50104", cc.p(slot2, slot3), cc.p(0.5, 0.5), true, PlayerAction.action_1)

			slot0.container:addChild(slot0.play_effect, 1)
		end
	elseif slot0.play_effect then
		slot0.play_effect:setVisible(false)
		slot0.play_effect:removeFromParent()

		slot0.play_effect = nil
	end
end

function MainUiNoticeView.DeleteMe(slot0)
	if slot0.load_resources then
		slot0.load_resources:DeleteMe()

		slot0.load_resources = nil
	end

	slot0:showItemEffect(false)
	doStopAllActions(slot0.container)

	if slot0.update_quest_finish_event then
		GlobalEvent:getInstance():UnBind(slot0.update_quest_finish_event)

		slot0.update_quest_finish_event = nil
	end

	if slot0.update_feat_finish_event then
		GlobalEvent:getInstance():UnBind(slot0.update_feat_finish_event)

		slot0.update_feat_finish_event = nil
	end

	if slot0.update_exp_finish_event then
		GlobalEvent:getInstance():UnBind(slot0.update_exp_finish_event)

		slot0.update_exp_finish_event = nil
	end

	if not tolua.isnull(slot0) then
		slot0:removeAllChildren()
		slot0:removeFromParent()
	end
end
