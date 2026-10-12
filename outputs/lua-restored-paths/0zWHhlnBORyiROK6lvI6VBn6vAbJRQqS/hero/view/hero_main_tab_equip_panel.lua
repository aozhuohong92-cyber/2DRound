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
	slot0.cur_soul_weapon_status = {}
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
				uv0:updateHorcruxInfo(uv0.hero_vo)
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

	if not slot0.soul_weapon_update then
		slot0.soul_weapon_update = GlobalEvent:getInstance():Bind(HeroEvent.SOUL_WEAPON_UPDATA_STATE, function (slot0)
			if not uv0.hero_vo then
				return
			end

			uv0.hero_vo.exclusive_lev = slot0.lev
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
	slot0:updateHorcruxInfo(slot1)
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

function HeroMainTabEquipPanel.updateHorcruxInfo(slot0, slot1)
	if not slot1 then
		return
	end

	if uv0:getModel():getIsShowHorcrux(slot1.bid) then
		slot3 = {
			bid = slot1.bid,
			horcrux_status = slot1.horcrux_status,
			horcrux_lev = slot1.horcrux_lev,
			star = slot1.star,
			link_horcrux_lev = 0,
			partner_id = slot1.partner_id
		}

		if slot1.link_id and slot1.link_id ~= 0 and uv1:getHeroById(slot1.link_id) then
			slot0.horcrux_data.link_horcrux_lev = slot4.horcrux_lev or 0
		end

		if not slot0.horcrux_item then
			slot0.horcrux_item = HorcruxItem.new(true, 0.8, false, false)

			slot0.tab_panel:addChild(slot0.horcrux_item)
			slot0.horcrux_item:setPosition(cc.p(156, 61))
			slot0.horcrux_item:addCallBack(function ()
				if not uv0.horcrux_item:getData() then
					return
				end

				if slot0.horcrux_status and slot0.horcrux_status == 1 then
					uv1:openHorcruxTipsPanel(true, slot0, PartnerConst.HorcruxTips.normal)
				else
					uv1:openHorcruxActivatePanel(true, slot0)
				end
			end)
		end

		slot0.horcrux_item:setData(slot3)
		slot0.horcrux_item:setVisible(true)
	elseif slot0.horcrux_item then
		slot0.horcrux_item:setVisible(false)
	end
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

	if slot0.soul_weapon_update then
		GlobalEvent:getInstance():UnBind(slot0.soul_weapon_update)

		slot0.soul_weapon_update = nil
	end
end

function HeroMainTabEquipPanel.updataSoulWeaponConfig(slot0)
	slot0.soulWeapon = slot0.tab_panel:getChildByName("soulWeapon")
	slot0.soulWeapon_mask = slot0.soulWeapon:getChildByName("mask")
	slot0.soulWeapon_item = slot0.soulWeapon:getChildByName("item_layout")
	slot0.soulWeapon_level_bg = slot0.soulWeapon:getChildByName("level_bg")
	slot0.soulWeapon_level = slot0.soulWeapon_level_bg:getChildByName("level")

	slot0.soulWeapon_level_bg:setVisible(false)
	slot0.soulWeapon:setVisible(false)

	if not slot0.soulWeapon_effect then
		slot0.soulWeapon_effect = createEffectSpine("E50104", cc.p(45, 45), cc.p(0.5, 0.5), true, "action1")

		slot0.soulWeapon_effect:setVisible(false)
		slot0.soulWeapon:addChild(slot0.soulWeapon_effect)
	end

	slot1 = Config.PartnerExclusiveData
	slot0.role_vo = RoleController:getInstance():getRoleVo()

	if slot0.hero_vo.exclusive_lev == nil then
		return
	end

	slot3 = false

	print("【个人等级】", slot0.role_vo.lev)
	print("【世界等级】", RoleController:getInstance():getModel():getWorldLev())

	if slot1.data_const.exclusive_open_lev.val <= slot0.role_vo.lev or slot1.data_const.exclusive_open_world_lev.val <= slot2 then
		slot3 = true
	end

	if slot3 == false then
		return
	end

	slot4 = nil

	for slot8, slot9 in pairs(slot1.data_exclusive_info) do
		if slot9.parnter_bid == slot0.hero_vo.bid then
			slot0.soulWeapon:setVisible(true)

			slot4 = slot9
		end
	end

	if slot4 == nil then
		return
	end

	slot0.soulWeapon_item:setBackGroundImage(PathTool.getResFrame("common", "common_1010"), LOADTEXT_TYPE_PLIST)

	slot6 = slot0.soulWeapon_item:getChildByName("Image_3")

	slot6:setContentSize(cc.size(95, 95))
	slot6:loadTexture(PathTool.getItemRes(slot4.exclusive_id, false), LOADTEXT_TYPE)

	if ({
		score = 0,
		pre_star = 12,
		weapon_name = slot4.name,
		hero_name = slot0.hero_vo.name,
		hero_star = slot0.hero_vo.star,
		hero_id = slot0.hero_vo.partner_id,
		weapon_id = slot4.exclusive_id,
		weapon_lev = slot0.hero_vo.exclusive_lev or 1,
		icon_res = slot5,
		desc = slot4.desc,
		attr = {},
		strengthen_skills = {},
		status = HeroConst.soulWeapon.status.lock
	}).weapon_lev == 0 then
		slot7.weapon_lev = 1
	end

	slot11 = slot7.weapon_lev

	slot0.soulWeapon_level:setString(slot11)

	for slot11, slot12 in pairs(slot1.data_exclusive_upgrade_info) do
		if slot7.weapon_id == slot12.exclusive_id and slot7.weapon_lev == slot12.lev then
			slot7.attr = slot12.base_attr
			slot7.score = slot12.score
			slot7.pre_star = slot12.pre_star
			slot7.strengthen_skills = slot12.strengthen_skills
		end
	end

	slot7.next_pre_star = 0

	if slot1.data_exclusive_upgrade_info[slot7.weapon_id .. "_" .. slot7.weapon_lev + 1] then
		slot7.next_pre_star = slot8.pre_star
	end

	slot9 = HeroConst.soulWeapon.status.lock
	slot10 = false

	slot0.soulWeapon_mask:setVisible(true)
	slot0.soulWeapon_effect:setVisible(false)

	if slot7.pre_star <= slot0.hero_vo.star then
		slot9 = HeroConst.soulWeapon.status.awake

		if slot0.hero_vo.exclusive_lev > 0 then
			slot10 = true
		end

		if slot10 then
			slot0.soulWeapon_level_bg:setVisible(true)
			slot0.soulWeapon_mask:setVisible(false)
			slot0.soulWeapon_effect:setVisible(true)

			slot9 = HeroConst.soulWeapon.status.strengthen
		end
	end

	slot7.status = slot9
	slot0.soul_weapon_setting = {
		cur_status = slot9
	}

	slot0.soulWeapon_mask:addTouchEventListener(function (slot0, slot1)
		if ccui.TouchEventType.ended == slot1 then
			uv0:openSoulWeaponPanel(true, uv1)
		end
	end)
	slot0.soulWeapon_item:addTouchEventListener(function (slot0, slot1)
		if ccui.TouchEventType.ended == slot1 then
			uv0:openSoulWeaponPanel(true, uv1)
		end
	end)
end
