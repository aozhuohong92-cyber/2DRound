PartnerSummonItem = class("PartnerSummonItem", function ()
	return ccui.Widget:create()
end)
PartnerSummonItem.HEIGHT = 224
PartnerSummonItem.WIDTH = 653
slot0 = RoleController:getInstance():getRoleVo()
slot1 = string.format
slot3 = PartnersummonController:getInstance():getModel()

function PartnerSummonItem.ctor(slot0, slot1)
	slot0.index = slot1 or 0
	slot0.remain_free_num = 0
	slot0.remain_free_time = 0
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.size = cc.size(PartnerSummonItem.WIDTH, PartnerSummonItem.HEIGHT)

	slot0:setContentSize(slot0.size)
	slot0:setAnchorPoint(cc.p(0, 1))

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("partnersummon/partnersummon_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.item_bg = slot0.container:getChildByName("item_bg")
	slot0.unlock_container = slot0.container:getChildByName("unlock_container")
	slot0.good = slot0.container:getChildByName("good")
	slot0.good_bg = slot0.container:getChildByName("good_bg")
	slot0.good_num_label = slot0.container:getChildByName("good_num_label")
	slot0.one_btn = createButton(slot0.unlock_container, TI18N("招募1次"), 155, 45, cc.size(187, 78), PathTool.getResFrame("partnersummon", "partnersummon_btn_2"), 30)
	slot0.one_btn_bg = createImage(slot0.one_btn:getRoot(), PathTool.getResFrame("partnersummon", "partnersummon_tag_bg"), slot0.one_btn:getContentSize().width / 2, 25, nil, true)

	slot0.one_btn_bg:setScale9Enabled(true)
	slot0.one_btn_bg:setCapInsets(cc.rect(8, 6, 1, 1))
	slot0.one_btn_bg:setContentSize(cc.size(130, 29))
	slot0.one_btn:setRichText(TI18N("<div fontColor=#ffffff fontsize=26 outline=2,#020019>招募1次</div>"))
	slot0.one_btn:setRichLabelPosition(45.5, 73)

	slot0.one_btn.status = 0
	slot0.price_one_label = createRichLabel(20, 1, cc.p(0.5, 0.5), cc.p(slot0.one_btn_bg:getContentSize().width / 2, slot0.one_btn_bg:getContentSize().height / 2))

	slot0.price_one_label:setString("")
	slot0.one_btn_bg:addChild(slot0.price_one_label)
	slot0.one_btn:getButton():setName(string.format("guildsign_summon_%s_%s", slot0.index, 1))

	slot0.five_btn = createButton(slot0.unlock_container, TI18N("招募10次"), 510, 45, cc.size(187, 78), PathTool.getResFrame("partnersummon", "partnersummon_btn"), 30)
	slot0.five_btn_bg = createImage(slot0.five_btn:getRoot(), PathTool.getResFrame("partnersummon", "partnersummon_tag_bg"), slot0.five_btn:getContentSize().width / 2, 25, nil, true)

	slot0.five_btn_bg:setScale9Enabled(true)
	slot0.five_btn_bg:setCapInsets(cc.rect(8, 6, 1, 1))
	slot0.five_btn_bg:setContentSize(cc.size(130, 29))
	slot0.five_btn:setRichText(TI18N("<div fontColor=#ffffff fontsize=26 outline=2,#020019>招募10次</div>"))
	slot0.five_btn:setRichLabelPosition(45.5, 73)

	slot0.five_btn.status = 0
	slot0.nine_zhe_icon = createSprite(PathTool.getResFrame("partnersummon", "txt_cn_partnersummon_1"), 190, 95, slot0.five_btn:getRoot())

	breatheShineAction3(slot0.nine_zhe_icon)
	slot0.nine_zhe_icon:setVisible(false)

	slot0.price_five_label = createRichLabel(18, 1, cc.p(0.5, 0.5), cc.p(slot0.five_btn_bg:getContentSize().width / 2, slot0.five_btn_bg:getContentSize().height / 2))

	slot0.price_five_label:setString("")
	slot0.five_btn_bg:addChild(slot0.price_five_label)

	slot0.free_time_label = createRichLabel(20, 1, cc.p(0.5, 0.5), cc.p(155, 98))

	slot0.free_time_label:setString("")
	slot0.container:addChild(slot0.free_time_label)
	slot0:registerEvent()
end

function PartnerSummonItem.registerEvent(slot0)
	if slot0.one_btn then
		slot0.one_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				if uv0.one_btn.last_time and math.abs(GameNet:getInstance():getTimeFloat() - uv0.one_btn.last_time) < 0.5 then
					return
				end

				uv0.one_btn.last_time = GameNet:getInstance():getTimeFloat()

				uv0:_onClickOneSummonBtn()
			end
		end)
	end

	if slot0.five_btn then
		slot0.five_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				if uv0.five_btn.last_time and math.abs(GameNet:getInstance():getTimeFloat() - uv0.five_btn.last_time) < 0.5 then
					return
				end

				uv0.five_btn.last_time = GameNet:getInstance():getTimeFloat()

				uv0:_onClickTenSummonBtn()
			end
		end)
	end

	if not slot0.update_summon_single_data_event then
		slot0.update_summon_single_data_event = GlobalEvent:getInstance():Bind(PartnersummonEvent.updateSummonSingleDataEvent, function (slot0)
			if uv0.group_id and slot0 then
				for slot4, slot5 in pairs(slot0) do
					if slot5 == uv0.group_id then
						uv0:setData(uv0.index, uv1:getSummonGroupDataByGroupId(uv0.group_id))

						break
					end
				end
			end
		end)
	end

	if not slot0.update_add_good_event then
		slot0.update_add_good_event = GlobalEvent:getInstance():Bind(BackpackEvent.ADD_GOODS, function (slot0, slot1)
			uv0:refreshExchangeItemNum(slot0, slot1)
		end)
	end

	if not slot0.update_delete_good_event then
		slot0.update_delete_good_event = GlobalEvent:getInstance():Bind(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
			uv0:refreshExchangeItemNum(slot0, slot1)
		end)
	end

	if not slot0.update_modify_good_event then
		slot0.update_modify_good_event = GlobalEvent:getInstance():Bind(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
			uv0:refreshExchangeItemNum(slot0, slot1)
		end)
	end

	if slot0.role_vo ~= nil and slot0.role_assets_event == nil then
		slot0.role_assets_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "friend_point" and uv0.group_id == PartnersummonConst.Summon_Type.Friend then
				uv0.good_num_label:setString(slot1)
			end
		end)
	end

	if not slot0.summon_must_star_event then
		slot0.summon_must_star_event = GlobalEvent:getInstance():Bind(PartnersummonEvent.SummonMustFiveStarEvent, function ()
			if uv0.heightSummonFiveStar then
				uv0:heightSummonFiveStar()
			end
		end)
	end
end

function PartnerSummonItem._onClickOneSummonBtn(slot0)
	slot1, slot2 = HeroController:getInstance():getModel():getHeroMaxCount()

	if slot1 <= slot2 then
		CommonAlert.show(TI18N("英雄列表已满，可通过提升VIP等级或购买增加英雄携带数量，是否前往购买？"), TI18N("前往"), function ()
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.partner)
			uv0:openPartnerSummonWindow(false)
		end, TI18N("取消"), nil, CommonAlert.type.common)

		return
	end

	if slot0.one_btn.status ~= 0 and slot0.group_id then
		if slot0.one_btn.status == PartnersummonConst.Status.Free then
			PartnersummonController:getInstance():send23201(slot0.group_id, 1, 1)
		elseif slot0.one_btn.status == PartnersummonConst.Status.special then
			PartnersummonController:getInstance():send23201(slot0.group_id, 1, 5)
		elseif slot0.one_btn.status == PartnersummonConst.Status.Item then
			PartnersummonController:getInstance():send23201(slot0.group_id, 1, 4)
		elseif slot0.one_btn.status == PartnersummonConst.Status.Gold then
			slot5 = Config.ItemData.data_get_data(slot0.info_data.item_once[1][1]).icon

			slot0:showAlert(slot0.info_data.exchange_once[1][2], Config.ItemData.data_get_data(slot0.info_data.exchange_once[1][1]).icon, Config.ItemData.data_get_data(slot0.info_data.exchange_once_gain[1][1]).name or "", slot0.info_data.exchange_once_gain[1][2], slot0.info_data.draw_list[1] or 1, function ()
				PartnersummonController:getInstance():send23201(uv0.group_id, 1, 3)
			end)
		end
	end
end

function PartnerSummonItem._onClickTenSummonBtn(slot0)
	slot1, slot2 = HeroController:getInstance():getModel():getHeroMaxCount()

	if slot1 <= slot2 then
		CommonAlert.show(TI18N("英雄列表已满，可通过提升VIP等级或购买增加英雄携带数量，是否前往购买？"), TI18N("前往"), function ()
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.partner)
			uv0:openPartnerSummonWindow(false)
		end, TI18N("取消"), nil, CommonAlert.type.common)

		return
	end

	if slot0.five_btn.status ~= 0 and slot0.info_data and slot0.group_id then
		if slot0.five_btn.status == PartnersummonConst.Status.special then
			PartnersummonController:getInstance():send23201(slot0.group_id, 10, 5)
		elseif slot0.five_btn.status == PartnersummonConst.Status.Item then
			PartnersummonController:getInstance():send23201(slot0.group_id, 10, 4)
		elseif slot0.five_btn.status == PartnersummonConst.Status.Gold then
			slot5 = Config.ItemData.data_get_data(slot0.info_data.item_five[1][1]).icon

			slot0:showAlert(slot0.info_data.exchange_five[1][2], Config.ItemData.data_get_data(slot0.info_data.exchange_five[1][1]).icon, Config.ItemData.data_get_data(slot0.info_data.exchange_five_gain[1][1]).name or "", slot0.info_data.exchange_five_gain[1][2], slot0.info_data.draw_list[2] or 10, function ()
				PartnersummonController:getInstance():send23201(uv0.group_id, 10, 3)
			end)
		end
	end
end

function PartnerSummonItem.refreshExchangeItemNum(slot0, slot1, slot2, slot3)
	if slot3 and slot0.role_vo then
		slot0.good_num_label:setString(slot0.role_vo.friend_point)
	elseif slot1 == BackPackConst.Bag_Code.BACKPACK and slot0.info_data then
		slot4 = slot0.info_data.item_once[1][1]
		slot5 = 0

		if slot0.info_data.ext_item_once and slot0.info_data.ext_item_once[1] and slot0.info_data.ext_item_once[1][1] then
			slot5 = slot0.info_data.ext_item_once[1][1]
		end

		for slot9, slot10 in pairs(slot2) do
			if slot10 and slot10.base_id and (slot4 == slot10.base_id or slot5 == slot10.base_id) then
				slot0.good_num_label:setString(BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot4))

				if slot0.group_id and slot0.group_id == PartnersummonConst.Summon_Type.Advanced then
					slot0:updateSingleBtnStatus()
					slot0:updateFiveBtnStatus()
				end

				break
			end
		end
	end
end

function PartnerSummonItem.showAlert(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if slot0.alert then
		slot0.alert:close()

		slot0.alert = nil
	end

	function slot7()
		if uv0.alert then
			uv0.alert:close()

			uv0.alert = nil
		end
	end

	if not slot0.alert then
		slot0.alert = CommonAlert.show(string.format(TI18N("是否使用<img src=%s visible=true scale=0.3 /><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#020019>(拥有:</div><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#020019>)\n</div>"), PathTool.getItemRes(slot2), slot1, RoleController:getInstance():getRoleVo().gold + RoleController:getInstance():getRoleVo().red_gold) .. string.format(TI18N("<div fontColor=#020019>购买</div><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#020019></div><div fontColor=#d95014 fontsize= 26>%s</div><div fontColor=#020019>(同时附赠</div><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#020019>次招募)</div>"), slot4, slot3, slot5), TI18N("确定"), slot6, TI18N("取消"), nil, CommonAlert.type.rich)
	end
end

function PartnerSummonItem.setData(slot0, slot1, slot2)
	if slot2 then
		slot0.index = slot1
		slot0.info_data = slot2.info_data or {}
		slot0.proto_data = slot2.proto_data or {}
		slot0.group_id = slot2.group_id

		if slot0.res_id ~= PathTool.getPlistImgForDownLoad("bigbg/partnersummon", slot0.info_data.card_bg_res) then
			slot0.res_id = slot3
			slot0.item_load = createResourcesLoad(slot0.res_id, ResourcesType.single, function ()
				if not tolua.isnull(uv0.item_bg) then
					loadSpriteTexture(uv0.item_bg, uv0.res_id, LOADTEXT_TYPE)
				end
			end, slot0.item_load)
		end

		if slot0.group_id == PartnersummonConst.Summon_Type.Friend and slot0.role_vo then
			slot0.good_num_label:setString(slot0.role_vo.friend_point)
		end

		if PartnersummonConst.Good_Bg[slot0.group_id] then
			slot0.good_bg:loadTexture(PathTool.getResFrame("partnersummon", slot4), LOADTEXT_TYPE_PLIST)
		end

		if slot0.info_data and slot0.info_data.item_once[1][1] then
			slot0.good:loadTexture(PathTool.getItemRes(Config.ItemData.data_get_data(slot5).icon), LOADTEXT_TYPE)

			if slot0.group_id ~= PartnersummonConst.Summon_Type.Friend then
				slot0.good_num_label:setString(BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot5))
			end
		end

		slot0:heightSummonFiveStar()
		slot0.nine_zhe_icon:setVisible(slot0.group_id == PartnersummonConst.Summon_Type.Advanced)
		slot0:updateSingleBtnStatus()
		slot0:updateFiveBtnStatus()
	end
end

function PartnerSummonItem.heightSummonFiveStar(slot0)
	if not slot0.group_id then
		return
	end

	if slot0.group_id ~= PartnersummonConst.Summon_Type.Advanced then
		return
	end

	if uv0:getFiveStarHeroIsOut() == 0 then
		if slot0.remain_star_num then
			slot0.remain_star_num:DeleteMe()

			slot0.remain_star_num = nil
		end

		if slot0.star_num then
			slot0.star_num:DeleteMe()

			slot0.star_num = nil
		end

		if slot0.five_star then
			slot0.five_star:setVisible(false)
		end

		if not slot0.special_label then
			slot0.special_label = createRichLabel(22, cc.c4b(255, 255, 255, 255), cc.p(0, 0.5), cc.p(25, 146))

			slot0.container:addChild(slot0.special_label)
		end

		slot0.special_label:setString(TI18N("<div fontcolor=#ffffff fontsize=22 outline=2,#8f1c00>随机召唤1个或10个3~5星英雄</div>"))
	else
		if slot0.special_label then
			slot0.special_label:setVisible(false)
		end

		if not slot0.five_star then
			slot0.five_star = createSprite(PathTool.getResFrame("partnersummon", "txt_cn_partnersummon_300"), 7, 139, slot0.container, cc.p(0, 0.5))
		end

		if not slot0.remain_star_num then
			slot0.remain_star_num = CommonNum.new(31, slot0.five_star, 1, 5, cc.p(0.5, 0.5))

			slot0.remain_star_num:setPosition(45, 36)
		end

		slot0.remain_star_num:setNum(slot1)

		if not slot0.star_num then
			slot0.star_num = CommonNum.new(31, slot0.five_star, 1, 5, cc.p(0.5, 0.5))

			slot0.star_num:setPosition(231, 36)
		end

		slot0.star_num:setNum(5)
	end
end

function PartnerSummonItem.getValueByKey(slot0, slot1, slot2)
	slot3 = 0

	for slot7, slot8 in pairs((slot1 or {}).draw_list or {}) do
		if slot8.times == 1 and slot8.kv_list then
			for slot12, slot13 in pairs(slot8.kv_list) do
				if slot13.key == slot2 then
					slot3 = slot13.val
				end
			end

			break
		end
	end

	return slot3
end

function PartnerSummonItem.updateSingleBtnStatus(slot0)
	if slot0.proto_data and slot0.info_data and slot0.group_id then
		slot1 = slot0.info_data.item_once[1][1]
		slot2 = nil

		if slot0.info_data.ext_item_once and slot0.info_data.ext_item_once[1] and slot0.info_data.ext_item_once[1][1] then
			slot2 = slot0.info_data.ext_item_once[1][1]
		end

		slot3 = BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot1)
		slot4 = slot2 and BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot2) or 0
		slot0.remain_free_num = slot0:getValueByKey(slot0.proto_data, PartnersummonConst.Recruit_Key.Free_Count)
		slot0.remain_free_time = slot0:getValueByKey(slot0.proto_data, PartnersummonConst.Recruit_Key.Free_Time)

		if slot0.remain_free_num > 0 then
			slot0.one_btn.status = PartnersummonConst.Status.Free

			slot0.price_one_label:setString(TI18N("<div fontColor=#ffffff fontsize=20>免费召唤</div>"))
		else
			if slot4 < (slot0.info_data.draw_list[1] or 1) and slot3 < slot5 and slot0.group_id == PartnersummonConst.Summon_Type.Advanced then
				slot0.one_btn.status = PartnersummonConst.Status.Gold

				if slot0.info_data.exchange_once[1][1] and Config.ItemData.data_get_data(slot6) then
					slot0.price_one_label:setString(string.format(TI18N("<img src=%s visible=true scale=0.3 /> <div fontColor=%s fontsize=20> %s  </div>"), PathTool.getItemRes(Config.ItemData.data_get_data(slot6).icon), tranformC3bTostr(1), slot0.info_data.exchange_once[1][2]))
				end
			elseif slot5 <= slot4 then
				slot0.one_btn.status = PartnersummonConst.Status.special

				if slot0.info_data.ext_item_once[1][1] and Config.ItemData.data_get_data(slot6) then
					slot0.price_one_label:setString(string.format(TI18N("<img src=%s visible=true scale=0.35 /> <div fontColor=#ffffff fontsize=20> %s</div>"), PathTool.getItemRes(Config.ItemData.data_get_data(slot6).icon), slot0.info_data.ext_item_once[1][2]))
				end
			else
				slot0.one_btn.status = PartnersummonConst.Status.Item

				if slot0.info_data.item_once[1][1] and Config.ItemData.data_get_data(slot6) then
					slot0.price_one_label:setString(string.format(TI18N("<img src=%s visible=true scale=0.35 /> <div fontColor=#ffffff fontsize=20> %s</div>"), PathTool.getItemRes(Config.ItemData.data_get_data(slot6).icon), slot0.info_data.item_once[1][2]))
				end
			end

			slot0:openSummonFreeTimer(true)
		end
	end
end

function PartnerSummonItem.updateFiveBtnStatus(slot0)
	if slot0.group_id and slot0.info_data then
		slot1 = slot0.info_data.item_five[1][1]
		slot2 = nil

		if slot0.info_data.ext_item_five and slot0.info_data.ext_item_five[1] and slot0.info_data.ext_item_five[1][1] then
			slot2 = slot0.info_data.ext_item_five[1][1]
		end

		slot6 = ""

		if (slot2 and BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot2) or 0) < (slot0.info_data.draw_list[2] or 10) and BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot1) < slot5 and slot0.group_id == PartnersummonConst.Summon_Type.Advanced then
			slot0.five_btn.status = PartnersummonConst.Status.Gold

			if Config.ItemData.data_get_data(slot0.info_data.exchange_five[1][1]) then
				slot6 = string.format(TI18N("<img src=%s visible=true scale=0.3 /> <div fontColor=%s fontsize=20> %s  </div>"), PathTool.getItemRes(Config.ItemData.data_get_data(slot7).icon), tranformC3bTostr(1), slot0.info_data.exchange_five[1][2])
			end
		elseif slot5 <= slot4 then
			slot0.five_btn.status = PartnersummonConst.Status.special

			if Config.ItemData.data_get_data(slot0.info_data.ext_item_five[1][1]) then
				slot6 = string.format(TI18N("<img src=%s visible=true scale=0.35 /> <div fontColor=#ffffff fontsize=20>%s</div>"), PathTool.getItemRes(Config.ItemData.data_get_data(slot7).icon), slot0.info_data.ext_item_five[1][2])
			end
		else
			slot0.five_btn.status = PartnersummonConst.Status.Item

			if Config.ItemData.data_get_data(slot0.info_data.item_five[1][1]) then
				slot6 = string.format(TI18N("<img src=%s visible=true scale=0.35 /> <div fontColor=#ffffff fontsize=20>%s</div>"), PathTool.getItemRes(Config.ItemData.data_get_data(slot7).icon), slot0.info_data.item_five[1][2])
			end
		end

		slot0.price_five_label:setString(slot6)
	end
end

function PartnerSummonItem.openSummonFreeTimer(slot0, slot1)
	if slot1 == true then
		slot0.left_time = slot0.remain_free_time - GameNet:getInstance():getTime()

		if not slot0.free_time_label or tolua.isnull(slot0.free_time_label) then
			if slot0.summon_timer ~= nil then
				GlobalTimeTicket:getInstance():remove(slot0.summon_timer)

				slot0.summon_timer = nil
			end

			return
		end

		if slot0.left_time > 0 then
			slot0.free_time_label:setVisible(true)
			slot0.free_time_label:setString(string.format(TI18N("<div  fontColor=#35ff14 outline=2,#000000 >%s</div><div fontColor=#ffffff outline=2,#000000>后免费</div>"), TimeTool.GetTimeFormat(slot0.left_time)))

			if not slot0.summon_timer then
				slot0.summon_timer = GlobalTimeTicket:getInstance():add(function ()
					if uv0.remain_free_time and uv0.remain_free_time - GameNet:getInstance():getTime() > 0 then
						uv0.left_time = uv0.remain_free_time - GameNet:getInstance():getTime()

						uv0.free_time_label:setVisible(true)
						uv0.free_time_label:setString(string.format(TI18N("<div  fontColor=#35ff14 outline=2,#000000 >%s</div><div fontColor=#ffffff outline=2,#000000>后免费</div>"), TimeTool.GetTimeFormat(uv0.left_time)))
					else
						uv0.free_time_label:setVisible(false)
						GlobalTimeTicket:getInstance():remove(uv0.summon_timer)

						uv0.summon_timer = nil
					end
				end, 1)
			end
		else
			slot0.free_time_label:setVisible(false)

			if slot0.summon_timer ~= nil then
				GlobalTimeTicket:getInstance():remove(slot0.summon_timer)

				slot0.summon_timer = nil
			end
		end
	elseif slot0.summon_timer ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.summon_timer)

		slot0.summon_timer = nil
	end
end

function PartnerSummonItem.DeleteMe(slot0)
	if slot0.remain_star_num then
		slot0.remain_star_num:DeleteMe()

		slot0.remain_star_num = nil
	end

	if slot0.star_num then
		slot0.star_num:DeleteMe()

		slot0.star_num = nil
	end

	doStopAllActions(slot0.nine_zhe_icon)
	slot0:openSummonFreeTimer(false)

	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	if slot0.role_vo ~= nil and slot0.role_assets_event ~= nil then
		slot0.role_vo:UnBind(slot0.role_assets_event)

		slot0.role_assets_event = nil
	end

	if slot0.update_summon_single_data_event then
		GlobalEvent:getInstance():UnBind(slot0.update_summon_single_data_event)

		slot0.update_summon_single_data_event = nil
	end

	if slot0.update_add_good_event then
		GlobalEvent:getInstance():UnBind(slot0.update_add_good_event)

		slot0.update_add_good_event = nil
	end

	if slot0.update_delete_good_event then
		GlobalEvent:getInstance():UnBind(slot0.update_delete_good_event)

		slot0.update_delete_good_event = nil
	end

	if slot0.update_modify_good_event then
		GlobalEvent:getInstance():UnBind(slot0.update_modify_good_event)

		slot0.update_modify_good_event = nil
	end

	if slot0.summon_must_star_event then
		GlobalEvent:getInstance():UnBind(slot0.summon_must_star_event)

		slot0.summon_must_star_event = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
