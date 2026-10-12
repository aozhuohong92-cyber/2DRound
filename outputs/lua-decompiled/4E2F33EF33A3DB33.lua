CommonOptionsList = class("CommonOptionsList", function ()
	return ccui.Widget:create()
end)
CommonOptionsList.TypeName = {
	{
		func = "check_role",
		name = TI18N("查看信息")
	},
	{
		func = "summon_member",
		name = TI18N("召唤队友")
	},
	{
		func = "expel_member",
		name = TI18N("请离队友")
	},
	{
		func = "promote_leader",
		name = TI18N("升为队长")
	},
	{
		func = "replace_leader",
		name = TI18N("顶替队长")
	},
	{
		func = "afk_team",
		name = TI18N("暂离队伍")
	},
	{
		func = "return_team",
		name = TI18N("回到队伍")
	},
	{
		func = "dissolve_team",
		name = TI18N("解散队伍")
	},
	{
		func = "exit_team",
		name = TI18N("退出队伍")
	},
	{
		func = "order_member",
		name = TI18N("督促准备")
	},
	[12] = {
		func = "set_leader",
		name = TI18N("任命盟主")
	},
	[13] = {
		func = "set_assistant",
		name = TI18N("任命副盟主")
	},
	[14] = {
		func = "set_member",
		name = TI18N("设置成员")
	},
	[15] = {
		func = "add_friend",
		name = TI18N("加为好友")
	},
	[16] = {
		func = "kick_guild",
		name = TI18N("踢出联盟")
	},
	[17] = {
		func = "impeach_leader",
		name = TI18N("弹劾盟主")
	},
	[18] = {
		func = "talk_with",
		name = TI18N("发起私聊")
	},
	[19] = {
		func = "exit_guild",
		name = TI18N("退出联盟")
	}
}

function CommonOptionsList.ctor(slot0, slot1, slot2, slot3)
	slot0:initConfig()
	slot0:setContentSize(cc.size(slot0.width, 50))

	if slot1 ~= nil then
		slot1:addChild(slot0)
	end

	slot0:setAnchorPoint(slot2 or cc.p(0.5, 0.5))

	if slot3 ~= nil then
		slot0:setPosition(slot3)
	end

	slot0:registerEvent()
end

function CommonOptionsList.initConfig(slot0)
	slot0.width = 186
	slot0.btn_width = 161
	slot0.btn_height = 59
end

function CommonOptionsList.registerEvent(slot0)
end

function CommonOptionsList.setDataList(slot0, slot1, slot2)
	if slot1 == nil or slot2 == nil or next(slot1) == nil then
		return
	end

	slot0.height = #slot1 * slot0.btn_height + 18

	slot0:setContentSize(cc.size(slot0.width, slot0.height))

	if slot0.container == nil then
		slot0.container = createImage(slot0, PathTool.getResFrame("common", "common_90005"), 0, 0, cc.p(0, 0), true)
	end

	slot0.container:setScale9Enabled(true)

	slot7 = cc.size

	slot0.container:setContentSize(slot7(slot0.width, slot0.height))

	slot6 = slot0.container
	slot8 = slot6

	for slot7, slot8 in pairs(slot6.getChildren(slot8)) do
		if slot8.DeleteMe then
			slot8:DeleteMe()

			slot8 = nil
		end
	end

	slot5 = nil
	slot6 = 1

	for slot10, slot11 in ipairs(slot1) do
		if CommonOptionsList.TypeName[slot11] ~= nil then
			slot12 = CommonOptionsListBtn.new(slot0.container, slot5.func, slot5.name, slot2, slot0.btn_width, slot0.btn_height, function ()
				if uv0 ~= nil then
					uv0:setVisible(false)
				end
			end)

			slot12:setPosition(cc.p(slot0.width / 2, slot0.height - 10 - slot12:getSize().height / 2 - (slot6 - 1) * slot0.btn_height))

			slot6 = slot6 + 1
		end
	end
end

function CommonOptionsList.DeleteMe(slot0)
	slot3 = slot0.container
	slot5 = slot3

	for slot4, slot5 in pairs(slot3.getChildren(slot5)) do
		if slot5.DeleteMe then
			slot5:DeleteMe()

			slot5 = nil
		end
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end

CommonOptionsListBtn = class("CommonOptionsListBtn", function ()
	return ccui.Widget:create()
end)

function CommonOptionsListBtn.ctor(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	slot0.func_name = slot2
	slot0.target = slot4
	slot0.call_back = slot7
	slot0.size = cc.size(slot5, slot6)

	slot0:setContentSize(slot0.size)
	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setTouchEnabled(true)
	slot0:setCascadeOpacityEnabled(true)

	if not tolua.isnull(slot1) then
		slot1:addChild(slot0)
	end

	slot0.button = createButton(slot0, slot3, slot5 * 0.5, slot6 * 0.5, slot0.size, PathTool.getResFrame("common", "common_1027"), 25, Config.ColorData.data_color4[1])

	slot0:registerEvent()
end

function CommonOptionsListBtn.registerEvent(slot0)
	slot0.button:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			uv0[uv0.func_name](uv0)

			if uv0.call_back ~= nil then
				uv0:call_back()
			end
		end
	end)
end

function CommonOptionsListBtn.getSize(slot0)
	return slot0.size
end

function CommonOptionsListBtn.summon_all_member(slot0)
	TeamController:getInstance():getModel():summonMember()
end

function CommonOptionsListBtn.check_role(slot0)
end

function CommonOptionsListBtn.summon_member(slot0)
	if slot0.target ~= nil then
		TeamController:getInstance():send_13214(slot0.target.rid, slot0.target.srv_id)
	end
end

function CommonOptionsListBtn.expel_member(slot0)
	if slot0.target ~= nil then
		TeamController:getInstance():send_13211(slot0.target.rid, slot0.target.srv_id)
	end
end

function CommonOptionsListBtn.promote_leader(slot0)
	if slot0.target ~= nil then
		TeamController:getInstance():send_13209(slot0.target.rid, slot0.target.srv_id)
	end
end

function CommonOptionsListBtn.replace_leader(slot0)
	TeamController:getInstance():send_13256()
end

function CommonOptionsListBtn.afk_team(slot0)
	TeamController:getInstance():send_13213()
end

function CommonOptionsListBtn.return_team(slot0)
	TeamController:getInstance():send_13217()
end

function CommonOptionsListBtn.dissolve_team(slot0)
	TeamController:getInstance():send_13226()
end

function CommonOptionsListBtn.exit_team(slot0)
	TeamController:getInstance():send_13210()
end

function CommonOptionsListBtn.order_member(slot0)
	TeamController:getInstance():send_13294(slot0.target.srv_id, slot0.target.rid)
end

function CommonOptionsListBtn.set_leader(slot0)
	if slot0.target ~= nil then
		if Config.GuildData.data_position[1] == nil then
			return
		end

		CommonAlert.show(string.format(TI18N("确定任免 %s 为 %s 吗?现在反悔还来得及!"), slot0.target.name, slot1.name), TI18N("确定"), function ()
			GuildController:getInstance():changeMemberPosition(uv0.target.rid, uv0.target.srv_id, 1)
		end, TI18N("取消"))
	end
end

function CommonOptionsListBtn.set_assistant(slot0)
	if slot0.target ~= nil then
		if Config.GuildData.data_position[2] == nil then
			return
		end

		CommonAlert.show(string.format(TI18N("确定任免 %s 为 %s 吗?"), slot0.target.name, slot1.name), TI18N("确定"), function ()
			GuildController:getInstance():changeMemberPosition(uv0.target.rid, uv0.target.srv_id, 2)
		end, TI18N("取消"))
	end
end

function CommonOptionsListBtn.set_member(slot0)
	if slot0.target ~= nil then
		if Config.GuildData.data_position[3] == nil then
			return
		end

		CommonAlert.show(string.format(TI18N("确定将 %s 降职为 %s 吗?"), slot0.target.name, slot1.name), TI18N("确定"), function ()
			GuildController:getInstance():changeMemberPosition(uv0.target.rid, uv0.target.srv_id, 3)
		end, TI18N("取消"))
	end
end

function CommonOptionsListBtn.add_friend(slot0)
	if slot0.target ~= nil then
		GlobalEvent:getInstance():Fire(FriendEvent.FRIEND_ADD, slot0.target.srv_id, slot0.target.rid)
	end
end

function CommonOptionsListBtn.kick_guild(slot0)
	if slot0.target ~= nil then
		CommonAlert.show(string.format(TI18N("确定将 %s 踢出联盟吗? 真是狠心的盟主啊!"), slot0.target.name), TI18N("确定"), function ()
			GuildController:getInstance():requestKickOutMember(uv0.target.rid, uv0.target.srv_id)
		end, TI18N("取消"))
	end
end

function CommonOptionsListBtn.impeach_leader(slot0)
end

function CommonOptionsListBtn.talk_with(slot0)
	if slot0.target ~= nil then
		slot3 = FriendConst.FriendGroupType.friend

		if not RoleController:getInstance():isTheSameSvr(slot0.target.srv_id) == true then
			slot3 = FriendConst.FriendGroupType.cross_friend
		end

		ContactController:getInstance():openContactPanel(ContactConst.ContactTypeConst.friend, {
			rid = slot0.target.rid,
			srv_id = slot0.target.srv_id
		}, slot3)
	end
end

function CommonOptionsListBtn.exit_guild(slot0)
	if slot0.target ~= nil then
		CommonAlert.show(string.format(TI18N("确定要退出联盟吗?给你机会考虑清楚"), slot0.target.name), TI18N("确定"), function ()
			GuildController:getInstance():requestExitGuild()
		end, TI18N("取消"))
	end
end

function CommonOptionsListBtn.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
