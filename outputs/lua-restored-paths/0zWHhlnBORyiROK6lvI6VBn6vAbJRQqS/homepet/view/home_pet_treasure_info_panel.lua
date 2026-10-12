HomePetTreasureInfoPanel = HomePetTreasureInfoPanel or BaseClass(BaseView)
slot1 = HomepetController:getInstance():getModel()

function HomePetTreasureInfoPanel.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("homepet_travellingbag", "homepet_travellingbag"),
			type = ResourcesType.plist
		}
	}
	slot0.layout_name = "homepet/home_pet_treasure_info_panel"
end

function HomePetTreasureInfoPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.title = slot0.main_container:getChildByName("main_panel"):getChildByName("win_title")

	slot0.title:setString(TI18N("物品名字"))

	slot0.icon = slot0.main_container:getChildByName("icon")
	slot0.name = slot0.main_container:getChildByName("name")
	slot0.item_scrollview = slot0.main_container:getChildByName("item_scrollview")

	slot0.item_scrollview:setScrollBarEnabled(false)
	slot0.item_scrollview:setSwallowTouches(false)

	slot0.item_scrollview_size = slot0.item_scrollview:getContentSize()
	slot0.item_scrollview_container = slot0.item_scrollview:getInnerContainer()
	slot0.desc = createRichLabel(26, cc.c4b(100, 50, 35, 255), cc.p(0, 1), cc.p(100, 0), 8, nil, 310)

	slot0.item_scrollview:addChild(slot0.desc)
end

function HomePetTreasureInfoPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openHomePetTreasureInfoPanel(false)
	end, false, 2)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openHomePetTreasureInfoPanel(false)
	end, true, 2)
end

function HomePetTreasureInfoPanel.openRootWnd(slot0, slot1)
	slot0.dic_have_treasure_id = uv0.dic_have_treasure_id or {}
	slot0.item_config = (slot1 or {}).item_config or Config.ItemData.data_get_data(100004)

	if not slot0.item_config then
		return
	end

	slot0.title:setString(slot0.item_config.name)
	slot0.name:setString(slot0.item_config.use_desc)

	slot3 = nil
	slot3 = (not slot0.dic_have_treasure_id[slot0.item_config.id] or PathTool.getItemRes(slot0.item_config.icon, false)) and PathTool.getTargetRes("homepet_item", slot0.item_config.icon, false, false)

	if slot0.record_head_icon == nil or slot0.record_head_icon ~= slot3 then
		slot0.record_head_icon = slot3

		loadSpriteTexture(slot0.icon, slot3, LOADTEXT_TYPE)
	end

	slot0.desc:setString(slot0.item_config.desc)

	slot5 = math.max(slot0.item_scrollview_size.height, slot0.desc:getContentSize().height + 4)

	slot0.item_scrollview:setInnerContainerSize(cc.size(slot0.item_scrollview_size.width, slot5))
	slot0.desc:setPosition(5, slot5 - 2)

	if slot5 == slot0.item_scrollview_size.height then
		slot0.item_scrollview:setTouchEnabled(false)
	else
		slot0.item_scrollview:setTouchEnabled(true)
	end
end

function HomePetTreasureInfoPanel.close_callback(slot0)
	if slot0.item_list and next(slot0.item_list or {}) ~= nil then
		for slot4, slot5 in ipairs(slot0.item_list) do
			if slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end
	end

	slot0.item_list = {}

	uv0:openHomePetTreasureInfoPanel(false)
end
