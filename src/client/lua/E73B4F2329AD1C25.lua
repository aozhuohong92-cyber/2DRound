SeerpalaceSummonScoreWindow = SeerpalaceSummonScoreWindow or BaseClass(BaseView)
slot1 = SeerpalaceController:getInstance():getModel()
slot2 = string.format

function SeerpalaceSummonScoreWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0._type = WinType.Big
	slot0.is_full_screen = false
	slot0.layout_name = "seerpalace/seerpalace_summon_score_panel"
	slot0.summon_pos = {}
	slot0.summon_list = {}
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("seerpalace", "seerpalace"),
			type = ResourcesType.plist
		}
	}
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.need_vip_lev = 5

	if Config.RecruitHighData.data_seerpalace_const and slot1.recruit_vip and slot1.recruit_vip.val then
		slot0.need_vip_lev = slot1.recruit_vip.val
	end
end

function SeerpalaceSummonScoreWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.title = slot0.main_panel:getChildByName("win_title")

	slot0.title:setString(TI18N("星象占卜"))
	UITool.SetTitleColor(slot0.title, 2)

	slot0.vip_label = slot0.main_container:getChildByName("vip_label")

	slot0.vip_label:setString(uv0(TI18N("VIP%d方可召唤"), slot0.need_vip_lev))
	UITool.SetLightColor(slot0.vip_label)

	slot0.item_config = Config.ItemData.data_get_data(SeerpalaceConst.Good_jifen)
	slot0.desc_label = slot0.main_panel:getChildByName("desc_label")

	slot0.desc_label:setString(TI18N("消耗星命卡牌可任选一系进行召唤，必出五星传说英雄"))
	UITool.SetLightColor(slot0.desc_label)

	slot1 = slot0.main_container:getChildByName("score_panel")
	slot0.label = slot1:getChildByName("label")
	slot0.icon = slot1:getChildByName("icon")

	if slot0.item_config then
		slot0.desc_label:setString(uv0(TI18N("消耗%s可任选一系进行召唤，必出五星传说英雄"), slot0.item_config.name))
		loadSpriteTexture(slot0.icon, PathTool.getItemRes(slot0.item_config.icon), LOADTEXT_TYPE)
	end

	slot0:updateCount()

	slot0.summon_btn = slot0.main_container:getChildByName("summon_btn")
	slot0.summon_label = slot0.summon_btn:getChildByName("label")

	UITool.SetTitleColor(slot0.summon_label)
	slot0.summon_label:setString(TI18N("召唤"))
	setChildUnEnabled(true, slot0.summon_btn)
	slot0.summon_btn:setTouchEnabled(false)
	slot0.summon_label:disableEffect(cc.LabelEffect.OUTLINE)

	if slot0.role_vo and slot0.need_vip_lev <= slot0.role_vo.vip_lev then
		slot0.vip_label:setVisible(false)
	end

	for slot5 = 1, 5 do
		if slot0.main_container:getChildByName("pos_node_" .. slot5) then
			delayRun(slot6, slot5 * 3 / 60, function ()
				if not uv0.summon_list[uv1] then
					slot0 = SeerpalaceSummonScoreItem.new(handler(uv0, uv0._onClickSummonCard))

					uv2:addChild(slot0)

					uv0.summon_list[uv1] = slot0
				end

				slot0:setIndex(uv1)
			end)

			slot0.summon_pos[slot5] = slot6
		end
	end
end

function SeerpalaceSummonScoreWindow._onClickSummonCard(slot0, slot1)
	if slot0.select_card then
		slot0.select_card:setSelectStatus(false)

		slot0.select_card = nil
	end

	slot2 = slot1:getSummonCostItem()
	slot3 = slot0.role_vo.predict_point

	if slot0.role_vo and slot0.role_vo.vip_lev < slot0.need_vip_lev then
		message(TI18N(uv0(TI18N("VIP%d方可召唤"), slot0.need_vip_lev)))
		setChildUnEnabled(true, slot0.summon_btn)
		slot0.summon_btn:setTouchEnabled(false)
		slot0.summon_label:disableEffect(cc.LabelEffect.OUTLINE)
	elseif slot2 and slot2[2] and slot3 < slot2[2] then
		if slot0.item_config and slot0.item_config.name then
			message(uv0(TI18N("%s不足"), slot0.item_config.name))
		else
			message(TI18N("星命卡牌不足"))
		end

		setChildUnEnabled(true, slot0.summon_btn)
		slot0.summon_btn:setTouchEnabled(false)
		slot0.summon_label:disableEffect(cc.LabelEffect.OUTLINE)
	elseif slot1 then
		slot0.select_card = slot1

		slot0.select_card:setSelectStatus(true)
		setChildUnEnabled(false, slot0.summon_btn)
		slot0.summon_btn:setTouchEnabled(true)
		slot0.summon_label:enableOutline(Config.ColorData.data_color4[264], 2)
	end

	slot0:updateButton()
end

function SeerpalaceSummonScoreWindow.updateButton(slot0)
	slot0.vip_label:setVisible(false)

	if slot0.select_card then
		slot1 = slot0.select_card:getSummonCostItem()
		slot2 = slot0.role_vo.predict_point

		if slot0.role_vo and slot0.role_vo.vip_lev < slot0.need_vip_lev then
			setChildUnEnabled(true, slot0.summon_btn)
			slot0.summon_btn:setTouchEnabled(false)
			slot0.summon_label:disableEffect(cc.LabelEffect.OUTLINE)
			slot0.select_card:setSelectStatus(false)

			slot0.select_card = nil

			slot0.vip_label:setVisible(true)
		elseif slot1 and slot1[2] and slot2 < slot1[2] then
			setChildUnEnabled(true, slot0.summon_btn)
			slot0.summon_btn:setTouchEnabled(false)
			slot0.summon_label:disableEffect(cc.LabelEffect.OUTLINE)
			slot0.select_card:setSelectStatus(false)

			slot0.select_card = nil
		else
			setChildUnEnabled(false, slot0.summon_btn)
			slot0.summon_btn:setTouchEnabled(true)
			slot0.summon_label:enableOutline(Config.ColorData.data_color4[264], 2)
		end
	else
		if slot0.role_vo and slot0.role_vo.vip_lev < slot0.need_vip_lev then
			slot0.vip_label:setVisible(true)
		end

		setChildUnEnabled(true, slot0.summon_btn)
		slot0.summon_btn:setTouchEnabled(false)
		slot0.summon_label:disableEffect(cc.LabelEffect.OUTLINE)
	end
end

function SeerpalaceSummonScoreWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 2)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickBtnClose), true, 2)
	registerButtonEventListener(slot0.summon_btn, handler(slot0, slot0.onClickBtnSummon), true, 1)

	if slot0.role_vo ~= nil and slot0.role_assets_event == nil then
		slot0.role_assets_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "predict_point" and uv0.label then
				uv0.label:setString(slot1)
				uv0:updateButton()
			elseif slot0 == "vip_lev" then
				uv0:updateButton()
			end
		end)
	end
end

function SeerpalaceSummonScoreWindow.updateCount(slot0)
	if not slot0.label then
		return
	end

	slot0.label:setString(slot0.role_vo.predict_point)
end

function SeerpalaceSummonScoreWindow.onClickBtnClose(slot0)
	uv0:openSeerpalaceSummonScoreWindow(false)
end

function SeerpalaceSummonScoreWindow.onClickBtnSummon(slot0)
	if slot0.select_card then
		uv0:requestSeerpalaceSummon(slot0.select_card:getSummonGroupId())
	else
		message("请先选择一种卡牌")
	end
end

function SeerpalaceSummonScoreWindow.openRootWnd(slot0, slot1)
end

function SeerpalaceSummonScoreWindow.setData(slot0, slot1)
end

function SeerpalaceSummonScoreWindow.close_callback(slot0)
	slot4 = false

	uv0:openSeerpalaceSummonScoreWindow(slot4)

	for slot4, slot5 in pairs(slot0.summon_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	if slot0.role_vo ~= nil and slot0.role_assets_event ~= nil then
		slot0.role_vo:UnBind(slot0.role_assets_event)

		slot0.role_assets_event = nil
	end
end

SeerpalaceSummonScoreItem = class("SeerpalaceSummonScoreItem", function ()
	return ccui.Widget:create()
end)

function SeerpalaceSummonScoreItem.ctor(slot0, slot1)
	slot0._clickCallBack = slot1
	slot0._is_select = false

	slot0:configUI()
	slot0:register_event()
end

function SeerpalaceSummonScoreItem.configUI(slot0)
	slot0.size = cc.size(180, 196)

	slot0:setTouchEnabled(false)
	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("seerpalace/seerpalace_summon_score_item"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("container")
	slot0.container = slot2
	slot0.brand = slot2:getChildByName("brand")
	slot0.select = slot2:getChildByName("select")
	slot3 = slot2:getChildByName("score_panel")
	slot0.icon = slot3:getChildByName("icon")
	slot0.label = slot3:getChildByName("label")

	if Config.ItemData.data_get_data(SeerpalaceConst.Good_jifen) then
		loadSpriteTexture(slot0.icon, PathTool.getItemRes(slot4.icon), LOADTEXT_TYPE)
	end

	slot0.select:setVisible(false)
end

function SeerpalaceSummonScoreItem.setIndex(slot0, slot1)
	slot0.index = slot1

	slot0.label:setString(tostring(slot0.need_score))
	loadSpriteTexture(slot0.brand, PathTool.getResFrame("seerpalace", "seerpalace_brand_" .. slot0.index), LOADTEXT_TYPE_PLIST)

	if Config.RecruitHighData.data_seerpalace_data[SeerpalaceConst.Score_Index_To_GroupId[slot1]] and slot4.item_once then
		slot0.summon_cost = slot4.item_once[1]
		slot0.group_id = slot3
	end

	if slot0.summon_cost and slot0.summon_cost[2] then
		slot0.label:setString(tostring(slot0.summon_cost[2]))
	end
end

function SeerpalaceSummonScoreItem.getSummonCostItem(slot0)
	return slot0.summon_cost
end

function SeerpalaceSummonScoreItem.getSummonGroupId(slot0)
	return slot0.group_id
end

function SeerpalaceSummonScoreItem.register_event(slot0)
	registerButtonEventListener(slot0.container, handler(slot0, slot0._onClickSummonLayer))
end

function SeerpalaceSummonScoreItem._onClickSummonLayer(slot0)
	if slot0._is_select == false and slot0._clickCallBack then
		slot0:_clickCallBack(slot0)
	end
end

function SeerpalaceSummonScoreItem.setSelectStatus(slot0, slot1)
	if slot1 == true then
		slot0.select:setVisible(true)
	else
		slot0.select:setVisible(false)
	end

	slot0._is_select = slot1
end

function SeerpalaceSummonScoreItem.DeleteMe(slot0)
	slot0.container:stopAllActions()
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
