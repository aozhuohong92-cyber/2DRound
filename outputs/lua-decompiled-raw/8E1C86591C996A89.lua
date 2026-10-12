ArenaChampionBestInfoWindow = ArenaChampionBestInfoWindow or BaseClass(BaseView)
slot0 = ArenaController:getInstance()
slot1 = ArenaController:getInstance():getModel()

function ArenaChampionBestInfoWindow.__init(slot0, slot1)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.is_full_screen = false
	slot0.layout_name = "arena/arena_champion_best_info_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("arena", "arenachampion"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_46"),
			type = ResourcesType.single
		}
	}
	slot0.view_type = slot1 or ArenaConst.champion_type.normal
end

function ArenaChampionBestInfoWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")
	slot0.container = slot1

	slot0:playEnterAnimatianByObj(slot0.container, 2)
	slot1:getChildByName("Image_1"):ignoreContentAdaptWithSize(true)
	slot1:getChildByName("Image_2"):ignoreContentAdaptWithSize(true)

	if slot0.view_type == ArenaConst.champion_type.normal then
		slot2:loadTexture(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_46"), LOADTEXT_TYPE)
		slot3:loadTexture(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_46"), LOADTEXT_TYPE)
		slot2:setVisible(true)
		slot3:setVisible(true)
		slot0:handleFlagEffect(false)
	else
		slot2:setVisible(false)
		slot3:setVisible(false)
		slot0:handleFlagEffect(true)
	end

	slot4 = slot1:getChildByName("info_panel")

	slot4:setLocalZOrder(1)
	slot4:getChildByName("rank_title"):setString(TI18N("排     名:"))
	slot4:getChildByName("times_title"):setString(TI18N("比赛场数:"))
	slot4:getChildByName("win_title"):setString(TI18N("获胜场数:"))
	slot4:getChildByName("desc_label"):setString(TI18N("获得以上成就"))

	if slot0.view_type == ArenaConst.champion_type.cross then
		slot4:getChildByName("Image_3"):loadTexture(PathTool.getResFrame("arena", "txt_cn_arenachampion_1002", false, "arenachampion"), LOADTEXT_TYPE_PLIST)
	end

	slot0.rank_value = slot4:getChildByName("rank_value")
	slot0.times_value = slot4:getChildByName("times_value")
	slot0.win_value = slot4:getChildByName("win_value")
	slot0.notice_label = createRichLabel(26, 1, cc.p(0.5, 1), cc.p(224, 260), 10, nil, 278)

	slot4:addChild(slot0.notice_label)
end

function ArenaChampionBestInfoWindow.handleFlagEffect(slot0, slot1)
	if slot1 == false then
		if slot0.flag_effect then
			slot0.flag_effect:clearTracks()
			slot0.flag_effect:removeFromParent()

			slot0.flag_effect = nil
		end
	elseif not tolua.isnull(slot0.container) and slot0.flag_effect == nil then
		slot0.flag_effect = createEffectSpine(Config.EffectData.data_effect_info[1321], cc.p(222, 0), cc.p(0.5, 0.5), true, PlayerAction.action)

		slot0.container:addChild(slot0.flag_effect)
	end
end

function ArenaChampionBestInfoWindow.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openArenaChampionBestInfoWindow(false)
		end
	end)
end

function ArenaChampionBestInfoWindow.openRootWnd(slot0, slot1)
	slot0.background:setTouchEnabled(false)
	delayRun(slot0.background, 1, function ()
		uv0.background:setTouchEnabled(true)
	end)

	if RoleController:getInstance():getRoleVo() then
		slot0.notice_label:setString(string.format("<div fontColor=#ffffff outline=1,#5d140b >恭喜</div><div fontColor=#FFC000 outline=1,#5d140b >%s</div>", slot2.name))
	end

	if slot1 then
		slot0.rank_value:setString(slot1.rank or 0)
		slot0.times_value:setString(slot1.cnum or 0)
		slot0.win_value:setString(slot1.win or 0)
	end
end

function ArenaChampionBestInfoWindow.close_callback(slot0)
	slot0:handleFlagEffect(false)
	uv0:openArenaChampionBestInfoWindow(false)
end
