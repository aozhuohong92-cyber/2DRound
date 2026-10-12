HeroResonatePutResultPanel = HeroResonatePutResultPanel or BaseClass(BaseView)
slot1 = HeroController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.sort
slot5 = math.ceil

function HeroResonatePutResultPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = false
	slot0.layout_name = "hero/hero_resonate_put_result_panel"
	slot0.res_list = {}
end

function HeroResonatePutResultPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.left_lv = slot0.main_container:getChildByName("left_lv")
	slot0.right_lv = slot0.main_container:getChildByName("right_lv")

	slot0.left_lv:setString("")
	slot0.right_lv:setString("")

	slot0.tips = slot0.main_container:getChildByName("tips")

	slot0.tips:setString(TI18N("英雄已被提升至恶魔树等级"))

	slot0.item_node = slot0.main_container:getChildByName("item_node")

	slot0:handleEffect(true)

	slot0.right_item_node = slot0.main_container:getChildByName("right_item_node")
	slot0.hero_item = HeroExhibitionItem.new(1, false, 0, false)

	slot0.item_node:addChild(slot0.hero_item)
end

function HeroResonatePutResultPanel.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	elseif not tolua.isnull(slot0.item_node) and slot0.play_effect == nil then
		slot0.play_effect = createEffectSpine(PathTool.getEffectRes(145), cc.p(0, 0), cc.p(0.5, 0.5), true, PlayerAction.action)

		slot0.item_node:addChild(slot0.play_effect, -1)
	end
end

function HeroResonatePutResultPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 2)
end

function HeroResonatePutResultPanel.onClickBtnClose(slot0)
	uv0:openHeroResonatePutResultPanel(false)
end

function HeroResonatePutResultPanel.openRootWnd(slot0, slot1)
	slot0.hero_vo = slot1

	if not slot0.hero_vo then
		return
	end

	slot0.hero_item:setData(slot0.hero_vo)
	slot0.left_lv:setString("Lv." .. slot0.hero_vo.resonate_lev)
	slot0.right_lv:setString("Lv." .. slot0.hero_vo.lev)
end

function HeroResonatePutResultPanel.close_callback(slot0)
	if slot0.hero_item then
		slot0.hero_item:DeleteMe()

		slot0.hero_item = nil
	end

	slot0:handleEffect(false)
	uv0:openHeroResonatePutResultPanel(false)
end
