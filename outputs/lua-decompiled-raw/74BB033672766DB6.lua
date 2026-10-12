PartnerCommentWindow = PartnerCommentWindow or BaseClass(BaseView)
slot0 = table.sort

function PartnerCommentWindow.__init(slot0, slot1)
	slot0.ctrl = PokedexController:getInstance()
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.title_str = TI18N("评论")
	slot0.hero_data = slot1 or {}
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("pokedex", "pokedex"),
			type = ResourcesType.plist
		}
	}
	slot0.win_type = WinType.Big
	slot0.default_msg = TI18N("请输入评论内容")
end

function PartnerCommentWindow.open_callback(slot0)
	slot2 = cc.CSLoader:createNode(PathTool.getTargetCSB("pokedex/pokedex_comment"))

	slot0.container:addChild(slot2)

	slot0.main_panel = slot2:getChildByName("main_panel")
	slot0.like_btn = slot0.main_panel:getChildByName("like_btn")
	slot0.send_btn = slot0.main_panel:getChildByName("send_btn")

	slot0.send_btn:setTitleText(TI18N("发送"))
	slot0.send_btn:getTitleRenderer():enableOutline(Config.ColorData.data_color4[264], 2)

	slot0.edit_box = createEditBox(slot0.main_panel, PathTool.getResFrame("common", "common_1021"), cc.size(470, 50), nil, 20, Config.ColorData.data_color3[151], 20, slot0.default_msg, nil, , LOADTEXT_TYPE_PLIST)

	slot0.edit_box:setAnchorPoint(cc.p(0, 0))
	slot0.edit_box:setPlaceholderFontColor(Config.ColorData.data_color4[63])
	slot0.edit_box:setFontColor(Config.ColorData.data_color4[66])
	slot0.edit_box:setPosition(18, 14)
	slot0.edit_box:setMaxLength(40)
	slot0:createHeroMessage()
end

function PartnerCommentWindow.register_event(slot0)
	if not slot0.get_list_event then
		slot0.get_list_event = GlobalEvent:getInstance():Bind(PokedexEvent.Comment_List_Event, function (slot0)
			uv0.data = slot0

			uv0:updateCommentList()
		end)
	end

	if not slot0.comment_success_event then
		slot0.comment_success_event = GlobalEvent:getInstance():Bind(PokedexEvent.Comment_Say_Event, function ()
			uv0.ctrl:sender11041(uv0.hero_data.bid, 1, 100)
			uv0.edit_box:setText("")
		end)
	end

	if not slot0.like_success_event then
		slot0.like_success_event = GlobalEvent:getInstance():Bind(PokedexEvent.Comment_Like_Event, function ()
			if not uv0.data then
				return
			end

			uv0.like_num:setString(string.format("<img src='%s' /> %s", PathTool.getResFrame("pokedex", "pokedex_23"), (uv0.data.like_num or 0) + 1))
			uv0.like_btn:setVisible(false)
		end)
	end

	if not slot0.zan_success_event then
		slot0.zan_success_event = GlobalEvent:getInstance():Bind(PokedexEvent.Comment_Zan_Event, function (slot0)
			if uv0.select_item then
				uv0.select_item:updateCommentNum(slot0)
			end

			uv0.select_item = nil
		end)
	end

	slot0.like_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data and uv0.data.like and uv0.data.like == 1 then
				message(TI18N("你已设置为喜欢"))

				return
			end

			if not uv0.hero_data then
				return
			end

			uv0.ctrl:sender11042(uv0.hero_data.bid)
		end
	end)
	slot0.send_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if isQingmingShield and isQingmingShield() then
				return
			end

			if not uv0.hero_data then
				return
			end

			if string.len(uv0.edit_box:getText() or "") <= 0 then
				message(TI18N("请输入评论内容"))

				return
			end

			uv0.ctrl:sender11043(uv0.hero_data.bid, slot2)
		end
	end)
end

function PartnerCommentWindow.createHeroMessage(slot0)
	slot0.hero_item = HeroExhibitionItem.new()

	slot0.hero_item:setPosition(cc.p(85, 740))
	slot0.main_panel:addChild(slot0.hero_item)
	slot0.hero_item:setData(slot0.hero_data)

	slot0.hero_name = createLabel(26, cc.c3b(255, 255, 255), nil, 160, 755, "", slot0.main_panel, 0, cc.p(0, 0))

	slot0.hero_name:enableOutline(cc.c4b(0, 0, 0, 255), 2)
	slot0.hero_name:setString(slot0.hero_data.name)

	slot0.like_num = createRichLabel(26, cc.c4b(68, 187, 116, 255), cc.p(0, 0), cc.p(160, 700), 0, 0, 500)

	slot0.main_panel:addChild(slot0.like_num)

	slot0.comment_num = createLabel(24, cc.c3b(71, 44, 30), nil, 470, 670, "", slot0.main_panel, 0, cc.p(0, 0))
end

function PartnerCommentWindow.openRootWnd(slot0)
	if not slot0.hero_data then
		return
	end

	slot0.ctrl:sender11041(slot0.hero_data.bid, 1, 100)
end

function PartnerCommentWindow.updateCommentList(slot0)
	if not slot0.data then
		return
	end

	slot0.like_num:setString(string.format("<img src='%s' /> %s", PathTool.getResFrame("pokedex", "pokedex_23"), slot0.data.like_num or 0))

	if slot0.data.partner_comments then
		slot0.comment_num:setString(TI18N("评论数：") .. (#slot0.data.partner_comments or 0))
	end

	slot4 = true

	if slot0.data.like and slot0.data.like == 1 then
		slot4 = false
	end

	slot0.like_btn:setVisible(slot4)

	if not slot0.list_view then
		slot0.list_view = CommonScrollViewLayout.new(slot0.main_panel, cc.p(13, 95), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(620, 560), {
			start_y = 0,
			item_width = 610,
			start_x = 4,
			space_x = 0,
			row = 1,
			item_height = 150,
			space_y = 5,
			col = 1,
			need_dynamic = true,
			item_class = PokedexCommentItem
		})
	end

	slot0.list_view:setData(slot0.data.partner_comments or {}, function (slot0, slot1, slot2)
		if slot1 and next(slot1) ~= nil then
			uv0.select_item = slot0

			uv0.ctrl:sender11044(uv0.hero_data.bid or 0, slot1.comment_id or 0, slot2 or 1)
		end
	end)
end

function PartnerCommentWindow.setPanelData(slot0)
end

function PartnerCommentWindow.close_callback(slot0)
	slot0.ctrl:openCommentWindow(false)

	if slot0.hero_item then
		slot0.hero_item:DeleteMe()
	end

	slot0.hero_item = nil

	if slot0.list_view then
		slot0.list_view:DeleteMe()

		slot0.list_view = nil
	end

	if slot0.get_list_event then
		GlobalEvent:getInstance():UnBind(slot0.get_list_event)

		slot0.get_list_event = nil
	end

	if slot0.like_success_event then
		GlobalEvent:getInstance():UnBind(slot0.like_success_event)

		slot0.like_success_event = nil
	end

	if slot0.comment_success_event then
		GlobalEvent:getInstance():UnBind(slot0.comment_success_event)

		slot0.comment_success_event = nil
	end

	if slot0.zan_success_event then
		GlobalEvent:getInstance():UnBind(slot0.zan_success_event)

		slot0.zan_success_event = nil
	end
end

PokedexCommentItem = class("PokedexCommentItem", function ()
	return ccui.Widget:create()
end)

function PokedexCommentItem.ctor(slot0, slot1)
	slot0.open_type = slot1 or 1

	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function PokedexCommentItem.config(slot0)
	slot0.ctrl = StartowerController:getInstance()
	slot0.size = cc.size(610, 150)

	slot0:setContentSize(slot0.size)

	slot0.attr_list = {}
	slot0.star_list = {}
end

function PokedexCommentItem.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("pokedex/pokedex_comment_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.bg = slot0.main_panel:getChildByName("bg")
	slot0.hot_bg = slot0.main_panel:getChildByName("hot_bg")

	slot0.hot_bg:setVisible(false)

	slot0.btn1 = slot0.main_panel:getChildByName("btn1")
	slot0.btn1.title = slot0.btn1:getChildByName("title")

	slot0.btn1:setCascadeOpacityEnabled(true)

	slot0.btn1_select = slot0.btn1:getChildByName("bg_select")
	slot0.btn1_unselect = slot0.btn1:getChildByName("bg_unselect")

	slot0.btn1_select:setVisible(false)
	slot0.btn1_unselect:setVisible(true)

	slot0.btn2 = slot0.main_panel:getChildByName("btn2")
	slot0.btn2.title = slot0.btn2:getChildByName("title")

	slot0.btn2:setCascadeOpacityEnabled(true)

	slot0.btn2_select = slot0.btn2:getChildByName("bg_select")
	slot0.btn2_unselect = slot0.btn2:getChildByName("bg_unselect")

	slot0.btn2_select:setVisible(false)
	slot0.btn2_unselect:setVisible(true)

	slot0.goods_name = createLabel(26, cc.c3b(110, 80, 10), nil, 50, 120, "", slot0.main_panel, 0, cc.p(0, 0.5))
	slot0.comment_label = createRichLabel(24, cc.c4b(105, 55, 5, 255), cc.p(0, 1), cc.p(50, 90), 0, 0, 520)

	slot0.main_panel:addChild(slot0.comment_label)
end

function PokedexCommentItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0.goods_name:setString(slot1.name or "")
	slot0.btn1.title:setString(slot1.no_like_num)
	slot0.btn2.title:setString(slot1.like_num)
	slot0.comment_label:setString(slot1.msg or "")

	if slot1._index and slot1._index <= 3 then
		slot0.hot_bg:setVisible(true)
	end

	if slot1.is_like then
		if slot1.is_like == 0 then
			slot0.btn1_unselect:setVisible(false)
			slot0.btn1_select:setVisible(true)
			slot0.btn2_unselect:setVisible(true)
			slot0.btn2_select:setVisible(false)
		elseif slot1.is_like == 1 then
			slot0.btn2_unselect:setVisible(false)
			slot0.btn2_select:setVisible(true)
			slot0.btn1_unselect:setVisible(true)
			slot0.btn1_select:setVisible(false)
		else
			slot0.btn1_select:setVisible(false)
			slot0.btn1_unselect:setVisible(true)
			slot0.btn2_select:setVisible(false)
			slot0.btn2_unselect:setVisible(true)
		end
	end
end

function PokedexCommentItem.registerEvents(slot0)
	slot0.btn1:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.call_fun then
				uv0:call_fun(uv0.data, 0)
			end
		end
	end)
	slot0.btn2:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.call_fun then
				uv0:call_fun(uv0.data, 1)
			end
		end
	end)
end

function PokedexCommentItem.updateCommentNum(slot0, slot1)
	if not slot1 then
		return
	end

	if not slot0.data then
		return
	end

	if (slot1.type or 0) == 0 then
		slot0.data.is_like = 0

		slot0.btn1.title:setString(slot0.data.no_like_num + 1)
		slot0.btn1_unselect:setVisible(false)
		slot0.btn1_select:setVisible(true)
		slot0.btn2_unselect:setVisible(true)
		slot0.btn2_select:setVisible(false)
	else
		slot0.data.is_like = 1

		slot0.btn2.title:setString(slot0.data.like_num + 1)
		slot0.btn2_unselect:setVisible(false)
		slot0.btn2_select:setVisible(true)
		slot0.btn1_unselect:setVisible(true)
		slot0.btn1_select:setVisible(false)
	end
end

function PokedexCommentItem.clickHandler(slot0)
	if slot0.call_fun then
		slot0:call_fun(slot0.data)
	end
end

function PokedexCommentItem.addCallBack(slot0, slot1)
	slot0.call_fun = slot1
end

function PokedexCommentItem.DeleteMe(slot0)
	slot0.data = nil

	slot0:removeFromParent()
end
