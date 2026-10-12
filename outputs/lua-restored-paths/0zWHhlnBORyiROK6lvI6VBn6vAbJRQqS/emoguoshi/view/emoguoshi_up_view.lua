EmoguoshiUpView = EmoguoshiUpView or BaseClass(BaseView);
slot0 = EmoguoshiController:getInstance();

function EmoguoshiUpView.__init(slot0)
	slot0.is_full_screen = true;
	slot0.win_type = WinType.Mini;
	slot0.layout_name = "emoguoshitujian/emoguoshi_qianghua_panel";
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("emoguoshi", "emoguoshi"),
			type = ResourcesType.plist
		}
	};
	slot0.att_bg_list2 = {};
	slot0.att_bg_list3 = {};
	slot0.desc_list = {};
	slot0.tag_btn_list = {};
	slot0.need_item_bg_list2 = {};
	slot0.need_item_bg_list3 = {};
	slot0.show_tag = 0;
	slot0.select_hero_tbl = {};
	slot0.select_item_tbl = {};
end

function EmoguoshiUpView.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("bg");

	slot0.background:setScale(display.getMaxScale());

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel");
	slot0.btn_up = slot0.main_panel:getChildByName("button");
	slot0.label_up_title = slot0.btn_up:getChildByName("label");
	slot0.btn_close = slot0.main_panel:getChildByName("close_btn");
	slot0.tips_max = slot0.main_panel:getChildByName("tips_max");
	slot0.left_node_bg = slot0.main_panel:getChildByName("Panel_1"):getChildByName("item_panel_1"):getChildByName("Node_1");
	slot0.right_node_bg = slot0.main_panel:getChildByName("Panel_1"):getChildByName("item_panel_2"):getChildByName("Node_1");
	slot0.btn_star_tips = slot0.main_panel:getChildByName("Panel_3"):getChildByName("Image_title"):getChildByName("tips_panel");
	slot0.label_effect_title = slot0.main_panel:getChildByName("Panel_3"):getChildByName("Image_title"):getChildByName("title");
	slot1 = slot0.main_panel:getChildByName("Panel_1");
	slot0.label_name_left = slot1:getChildByName("Panel_lev"):getChildByName("Text_1");
	slot0.label_name_right = slot1:getChildByName("Panel_lev_next"):getChildByName("Text_1");
	slot0.att_bg2 = slot0.main_panel:getChildByName("Panel_2");

	for slot6 = 1, 2 do
		slot7 = slot2:getChildByName("attr_" .. slot6);
		slot8 = slot7:getChildByName("attr_icon");

		slot8:setUnifySizeEnabled(true);

		slot0.att_bg_list2[slot6] = {
			slot8,
			slot7:getChildByName("label_attr"),
			slot7:getChildByName("num"),
			slot7:getChildByName("num_next")
		};
	end

	slot0.att_bg3 = slot0.main_panel:getChildByName("Panel_2_1");

	for slot7 = 1, 3 do
		slot8 = slot3:getChildByName("attr_" .. slot7);
		slot9 = slot8:getChildByName("attr_icon");

		slot9:setUnifySizeEnabled(true);

		slot0.att_bg_list3[slot7] = {
			slot9,
			slot8:getChildByName("label_attr"),
			slot8:getChildByName("num"),
			slot8:getChildByName("num_next")
		};
	end

	for slot8 = 1, 4 do
		slot9 = slot0.main_panel:getChildByName("Panel_3"):getChildByName("panel_desc_" .. slot8);
		slot0.desc_list[slot8] = {
			slot9:getChildByName("tips"),
			slot9:getChildByName("desc")
		};
	end

	slot5 = slot0.main_panel:getChildByName("Panel_4");

	for slot10 = 1, 3 do
		slot11 = slot5:getChildByName("Button_" .. slot10);

		slot11:getChildByName("label"):setString(({
			TI18N("升级"),
			TI18N("升星"),
			TI18N("觉醒")
		})[slot10]);

		slot0.tag_btn_list[slot10] = slot11;
	end

	slot10 = "panel_wupin_1";
	slot0.need_item_bg2 = slot5:getChildByName(slot10);

	for slot10 = 1, 2 do
		slot11 = slot0.need_item_bg2:getChildByName("Node_" .. slot10);
		slot0.need_item_bg_list2[slot10] = {
			slot11,
			slot11:getChildByName("label")
		};
	end

	slot10 = "panel_wupin_2";
	slot0.need_item_bg3 = slot5:getChildByName(slot10);

	for slot10 = 1, 3 do
		slot11 = slot0.need_item_bg3:getChildByName("Node_" .. slot10);
		slot0.need_item_bg_list3[slot10] = {
			slot11,
			slot11:getChildByName("label")
		};
	end
end

function EmoguoshiUpView.register_event(slot0)
	slot0.background:setTouchEnabled(true);

	function slot4(slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound();
			uv0:openUpView(false);
		end
	end

	slot0.background:addTouchEventListener(slot4);

	for slot4, slot5 in pairs(slot0.tag_btn_list) do
		slot5:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1, scale);

			if slot1 == ccui.TouchEventType.ended then
				playCloseSound();
				uv0:changeTag(uv1);
			end
		end);
	end

	slot0.btn_up:setTouchEnabled(true);
	registerButtonEventListener(slot0.btn_up, function ()
		if uv0.show_tag == EmoguoshiConst.upView.level then
			uv1:reqLevelUp(uv0.id);
		elseif uv0.show_tag == EmoguoshiConst.upView.star then
			if uv1:getGuoShiLevel(uv0.id) <= 0 then
				message(TI18N("果实未激活"));

				return
			end

			slot0 = {};
			slot1 = {};

			for slot5, slot6 in pairs(uv0.select_hero_tbl) do
				if slot6.is_hero_hun then
					if slot6.good_vo then
						table.insert(slot1, {
							num = 1,
							base_id = slot6.good_vo.base_id
						});
					end
				else
					table.insert(slot0, {
						use_id = slot6.partner_id
					});
				end
			end

			uv1:reqStarUp(uv0.id, slot0, slot1);
		elseif uv0.show_tag == EmoguoshiConst.upView.juexing then
			if uv1:isHadJueXing(uv0.id) then
				message(TI18N("已经觉醒"));

				return
			end

			slot0 = {};

			for slot4, slot5 in pairs(uv0.select_item_tbl) do
				if slot5 > 0 then
					table.insert(slot0, {
						use_id = slot4,
						use_num = slot5
					});
				end
			end

			uv1:reqJueXing(uv0.id, slot0);
		end
	end, true);
	slot0.btn_close:setTouchEnabled(true);
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openUpView(false);
	end, true);
	slot0.btn_star_tips:setTouchEnabled(true);
	registerButtonEventListener(slot0.btn_star_tips, function ()
		uv0:openEmoguoStarTipsView(true, uv1.id);
	end, true);
	slot0:addGlobalEvent(EmoguoshiEvent.ONE_INFO, function (...)
		uv0:updateAll();
		uv0:updateTips();
	end);
	slot0:addGlobalEvent(HeroEvent.Upgrade_Star_Select_Event, function (...)
		if uv0.select_hero_cb then
			uv0.select_hero_cb();
		end
	end);
end

function EmoguoshiUpView.updateTips(slot0, ...)
	if not slot0.id then
		return
	end

	slot0.tag_btn_list[EmoguoshiConst.upView.level]:getChildByName("red_point"):setVisible(uv0:isCanLevelUp(slot0.id));
	slot0.tag_btn_list[EmoguoshiConst.upView.star]:getChildByName("red_point"):setVisible(uv0:isCanStarUp(slot0.id));
	slot0.tag_btn_list[EmoguoshiConst.upView.juexing]:getChildByName("red_point"):setVisible(uv0:isCanJueXing(slot0.id));
end

function EmoguoshiUpView.changeTag(slot0, slot1)
	if slot0.show_tag == slot1 then
		return
	end

	if slot1 == EmoguoshiConst.upView.juexing and uv0:getGuoShiStar(slot0.id) < uv0:getMaxStar(slot0.id) then
		message(uv0:getGuoShiName(slot0.id) .. string.format(TI18N("需要达到%d星才可觉醒"), slot2));

		return
	end

	for slot5, slot6 in pairs(slot0.tag_btn_list) do
		slot6:setBright(slot1 == slot5);
	end

	slot0.show_tag = slot1;

	slot0.label_up_title:setString(({
		TI18N("升级"),
		TI18N("升星"),
		TI18N("觉醒")
	})[slot1]);
	slot0.label_effect_title:setString(({
		TI18N("节点效果"),
		TI18N("专属效果"),
		TI18N("觉醒效果")
	})[slot1]);
	slot0.btn_star_tips:setVisible(slot1 == EmoguoshiConst.upView.star);
	slot0:updateAll();
end

function EmoguoshiUpView.updateAll(slot0, ...)
	slot0.select_hero_tbl = {};
	slot0.select_item_tbl = {};

	if slot0.tag_btn_list[EmoguoshiConst.upView.juexing] then
		setChildUnEnabled(uv0:getGuoShiStar(slot0.id) < uv0:getMaxStar(slot0.id), slot1);
	end

	slot0.tips_max:setString(TI18N("已满级"));

	slot2 = uv0:getGuoShiLevel(slot0.id);
	slot5 = uv0:getPropLevel(slot0.id, slot2 + 1);

	slot0.label_name_left:setString(TI18N(uv0:getGuoShiName(slot0.id)) .. "+" .. slot2);

	if uv0:getPropLevel(slot0.id, slot2) then
		now_att = slot4.atts;
	end

	if slot0.show_tag ~= EmoguoshiConst.upView.level then
		slot0.label_name_right:setString(TI18N(slot3) .. "+" .. slot2);
	elseif slot5 then
		slot0.label_name_right:setString(TI18N(slot3) .. "+" .. slot2 + 1);
	else
		slot0.label_name_right:setString(TI18N(slot3) .. "+" .. slot2);
	end

	if slot0.show_tag == EmoguoshiConst.upView.level then
		slot0:updateLevelUp();
	elseif slot0.show_tag == EmoguoshiConst.upView.star then
		slot0:updateStarUp();
	elseif slot0.show_tag == EmoguoshiConst.upView.juexing then
		slot0:updateJueXing();
	end

	if not slot0.head_left then
		slot0.head_left = BackPackItem.new(true, true, nil, nil, false, false);

		slot0.head_left:setBaseData(uv0:getGuoShiItemId(slot0.id), 1);
		slot0.head_left:isChipSprite({});
		slot0.left_node_bg:addChild(slot0.head_left);
		slot0.main_panel:getChildByName("Panel_1"):getChildByName("item_panel_1"):getChildByName("Image_bg"):loadTexture(PathTool.getQualityBg(uv0:getGuoShiQuality(slot0.id)), LOADTEXT_TYPE_PLIST);
	end

	if not slot0.head_right then
		slot0.head_right = BackPackItem.new(true, true, nil, nil, false, false);

		slot0.head_right:setBaseData(uv0:getGuoShiItemId(slot0.id), 1);
		slot0.head_right:isChipSprite({});
		slot0.right_node_bg:addChild(slot0.head_right);
		slot0.main_panel:getChildByName("Panel_1"):getChildByName("item_panel_2"):getChildByName("Image_bg"):loadTexture(PathTool.getQualityBg(slot6), LOADTEXT_TYPE_PLIST);
	end

	slot8 = uv0:getMaxStar(slot0.id);

	(function (slot0, slot1)
		slot0:getChildByName("Panel_star_1"):setVisible(false);
		slot0:getChildByName("Panel_star_2"):setVisible(false);
		slot0:getChildByName("Image_juexing"):setVisible(false);

		if uv0:isHadJueXing(uv1.id) then
			slot4:setVisible(true);

			return
		end

		slot5 = nil;

		(uv2 > 5 and slot2 or slot3):setVisible(true);

		for slot9 = 1, 10 do
			if slot5:getChildByName("star_" .. slot9) then
				slot10:setVisible(slot9 <= slot1);
				slot5:getChildByName("star_gray_" .. slot9):setVisible(slot1 < slot9);
			else
				break
			end
		end
	end)(slot0.main_panel:getChildByName("Panel_1"):getChildByName("item_panel_1"), uv0:getGuoShiStar(slot0.id));

	if slot0.show_tag ~= EmoguoshiConst.upView.star then
		slot11(slot0.main_panel:getChildByName("Panel_1"):getChildByName("item_panel_2"), slot7);
	else
		slot11(slot10, slot7 + 1);
	end
end

function EmoguoshiUpView.setAtt(slot0, slot1, slot2, slot3)
	slot0.att_bg2:setVisible(false);
	slot0.att_bg3:setVisible(false);

	slot4 = {};

	if not (slot2 or slot1) then
		return
	end

	function slot6(slot0, slot1)
		if not slot1 then
			if not uv0 then
				return uv1 or 0
			end

			return 0
		end

		for slot5, slot6 in pairs(slot1) do
			if slot6[1] == slot0 then
				return slot6[2]
			end
		end

		return 0
	end

	for slot10, slot11 in pairs(slot5) do
		table.insert(slot4, {
			slot11[1],
			slot6(slot11[1], slot1),
			slot6(slot11[1], slot2)
		});
	end

	slot7 = nil;

	if #slot4 > 2 then
		slot0.att_bg3:setVisible(true);

		slot7 = slot0.att_bg_list3;
	else
		slot0.att_bg2:setVisible(true);

		slot7 = slot0.att_bg_list2;
	end

	for slot11, slot12 in ipairs(slot4) do
		if slot7[slot11] then
			slot14 = slot12[1];
			slot15, slot16, slot17 = commonGetAttrInfoByKeyValue(slot14, slot12[2]);
			slot18, slot19, slot20 = commonGetAttrInfoByKeyValue(slot14, slot12[3]);

			slot13[1]:loadTexture(slot18, LOADTEXT_TYPE_PLIST);
			slot13[2]:setString(TI18N(slot19));
			slot13[3]:setString(slot17);
			slot13[4]:setString(slot20);
		end
	end
end

function EmoguoshiUpView.setNeedItems(slot0, slot1, slot2, slot3)
	slot0.need_item_bg2:setVisible(false);
	slot0.need_item_bg3:setVisible(false);
	slot0.tips_max:setVisible(false);

	if not slot1 then
		slot0.tips_max:setVisible(true);

		return
	end

	if slot2 then
		slot4 = #slot1 + #slot2;
	end

	if slot3 then
		slot4 = slot4 + #slot3;
	end

	slot5 = 0;
	slot6 = nil;

	if slot4 > 2 then
		slot0.need_item_bg3:setVisible(true);

		slot6 = slot0.need_item_bg_list3;
	elseif slot4 == 1 then
		slot5 = 1;

		slot0.need_item_bg3:setVisible(true);

		slot6 = slot0.need_item_bg_list3;
	else
		slot0.need_item_bg2:setVisible(true);

		slot6 = slot0.need_item_bg_list2;
	end

	for slot10, slot11 in pairs(slot6) do
		slot11[1]:setVisible(false);

		if slot11[1].item then
			slot11[1].item:setVisible(false);
		end

		if slot11[1].hero then
			slot11[1].hero:setVisible(false);
		end

		slot0:setNeedColor(slot11[2], true);
	end

	slot7 = {};
	slot8 = {};

	for slot12, slot13 in pairs(slot1) do
		if slot6[slot5 + 1] then
			slot15 = slot14[1];
			slot16 = slot14[2];

			slot15:setVisible(true);

			if not slot15.item then
				slot17 = BackPackItem.new(true, true, nil, nil, false, true);

				slot15:addChild(slot17);

				slot15.item = slot17;

				slot17:setScale(0.8);
			end

			slot15.item:setVisible(true);
			slot15.item:setBaseData(slot13[1], 1);
			slot15.item:addBtnCallBack(nil);
			table.insert(slot7, function (...)
				slot0 = BackpackController:getInstance():getModel():getItemNumByBid(uv0[1]) - (uv1[uv0[1]] or 0);

				uv2:setString(MoneyTool.GetMoneyString(slot0) .. "/" .. MoneyTool.GetMoneyString(uv0[2]));
				uv3:setNeedColor(uv2, uv0[2] <= slot0);
			end);
		end
	end

	(function (...)
		uv0 = {};

		if uv1.select_item_tbl then
			for slot3, slot4 in pairs(uv1.select_item_tbl) do
				if BackpackController:getInstance():getModel():getBagItemById(BackPackConst.Bag_Code.BACKPACK, slot3) then
					uv0[slot5.base_id] = slot4;
				end
			end
		end

		for slot3, slot4 in pairs(uv2) do
			slot4();
		end
	end)();

	if slot3 then
		for slot13, slot14 in pairs(slot3) do
			if slot6[slot13 + slot5] then
				slot16 = slot15[1];
				slot17 = slot15[2];

				slot16:setVisible(true);

				slot18 = BackpackController:getInstance():getModel():getItemNumByBid(slot14[1]);

				if not slot16.item then
					slot19 = BackPackItem.new(true, true, nil, nil, false, true);

					slot16:addChild(slot19);

					slot16.item = slot19;

					slot19:setScale(0.8);
				end

				slot16.item:setVisible(true);
				slot16.item:setBaseData(slot14[1], 1);
				slot17:setString(slot18 .. "/" .. slot14[2]);
				slot0:setNeedColor(slot17, slot14[2] <= slot18);
				slot16.item:addBtnCallBack(function (...)
					print("_wannen_item====");

					uv0.select_item_tbl = {};

					uv1:openEmoguoshiSuipianSelectView(true, uv2[1], uv2[2], function (slot0)
						print("_wannen_item====cb=======");

						uv0.select_item_tbl = slot0;

						for slot5, slot6 in pairs(slot0) do
							slot1 = 0 + slot6;
						end

						uv1:setString(slot1 .. "/" .. uv2[2]);
						uv0:setNeedColor(uv1, uv2[2] <= slot1);
						uv3();
					end);
				end);
			end
		end

		slot5 = slot5 + #slot3;
	end

	if slot2 then
		for slot13, slot14 in pairs(slot2) do
			if slot6[slot13 + slot5] then
				slot16 = slot15[1];
				slot17 = slot15[2];

				slot16:setVisible(true);

				if not slot16.hero then
					slot18 = HeroExhibitionItem.new(0.8, true);

					slot16:addChild(slot18);

					slot16.hero = slot18;
				end

				slot16.hero:setVisible(true);
				slot16.hero:setHeadUnEnabled(true);

				slot20 = {
					dic_select_list = {}
				};

				slot16.hero:addCallBack(function (...)
					function uv0.select_hero_cb(...)
						for slot4, slot5 in pairs(uv0.dic_select_list) do
							slot0 = 0 + 1;
							uv1.select_hero_tbl[slot5.partner_id] = slot5;
						end

						uv2.hero.num_label:setString(string.format("%s/%s", slot0, uv3.count));

						if slot0 > 0 then
							uv2.hero:setHeadUnEnabled(false);
						else
							uv2.hero:setHeadUnEnabled(true);
						end
					end

					uv1.bid = uv3.bid;
					uv1.star = uv3.star;
					uv1.count = uv3.count;
					uv1.camp_type = uv3.camp_type;

					uv4:openHeroUpgradeStarSelectPanel(true, uv1, {}, HeroConst.SelectHeroType.eUpgradeStar, {});
				end);
				slot16.hero:setHeroName(false);

				if slot14.bid == 0 then
					slot16.hero:setData(slot14);
					slot16.hero:setDefaultHead(HeroController:getInstance():getModel():getRandomHeroHeadByQuality(slot14.star));
					slot17:setString(string.format(TI18N("%s星伙伴"), slot14.star));
				else
					slot16.hero:setData(slot14);
					slot17:setString(TI18N(slot14.name));
				end
			end
		end
	end
end

function EmoguoshiUpView.setNeedColor(slot0, slot1, slot2)
	if slot2 then
		slot1:setTextColor(cc.c3b(63, 63, 63));
	else
		slot1:setTextColor(cc.c3b(255, 0, 0));
	end
end

function EmoguoshiUpView.setDesc(slot0, slot1)
	for slot5, slot6 in pairs(slot0.desc_list) do
		slot6[1]:setVisible(false);
		slot6[2]:setVisible(false);
	end

	if #slot1 == 1 then
		(function (slot0, slot1)
			if not uv0.desc_list[slot0] then
				return
			end

			slot3 = "emoguoshi_07.png";
			slot4 = cc.c3b(63, 63, 63);

			if slot1[1] then
				slot3 = "emoguoshi_08.png";
				slot4 = cc.c3b(0, 162, 34);
			end

			slot2[1]:setVisible(true);
			slot2[1]:loadTexture(slot3, LOADTEXT_TYPE_PLIST);
			slot2[2]:setVisible(true);
			slot2[2]:setString(TI18N(slot1[2]));
			slot2[2]:setTextColor(slot4);
		end)(4, slot1[1]);

		return
	end

	for slot6, slot7 in pairs(slot1) do
		if slot6 <= 3 then
			slot2(slot6, slot7);
		end
	end
end

function EmoguoshiUpView.updateLevelUp(slot0, ...)
	slot1 = uv0:getGuoShiLevel(slot0.id);
	slot2 = uv0:getGuoShiName(slot0.id);
	slot3 = uv0:getPropLevel(slot0.id, slot1);
	slot4 = uv0:getPropLevel(slot0.id, slot1 + 1);
	slot5, slot6, slot7 = nil;
	slot8 = 0;

	if slot1 <= 0 then
		slot0.label_up_title:setString(TI18N("激活"));
	else
		slot0.label_up_title:setString(TI18N("升级"));
	end

	if slot3 then
		slot5 = slot3.atts;
	end

	if slot4 then
		slot6 = slot4.atts;
		slot7 = slot4.need_items;
		slot8 = slot4.need_star;
	end

	slot0:setAtt(slot5, slot6, TI18N("已满级"));

	if slot1 > 0 and uv0:getGuoShiStar(slot0.id) < slot8 then
		slot0.tips_max:setString(TI18N("已达当前最大等级，升星后可继续升级！"));
		slot0:setNeedItems();
	else
		slot0:setNeedItems(slot7);
	end

	slot10 = {};

	for slot14 = 1, uv0:getMaxLevel(slot0.id) do
		if uv0:getPropLevel(slot0.id, slot14).desc and slot15.desc ~= "" then
			table.insert(slot10, {
				slot14 <= slot1,
				slot15.desc
			});
		end
	end

	slot0:setDesc(slot10);
end

function EmoguoshiUpView.getHeroData(slot0, slot1, slot2, slot3, slot4)
	if slot1 == 0 then
		-- Nothing
	elseif Config.PartnerData.data_partner_base[slot1] then
		slot5.bid = slot1;
		slot5.camp_type = slot6.camp_type;
		slot5.name = slot6.name;
	else
		return nil
	end

	return {
		star = slot2 or 0,
		count = slot3 or 0,
		lev = string.format("%s/%s", 0, slot3),
		bid = 0,
		camp_type = slot4 or 0,
		dic_select_list = {}
	}
end

function EmoguoshiUpView.updateStarUp(slot0, ...)
	if uv0:getGuoShiStar(slot0.id) <= 0 then
		slot1 = 1;
	end

	slot2 = uv0:getGuoShiName(slot0.id);
	slot4 = uv0:getPropStar(slot0.id, slot1 + 1);
	slot5, slot6, slot7, slot8, slot9 = nil;

	if uv0:getPropStar(slot0.id, slot1) then
		table.insert(deepCopy(slot3.atts), {
			"max_level",
			slot3.max_level
		});
	end

	if slot4 then
		table.insert(deepCopy(slot4.atts), {
			"max_level",
			slot4.max_level
		});

		slot7 = deepCopy(slot4.need_items);
		slot8 = deepCopy(slot4.need_partner);
	end

	slot0:setAtt(slot5, slot6, TI18N("已满星"));

	if slot8 then
		slot10 = 1;

		for slot14, slot15 in ipairs(slot8) do
			table.insert({}, slot0:getHeroData(slot15[1], slot15[2], slot15[3]));
		end
	end

	slot0:setNeedItems(slot7, slot9);

	if not slot7 then
		slot0.tips_max:setString(TI18N("已达到最大星级"));
	end

	slot10 = uv0:getMaxStar(slot0.id);
	slot11 = 1;
	slot12 = {};
	slot13 = slot1;

	if uv0:getGuoShiLevel(slot0.id) <= 0 then
		slot13 = 0;
	end

	for slot17 = slot13 + 1, slot13 + 1 do
		if uv0:getPropStar(slot0.id, slot17) and slot18.desc and slot18.desc ~= "" then
			table.insert(slot12, {
				slot17 <= slot1,
				slot18.desc
			});
		end
	end

	if slot11 > #slot12 then
		for slot17 = slot13, slot13, -1 do
			if uv0:getPropStar(slot0.id, slot17) and slot18.desc and slot18.desc ~= "" then
				table.insert(slot12, {
					slot17 <= slot1,
					slot18.desc
				});
			end
		end
	end

	slot0:setDesc(slot12);
end

function EmoguoshiUpView.updateJueXing(slot0, ...)
	slot1 = uv0:getPropJueXing(slot0.id);
	slot2 = uv0:getGuoShiName(slot0.id);
	slot3, slot4 = nil;

	if uv0:isHadJueXing(slot0.id) then
		slot3 = slot1.atts;

		slot0.tips_max:setVisible(true);
		slot0.tips_max:setString(TI18N("已觉醒"));
		slot0:setNeedItems();
		slot0:setDesc({
			{
				true,
				slot1.desc
			}
		});
	else
		slot4 = slot1.atts;

		slot0.tips_max:setVisible(false);
		slot0:setNeedItems(slot1.need_items1, nil, slot1.need_items2);
		slot0:setDesc({
			{
				false,
				slot1.desc
			}
		});
	end

	slot0:setAtt(slot3, slot4, TI18N("已觉醒"));
end

function EmoguoshiUpView.openRootWnd(slot0, slot1, slot2)
	slot0.id = slot1;

	slot0:changeTag(slot2 or EmoguoshiConst.upView.level);
	slot0:updateTips();
end

function EmoguoshiUpView.close_callback(slot0)
	uv0:openUpView(false);
end
