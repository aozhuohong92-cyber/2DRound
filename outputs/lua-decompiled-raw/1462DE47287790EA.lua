AdventureEvtStartWindow = AdventureEvtStartWindow or BaseClass(BaseView)
slot0 = AdventureController:getInstance()

function AdventureEvtStartWindow.__init(slot0, slot1)
	slot0.win_type = WinType.Mini
	slot0.data = slot1
	slot0.config = slot1.config
	slot0.layout_name = "adventure/adventure_evt_answer_start_view"
	slot0.is_full_screen = false
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("adventure", "adventure"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_47"),
			type = ResourcesType.single
		}
	}
	slot0.is_use_csb = false
end

function AdventureEvtStartWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("root")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.item_icon = slot0.main_container:getChildByName("item_icon")

	loadSpriteTexture(slot0.item_icon, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_47"), LOADTEXT_TYPE)

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.ack_button = slot0.main_container:getChildByName("ack_button")
	slot0.ack_button.label = slot0.ack_button:getTitleRenderer()

	slot0.ack_button:setTitleText(TI18N("开始答题"))
	slot0.ack_button.label:enableOutline(Config.ColorData.data_color4[264], 2)

	slot0.title_label = slot0.main_container:getChildByName("title_label")

	slot0.title_label:setString(TI18N("智力大乱斗"))

	slot0.swap_desc_label = createRichLabel(26, 175, cc.p(0.5, 0.5), cc.p(slot0.main_container:getContentSize().width / 2, 440), nil, , 600)

	slot0.main_container:addChild(slot0.swap_desc_label)
	slot0.swap_desc_label:setVisible(true)
	slot0:updatedata()
end

function AdventureEvtStartWindow.updatedata(slot0)
	if slot0.config then
		slot0.swap_desc_label:setString(slot0.config.desc)
	end
end

function AdventureEvtStartWindow.register_event(slot0)
	if slot0.background then
		slot0.background:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				uv0:openEvtViewByType(false)
			end
		end)
	end

	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				uv0:openEvtViewByType(false)
			end
		end)
	end

	if slot0.ack_button then
		slot0.ack_button:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()

				if uv0.config then
					uv1:openEvtViewByType(false)
					uv1:openAnswerView(true, uv0.data)
				end
			end
		end)
	end
end

function AdventureEvtStartWindow.openRootWnd(slot0, slot1)
end

function AdventureEvtStartWindow.close_callback(slot0)
	uv0:openEvtViewByType(false)
end
