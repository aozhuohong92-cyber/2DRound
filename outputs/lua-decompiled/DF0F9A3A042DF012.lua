StoryMangaView = StoryMangaView or BaseClass(BaseView)
slot1 = StoryController:getInstance():getView()

function StoryMangaView.__init(slot0)
	slot0.is_use_csb = false
	slot0.win_type = WinType.Full
	slot0.is_full_screen = true
	slot0.view_tag = ViewMgrTag.MSG_TAG
	slot0.can_click = false
	slot0.layout_name = "drama/drama_manga_view"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_44", true),
			type = ResourcesType.single
		}
	}
end

function StoryMangaView.open_callback(slot0)
	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0.container:setScale(display.getMaxScale())
end

function StoryMangaView.register_event(slot0)
	slot0.container:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			GlobalEvent:getInstance():Fire(StoryEvent.PLAY_NEXT_ACT)
		end
	end)
end

function StoryMangaView.openRootWnd(slot0, slot1, slot2)
end

function StoryMangaView.setCanClickStatus(slot0)
	slot0.can_click = false

	delayRun(slot0.container, 2, function ()
		uv0.can_click = true
	end)
end

function StoryMangaView.playNextManga(slot0, slot1)
end

function StoryMangaView.close_callback(slot0)
	doStopAllActions(slot0.container)
	uv0:playStartManga(false)
end
