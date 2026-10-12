GuildBossRankGuildPanel = class("GuildBossRankGuildPanel", function ()
	return ccui.Layout:create()
end)

function GuildBossRankGuildPanel.ctor(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("guildboss/guildboss_rank_guild_panel"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.title_1 = slot0.container:getChildByName("title_1")

	slot0.title_1:setString(TI18N("排名"))

	slot0.title_2 = slot0.container:getChildByName("title_2")

	slot0.title_2:setString(TI18N("公会名字"))

	slot0.title_3 = slot0.container:getChildByName("title_3")

	slot0.title_3:setString(TI18N("本周通关"))

	slot0.title_4 = slot0.container:getChildByName("title_4")

	slot0.title_4:setString(TI18N("今日总伤害"))

	slot0.my_guild_rank = slot0.root_wnd:getChildByName("my_guild_rank")
	slot0.my_guild_chapter = slot0.root_wnd:getChildByName("my_guild_chapter")
	slot0.my_guild_chapter_1 = slot0.root_wnd:getChildByName("my_guild_chapter_1")
	slot0.my_guild_dps = slot0.root_wnd:getChildByName("my_guild_dps")
	slot0.my_guild_dps_1 = slot0.root_wnd:getChildByName("my_guild_dps_1")
	slot0.top_container = slot0.root_wnd:getChildByName("top_container")
	slot0.notice = slot0.top_container:getChildByName("notice")

	slot0.notice:setString(TI18N("虚位以待！"))

	slot0.info_container = slot0.top_container:getChildByName("info_container")
	slot0.role_name = slot0.info_container:getChildByName("role_name")
	slot0.check_btn = slot0.info_container:getChildByName("check_btn")

	slot0.check_btn:getChildByName("label"):setString(TI18N("查看详情"))

	slot0.fight_label = CommonNum.new(20, slot0.info_container, 99999, -2, cc.p(0, 0.5))

	slot0.fight_label:setPosition(176, 48)

	slot0.role_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.role_head:setPosition(84, 65)
	slot0.info_container:addChild(slot0.role_head)

	slot0.empty_tips = slot0.root_wnd:getChildByName("empty_tips")

	slot0.empty_tips:getChildByName("desc"):setString(TI18N("暂无任何排名"))
	slot0:registerEvent()
end

function GuildBossRankGuildPanel.registerEvent(slot0)
	slot0.check_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playTabButtonSound()

			if uv0.no_1_rid and uv0.no_1_srv_id then
				FriendController:getInstance():openFriendCheckPanel(true, {
					srv_id = uv0.no_1_srv_id,
					rid = uv0.no_1_rid
				})
			end
		end
	end)

	if slot0.update_rank_event == nil then
		slot0.update_rank_event = GlobalEvent:getInstance():Bind(GuildbossEvent.UpdateGuildDunRank, function (slot0, slot1)
			if slot1 == GuildBossConst.rank.guild then
				uv0:updateRankData(slot0)
			end
		end)
	end
end

function GuildBossRankGuildPanel.addToParent(slot0, slot1)
	slot0:setVisible(slot1)

	if slot0.scroll_view == nil then
		GuildbossController:getInstance():requestGuildDunRank(GuildBossConst.rank.guild)
	end
end

function GuildBossRankGuildPanel.updateRankData(slot0, slot1)
	if slot1 == nil or slot1.rank_guild == nil or next(slot1.rank_guild) == nil then
		slot0.empty_tips:setVisible(true)

		if slot0.scroll_view then
			slot0.scroll_view:setVisible(false)
		end

		slot0.notice:setVisible(true)
		slot0.info_container:setVisible(false)
	else
		slot0.empty_tips:setVisible(false)

		if slot0.scroll_view == nil then
			slot0.scroll_view = CommonScrollViewLayout.new(slot0.container, nil, , , cc.size(slot0.container:getContentSize().width, 450), {
				start_y = -5,
				item_width = 600,
				start_x = 4,
				space_x = 4,
				row = 0,
				item_height = 123,
				space_y = 0,
				col = 1,
				item_class = GuildBossRankGuildItem
			})
		end

		slot0.scroll_view:setData(slot1.rank_guild)
		slot0.notice:setVisible(false)
		slot0.info_container:setVisible(true)
		slot0.role_name:setString(slot1.r_name)
		slot0.fight_label:setNum(slot1.power)
		slot0.role_head:setHeadRes(slot1.face_id, false, LOADTEXT_TYPE, slot1.face_file, slot1.face_update_time)
		slot0.role_head:setLev(slot1.lev)

		slot0.no_1_rid = slot1.r_rid
		slot0.no_1_srv_id = slot1.r_srvid

		if slot1.my_rank == 0 then
			slot0.my_guild_rank:setString(TI18N("我的公会排名：未上榜"))
		else
			slot0.my_guild_rank:setString(string.format(TI18N("我的公会排名：%s"), slot1.my_rank))
		end

		slot0.my_guild_chapter:setString(TI18N("本周已通关："))
		slot0.my_guild_chapter_1:setString(slot1.my_max_id)
		slot0.my_guild_dps:setString(TI18N("今日总伤害："))
		slot0.my_guild_dps_1:setString(slot1.my_dps)
	end
end

function GuildBossRankGuildPanel.DeleteMe(slot0)
	if slot0.update_rank_event then
		GlobalEvent:getInstance():UnBind(slot0.update_rank_event)

		slot0.update_rank_event = nil
	end

	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()

		slot0.scroll_view = nil
	end

	if slot0.fight_label then
		slot0.fight_label:DeleteMe()

		slot0.fight_label = nil
	end
end

GuildBossRankGuildItem = class("GuildBossRankGuildItem", function ()
	return ccui.Layout:create()
end)

function GuildBossRankGuildItem.ctor(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("guildboss/guildboss_rank_guild_item"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.rank_img = slot0.root_wnd:getChildByName("rank_img")
	slot0.guild_name = slot0.root_wnd:getChildByName("guild_name")
	slot0.guild_leader = slot0.root_wnd:getChildByName("guild_leader")
	slot0.chapter_value = slot0.root_wnd:getChildByName("chapter_value")
	slot0.day_dps = slot0.root_wnd:getChildByName("day_dps")
	slot0.rank_value = slot0.root_wnd:getChildByName("rank_value")
end

function GuildBossRankGuildItem.setData(slot0, slot1)
	if slot1 then
		if slot1.rank <= 3 then
			slot0.rank_value:setVisible(false)
			slot0.rank_img:setVisible(true)

			if slot0.res_id ~= PathTool.getResFrame("common", "common_300" .. slot1.rank) then
				slot0.res_id = slot2

				loadSpriteTexture(slot0.rank_img, slot2, LOADTEXT_TYPE_PLIST)
			end
		else
			slot0.rank_img:setVisible(false)
			slot0.rank_value:setVisible(true)
			slot0.rank_value:setString(slot1.rank)
		end

		slot0.guild_name:setString(slot1.name)
		slot0.guild_leader:setString(string.format(TI18N("会长：%s"), slot1.r_name))
		slot0.chapter_value:setString(string.format(TI18N("第%s章"), StringUtil.numToChinese(slot1.max_id)))
		slot0.day_dps:setString(string.format(TI18N("%s"), slot1.day_dps))
	end
end

function GuildBossRankGuildItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
