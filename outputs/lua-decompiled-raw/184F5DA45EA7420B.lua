BattleDramaRewardWindow = BattleDramaRewardWindow or BaseClass(BaseView)
slot0 = BattleDramaController:getInstance()
slot1 = BattleDramaController:getInstance():getModel()
slot2 = string.format
slot3 = table.sort
slot4 = table.insert

function BattleDramaRewardWindow.__init(slot0, slot1)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.dun_id = slot1
	slot0.layout_name = "battledrama/battle_drama_reward_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_61"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("battledrop", "battledrop"),
			type = ResourcesType.plist
		}
	}
	slot0.item_list = {}
end

function BattleDramaRewardWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")
	slot0.container = slot1

	slot0:playEnterAnimatianByObj(slot0.container, 2)
	slot1:getChildByName("win_title"):setString(TI18N("通关奖励"))

	slot0.panel_bg = slot0.container:getChildByName("panel_bg")

	if not slot0.item_load then
		slot0.item_load = loadSpriteTextureFromCDN(slot0.panel_bg, PathTool.getTargetRes("bigbg", "bigbg_61", false, false), ResourcesType.single, slot0.item_load)
	end

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.no_vedio_image = slot1:getChildByName("no_vedio_image")
	slot0.no_vedio_label = slot1:getChildByName("no_vedio_label")
	slot0.list_panel = slot1:getChildByName("list_panel")
	slot2 = slot0.list_panel:getContentSize()
	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.list_panel, cc.p(0, 5), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot2.width, slot2.height - 8), {
		start_y = 0,
		item_width = 600,
		start_x = 0,
		delay = 6,
		space_x = 0,
		row = 0,
		item_height = 168,
		space_y = 4,
		col = 1,
		need_dynamic = true,
		item_class = BattlDramaRewardItem
	})

	slot0.item_scrollview:setSwallowTouches(false)
end

function BattleDramaRewardWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openDramRewardView(false)
	end, false, 2)
	registerButtonEventListener(slot0.background, function ()
		uv0:openDramRewardView(false)
	end, false, 2)

	if not slot0.update_dram_data_event then
		slot0.update_dram_data_event = GlobalEvent:getInstance():Bind(Battle_dramaEvent.BattleDrama_Update_Data, function (slot0)
			uv0:updateData()
		end)
	end
end

function BattleDramaRewardWindow.openRootWnd(slot0)
	slot0.dic_drama_reward_ids = uv0:getDicDramaRewardID()

	slot0:updateData()
end

function BattleDramaRewardWindow.updateData(slot0)
	slot0.cur_dun = 0
	slot0.max_dun_id = 0

	if uv0:getDramaData() then
		slot0.max_dun_id = slot1.max_dun_id

		if Config.DungeonData.data_drama_dungeon_info(slot1.max_dun_id) then
			slot0.cur_dun = slot2.floor or 0
		end
	end

	if slot0.reward_list == nil then
		slot0.reward_list = {}
	end

	for slot6, slot7 in ipairs(Config.DungeonData.data_drama_reward) do
		if slot0.reward_list[slot6] == nil then
			slot0.reward_list[slot6] = {}
		end

		slot0.reward_list[slot6].config_data = slot7
		slot0.reward_list[slot6].is_received = slot0.dic_drama_reward_ids[slot7.id] or false
		slot0.reward_list[slot6].cur_dun = slot0.cur_dun

		if slot7.limit_id <= slot0.max_dun_id then
			if slot0.reward_list[slot6].is_received then
				slot0.reward_list[slot6].sort_index = 3
			else
				slot0.reward_list[slot6].sort_index = 1
			end
		else
			slot0.reward_list[slot6].sort_index = 2
		end
	end

	uv1(slot0.reward_list, function (slot0, slot1)
		if slot0.sort_index == slot1.sort_index then
			return slot0.config_data.id < slot1.config_data.id
		else
			return slot0.sort_index < slot1.sort_index
		end
	end)

	if next(slot0.reward_list) ~= nil then
		slot0.item_scrollview:setData(slot0.reward_list)
		slot0.no_vedio_image:setVisible(false)
		slot0.no_vedio_label:setVisible(false)
	else
		slot0.no_vedio_image:setVisible(true)
		slot0.no_vedio_label:setVisible(true)
	end
end

function BattleDramaRewardWindow.udpateDataByID(slot0, slot1)
	if slot0.reward_list then
		for slot5, slot6 in ipairs(slot0.reward_list) do
			if slot6.config_data.id == slot1 then
				slot6.is_received = true
				slot6.sort_index = 3
			end
		end

		uv0(slot0.reward_list, function (slot0, slot1)
			if slot0.sort_index == slot1.sort_index then
				return slot0.config_data.id < slot1.config_data.id
			else
				return slot0.sort_index < slot1.sort_index
			end
		end)
		slot0.item_scrollview:setData(slot0.reward_list)

		slot0.dic_drama_reward_ids[slot1] = true
	end
end

function BattleDramaRewardWindow.close_callback(slot0)
	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.update_dram_data_event then
		GlobalEvent:getInstance():UnBind(slot0.update_dram_data_event)

		slot0.update_dram_data_event = nil
	end

	uv0:openDramRewardView(false)
end

BattlDramaRewardItem = class("BattlDramaRewardItem", function ()
	return ccui.Widget:create()
end)

function BattlDramaRewardItem.ctor(slot0)
	slot0.ctrl = GuildwarController:getInstance()
	slot0.item_list = {}

	slot0:configUI()
	slot0:register_event()

	slot0.item_width = 90
end

function BattlDramaRewardItem.configUI(slot0)
	slot0.size = cc.size(600, 168)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("battledrama/battle_drama_reward_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("root")
	slot0.name_label = slot0.container:getChildByName("name_label")
	slot0.img_received = slot0.container:getChildByName("img_received")
	slot0.comfirm_btn = slot0.container:getChildByName("comfirm_btn")
	slot0.comfirm_btn_label = slot0.comfirm_btn:getChildByName("label")
	slot0.item_scrollview = slot0.container:getChildByName("item_scrollview")

	slot0.item_scrollview:setScrollBarEnabled(false)
	slot0.item_scrollview:setSwallowTouches(false)

	slot0.item_scrollview_size = slot0.item_scrollview:getContentSize()
	slot0.item_list = {}

	slot0.img_received:setVisible(false)
end

function BattlDramaRewardItem.register_event(slot0)
	registerButtonEventListener(slot0.comfirm_btn, handler(slot0, slot0._onComfirmBtn), true, 2)
end

function BattlDramaRewardItem._onComfirmBtn(slot0)
	if slot0.data then
		if Config.DungeonData.data_drama_dungeon_info(slot0.data.config_data.limit_id).floor <= slot0.data.cur_dun then
			if not slot0.data.is_received then
				uv0:send13009(slot0.data.config_data.id)
			end
		else
			uv0:openDramRewardView(false)
		end
	end
end

function BattlDramaRewardItem.setData(slot0, slot1)
	slot0.data = slot1

	if Config.DungeonData.data_drama_dungeon_info(slot1.config_data.limit_id).floor < slot1.cur_dun then
		slot4 = slot3.floor
	end

	slot0.name_label:setString(uv0("%s%s关(%s/%s)", TI18N("通关"), slot3.floor, slot1.cur_dun, slot3.floor))

	if slot2 then
		slot0.comfirm_btn:setTag(slot2.limit_id)
	end

	if slot3.floor <= slot4 then
		if slot1.is_received then
			slot0.img_received:setVisible(true)
			slot0.comfirm_btn:setVisible(false)
		else
			slot0.img_received:setVisible(false)
			slot0.comfirm_btn:setVisible(true)
			slot0.comfirm_btn:loadTexture(PathTool.getResFrame("common", "common_1017"), LOADTEXT_TYPE_PLIST)
			slot0.comfirm_btn_label:setString(TI18N("领取"))
			slot0.comfirm_btn_label:enableOutline(cc.c4b(2, 0, 25, 255), 2)
		end
	else
		slot0.img_received:setVisible(false)
		slot0.comfirm_btn:setVisible(true)
		slot0.comfirm_btn:loadTexture(PathTool.getResFrame("common", "common_1018"), LOADTEXT_TYPE_PLIST)
		slot0.comfirm_btn_label:setString(TI18N("前往"))
		slot0.comfirm_btn_label:enableOutline(cc.c4b(41, 74, 21, 255), 2)
	end

	if slot0.item_list then
		for slot10, slot11 in ipairs(slot0.item_list) do
			slot11:setVisible(false)
		end
	end

	slot8 = 10
	slot18 = math.max(slot0.item_scrollview_size.width, (BackPackItem.Width * 0.75 + slot8) * #slot2.items)
	slot19 = slot0.item_scrollview_size.height

	slot0.item_scrollview:setInnerContainerSize(cc.size(slot18, slot19))

	slot0.start_x = slot8 * 0.5
	slot13 = nil
	slot14 = #slot2.items

	for slot18, slot19 in ipairs(slot2.items) do
		if slot0.item_list[slot18] then
			slot13:setVisible(true)
			slot13:setPosition(slot0.start_x + (slot18 - 1) * (slot10 + slot8) + 8, slot0.item_scrollview_size.height * 0.5)
			slot13:setBaseData(slot19[1], slot19[2], true)
			slot13:setDefaultTip()
		else
			if slot18 - slot14 <= 0 then
				slot20 = 1
			end

			delayRun(slot0.item_scrollview, slot20 / display.DEFAULT_FPS, function ()
				if not uv0.item_list[uv1] then
					uv2 = BackPackItem.new(true, true)

					uv2:setAnchorPoint(0, 0.5)
					uv2:setScale(uv3)
					uv2:setSwallowTouches(false)
					uv0.item_scrollview:addChild(uv2)

					uv0.item_list[uv1] = uv2

					uv2:setPosition(uv0.start_x + (uv1 - 1) * (uv4 + uv5) + 8, uv0.item_scrollview_size.height * 0.5)
					uv2:setBaseData(uv6[1], uv6[2], true)
					uv2:setDefaultTip()
				end
			end)
		end
	end
end

function BattlDramaRewardItem.DeleteMe(slot0)
	doStopAllActions(slot0.container)

	if slot0.item_list then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end

		slot0.item_list = nil
	end
end
