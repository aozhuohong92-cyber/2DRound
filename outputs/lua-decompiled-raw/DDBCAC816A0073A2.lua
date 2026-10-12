GuildvoyageChoosePartnerWindow = GuildvoyageChoosePartnerWindow or BaseClass(BaseView)
slot1 = GuildvoyageController:getInstance():getModel()
slot2 = table.insert

function GuildvoyageChoosePartnerWindow.__init(slot0, slot1)
	slot0.order_type = slot1
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.is_init = false
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("guildvoyage", "guildvoyage"),
			type = ResourcesType.plist
		}
	}
	slot0.layout_name = "guildvoyage/guildvoyage_choose_partner_window"
end

function GuildvoyageChoosePartnerWindow.open_callback(slot0)
	slot0.root_wnd:getChildByName("background"):setScale(display.getMaxScale())

	slot2 = slot0.root_wnd:getChildByName("container")

	slot2:getChildByName("win_title"):setString(TI18N("选择英雄"))

	slot0.close_btn = slot2:getChildByName("close_btn")
	slot0.item = slot2:getChildByName("item")
	slot0.list_view = slot2:getChildByName("list_view")
	slot0.scroll_view = CommonScrollViewLayout.new(slot0.list_view, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.list_view:getContentSize(), {
		start_y = 2,
		item_width = 555,
		start_x = 4,
		space_x = 0,
		row = 0,
		item_height = 133,
		space_y = -3.5,
		col = 1,
		need_dynamic = true,
		item_class = GuildvoyageChoosePartnerItem
	}, cc.p(0, 0))
	slot0.empty_tips = slot2:getChildByName("empty_tips")

	slot0.empty_tips:getChildByName("desc"):setString(TI18N("抱歉，没有可派遣的伙伴哦~"))
end

function GuildvoyageChoosePartnerWindow.register_event(slot0)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0:openChoosePartnerWindow(false)
		end
	end)
end

function GuildvoyageChoosePartnerWindow.openRootWnd(slot0, slot1)
	if slot1 then
		if #slot1 == 0 then
			slot0.empty_tips:setVisible(true)
			slot0.scroll_view:setVisible(false)
		else
			slot0.empty_tips:setVisible(false)
			slot0.scroll_view:setData(slot1, nil, , slot0.item)
			slot0.scroll_view:setVisible(true)
		end
	end
end

function GuildvoyageChoosePartnerWindow.close_callback(slot0)
	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()

		slot0.scroll_view = nil
	end

	uv0:openChoosePartnerWindow(false)
end

GuildvoyageChoosePartnerItem = class("GuildvoyageChoosePartnerItem", function ()
	return ccui.Layout:create()
end)

function GuildvoyageChoosePartnerItem.ctor(slot0)
	slot0.item_list = {}
end

function GuildvoyageChoosePartnerItem.setExtendData(slot0, slot1)
	if not tolua.isnull(slot1) and slot0.root_wnd == nil then
		slot2 = slot1:getContentSize()

		slot0:setAnchorPoint(cc.p(0.5, 0.5))
		slot0:setContentSize(slot2)

		slot0.root_wnd = slot1:clone()

		slot0.root_wnd:setVisible(true)
		slot0.root_wnd:setAnchorPoint(0.5, 0.5)
		slot0.root_wnd:setPosition(slot2.width * 0.5, slot2.height * 0.5)
		slot0:addChild(slot0.root_wnd)

		slot0.bg_img = slot0.root_wnd:getChildByName("bg_img")
		slot0.career_img = slot0.root_wnd:getChildByName("career_img")
		slot0.career_name = slot0.root_wnd:getChildByName("career_name")
		slot0.partner_name = slot0.root_wnd:getChildByName("partner_name")
		slot0.partner_power = slot0.root_wnd:getChildByName("partner_power")
		slot0.handle_status = slot0.root_wnd:getChildByName("handle_status")
		slot0.handle_btn = slot0.root_wnd:getChildByName("handle_btn")
		slot0.handle_btn_label = slot0.handle_btn:getChildByName("label")

		slot0.handle_btn_label:setString(TI18N("选择"))

		slot0.recommend = slot0.root_wnd:getChildByName("recommend")
		slot0.item = HeroExhibitionItem.new(0.9, true)

		slot0.item:setPosition(20, 20)
		slot0.root_wnd:getChildByName("item_container"):addChild(slot0.item)
		slot0:setTouchEnabled(true)
		slot0:setSwallowTouches(false)
		slot0:registerEvent()
	end
end

function GuildvoyageChoosePartnerItem.registerEvent(slot0)
	slot0.handle_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data ~= nil then
				if uv0.data.voyage_in_form == nil then
					uv0.data.voyage_in_form = false
				end

				uv0.data.voyage_in_form = not uv0.data.voyage_in_form

				if uv0.data.voyage_in_form == false then
					uv0:changeInFormStatus()
				end

				GlobalEvent:getInstance():Fire(GuildvoyageEvent.AddToOrderPartnerListEvent, uv0.data)
			end
		end
	end)
end

function GuildvoyageChoosePartnerItem.setData(slot0, slot1)
	if slot1 ~= nil then
		slot0.data = slot1

		if slot0.career_res ~= PathTool.getCareerIcon(slot1.type) then
			slot0.career_res = slot2

			slot0.career_img:loadTexture(slot2, LOADTEXT_TYPE_PLIST)
		end

		slot0.partner_power:setString(slot1.power)
		slot0.recommend:setVisible(slot1.voyage_recommend == TRUE)
		slot0.career_name:setString("[" .. (PartnerConst.Hero_Type[slot1.type] or "") .. "]")
		slot0.partner_name:setString(slot1.name)
		slot0.partner_name:setPositionX(slot0.career_name:getPositionX() + slot0.career_name:getContentSize().width)
		slot0.item:setData(slot1)
		slot0:changeInFormStatus()
	end
end

function GuildvoyageChoosePartnerItem.changeInFormStatus(slot0)
	if slot0.data == nil then
		return
	end

	if slot0.data.voyage_in_form == true then
		slot0.bg_img:loadTexture(PathTool.getResFrame("common", "common_1020"), LOADTEXT_TYPE_PLIST)
		slot0.handle_btn:loadTexture(PathTool.getResFrame("common", "common_1017"), LOADTEXT_TYPE_PLIST)
		slot0.handle_btn_label:enableOutline(Config.ColorData.data_color4[157], 1)
		slot0.handle_btn_label:setString(TI18N("下阵"))
	else
		slot0.bg_img:loadTexture(PathTool.getResFrame("common", "common_1029"), LOADTEXT_TYPE_PLIST)
		slot0.handle_btn:loadTexture(PathTool.getResFrame("common", "common_1018"), LOADTEXT_TYPE_PLIST)
		slot0.handle_btn_label:enableOutline(Config.ColorData.data_color4[167], 1)
		slot0.handle_btn_label:setString(TI18N("选择"))
	end
end

function GuildvoyageChoosePartnerItem.DeleteMe(slot0)
	if slot0.item then
		slot0.item:DeleteMe()

		slot0.item = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
