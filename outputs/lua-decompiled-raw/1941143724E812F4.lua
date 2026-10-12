GuildskillLevelSuccessPanel = GuildskillLevelSuccessPanel or BaseClass(BaseView)
slot1 = GuildskillController:getInstance():getModel()
slot2 = string.format

function GuildskillLevelSuccessPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Tips
	slot0.layout_name = "guildskill/guildskill_level_success_panel"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("levupgrade", "levupgrade"),
			type = ResourcesType.plist
		}
	}
	slot0.lev_list = {}
	slot0.item_list = {}
	slot0.can_touch = false
	slot0.auto_limit_time = 5
end

function GuildskillLevelSuccessPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.back_panel = slot0.main_container:getChildByName("back_panel")
	slot0.title_container = slot0.main_container:getChildByName("title_container")
	slot0.title_width = slot0.title_container:getContentSize().width
	slot0.title_height = slot0.title_container:getContentSize().height
	slot0.skill_item = SkillItem.new(true, false, false, nil, , false)

	slot0.skill_item:setPosition(360, 394)
	slot0.main_container:addChild(slot0.skill_item)

	slot0.item_1 = slot0.main_container:getChildByName("item_1")
	slot0.left_lev = slot0.item_1:getChildByName("last_lev")
	slot0.right_lev = slot0.item_1:getChildByName("now_lev")
	slot0.tips_label = slot0.main_container:getChildByName("tips_label")

	slot0.tips_label:setString(TI18N("技能等级已提升"))
	slot0:runmoveAction(slot0.skill_item, 0.1)
	slot0:runmoveAction(slot0.item_1, 0.2)
	slot0:runmoveAction(slot0.tips_label, 0.3)
end

function GuildskillLevelSuccessPanel.runmoveAction(slot0, slot1, slot2)
	if slot2 <= 0 then
		slot2 = 1
	end

	slot3, slot4 = slot1:getPosition()

	slot1:setPosition(slot3 - 300, slot4)
	slot1:setOpacity(0)
	slot1:runAction(cc.Sequence:create(cc.DelayTime:create(slot2), cc.Spawn:create(cc.EaseBackOut:create(cc.MoveTo:create(0.4, cc.p(slot3, slot4))), cc.FadeIn:create(0.4))))
end

function GuildskillLevelSuccessPanel.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended and uv0.can_touch == true then
			uv0:onClickClose()
		end
	end)
end

function GuildskillLevelSuccessPanel.onClickClose(slot0)
	uv0:openGuildskillLevelSuccessPanel(false)
end

function GuildskillLevelSuccessPanel.openRootWnd(slot0, slot1)
	playOtherSound("c_get")
	slot0:handleEffect(true)
	slot0:starTimeTicket()

	if not uv0:getPvpskillInfoByCareer(slot1) then
		return
	end

	slot0.left_lev:setString("Lv." .. slot2.skill_lev - 1)
	slot0.right_lev:setString("Lv." .. slot2.skill_lev)

	if Config.GuildSkillData.data_pvp_skill_info(getNorKey(slot1, slot2.skill_lev)) and Config.SkillData.data_get_skill(slot4.skill_id) then
		slot0.skill_item:setData(slot5)
		slot0.skill_item:showName(true, slot5.name, nil, 22, false, cc.c4b(255, 232, 183, 255), nil, cc.size(168, 31))
	end
end

function GuildskillLevelSuccessPanel.starTimeTicket(slot0)
	slot0.cut_time = 0

	if slot0.time_ticket == nil then
		slot0.time_ticket = GlobalTimeTicket:getInstance():add(function ()
			uv0.cut_time = uv0.cut_time + 0.5

			if uv0.cut_time > 0.5 then
				uv0.can_touch = true
			end

			if uv0.auto_limit_time <= uv0.cut_time then
				uv0:onClickClose()
			end
		end, 0.5)
	end
end

function GuildskillLevelSuccessPanel.clearTimeticket(slot0)
	if slot0.time_ticket then
		GlobalTimeTicket:getInstance():remove(slot0.time_ticket)

		slot0.time_ticket = nil
	end
end

function GuildskillLevelSuccessPanel.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	elseif not tolua.isnull(slot0.title_container) and slot0.play_effect == nil then
		slot0.play_effect = createEffectSpine(PathTool.getEffectRes(274), cc.p(slot0.title_width * 0.5, slot0.title_height * 0.5), cc.p(0.5, 0.5), false, PlayerAction.action_2)

		slot0.title_container:addChild(slot0.play_effect, 1)
	end
end

function GuildskillLevelSuccessPanel.close_callback(slot0)
	slot0:handleEffect(false)
	slot0:clearTimeticket()

	if slot0.skill_item then
		slot0.skill_item:DeleteMe()

		slot0.skill_item = nil
	end

	uv0:openGuildskillLevelSuccessPanel(false)
end
