AdventureFloorResultWindow = AdventureFloorResultWindow or BaseClass(BaseView)
slot0 = AdventureController:getInstance()
slot1 = AdventureController:getInstance():getUiModel()

function AdventureFloorResultWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Tips
	slot0.layout_name = "adventure/adventure_floor_result_window"
	slot0.is_csb_action = true
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("levupgrade", "levupgrade"),
			type = ResourcesType.plist
		}
	}
end

function AdventureFloorResultWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.title_container = slot0.main_container:getChildByName("title_container")
	slot0.title_width = slot0.title_container:getContentSize().width
	slot0.title_height = slot0.title_container:getContentSize().height
	slot0.list_view = slot0.root_wnd:getChildByName("list_view")
	slot0.scroll_view = CommonScrollViewLayout.new(slot0.list_view, nil, , , slot0.list_view:getContentSize(), {
		start_y = 8,
		item_width = 720,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 43,
		space_y = 12,
		col = 1,
		need_dynamic = true,
		item_class = AdventureFloorResultItem
	})
	slot0.item = slot0.root_wnd:getChildByName("item")
end

function AdventureFloorResultWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openAdventureFloorResultWindow(false)
	end, false, 1)
end

function AdventureFloorResultWindow.openRootWnd(slot0, slot1)
	playOtherSound("c_get")
	slot0:handleEffect(true)

	if slot1.items_list then
		table.sort(slot2, function (slot0, slot1)
			return slot1.num < slot0.num
		end)
	end

	slot0.scroll_view:setData(slot2, nil, , slot0.item)
end

function AdventureFloorResultWindow.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	elseif not tolua.isnull(slot0.title_container) and slot0.play_effect == nil then
		slot0.play_effect = createEffectSpine(PathTool.getEffectRes(274), cc.p(slot0.title_width * 0.5, slot0.title_height * 0.5), cc.p(0.5, 0.5), false, PlayerAction.action_4)

		slot0.title_container:addChild(slot0.play_effect, 1)
	end
end

function AdventureFloorResultWindow.close_callback(slot0)
	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()
	end

	slot0.scroll_view = nil

	uv0:openAdventureFloorResultWindow(false)
end

AdventureFloorResultItem = class("AdventureFloorResultItem", function ()
	return ccui.Layout:create()
end)

function AdventureFloorResultItem.ctor(slot0)
	slot0.is_completed = false
end

function AdventureFloorResultItem.setExtendData(slot0, slot1)
	if not tolua.isnull(slot1) and slot0.root_wnd == nil then
		slot0.is_completed = true
		slot2 = slot1:getContentSize()

		slot0:setAnchorPoint(cc.p(0.5, 0.5))
		slot0:setContentSize(slot2)

		slot0.root_wnd = slot1:clone()

		slot0.root_wnd:setVisible(true)
		slot0.root_wnd:setAnchorPoint(0.5, 0.5)
		slot0.root_wnd:setPosition(slot2.width * 0.5, slot2.height * 0.5)
		slot0.root_wnd:setCascadeOpacityEnabled(true)
		slot0:addChild(slot0.root_wnd)

		slot0.init_pos_y = slot0.root_wnd:getPositionY()
		slot0.item_name = slot0.root_wnd:getChildByName("item_name")
		slot0.item_num = slot0.root_wnd:getChildByName("item_num")

		slot0:playEnterActions()
	end
end

function AdventureFloorResultItem.playEnterActions(slot0)
	slot0.root_wnd:setPositionX(200)
	slot0.root_wnd:setOpacity(0)
	slot0.root_wnd:runAction(cc.Sequence:create(cc.Spawn:create(cc.MoveTo:create(0.2, cc.p(460, slot0.init_pos_y)), cc.FadeIn:create(0.2)), cc.MoveTo:create(0.1, cc.p(360, slot0.init_pos_y))))
end

function AdventureFloorResultItem.setData(slot0, slot1)
	slot0.data = slot1

	if slot1 and Config.ItemData.data_get_data(slot1.bid) then
		if slot0.item_icon == nil then
			slot0.item_icon = createSprite(nil, 164, 22, slot0.root_wnd, cc.p(0.5, 0.5))

			slot0.item_icon:setScale(0.4)
		end

		if slot0.item_icon_res ~= slot2.icon then
			slot0.item_icon_res = slot2.icon

			loadSpriteTexture(slot0.item_icon, PathTool.getItemRes(slot2.icon), LOADTEXT_TYPE)
		end

		slot0.item_name:setString(slot2.name)
		slot0.item_num:setString(slot1.num)
	end
end

function AdventureFloorResultItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
