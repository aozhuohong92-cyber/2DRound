PartnerComboMainView = PartnerComboMainView or BaseClass(BaseView)
slot1 = PartnerComboCtrl:getInstance():getModel()
slot2 = string.format

function PartnerComboMainView.__init(slot0)
	slot0.win_type = WinType.Full
	slot0.layout_name = "partnercombo/ui_partner_combo_main_view"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("hero", "partnercombo", false),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/hero", "hero_bag_bg", true),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/hero", "hero_catalog_bg", false),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/hero", "hero_bag_bg_1", false),
			type = ResourcesType.single
		}
	}
	slot0.cur_quality = 0
end

function PartnerComboMainView.adaptationScreen(slot0)
	slot1 = display.getBottom()
	slot2 = slot0.close_btn:getPositionY()
end

function PartnerComboMainView.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg/hero", "hero_bag_bg", true), LOADTEXT_TYPE)
	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0.main_container:setBackGroundImage(PathTool.getPlistImgForDownLoad("bigbg/hero", "hero_bag_bg_1", false), LOADTEXT_TYPE)
	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.hero_catalog_bg_1 = slot0.main_container:getChildByName("hero_catalog_bg_1")

	if not slot0.bg_res_load then
		slot0.bg_res_load = loadSpriteTextureFromCDN(slot0.hero_catalog_bg_1, PathTool.getPlistImgForDownLoad("bigbg/hero", "hero_catalog_bg", false), ResourcesType.single, slot0.bg_res_load)
	end

	slot0.tips_btn = slot0.main_container:getChildByName("tips_btn")
	slot0.close_btn = slot0.main_container:getChildByName("close_btn")

	slot0.close_btn:setPositionY(100)

	slot0.total_attr_label = createRichLabel(24, cc.c4b(36, 144, 3), cc.p(0.5, 0.5), cc.p(610, 120))

	slot0.total_attr_label:setString(uv0("<div href=xxx>%s</div>", TI18N("属性总览")))

	slot6 = {
		"click",
		"href"
	}

	slot0.total_attr_label:addTouchLinkListener(function (slot0, slot1, slot2, slot3)
		uv0:openPartnerComboAttrView(true)
	end, slot6)
	slot0.main_container:addChild(slot0.total_attr_label)

	slot0.quality_btns = {}

	for slot6 = 3, 6 do
		slot0.quality_btns[slot6] = {
			btn = slot0.main_container:getChildByName("quality_node"):getChildByName(uv0("quality_btn%d", slot6 - 2)),
			quality = slot6
		}
	end

	slot0.scroll_layout = slot0.main_container:getChildByName("scroll_layout")
	slot3 = slot0.scroll_layout:getContentSize()
	slot0.scroll_setting = {
		start_y = 10,
		start_x = 20,
		delay = 1,
		space_x = 20,
		item_width = 295,
		item_height = 176,
		space_y = 15,
		col = 2,
		need_dynamic = true
	}
	slot0.scroll_view = CommonScrollViewSingleLayout.new(slot0.scroll_layout, cc.p(slot3.width / 2, slot3.height / 2), ScrollViewDir.vertical, ScrollViewStartPos.top, slot3, slot0.scroll_setting, cc.p(0.5, 0.5))

	slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	slot0:adaptationScreen()
end

function PartnerComboMainView.createNewCell(slot0, slot1, slot2)
	slot3 = PartnerComboCard.new(slot0.rank_type)

	slot3:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot3
end

function PartnerComboMainView.numberOfCells(slot0)
	slot1 = 0

	if slot0.data_lists then
		slot1 = #slot0.data_lists[slot0.cur_quality]
	end

	return slot1
end

function PartnerComboMainView.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if slot0.data_lists[slot0.cur_quality][slot2] then
		slot1:setData(slot3)
	end
end

function PartnerComboMainView.onCellTouched(slot0, slot1)
	uv0:openPartnerComboDetailView(true, slot0.data_lists[slot0.cur_quality][slot1.index])
end

function PartnerComboMainView.register_event(slot0)
	slot4 = handler(slot0, slot0._onClickBtnClose)
	slot5 = true

	registerButtonEventListener(slot0.close_btn, slot4, slot5, 2)

	for slot4, slot5 in pairs(slot0.quality_btns) do
		registerButtonEventListener(slot5.btn, function ()
			uv0:updateContent(uv1.quality)
		end, false, 2)
	end

	slot0:addGlobalEvent(HeroEvent.PARTNER_COMBO_ACTUVATED_UPDATE, function ()
		uv0:updateContent(uv0.cur_quality, true)
	end)
	registerButtonEventListener(slot0.tips_btn, function (slot0, slot1, slot2)
		slot3 = uv0("1、伙伴之旅在玩家达到<div fontcolor=65df74>%s级</div>时开放。\n2、伙伴之旅图鉴激活或升级后，加成效果对全体英雄生效。\n3、激活或升级，都需要消耗与图谱对应的英雄本体，请谨慎操作。", PartnerComboModel.OPEN_LEVEL)

		if Config.PartnerCatalogData.data_constant and slot4.catalog_rule then
			slot3 = slot4.catalog_rule
		end

		TipsManager:getInstance():showCommonTips(slot3, slot1:getTouchBeganPosition(), nil, nil, 500)
	end, false, 1)
end

function PartnerComboMainView.openRootWnd(slot0)
	slot0:updateContent(3, true)
	uv0:sender18100()
end

function PartnerComboMainView.updateContent(slot0, slot1, slot2)
	if not slot2 and slot0.cur_quality == slot1 then
		return
	end

	slot3, slot4 = nil

	if slot1 ~= 0 then
		slot3, slot4 = slot0.quality_btns[slot1].btn:getPosition()
	end

	slot0.cur_quality = slot1
	slot0.data_lists = uv0:getConfigDataListByQuality(slot0.cur_quality)
	slot10 = true

	slot0.scroll_view:reloadData(nil, slot9, slot10)

	slot5 = uv0:getRedpointRecord()

	for slot9, slot10 in pairs(slot0.quality_btns) do
		addRedPointToNodeByStatus(slot10.btn, false)

		if slot10.quality == slot1 then
			slot10.btn:setScale(1.3)
		else
			slot10.btn:setScale(1)
		end
	end

	for slot9, slot10 in pairs(slot5) do
		if slot10 then
			addRedPointToNodeByStatus(slot0.quality_btns[Config.PartnerCatalogData.data_catalog_list[slot9].quality].btn, true)
		end
	end
end

function PartnerComboMainView._onClickBtnClose(slot0)
	uv0:openPartnerComboMainView(false)
end

function PartnerComboMainView.close_callback(slot0)
	uv0:clearConfigDatas()

	if slot0.bg_res_load then
		slot0.bg_res_load:DeleteMe()

		slot0.bg_res_load = nil
	end

	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()
	end

	slot0.scroll_view = nil

	uv1:openPartnerComboMainView(false)
end
