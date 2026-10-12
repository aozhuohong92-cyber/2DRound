GuildwarAwardWindow = GuildwarAwardWindow or BaseClass(BaseView)
slot1 = GuildwarController:getInstance():getModel()
slot2 = string.format
slot3 = table.sort
slot4 = table.insert

function GuildwarAwardWindow.__init(slot0)
	slot0.win_type = WinType.Full
	slot0.is_full_screen = true
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("guildmarketplacereward", "guildmarketplacereward"),
			type = ResourcesType.plist
		}
	}
	slot0.layout_name = "guildwar/guildwar_award_list_panel"
end

function GuildwarAwardWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale() or 1)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.tips = slot0.main_panel:getChildByName("tips")
	slot0.gold_container = slot0.main_panel:getChildByName("gold_container")

	slot0.gold_container:getChildByName("gold_label"):setString(TI18N("固定掉落奖励"))
	slot0.gold_container:getChildByName("gold_content"):setString(TI18N("(取得胜利后，以下奖励必定会加入公会宝库)"))

	slot0.gold_container_1 = slot0.main_panel:getChildByName("gold_container_1")

	slot0.gold_container_1:getChildByName("gold_label_1"):setString(TI18N("随机掉落奖励"))
	slot0.gold_container_1:getChildByName("gold_content_1"):setString(TI18N("(取得胜利后，以下奖励可能会加入公会宝库)"))

	slot0.rank_container = slot0.main_panel:getChildByName("rank_container")

	slot0.rank_container:getChildByName("rank_label"):setString(TI18N("排名奖励"))

	slot0.win_title = slot0.main_panel:getChildByName("win_title")

	slot0.win_title:setString(TI18N("玩法奖励"))
end

function GuildwarAwardWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), true, 2)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickCloseBtn), true, 2)

	if slot0.tips then
		slot0.tips:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()

				if Config.GuildWarData.data_const.marketplace_rule then
					TipsManager:getInstance():showCommonTips(Config.GuildWarData.data_const.marketplace_rule.desc, slot0:getTouchBeganPosition())
				end
			end
		end)
	end
end

function GuildwarAwardWindow.openRootWnd(slot0)
	slot1 = uv0:getAvgPower()

	if not Config.GuildWarData.data_marketplace_reward then
		return
	end

	slot3 = nil

	for slot7, slot8 in ipairs(slot2) do
		if slot8.power_low <= slot1 and slot1 < slot8.power_high then
			slot3 = slot8

			break
		end
	end

	if slot3 == nil then
		slot3 = slot2[#slot2]
	end

	slot0:setReward_regular(slot3.reward)
	slot0:setReward_random(slot3.rand_reward)
	slot0:showRankInfo()
end

function GuildwarAwardWindow.setReward_regular(slot0, slot1)
	slot0.gold_scroll_size = slot0.gold_container:getContentSize()
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

	slot0.gold_scrollview = createScrollView(slot0.gold_scroll_size.width, slot0.gold_scroll_size.height, 0, 0, slot0.gold_container, ScrollViewDir.horizontal)
	slot0.scroll_list = commonShowSingleRowItemList(slot0.gold_scrollview, slot0.scroll_list, slot3, slot2)
end

function GuildwarAwardWindow.setReward_random(slot0, slot1)
	slot0.gold_scroll_size_1 = slot0.gold_container_1:getContentSize()
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

	slot0.gold_scrollview_1 = createScrollView(slot0.gold_scroll_size_1.width, slot0.gold_scroll_size_1.height, 0, 0, slot0.gold_container_1, ScrollViewDir.horizontal)
	slot0.scroll_list_1 = commonShowSingleRowItemList(slot0.gold_scrollview_1, slot0.scroll_list_1, slot3, slot2)
end

function GuildwarAwardWindow.showRankInfo(slot0)
	for slot5, slot6 in ipairs(slot0:getGuildWarAwardData()) do
		slot7 = 1

		if slot1[slot5 - 1] then
			slot7 = slot1[slot5 - 1].num + 1
		end

		slot6.min = slot7
		slot6.max = slot6.num
		slot6.reward = slot6.award
		slot6.index = slot5
	end

	slot0.rank_scrollview_size = slot0.rank_container:getContentSize()

	if not slot0.rank_scrollview then
		slot0.rank_scrollview = CommonScrollViewLayout.new(slot0.rank_container, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.rank_scrollview_size, {
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

		slot0.rank_scrollview:setData(slot1)
	end
end

function GuildwarAwardWindow.getGuildWarAwardData(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(Config.GuildWarData.data_award) do
		table.insert(slot1, DeepCopy(slot6))
	end

	table.sort(slot1, function (slot0, slot1)
		return slot0.num < slot1.num
	end)

	return slot1
end

function GuildwarAwardWindow.onClickCloseBtn(slot0)
	uv0:openGuildWarAwardWindow(false)
end

function GuildwarAwardWindow.close_callback(slot0)
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

	uv0:openGuildWarAwardWindow(false)
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
