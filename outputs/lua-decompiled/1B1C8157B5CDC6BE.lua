EquipmakeMainWindow = EquipmakeMainWindow or BaseClass(BaseView)
slot0 = table.insert
slot1 = table.remove
slot2 = string.format
slot3 = EquipmakeController:getInstance()
slot4 = BackpackController:getInstance():getModel()
slot5 = RoleController:getInstance():getRoleVo()

function EquipmakeMainWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.is_full_screen = false
	slot0.layout_name = "equipmake/equipmake_main_window"
	slot0.cur_type = 0
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_8"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("hero", "hero"),
			type = ResourcesType.plist
		}
	}
	slot0.equip_list = {}
	slot0.selected_index = 0
	slot0.fight_container_list = {}
	slot0.fight_container_pool = {}
	slot0.attr_container_list = {}
	slot0.attr_container_pool = {}
	slot0.arrow_container_list = {}
	slot0.arrow_container_pool = {}
end

function EquipmakeMainWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale(slot0.root_wnd))

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 2)

	slot2 = slot1:getChildByName("main_panel")

	slot2:getChildByName("win_title"):setString(TI18N("橙装"))

	slot0.close_btn = slot2:getChildByName("close_btn")
	slot0.arrow_img = slot2:getChildByName("arrow_img")

	slot0.arrow_img:setVisible(false)

	slot0.center_x = slot0.arrow_img:getPositionX()
	slot0.center_y = slot0.arrow_img:getPositionY()
	slot0.preview_title = slot2:getChildByName("preview_title")

	slot0.preview_title:setString(TI18N("合成预览"))

	slot0.equipmake_btn = slot2:getChildByName("equipmake_btn")
	slot0.equipmake_btn_label = slot0.equipmake_btn:getChildByName("label")

	slot0.equipmake_btn_label:setString(TI18N("合成"))

	slot0.scrollview = slot2:getChildByName("scrollview")
	slot0.scrollview_width = slot0.scrollview:getContentSize().width
	slot0.scrollview_height = slot0.scrollview:getContentSize().height
	slot0.notice_label = slot2:getChildByName("notice_label")

	slot0.notice_label:setVisible(false)

	slot0.source_item = slot2:getChildByName("source_item")
	slot0.source_link = createRichLabel(24, 178, cc.p(0, 0), cc.p(0, 0))

	slot0.source_item:addChild(slot0.source_link, -1)
	slot0.source_link:setString(TI18N("<div fontColor=#249003 href=xxx>获取橙装碎片</div>"))

	slot0.source_tips = slot0.source_item:getChildByName("tips")
	slot0.cost_label = createRichLabel(24, 175, cc.p(0.5, 0.5), cc.p(slot0.equipmake_btn:getPositionX(), 110), nil, nil, 600)

	slot2:addChild(slot0.cost_label)

	slot0.main_panel = slot2

	slot0:createEquipItem()
	slot0:createBaseEquipItem()
	slot0:createUpgradeEquipItem()
end

function EquipmakeMainWindow.register_event(slot0)
	slot0.source_item:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:openEquipmakeSourcesWindow(true)
		end
	end)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openEquipmakeMainWindow(false)
		end
	end)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openEquipmakeMainWindow(false)
		end
	end)
	slot0.equipmake_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data == nil or uv0.selected_index == nil then
				return
			end

			if uv0.cur_show_type == 1 then
				if uv1:checkEquipsIsFull() == true then
					CommonAlert.show(TI18N("背包已满,无法合成新的橙装,是否前往熔炼?"), TI18N("确认"), function ()
						MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.backpack, BackPackConst.item_tab_type.EQUIPS)
					end, TI18N("取消"), nil, CommonAlert.type.common, nil, nil, nil, true)
				else
					uv2:requestEquipmake(uv0.data.partner_id, uv0.selected_index)
				end
			else
				uv2:requestEquipmake(uv0.data.partner_id, uv0.selected_index)
			end
		end
	end)

	if slot0.update_equip_make_event == nil then
		slot0.update_equip_make_event = GlobalEvent:getInstance():Bind(EquipmakeEvent.UpdateEquipmakeEvent, function (slot0, slot1)
			if uv0.data == nil or uv0.data.partner_id ~= slot0 then
				return
			end

			uv0:changeCurUpgradeEquip(slot1)
			uv0:checkCanUpgradeStatus()
		end)
	end

	if uv2 and slot0.role_lev_event == nil then
		slot0.role_lev_event = uv2:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "boss_point" then
				uv0:checkCanUpgradeStatus()

				if uv0.selected_index then
					uv0:setSelecteditem(uv0.selected_index, true)
				end
			end
		end)
	end

	if slot0.update_sell_orange_event == nil then
		slot0.update_sell_orange_event = GlobalEvent:getInstance():Bind(BackpackEvent.Sell_Goods_Success, function ()
			uv0:checkSourceTipsStatus()
		end)
	end
end

function EquipmakeMainWindow.changeCurUpgradeEquip(slot0, slot1)
	if slot1 == nil then
		return
	end

	if slot0.equip_list[slot1] == nil or slot2.item == nil then
		return
	end

	if slot0.data.eqm_list[slot1] == nil then
		return
	end

	slot2.item:setData(slot4)

	slot2.vo = slot4

	if slot2.item.empty_icon then
		slot2.item.empty_icon:setVisible(false)
	end

	if slot0.selected_index == slot1 then
		slot0:setSelecteditem(slot0.selected_index, true)
	end
end

function EquipmakeMainWindow.createEquipItem(slot0)
	for slot4 = 1, 4 do
		if not slot0.equip_list[slot4] then
			slot6 = BackPackItem.new(true, true, nil, 0.9, false)

			slot0.main_panel:addChild(slot6, 1)
			slot6:setPosition(cc.p(120 + (slot4 - 1) % 2 * 442, 418 + math.floor((slot4 - 1) / 2) * 232))
			slot6:addCallBack(function ()
				uv0:setSelecteditem(uv1)
			end)

			slot6.empty_icon = createImage(slot6:getRoot(), PathTool.getResFrame("hero", "hero_equip_" .. slot5), 60, 60, cc.p(0.5, 0.5), true, 10, false)
			slot12 = createLabel(24, 175, nil, slot7, slot8 - BackPackItem.Height * 0.5 - 10, Config.ItemData.data_item_type[slot4] or "", slot0.main_panel, nil, cc.p(0.5, 0.5))
			slot0.equip_list[slot5] = {
				item = slot6,
				vo = nil
			}
		end
	end
end

function EquipmakeMainWindow.createBaseEquipItem(slot0)
	slot0.base_x = 244
	slot0.base_y = 534
	slot0.base_equip = BackPackItem.new(true, true, nil, 1, false)

	slot0.base_equip:setPosition(slot0.base_x, slot0.base_y)
	slot0.base_equip:setVisible(false)
	slot0.base_equip:setDefaultTip(true)

	slot0.base_equip_label = createLabel(24, 175, nil, BackPackItem.Width * 0.5, -16, "", slot0.base_equip:getRoot(), nil, cc.p(0.5, 0.5))

	slot0.main_panel:addChild(slot0.base_equip, 2)
end

function EquipmakeMainWindow.createUpgradeEquipItem(slot0)
	slot0.upgrade_equip = BackPackItem.new(true, true, nil, 1, false)

	slot0.upgrade_equip:setPosition(440, 534)
	slot0.upgrade_equip:setVisible(false)
	slot0.upgrade_equip:setDefaultTip(true)

	slot0.upgrade_equip_label = createLabel(24, 175, nil, BackPackItem.Width * 0.5, -16, "", slot0.upgrade_equip:getRoot(), nil, cc.p(0.5, 0.5))

	slot0.main_panel:addChild(slot0.upgrade_equip, 2)
end

function EquipmakeMainWindow.displayShowInfo(slot0)
	for slot4, slot5 in ipairs(slot0.fight_container_list) do
		slot5.container:setVisible(false)
		uv0(slot0.fight_container_pool, slot5)
	end

	slot0.fight_container_list = {}

	for slot4, slot5 in ipairs(slot0.attr_container_list) do
		slot5:setVisible(false)
		uv0(slot0.attr_container_pool, slot5)
	end

	slot0.attr_container_list = {}

	for slot4, slot5 in ipairs(slot0.arrow_container_list) do
		slot5:setVisible(false)
		uv0(slot0.arrow_container_pool, slot5)
	end

	slot0.arrow_container_list = {}

	slot0.notice_label:setVisible(false)
end

function EquipmakeMainWindow.setSelecteditem(slot0, slot1, slot2)
	if slot0.data == nil then
		return
	end

	if slot0.selected_index == slot1 and not slot2 then
		return
	end

	slot0.selected_index = slot1

	slot0:displayShowInfo()

	if slot0.selected_item then
		slot0.selected_item:setSelected(false)

		slot0.selected_item = nil
	end

	if slot0.equip_list[slot1] then
		slot0.selected_item = slot3.item

		slot0.selected_item:setSelected(true)

		slot5 = 0
		slot6 = 0

		if slot3.vo == nil then
			slot5 = 1
			slot6 = 1
		elseif slot4.base_id then
			if Config.PartnerEqmData.data_eqm_compose_id[slot4.base_id] == nil or slot7.next_id == 0 then
				slot5 = 1
				slot6 = 2
			else
				slot5 = 2
				slot6 = 1
			end
		end

		slot0:setEquipShowStatus(slot5)
		slot0:setBtnShowStatus(slot6)

		if slot5 == 2 then
			slot0:setUpgradeStatusInfo(slot4)
		elseif slot4 then
			slot0:setMaxStatusInfo(slot4)
		else
			slot0:setComposeStatusInfo(slot1)
		end
	end
end

function EquipmakeMainWindow.setEquipShowStatus(slot0, slot1)
	if slot0.cur_show_type == slot1 then
		return
	end

	slot0.cur_show_type = slot1

	if slot0.cur_show_type == 2 then
		slot0.base_equip:setVisible(true)
		slot0.upgrade_equip:setVisible(true)
		slot0.arrow_img:setVisible(true)
		slot0.base_equip:setPosition(slot0.base_x, slot0.base_y)
	else
		slot0.base_equip:setVisible(true)
		slot0.upgrade_equip:setVisible(false)
		slot0.arrow_img:setVisible(false)
		slot0.base_equip:setPosition(slot0.center_x, slot0.center_y)
	end
end

function EquipmakeMainWindow.setBtnShowStatus(slot0, slot1)
	if slot0.btn_show_type == slot1 then
		return
	end

	slot0.btn_show_type = slot1

	if slot1 == 1 then
		slot0.equipmake_btn_label:enableOutline(Config.ColorData.data_color4[177])
		slot0.equipmake_btn:setTouchEnabled(true)
		setChildUnEnabled(false, slot0.equipmake_btn)
	else
		slot0.equipmake_btn_label:disableEffect()
		slot0.equipmake_btn:setTouchEnabled(false)
		setChildUnEnabled(true, slot0.equipmake_btn)
	end
end

function EquipmakeMainWindow.setMaxStatusInfo(slot0, slot1)
	if slot1 == nil or slot1.config == nil then
		return
	end

	slot0.base_equip:setData(slot1)
	slot0.base_equip_label:setString(slot1.config.name)
	slot0.cost_label:setString(TI18N("当前以最高等级"))
	slot0.equipmake_btn_label:setString(TI18N("合成"))
	slot0.preview_title:setString(TI18N("合成预览"))
	slot0:setOnlyOneStatusAttr(slot1.score, slot1:getEquipBaseAttr())
end

function EquipmakeMainWindow.setComposeStatusInfo(slot0, slot1)
	if slot1 == nil then
		return
	end

	if slot0.data == nil or tolua.isnull(slot0.root_wnd) then
		return
	end

	slot2 = slot0.data.lev or 0

	if nil == nil then
		return
	end

	slot0:setCostInfo(slot3.expend)
	slot0.equipmake_btn_label:setString(TI18N("合成"))
	slot0.preview_title:setString(TI18N("合成预览"))

	if Config.ItemData.data_get_data(slot3.id) == nil then
		return
	end

	if slot0.base_vo == nil then
		slot0.base_vo = GoodsVo.New(slot4.id)
	end

	slot0.base_vo:setBaseId(slot4.id)
	slot0.base_equip:setData(slot0.base_vo)
	slot0.base_equip_label:setString(slot4.name)

	if slot0.data.eqm_list[slot1] == nil then
		slot0:setOnlyOneStatusAttr(slot0.base_vo:getEquipBaseScore(), slot0.base_vo:getEquipBaseAttr())
	else
		slot0:setUpgradeAttrInfo(slot5, slot0.base_vo)
	end
end

function EquipmakeMainWindow.setOnlyOneStatusAttr(slot0, slot1, slot2)
	slot3 = slot0:createFightContainer()

	slot3.container:setVisible(true)

	slot8 = 104

	slot3.container:setPosition(226, slot8)
	slot3.value:setNum(slot1)

	slot4 = 1

	for slot8, slot9 in ipairs(slot2) do
		if slot9[1] and slot9[2] then
			if Config.AttrData.data_key_to_name[slot9[1]] then
				if PartnerCalculate.isShowPerByStr(slot10) == true then
					slot0:createAttrContainer():setString(uv0("%s：+%s%s", slot12, slot9[2] * 0.1, "%"))
				else
					slot13:setString(uv0("%s：+%s", slot12, slot11))
				end

				slot13:setVisible(true)
				slot13:setPosition(224, 45 - (slot4 - 1) * 39)

				slot4 = slot4 + 1
			end
		end
	end
end

function EquipmakeMainWindow.setUpgradeAttrInfo(slot0, slot1, slot2)
	if slot1 == nil or slot2 == nil then
		return
	end

	slot3 = slot0:createFightContainer()

	slot3.container:setVisible(true)
	slot3.container:setPosition(110, 104)
	slot3.value:setNum(slot1.score or 0)

	slot4 = slot0:createFightContainer()

	slot4.container:setVisible(true)
	slot4.container:setPosition(370, 104)
	slot4.value:setNum(slot2:getEquipBaseScore())

	slot5 = slot0:createArrowContainer()

	slot5:setVisible(true)
	slot5:setPosition(slot0.scrollview_width * 0.5, 92)

	slot6 = 1

	for slot11, slot12 in ipairs(slot1:getEquipBaseAttr()) do
		if slot12[1] and slot12[2] then
			if Config.AttrData.data_key_to_name[slot12[1]] then
				if PartnerCalculate.isShowPerByStr(slot13) == true then
					slot0:createAttrContainer():setString(uv0("%s：+%s%s", slot15, slot12[2] * 0.1, "%"))
				else
					slot16:setString(uv0("%s：+%s", slot15, slot14))
				end

				slot19 = 45 - (slot6 - 1) * 39

				slot16:setVisible(true)
				slot16:setPosition(110, slot19)

				slot20 = slot0:createArrowContainer()

				slot20:setVisible(true)
				slot20:setPosition(slot0.scrollview_width * 0.5, slot19)

				slot6 = slot6 + 1
			end
		end
	end

	slot6 = 1

	for slot11, slot12 in ipairs(slot2:getEquipBaseAttr()) do
		if slot12[1] and slot12[2] then
			if Config.AttrData.data_key_to_name[slot12[1]] then
				if PartnerCalculate.isShowPerByStr(slot13) == true then
					slot0:createAttrContainer():setString(uv0("%s：+%s%s", slot15, slot12[2] * 0.1, "%"))
				else
					slot16:setString(uv0("%s：+%s", slot15, slot14))
				end

				slot16:setVisible(true)
				slot16:setPosition(370, 45 - (slot6 - 1) * 39)

				slot6 = slot6 + 1
			end
		end
	end
end

function EquipmakeMainWindow.setUpgradeStatusInfo(slot0, slot1)
	if slot0.data == nil or tolua.isnull(slot0.root_wnd) then
		return
	end

	if slot1 == nil or slot1.config == nil then
		return
	end

	slot0.base_equip:setData(slot1)
	slot0.base_equip_label:setString(slot1.config.name)
	slot0.equipmake_btn_label:setString(TI18N("进阶"))
	slot0.preview_title:setString(TI18N("进阶预览"))

	if Config.PartnerEqmData.data_eqm_compose_id[slot1.config.id] == nil or slot3.next_id == 0 or slot3.expend2 == nil then
		message(TI18N("橙装进阶数据异常"))

		return
	end

	if Config.PartnerEqmData.data_eqm_compose_id[slot3.next_id] == nil or slot4.expend == nil then
		message(TI18N("橙装进阶下一级属性异常"))

		return
	end

	if slot0.next_vo == nil then
		slot0.next_vo = GoodsVo.New(slot4.id)
	end

	slot0.next_vo:setBaseId(slot4.id)
	slot0.next_vo:setEnchantInfo(slot1.enchant, slot1.attr)
	slot0.next_vo:setEnchantScore(slot1.all_score - slot1.score)
	slot0.upgrade_equip:setData(slot0.next_vo)
	slot0.upgrade_equip_label:setString(slot0.next_vo.config.name)
	slot0:setUpgradeAttrInfo(slot1, slot0.next_vo)

	if slot0.next_vo.config and slot0.data.lev < slot0.next_vo.config.lev then
		slot0.notice_label:setVisible(true)
		slot0.notice_label:setString(uv0("英雄达%s可进阶", slot0.next_vo.config.lev))
	else
		slot0.notice_label:setVisible(false)
	end

	slot0:setCostInfo(slot3.expend2)
end

function EquipmakeMainWindow.createFightContainer(slot0)
	slot1 = nil

	if next(slot0.fight_container_pool) == nil then
		slot1 = {
			container = ccui.Layout:create()
		}

		slot1.container:setContentSize(cc.size(150, 30))
		slot1.container:setAnchorPoint(cc.p(0, 0.5))
		slot1.container:setPosition(0, 0)
		slot1.container:setVisible(false)
		slot0.scrollview:addChild(slot1.container)

		slot1.label = createSprite(PathTool.getResFrame("hero", "txt_cn_hero_icon"), 0, 0, slot1.container, cc.p(0, 0), LOADTEXT_TYPE_PLIST)
		slot1.value = CommonNum.new(23, slot1.container, 1, 0, cc.p(0, 0))

		slot1.value:setScale(0.65)
		slot1.value:setPosition(50, 14)
	else
		slot1 = uv0(slot0.fight_container_pool, 1)
	end

	uv1(slot0.fight_container_list, slot1)

	return slot1
end

function EquipmakeMainWindow.createAttrContainer(slot0)
	slot1 = nil
	slot1 = (next(slot0.attr_container_pool) ~= nil or createLabel(24, 175, nil, 0, 0, "", slot0.scrollview, nil, cc.p(0, 0))) and uv0(slot0.attr_container_pool, 1)

	uv1(slot0.attr_container_list, slot1)

	return slot1
end

function EquipmakeMainWindow.createArrowContainer(slot0)
	slot1 = nil
	slot1 = (next(slot0.arrow_container_pool) ~= nil or createSprite(PathTool.getResFrame("common", "common_90017"), slot0.scrollview_width * 0.5, 0, slot0.scrollview, cc.p(0, 0), LOADTEXT_PLIST)) and uv0(slot0.arrow_container_pool, 1)

	uv1(slot0.arrow_container_list, slot1)

	return slot1
end

function EquipmakeMainWindow.setCostInfo(slot0, slot1)
	slot2 = ""

	for slot6, slot7 in ipairs(slot1 or {}) do
		if slot7[1] and slot7[2] and Config.ItemData.data_get_data(slot7[1]) then
			slot10 = 0
			slot11 = 175

			if ((Config.ItemData.data_assets_id2label[slot7[1]] == nil or uv0[slot9]) and uv1:getBackPackItemNumByBid(slot7[1])) < slot7[2] then
				slot11 = 183
			end

			if slot2 ~= "" then
				slot2 = slot2 .. ","
			end

			slot2 = uv2("%s<img src=%s visible=true scale=0.35 /><div fontColor=%s>%s</div>%s%s", slot2, PathTool.getItemRes(slot8.icon), tranformC3bTostr(slot11), slot10, "/", slot7[2])
		end
	end

	slot0.cost_label:setString(uv2("%s：%s", TI18N("消耗"), slot2))
end

function EquipmakeMainWindow.openRootWnd(slot0, slot1)
	slot0.data = slot1

	if slot0.data ~= nil then
		slot0:updateEquipList()
		slot0:setSelecteditem(1)
		slot0:checkCanUpgradeStatus()
		slot0:checkSourceTipsStatus()
	end
end

function EquipmakeMainWindow.updateEquipList(slot0)
	if not slot0.equip_list then
		return
	end

	for slot4, slot5 in pairs(slot0.equip_list) do
		if slot5.item then
			slot5.item:setData()

			if slot5.item.empty_icon then
				slot5.item.empty_icon:setVisible(true)
			end
		end

		slot5.vo = nil
	end

	slot2 = nil

	for slot6, slot7 in pairs(slot0.data.eqm_list) do
		if slot7 and slot7.type and slot7.config and slot7.config.quality and slot7.config.quality == BackPackConst.quality.orange and slot0.equip_list[slot7.type] and slot2.item then
			slot2.item:setData(slot7)

			if slot2.item.empty_icon then
				slot2.item.empty_icon:setVisible(false)
			end

			slot2.vo = slot7
		end
	end
end

function EquipmakeMainWindow.checkCanUpgradeStatus(slot0)
	if slot0.data == nil then
		return
	end

	slot1 = slot0.data.lev
	slot2 = Config.ItemData.data_assets_id2label
	slot3 = Config.PartnerEqmData.data_eqm_compose_id

	for slot7, slot8 in pairs(slot0.equip_list) do
		slot9 = slot8.vo

		if nil == nil then
			if slot8.item then
				slot8.item:showNoticeTips(false)
			end
		elseif slot9 == nil or slot9.config == nil then
			slot11 = true

			for slot15, slot16 in ipairs(slot10.expend or {}) do
				if not slot0:checkEnough(slot16[1], slot16[2]) then
					slot11 = false

					break
				end
			end

			slot8.item:showNoticeTips(slot11, 1)
		elseif slot3[slot9.config.id] then
			if slot11.next_id == 0 then
				slot8.item:showNoticeTips(false)
			elseif slot1 < slot3[slot11.next_id].lev then
				slot8.item:showNoticeTips(false)
			else
				slot13 = true

				for slot17, slot18 in ipairs(slot11.expend2 or {}) do
					if not slot0:checkEnough(slot18[1], slot18[2]) then
						slot13 = false

						break
					end
				end

				slot8.item:showNoticeTips(slot13, 2)
			end
		end
	end
end

function EquipmakeMainWindow.checkEnough(slot0, slot1, slot2)
	if slot1 == nil or slot2 == nil then
		return false
	end

	slot5 = 0

	return slot2 <= ((not Config.ItemData.data_assets_id2label[slot1] or uv0[slot4]) and uv1:getBackPackItemNumByBid(slot1))
end

function EquipmakeMainWindow.checkSourceTipsStatus(slot0)
	if uv0:getBagGoldEquipList() == nil or next(slot1) == nil then
		slot0.source_tips:setVisible(false)
	else
		slot0.source_tips:setVisible(true)
	end
end

function EquipmakeMainWindow.close_callback(slot0)
	if slot0.base_equip then
		slot0.base_equip:DeleteMe()
	end

	slot0.base_equip = nil

	if slot0.upgrade_equip then
		slot0.upgrade_equip:DeleteMe()
	end

	slot0.upgrade_equip = nil

	if slot0.update_equip_make_event then
		GlobalEvent:getInstance():UnBind(slot0.update_equip_make_event)

		slot0.update_equip_make_event = nil
	end

	if slot0.update_sell_orange_event then
		GlobalEvent:getInstance():UnBind(slot0.update_sell_orange_event)

		slot0.update_sell_orange_event = nil
	end

	if uv0 and slot0.role_lev_event then
		uv0:UnBind(slot0.role_lev_event)

		slot0.role_lev_event = nil
	end

	for slot4, slot5 in pairs(slot0.equip_list) do
		if slot5.item then
			slot5.item:DeleteMe()
		end
	end

	slot0.equip_list = nil

	for slot4, slot5 in ipairs(slot0.fight_container_list) do
		if slot5.value then
			slot5.value:DeleteMe()
		end
	end

	slot0.fight_container_list = nil

	for slot4, slot5 in ipairs(slot0.fight_container_pool) do
		if slot5.value then
			slot5.value:DeleteMe()
		end
	end

	slot0.fight_container_pool = nil

	uv1:openEquipmakeMainWindow(false)
end
