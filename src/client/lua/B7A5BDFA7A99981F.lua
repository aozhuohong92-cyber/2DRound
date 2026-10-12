HeroLibraryStoryPanel = HeroLibraryStoryPanel or BaseClass(BaseView)
slot0 = string.format

function HeroLibraryStoryPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = false
	slot0.layout_name = "hero/hero_library_story_panel"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("herolibrary", "herolibrary"),
			type = ResourcesType.plist
		}
	}
end

function HeroLibraryStoryPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.attr_name = slot0.main_container:getChildByName("attr_name")
	slot0.content_scrollview = slot0.main_container:getChildByName("content_scrollview")

	slot0.content_scrollview:setScrollBarEnabled(false)

	slot0.content_scrollview_size = slot0.content_scrollview:getContentSize()
end

function HeroLibraryStoryPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 1)
end

function HeroLibraryStoryPanel.onClickBtnClose(slot0)
	HeroController:getInstance():openHeroLibraryStoryPanel(false)
end

function HeroLibraryStoryPanel.openRootWnd(slot0, slot1, slot2)
	if not slot1 and not slot2 then
		return
	end

	slot0.attr_name:setString(slot1)

	slot3 = createRichLabel(24, cc.c4b(80, 90, 131, 255), cc.p(0.5, 1), cc.p(slot0.content_scrollview_size.width * 0.5, 0), 12, nil, slot0.content_scrollview_size.width)

	slot0.content_scrollview:addChild(slot3)
	slot3:setString(slot2)

	if slot3:getContentSize().height < slot0.content_scrollview_size.height then
		slot0.content_scrollview:setTouchEnabled(false)
	end

	slot5 = math.max(slot0.content_scrollview_size.height, slot4.height)

	slot0.content_scrollview:setInnerContainerSize(cc.size(slot0.content_scrollview_size.width, slot5))
	slot3:setPositionY(slot5)
end

function HeroLibraryStoryPanel.close_callback(slot0)
	HeroController:getInstance():openHeroLibraryStoryPanel(false)
end
