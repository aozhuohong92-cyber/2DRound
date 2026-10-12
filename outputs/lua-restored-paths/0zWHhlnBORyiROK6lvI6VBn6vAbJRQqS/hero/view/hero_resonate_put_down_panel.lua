HeroResonatePutDownPanel = HeroResonatePutDownPanel or BaseClass(BaseView)
slot1 = HeroController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.sort
slot5 = math.ceil

function HeroResonatePutDownPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.is_full_screen = false
	slot0.layout_name = "hero/hero_resonate_put_down_panel"
	slot0.res_list = {}
end

function HeroResonatePutDownPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.title = slot0.main_panel:getChildByName("win_title")

	slot0.title:setString(TI18N("卸下英雄"))

	slot0.left_item_node = slot0.main_container:getChildByName("left_item_node")
	slot0.right_item_node = slot0.main_container:getChildByName("right_item_node")
	slot0.right_lv = slot0.main_container:getChildByName("right_lv")

	slot0.right_lv:setString("")

	slot0.left_lv = slot0.main_container:getChildByName("left_lv")

	slot0.left_lv:setString("")

	slot0.left_hero_item = HeroExhibitionItem.new(1, false, 0, false)

	slot0.left_item_node:addChild(slot0.left_hero_item)

	slot0.right_hero_item = HeroExhibitionItem.new(1, false, 0, false)

	slot0.right_item_node:addChild(slot0.right_hero_item)

	slot0.left_btn = slot0.main_container:getChildByName("left_btn")

	slot0.left_btn:getChildByName("label"):setString(TI18N("取 消"))

	slot0.right_btn = slot0.main_container:getChildByName("right_btn")

	slot0.right_btn:getChildByName("label"):setString(TI18N("确 定"))

	slot0.tips1 = slot0.main_container:getChildByName("tips1")

	slot0.tips1:setString(TI18N("还原至"))

	slot0.tips2 = createRichLabel(22, cc.c4b(144, 93, 56, 255), cc.p(0.5, 0.5), cc.p(338, 209), nil, nil, 1000)

	slot0.main_container:addChild(slot0.tips2)
	slot0.tips2:setString(TI18N("离开<div fontcolor=#ff0000>恶魔果树</div>英雄等级将被还原"))

	slot0.tips3 = createRichLabel(22, cc.c4b(144, 93, 56, 255), cc.p(0.5, 0.5), cc.p(338, 158), nil, nil, 1000)

	slot0.main_container:addChild(slot0.tips3)

	slot1 = 86400

	if Config.ResonateData.data_const.cell_cool_time then
		slot1 = slot2.val * 60
	end

	slot0.tips3:setString(uv0(TI18N("<div fontcolor=#249003>%s</div>后槽位可以重新添加英雄"), TimeTool.GetTimeFormat(slot1)))
end

function HeroResonatePutDownPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 2)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickBtnClose), true, 2)
	registerButtonEventListener(slot0.left_btn, handler(slot0, slot0.onClickBtnClose), true, 1)
	registerButtonEventListener(slot0.right_btn, handler(slot0, slot0.onClickBtnRight), true, 1)
end

function HeroResonatePutDownPanel.onClickBtnClose(slot0)
	uv0:openHeroResonatePutDownPanel(false)
end

function HeroResonatePutDownPanel.onClickBtnRight(slot0)
	if slot0.left_hero_vo and slot0.pos then
		uv0:sender26427(slot0.left_hero_vo.partner_id, slot0.pos)
		slot0:onClickBtnClose()
	end
end

function HeroResonatePutDownPanel.openRootWnd(slot0, slot1)
	slot2 = slot1 or {}
	slot0.left_hero_vo = slot2.left_hero_vo
	slot0.pos = slot2.pos

	if not slot0.left_hero_vo then
		return
	end

	slot0.right_hevo_vo = deepCopy(slot0.left_hero_vo)
	slot3 = slot0.left_hero_vo.resonate_lev or 1
	slot0.right_hevo_vo.resonate_lev = 0
	slot0.right_hevo_vo.lev = slot3

	slot0.left_hero_item:setData(slot0.left_hero_vo)
	slot0.right_hero_item:setData(slot0.right_hevo_vo)
	slot0.left_lv:setString("Lv." .. slot0.left_hero_vo.lev)
	slot0.right_lv:setString("Lv." .. slot3)
end

function HeroResonatePutDownPanel.close_callback(slot0)
	if slot0.line_load then
		slot0.line_load:DeleteMe()
	end

	slot0.line_load = nil

	if slot0.left_hero_item then
		slot0.left_hero_item:DeleteMe()

		slot0.left_hero_item = nil
	end

	if slot0.right_hero_item then
		slot0.right_hero_item:DeleteMe()

		slot0.right_hero_item = nil
	end

	uv0:openHeroResonatePutDownPanel(false)
end
