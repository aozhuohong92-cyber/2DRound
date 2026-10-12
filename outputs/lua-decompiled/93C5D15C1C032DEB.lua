HalidomMainPanel = class("HalidomMainPanel", function ()
	return ccui.Layout:create()
end)
slot1 = HalidomController:getInstance():getModel()
slot2 = table.insert
slot3 = table.sort
slot4 = string.format

function HalidomMainPanel.ctor(slot0, slot1)
	slot0.select_callback = slot1
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("hero/hero_halidom_panle"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.cur_tab_index = HalidomConst.Tab_Index.Lvup
	slot0.cur_view_status = HalidomConst.View_Status.Lock
	slot0.halidom_list = {}
	slot0.cur_halidom = {}
	slot0.tab_list = {}
	slot0.lvup_cost_list = {}
	slot0.all_attr_list = {}
	slot0.base_attr_list = {}
	slot0.lock_cost_hero_data = {}
	slot0.step_cost_bid = 0
	slot0.step_cost_num = 0
	slot0.step_icon_list = {}
	slot0.step_cost_hero_data = {}
	slot0.step_hero_list = {}
	slot0.step_limit_tips = ""
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot2 = {}

	uv0(slot2, {
		path = PathTool.getPlistImgForDownLoad("halidom", "halidom"),
		type = ResourcesType.plist
	})
	uv0(slot2, {
		path = PathTool.getPlistImgForDownLoad("bigbg/haildom", "haildom_bg_1"),
		type = ResourcesType.single
	})

	if slot0.init_res_load then
		slot0.init_res_load:DeleteMe()

		slot0.init_res_load = nil
	end

	slot0.init_res_load = ResourcesLoad.New()

	slot0.init_res_load:addAllList(slot2, function ()
		uv0:loadResListCompleted()
	end)
end

function HalidomMainPanel.loadResListCompleted(slot0)
	slot0:initView()
	slot0:initHalidomData()
	slot0:registerEvent()
	uv0:sender22200()
end

function HalidomMainPanel.initView(slot0)
	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.pos_node = slot0.container:getChildByName("pos_node")
	slot0.name_txt = slot0.container:getChildByName("name_txt")
	slot0.explain_btn = slot0.container:getChildByName("explain_btn")
	slot0.left_btn = slot0.container:getChildByName("left_btn")
	slot0.right_btn = slot0.container:getChildByName("right_btn")

	for slot5 = 1, 2 do
		slot6 = {}

		if slot0.container:getChildByName("tab_container"):getChildByName("tab_btn_" .. slot5) then
			slot7:loadTextures(PathTool.getResFrame("common", "common_90030"), "", "", LOADTEXT_TYPE_PLIST)
			slot7:getChildByName("title"):setTextColor(cc.c3b(215, 226, 227))

			if slot5 == 1 then
				slot8:setString(TI18N("注能"))
			elseif slot5 == 2 then
				slot8:setString(TI18N("进阶"))
			end

			slot6.tab_btn = slot7
			slot6.label = slot8
			slot6.index = slot5
			slot6.tips = slot7:getChildByName("tips")
			slot0.tab_list[slot5] = slot6
		end
	end

	slot0.lock_panel = slot0.container:getChildByName("lock_panel")
	slot0.lock_desc_txt = slot0.lock_panel:getChildByName("lock_desc_txt")

	UITool.SetDarkColor(slot0.lock_desc_txt)

	slot0.unlock_btn = slot0.lock_panel:getChildByName("unlock_btn")

	slot0.unlock_btn:getChildByName("label"):setString(TI18N("解锁"))
	UITool.SetTitleColor(slot0.unlock_btn:getChildByName("label"))

	slot0.open_panel = slot0.container:getChildByName("open_panel")
	slot0.attr_tips = slot0.open_panel:getChildByName("attr_tips")
	slot0.memoir_btn = slot0.open_panel:getChildByName("memoir_btn")

	slot0.memoir_btn:setVisible(false)

	slot0.lvup_panel = slot0.open_panel:getChildByName("lvup_panel")

	slot0.lvup_panel:getChildByName("attr_title"):setString(TI18N("基础属性:"))
	slot0.lvup_panel:getChildByName("lv_title"):setString(TI18N("信念等级:"))

	slot0.lv_txt = slot0.lvup_panel:getChildByName("lv_txt")
	slot0.max_lv_bg = slot0.lvup_panel:getChildByName("max_lv_bg")

	slot0.max_lv_bg:getChildByName("label"):setString(TI18N("已达等级上限"))

	slot2 = slot0.lvup_panel:getChildByName("progress_bg")
	slot0.lvup_progress = slot2:getChildByName("progress")

	slot0.lvup_progress:setScale9Enabled(true)
	slot0.lvup_progress:setPercent(0)

	slot0.progress_value = slot2:getChildByName("progress_value")

	slot0.progress_value:setString("0/0")

	slot0.zhuneng_title = slot0.lvup_panel:getChildByName("zhuneng_title")
	slot6 = TI18N

	slot0.zhuneng_title:setString(slot6("注能消耗:"))

	for slot6 = 1, 2 do
		if slot0.lvup_panel:getChildByName("lvup_cost_bg_" .. slot6) then
			uv0(slot0.lvup_cost_list, {
				cost_bg = slot7,
				res_icon = slot7:getChildByName("res_icon"),
				label = slot7:getChildByName("label")
			})
		end
	end

	slot0.lvup_btn = slot0.lvup_panel:getChildByName("lvup_btn")

	slot0.lvup_btn:getChildByName("label"):setString(TI18N("注能"))

	slot0.lvup_btn_tips = slot0.lvup_btn:getChildByName("tips")

	UITool.SetDarkColor(slot0.lvup_panel:getChildByName("attr_title"))
	UITool.SetDarkColor(slot0.lvup_panel:getChildByName("lv_title"))
	UITool.SetDarkColor(slot0.lv_txt)
	UITool.SetDarkColor(slot0.max_lv_bg:getChildByName("label"))
	UITool.SetDarkColor(slot0.zhuneng_title)

	slot0.step_panel = slot0.open_panel:getChildByName("step_panel")

	slot0.step_panel:getChildByName("step_title"):setString(TI18N("进阶:"))

	slot0.max_step_bg = slot0.step_panel:getChildByName("max_step_bg")

	slot0.max_step_bg:getChildByName("label"):setString(TI18N("该信念已达最大阶数"))

	slot0.step_cost_bg = slot0.step_panel:getChildByName("step_cost_bg")
	slot0.step_cost_icon = slot0.step_cost_bg:getChildByName("res_icon")
	slot0.step_cost_label = slot0.step_cost_bg:getChildByName("label")
	slot0.step_btn = slot0.step_panel:getChildByName("step_btn")

	slot0.step_btn:getChildByName("label"):setString(TI18N("进阶"))

	slot0.step_btn_tips = slot0.step_btn:getChildByName("tips")
	slot0.step_limit_lv_bg = slot0.step_panel:getChildByName("step_limit_lv_bg")
	slot0.step_limit_label = slot0.step_limit_lv_bg:getChildByName("label")
	slot0.step_arrow = slot0.step_panel:getChildByName("step_arrow")
	slot0.btn_step_pre = slot0.step_panel:getChildByName("btn_step_pre")
end

function HalidomMainPanel.setData(slot0)
	slot0.cur_halidom_index = slot0.cur_halidom_index or slot0:getDefaultHalidomIndex()

	slot0:selectHalidomByIndex(slot0.cur_halidom_index, true)
	slot0:updateTabInfo()
	slot0:updateViewShow()
end

function HalidomMainPanel.selectHalidomByIndex(slot0, slot1, slot2, slot3)
	if slot0.cur_halidom_index == slot1 and not slot2 then
		return
	end

	slot0.cur_halidom_index = slot1
	slot0.cur_halidom = slot0.halidom_list[slot0.cur_halidom_index]

	if not slot0.cur_halidom then
		return
	end

	slot0.init_lvup_flag = false
	slot0.init_step_flag = false

	if uv0:checkHalidomIsUnlock(slot0.cur_halidom.id) then
		slot0.cur_view_status = HalidomConst.View_Status.Unlock
	else
		slot0.cur_view_status = HalidomConst.View_Status.Lock
	end

	slot0:updateViewShow()
	slot0:updateTabInfo()
	slot0:updateHalidomBaseInfo()
	slot0:changeSelectedTab(slot3 or HalidomConst.Tab_Index.Lvup, true)
	slot0:updateTabRedStatus()

	if slot0.select_callback then
		slot0.select_callback(slot0.cur_halidom.camp)
	end
end

function HalidomMainPanel.choseHalidomByCamp(slot0, slot1)
	slot2 = 1

	for slot6, slot7 in ipairs(slot0.halidom_list) do
		if slot7.camp == slot1 then
			slot2 = slot6

			break
		end
	end

	slot0:selectHalidomByIndex(slot2)
end

function HalidomMainPanel.initHalidomData(slot0)
	slot0.halidom_list = {}

	for slot4, slot5 in pairs(Config.HalidomData.data_base) do
		slot6 = deepCopy(slot5)
		slot6.vo = uv0:getHalidomDataById(slot5.id)

		uv1(slot0.halidom_list, slot6)
	end

	uv2(slot0.halidom_list, function (slot0, slot1)
		return slot0.id < slot1.id
	end)
end

function HalidomMainPanel.updateHalidomData(slot0)
	for slot4, slot5 in pairs(slot0.halidom_list) do
		slot5.vo = uv0:getHalidomDataById(slot5.id)
	end
end

function HalidomMainPanel.updateHalidomBaseInfo(slot0)
	if not slot0.cur_halidom then
		return
	end

	slot1 = PlayerAction.action_1
	slot1 = (slot0.cur_view_status ~= HalidomConst.View_Status.Lock or PlayerAction.action_1) and PlayerAction.action_2

	if slot0.cur_halidom.effect_id and slot0.cur_halidom_effect_id ~= slot0.cur_halidom.effect_id then
		slot0.cur_halidom_effect_id = slot0.cur_halidom.effect_id

		if slot0.halidom_model then
			slot0.halidom_model:clearTracks()
			slot0.halidom_model:removeFromParent()

			slot0.halidom_model = nil
		end

		slot0.halidom_model = createEffectSpine(PathTool.getEffectRes(slot0.cur_halidom_effect_id), cc.p(0, 0), cc.p(0.5, 0.5), true, slot1)

		slot0.pos_node:addChild(slot0.halidom_model)
	end

	if slot0.halidom_model then
		slot0.halidom_model:setAnimation(0, slot1, true)
	end

	if slot0.cur_view_status == HalidomConst.View_Status.Lock then
		if slot0.halidom_model then
			setChildUnEnabled(true, slot0.halidom_model)
		end

		slot0.name_txt:setString(slot0.cur_halidom.name)
		slot0.lock_desc_txt:setString(slot0.cur_halidom.desc)

		if not slot0.lock_tips then
			slot0.lock_tips = createRichLabel(24, cc.c4b(3, 35, 55, 255), cc.p(0.5, 0.5), cc.p(360, 230), nil, nil, 590)

			slot0.lock_panel:addChild(slot0.lock_tips)
		end

		slot0.lock_tips:setString(slot0.cur_halidom.lock_desc)

		if slot0.cur_halidom.loss[1] then
			slot0.lock_cost_hero_data = {
				bid = 0,
				camp_type = slot2[1],
				star = slot2[2] or 0,
				count = slot2[3] or 0,
				lev = uv0("%s/%s", 0, slot2[3] or 0),
				dic_select_list = {}
			}

			if not slot0.lock_loss_item then
				slot0.lock_loss_item = HeroExhibitionItem.new(0.7, true)

				slot0.lock_panel:addChild(slot0.lock_loss_item)
				slot0.lock_loss_item:setPosition(cc.p(175, 125))
				slot0.lock_loss_item:addCallBack(function ()
					HeroController:getInstance():openHeroUpgradeStarSelectPanel(true, uv0.lock_cost_hero_data, {}, HeroConst.SelectHeroType.eHalidom)
				end)
			end

			slot0.lock_loss_item:setData(slot0.lock_cost_hero_data)
			slot0.lock_loss_item:setDefaultHead(HeroController:getInstance():getModel():getRandomHeroHeadByQuality(slot0.lock_cost_hero_data.star))
			slot0.lock_loss_item:setHeadUnEnabled(true)
		end

		slot0:updateHalidomRedStatus()
	else
		if slot0.halidom_model then
			setChildUnEnabled(false, slot0.halidom_model)
		end

		slot0.name_txt:setString(slot0.cur_halidom.name .. "Lv." .. (slot0.cur_halidom.vo.lev or 1))
		slot0.attr_tips:setString(uv0(TI18N("%s系英雄属性加成:"), HeroConst.CampName[slot0.cur_halidom.camp]))

		for slot6, slot7 in pairs(slot0.all_attr_list) do
			slot7:setVisible(false)
		end

		if slot0.cur_halidom.vo then
			slot4 = HalidomConst.Attr_Pos_X[#(slot0.cur_halidom.vo.all_attr or {})]

			for slot8, slot9 in ipairs(slot0.cur_halidom.vo.all_attr or {}) do
				slot12 = slot9.val or 0

				if Config.AttrData.data_key_to_name[Config.AttrData.data_id_to_key[slot9.name]] then
					if slot0.all_attr_list[slot8] == nil then
						slot14 = createRichLabel(24, cc.c4b(105, 55, 5, 255), cc.p(0.5, 0.5), cc.p(20, 28), nil, nil, 380)

						slot0.open_panel:addChild(slot14)

						slot0.all_attr_list[slot8] = slot14
					end

					slot14:setPosition(cc.p(slot4[slot8] or 360, 475))
					slot14:setVisible(true)

					slot16 = PathTool.getAttrIconByStr(slot11)

					if PartnerCalculate.isShowPerByStr(slot11) == true then
						slot12 = slot12 / 10 .. "%"
					end

					slot14:setString(uv0("<img src='%s' scale=1 /> <div fontcolor=#0F5BCE> %s：</div><div fontcolor=#289b14>%s</div>", PathTool.getResFrame("common", slot16), slot13, tostring(slot12)))
				end
			end
		end
	end
end

function HalidomMainPanel.updateLvupInfo(slot0, slot1)
	if not slot0.cur_halidom then
		return
	end

	if not Config.HalidomData.data_lvup[slot0.cur_halidom.id] then
		return
	end

	if not slot2[slot0.cur_halidom.vo.lev] then
		return
	end

	for slot7, slot8 in pairs(slot0.base_attr_list) do
		slot8:setVisible(false)
	end

	if slot3.attr then
		for slot7, slot8 in ipairs(slot3.attr) do
			slot10 = slot8[2] or 0

			if Config.AttrData.data_key_to_name[slot8[1]] then
				if slot0.base_attr_list[slot7] == nil then
					slot12 = createRichLabel(24, cc.c4b(105, 55, 5, 255), cc.p(0.5, 0.5), cc.p(20, 28), nil, nil, 380)

					slot0.lvup_panel:addChild(slot12)

					slot0.base_attr_list[slot7] = slot12
				end

				slot12:setPosition(cc.p(260 + (slot7 - 1) * 240, 344))
				slot12:setVisible(true)

				slot13 = 0

				if slot0.cur_halidom.vo.exp / slot3.exp > 0 then
					for slot18, slot19 in pairs(slot3.exp_attr) do
						if slot9 == slot19[1] then
							slot13 = slot14 * slot19[2]

							break
						end
					end
				end

				slot15 = PathTool.getAttrIconByStr(slot9)

				if PartnerCalculate.isShowPerByStr(slot9) == true then
					slot10 = (slot10 + slot13) / 10 .. "%"
				end

				slot12:setString(uv0("<img src='%s' scale=1 /> <div fontcolor=#0F5BCE> %s：</div><div fontcolor=#0F5BCE>%s</div>", PathTool.getResFrame("common", slot15), slot11, tostring(slot10)))
			end
		end
	end

	slot5 = false

	if Config.HalidomData.data_max_lev[slot0.cur_halidom.id] <= slot0.cur_halidom.vo.lev then
		slot0.max_lv_bg:setVisible(true)
		slot0.lv_txt:setVisible(false)
		slot0.zhuneng_title:setVisible(false)
		slot0.lvup_btn:setVisible(false)

		slot9 = false

		slot0.progress_value:setVisible(slot9)

		for slot9, slot10 in pairs(slot0.lvup_cost_list) do
			slot10.cost_bg:setVisible(false)
		end

		slot5 = true
	else
		slot0.max_lv_bg:setVisible(false)
		slot0.lv_txt:setVisible(true)
		slot0.zhuneng_title:setVisible(true)
		slot0.lvup_btn:setVisible(true)

		slot9 = true

		slot0.progress_value:setVisible(slot9)

		for slot9, slot10 in pairs(slot0.lvup_cost_list) do
			slot10.cost_bg:setVisible(true)
		end

		slot0.lv_txt:setString("Lv." .. slot0.cur_halidom.vo.lev)
	end

	if slot5 then
		slot0.lvup_progress:setPercent(100)
	else
		slot0.lvup_progress:setPercent(slot0.cur_halidom.vo.exp / slot3.total_exp * 100)
		slot0.progress_value:setString(uv0("%d/%d", slot0.cur_halidom.vo.exp, slot3.total_exp))
	end

	if slot1 and not slot5 then
		for slot9, slot10 in pairs(slot0.lvup_cost_list) do
			slot10.cost_bg:setVisible(false)
		end

		for slot9, slot10 in ipairs(slot3.loss) do
			slot12 = slot10[2]

			if slot0.lvup_cost_list[slot9] and Config.ItemData.data_get_data(slot10[1]) then
				slot13.cost_bg:setVisible(true)

				slot13.cost_num = slot12

				if BackpackController:getInstance():getModel():getItemNumByBid(slot11) < slot12 then
					slot13.label:setTextColor(cc.c3b(255, 93, 93))
				else
					slot13.label:setTextColor(cc.c3b(255, 246, 228))
				end

				slot13.label:setString(MoneyTool.GetMoneyString(slot15) .. "/" .. MoneyTool.GetMoneyString(slot12))

				if slot13.cost_bid ~= slot11 then
					slot13.cost_bid = slot11

					slot13.res_icon:loadTexture(PathTool.getItemRes(slot14.icon), LOADTEXT_TYPE)
				end
			end
		end
	end
end

function HalidomMainPanel.updateStepInfo(slot0)
	if not slot0.cur_halidom then
		return
	end

	if not Config.HalidomData.data_step[slot0.cur_halidom.id] then
		return
	end

	if not slot1[slot0.cur_halidom.vo.step] then
		return
	end

	for slot6, slot7 in pairs(slot0.step_icon_list) do
		slot7.step_icon_bg:setVisible(false)
	end

	if Config.HalidomData.data_max_step[slot0.cur_halidom.id] < slot0.cur_halidom.vo.step + 1 then
		slot4 = slot3
	end

	slot5 = 164
	slot6 = 35

	for slot10 = 1, slot4 do
		if slot0.step_icon_list[slot10] == nil then
			slot0.step_icon_list[slot10] = slot0:createStepIcon()
		end

		if slot11 and slot11.step_icon_bg then
			slot11.step_icon_bg:setVisible(true)
			slot11.step_icon_bg:setPosition(cc.p(slot5 + (slot10 - 1) * slot6, 344))
			slot11.step_icon:setVisible(slot10 <= slot0.cur_halidom.vo.step)
		end
	end

	if slot0.max_step_skill then
		slot0.max_step_skill:setVisible(false)
	end

	if slot0.cur_step_skill then
		slot0.cur_step_skill:setVisible(false)
	end

	if slot0.next_step_skill then
		slot0.next_step_skill:setVisible(false)
	end

	for slot10, slot11 in pairs(slot0.step_hero_list) do
		slot11:setVisible(false)
	end

	if slot3 <= slot0.cur_halidom.vo.step then
		slot0.max_step_bg:setVisible(true)
		slot0.step_cost_bg:setVisible(false)
		slot0.step_btn:setVisible(false)
		slot0.step_limit_lv_bg:setVisible(false)
		slot0.step_arrow:setVisible(false)

		if slot2.skill_icon then
			if not slot0.max_step_skill then
				slot0.max_step_skill = slot0:createHalidomSkillItem()

				slot0.max_step_skill:setPosition(cc.p(360, 250))
				slot0.step_panel:addChild(slot0.max_step_skill)
			end

			slot0.max_step_skill:setVisible(true)
			slot0:setHalidomSkillItemData(slot0.max_step_skill, slot2.skill_icon)
			setChildUnEnabled(false, slot0.max_step_skill.skill_icon)
		end
	else
		slot0.max_step_bg:setVisible(false)
		slot0.step_cost_bg:setVisible(true)
		slot0.step_btn:setVisible(true)

		if slot1[slot0.cur_halidom.vo.step + 1] then
			slot8 = false
			slot9 = 0

			for slot13, slot14 in pairs(slot7.conds) do
				if slot14[1] == "lev" and slot14[2] <= slot0.cur_halidom.vo.lev then
					slot8 = true
				end
			end

			if slot7.conds[1] == "lev" and slot7.conds[2] <= slot0.cur_halidom.vo.lev then
				slot8 = true
			end

			if slot8 then
				slot0.step_limit_tips = ""

				slot0.step_limit_lv_bg:setVisible(false)
			else
				slot0.step_limit_lv_bg:setVisible(true)

				slot0.step_limit_tips = uv0(TI18N("%d级可进阶"), slot9)

				slot0.step_limit_label:setString(slot0.step_limit_tips)
			end

			if slot0.cur_halidom.vo.step == 0 then
				slot0.step_arrow:setVisible(false)

				if slot7.skill_icon then
					if not slot0.max_step_skill then
						slot0.max_step_skill = slot0:createHalidomSkillItem()

						slot0.max_step_skill:setPosition(cc.p(360, 250))
						slot0.step_panel:addChild(slot0.max_step_skill)
					end

					slot0.max_step_skill:setVisible(true)
					slot0:setHalidomSkillItemData(slot0.max_step_skill, slot7.skill_icon)
					setChildUnEnabled(true, slot0.max_step_skill.skill_icon)
				end
			else
				slot0.step_arrow:setVisible(true)

				if slot2.skill_icon then
					if not slot0.cur_step_skill then
						slot0.cur_step_skill = slot0:createHalidomSkillItem()

						slot0.cur_step_skill:setPosition(cc.p(250, 250))
						slot0.step_panel:addChild(slot0.cur_step_skill)
					end

					slot0.cur_step_skill:setVisible(true)
					slot0:setHalidomSkillItemData(slot0.cur_step_skill, slot2.skill_icon)
				end

				if slot7.skill_icon then
					if not slot0.next_step_skill then
						slot0.next_step_skill = slot0:createHalidomSkillItem()

						slot0.next_step_skill:setPosition(cc.p(470, 250))
						slot0.step_panel:addChild(slot0.next_step_skill)
					end

					slot0.next_step_skill:setVisible(true)
					slot0:setHalidomSkillItemData(slot0.next_step_skill, slot7.skill_icon, true)
				end
			end

			if slot7.loss_items[1] then
				slot11 = slot10[1]
				slot0.step_cost_bid = slot11
				slot0.step_cost_num = slot10[2]

				if Config.ItemData.data_get_data(slot11) then
					slot0.step_cost_icon:loadTexture(PathTool.getItemRes(slot13.icon), LOADTEXT_TYPE)

					if BackpackController:getInstance():getModel():getItemNumByBid(slot11) < slot12 then
						slot0.step_cost_label:setTextColor(cc.c3b(255, 93, 93))
					else
						slot0.step_cost_label:setTextColor(cc.c3b(255, 246, 228))
					end

					slot0.step_cost_label:setString(MoneyTool.GetMoneyString(slot15) .. "/" .. MoneyTool.GetMoneyString(slot12))
				end
			end

			slot0.step_cost_hero_data = {}

			for slot14, slot15 in ipairs(slot7.loss_fixed) do
				uv1(slot0.step_cost_hero_data, slot0:getHeroData(slot15[1], slot15[2], slot15[3]))
			end

			for slot14, slot15 in ipairs(slot7.loss_rand) do
				uv1(slot0.step_cost_hero_data, slot0:getHeroData(nil, slot15[2], slot15[3], slot15[1]))
			end

			for slot14, slot15 in ipairs(slot0.step_cost_hero_data) do
				if slot0.step_hero_list[slot14] == nil then
					slot16 = HeroExhibitionItem.new(0.8, true)

					slot16:addCallBack(function ()
						uv0:_onClickStepHeroData(uv1)
					end)
					slot0.step_panel:addChild(slot16)

					slot0.step_hero_list[slot14] = slot16
				end

				slot16:setHeadUnEnabled(true)
				slot16:setVisible(true)
				slot16:setPosition(cc.p(132 + (slot14 - 1) * (HeroExhibitionItem.Width * 0.8 + 10), 120))

				if slot15.bid == 0 then
					slot16:setData(slot15)
					slot16:setDefaultHead(HeroController:getInstance():getModel():getRandomHeroHeadByQuality(slot15.star))
				else
					slot16:setData(slot15)
				end

				slot16:setHeadUnEnabled(true)
			end
		end
	end
end

function HalidomMainPanel.createHalidomSkillItem(slot0)
	slot1 = cc.size(119, 119)
	slot2 = ccui.Layout:create()

	slot2:setAnchorPoint(cc.p(0.5, 0.5))
	slot2:setContentSize(slot1)
	slot2:setTouchEnabled(true)
	slot2:setScale(0.8)
	registerButtonEventListener(slot2, function ()
		if uv0.skill_id then
			TipsManager:getInstance():showHalidomSkillTips(uv0.skill_id)
		end
	end)

	slot5 = createSprite(PathTool.getResFrame("common", "common_2018"), slot1.width - 5, slot1.height - 5, slot2, cc.p(0.5, 0.5))
	slot2.icon_kuang = createSprite(PathTool.getResFrame("common", "common_1005"), slot1.width / 2, slot1.height / 2, slot2, cc.p(0.5, 0.5))
	slot2.skill_icon = createSprite(nil, slot1.width / 2, slot1.height / 2, slot2, cc.p(0.5, 0.5), LOADTEXT_TYPE)
	slot2.lv_bg = slot5
	slot2.lv_txt = createLabel(20, cc.c4b(100, 50, 35, 255), nil, 16, 16, "1", slot5, 1, cc.p(0.5, 0.5))

	return slot2
end

function HalidomMainPanel.setHalidomSkillItemData(slot0, slot1, slot2, slot3)
	if not Config.HalidomData.data_skill[slot2] then
		return
	end

	slot1.skill_id = slot2

	if slot1.skill_icon then
		loadSpriteTexture(slot1.skill_icon, PathTool.getSkillRes(slot4.res_id), LOADTEXT_TYPE)
	end

	if slot1.lv_bg and slot1.lv_txt then
		slot1.lv_bg:setVisible(true)
		slot1.lv_txt:setString(slot4.lev)
	end
end

function HalidomMainPanel._onClickStepHeroData(slot0, slot1)
	if not slot0.step_cost_hero_data[slot1] then
		return
	end

	slot0.step_cost_hero_data[slot1].is_select = true
	slot0.step_cost_hero_data[slot1].is_ignore_hero_hun = true

	HeroController:getInstance():openHeroUpgradeStarSelectPanel(true, slot0.step_cost_hero_data[slot1], {}, HeroConst.SelectHeroType.eHalidom)
end

function HalidomMainPanel.getHeroData(slot0, slot1, slot2, slot3, slot4)
	if slot1 == nil then
		-- Nothing
	elseif Config.PartnerData.data_partner_base[slot1] then
		slot5.bid = slot1
		slot5.camp_type = slot6.camp_type
	else
		return nil
	end

	return {
		star = slot2 or 0,
		count = slot3 or 0,
		lev = uv0("%s/%s", 0, slot3),
		bid = 0,
		camp_type = slot4,
		dic_select_list = {}
	}
end

function HalidomMainPanel.updateSelectHeroInfo(slot0)
	if slot0.cur_view_status == HalidomConst.View_Status.Lock then
		for slot5, slot6 in pairs(slot0.lock_cost_hero_data.dic_select_list) do
			slot1 = 0 + 1
		end

		slot0.lock_cost_hero_data.lev = uv0("%s/%s", slot1, slot0.lock_cost_hero_data.count)

		if slot0.lock_loss_item then
			slot0.lock_loss_item.num_label:setString(slot0.lock_cost_hero_data.lev)

			if slot1 > 0 then
				slot0.lock_loss_item:setHeadUnEnabled(false)
			else
				slot0.lock_loss_item:setHeadUnEnabled(true)
			end
		end
	elseif slot0.cur_tab_index == HalidomConst.Tab_Index.Step then
		if not slot0.step_cost_hero_data then
			return
		end

		for slot4, slot5 in ipairs(slot0.step_cost_hero_data) do
			if slot5.is_select then
				slot5.is_select = false

				for slot10, slot11 in pairs(slot5.dic_select_list) do
					slot6 = 0 + 1
				end

				slot5.lev = uv0("%s/%s", slot6, slot5.count)

				if slot0.step_hero_list[slot4] then
					slot0.step_hero_list[slot4].num_label:setString(slot5.lev)

					if slot6 > 0 then
						slot0.step_hero_list[slot4]:setHeadUnEnabled(false)
					else
						slot0.step_hero_list[slot4]:setHeadUnEnabled(true)
					end
				end
			end
		end
	end
end

function HalidomMainPanel.createStepIcon(slot0)
	slot1 = {
		step_icon_bg = createSprite(PathTool.getResFrame("halidom", "halidom_1002"), 0, 0, slot0.step_panel, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)
	}
	slot1.step_icon = createSprite(PathTool.getResFrame("halidom", "halidom_1001"), 13.5, 15.5, slot1.step_icon_bg, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)

	return slot1
end

function HalidomMainPanel.checkNeedUpdateItemNum(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		return
	end

	for slot5, slot6 in pairs(slot1) do
		if slot6.config then
			slot0:updateCostItemNumByBid(slot6.config.id)
		end
	end
end

function HalidomMainPanel.updateCostItemNumByBid(slot0, slot1)
	if slot0.cur_view_status == HalidomConst.View_Status.Unlock then
		if slot0.cur_tab_index == HalidomConst.Tab_Index.Lvup then
			for slot5, slot6 in pairs(slot0.lvup_cost_list) do
				if slot6.cost_bid == slot1 then
					if BackpackController:getInstance():getModel():getItemNumByBid(slot1) < slot6.cost_num then
						slot6.label:setTextColor(cc.c3b(255, 93, 93))
					else
						slot6.label:setTextColor(cc.c3b(255, 246, 228))
					end

					slot6.label:setString(MoneyTool.GetMoneyString(slot7) .. "/" .. MoneyTool.GetMoneyString(slot6.cost_num))

					break
				end
			end
		elseif slot0.cur_tab_index == HalidomConst.Tab_Index.Step and slot0.step_cost_bid == slot1 then
			if BackpackController:getInstance():getModel():getItemNumByBid(slot1) < slot0.step_cost_num then
				slot0.step_cost_label:setTextColor(cc.c3b(255, 93, 93))
			else
				slot0.step_cost_label:setTextColor(cc.c3b(255, 246, 228))
			end

			slot0.step_cost_label:setString(MoneyTool.GetMoneyString(slot2) .. "/" .. MoneyTool.GetMoneyString(slot0.step_cost_num))
		end
	end
end

function HalidomMainPanel.updateViewShow(slot0)
	if slot0.cur_view_status == HalidomConst.View_Status.Lock then
		slot0.lock_panel:setVisible(true)
		slot0.open_panel:setVisible(false)
	elseif slot0.cur_tab_index == HalidomConst.Tab_Index.Lvup then
		slot0.lock_panel:setVisible(false)
		slot0.open_panel:setVisible(true)
		slot0.lvup_panel:setVisible(true)
		slot0.step_panel:setVisible(false)
	elseif slot0.cur_tab_index == HalidomConst.Tab_Index.Step then
		slot0.lock_panel:setVisible(false)
		slot0.open_panel:setVisible(true)
		slot0.lvup_panel:setVisible(false)
		slot0.step_panel:setVisible(true)
	end
end

function HalidomMainPanel.updateTabInfo(slot0)
	if slot0.cur_view_status == HalidomConst.View_Status.Lock then
		for slot4, slot5 in ipairs(slot0.tab_list) do
			if slot4 == 1 then
				slot5.label:setString(TI18N("解锁"))
			else
				slot5.tab_btn:setVisible(false)
			end
		end

		slot0:changeSelectedTab(1, true)
	else
		for slot4, slot5 in ipairs(slot0.tab_list) do
			if slot4 == 1 then
				slot5.label:setString(TI18N("注能"))
			elseif slot4 == 2 then
				slot5.label:setString(TI18N("进阶"))
			end

			slot5.tab_btn:setVisible(true)
		end

		slot0:changeSelectedTab(slot0.cur_tab_index, true)
	end
end

function HalidomMainPanel.getDefaultHalidomIndex(slot0)
	return 1
end

function HalidomMainPanel.registerEvent(slot0)
	registerButtonEventListener(slot0.explain_btn, function (slot0, slot1, slot2)
		if Config.HalidomData.data_const.halidom_rule then
			TipsManager:getInstance():showCommonTips(slot3.desc, slot1:getTouchBeganPosition())
		end
	end)
	registerButtonEventListener(slot0.memoir_btn, function ()
		if uv0.cur_halidom then
			HeroController:getInstance():openHeroLibraryStoryPanel(true, uv0.cur_halidom.name, uv0.cur_halidom.msc)
		end
	end)
	registerButtonEventListener(slot0.left_btn, function ()
		if uv0.cur_halidom_index and uv0.halidom_list and next(uv0.halidom_list) ~= nil then
			uv0:selectHalidomByIndex((uv0.cur_halidom_index > 1 or #uv0.halidom_list) and slot0 - 1)
		end
	end)
	registerButtonEventListener(slot0.right_btn, function ()
		if uv0.cur_halidom_index and uv0.halidom_list and next(uv0.halidom_list) ~= nil then
			uv0:selectHalidomByIndex(uv0.cur_halidom_index >= #uv0.halidom_list and 1 or slot0 + 1)
		end
	end)
	registerButtonEventListener(slot0.btn_step_pre, function ()
		if uv0.cur_halidom then
			uv1:openHalidomStepPreView(true, uv0.cur_halidom.id)
		end
	end, true)
	registerButtonEventListener(slot0.unlock_btn, function ()
		if uv0.cur_halidom and uv0.lock_cost_hero_data.dic_select_list and next(uv0.lock_cost_hero_data.dic_select_list) ~= nil then
			slot0 = {}

			for slot4, slot5 in pairs(uv0.lock_cost_hero_data.dic_select_list) do
				uv1(slot0, {
					id = slot4
				})
			end

			uv2:sender22202(uv0.cur_halidom.id, slot0)
		else
			message(TI18N("所需英雄不足"))
		end
	end, true)
	registerButtonEventListener(slot0.lvup_btn, function ()
		if uv0.cur_halidom then
			uv1:sender22203(uv0.cur_halidom.id)
		end
	end, true)

	function slot4()
		if uv0.step_limit_tips ~= "" then
			message(uv0.step_limit_tips)
		elseif uv0.cur_halidom and uv0.step_cost_hero_data and next(uv0.step_cost_hero_data) ~= nil then
			slot0 = {}
			slot1 = {}

			for slot5, slot6 in ipairs(uv0.step_cost_hero_data) do
				for slot11, slot12 in pairs(slot6.dic_select_list) do
					slot7 = 0 + 1
				end

				if slot7 < slot6.count then
					message(TI18N("所需英雄不足"))

					return
				end

				for slot11, slot12 in pairs(slot6.dic_select_list) do
					if slot6.bid == 0 then
						uv1(slot1, {
							id = slot11
						})
					else
						uv1(slot0, {
							id = slot11
						})
					end
				end
			end

			uv2:sender22204(uv0.cur_halidom.id, slot0, slot1)
		end
	end

	slot5 = true

	registerButtonEventListener(slot0.step_btn, slot4, slot5)

	for slot4, slot5 in pairs(slot0.tab_list) do
		if slot5.tab_btn then
			slot5.tab_btn:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended then
					playTabButtonSound()
					uv0:changeSelectedTab(uv1.index)
				end
			end)
		end
	end

	if not slot0.get_halidom_data_event then
		slot0.get_halidom_data_event = GlobalEvent:getInstance():Bind(HalidomEvent.Get_Halidom_Data_Event, function ()
			uv0:setData()
		end)
	end

	if not slot0.update_halidom_data_event then
		slot0.update_halidom_data_event = GlobalEvent:getInstance():Bind(HalidomEvent.Update_Halidom_Data_Event, function (slot0)
			uv0:updateHalidomData()

			if uv0.cur_halidom and uv0.cur_halidom.id == slot0 then
				uv0:selectHalidomByIndex(uv0.cur_halidom_index, true, uv0.cur_tab_index)
			end
		end)
	end

	if slot0.update_hero_select_event == nil then
		slot0.update_hero_select_event = GlobalEvent:getInstance():Bind(HeroEvent.Upgrade_Star_Select_Event, function ()
			uv0:updateSelectHeroInfo()
		end)
	end

	if slot0.update_halidom_red_event == nil then
		slot0.update_halidom_red_event = GlobalEvent:getInstance():Bind(HalidomEvent.Update_Halidom_Red_Event, function ()
			uv0:updateHalidomData()
			uv0:updateHalidomRedStatus()
			uv0:updateTabRedStatus()
		end)
	end

	if not slot0.goods_add_event then
		slot0.goods_add_event = GlobalEvent:getInstance():Bind(BackpackEvent.ADD_GOODS, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
				return
			end

			uv0:checkNeedUpdateItemNum(slot1)
		end)
	end

	if not slot0.goods_modify_event then
		slot0.goods_modify_event = GlobalEvent:getInstance():Bind(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
				return
			end

			uv0:checkNeedUpdateItemNum(slot1)
		end)
	end

	if not slot0.goods_delete_event then
		slot0.goods_delete_event = GlobalEvent:getInstance():Bind(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
				return
			end

			uv0:checkNeedUpdateItemNum(slot1)
		end)
	end

	if not slot0.role_lev_event and slot0.role_vo then
		slot0.role_lev_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "coin" then
				uv0:updateCostItemNumByBid(1)
			end
		end)
	end
end

function HalidomMainPanel.changeSelectedTab(slot0, slot1, slot2)
	if not slot2 and slot0.tab_object ~= nil and slot0.tab_object.index == slot1 then
		return
	end

	if slot0.tab_object then
		slot0.tab_object.tab_btn:loadTextures(PathTool.getResFrame("common", "common_90030"), "", "", LOADTEXT_TYPE_PLIST)
		slot0.tab_object.label:setTextColor(cc.c3b(215, 226, 227))

		slot0.tab_object = nil
	end

	slot0.tab_object = slot0.tab_list[slot1]

	if slot0.tab_object then
		slot0.tab_object.tab_btn:loadTextures(PathTool.getResFrame("common", "common_90031"), "", "", LOADTEXT_TYPE_PLIST)
		slot0.tab_object.label:setTextColor(cc.c3b(92, 43, 13))
	end

	slot0.cur_tab_index = slot1

	slot0:updateViewShow()
	slot0:updateTabRedStatus()

	if slot0.cur_view_status == HalidomConst.View_Status.Unlock then
		if slot1 == HalidomConst.Tab_Index.Lvup and not slot0.init_lvup_flag then
			slot0.init_lvup_flag = true

			slot0:updateLvupInfo(slot2)
			slot0:updateHalidomRedStatus()
		elseif slot1 == HalidomConst.Tab_Index.Step and not slot0.init_step_flag then
			slot0.init_step_flag = true

			slot0:updateStepInfo(slot2)
			slot0:updateHalidomRedStatus()
		end
	end
end

function HalidomMainPanel.updateHalidomRedStatus(slot0)
	if not slot0.cur_halidom then
		return
	end

	if slot0.cur_view_status == HalidomConst.View_Status.Lock and slot0.lock_loss_item then
		if uv0:checkHalidomIsCanUnlock(slot0.cur_halidom.id) then
			addRedPointToNodeByStatus(slot0.lock_loss_item, true, 15, 15, nil, 2)
		else
			addRedPointToNodeByStatus(slot0.lock_loss_item, false)
		end
	elseif slot0.cur_tab_index == HalidomConst.Tab_Index.Step then
		if slot0.cur_halidom.vo and next(slot0.cur_halidom.vo) ~= nil and slot0.cur_halidom.vo:getRedStatusByType(HalidomConst.Red_Type.Step) then
			for slot4, slot5 in pairs(slot0.step_hero_list) do
				addRedPointToNodeByStatus(slot5, true, 15, 15, nil, 2)
			end
		else
			for slot4, slot5 in pairs(slot0.step_hero_list) do
				addRedPointToNodeByStatus(slot5, false)
			end
		end
	end
end

function HalidomMainPanel.updateTabRedStatus(slot0)
	if not slot0.cur_halidom then
		return
	end

	if slot0.cur_view_status == HalidomConst.View_Status.Lock then
		for slot4, slot5 in ipairs(slot0.tab_list) do
			slot5.tips:setVisible(false)
		end

		return
	end

	if not slot0.cur_halidom.vo or next(slot0.cur_halidom.vo) == nil then
		return
	end

	for slot4, slot5 in ipairs(slot0.tab_list) do
		slot6 = false

		if slot0.cur_tab_index ~= slot4 then
			slot6 = (slot4 ~= 1 or slot0.cur_halidom.vo:getRedStatusByType(HalidomConst.Red_Type.Lvup)) and slot0.cur_halidom.vo:getRedStatusByType(HalidomConst.Red_Type.Step)
		end

		slot5.tips:setVisible(slot6)
	end

	if slot0.cur_tab_index == HalidomConst.Tab_Index.Lvup then
		slot0.lvup_btn_tips:setVisible(slot0.cur_halidom.vo:getRedStatusByType(HalidomConst.Red_Type.Lvup))
	end
end

function HalidomMainPanel.DeleteMe(slot0)
	if slot0.init_res_load then
		slot0.init_res_load:DeleteMe()

		slot0.init_res_load = nil
	end

	if slot0.halidom_res_load then
		slot0.halidom_res_load:DeleteMe()

		slot0.halidom_res_load = nil
	end

	if slot0.lock_loss_item then
		slot0.lock_loss_item:DeleteMe()

		slot0.lock_loss_item = nil
	end

	for slot4, slot5 in pairs(slot0.step_hero_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	if slot0.halidom_model then
		slot0.halidom_model:clearTracks()
		slot0.halidom_model:removeFromParent()

		slot0.halidom_model = nil
	end

	if slot0.update_hero_select_event then
		GlobalEvent:getInstance():UnBind(slot0.update_hero_select_event)

		slot0.update_hero_select_event = nil
	end

	if slot0.get_halidom_data_event then
		GlobalEvent:getInstance():UnBind(slot0.get_halidom_data_event)

		slot0.get_halidom_data_event = nil
	end

	if slot0.update_halidom_data_event then
		GlobalEvent:getInstance():UnBind(slot0.update_halidom_data_event)

		slot0.update_halidom_data_event = nil
	end

	if slot0.update_halidom_red_event then
		GlobalEvent:getInstance():UnBind(slot0.update_halidom_red_event)

		slot0.update_halidom_red_event = nil
	end

	if slot0.goods_add_event then
		GlobalEvent:getInstance():UnBind(slot0.goods_add_event)

		slot0.goods_add_event = nil
	end

	if slot0.goods_modify_event then
		GlobalEvent:getInstance():UnBind(slot0.goods_modify_event)

		slot0.goods_modify_event = nil
	end

	if slot0.goods_delete_event then
		GlobalEvent:getInstance():UnBind(slot0.goods_delete_event)

		slot0.goods_delete_event = nil
	end

	if slot0.role_lev_event and slot0.role_vo then
		slot0.role_vo:UnBind(slot0.role_lev_event)

		slot0.role_lev_event = nil
	end
end
