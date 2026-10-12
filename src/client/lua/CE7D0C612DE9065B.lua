GuildwarAttkLookWindow = GuildwarAttkLookWindow or BaseClass(BaseView)
slot1 = GuildwarController:getInstance():getModel()

function GuildwarAttkLookWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.is_full_screen = false
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("guildwar", "guildwar"),
			type = ResourcesType.plist
		}
	}
	slot0.layout_name = "guildwar/guildwar_attk_look_window"
end

function GuildwarAttkLookWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 1)
	slot1:getChildByName("win_title"):setString(TI18N("进攻一览"))

	slot0.challenge_label = slot1:getChildByName("challenge_label")
	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.confirm_btn = slot1:getChildByName("confirm_btn")
	slot0.confirm_btn_label = slot0.confirm_btn:getChildByName("label")

	slot0.confirm_btn_label:setString(TI18N("确定"))

	slot0.list_panel = slot1:getChildByName("list_panel")
	slot3 = slot0.list_panel:getContentSize()
	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.list_panel, cc.p(0, 5), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot3.width, slot3.height - 8), {
		start_y = 0,
		item_width = 612,
		start_x = 1,
		space_x = 0,
		row = 0,
		item_height = 124,
		space_y = 0,
		col = 1,
		need_dynamic = true,
		item_class = GuildwarAttkLookItem
	})

	slot0.item_scrollview:setSwallowTouches(false)
	slot0:setData()
end

function GuildwarAttkLookWindow.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openAttkLookWindow(false)
		end
	end)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openAttkLookWindow(false)
		end
	end)
	slot0.confirm_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:openAttkLookWindow(false)
		end
	end)
end

function GuildwarAttkLookWindow.openRootWnd(slot0)
end

function GuildwarAttkLookWindow.setData(slot0)
	slot2 = Config.GuildWarData.data_const.challange_time_limit.val

	slot0.challenge_label:setString(string.format(TI18N("挑战次数：%d/%d"), slot2 - uv0:getGuildWarChallengeCount(), slot2))

	slot3 = uv0:getEnemyGuildWarPositionList()

	table.sort(slot3, function (slot0, slot1)
		if slot0.hp == slot1.hp then
			return slot0.pos < slot1.pos
		else
			return slot1.hp < slot0.hp
		end
	end)
	slot0.item_scrollview:setData(slot3)
end

function GuildwarAttkLookWindow.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	uv0:openAttkLookWindow(false)
end

GuildwarAttkLookItem = class("GuildwarAttkLookItem", function ()
	return ccui.Widget:create()
end)

function GuildwarAttkLookItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function GuildwarAttkLookItem.configUI(slot0)
	slot0.size = cc.size(616, 124)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("guildwar/guildwar_attk_look_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.build = slot0.container:getChildByName("build")
	slot0.name_label = slot0.container:getChildByName("name_label")
	slot0.attk_label = slot0.container:getChildByName("attk_label")
	slot0.tips_label = slot0.container:getChildByName("tips_label")

	slot0.tips_label:setString(TI18N("已达被挑战上限"))

	slot0.tips_label_2 = slot0.container:getChildByName("tips_label_2")

	slot0.tips_label_2:setString(TI18N("挑战废墟提升增益"))

	slot0.confirm_btn = slot0.container:getChildByName("confirm_btn")
	slot0.confirm_btn_label = slot0.confirm_btn:getChildByName("label")

	slot0.confirm_btn_label:setString(TI18N("挑战"))

	slot0.star_list = {}

	for slot6 = 1, 3 do
		if slot0.container:getChildByName(string.format("star_%d", slot6)) then
			slot7:setVisible(false)

			slot0.star_list[({
				3,
				2,
				1
			})[slot6]] = slot7
		end
	end
end

function GuildwarAttkLookItem.register_event(slot0)
	slot0.confirm_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0:getGuildWarStatus() == GuildwarConst.status.settlement then
				message(TI18N("本次公会战已结束啦，不能再挑战了哦"))
			elseif uv1.data then
				uv2:openAttkPositionWindow(true, uv1.data.pos)
			end
		end
	end)
end

function GuildwarAttkLookItem.setData(slot0, slot1)
	if slot0.data ~= nil and slot0.update_self_event ~= nil then
		slot0.data:UnBind(slot0.update_self_event)

		slot0.update_self_event = nil
	end

	if slot1 ~= nil then
		slot0.data = slot1

		if slot0.update_self_event == nil then
			slot0.update_self_event = slot0.data:Bind(GuildwarEvent.UpdateGuildWarPositionDataEvent, function ()
				uv0:refreshAttkLookItem()
			end)
		end

		slot0:refreshAttkLookItem()
	end
end

function GuildwarAttkLookItem.refreshAttkLookItem(slot0)
	if slot0.data.hp <= 0 then
		slot0.build:loadTexture(PathTool.getResFrame("guildwar", "guildwar_1020"), LOADTEXT_TYPE_PLIST)

		slot1 = 0

		if Config.GuildWarData.data_const.ruins_challange_limit then
			slot1 = slot2.val
		end

		if slot1 <= slot0.data.relic_def_count then
			slot0.tips_label:setVisible(true)
			slot0.confirm_btn:setVisible(false)
			slot0.tips_label_2:setVisible(false)
		else
			slot0.tips_label:setVisible(false)
			slot0.confirm_btn:setVisible(true)
			slot0.tips_label_2:setVisible(true)
		end

		if not slot0.build_fall_effect then
			slot0.build_fall_effect = createEffectSpine(PathTool.getEffectRes(326), cc.p(68, 65), cc.p(0.5, 0.5), true, PlayerAction.action)

			slot0.build_fall_effect:setScale(0.8)
			slot0.container:addChild(slot0.build_fall_effect)
		end

		slot0.build_fall_effect:setVisible(true)
	else
		slot0.build:loadTexture(PathTool.getResFrame("guildwar", "guildwar_1017"), LOADTEXT_TYPE_PLIST)
		slot0.tips_label:setVisible(false)
		slot0.confirm_btn:setVisible(true)
		slot0.tips_label_2:setVisible(false)

		if slot0.build_fall_effect then
			slot0.build_fall_effect:setVisible(false)
		end
	end

	for slot4 = 1, 3 do
		if slot0.data.hp < slot4 then
			slot0.star_list[slot4]:setVisible(true)
		else
			slot5:setVisible(false)
		end
	end

	slot0.name_label:setString(string.format(TI18N("所属玩家：%s"), slot0.data.name))
	slot0.attk_label:setString(string.format(TI18N("战力：%d"), slot0.data.power))
end

function GuildwarAttkLookItem.suspendAllActions(slot0)
	if slot0.data ~= nil then
		if slot0.update_self_event ~= nil then
			slot0.data:UnBind(slot0.update_self_event)

			slot0.update_self_event = nil
		end

		slot0.data = nil
	end
end

function GuildwarAttkLookItem.DeleteMe(slot0)
	if slot0.data ~= nil then
		if slot0.update_self_event ~= nil then
			slot0.data:UnBind(slot0.update_self_event)

			slot0.update_self_event = nil
		end

		slot0.data = nil
	end

	if slot0.build_fall_effect then
		slot0.build_fall_effect:clearTracks()
		slot0.build_fall_effect:removeFromParent()

		slot0.build_fall_effect = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
