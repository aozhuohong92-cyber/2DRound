EndlessMeHelpPanel = class("EndlessMeHelpPanel", function ()
	return ccui.Layout:create()
end)
slot0 = Endless_trailController:getInstance()
slot1 = Endless_trailController:getInstance():getModel()

function EndlessMeHelpPanel.ctor(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("endlesstrail/endlesstrail_me_help_panel"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5 - 10, slot0.size.height * 0.5 - 40)
	slot0:addChild(slot0.root_wnd)

	slot1 = slot0.root_wnd:getChildByName("scroll_container")

	slot1:getChildByName("desc_title"):setString(TI18N("可选英雄"))
	slot1:getChildByName("desc_label"):setString(TI18N("每日派遣支援英雄可得奖励，若英雄被使用自己将获得友情点"))

	slot4 = slot1:getContentSize()
	slot0.scroll_view = CommonScrollViewLayout.new(slot1, cc.p(4, 7), nil, nil, cc.size(slot4.width - 4, slot4.height - 13), {
		start_y = 0,
		item_width = 600,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 124,
		space_y = 0,
		col = 1,
		need_dynamic = true,
		item_class = EndlessFriendHelpItem2
	})
	slot7 = slot0.root_wnd:getChildByName("my_container")
	slot0.item_container = slot7:getChildByName("item_container")

	slot0.item_container:setVisible(false)

	slot0.career_icon = slot0.item_container:getChildByName("career_icon")
	slot0.role_name = slot0.item_container:getChildByName("role_name")
	slot0.career_name = slot0.item_container:getChildByName("career_name")
	slot0.role_power = slot0.item_container:getChildByName("role_power")
	slot0.has_label = slot0.item_container:getChildByName("has_label")

	slot0.has_label:setString(TI18N("已派遣支援"))
	slot7:getChildByName("my_desc_title"):setString(TI18N("当前已选"))

	slot0.no_label = slot7:getChildByName("no_label")

	slot0.no_label:setString(TI18N("暂无派遣支援英雄,快快选择英雄帮助好友吧"))
	slot0.no_label:setVisible(false)

	slot0.hero_icon = HeroExhibitionItem.new(0.8)

	slot0.hero_icon:setPosition(65, 64)
	slot0.hero_icon:addCallBack(handler(slot0, slot0.onClickHeroItem))
	slot0.item_container:addChild(slot0.hero_icon)
	slot0:registerEvent()
end

function EndlessMeHelpPanel.onClickHeroItem(slot0)
	if slot0.send_role_data then
		HeroController:getInstance():openHeroTipsPanel(true, HeroController:getInstance():getModel():getHeroById(slot0.send_role_data.id))
	end
end

function EndlessMeHelpPanel.registerEvent(slot0)
	if not slot0.update_send_partner_event then
		slot0.update_send_partner_event = GlobalEvent:getInstance():Bind(Endless_trailEvent.UPDATA_SENDPARTNER_DATA, function (slot0)
			uv0:updateListData(slot0)
		end)
	end

	if not slot0.update_send_partner_sucess_event then
		slot0.update_send_partner_sucess_event = GlobalEvent:getInstance():Bind(Endless_trailEvent.UPDATA_SENDPARTNER_SUCESS_DATA, function (slot0)
			if slot0.code == 1 and uv0.select_item then
				uv0.select_item:updateBtnStatus(false)

				uv0.select_item = nil
				uv0.select_vo = nil
			end
		end)
	end
end

function EndlessMeHelpPanel.updateListData(slot0, slot1)
	if slot1 then
		slot0.send_data = slot1

		if slot0.send_data.list and next(slot0.send_data.list or {}) == nil then
			slot0.item_container:setVisible(false)
			slot0.no_label:setVisible(true)
		elseif slot0.send_data.list[1] then
			slot0.item_container:setVisible(true)
			slot0.no_label:setVisible(false)

			slot0.send_role_data = slot0.send_data.list[1]

			if slot0.send_role_data then
				slot0.hero_icon:setData(slot0.send_role_data)
				slot0.role_power:setString(slot0.send_role_data.power)

				if Config.PartnerData.data_partner_base[slot0.send_role_data.bid] then
					loadSpriteTexture(slot0.career_icon, PathTool.getCareerIcon(slot2.type), LOADTEXT_TYPE_PLIST)
					slot0.career_name:setString("[" .. (PartnerConst.Hero_Type[slot2.type] or "") .. "]")
					slot0.role_name:setString(slot2.name)
				end
			end
		end

		slot2 = 1
		slot3 = {}
		slot4 = HeroController:getInstance():getModel()
		slot5 = slot4:getAllHeroArray()
		slot6 = slot4:getDicResonateFiveHeroVo() or {}
		slot7 = slot4:getCystalPreLevLimit()

		slot5:UpperSortByParams("power", "quality", "star", "lev", "sort_order")

		slot11 = slot5

		for slot11 = 1, slot5.GetSize(slot11) do
			if slot0.send_role_data and slot0.send_role_data.id and slot0.send_role_data.id == slot5:Get(slot11 - 1).id then
				-- Nothing
			elseif slot12.isResonateCrystalHero and slot12:isResonateCrystalHero() then
				if slot6[slot12.id] then
					slot3[slot2] = {
						info_data = slot12,
						type = Endless_trailEvent.helptype.me
					}
					slot2 = slot2 + 1
				end
			else
				slot3[slot2] = {
					info_data = slot12,
					type = Endless_trailEvent.helptype.me
				}
				slot2 = slot2 + 1
			end
		end

		slot0.scroll_view:setData(slot3, function (slot0, slot1, slot2)
			if slot1 and next(slot1) ~= nil then
				uv0:clickFun(slot0, slot1, slot2)
			end
		end)
	end
end

function EndlessMeHelpPanel.setNodeVisible(slot0, slot1)
	slot0:setVisible(slot1)
end

function EndlessMeHelpPanel.addToParent(slot0)
	uv0:send23905()
end

function EndlessMeHelpPanel.clickFun(slot0, slot1, slot2, slot3)
	if slot0.select_item and slot0.select_item.index == slot3 then
		slot0.select_item:updateBtnStatus(false)

		slot0.select_item = nil
		slot0.select_vo = nil

		return
	end

	if slot2 and slot2.info_data and slot2.info_data.checkResonateHero and slot2.info_data:checkResonateHero() then
		return
	end

	if slot2 and slot2.info_data and slot2.info_data.isResonateCrystalHero and slot2.info_data:isResonateCrystalHero() then
		slot4 = 340

		if Config.ResonateData.data_const.cystal_pre_lev_limit then
			slot4 = slot5.val
		end

		if slot2.info_data.lev < slot4 then
			message(TI18N("该英雄在恶魔果树槽位中已上阵"))

			return
		end
	end

	if slot0.select_item then
		slot0.select_item:updateBtnStatus(false)
	end

	slot0.select_item = slot1
	slot0.select_vo = slot2

	slot0.select_item:updateBtnStatus(true)

	if slot0.select_vo.info_data and slot0.select_vo.info_data.partner_id then
		uv0:send23908(slot0.select_vo.info_data.partner_id)
	end
end

function EndlessMeHelpPanel.DeleteMe(slot0)
	if slot0.update_send_partner_event then
		GlobalEvent:getInstance():UnBind(slot0.update_send_partner_event)

		slot0.update_send_partner_event = nil
	end

	if slot0.update_send_partner_sucess_event then
		GlobalEvent:getInstance():UnBind(slot0.update_send_partner_sucess_event)

		slot0.update_send_partner_event = nil
	end

	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()

		slot0.scroll_view = nil
	end
end
