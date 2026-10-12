slot1 = MonopolyController:getInstance():getModel()
MonopolyGuildRankPanel = class("MonopolyGuildRankPanel", function ()
	return ccui.Layout:create()
end)

function MonopolyGuildRankPanel.ctor(slot0, slot1)
	slot0.step_id = slot1
	slot0.is_init = true
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("monopoly/monopoly_rank_guild_panel"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.scroll_container = slot0.root_wnd:getChildByName("scroll_container")
	slot0.empty_bg = slot0.scroll_container:getChildByName("empty_bg")

	slot0.empty_bg:setVisible(false)
	loadSpriteTexture(slot0.empty_bg, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_3"), LOADTEXT_TYPE)

	slot0.desc_label = slot0.empty_bg:getChildByName("desc_label")

	slot0.desc_label:setPositionX(slot0.empty_bg:getContentSize().width / 2)
	slot0.desc_label:setString(TI18N("暂无记录"))

	slot2 = slot0.root_wnd:getChildByName("title_bg")

	slot2:getChildByName("title_1"):setString(TI18N("排名"))
	slot2:getChildByName("title_2"):setString(TI18N("公会名称"))
	slot2:getChildByName("title_3"):setString(TI18N("等级"))
	slot2:getChildByName("title_4"):setString(TI18N("成员"))
	slot2:getChildByName("title_5"):setString(TI18N("总伤害"))

	slot3 = slot0.scroll_container:getContentSize()
	slot0.scroll_view = CommonScrollViewLayout.new(slot0.scroll_container, nil, , , cc.size(slot3.width, slot3.height - 70), {
		start_y = 0,
		item_width = 614,
		start_x = 4,
		space_x = 4,
		row = 0,
		item_height = 125,
		space_y = 0,
		col = 1,
		need_dynamic = true,
		item_class = MonopolyGuildRankItem
	})
	slot6 = slot0.root_wnd:getChildByName("my_container")

	slot6:getChildByName("my_rank_title"):setString(TI18N("我的排名"))

	slot0.rank_img = slot6:getChildByName("rank_img")

	slot0.rank_img:setVisible(false)

	slot0.rank_x = slot0.rank_img:getPositionX()
	slot0.rank_y = slot0.rank_img:getPositionY()
	slot0.no_rank = slot6:getChildByName("no_rank")

	slot0.no_rank:setString(TI18N("未上榜"))
	slot0.no_rank:setVisible(false)

	slot0.my_rank_txt = slot6:getChildByName("rank_id")
	slot0.my_guile_name_txt = createLabel(24, 175, nil, 204, 60, "", slot6, nil, cc.p(0.5, 0.5))
	slot0.my_chairman_txt = createLabel(20, 186, nil, 204, 32, "", slot6, nil, cc.p(0.5, 0.5))
	slot0.my_guild_lev_txt = createLabel(24, 175, nil, 342, 57, "", slot6, nil, cc.p(0.5, 0.5))
	slot0.my_guild_num_txt = createLabel(24, 175, nil, 425, 57, "", slot6, nil, cc.p(0.5, 0.5))
	slot0.my_guild_hurt_txt = createRichLabel(24, 186, cc.p(0.5, 0.5), cc.p(525, 57), 0, 0, 500)

	slot6:addChild(slot0.my_guild_hurt_txt)

	slot0.my_container = slot6

	slot0:registerEvent()
end

function MonopolyGuildRankPanel.registerEvent(slot0)
	if slot0.update_rank_event == nil then
		slot0.update_rank_event = GlobalEvent:getInstance():Bind(MonopolyEvent.Get_Guild_Rank_Data_Event, function (slot0)
			if slot0 and slot0.id == uv0.step_id then
				uv0:updateRankList(slot0)
			end
		end)
	end
end

function MonopolyGuildRankPanel.setNodeVisible(slot0, slot1)
	slot0:setVisible(slot1)
end

function MonopolyGuildRankPanel.addToParent(slot0)
	if slot0.is_init == true then
		if slot0.step_id then
			uv0:sender27503(slot0.step_id, 1)
		end

		slot0.is_init = false
	end
end

function MonopolyGuildRankPanel.updateRankList(slot0, slot1)
	if slot1 and RoleController:getInstance():getRoleVo() then
		slot0.my_guile_name_txt:setString(slot1.r_name or "暂无")
		slot0.my_chairman_txt:setString(slot1.r_leader_name or "暂无")
		slot0.my_guild_lev_txt:setString(slot1.r_lev or 0)
		slot0.my_guild_num_txt:setString(string.format("%d/%d", slot1.r_member or 0, slot1.r_member_max or 0))
		slot0.my_guild_hurt_txt:setString(MoneyTool.GetMoneyWanString(slot1.r_dps or 0))

		if (slot1.r_rank or 0) <= 3 then
			slot0.my_rank_txt:setVisible(false)

			if slot3 == 0 then
				slot0.rank_img:setVisible(false)
				slot0.no_rank:setVisible(true)
			else
				slot0.no_rank:setVisible(false)

				if slot0.rank_res_id ~= PathTool.getResFrame("common", string.format("common_200%s", slot3)) then
					slot0.rank_res_id = slot4

					loadSpriteTexture(slot0.rank_img, slot4, LOADTEXT_TYPE_PLIST)
				end

				slot0.rank_img:setVisible(true)
			end
		else
			slot0.my_rank_txt:setVisible(true)
			slot0.my_rank_txt:setString(slot3)
			slot0.rank_img:setVisible(false)
		end

		if slot1.guild_stage_rank ~= nil and next(slot1.guild_stage_rank) ~= nil then
			table.sort(slot1.guild_stage_rank, SortTools.KeyLowerSorter("rank"))
			slot0.scroll_view:setData(slot1.guild_stage_rank)
			slot0.empty_bg:setVisible(false)
		else
			slot0.empty_bg:setVisible(true)
		end
	end
end

function MonopolyGuildRankPanel.DeleteMe(slot0)
	if slot0.update_rank_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_rank_event)

		slot0.update_rank_event = nil
	end

	if slot0.role_head then
		slot0.role_head:DeleteMe()

		slot0.role_head = nil
	end

	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()

		slot0.scroll_view = nil
	end
end

MonopolyGuildRankItem = class("MonopolyGuildRankItem", function ()
	return ccui.Widget:create()
end)

function MonopolyGuildRankItem.ctor(slot0)
	slot0.width = 614
	slot0.height = 125

	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(slot0.width, slot0.height))
	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setTouchEnabled(false)
	slot0:configUI()
end

function MonopolyGuildRankItem.configUI(slot0)
	slot0.back = ccui.Widget:create()

	slot0.back:setCascadeOpacityEnabled(true)
	slot0.back:setContentSize(cc.size(slot0.width, slot0.height))
	slot0.back:setAnchorPoint(cc.p(0, 0))
	slot0:addChild(slot0.back)

	slot0.background = createImage(slot0.back, PathTool.getResFrame("common", "common_1029"), slot0.width / 2, slot0.height / 2, cc.p(0.5, 0.5), true, 0, true)

	slot0.background:setContentSize(cc.size(slot0.width, slot0.height))

	slot0.rank_icon = createImage(slot0, nil, 60, slot0.height / 2, cc.p(0.5, 0.5), true, 1, false)
	slot0.rank_index = createLabel(30, 186, nil, 50, 40, "", slot0, 0, cc.p(0.5, 0), "fonts/title.ttf")
	slot0.my_guile_name_txt = createLabel(24, 175, nil, 197, 80, "", slot0, nil, cc.p(0.5, 0.5))
	slot0.my_chairman_txt = createLabel(20, 186, nil, 197, 50, "", slot0, nil, cc.p(0.5, 0.5))
	slot0.my_guild_lev_txt = createLabel(24, 175, nil, 335, 62, "", slot0, nil, cc.p(0.5, 0.5))
	slot0.my_guild_num_txt = createLabel(24, 175, nil, 431, 62, "", slot0, nil, cc.p(0.5, 0.5))
	slot0.my_guild_hurt_txt = createRichLabel(24, 186, cc.p(0.5, 0.5), cc.p(543, 62), 0, 0, 500)

	slot0:addChild(slot0.my_guild_hurt_txt)
end

function MonopolyGuildRankItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.index = slot1.rank or 0

	slot0.rank_index:setString(slot0.index)

	if slot0.index >= 1 and slot0.index <= 3 then
		slot0.rank_index:setVisible(false)
		slot0.rank_icon:setVisible(true)
		slot0.rank_icon:loadTexture(PathTool.getResFrame("common", "common_200" .. slot0.index), LOADTEXT_TYPE_PLIST)
		slot0.rank_icon:setScale(0.7)
	else
		slot0.rank_index:setVisible(true)
		slot0.rank_icon:setVisible(false)
	end

	slot0.my_guile_name_txt:setString(slot1.name or "")
	slot0.my_chairman_txt:setString(slot1.leader_name or "")
	slot0.my_guild_lev_txt:setString(slot1.lev or 0)
	slot0.my_guild_num_txt:setString(string.format("%d/%d", slot1.member or 0, slot1.member_max or 0))
	slot0.my_guild_hurt_txt:setString(MoneyTool.GetMoneyWanString(slot1.dps or 0))
end

function MonopolyGuildRankItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
