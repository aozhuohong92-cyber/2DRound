GuildsecretareaRewardWindow = GuildsecretareaRewardWindow or BaseClass(BaseView)
slot1 = GuildsecretareaController:getInstance():getModel()
slot2 = string.format
slot3 = table.sort
slot4 = table.insert

function GuildsecretareaRewardWindow.__init(slot0)
	slot0.win_type = WinType.Full
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = true
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("guildmarketplacereward", "guildmarketplacereward"),
			type = ResourcesType.plist
		}
	}
	slot0.layout_name = "guildsecretarea/guildsecretarea_reward_window"
end

function GuildsecretareaRewardWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale() or 1)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.tips = slot0.main_panel:getChildByName("tips")
	slot0.gold_container = slot0.main_panel:getChildByName("gold_container")

	slot0.gold_container:getChildByName("gold_label"):setString(TI18N("领主固定掉落奖励"))
	slot0.gold_container:getChildByName("gold_content"):setString(TI18N("(以下奖励必定会加入公会宝库)"))

	slot0.gold_container_1 = slot0.main_panel:getChildByName("gold_container_1")

	slot0.gold_container_1:getChildByName("gold_label_1"):setString(TI18N("领主随机掉落奖励"))
	slot0.gold_container_1:getChildByName("gold_content_1"):setString(TI18N("(以下奖励可能会加入公会宝库)"))

	slot0.fight_container = slot0.main_panel:getChildByName("fight_container")

	slot0.fight_container:getChildByName("fight_label"):setString(TI18N("挑战奖励"))

	slot0.rank_container = slot0.main_panel:getChildByName("rank_container")

	slot0.rank_container:getChildByName("rank_label"):setString(TI18N("排名奖励"))

	slot0.win_title = slot0.main_panel:getChildByName("win_title")

	slot0.win_title:setString(TI18N("玩法奖励"))

	slot0.notice = slot0.main_panel:getChildByName("notice")

	slot0.notice:setVisible(true)
end

function GuildsecretareaRewardWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), true, 2)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickCloseBtn), true, 2)

	if slot0.tips then
		slot0.tips:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()

				if Config.GuildSecretAreaData.data_const then
					TipsManager:getInstance():showCommonTips(Config.GuildSecretAreaData.data_const.treasure_rule.desc, slot0:getTouchBeganPosition())
				end
			end
		end)
	end
end

function GuildsecretareaRewardWindow.openRootWnd(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.boss_id = slot1

	slot0:setReward_random(slot0.boss_id)
	slot0:setReward_regular(slot0.boss_id)
	slot0:setReward_Challenge(slot0.boss_id)
	slot0:showRankInfo(slot0.boss_id)
end

function GuildsecretareaRewardWindow.setReward_random(slot0, slot1)
	slot0.gold_scroll_size_1 = slot0.gold_container_1:getContentSize()
	slot3, slot4 = slot0:setRewardSetting(Config.GuildSecretAreaData.data_chapter_reward(slot1).marketplace_rand_reward)
	slot0.gold_scrollview_1 = createScrollView(slot0.gold_scroll_size_1.width, slot0.gold_scroll_size_1.height, 0, 0, slot0.gold_container_1, ScrollViewDir.horizontal)
	slot0.scroll_list_1 = commonShowSingleRowItemList(slot0.gold_scrollview_1, slot0.scroll_list_1, slot4, slot3)
end

function GuildsecretareaRewardWindow.setReward_regular(slot0, slot1)
	slot0.gold_scroll_size = slot0.gold_container:getContentSize()
	slot3, slot4 = slot0:setRewardSetting(Config.GuildSecretAreaData.data_chapter_reward(slot1).marketplace_reward)
	slot0.gold_scrollview = createScrollView(slot0.gold_scroll_size.width, slot0.gold_scroll_size.height, 0, 0, slot0.gold_container, ScrollViewDir.horizontal)
	slot0.scroll_list = commonShowSingleRowItemList(slot0.gold_scrollview, slot0.scroll_list, slot4, slot3)
end

function GuildsecretareaRewardWindow.setReward_Challenge(slot0, slot1)
	slot0.fight_scroll_size = slot0.fight_container:getContentSize()
	slot3, slot4 = slot0:setRewardSetting(Config.GuildSecretAreaData.data_chapter_reward(slot1).change_reward)
	slot0.fight_scrollview = createScrollView(slot0.fight_scroll_size.width, slot0.fight_scroll_size.height, 0, 0, slot0.fight_container, ScrollViewDir.horizontal)
	slot0.scroll_list_fight = commonShowSingleRowItemList(slot0.fight_scrollview, slot0.scroll_list_fight, slot4, slot3)
end

function GuildsecretareaRewardWindow.setRewardSetting(slot0, slot1)
	slot2 = {
		scale = 0.9,
		space_x = 15,
		is_center = false,
		max_count = 5
	}
	slot3 = {}

	if slot1 then
		for slot7, slot8 in pairs(slot1) do
			uv0(slot3, {
				slot8[1],
				slot8[2]
			})
		end
	end

	return slot2, slot3
end

function GuildsecretareaRewardWindow.showRankInfo(slot0, slot1)
	slot0.rank_scrollview_size = slot0.rank_container:getContentSize()

	if not slot0.rank_scrollview then
		slot9 = ScrollViewStartPos.top
		slot0.rank_scrollview = CommonScrollViewLayout.new(slot0.rank_container, cc.p(0, 0), ScrollViewDir.vertical, slot9, slot0.rank_scrollview_size, {
			start_y = 0,
			item_width = 600,
			start_x = 0,
			space_x = 0,
			row = 0,
			item_height = 110,
			space_y = 4,
			col = 1,
			scale = 1,
			item_class = GuildsecretareaRankRewardItem
		})
		slot4 = Config.GuildSecretAreaData.data_rank_reward[slot1]

		function slot8(slot0, slot1)
			return slot0.min < slot1.min
		end

		uv0(slot4, slot8)

		for slot8, slot9 in ipairs(slot4) do
			slot9.index = slot8
		end

		slot0.rank_scrollview:setData(slot4)
	end
end

function GuildsecretareaRewardWindow.onClickCloseBtn(slot0)
	uv0:openGuildsecretareaRewardWindow(false)
end

function GuildsecretareaRewardWindow.close_callback(slot0)
	if slot0.scroll_list then
		for slot4, slot5 in pairs(slot0.scroll_list) do
			slot5:DeleteMe()
		end

		slot0.scroll_list = nil
	end

	if slot0.scroll_list_1 then
		for slot4, slot5 in pairs(slot0.scroll_list_1) do
			slot5:DeleteMe()
		end

		slot0.scroll_list_1 = nil
	end

	if slot0.scroll_list_fight then
		for slot4, slot5 in pairs(slot0.scroll_list_fight) do
			slot5:DeleteMe()
		end

		slot0.scroll_list_fight = nil
	end

	uv0:openGuildsecretareaRewardWindow(false)
end

GuildsecretareaRankRewardItem = class("GuildsecretareaRankRewardItem", function ()
	return ccui.Layout:create()
end)

function GuildsecretareaRankRewardItem.ctor(slot0)
	slot0.item_list = {}
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("guildsecretarea/guildsecretarea_reward_rank_item"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.rank_img = slot0.root_wnd:getChildByName("rank_img")
	slot0.rank_label = slot0.root_wnd:getChildByName("rank_label")
	slot0.item_container = slot0.root_wnd:getChildByName("item_container")
	slot0.total_width = slot0.item_container:getContentSize().width

	slot0:registerEvent()
end

function GuildsecretareaRankRewardItem.registerEvent(slot0)
end

function GuildsecretareaRankRewardItem.setData(slot0, slot1)
	if slot1 ~= nil then
		if slot1.index ~= nil then
			if slot1.index <= 3 then
				slot0.rank_label:setVisible(false)

				if slot0.rank_res_id ~= PathTool.getResFrame("common", string.format("common_200%s", slot1.index)) then
					slot0.rank_res_id = slot2

					loadSpriteTexture(slot0.rank_img, slot2, LOADTEXT_TYPE_PLIST)
				end

				slot0.rank_img:setVisible(true)
			else
				slot0.rank_img:setVisible(false)
				slot0.rank_label:setVisible(true)
				slot0.rank_label:setString(string.format("%s~%s", slot1.min, slot1.max))

				if slot1.max == 999 then
					slot0.rank_label:setString(string.format("%s+", slot1.min))
				end
			end
		end

		slot0.item_container_size = slot0.item_container:getContentSize()
		slot2 = {
			scale = 0.7,
			space_x = 15,
			is_center = false,
			max_count = 2
		}
		slot3 = {}

		if slot1.reward then
			for slot7, slot8 in pairs(slot1.reward) do
				uv0(slot3, {
					slot8[1],
					slot8[2]
				})
			end
		end

		slot0.item_scrollview = createScrollView(slot0.item_container_size.width, slot0.item_container_size.height, 0, 0, slot0.item_container, ScrollViewDir.horizontal)
		slot0.scroll_list_item = commonShowSingleRowItemList(slot0.item_scrollview, slot0.scroll_list_item, slot3, slot2)
	end
end

function GuildsecretareaRankRewardItem.DeleteMe(slot0)
	if slot0.scroll_list_item then
		for slot4, slot5 in pairs(slot0.scroll_list_item) do
			slot5:DeleteMe()
		end

		slot0.scroll_list_item = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
