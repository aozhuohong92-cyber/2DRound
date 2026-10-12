ArtifactChoseWindow = ArtifactChoseWindow or BaseClass(BaseView)
slot0 = HeroController:getInstance()

function ArtifactChoseWindow.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = false
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "hero/artifact_chose_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_3"),
			type = ResourcesType.single
		}
	}
	slot0.chose_num = 0
end

function ArtifactChoseWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)
	slot1:getChildByName("title_con"):getChildByName("title_label"):setString(TI18N("战技选择"))

	slot0.chose_label = slot1:getChildByName("chose_label")

	slot0.chose_label:setString(string.format(TI18N("(已选择:%d)"), slot0.chose_num))

	slot0.ok_btn = slot1:getChildByName("ok_btn")

	slot0.ok_btn:getChildByName("label"):setString(TI18N("确定"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.goods_con = slot1:getChildByName("goods_con")
	slot5 = slot0.goods_con:getContentSize()
	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.goods_con, cc.p(0, 5), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot5.width, slot5.height - 10), {
		start_y = 0,
		start_x = 15,
		space_x = 20,
		row = 0,
		space_y = 10,
		col = 4,
		need_dynamic = true,
		item_class = BackPackItem,
		item_width = BackPackItem.Width,
		item_height = BackPackItem.Height
	})

	slot0.item_scrollview:setSwallowTouches(false)
end

function ArtifactChoseWindow.setData(slot0, slot1)
	slot0.artifact_bid = slot1.bid
	slot0.max_num = slot1.max_num or 0
	slot0.chose_list = slot1.chose_list or {}
	slot0.chose_num = #slot0.chose_list

	slot0.chose_label:setString(string.format(TI18N("(已选择:%d/%d)"), slot0.chose_num, slot0.max_num))

	slot3 = {}
	slot4 = 1

	for slot8, slot9 in pairs(BackpackController:getInstance():getModel():getAllBackPackArray(BackPackConst.item_tab_type.SPECIAL)) do
		if slot9 and slot9.config and slot9.config.type == BackPackConst.item_type.ARTIFACTCHIPS and Config.PartnerArtifactData.data_artifact_data[slot9.config.id] and slot10.com_artifact ~= 0 then
			slot11 = false

			for slot15, slot16 in pairs(slot0.chose_list) do
				if slot16 == slot9.id then
					slot11 = true

					break
				end
			end

			slot9:setGoodsAttr("showSellStatus", {
				status = true,
				select = slot11
			})

			slot3[slot4] = slot9
			slot4 = slot4 + 1
		end
	end

	table.sort(slot3, SortTools.tableLowerSorter({
		"quality",
		"id"
	}))

	slot0.item_data = slot3

	slot0.item_scrollview:setData(slot3, nil, , {
		showCheckBox = true,
		checkBoxClickCallBack = handler(slot0, slot0._onCheckBoxCallBack),
		adjustCheckBoxPos = cc.p(BackPackItem.Width - 25, BackPackItem.Height - 25)
	})

	if next(slot3) ~= nil then
		slot0.item_scrollview:addEndCallBack(function ()
			for slot4, slot5 in pairs(uv0.item_scrollview:getItemList()) do
				slot5:addCallBack(function ()
					uv1:openArtifactTipsWindow(true, uv0:getData(), PartnerConst.ArtifactTips.normal)
				end)
			end
		end)
		commonShowEmptyIcon(slot0.main_container, false)
	else
		commonShowEmptyIcon(slot0.main_container, true, {
			text = TI18N("暂时没有可合成的战技"),
			label_color = Config.ColorData.data_color4[175],
			pos = cc.p(slot0.main_container:getContentSize().width / 2, slot0.main_container:getContentSize().height / 2 + 30),
			offset_y = 0,
			font_size = 24
		})
	end
end

function ArtifactChoseWindow._onCheckBoxCallBack(slot0, slot1, slot2)
	slot3 = slot2:getData()

	if slot1 == true then
		if not slot0:checkItemIsCanChose(slot3.config.id) then
			slot3:setGoodsAttr("showSellStatus", {
				select = false,
				status = true
			})
			slot2:setData(slot3)
			message(TI18N("请选择同类型战技"))

			return
		elseif slot0.max_num <= slot0.chose_num then
			slot3:setGoodsAttr("showSellStatus", {
				select = false,
				status = true
			})
			slot2:setData(slot3)
			message(TI18N("已达最大选择数量"))

			return
		end
	end

	if slot1 == true then
		slot0.chose_num = slot0.chose_num + 1

		if Config.PartnerArtifactData.data_artifact_data[slot3.config.id] and slot4.com_artifact then
			slot0.artifact_bid = slot4.com_artifact
		end
	else
		slot0.chose_num = slot0.chose_num - 1

		if slot0.chose_num <= 0 then
			slot0.artifact_bid = 0
		end
	end

	slot0.chose_label:setString(string.format(TI18N("(已选择:%d/%d)"), slot0.chose_num, slot0.max_num))
end

function ArtifactChoseWindow.checkItemIsCanChose(slot0, slot1)
	slot2 = false

	if slot0.artifact_bid and slot0.artifact_bid ~= 0 then
		if Config.PartnerArtifactData.data_artifact_data[slot1] and slot3.com_artifact == slot0.artifact_bid then
			slot2 = true
		end
	else
		slot2 = true
	end

	return slot2
end

function ArtifactChoseWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0._onClickBtnClose), false, 2)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0._onClickBtnClose), false, 2)
	registerButtonEventListener(slot0.ok_btn, handler(slot0, slot0._onClickBtnOk))
end

function ArtifactChoseWindow._onClickBtnClose(slot0)
	uv0:openArtifactChoseWindow(false)
end

function ArtifactChoseWindow._onClickBtnOk(slot0)
	slot1 = false
	slot2 = {}

	for slot6, slot7 in pairs(slot0.item_data) do
		if slot7.showSellStatus ~= nil and slot7.showSellStatus.select == true then
			if slot7.enchant >= 3 then
				slot1 = true
			end

			table.insert(slot2, slot7.id)
		end
	end

	function slot3()
		GlobalEvent:getInstance():Fire(HeroEvent.Artifact_Chose_Event, uv0)
		uv1:openArtifactChoseWindow(false)
	end

	if slot1 then
		CommonAlert.show(TI18N("您选择了高星级的战技作为升星材料，是否继续？"), TI18N("确定"), function ()
			uv0()
		end, TI18N("取消"))
	else
		slot3()
	end
end

function ArtifactChoseWindow.openRootWnd(slot0, slot1)
	slot0:setData(slot1)
end

function ArtifactChoseWindow.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.item_data and next(slot0.item_data) ~= nil then
		for slot4, slot5 in pairs(slot0.item_data) do
			slot5:setGoodsAttr("showSellStatus", {
				select = false,
				status = false
			})
		end
	end

	uv0:openArtifactChoseWindow(false)
end
