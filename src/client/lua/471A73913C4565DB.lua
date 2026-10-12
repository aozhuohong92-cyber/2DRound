PlanesafkChooseDifficultyPanel = PlanesafkChooseDifficultyPanel or BaseClass(BaseView)
slot1 = PlanesafkController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.sort
slot5 = math.ceil

function PlanesafkChooseDifficultyPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.is_full_screen = false
	slot0.layout_name = "planesafk/planesafk_choose_difficulty_panel"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("planes", "planes_hard"),
			type = ResourcesType.plist
		}
	}
end

function PlanesafkChooseDifficultyPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.bg_tips = slot0.main_container:getChildByName("bg_tips")

	slot0.bg_tips:setString(TI18N("困难难度的奖励更丰富, 但战斗难度会更大,请勇士谨慎选择"))

	slot0.btn_rule = slot0.main_container:getChildByName("btn_rule")

	slot0.btn_rule:setVisible(false)

	slot0.left_btn = slot0.main_container:getChildByName("left_btn")

	slot0.left_btn:getChildByName("label"):setString(TI18N("确认选择"))

	slot0.right_btn = slot0.main_container:getChildByName("right_btn")

	slot0.right_btn:getChildByName("label"):setString(TI18N("确认选择"))

	slot0.left_reward_key = slot0.main_container:getChildByName("left_reward_key")

	slot0.left_reward_key:setString("奖励系数:")

	slot0.left_hark_key = slot0.main_container:getChildByName("left_hark_key")

	slot0.left_hark_key:setString("难度系数:")

	slot0.right_reward_key = slot0.main_container:getChildByName("right_reward_key")

	slot0.right_reward_key:setString("奖励系数:")

	slot0.right_hark_key = slot0.main_container:getChildByName("right_hark_key")

	slot0.right_hark_key:setString("难度系数:")

	slot1 = {
		1000,
		1000
	}

	if Config.PlanesData.data_const.planes_reward_rate then
		slot1 = slot2.val
	end

	slot3 = {
		1000,
		1000
	}

	if Config.PlanesData.data_const.planes_challenge_rate then
		slot3 = slot4.val
	end

	slot5 = math.floor
	slot0.left_reward_value = slot0.main_container:getChildByName("left_reward_value")

	slot0.left_reward_value:setString(slot5(slot1[1] / 10) .. "%")

	slot0.left_hard_value = slot0.main_container:getChildByName("left_hard_value")

	slot0.left_hard_value:setString(slot5(slot3[1] / 10) .. "%")

	slot0.right_reward_value = slot0.main_container:getChildByName("right_reward_value")

	slot0.right_reward_value:setString(slot5(slot1[2] / 10) .. "%")

	slot0.right_hard_value = slot0.main_container:getChildByName("right_hard_value")

	slot0.right_hard_value:setString(slot5(slot3[2] / 10) .. "%")
end

function PlanesafkChooseDifficultyPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 2)
	registerButtonEventListener(slot0.btn_rule, handler(slot0, slot0.onClickRuleBtn), true, 2)
	registerButtonEventListener(slot0.left_btn, handler(slot0, slot0.onClickBtnLeft), true, 1)
	registerButtonEventListener(slot0.right_btn, handler(slot0, slot0.onClickBtnRight), true, 1)
end

function PlanesafkChooseDifficultyPanel.onClickRuleBtn(slot0)
	MainuiController:getInstance():openCommonExplainView(true, Config.ArenaTeamData.data_explain)
end

function PlanesafkChooseDifficultyPanel.onClickBtnClose(slot0)
	uv0:openPlanesafkChooseDifficultyPanel(false)
end

function PlanesafkChooseDifficultyPanel.onClickBtnLeft(slot0)
	if not slot0.floor then
		return
	end

	uv0:sender28604(slot0.floor, 1)
	slot0:onClickBtnClose()
end

function PlanesafkChooseDifficultyPanel.onClickBtnRight(slot0)
	if not slot0.floor then
		return
	end

	uv0:sender28604(slot0.floor, 2)
	slot0:onClickBtnClose()
end

function PlanesafkChooseDifficultyPanel.openRootWnd(slot0, slot1)
	slot0.floor = (slot1 or {}).floor
end

function PlanesafkChooseDifficultyPanel.close_callback(slot0)
	uv0:openPlanesafkChooseDifficultyPanel(false)
end
