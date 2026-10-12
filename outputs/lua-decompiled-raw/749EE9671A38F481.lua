ArtifactListWindow = ArtifactListWindow or BaseClass(BaseView)

function ArtifactListWindow.__init(slot0)
	slot0.ctrl = HeroController:getInstance()
	slot0.is_full_screen = false
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.title_str = TI18N("战技列表")
	slot0.empty_res = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_3")
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("hero", "hero"),
			type = ResourcesType.plist
		},
		{
			path = slot0.empty_res,
			type = ResourcesType.single
		}
	}
	slot0.win_type = WinType.Big
	slot0.is_init = true
	slot0.base_attr = {}
	slot0.other_attr = {}
end

function ArtifactListWindow.open_callback(slot0)
	slot2 = cc.CSLoader:createNode(PathTool.getTargetCSB("hero/artifact_list_panel"))

	slot0.container:addChild(slot2, 10)
	slot2:setAnchorPoint(cc.p(0.5, 0))
	slot2:setPosition(cc.p(slot0.container:getContentSize().width / 2, 100))

	slot0.main_panel = slot2:getChildByName("main_panel")
	slot0.source_btn = slot0.main_panel:getChildByName("source_btn")

	slot0.source_btn:setTitleText(TI18N("获取更多"))
	slot0.source_btn:getTitleRenderer():enableOutline(cc.c4b(41, 74, 21, 255), 2)

	slot0.desc_label = createLabel(24, 175, nil, 310, 765, TI18N("穿戴战技后英雄可获得战技携带的被动技能"), slot0.container)

	slot0.desc_label:setAnchorPoint(cc.p(0.5, 0.5))

	if slot0.item_scrollview == nil then
		slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.main_panel, cc.p(0, 3), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(600, 620), {
			start_y = 0,
			once_num = 1,
			start_x = 5,
			row = 1,
			delay = 4,
			space_x = 0,
			item_width = 600,
			item_height = 135,
			space_y = 3,
			col = 1
		}, cc.p(0, 0))

		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.item_scrollview:reloadData()
end

function ArtifactListWindow.register_event(slot0)
	slot0.source_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			slot2 = 0

			if Config.PartnerArtifactData.data_artifact_const.main_shenqi then
				slot2 = Config.PartnerArtifactData.data_artifact_const.main_shenqi.val
			end

			if Config.ItemData.data_get_data(slot2) then
				BackpackController:getInstance():openTipsSource(true, slot3)
			end
		end
	end)

	if not slot0.add_goods_event then
		slot0.add_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.ADD_GOODS, function (slot0, slot1)
			if slot0 == BackPackConst.Bag_Code.BACKPACK then
				uv0:initData()
			end
		end)
	end

	if not slot0.modify_goods_event then
		slot0.modify_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
			if slot0 and slot0 == BackPackConst.Bag_Code.BACKPACK then
				uv0:initData()
			end
		end)
	end

	slot0:addGlobalEvent(HeroEvent.Del_Hero_Event, function (slot0)
		if uv0.partner_id then
			for slot4, slot5 in ipairs(slot0) do
				if uv0.partner_id == slot5.partner_id and uv0.close then
					uv0:close()
				end
			end
		end
	end)
end

function ArtifactListWindow.openRootWnd(slot0, slot1, slot2, slot3)
	slot0.artifact_type = slot1 or 1
	slot0.partner_id = slot2 or 0
	slot0.select_vo = slot3

	slot0:initData()
end

function ArtifactListWindow.createNewCell(slot0, slot1, slot2)
	slot3 = ArtifactListItem.new()

	slot3:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot3
end

function ArtifactListWindow.numberOfCells(slot0)
	if not slot0.item_list then
		return 0
	end

	return #slot0.item_list
end

function ArtifactListWindow.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.item_list[slot2] then
		return
	end

	slot4 = slot1:setData(slot3)

	slot1:setExtendData(slot0.partner_id)
end

function ArtifactListWindow.onCellTouched(slot0, slot1)
	if slot1:getData() and next(slot2) ~= nil then
		if slot0.partner_id and slot0.partner_id ~= 0 then
			slot0.ctrl:sender11030(slot0.partner_id, slot0.artifact_type, slot2.id, 1)
		else
			GlobalEvent:getInstance():Fire(HeroEvent.Artifact_Select_Event, slot2)
		end

		slot0.ctrl:openArtifactListWindow(false)
	end
end

function ArtifactListWindow.initData(slot0)
	slot2 = DeepCopy(BackpackController:getInstance():getModel():getAllBackPackArray(BackPackConst.item_tab_type.SPECIAL))
	slot0.item_list = {}
	slot3 = 1
	slot0.select_id = 0

	if slot0.select_vo and slot0.select_vo.id then
		slot0.select_id = slot0.select_vo.id or 0
	end

	for slot7, slot8 in pairs(slot2) do
		if slot8 and slot8.config and slot8.config.type == BackPackConst.item_type.ARTIFACTCHIPS and slot0.select_id ~= slot8.id then
			if slot0.artifact_type == 0 then
				slot0.item_list[slot3] = slot8
				slot3 = slot3 + 1
			else
				slot0.item_list[slot3] = slot8
				slot3 = slot3 + 1
			end
		end
	end

	slot0:showEmptyIcon(false)

	if not slot0.item_list or next(slot0.item_list) == nil then
		slot0:showEmptyIcon(true)
	end

	slot0.is_cloth = false

	if HeroController:getInstance():getModel():getHeroById(slot0.partner_id) and next(slot4) ~= nil then
		for slot9, slot10 in pairs(slot4.artifact_list or {}) do
			if slot10 and slot10.id and slot10.id ~= 0 and slot10.artifact_pos and slot10.artifact_pos == slot0.artifact_type then
				slot0.is_cloth = true
			end
		end
	end

	table.sort(slot0.item_list, function (slot0, slot1)
		if slot0.enchant ~= slot1.enchant then
			return slot1.enchant < slot0.enchant
		elseif slot0.config and slot1.config then
			return slot1.config.quality < slot0.config.quality
		else
			return false
		end
	end)
	slot0.item_scrollview:reloadData()
end

function ArtifactListWindow.showEmptyIcon(slot0, slot1)
	if not slot0.empty_con and slot1 == false then
		return
	end

	if not slot0.empty_con then
		slot2 = cc.size(200, 200)
		slot0.empty_con = ccui.Widget:create()

		slot0.empty_con:setContentSize(slot2)
		slot0.empty_con:setPosition(cc.p(335, 370))
		slot0.container:addChild(slot0.empty_con, 100)

		slot3 = createImage(slot0.empty_con, slot0.empty_res, slot2.width / 2, slot2.height / 2, cc.p(0.5, 0.5), false)
		slot0.empty_label = createLabel(24, cc.c4b(118, 69, 25, 255), nil, slot2.width / 2, -10, "", slot0.empty_con, 0, cc.p(0.5, 0))
	end

	slot0.empty_label:setString(TI18N("背包中暂无该类型战技"))
	slot0.empty_con:setVisible(slot1)
end

function ArtifactListWindow.setPanelData(slot0)
end

function ArtifactListWindow.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.add_goods_event then
		GlobalEvent:getInstance():UnBind(slot0.add_goods_event)

		slot0.add_goods_event = nil
	end

	if slot0.modify_goods_event then
		GlobalEvent:getInstance():UnBind(slot0.modify_goods_event)

		slot0.modify_goods_event = nil
	end

	slot0.ctrl:openArtifactListWindow(false)
end
