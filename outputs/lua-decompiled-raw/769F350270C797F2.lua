HeroMainTabEquipPanel = class("HeroMainTabEquipPanel", function ()
	return ccui.Widget:create()
end)
slot0 = string.format
slot2 = HeroController:getInstance():getModel()
slot3 = table.insert
slot4 = RoleController:getInstance():getRoleVo()

function HeroMainTabEquipPanel.ctor(slot0, slot1)
	slot0:config()
	slot0:layoutUI(slot1)
	slot0:registerEvents()
end

function HeroMainTabEquipPanel.config(slot0)
	slot0.equip_item_list = {}
	slot0.equip_type_list = HeroConst.EquipPosList
	slot0.equip_icon_name_list = {
		[6.0] = "hero_info_11",
		[5.0] = "hero_info_11",
		[BackPackConst.item_type.WEAPON] = "hero_info_7",
		[BackPackConst.item_type.SHOE] = "hero_info_10",
		[BackPackConst.item_type.CLOTHES] = "hero_info_9",
		[BackPackConst.item_type.HAT] = "hero_info_8"
	}
	slot0.artifact_lock_list = uv0.artifact_lock_list
end

function HeroMainTabEquipPanel.layoutUI(slot0, slot1)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("hero/hero_main_tab_equip_panel"))

	slot0:addChild(slot0.root_wnd)

	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)

	slot6 = "tab_panel"
	slot0.tab_panel = slot0.root_wnd:getChildByName(slot6)
	slot0.equip_node_list = {}

	for slot6 = 1, 6 do
		slot0.equip_node_list[slot6] = slot0.tab_panel:getChildByName("equip_node" .. slot6)
		slot8 = BackPackItem.new(false, true, nil, 0.8, false)

		slot8:setName("guidesign_equip_item_" .. slot6)
		slot0.equip_node_list[slot6]:addChild(slot8, 1)
		slot8:setPosition(cc.p(0, 0))
		slot8:addCallBack(function ()
			uv0:selectEquipByIndex(uv1)
		end)

		slot8.empty_icon = createImage(slot8:getRoot(), PathTool.getResFrame("hero", slot0.equip_icon_name_list[slot0.equip_type_list[slot6] or slot6]), 60, 60, cc.p(0.5, 0.5), true, 10, false)

		if slot6 >= 5 then
			-- Nothing
		end

		slot0.equip_item_list[slot7] = slot8
	end

	slot0.img_lock = {}
	slot0.lab_lock = {}
	slot0.img_box = {}
	slot0.img_bg = {}
	slot0.img_lock[1] = slot0.tab_panel:getChildByName("img_lock5")

	slot0.img_lock[1]:setScale(0.8)

	slot0.lab_lock[1] = slot0.tab_panel:getChildByName("lab_lock5")

	slot0.lab_lock[1]:setScale(0.8)

	slot0.img_box[1] = slot0.tab_panel:getChildByName("artifacts_bg_1")

	slot0.img_box[1]:setScale(0.9)

	slot0.img_bg[1] = slot0.tab_panel:getChildByName("equip_node5"):getChildByName("box_34")

	slot0.img_bg[1]:setScale(0.9)

	slot0.img_lock[2] = slot0.tab_panel:getChildByName("img_lock6")

	slot0.img_lock[2]:setScale(0.8)

	slot0.lab_lock[2] = slot0.tab_panel:getChildByName("lab_lock6")

	slot0.lab_lock[2]:setScale(0.8)

	slot0.img_box[2] = slot0.tab_panel:getChildByName("artifacts_bg_2")

	slot0.img_box[2]:setScale(0.9)

	slot0.img_bg[2] = slot0.tab_panel:getChildByName("equip_node6"):getChildByName("box_34")

	slot0.img_bg[2]:setScale(0.9)

	slot0.key_up_btn = slot0.tab_panel:getChildByName("key_up_btn")

	slot0.key_up_btn:getChildByName("label"):setString(TI18N("一键穿戴"))

	slot0.discharge_btn = slot0.tab_panel:getChildByName("discharge_btn")

	slot0.discharge_btn:getChildByName("label"):setString(TI18N("一键卸下"))
end

function HeroMainTabEquipPanel.registerEvents(slot0)
	registerButtonEventListener(slot0.key_up_btn, function ()
		uv0:onClickKeyUpBtn()
	end, true)
	registerButtonEventListener(slot0.discharge_btn, function ()
		uv0:onClickDischargeBtn()
	end, true)

	if slot0.hero_data_update_event == nil then
		slot0.hero_data_update_event = GlobalEvent:getInstance():Bind(HeroEvent.Hero_Data_Update, function (slot0)
			if not slot0 or not uv0.hero_vo then
				return
			end

			if slot0.partner_id == uv0.hero_vo.partner_id then
				uv0:updateArtifactInfo(uv0.hero_vo)
			end
		end)
	end

	if slot0.hero_equip_update_event == nil then
		slot0.hero_equip_update_event = GlobalEvent:getInstance():Bind(HeroEvent.Equip_Update_Event, function ()
			if not uv0.hero_vo then
				return
			end

			uv0:updateInfo(uv0.hero_vo)
			uv0:updateOneKeyBtnStatus()
		end)
	end

	if slot0.hero_equip_redpoint_event == nil then
		slot0.hero_equip_redpoint_event = GlobalEvent:getInstance():Bind(HeroEvent.Equip_RedPoint_Event, function ()
			if not uv0.hero_vo then
				return
			end

			uv0:updateRedPoint()
			uv0:updateOneKeyBtnStatus()
		end)
	end

	if not slot0.update_artifact_event then
		slot0.update_artifact_event = GlobalEvent:getInstance():Bind(HeroEvent.Artifact_Update_Event, function (slot0)
			if not uv0.hero_vo then
				return
			end

			uv0:updateArtifactInfo(uv0.hero_vo)
		end)
	end
end

function HeroMainTabEquipPanel.updateOneKeyBtnStatus(slot0)
	if slot0.hero_vo and slot0.hero_vo.eqm_list and not slot0.is_btn_redpoint and tableLen(slot0.hero_vo.eqm_list) <= 0 then
		-- Nothing
	end
end

function HeroMainTabEquipPanel.onClickKeyUpBtn(slot0)
	if not slot0.hero_vo then
		return
	end

	uv0:sender11010(slot0.hero_vo.partner_id, 0)
end

function HeroMainTabEquipPanel.onClickDischargeBtn(slot0)
	if not slot0.hero_vo then
		return
	end

	uv0:sender11011(slot0.hero_vo.partner_id, 0)
end

function HeroMainTabEquipPanel.selectEquipByIndex(slot0, slot1)
	if not slot0.hero_vo then
		return
	end

	if slot1 == 5 or slot1 == 6 then
		if slot0.hero_vo.artifact_list[slot1 - 4] == nil and slot0.artifact_lock_list[slot2] then
			if slot4[1] == "lev" then
				if slot0.hero_vo.lev < slot4[2] then
					message(uv0(TI18N("英雄%s级解锁"), slot4[2]))

					return
				end
			elseif slot4[1] == "star" and slot0.hero_vo.star < slot4[2] then
				message(uv0(TI18N("英雄%s星解锁"), slot4[2]))

				return
			end
		end

		if slot3 and next(slot3) ~= nil then
			uv1:openArtifactTipsWindow(true, slot3, PartnerConst.ArtifactTips.partner, slot0.hero_vo.partner_id, slot2, slot0.lock_list[slot2])
		else
			uv1:openArtifactListWindow(true, slot2, slot0.hero_vo.partner_id)
		end
	elseif uv2:getHeroEquipList(slot0.hero_vo.partner_id)[slot1] ~= nil then
		uv1:openEquipTips(true, slot4, PartnerConst.EqmTips.partner, slot0.hero_vo)
	else
		uv1:openEquipPanel(true, slot2, slot0.hero_vo.partner_id)
	end
end

function HeroMainTabEquipPanel.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.hero_vo = slot1

	slot0:updateInfo(slot1)
	slot0:updateRedPoint()
	slot0:updateOneKeyBtnStatus()
end

function HeroMainTabEquipPanel.updateRedPoint(slot0)
	for slot5, slot6 in ipairs(slot0.equip_type_list) do
		slot1 = false or slot0:updateEachEquipRedPoint(slot6)
	end

	if slot1 then
		addRedPointToNodeByStatus(slot0.key_up_btn, slot1, 5, 5)
	else
		addRedPointToNodeByStatus(slot0.key_up_btn, slot1, 5, 5)
	end

	slot0.is_btn_redpoint = slot1
end

function HeroMainTabEquipPanel.updateArtifactRedPoint(slot0)
	if slot0.lock_list then
		for slot4, slot5 in ipairs(slot0.artifact_lock_list) do
			if not slot0.lock_list[slot4] then
				slot8 = slot0.equip_item_list[slot4 + 4]

				addRedPointToNodeByStatus(slot0.img_box[slot4], HeroCalculate.checkSingleArtifactRedPoint(slot0.hero_vo.artifact_list[slot4]), -1, -10)

				if slot0.img_box[slot4].red_point then
					slot0.img_box[slot4].red_point:setScale(0.8421052631578947)
				end
			else
				addRedPointToNodeByStatus(slot0.img_box[slot4], false)
			end
		end
	end
end

function HeroMainTabEquipPanel.updateEachEquipRedPoint(slot0, slot1)
	slot4 = HeroCalculate.checkSingleHeroEachPosEquipRedPoint(slot1, uv0:getHeroEquipList(slot0.hero_vo.partner_id)[slot1])

	slot0.equip_item_list[slot1]:showRedPoint(slot4)

	return slot4
end

function HeroMainTabEquipPanel.updateInfo(slot0, slot1)
	if not slot1 then
		return
	end

	for slot6, slot7 in ipairs(slot0.equip_type_list) do
		slot9 = slot0.equip_item_list[slot7]

		if uv0:getHeroEquipList(slot1.partner_id)[slot7] then
			slot9:setData(slot8)

			if slot9.empty_icon then
				slot9.empty_icon:setVisible(false)
			end

			slot9.equip_vo = slot8
		else
			slot9:setData()

			if slot9.empty_icon then
				slot9.empty_icon:setVisible(true)
			end

			slot9.equip_vo = nil

			slot9:setBackgroundRes(PathTool.getResFrame("hero", "hero_info_32"))
		end
	end

	slot0:updateArtifactInfo(slot1)
end

function HeroMainTabEquipPanel.updateArtifactInfo(slot0, slot1)
	slot0.lock_list = {}

	for slot5, slot6 in ipairs(slot0.artifact_lock_list) do
		slot0.img_lock[slot5]:setVisible(false)
		slot0.lab_lock[slot5]:setVisible(true)
		slot0.lab_lock[slot5]:setString("")

		slot7 = true
		slot8 = slot0.equip_item_list[slot5 + 4]

		if slot6[1] == "lev" then
			if slot6[2] <= slot1.lev then
				slot7 = false

				slot0.img_box[slot5]:setVisible(true)
				slot0.img_bg[slot5]:setVisible(true)

				if slot8 then
					slot8:setVisible(true)
				end
			elseif Config.PartnerData.data_partner_max_lev[slot0.hero_vo.bid] and slot6[2] <= slot9 then
				slot0.img_lock[slot5]:setVisible(true)
				slot0.img_box[slot5]:setVisible(true)
				slot0.img_bg[slot5]:setVisible(true)

				if slot8 then
					slot8:setVisible(true)
				end

				slot0.lab_lock[slot5]:setString(slot6[2] .. TI18N("级解锁"))
			else
				slot0.img_box[slot5]:setVisible(false)
				slot0.img_bg[slot5]:setVisible(false)

				if slot8 then
					slot8:setVisible(false)
				end
			end
		elseif slot6[1] == "star" then
			if Config.PartnerData.data_partner_max_star[slot0.hero_vo.bid] and slot9 < slot6[2] then
				slot0.img_box[slot5]:setVisible(false)
				slot0.img_bg[slot5]:setVisible(false)

				if slot8 then
					slot8:setVisible(false)
				end
			else
				slot0.img_box[slot5]:setVisible(true)
				slot0.img_bg[slot5]:setVisible(true)

				if slot0.img_box[slot5].red_point then
					slot0.img_box[slot5].red_point:setVisible(false)
				end

				if slot8 then
					slot8:setVisible(true)
				end

				if slot6[2] <= slot1.star then
					slot7 = false
				else
					slot0.img_lock[slot5]:setVisible(true)
					slot0.lab_lock[slot5]:setString(slot6[2] .. TI18N("星解锁"))
				end
			end
		end

		slot0.lock_list[slot5] = slot7
	end

	if slot1.artifact_list then
		for slot5 = 1, 2 do
			slot6 = slot0.equip_item_list[slot5 + 4]

			if slot1.artifact_list[slot5] then
				slot6:setData(slot7)

				if slot6.empty_icon then
					slot6.empty_icon:setVisible(false)
				end

				slot6.equip_vo = slot7

				slot0.img_lock[slot5]:setVisible(false)
				slot0.lab_lock[slot5]:setVisible(false)
				slot6:setBackgroundOpacity(255)
			else
				slot6:setData()

				if slot6.empty_icon then
					slot6.empty_icon:setVisible(true)
				end

				slot6:setBackgroundOpacity(0)

				slot6.equip_vo = nil
			end
		end
	end

	slot0:updateArtifactRedPoint()
end

function HeroMainTabEquipPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function HeroMainTabEquipPanel.DeleteMe(slot0)
	if slot0.hero_data_update_event then
		GlobalEvent:getInstance():UnBind(slot0.hero_data_update_event)

		slot0.hero_data_update_event = nil
	end

	if slot0.hero_equip_update_event then
		GlobalEvent:getInstance():UnBind(slot0.hero_equip_update_event)

		slot0.hero_equip_update_event = nil
	end

	if slot0.hero_equip_redpoint_event then
		GlobalEvent:getInstance():UnBind(slot0.hero_equip_redpoint_event)

		slot0.hero_equip_redpoint_event = nil
	end

	if slot0.update_artifact_event then
		GlobalEvent:getInstance():UnBind(slot0.update_artifact_event)

		slot0.update_artifact_event = nil
	end
end
