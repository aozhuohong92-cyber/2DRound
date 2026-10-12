GuildBossRewardShowView = GuildBossRewardShowView or BaseClass(BaseView)
slot0 = GuildbossController:getInstance()
slot1 = GuildbossController:getInstance():getModel()

function GuildBossRewardShowView.__init(slot0, ...)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.title_str = TI18N("奖励一览")
	slot0.layout_name = "guildboss/guildboss_reward_show_view"
	slot0.is_full_screen = false
	slot0.selected_tab = nil
	slot0.tab_list = {}
	slot0.panel_list = {}
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("guildboss", "guildboss"),
			type = ResourcesType.plist
		}
	}
end

function GuildBossRewardShowView.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.root_csb = slot0.root_wnd:getChildByName("main_container")
	slot0.main_panel = slot0.root_csb:getChildByName("main_panel")

	slot0:playEnterAnimatianByObj(slot0.main_panel, 1)

	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot1 = createScale9Sprite(PathTool.getResFrame("common", "common_1034"), slot0.main_panel:getContentSize().width / 2, 440)

	slot1:setContentSize(cc.size(608, 642))
	slot1:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.main_panel:addChild(slot1)

	slot2 = createScale9Sprite(PathTool.getResFrame("common", "common_1070"), 338, 730)

	slot2:setContentSize(cc.size(600, 57))
	slot0.main_panel:addChild(slot2)

	slot3 = createSprite(PathTool.getResFrame("common", "common_1069"), 225, 30, slot2, cc.p(0.5, 0.5))
	slot4 = createLabel(24, 175, nil, 100, 30, TI18N("通关章节"), slot2, nil, cc.p(0.5, 0.5))
	slot5 = createLabel(24, 175, nil, 410, 30, TI18N("对应结算奖励"), slot2, nil, cc.p(0.5, 0.5))
	slot0.desc_label = createRichLabel(22, 175, cc.p(0, 0.5), cc.p(35, 100), nil, , 1000)

	slot0.main_panel:addChild(slot0.desc_label)

	slot0.desc_label_2 = createRichLabel(22, 175, cc.p(0, 0.5), cc.p(35, 65), nil, , 1000)

	slot0.main_panel:addChild(slot0.desc_label_2)

	slot0.scroll_view_size = cc.size(600, 580)
	slot0.list_view = CommonScrollViewLayout.new(slot0.main_panel, cc.p(35, 125), ScrollViewDir.vertical, ScrollViewStartPos.bottom, slot0.scroll_view_size, {
		start_y = 0,
		start_x = 3,
		space_x = 5,
		row = 0,
		space_y = 0,
		col = 1,
		item_class = GuildBossRewardShowItem,
		item_width = GuildBossRewardShowItem.Width,
		item_height = GuildBossRewardShowItem.HEIGHT
	})
end

function GuildBossRewardShowView.register_event(slot0)
	if slot0.background then
		slot0.background:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playTabButtonSound()
				uv0:oepnGuildRewardShowView(false)
			end
		end)
	end

	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				playTabButtonSound()
				uv0:oepnGuildRewardShowView(false)
			end
		end)
	end
end

function GuildBossRewardShowView.updateData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.base_info = uv0:getBaseInfo()

	slot0.desc_label:setString(Config.GuildDunData.data_const.reward_desc01.desc)
	slot0.desc_label_2:setString(Config.GuildDunData.data_const.reward_desc02.desc)
	slot0.list_view:setData(slot1)
	slot0.list_view:addEndCallBack(function (...)
		if uv0:getCurRoomPos(uv0.base_info.fid) then
			uv0.list_view:updateMove(cc.p(uv0.list_view:getCurContainerPosX(), uv0:getX(slot0)), 0.1)
		end
	end)
end

function GuildBossRewardShowView.getCurRoomPos(slot0, slot1)
	if slot0.list_view and slot0.list_view:getItemList() then
		for slot6, slot7 in ipairs(slot2) do
			if slot7 and slot7.data._index == slot1 then
				return slot7:getItemPosition()
			end
		end
	end
end

function GuildBossRewardShowView.getX(slot0, slot1)
	if slot0.list_view and not tolua.isnull(slot0.list_view) then
		if GuildBossRewardShowItem.HEIGHT <= 3 * GuildBossRewardShowItem.HEIGHT - slot1.y then
			slot2 = 0
		elseif slot2 < slot0.scroll_view_size.height - slot0.list_view:getMaxSize().height then
			slot2 = slot0.scroll_view_size.height - slot0.list_view:getMaxSize().height
		end
	end

	return slot2
end

function GuildBossRewardShowView.openRootWnd(slot0)
	if Config.GuildDunData.data_chapter_reward then
		slot0:updateData(Config.GuildDunData.data_chapter_reward)
	end
end

function GuildBossRewardShowView.close_callback(slot0)
	if slot0.list_view then
		slot0.list_view:DeleteMe()

		slot0.list_view = nil
	end

	uv0:oepnGuildRewardShowView(false)
end

slot2 = table.insert
GuildBossRewardShowItem = class("GuildBossRewardShowItem", function ()
	return ccui.Widget:create()
end)
GuildBossRewardShowItem.HEIGHT = 123
GuildBossRewardShowItem.WIDTH = 599

function GuildBossRewardShowItem.ctor(slot0)
	slot0.item_list = {}
	slot0.size = cc.size(GuildBossRewardShowItem.WIDTH, GuildBossRewardShowItem.HEIGHT)

	slot0:setContentSize(slot0.size)
	slot0:setAnchorPoint(cc.p(0, 1))

	slot1 = createScale9Sprite(PathTool.getResFrame("common", "common_1029"), slot0.size.width / 2, slot0.size.height / 2)

	slot1:setContentSize(cc.size(GuildBossRewardShowItem.WIDTH, GuildBossRewardShowItem.HEIGHT))
	slot0:addChild(slot1)

	slot0.name = createRichLabel(26, 175, cc.p(0.5, 0.5), cc.p(100, 80), nil, , 1000)

	slot0:addChild(slot0.name)

	slot0.chapter_name = createRichLabel(20, 181, cc.p(0.5, 0.5), cc.p(100, 40), nil, , 1000)

	slot0:addChild(slot0.chapter_name)

	slot0.scroll_view_size = cc.size(350, 80)
	slot0.list_view = createScrollView(slot0.scroll_view_size.width, slot0.scroll_view_size.height, 225, 21, slot0, ccui.ScrollViewDir.horizontal)

	slot0.list_view:setSwallowTouches(false)

	slot0.tag = createSprite(PathTool.getResFrame("guildboss", "guildboss_1024"), 0, 30, slot0, cc.p(0, 0))

	slot0.tag:setVisible(false)
end

function GuildBossRewardShowItem.setData(slot0, slot1)
	if slot1 then
		slot0.data = slot1

		slot0.name:setString(slot1.chapter_name)
		slot0.chapter_name:setString(slot1.chapter_desc)

		slot2 = {}
		slot3 = 0.7

		slot0.tag:setVisible(false)

		if uv0:getBaseInfo().fid == slot1.id then
			slot0.tag:setVisible(true)
		end

		RenderMgr:getInstance():doNextFrame(function ()
			slot0 = BackPackItem.Width * uv0 * tableLen(uv1.award_list)
			slot4 = uv2.list_view
			slot6 = slot4
			slot7 = math.max(slot0, slot4.getContentSize(slot6).width)

			uv2.list_view:setInnerContainerSize(cc.size(slot7, uv2.list_view:getContentSize().height))

			slot2 = (uv2.list_view:getContentSize().width - slot0) / 2

			for slot6, slot7 in ipairs(uv1.award_list) do
				if not uv2.item_list[slot6] then
					slot8 = BackPackItem.new(true, true)

					slot8:setScale(uv0)
					slot8:setBaseData(slot7[1], slot7[2])
					slot8:setDefaultTip()

					slot9 = slot2 + BackPackItem.Width * uv0 * (slot6 - 1) + BackPackItem.Width * uv0 * 0.5

					if uv2.scroll_view_size.width < slot0 then
						slot9 = slot2 + BackPackItem.Width * uv0 * (slot6 - 1) + BackPackItem.Width * uv0
					end

					slot8:setPosition(slot9, uv2.list_view:getContentSize().height / 2)
					uv2.list_view:addChild(slot8)

					uv2.item_list[slot6] = slot8
				end
			end
		end)
	end
end

function GuildBossRewardShowItem.getItemPosition(slot0)
	if slot0 then
		return cc.p(slot0:getPosition())
	end
end

function GuildBossRewardShowItem.DeleteMe(slot0)
	if slot0.item_list then
		for slot4, slot5 in ipairs(slot0.item_list) do
			if slot5 then
				slot5:DeleteMe()
			end
		end
	end

	slot0.item_list = {}

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
