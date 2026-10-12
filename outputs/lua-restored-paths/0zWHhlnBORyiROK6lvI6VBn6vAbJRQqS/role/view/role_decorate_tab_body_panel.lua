RoleDecorateTabBodyPanel = class("RoleDecorateTabBodyPanel", function ()
	return ccui.Widget:create()
end);
slot1 = RoleController:getInstance():getModel();
slot2 = string.format;
slot3 = table.insert;
slot4 = RoleController:getInstance():getRoleVo();
slot5 = table.sort;
slot6 = math.floor;

function RoleDecorateTabBodyPanel.ctor(slot0, slot1)
	slot0:config();

	if setting then
		slot0.show_item_id = setting.id;
	end

	slot0:layoutUI();
	slot0:registerEvents();
end

function RoleDecorateTabBodyPanel.config(slot0)
end

function RoleDecorateTabBodyPanel.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("roleinfo/role_decorate_tab_body_panel"));

	slot0:addChild(slot0.root_wnd);

	slot0.size = slot0.root_wnd:getContentSize();

	slot0:setContentSize(slot0.size);

	slot0.main_container = slot0.root_wnd:getChildByName("main_container");
	slot0.tab_list = {};

	for slot7 = 1, 4 do
		slot8 = {
			btn = slot9,
			index = slot7,
			select_bg = slot9:getChildByName("select_img")
		};

		slot8.select_bg:setVisible(false);

		slot8.label = slot0.main_container:getChildByName("tab_container"):getChildByName("tab_btn_" .. slot7):getChildByName("label");

		slot8.label:setString(({
			TI18N("1~5星"),
			TI18N("6星"),
			TI18N("10星"),
			TI18N("皮肤")
		})[slot7] or "");
		slot8.label:setTextColor(cc.c4b(248, 194, 60, 255));

		slot0.tab_list[slot7] = slot8;

		if slot7 == 4 then
			slot8.btn:setVisible(false);
		end
	end

	slot0.comfirm_btn = slot0.main_container:getChildByName("comfirm_btn");
	slot0.comfirm_btn_label = slot0.comfirm_btn:getChildByName("label");

	slot0.comfirm_btn_label:setString(TI18N("确定"));

	slot0.scrollCon = slot0.main_container:getChildByName("scrollCon");

	slot0.main_container:getChildByName("att_label"):setString(TI18N("形象属性"));
	slot0.main_container:getChildByName("lock_label"):setString(TI18N("解锁条件"));

	slot0.unlock = createRichLabel(20, 178, cc.p(0.5, 0.5), cc.p(448, 406));

	slot0.main_container:addChild(slot0.unlock);
	slot0.unlock:setString(TI18N("当前形象已解锁"));
	slot0.unlock:setVisible(false);

	slot0.not_attr_tips = createRichLabel(20, 186, cc.p(0.5, 0.5), cc.p(448, 544));

	slot0.main_container:addChild(slot0.not_attr_tips);
	slot0.not_attr_tips:setString(TI18N("当前形象无属性加成"));
	slot0.not_attr_tips:setVisible(false);

	slot0.attr_label_list = {};
	slot8 = 510;

	for slot8 = 1, 4 do
		slot0.attr_label_list[slot8] = createRichLabel(20, cc.c4b(36, 144, 3, 255), cc.p(0, 0), ({
			cc.p(350, 544),
			cc.p(460, 544),
			cc.p(350, 510),
			cc.p(460, slot8)
		})[slot8]);

		slot0.main_container:addChild(slot0.attr_label_list[slot8]);
		slot0.attr_label_list[slot8]:setString("");
	end

	slot0.term_list = {};
	slot0.term_status_list = {};

	for slot11 = 1, 3 do
		slot12 = 421 - 24 * (slot11 - 1);
		slot0.term_list[slot11] = createRichLabel(20, 175, cc.p(0, 0), cc.p(320, slot12), nil, nil, 500);
		slot0.term_status_list[slot11] = createRichLabel(20, cc.c4b(100, 50, 35, 255), cc.p(1, 0), cc.p(574, slot12));

		slot0.main_container:addChild(slot0.term_list[slot11]);
		slot0.main_container:addChild(slot0.term_status_list[slot11]);
	end

	uv0:requestRoleModelInfo();
end

function RoleDecorateTabBodyPanel.registerEvents(slot0)
	function slot4()
		uv0:onComfirmBtn();
	end

	slot5 = true;

	registerButtonEventListener(slot0.comfirm_btn, slot4, slot5, REGISTER_BUTTON_SOUND_BUTTON_TYPY);

	for slot4, slot5 in ipairs(slot0.tab_list) do
		registerButtonEventListener(slot5.btn, function ()
			uv0:changeTabType(uv1, true);
		end, false, 1);
	end

	if not slot0.updateModelList then
		slot0.updateModelList = GlobalEvent:getInstance():Bind(RoleEvent.GetModelList, function (slot0)
			if slot0 ~= nil then
				uv0:setData(slot0);
			end
		end);
	end

	if not slot0.updateModelEvent then
		slot0.updateModelEvent = GlobalEvent:getInstance():Bind(RoleEvent.UpdateModel, function (slot0)
			if not slot0 then
				return
			end

			if not uv0.dic_datas then
				return
			end

			if uv0.dic_datas[slot0] == nil then
				return
			end

			uv0.dic_datas[uv0.use_id].used = 0;
			uv0.dic_datas[slot0].used = 1;

			if uv0.dic_index_data[uv0:checkIndexByConfig(uv0.dic_datas[slot0].vo)] then
				uv1(uv0.dic_index_data[slot1], SortTools.tableCommonSorter({
					{
						"used",
						true
					},
					{
						"show",
						false
					},
					{
						"id",
						false
					}
				}));
			end

			uv0.use_id = slot0;

			if uv0.cur_tab_index == slot1 then
				uv0:updateList(slot1);
			end
		end);
	end

	if not slot0.activeModelEvent then
		slot0.activeModelEvent = GlobalEvent:getInstance():Bind(RoleEvent.ActiveModel, function (slot0)
			if not slot0 or uv0.dic_datas[slot0] == nil then
				return
			end

			uv0.show_list[slot0] = true;
			uv0.dic_datas[slot0].show = 2;

			for slot5, slot6 in ipairs(uv0.list_view:getActiveCellList()) do
				if slot6.vo and slot7.id == slot0 then
					uv0:updateCellByIndex(slot6, slot6.index);
				end
			end

			if uv0.select_item and uv0.select_item.vo and uv0.select_item.vo.id == slot0 then
				uv0.comfirm_btn_label:setString(TI18N("更 换"));
			end
		end);
	end
end

function RoleDecorateTabBodyPanel.onComfirmBtn(slot0)
	if not slot0.show_list then
		return
	end

	if slot0.select_item then
		if not slot0.select_item.vo then
			return
		end

		if slot0.show_list[slot1.id] or next(slot1.attr) == nil then
			if slot1 and slot1.id == slot0.use_id then
				message(TI18N("该形象已在使用中"));

				return
			end

			uv0:changeRoleModel(slot1.id);
		else
			slot2 = HeroController:getModel():getHadHeroStarBybid(slot1.bid);

			if (RoleController:getInstance():getRoleVo() and slot3.lev or 0) < slot1.lev then
				message(TI18N("等级不足"));

				return
			end

			if slot2 < slot1.star then
				message(uv1(TI18N("%s未达到%s星"), slot1.name, slot1.star));

				return
			end

			if next(slot1.expend) then
				if Config.ItemData.data_get_data(slot1.expend[1][1]) then
					if BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot5.id) < slot1.expend[1][2] then
						BackpackController:getInstance():openTipsSource(true, slot5);

						return
					end
				else
					return
				end
			end

			uv0:activeRoleModel(slot1.id);
		end
	end
end

function RoleDecorateTabBodyPanel.setData(slot0, slot1)
	slot0.use_id = slot1.use_id;
	slot0.show_list = {};

	if slot1.list then
		for slot5, slot6 in pairs(slot1.list) do
			slot0.show_list[slot6.id] = true;
		end
	end

	if not Config.LooksData.data_data then
		return
	end

	slot0.dic_datas = {};
	slot0.dic_index_data = {};

	for slot6 = 1, 4 do
		slot0.dic_index_data[slot6] = {};
	end

	slot3 = {};
	slot4 = 1;

	for slot8, slot9 in pairs(slot2) do
		slot10 = slot0:checkIndexByConfig(slot9);

		if slot0.show_list[slot9.id] then
			-- Nothing
		elseif slot0:getIsActiveByConfig(slot9) then
			slot11.show = 1;
		else
			slot11.show = 3;
		end

		if slot0.use_id == slot9.id then
			slot4 = slot10;
			slot11.used = 1;
		else
			slot11.used = 0;
		end

		if slot10 == 4 then
			if slot3[slot9.ico_id] == nil then
				slot3[slot9.ico_id] = {};
			end

			uv0(slot3[slot9.ico_id], slot11);
		else
			uv0(slot0.dic_index_data[slot10], slot11);
		end

		slot0.dic_datas[slot9.id] = {
			vo = slot9,
			id = slot9.id,
			show = 2
		};
	end

	slot5 = false;

	for slot9, slot10 in pairs(slot3) do
		uv1(slot10, function (slot0, slot1)
			return slot0.id < slot1.id
		end);

		slot5 = false;

		for slot15 = #slot10, 1, -1 do
			if slot10[slot15] and slot16.show == 2 then
				slot5 = true;

				uv0(slot0.dic_index_data[4], slot16);

				if slot16.vo.pre_id and slot0.use_id == slot16.vo.pre_id then
					slot16.used = 1;
					slot0.use_id = slot16.vo.id;
				end

				break
			end
		end

		if not slot5 and slot10[1] then
			uv0(slot0.dic_index_data[4], slot10[1]);
		end
	end

	for slot10 = 1, 4 do
		uv1(slot0.dic_index_data[slot10], SortTools.tableCommonSorter({
			{
				"used",
				true
			},
			{
				"show",
				false
			},
			{
				"id",
				false
			}
		}));
	end

	slot0:changeTabType(slot4);
end

function RoleDecorateTabBodyPanel.checkIndexByConfig(slot0, slot1)
	if slot1 then
		if slot1.skin_id and slot1.skin_id ~= 0 then
			return 4
		elseif slot1.star <= 5 then
			return 1
		elseif slot1.star >= 6 and slot1.star <= 9 then
			return 2
		else
			return 3
		end
	end
end

function RoleDecorateTabBodyPanel.changeTabType(slot0, slot1, slot2)
	if not slot0.show_list then
		return
	end

	if slot2 and slot0.cur_tab_index == slot1 then
		return
	end

	if slot0.cur_tab ~= nil then
		slot0.cur_tab.label:setTextColor(cc.c4b(248, 194, 60, 255));
		slot0.cur_tab.select_bg:setVisible(false);
	end

	slot0.cur_tab_index = slot1;
	slot0.cur_tab = slot0.tab_list[slot0.cur_tab_index];

	if slot0.cur_tab ~= nil then
		slot0.cur_tab.label:setTextColor(cc.c4b(71, 44, 30, 255));
		slot0.cur_tab.select_bg:setVisible(true);
	end

	slot0:updateList(slot1);
end

function RoleDecorateTabBodyPanel.updateList(slot0, slot1)
	if not slot1 then
		return
	end

	if not slot0.scrollCon then
		return
	end

	if slot0.list_view == nil then
		slot0.list_view = CommonScrollViewSingleLayout.new(slot0.scrollCon, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.scrollCon:getContentSize(), {
			start_y = 0,
			row = 0,
			start_x = 0,
			space_x = 0,
			item_width = 118,
			item_height = 130,
			space_y = 0,
			col = 5,
			need_dynamic = true
		}, cc.p(0, 0));

		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell);
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells);
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex);
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.onCellTouched), ScrollViewFuncType.OnCellTouched);
	end

	slot0.data_list = slot0.dic_index_data[slot1] or {};

	if slot0.show_item_id ~= nil then
		slot2 = false;

		for slot6, slot7 in ipairs(slot0.data_list) do
			if next(slot7.vo.expend) and v.expend[1][1] == slot0.show_item_id then
				slot2 = true;

				slot0.list_view:reloadData(slot6);
			end
		end

		if not slot2 then
			slot0.list_view:reloadData(1);
		end

		slot0.show_item_id = nil;
	else
		slot0.list_view:reloadData(1);
	end
end

function RoleDecorateTabBodyPanel.createNewCell(slot0, slot1, slot2)
	slot3 = RoleBodyItem.new();

	slot3:setTouchFunc(function ()
		uv0:onCellTouched(uv1);
	end);

	return slot3
end

function RoleDecorateTabBodyPanel.numberOfCells(slot0)
	return #slot0.data_list
end

function RoleDecorateTabBodyPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2;
	slot3 = slot0.data_list[slot2];

	slot1:setData(slot3.vo, slot2);

	if slot0.show_list[slot3.id] then
		slot1:showLock(false);
	else
		slot1:showLock(true);
	end

	if slot3.show == 1 then
		slot1:showActiveIcon(true);
	else
		slot1:showActiveIcon(false);
	end

	if slot3.used == 1 then
		slot1:showUseIcon(true);
	else
		slot1:showUseIcon(false);
	end

	if slot0.select_id and slot0.select_id == slot3.id then
		slot1:setSelected(true);
	else
		slot1:setSelected(false);
	end
end

function RoleDecorateTabBodyPanel.onCellTouched(slot0, slot1)
	slot3 = slot0.data_list[slot1.index];

	if slot0.select_item ~= nil then
		slot0.select_item:setSelected(false);
	end

	slot0.select_id = slot3.id;
	slot0.select_item = slot1;

	slot0.select_item:setSelected(true);
	slot0:updateMessage(slot3.vo);
end

function RoleDecorateTabBodyPanel.updateMessage(slot0, slot1)
	if not slot1 then
		return
	end

	if slot1.skin_id and slot1.skin_id ~= 0 then
		if Config.PartnerSkinData.data_skin_info[slot1.skin_id] then
			(function (slot0)
				uv0.not_attr_tips:setVisible(false);

				if #slot0 <= 0 then
					uv0.not_attr_tips:setVisible(true);
				else
					for slot4, slot5 in ipairs(uv0.attr_label_list) do
						if slot0[slot4] ~= nil then
							slot5:setVisible(true);

							if PartnerCalculate.isShowPerByStr(slot6[1]) then
								slot5:setString(uv1("%s: %s%%", Config.AttrData.data_key_to_name[slot6[1]], slot6[2] / 10));
							else
								slot5:setString(uv1("%s: %s", slot7, slot6[2]));
							end
						else
							slot5:setVisible(false);
						end
					end
				end
			end)(slot3.skin_attr);
		else
			slot0.not_attr_tips:setVisible(true);
		end

		slot0.comfirm_btn_label:setString(TI18N("更 换"));
	elseif next(slot1.expend) then
		if next(slot1.attr) then
			slot2(slot1.attr);
		end

		if slot0.show_list[slot1.id] then
			slot0.comfirm_btn_label:setString(TI18N("更 换"));
		else
			slot0.comfirm_btn_label:setString(TI18N("激 活"));
		end
	else
		slot6 = true;

		slot0.not_attr_tips:setVisible(slot6);

		for slot6, slot7 in ipairs(slot0.attr_label_list) do
			slot7:setVisible(false);
		end

		slot0.comfirm_btn_label:setString(TI18N("更 换"));
	end

	slot3 = HeroController:getModel():getHadHeroStarBybid(slot1.partner_id);

	if slot1.id ~= slot0.use_id then
		if slot0.select_item:getIsLock() then
			slot0.unlock:setVisible(false);

			slot4 = {
				[slot6] = uv0(TI18N("解锁皮肤%s"), slot1.name)
			};
			slot5 = {
				[slot6] = TI18N("<div fontcolor=#249003>已达成</div>")
			};
			slot6 = 1;

			if slot1.skin_id and slot1.skin_id ~= 0 then
				if HeroController:getModel():isUnlockHeroSkin(slot1.skin_id) then
					-- Nothing
				else
					slot5[slot6] = TI18N("<div fontcolor=#d95014>未达成</div>");
				end

				slot6 = slot6 + 1;
				slot8 = Config.PartnerData.data_partner_base[slot1.partner_id];

				if slot1.star > 0 then
					slot9 = nil;
					slot4[slot6] = uv0(TI18N("%s达到%s星"), (not slot8 or slot8.name) and slot1.name, slot1.star);

					if slot1.star <= slot3 then
						slot5[slot6] = TI18N("<div fontcolor=#249003>已达成</div>");
					else
						slot5[slot6] = TI18N("<div fontcolor=#d95014>未达成</div>");
					end

					slot6 = slot6 + 1;
				end
			else
				if slot1.star > 0 then
					slot4[slot6] = uv0(TI18N("%s达到%s星"), slot1.name, slot1.star);

					if slot1.star <= slot3 then
						slot5[slot6] = TI18N("<div fontcolor=#249003>已达成</div>");
					else
						slot5[slot6] = TI18N("<div fontcolor=#d95014>未达成</div>");
					end

					slot6 = slot6 + 1;
				end

				if slot1.lev > 0 then
					slot4[slot6] = uv0(TI18N("玩家等级达到%s"), slot1.lev);

					if slot1.lev <= (RoleController:getInstance():getRoleVo() and slot7.lev or 0) then
						slot5[slot6] = TI18N("<div fontcolor=#249003>已达成</div>");
					else
						slot5[slot6] = TI18N("<div fontcolor=#d95014>未达成</div>");
					end

					slot6 = slot6 + 1;
				end
			end

			if next(slot1.expend) and Config.ItemData.data_get_data(slot1.expend[1][1]) then
				slot4[slot6] = uv0(TI18N("拥有%s个%s"), slot1.expend[1][2], slot7.name);

				if slot1.expend[1][2] <= BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot7.id) then
					slot5[slot6] = TI18N("<div fontcolor=#249003>已达成</div>");
				else
					slot5[slot6] = TI18N("<div fontcolor=#d95014>未达成</div>");
				end

				slot6 = slot6 + 1;
			end

			for slot10, slot11 in ipairs(slot0.term_list) do
				if slot4[slot10] then
					slot11:setVisible(true);
					slot0.term_status_list[slot10]:setVisible(true);
					slot11:setString(slot4[slot10]);
					slot0.term_status_list[slot10]:setString(slot5[slot10]);
				else
					slot11:setVisible(false);
					slot0.term_status_list[slot10]:setVisible(false);
				end
			end
		else
			for slot7, slot8 in ipairs(slot0.term_list) do
				slot8:setVisible(false);
			end

			for slot7, slot8 in ipairs(slot0.term_status_list) do
				slot8:setVisible(false);
			end

			slot0.unlock:setVisible(true);
		end
	else
		for slot7, slot8 in ipairs(slot0.term_list) do
			slot8:setVisible(false);
		end

		for slot7, slot8 in ipairs(slot0.term_status_list) do
			slot8:setVisible(false);
		end

		slot0.unlock:setVisible(true);
	end

	slot0:updateSpine(slot1);
end

function RoleDecorateTabBodyPanel.updateSpine(slot0, slot1)
	if slot0.record_id and slot0.record_id == slot1.id then
		return
	end

	slot0.record_id = slot1.id;

	if slot0.spine then
		slot0.spine:setCascade(true);
		doStopAllActions(slot0.spine);
		slot0.spine:removeFromParent();

		slot0.spine = nil;

		(function ()
			if not uv0.spine then
				uv0.spine = BaseRole.new(BaseRole.type.role, uv1.id, nil);

				uv0.spine:setAnimation(0, PlayerAction.show, true);
				uv0.spine:setCascade(true);
				uv0.spine:setPosition(cc.p(150, 420));
				uv0.spine:setAnchorPoint(cc.p(0.5, 0));
				uv0.spine:setScale(0.5);
				uv0.main_container:addChild(uv0.spine);
				uv0.spine:setCascade(true);
				uv0.spine:setOpacity(0);
				uv0.spine:runAction(cc.Sequence:create(cc.FadeIn:create(0.2)));
			end
		end)();
	else
		slot2();
	end
end

function RoleDecorateTabBodyPanel.getIsActiveByConfig(slot0, slot1)
	if slot1.skin_id and slot1.skin_id ~= 0 then
		return false
	end

	slot2 = true;

	if slot1.star > 0 and HeroController:getModel():getHadHeroStarBybid(slot1.bid) < slot1.star then
		slot2 = false;
	end

	slot3 = true;

	if slot1.lev > 0 and (RoleController:getInstance():getRoleVo() and slot4.lev or 0) < slot1.lev then
		slot3 = false;
	end

	slot4 = true;

	if next(slot1.expend) then
		if Config.ItemData.data_get_data(slot1.expend[1][1]) and BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot5.id) < slot1.expend[1][2] then
			slot4 = false;
		end
	else
		slot4 = false;
	end

	return slot4 and slot3 and slot2, slot2, slot3, slot4
end

function RoleDecorateTabBodyPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1);
end

function RoleDecorateTabBodyPanel.DeleteMe(slot0)
	if slot0.list_view then
		slot0.list_view:DeleteMe();

		slot0.list_view = nil;
	end

	if slot0.item_list then
		for slot4, slot5 in pairs(slot0.item_list) do
			if slot5 and slot5.DeleteMe then
				slot5:DeleteMe();
			end
		end
	end

	slot0.item_list = nil;

	if slot0.updateModelList then
		slot0.updateModelList = GlobalEvent:getInstance():UnBind(slot0.updateModelList);
		slot0.updateModelList = nil;
	end

	if slot0.updateModelEvent then
		slot0.updateModelEvent = GlobalEvent:getInstance():UnBind(slot0.updateModelEvent);
		slot0.updateModelEvent = nil;
	end

	if slot0.activeModelEvent then
		slot0.activeModelEvent = GlobalEvent:getInstance():UnBind(slot0.activeModelEvent);
		slot0.activeModelEvent = nil;
	end
end

RoleBodyItem = class("RoleBodyItem", function ()
	return ccui.Widget:create()
end);

function RoleBodyItem.ctor(slot0, slot1)
	slot0.width = 85;
	slot0.height = 85;
	slot0.is_lock = false;
	slot0.is_use = false;
	slot0.is_can_active = false;

	slot0:setContentSize(cc.size(slot0.width, slot0.height));
	slot0:setAnchorPoint(cc.p(0.5, 0.5));
	slot0:configUI();
end

function RoleBodyItem.setTouchFunc(slot0, slot1)
	slot0.call_fun = slot1;
end

function RoleBodyItem.configUI(slot0)
	slot0.back = ccui.Widget:create();

	slot0.back:setCascadeOpacityEnabled(true);
	slot0.back:setContentSize(cc.size(100, 100));
	slot0.back:setAnchorPoint(cc.p(0, 0));
	slot0.back:setTouchEnabled(true);
	slot0:addChild(slot0.back);
	slot0.back:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended and uv0.call_fun then
			uv0:call_fun(uv0.vo);
		end
	end);

	slot0.player_head = PlayerHead.new(PlayerHead.type.circle);

	slot0.player_head:setAnchorPoint(cc.p(0.5, 0.5));
	slot0.player_head:setPosition(cc.p(slot0.width / 2, 55));
	slot0.player_head:setTouchEnabled(false);
	slot0:addChild(slot0.player_head);

	slot0.select = ccui.ImageView:create(PathTool.getResFrame("common", "common_1060"), LOADTEXT_TYPE_PLIST);

	slot0.select:setAnchorPoint(cc.p(0, 0));
	slot0.select:setPosition(cc.p(-14, -2));
	slot0.select:setVisible(false);
	slot0:addChild(slot0.select);

	slot0.name = createLabel(22, Config.ColorData.data_color4[175], nil, slot0.width / 2, -25, "name", slot0, 0, cc.p(0.5, 0));

	slot0:showLock(true);
end

function RoleBodyItem.setData(slot0, slot1)
	slot0.vo = slot1;

	if slot1.skin_id and slot1.skin_id ~= 0 then
		if Config.PartnerSkinData.data_skin_info[slot1.skin_id] then
			slot0.player_head:setHeadRes(slot2.head_id);
		end
	else
		slot0.player_head:setHeadRes(slot1.partner_id);
	end

	slot0.name:setString(slot1.name);
end

function RoleBodyItem.setSelected(slot0, slot1)
	slot0.select:setVisible(slot1);

	if slot1 == true then
		slot0.select:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.FadeIn:create(0.7), cc.FadeOut:create(0.7))));
	else
		doStopAllActions(slot0.select);
	end
end

function RoleBodyItem.showLock(slot0, slot1)
	setChildUnEnabled(slot1, slot0.player_head);

	slot0.is_lock = slot1;
end

function RoleBodyItem.showUseIcon(slot0, slot1)
	slot0.is_use = slot1;

	if not slot0.use_icon and slot1 == false then
		return
	end

	if not slot0.use_icon then
		slot0.use_icon = createImage(slot0, PathTool.getResFrame("face", "txt_cn_face_use"), 60, 25, cc.p(0.5, 0.5), true, 1, false);
	end

	slot0.use_icon:setVisible(slot1);
end

function RoleBodyItem.showActiveIcon(slot0, slot1)
	if slot1 and not slot0.active_icon then
		slot0.active_icon = createImage(slot0, PathTool.getResFrame("common", "txt_cn_common_30017"), 60, 25, cc.p(0.5, 0.5), true, 1, false);

		slot0.active_icon:setScale(0.7);
	end

	if slot0.active_icon then
		slot0.active_icon:setVisible(slot1);
	end
end

function RoleBodyItem.getData(slot0)
	return slot0.vo
end

function RoleBodyItem.getIsLock(slot0)
	return slot0.is_lock
end

function RoleBodyItem.DeleteMe(slot0)
	if slot0.player_head then
		slot0.player_head:DeleteMe();
	end

	slot0:removeAllChildren();
	slot0:removeFromParent();

	slot0.vo = nil;
end
