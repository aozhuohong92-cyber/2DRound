slot1 = HomeworldController:getInstance():getModel()
slot2 = table.insert
HomeworldFigureChoseWindow = HomeworldFigureChoseWindow or BaseClass(BaseView)

function HomeworldFigureChoseWindow.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "homeworld/homeworld_figure_chose"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("homeworld", "homeworld"),
			type = ResourcesType.plist
		}
	}
end

function HomeworldFigureChoseWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)
	slot0.main_container:getChildByName("win_title"):setString(TI18N("初始形象选择"))
	slot0.main_container:getChildByName("txt_tips_1"):setString(TI18N("请从下列形象中选取一个形象"))
	slot0.main_container:getChildByName("txt_tips_2"):setString(TI18N("未被选中的形象在家园玩法后续可解锁，请放心选择"))

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.btn_chose = slot0.main_container:getChildByName("btn_chose")

	slot0.btn_chose:getChildByName("label"):setString(TI18N("确认选择"))

	slot0.image_select = slot0.main_container:getChildByName("image_select")

	slot0.image_select:setVisible(true)

	slot0.image_left = slot0.main_container:getChildByName("image_left")
	slot0.left_name_txt = slot0.image_left:getChildByName("name_txt")
	slot0.image_right = slot0.main_container:getChildByName("image_right")
	slot0.right_name_txt = slot0.image_right:getChildByName("name_txt")
end

function HomeworldFigureChoseWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openHomeworldFigureChoseWindow(false)
	end, true, 2)
	registerButtonEventListener(slot0.image_left, function ()
		uv0:setSelectImageStatus(1)
	end, false, 1)
	registerButtonEventListener(slot0.image_right, function ()
		uv0:setSelectImageStatus(2)
	end, false, 1)
	registerButtonEventListener(slot0.btn_chose, function ()
		uv0:onClickChoseBtn()
	end, true)
end

function HomeworldFigureChoseWindow.onClickChoseBtn(slot0)
	slot1 = nil

	if slot0.cur_index == 1 and slot0.left_config then
		slot1 = slot0.left_config.id
	elseif slot0.cur_index == 2 and slot0.right_config then
		slot1 = slot0.right_config.id
	end

	if slot1 then
		uv0:sender26007(slot1)
	end
end

function HomeworldFigureChoseWindow.setSelectImageStatus(slot0, slot1)
	if slot0.cur_index and slot0.cur_index == slot1 then
		return
	end

	if slot1 == 1 then
		slot0.image_select:setPositionX(197)

		if slot0.left_spine then
			slot0.left_spine:setToSetupPose()
			slot0.left_spine:setAnimation(0, PlayerAction.move, true)
		end

		if slot0.right_spine then
			slot0.right_spine:setToSetupPose()
			slot0.right_spine:setAnimation(0, PlayerAction.idle, true)
		end
	else
		slot0.image_select:setPositionX(482)

		if slot0.left_spine then
			slot0.left_spine:setToSetupPose()
			slot0.left_spine:setAnimation(0, PlayerAction.idle, true)
		end

		if slot0.right_spine then
			slot0.right_spine:setToSetupPose()
			slot0.right_spine:setAnimation(0, PlayerAction.move, true)
		end
	end

	slot0.cur_index = slot1
end

function HomeworldFigureChoseWindow.setData(slot0)
	if not slot0.left_config or not slot0.right_config then
		return
	end

	if slot0.left_config.look_id and not slot0.left_spine then
		slot0.left_spine = createEffectSpine(slot0.left_config.look_id, cc.p(197, 220), cc.p(0.5, 0), true, PlayerAction.idle)

		slot0.main_container:addChild(slot0.left_spine)
	end

	slot0.left_name_txt:setString(slot0.left_config.name or "")

	if slot0.right_config.look_id and not slot0.right_spine then
		slot0.right_spine = createEffectSpine(slot0.right_config.look_id, cc.p(482, 220), cc.p(0.5, 0), true, PlayerAction.idle)

		slot0.main_container:addChild(slot0.right_spine)
	end

	slot0.right_name_txt:setString(slot0.right_config.name or "")
	slot0:setSelectImageStatus(1)
end

function HomeworldFigureChoseWindow.openRootWnd(slot0)
	slot0.left_config = Config.HomeData.data_figure[1]
	slot0.right_config = Config.HomeData.data_figure[2]

	slot0:setData()
end

function HomeworldFigureChoseWindow.close_callback(slot0)
	if slot0.left_spine then
		slot0.left_spine:clearTracks()
		slot0.left_spine:removeFromParent()

		slot0.left_spine = nil
	end

	if slot0.right_spine then
		slot0.right_spine:clearTracks()
		slot0.right_spine:removeFromParent()

		slot0.right_spine = nil
	end

	uv0:openHomeworldFigureChoseWindow(false)
end
