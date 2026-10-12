ArenaChampionTop3Window = ArenaChampionTop3Window or BaseClass(BaseView)
slot0 = ArenaController:getInstance()
slot1 = ArenaController:getInstance():getModel()
slot2 = table.insert

function ArenaChampionTop3Window.__init(slot0, slot1)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.win_type = WinType.Mini
	slot0.is_csb_action = true
	slot0.layout_name = "arena/arena_champion_top_3_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("arena", "arenachampiontop3"),
			type = ResourcesType.plist
		}
	}
	slot0.view_type = slot1 or ArenaConst.champion_type.normal
end

function ArenaChampionTop3Window.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	if slot0.view_type == ArenaConst.champion_type.cross then
		loadSpriteTexture(slot0.main_container:getChildByName("title_container"):getChildByName("Sprite_13"), PathTool.getResFrame("arena", "txt_cn_arenatop_104", false, "arenachampiontop3"), LOADTEXT_TYPE_PLIST)
	end

	slot0.role_name_1 = slot0.main_container:getChildByName("role_name_1")
	slot0.role_name_2 = slot0.main_container:getChildByName("role_name_2")
	slot0.role_name_3 = slot0.main_container:getChildByName("role_name_3")
	slot0.role_head_1 = PlayerHead.new(PlayerHead.type.circle)

	slot0.role_head_1:setHeadLayerScale(0.95)
	slot0.role_head_1:setPosition(360, 252)
	slot0.role_head_1:setLev(99)
	slot0.main_container:addChild(slot0.role_head_1)

	slot0.role_head_2 = PlayerHead.new(PlayerHead.type.circle)

	slot0.role_head_2:setHeadLayerScale(0.95)
	slot0.role_head_2:setPosition(121, 206)
	slot0.role_head_2:setLev(99)
	slot0.main_container:addChild(slot0.role_head_2)

	slot0.role_head_3 = PlayerHead.new(PlayerHead.type.circle)

	slot0.role_head_3:setHeadLayerScale(0.95)
	slot0.role_head_3:setPosition(599, 206)
	slot0.role_head_3:setLev(99)
	slot0.main_container:addChild(slot0.role_head_3)

	slot0.match_time = slot0.main_container:getChildByName("match_time")
end

function ArenaChampionTop3Window.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openArenaChampionTop3Window(false)
		end
	end)
end

function ArenaChampionTop3Window.openRootWnd(slot0, slot1)
	slot0.background:setTouchEnabled(false)
	delayRun(slot0.background, 0.3, function ()
		uv0.background:setTouchEnabled(true)
	end)

	if slot1 then
		slot0.match_time:setString(string.format(TI18N("比赛时间:%s"), TimeTool.getYMDHMS(slot1.time)))

		if slot1.rank_list then
			for slot5, slot6 in ipairs(slot1.rank_list) do
				if slot0["role_name_" .. slot6.rank] then
					slot0["role_name_" .. slot6.rank]:setString(slot6.name)
				end

				if slot0["role_head_" .. slot6.rank] then
					slot0["role_head_" .. slot6.rank]:setLev(slot6.lev)
					slot0["role_head_" .. slot6.rank]:setHeadRes(slot6.face, false, LOADTEXT_TYPE, slot6.face_file, slot6.face_update_time)
				end
			end
		end
	end
end

function ArenaChampionTop3Window.close_callback(slot0)
	uv0:openArenaChampionTop3Window(false)
	slot0.role_head_1:DeleteMe()
	slot0.role_head_2:DeleteMe()
	slot0.role_head_3:DeleteMe()
end
