StoneDungeonWindow = StoneDungeonWindow or BaseClass(BaseView)
slot1 = Stone_dungeonController:getInstance():getModel()
slot2 = Config.DungeonStoneData.data_const
slot3 = Config.DungeonStoneData.data_buy
slot4 = Config.DungeonStoneData.data_type_open
slot5 = Config.DungeonStoneData.data_award_list
slot6 = table.insert
slot7 = table.sort

function StoneDungeonWindow.__init(slot0)
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.is_full_screen = true
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "stonedungeon/stone_dungeon_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("activity", "activity"),
			type = ResourcesType.plist
		}
	}
	slot0.first_come_in = true
	slot0.cur_index = 1
	slot0.tab_list = {}
	slot0.banner_load = {}
end

function StoneDungeonWindow.open_callback(slot0)
	slot0.root_wnd:getChildByName("bg"):setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)
	slot0.main_container:getChildByName("Image_2"):getChildByName("Text_12"):setString(TI18N("日常副本"))
	UITool.SetTitleColor(slot0.main_container:getChildByName("Image_2"):getChildByName("Text_12"))

	slot0.textCount = slot0.main_container:getChildByName("textCount")

	if not slot0.banner_load_top then
		slot0.banner_load_top = loadSpriteTextureFromCDN(slot0.main_container:getChildByName("Image_3"), PathTool.getPlistImgForDownLoad("activity/activity_big", "activity_top"), ResourcesType.single, slot0.banner_load_top)
	end

	slot4 = slot0.main_container:getChildByName("tab_container")
	slot0.tabScrollview = CommonScrollViewLayout.new(slot4, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot4:getContentSize(), {
		start_y = 0,
		item_width = 120,
		start_x = 0,
		space_x = 20,
		row = 1,
		item_height = 136,
		space_y = 0,
		col = 0,
		item_class = StoneDungeonTab
	})
	slot0.banner = slot0.main_container:getChildByName("banner")
	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.btnRule = slot0.main_container:getChildByName("btnRule")
	slot0.scoreView = slot0.main_container:getChildByName("scoreView")
	slot0.itemScrollview = CommonScrollViewLayout.new(slot0.scoreView, cc.p(0, 5), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot0.scoreView:getContentSize().width, slot0.scoreView:getContentSize().height - 10), {
		start_y = 0,
		item_width = 616,
		start_x = 7,
		space_x = 0,
		row = 0,
		item_height = 125,
		space_y = 0,
		col = 1,
		item_class = StoneDungeonItem
	})
end

function StoneDungeonWindow.register_event(slot0)
	slot0:addGlobalEvent(Stone_dungeonEvent.Updata_StoneDungeon_Data, function (slot0)
		uv0:changeDungeonData(uv0.cur_index, 1)

		uv0.first_come_in = false

		uv0:redPointStatus()
	end)
	registerButtonEventListener(slot0.btnRule, function (slot0, slot1, slot2)
		TipsManager:getInstance():showCommonTips(Config.DungeonStoneData.data_const.desc_rule.desc, slot1:getTouchBeganPosition())
	end, true, 1, nil, 0.7)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openStoneDungeonView(false)
	end, true, 2)

	if slot0.role_vo and not slot0.updata_role_event then
		slot0.updata_role_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "lev" then
				uv0:changeDungeonData(uv0.cur_index)
			end
		end)
	end
end

function StoneDungeonWindow.redPointStatus(slot0)
	slot1 = {
		[slot3[slot7]] = false,
		[slot3[slot7]] = true
	}
	slot3 = uv0.dungeon_type.val

	for slot7 = 1, Config.DungeonStoneData.data_type_open_length do
		if uv1:getChangeSweepCount(slot3[slot7]) < 2 and MainuiController:getInstance():checkIsOpenByActivate(uv2[slot3[slot7]].activate) == true then
			-- Nothing
		end

		if slot0.tab_list[slot7] then
			slot10:setSelectRedPoint(slot1[slot3[slot7]] or false)
		end
	end

	for slot8 = 1, slot2 do
		slot4 = false or slot1[slot8] or false
	end

	return slot4
end

function StoneDungeonWindow.changeDungeonData(slot0, slot1, slot2)
	slot4 = ""
	slot5 = 1

	if uv1:getChangeSweepCount(uv0[slot1].id or 1) >= 2 then
		slot5 = 0

		if slot3 >= #uv2[slot1] then
			slot4 = string.format(TI18N("今日已无次数"))
		else
			slot6 = 1

			for slot10, slot11 in ipairs(uv2[slot1]) do
				if slot11.vip <= slot0.role_vo.vip_lev then
					slot6 = slot10
				end
			end

			if slot6 - slot3 <= 0 then
				slot7 = 0
			end

			slot4 = string.format(TI18N("今日剩余次数: %d"), slot7)
		end
	else
		slot4 = string.format(TI18N("今日免费次数: %d"), uv3.free_num.val - slot3)
	end

	slot0.textCount:setString(slot4)

	if slot0.itemScrollview then
		slot6 = {}

		for slot10, slot11 in pairs(uv4[slot1]) do
			uv5(slot6, slot11)
		end

		uv6(slot6, function (slot0, slot1)
			return slot0.id < slot1.id
		end)

		slot7 = slot0:getPoerTitle(slot6)

		if slot3 + 1 >= #uv2[slot1] then
			slot3 = #uv2[slot1]
		end

		slot8 = {
			title_pos = slot7,
			count = slot5,
			expend = uv2[slot1][slot3].cost
		}
		slot9 = slot0.itemScrollview:getItemList()

		if slot2 == 1 and slot0.first_come_in == false then
			for slot13 = 1, #slot9 do
				slot9[slot13]:setExtendData(slot8)
				slot9[slot13]:setChangeData(slot6[slot13])
			end
		else
			slot0.itemScrollview:setData(slot6, nil, nil, slot8)
			slot0.itemScrollview:jumpToMove(cc.p(0, 125 * (slot7 - 1)), 0.2)
		end
	end
end

function StoneDungeonWindow.getPoerTitle(slot0, slot1)
	slot2 = 0
	slot3 = tableLen(slot1)

	for slot7, slot8 in ipairs(slot1) do
		slot9 = uv0:getPassClearanceID(slot8.id)

		if slot8.power <= slot0.role_vo.max_power and slot9 and slot9.status == 1 then
			slot2 = slot7
		end
	end

	if slot3 <= slot2 + 1 then
		if slot1[slot2 + 1] and slot1[slot2 + 1].power <= slot0.role_vo.max_power and slot1[slot2 + 1].lev_limit <= slot0.role_vo.lev then
			slot2 = slot3
		end
	elseif slot1[slot2 + 1] and slot1[slot2 + 1].power <= slot0.role_vo.max_power and slot1[slot2 + 1].lev_limit <= slot0.role_vo.lev then
		slot2 = slot2 + 1
	else
		return slot2
	end

	return slot2
end

function StoneDungeonWindow.openRootWnd(slot0)
	uv0:send13030()

	slot2 = {}

	for slot6 = 1, #uv1.dungeon_type.val do
		table.insert(slot2, {
			id = slot1[slot6]
		})
	end

	slot0:setLoadBanner(1)
	slot0.tabScrollview:setData(slot2, function (slot0)
		if MainuiController:getInstance():checkIsOpenByActivate(uv0[slot0:getData().id].activate) == false then
			message(uv0[slot0:getData().id].desc)

			return
		end

		if uv1.cur_index == slot0:getData().id then
			return
		end

		for slot6, slot7 in pairs(uv1.tabScrollview:getItemList()) do
			if slot7:getData().id == slot0:getData().id then
				slot7:setSelect(true)
			else
				slot7:setSelect(false)
			end
		end

		uv1.cur_index = slot0:getData().id

		uv1:changeDungeonData(slot0:getData().id)
		uv1:setLoadBanner(uv0[slot0:getData().id].id)
	end)

	if slot0.tabScrollview then
		slot0.tabScrollview:addEndCallBack(function ()
			for slot4, slot5 in pairs(uv0.tabScrollview:getItemList()) do
				uv1(uv0.tab_list, slot5)
			end

			uv0:redPointStatus()
		end)
	end
end

function StoneDungeonWindow.setLoadBanner(slot0, slot1)
	if not slot0.banner_load[slot1] then
		slot0.banner_load[slot1] = loadSpriteTextureFromCDN(slot0.banner, PathTool.getPlistImgForDownLoad("activity/activity_big", string.format("txt_cn_activity_banner_%d", slot1)), ResourcesType.single, slot0.banner_load[slot1])
	else
		loadSpriteTexture(slot0.banner, slot3, LOADTEXT_TYPE)
	end
end

function StoneDungeonWindow.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.banner_load) do
		if slot5 then
			slot5:DeleteMe()

			slot5 = nil
		end
	end

	slot0.banner_load = {}

	if slot0.banner_load_top then
		slot0.banner_load_top:DeleteMe()
	end

	slot0.banner_load_top = nil

	if slot0.itemScrollview then
		slot0.itemScrollview:DeleteMe()

		slot0.itemScrollview = nil
	end

	if slot0.tabScrollview then
		slot0.tabScrollview:DeleteMe()

		slot0.tabScrollview = nil
	end

	for slot4, slot5 in pairs(slot0.tab_list) do
		if slot5.DeleteMe then
			slot5:DeleteMe()

			slot5 = nil
		end
	end

	if slot0.role_vo then
		if slot0.updata_role_event then
			slot0.role_vo:UnBind(slot0.updata_role_event)

			slot0.updata_role_event = nil
		end

		slot0.role_vo = nil
	end

	uv0:openStoneDungeonView(false)
end

StoneDungeonTab = class("StoneDungeonTab", function ()
	return ccui.Widget:create()
end)

function StoneDungeonTab.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function StoneDungeonTab.configUI(slot0)
	slot0.rootWnd = createCSBNote(PathTool.getTargetCSB("stonedungeon/stone_dungeon_tab"))

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:addChild(slot0.rootWnd)
	slot0:setTouchEnabled(true)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(120, 136))

	slot1 = slot0.rootWnd:getChildByName("main_container")
	slot0.normal = slot1:getChildByName("normal")
	slot0.title = slot1:getChildByName("title")

	slot0.title:setPositionY(22)

	slot0.condite = slot1:getChildByName("condite")
	slot0.redpoint = slot1:getChildByName("redpoint")

	slot0.redpoint:setZOrder(2)

	slot0.select = slot1:getChildByName("select")

	slot0.select:setVisible(false)

	slot0.effect = createEffectSpine(PathTool.getEffectRes(547), cc.p(63, 50), cc.p(0.5, 0.5), true, PlayerAction.action)

	slot1:addChild(slot0.effect, 1)
	slot0.effect:setVisible(false)
end

function StoneDungeonTab.setData(slot0, slot1)
	if not slot1 or next(slot1) == nil then
		return
	end

	slot0.data = slot1
	slot0.tab_load = loadSpriteTextureFromCDN(slot0.normal, PathTool.getPlistImgForDownLoad("activity/activity_tab", "activity_tab_" .. slot1.id), ResourcesType.single, slot0.tab_load)

	slot0.title:setString(uv0[slot1.id].name)

	if slot1.id == 1 then
		slot0:setSelect(true)
	end

	if MainuiController:getInstance():checkIsOpenByActivate(uv0[slot1.id].activate) == true then
		slot0.condite:setVisible(false)
	else
		slot0.condite:setVisible(true)
	end
end

function StoneDungeonTab.setSelect(slot0, slot1)
	if slot0.select and slot0.effect then
		slot0.effect:setVisible(slot1)
	end
end

function StoneDungeonTab.setSelectRedPoint(slot0, slot1)
	if slot0.redpoint then
		slot0.redpoint:setVisible(slot1)
	end
end

function StoneDungeonTab.getData(slot0)
	return slot0.data
end

function StoneDungeonTab.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function StoneDungeonTab.register_event(slot0)
	slot0:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0.touch_end = slot0:getTouchEndPosition()
			slot2 = true

			if uv0.touch_began ~= nil then
				slot2 = math.abs(uv0.touch_end.x - uv0.touch_began.x) <= 20 and math.abs(uv0.touch_end.y - uv0.touch_began.y) <= 20
			end

			if slot2 == true then
				playButtonSound2()

				if uv0.callback then
					uv0:callback()
				end
			end
		elseif slot1 == ccui.TouchEventType.moved then
			-- Nothing
		elseif slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()
		elseif slot1 == ccui.TouchEventType.canceled then
			-- Nothing
		end
	end)
end

function StoneDungeonTab.DeleteMe(slot0)
	if slot0.tab_load then
		slot0.tab_load:DeleteMe()

		slot0.tab_load = nil
	end

	if slot0.effect then
		slot0.effect:clearTracks()
		slot0.effect:removeFromParent()

		slot0.effect = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
