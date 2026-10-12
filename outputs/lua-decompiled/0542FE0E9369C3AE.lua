DramaWelcommeWindow = DramaWelcommeWindow or BaseClass(BaseView)
slot1 = StoryController:getInstance():getView()

function DramaWelcommeWindow.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("welcome", "welcome"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_49"),
			type = ResourcesType.single
		}
	}
	slot0.can_click = false
	slot0.layout_name = "drama/drama_welcome_window"
end

function DramaWelcommeWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0.container:getChildByName("item_1"):getChildByName("label"):setString(TI18N("船长大人,欢迎踏上冒险之旅"))

	slot1 = slot0.container:getChildByName("item_2"):getChildByName("label")

	slot1:setTextAreaSize(cc.size(374, 100))

	if slot1:getVirtualRenderer() then
		slot2:setLineSpacing(10)
	end

	slot1:setString(TI18N("游戏将一直自动战斗,无论是否在线,都可以持续获得奖励!"))
	slot0.container:getChildByName("item_3"):getChildByName("label"):setString(TI18N("记得经常上线领取装备和经验噢~"))
end

function DramaWelcommeWindow.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0:playNextAct()
		end
	end)
end

function DramaWelcommeWindow.playNextAct(slot0)
	if slot0.can_click == false then
		return
	end

	playCloseSound()
	GlobalEvent:getInstance():Fire(StoryEvent.PLAY_NEXT_ACT)
end

function DramaWelcommeWindow.openRootWnd(slot0, slot1)
	slot0.can_click = false

	delayRun(slot0.container, 2, function ()
		uv0.can_click = true
	end)
end

function DramaWelcommeWindow.close_callback(slot0)
	uv0:playWelcom(false)
end
