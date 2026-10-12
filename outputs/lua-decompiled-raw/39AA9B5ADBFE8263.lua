ArenapeakchampionResultPanel = ArenapeakchampionResultPanel or BaseClass(BaseView)
slot1 = ArenapeakchampionController:getInstance():getModel()

function ArenapeakchampionResultPanel.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.layout_name = "arenapeakchampion/arenapeakchampion_result_panel"
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("arenapeakchampion", "arenapeakchampion_result"),
			type = ResourcesType.plist
		}
	}
end

function ArenapeakchampionResultPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot0.container, 2)

	slot0.win_title = slot0.container:getChildByName("win_title")

	slot0.win_title:setString(TI18N("巅峰冠军赛结算"))

	slot0.match_count_key = slot0.container:getChildByName("match_count_key")

	slot0.match_count_key:setString(TI18N("比赛次数"))

	slot0.win_count_key = slot0.container:getChildByName("win_count_key")

	slot0.win_count_key:setString(TI18N("胜利场数"))

	slot0.win_tips = slot0.container:getChildByName("win_tips")

	slot0.win_tips:setString(TI18N("获得以上成就"))

	slot0.rank_label = CommonNum.new(22, slot0.container, 0, -2, cc.p(0.5, 0.5))

	slot0.rank_label:setPosition(294, 427)

	slot0.match_count = slot0.container:getChildByName("match_count")
	slot0.win_count = slot0.container:getChildByName("win_count")
	slot0.win_name = slot0.container:getChildByName("win_name")
	slot0.bg_img = slot0.container:getChildByName("bg_img")
	slot0.item_load_bg = loadSpriteTextureFromCDN(slot0.bg_img, PathTool.getPlistImgForDownLoad("bigbg/arenapeakchampion", "arenapeakchampion_result", false), ResourcesType.single, slot0.item_load_bg)
end

function ArenapeakchampionResultPanel.playEnterAnimatian(slot0)
	if not slot0.container then
		return
	end

	commonOpenActionCentreScale(slot0.container)
end

function ArenapeakchampionResultPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickCloseBtn), false, REGISTER_BUTTON_SOUND_CLOSED_TYPY)
end

function ArenapeakchampionResultPanel.onClickCloseBtn(slot0)
	uv0:openArenapeakchampionResultPanel(false)
end

function ArenapeakchampionResultPanel.openRootWnd(slot0, slot1)
	playOtherSound("b_win", AudioManager.AUDIO_TYPE.BATTLE)
	slot0.rank_label:setNum(slot1.rank or 1)
	slot0.match_count:setString(slot1.cnum or 0)
	slot0.win_count:setString(slot1.win or 0)

	if RoleController:getInstance():getRoleVo() then
		slot0.win_name:setString(TI18N("恭喜 ") .. slot2.name)
	end
end

function ArenapeakchampionResultPanel.close_callback(slot0)
	if slot0.item_load_bg then
		slot0.item_load_bg:DeleteMe()
	end

	slot0.item_load_bg = nil

	uv0:openArenapeakchampionResultPanel(false)
end
