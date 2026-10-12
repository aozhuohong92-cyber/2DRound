BattlDramaSwapWindow = BattlDramaSwapWindow or BaseClass(BaseView);
slot0 = BattleDramaController:getInstance();
slot1 = BattleDramaController:getInstance():getModel();

function BattlDramaSwapWindow.__init(slot0, slot1)
	slot0.win_type = WinType.Mini;
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG;
	slot0.dun_id = slot1;
	slot0.layout_name = "battledrama/battle_drama_swap_view";
end

function BattlDramaSwapWindow.open_callback(slot0)
	slot0.panel_bg = slot0.root_wnd:getChildByName("Panel_bg");
	slot0.background = slot0.panel_bg:getChildByName("background");

	slot0.panel_bg:setScale(display.getMaxScale());

	slot0.main_container = slot0.root_wnd:getChildByName("root");
	slot0.close_btn = slot0.main_container:getChildByName("close_btn");
	slot0.ack_button = slot0.main_container:getChildByName("ack_button");
	slot0.ack_button.label = slot0.ack_button:getTitleRenderer();

	slot0.ack_button.label:enableOutline(Config.ColorData.data_color4[82], 2);

	slot0.swap_num_desc = slot0.main_container:getChildByName("swap_num_desc");

	slot0.swap_num_desc:setString(TI18N("扫荡卷的数量:"));

	slot0.swap_num = slot0.main_container:getChildByName("swap_num");

	slot0.swap_num:setString(BackpackController:getInstance():getModel():getBackPackItemNumByBid(Config.DungeonData.data_drama_const.swap_item.val));

	slot0.swap_num_label = createRichLabel(24, 117, cc.p(0.5, 0.5), cc.p(365, 630), nil, nil, 1000);

	slot0.main_container:addChild(slot0.swap_num_label);
	slot0.swap_num_label:setVisible(true);

	slot0.icon = slot0.main_container:getChildByName("icon");

	slot0.icon:loadTexture(PathTool.getItemRes(Config.ItemData.data_get_data(Config.DungeonData.data_drama_const.swap_item.val).icon), LOADTEXT_TYPE);

	slot0.num_bar = CommonNumBar.New(slot0.main_container, cc.size(165, 52), 20);

	slot0.num_bar:setMinSuffix(1);
	slot0.num_bar:setAnchorPoint(0, 1);
	slot0.num_bar:setPosition(285, 705);
	slot0.num_bar:setNum(1);
	slot0.num_bar.background:setContentSize(cc.size(165, 52));

	if BattleDramaController:getInstance():getModel():getDramaData() then
		if slot0.num_bar then
			slot0.num_bar:registerHandle(function (slot0, slot1)
				if uv0:getCurDunInfoByID(uv1.dun_id) and slot3.auto_num then
					slot5 = math.min(BackpackController:getInstance():getModel():getBackPackItemNumByBid(Config.DungeonData.data_drama_const.swap_item.val), uv2.auto_num_max - slot3.auto_num);

					if slot0 ~= "add" then
						-- Nothing
					end

					if slot5 < slot1 then
						message(TI18N("已达最大次数"));
						uv1.num_bar:setNum(slot5);

						return
					end
				end
			end);
		end

		if uv0:getCurDunInfoByID(slot0.dun_id) and slot4.auto_num then
			slot0.swap_num_label:setString(string.format(TI18N("<div fontColor=#68452a>(剩余:%s次)</div>"), slot3.auto_num_max - slot4.auto_num));
		end
	end
end

function BattlDramaSwapWindow.register_event(slot0)
	if slot0.background then
		slot0.background:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2();
				uv0:openDramSwapView(false);
			end
		end);
	end

	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2();
				uv0:openDramSwapView(false);
			end
		end);
	end

	if slot0.ack_button then
		slot0.ack_button:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2();

				if uv0.dun_id then
					uv0.num = uv0.num_bar:getNum();

					if uv0.num and uv0.num ~= 0 then
						uv1:send13005(uv0.dun_id, uv0.num);
					else
						message("请选择扫荡次数");
					end
				end
			end
		end);
	end
end

function BattlDramaSwapWindow.openRootWnd(slot0, slot1)
end

function BattlDramaSwapWindow.close_callback(slot0)
	if slot0.num_bar then
		slot0.num_bar:DeleteMe();
	end

	uv0:openDramSwapView(false);
end
