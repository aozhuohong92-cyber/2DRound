PartnerSummonPreviewView = PartnerSummonPreviewView or BaseClass(BaseView)

function PartnerSummonPreviewView.__init(slot0)
	slot0.ctrl = PartnersummonController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.win_type = WinType.Big
	slot0.item_list = {}
	slot0.partner_list = {}
	slot0.is_full_screen = false
	slot0.select_item = nil
	slot0.title_str = TI18N("召唤预览")
end

function PartnerSummonPreviewView.open_callback(slot0)
	slot0.size = cc.size(623, 780)
	slot0.scroll_view = createScrollView(slot0.size.width, slot0.size.height, 11, 11, slot0.container, ccui.ScrollViewDir.vertical)
end

function PartnerSummonPreviewView.initTabButton(slot0, slot1)
	slot0.group_id = slot1
	slot0.pre_patner_list, slot0.pre_type_list = slot0.model:getPreDataByGroupID(slot1)

	table.sort(slot0.pre_type_list, function (slot0, slot1)
		return slot1.rare_type < slot0.rare_type
	end)
	slot0:updateSingleItem(slot0.pre_type_list)
end

function PartnerSummonPreviewView.updateSingleItem(slot0, slot1)
	if slot1 then
		for slot6, slot7 in ipairs(slot0.pre_type_list) do
			if not slot0.item_list[slot6] then
				slot8 = slot0:createSingleItem(slot7)

				slot0.scroll_view:addChild(slot8)

				slot2 = 0 + slot8:getContentSize().height
				slot0.item_list[slot6] = slot8
			end
		end

		slot0.scroll_view:setInnerContainerSize(cc.size(slot0.scroll_view:getContentSize().width, math.max(slot0.scroll_view:getContentSize().height, slot2 + 5 * tableLen(slot0.pre_type_list))))

		if slot0.item_list then
			slot5 = 5

			for slot9, slot10 in ipairs(slot0.item_list) do
				if slot10 then
					slot10:setPosition(0, slot4 - slot5)

					slot5 = slot5 + slot10:getContentSize().height + slot3
				end
			end
		end
	end
end

function PartnerSummonPreviewView.createSingleItem(slot0, slot1)
	slot3 = ccui.Layout:create()

	slot3:setAnchorPoint(cc.p(0, 1))
	slot3:setContentSize(slot0.scroll_view:getContentSize().width, 0)

	slot5 = createImage(slot3, PathTool.getResFrame("common", "common_90024"), 0, 0, cc.p(0, 0), true, 0, true)

	slot5:setContentSize(cc.size(slot0.scroll_view:getContentSize().width, 44))

	slot6 = createImage(slot3, PathTool.getResFrame("common", "common_90025"), 3, 3, cc.p(0, 1), true, 0, true)

	slot6:setContentSize(cc.size(slot0.scroll_view:getContentSize().width - 7, 44))

	slot8 = createLabel(26, 175, nil, 20, slot6:getContentSize().height / 2, ({
		TI18N("A级英雄"),
		TI18N("S级英雄"),
		TI18N("SS级英雄")
	})[slot1.rare_type], slot6, nil, cc.p(0, 0.5))
	slot2 = 0 + slot6:getContentSize().height + slot0:updatePartnerList(slot0.pre_patner_list[slot1.rare_type], slot3)

	slot3:setContentSize(slot0.scroll_view:getContentSize().width, slot2)
	slot5:setContentSize(cc.size(slot0.scroll_view:getContentSize().width, slot2))
	slot6:setPosition(3, slot2 - 4)

	return slot3
end

function PartnerSummonPreviewView.updatePartnerList(slot0, slot1, slot2)
	if slot1 then
		slot3 = PartnerSummonPreviewItem.Height + 10
		slot4 = PartnerSummonPreviewItem.Width + 10
		slot5 = 1

		if math.ceil(tableLen(slot1) / 4) > 1 then
			slot5 = math.ceil(tableLen(slot1) / 4)
		end

		slot6 = slot3 * slot5 + 10 * tableLen(slot1) % 4

		for slot10, slot11 in ipairs(slot1) do
			if not slot0.partner_list[slot11.partner_data.bid] then
				slot12 = PartnerSummonPreviewItem.new()

				slot12:setAnchorPoint(cc.p(0, 1))
				slot12:setData(slot11)
				slot12:setPosition(3 + slot4 * ((slot10 - 1) % 4), slot6 - 8 - (slot3 - 5) * math.floor((slot10 - 1) / 4))

				if slot2 then
					slot2:addChild(slot12)
				end

				slot0.partner_list[slot11.partner_data.bid] = slot12
			end
		end

		return slot6
	end
end

function PartnerSummonPreviewView.register_event(slot0)
	if slot0.background then
		slot0.background:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				PartnersummonController:getInstance():openPartnerSummonPreView(false)
			end
		end)
	end

	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				PartnersummonController:getInstance():openPartnerSummonPreView(false)
			end
		end)
	end
end

function PartnerSummonPreviewView.openRootWnd(slot0, slot1)
	slot0:initTabButton(slot1)
end

function PartnerSummonPreviewView.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.partner_list) do
		slot5:DeleteMe()
	end

	slot0.partner_list = nil

	PartnersummonController:getInstance():openPartnerSummonPreView(false)
end

PartnerSummonPreviewItem = class("PartnerSummonPreviewItem", function ()
	return ccui.Layout:create()
end)
PartnerSummonPreviewItem.Height = 181
PartnerSummonPreviewItem.Width = 147

function PartnerSummonPreviewItem.ctor(slot0)
	slot0.size = cc.size(147, 181)
	slot0.star_list = {}

	slot0:setContentSize(slot0.size)

	slot0.item_bg = createScale9Sprite(PathTool.getResFrame("partnersummon", "partnersummon_item_bg"), slot0.size.width / 2, slot0.size.height / 2, LOADTEXT_PLIST, slot0)
	slot0.partnersummon_head_bg = createSprite(PathTool.getResFrame("partnersummon", "partnersummon_head_bg"), slot0.size.width / 2, slot0.size.height / 2 + 15, slot0)
	slot0.name_label = createRichLabel(24, 175, cc.p(0.5, 0.5), cc.p(70, 32))

	slot0:addChild(slot0.name_label)

	slot0.head_icon = createSprite(PathTool.getResFrame("common", "common_90033"), slot0.size.width / 2, slot0.size.height / 2 + 15, slot0)

	slot0.head_icon:setVisible(false)

	slot0.partnersummon_head = createSprite(PathTool.getResFrame("partnersummon", "partnersummon_head"), slot0.size.width / 2, slot0.size.height / 2 + 15, slot0)
	slot0.type_icon = createSprite(PathTool.getResFrame("common", "common_90033"), 28.5, 160.5, slot0)

	slot0.type_icon:setVisible(false)

	slot0.hero_career = createImage(slot0, PathTool.getResFrame("common", "common_90046"), 94, 52, cc.p(0, 0), true, 10, false)
	slot0.star_con = ccui.Layout:create()

	slot0.star_con:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.star_con:setPosition(cc.p(70, 62))
	slot0:addChild(slot0.star_con)
	slot0:registerEvent()
end

function PartnerSummonPreviewItem.registerEvent(slot0)
	slot0:setTouchEnabled(true)
	slot0:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0.touch_end = slot0:getTouchEndPosition()
			slot2 = true

			if uv0.touch_began ~= nil then
				slot2 = math.abs(uv0.touch_end.x - uv0.touch_began.x) <= 20 and math.abs(uv0.touch_end.y - uv0.touch_began.y) <= 20
			end

			if slot2 == true then
				playButtonSound2()

				if uv0.data then
					PokedexController:getInstance():openCheckHeroWindow(true, uv0.data)
				end
			end
		elseif slot1 == ccui.TouchEventType.moved then
			-- Nothing
		elseif slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()
		elseif slot1 == ccui.TouchEventType.canceled then
			-- Nothing
		end
	end)
end

function PartnerSummonPreviewItem.setData(slot0, slot1)
	if slot1 ~= nil then
		slot0.data = slot1.partner_data

		slot0.type_icon:setVisible(true)
		slot0.head_icon:setVisible(true)
		loadSpriteTexture(slot0.type_icon, PathTool.getResFrame("common", ({
			"common_90033",
			"common_90032",
			"common_90031"
		})[slot0.data.rare_type]), LOADTEXT_PLIST)
		loadSpriteTexture(slot0.head_icon, PathTool.getHeadIcon(slot0.data.bid), LOADTEXT_TYPE)
		slot0.hero_career:loadTexture(PathTool.getResFrame("common", "common_900" .. 45 + (slot0.data.type or 0)), LOADTEXT_TYPE_PLIST)
		slot0.name_label:setString(slot0.data.name)
		slot0:createStar(slot0.data.show_star)
	end
end

function PartnerSummonPreviewItem.createStar(slot0, slot1)
	slot0.star_con:setContentSize(cc.size(14 * (slot1 or 0), 15))

	for slot6 = 1, slot1 do
		if not slot0.star_list[slot6] then
			slot8 = createImage(slot0.star_con, PathTool.getResFrame("common", "common_90013"), 0, slot2.height / 2, cc.p(0, 0.5), true, 0, false)

			slot8:setScale(0.9)

			slot0.star_list[slot6] = slot8
		end

		slot0.star_list[slot6]:setVisible(true)
		slot0.star_list[slot6]:setPosition(cc.p((slot6 - 1) * 14 - 3, slot2.height / 2))
	end
end

function PartnerSummonPreviewItem.selected(slot0, slot1)
	if not slot0.selected_bg then
		slot0.selected_bg = createScale9Sprite(PathTool.getResFrame("common", "common_90019"), 0, 0, LOADTEXT_PLIST, slot0)

		slot0.selected_bg:setAnchorPoint(cc.p(0, 0))
		slot0.selected_bg:setContentSize(slot0.size)
	end

	if slot0.selected_bg then
		slot0.selected_bg:setVisible(slot1)
	end
end

function PartnerSummonPreviewItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
