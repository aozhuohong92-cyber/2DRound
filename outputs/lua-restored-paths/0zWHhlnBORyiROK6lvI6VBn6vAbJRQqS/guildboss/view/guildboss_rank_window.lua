GuildBossRankWindow = GuildBossRankWindow or BaseClass(BaseView)
slot0 = GuildbossController:getInstance()
slot1 = GuildbossController:getInstance():getModel()
slot2 = string.format

function GuildBossRankWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.is_full_screen = false
	slot0.layout_name = "guildboss/guildboss_rank_window"
	slot0.selected_tab = nil
	slot0.tab_list = {}
	slot0.panel_list = {}
	slot0.res_list = {}
end

function GuildBossRankWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 1)

	slot2 = slot1:getChildByName("main_panel")

	slot2:getChildByName("win_title"):setString(TI18N("排行奖励"))
	slot2:getChildByName("award_title"):setString(TI18N("奖励"))
	slot2:getChildByName("rank_title"):setString(TI18N("排名"))
	slot2:getChildByName("win_title"):setString(TI18N("排行奖励"))
	slot2:getChildByName("rewards_notice"):setString(TI18N("奖励在结算完成后通过邮件发放"))
	slot2:getChildByName("close_notice"):setString(TI18N("点击黑色区域关闭窗口"))

	slot3 = slot2:getChildByName("scroll_view")
	slot0.scroll_view = CommonScrollViewLayout.new(slot3, nil, nil, nil, slot3:getContentSize(), {
		start_y = 0,
		item_width = 596,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 140,
		space_y = 4,
		col = 1,
		need_dynamic = true,
		item_class = GuildBossRankItem
	})
	slot0.item = slot2:getChildByName("item")
end

function GuildBossRankWindow.register_event(slot0)
	if slot0.background then
		slot0.background:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playTabButtonSound()
				uv0:openGuildBossRankWindow(false)
			end
		end)
	end

	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playTabButtonSound()
				uv0:openGuildBossRankWindow(false)
			end
		end)
	end
end

function GuildBossRankWindow.openRootWnd(slot0, slot1)
	if slot1 and slot1.config and Config.GuildDunData.data_rank_reward[slot1.config.boss_id] then
		slot3 = deepCopy(slot2)

		table.sort(slot3, function (slot0, slot1)
			return slot0.rank1 < slot1.rank1
		end)
		slot0.scroll_view:setData(slot3, nil, nil, slot0.item)
	end
end

function GuildBossRankWindow.close_callback(slot0)
	uv0:openGuildBossRankWindow(false)

	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()
	end

	slot0.scroll_view = nil

	for slot4, slot5 in pairs(slot0.panel_list) do
		slot5:DeleteMe()
	end

	slot0.panel_list = {}
end

GuildBossRankItem = class("GuildBossRankItem", function ()
	return ccui.Layout:create()
end)

function GuildBossRankItem.ctor(slot0)
	slot0.item_list = {}
end

function GuildBossRankItem.setExtendData(slot0, slot1)
	if not tolua.isnull(slot1) and slot0.root_wnd == nil then
		slot2 = slot1:getContentSize()

		slot0:setAnchorPoint(cc.p(0.5, 0.5))
		slot0:setContentSize(slot2)

		slot0.root_wnd = slot1:clone()

		slot0.root_wnd:setVisible(true)
		slot0.root_wnd:setAnchorPoint(0.5, 0.5)
		slot0.root_wnd:setPosition(slot2.width * 0.5, slot2.height * 0.5)
		slot0:addChild(slot0.root_wnd)

		slot0.rank_img = slot0.root_wnd:getChildByName("rank_img")

		slot0.rank_img:ignoreContentAdaptWithSize(true)

		slot0.rank_label = slot0.root_wnd:getChildByName("rank_label")

		UITool.SetLightColor(slot0.rank_label)

		slot0.item_container = slot0.root_wnd:getChildByName("item_container")
		slot0.total_width = slot0.item_container:getContentSize().width
	end
end

function GuildBossRankItem.setData(slot0, slot1)
	if slot1 ~= nil then
		if slot1.rank2 <= 3 then
			slot0.rank_label:setVisible(false)

			if slot1.rank2 == 0 then
				slot0.rank_img:setVisible(false)
			else
				if slot0.rank_res_id ~= PathTool.getResFrame("common", string.format("common_200%s", slot1.rank2)) then
					slot0.rank_res_id = slot2

					slot0.rank_img:loadTexture(slot2, LOADTEXT_TYPE_PLIST)
				end

				slot0.rank_img:setVisible(true)
			end
		else
			slot0.rank_img:setVisible(false)
			slot0.rank_label:setVisible(true)
			slot0.rank_label:setString(string.format("%s~%s", slot1.rank1, slot1.rank2))
		end

		for slot5, slot6 in pairs(slot0.item_list) do
			slot6:setVisible(false)
		end

		slot2 = nil
		slot3 = 1
		slot4 = nil
		slot5 = 0.8
		slot7 = 0

		for slot13 = #slot1.award, 1, -1 do
			if Config.ItemData.data_get_data(slot1.award[slot13][1]) then
				if slot0.item_list[slot3] == nil then
					slot4 = BackPackItem.new(false, true, false, slot5, false, true)

					slot4:setPosition(slot0.total_width - ((slot3 - 1) * (BackPackItem.Width * slot5 + 10) + BackPackItem.Width * 0.5 * slot5), 55)
					slot0.item_container:addChild(slot4)

					slot0.item_list[slot3] = slot4
				end

				slot4 = slot0.item_list[slot3]

				slot4:setBaseData(slot14[1], slot14[2])
				slot4:setVisible(true)

				slot3 = slot3 + 1
			end
		end
	end
end

function GuildBossRankItem.DeleteMe(slot0)
	for slot4, slot5 in ipairs(slot0.item_list) do
		slot5:DeleteMe()
	end

	slot0.item_list = nil

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
