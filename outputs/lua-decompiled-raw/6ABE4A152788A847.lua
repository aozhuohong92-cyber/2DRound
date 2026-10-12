GuildRewardWindow = GuildRewardWindow or BaseClass(BaseView)
slot0 = GuildController:getInstance()
slot1 = string.format

function GuildRewardWindow.__init(slot0, ...)
	slot0.is_full_screen = false
	slot0.layout_name = "guild/guild_reward_window"
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.item_scrollview = nil
end

function GuildRewardWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot1 = slot0.main_container:getChildByName("main_panel")
	slot0.win_title = slot1:getChildByName("win_title")

	slot0.win_title:setString(TI18N("奖励一览"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot2 = slot1:getChildByName("container")
	slot0.scroll_size = slot2:getContentSize()
	slot0.item_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 5), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.scroll_size, {
		start_y = 0,
		item_width = 599,
		start_x = 4,
		space_x = 0,
		row = 0,
		item_height = 159,
		space_y = 0,
		col = 1,
		need_dynamic = true,
		item_class = GuildRewardItem
	})

	slot0.item_scrollview:setSwallowTouches(false)
end

function GuildRewardWindow.register_event(slot0, ...)
	if slot0.background then
		slot0.background:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				uv0:openGuildRewardWindow(false)
			end
		end)
	end

	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				uv0:openGuildRewardWindow(false)
			end
		end)
	end
end

function GuildRewardWindow.openRootWnd(slot0)
	slot0.item_scrollview:setData(Config.GuildQuestData.data_lev_data)
end

function GuildRewardWindow.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	uv0:openGuildRewardWindow(false)
end

GuildRewardItem = class("GuildRewardItem", function ()
	return ccui.Widget:create()
end)

function GuildRewardItem.ctor(slot0)
	slot0.item_list = {}

	slot0:configUI()
end

function GuildRewardItem.configUI(slot0)
	slot0.size = cc.size(599, 159)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot2 = cc.CSLoader:createNode(PathTool.getTargetCSB("guild/guild_reward_item"))

	slot0:addChild(slot2)

	slot3 = slot2:getChildByName("container")
	slot0.goods = slot3:getChildByName("goods")

	slot0.goods:setScrollBarEnabled(false)

	slot0.desc_label = createRichLabel(26, cc.c4b(104, 69, 42, 255), cc.p(0, 0.5), cc.p(22, 130), nil, , 1000)

	slot3:addChild(slot0.desc_label)
end

function GuildRewardItem.setData(slot0, slot1)
	slot0.desc_label:setString(uv0(TI18N("活跃到达 <div fontcolor=#249003>%d</div> 级领取"), slot1.lev))

	slot3 = BackPackItem.Width * #slot1.items * 0.8 + #slot1.items * 10

	slot0.goods:setInnerContainerSize(cc.size(math.max(slot0.goods:getContentSize().width, slot3), slot0.goods:getContentSize().height))

	if slot0.goods:getContentSize().width <= slot3 then
		slot0.goods:setTouchEnabled(true)
	else
		slot0.goods:setTouchEnabled(false)
	end

	for slot8, slot9 in pairs(slot0.item_list) do
		slot9:setVisible(false)
	end

	for slot8 = 1, #slot1.items do
		if not slot0.item_list[slot8] then
			slot9 = BackPackItem.new(true, true, nil, 0.8)

			slot9:setAnchorPoint(0, 0.5)
			slot9:setSwallowTouches(false)
			slot0.goods:addChild(slot9)

			slot0.item_list[slot8] = slot9
		end

		item = slot0.item_list[slot8]

		if item then
			item:setVisible(true)
			item:setPosition((slot8 - 1) * (BackPackItem.Width * 0.8 + 10), 45)
			item:setBaseData(slot1.items[slot8][1], slot1.items[slot8][2])
			item:setDefaultTip()
		end
	end
end

function GuildRewardItem.DeleteMe(slot0)
	if slot0.item_list and next(slot0.item_list or {}) ~= nil then
		for slot4, slot5 in ipairs(slot0.item_list) do
			if slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end
	end

	slot0:removeAllChildren()
end
