StarTowerAwardWindow = StarTowerAwardWindow or BaseClass(BaseView)
slot0 = table.insert
slot1 = table.sort
slot2 = string.format
slot3 = StartowerController:getInstance()
slot4 = Config.StarTowerData.data_get_floor_award

function StarTowerAwardWindow.__init(slot0, slot1, slot2)
	slot0.ctrl = StartowerController:getInstance()
	slot0.is_full_screen = false
	slot0.title_str = TI18N("奖励总览")
	slot0.cloth_data = data or {}
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_71"),
			type = ResourcesType.single
		}
	}
	slot0.win_type = WinType.Big
end

function StarTowerAwardWindow.open_callback(slot0)
	slot2 = cc.CSLoader:createNode(PathTool.getTargetCSB("startower/star_tower_award"))

	slot0.container:addChild(slot2)

	slot0.main_panel = slot2:getChildByName("main_panel")
	slot0.title_icon = slot0.main_panel:getChildByName("title_icon")

	slot0.title_icon:loadTexture(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_71"), LOADTEXT_TYPE)
	slot0:updateAwardList()
end

function StarTowerAwardWindow.register_event(slot0)
	slot0:addGlobalEvent(StartowerEvent.Update_Reward_Event, function ()
		uv0:updateAwardList()
	end)
end

function StarTowerAwardWindow.openRootWnd(slot0)
end

function StarTowerAwardWindow.updateAwardList(slot0)
	if not slot0.list_view then
		slot0.list_view = CommonScrollViewLayout.new(slot0.main_panel, cc.p(13, 48), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(620, 585), {
			start_y = 0,
			item_width = 620,
			start_x = 0,
			space_x = 0,
			row = 1,
			item_height = 173,
			space_y = 0,
			col = 1,
			need_dynamic = true,
			item_class = StarTowerAwardItem
		})
	end

	slot2 = {}

	for slot6, slot7 in pairs(slot0.ctrl:getModel():getRewardData()) do
		if uv0[slot7.id] then
			uv1(slot2, slot7)
		end
	end

	slot0.list_view:setData(slot0.ctrl:getModel():sortFunc(slot2))
end

function StarTowerAwardWindow.close_callback(slot0)
	if slot0.list_view then
		slot0.list_view:DeleteMe()

		slot0.list_view = nil
	end

	slot0.ctrl:openAwardWindow(false)
end

StarTowerAwardItem = class("StarTowerAwardItem", function ()
	return ccui.Widget:create()
end)

function StarTowerAwardItem.ctor(slot0)
	slot0.reward_list = {}

	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function StarTowerAwardItem.config(slot0)
	slot0.size = cc.size(620, 173)

	slot0:setContentSize(slot0.size)
end

function StarTowerAwardItem.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("startower/star_tower_award_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.sprite_get = slot0.main_panel:getChildByName("sprite_get")

	slot0.sprite_get:setVisible(false)

	slot0.btn_goto = slot0.main_panel:getChildByName("btn_goto")
	slot2 = slot0.btn_goto:getChildByName("Text_4")

	slot2:setString(TI18N("前往"))
	slot2:enableOutline(Config.ColorData.data_color4[263], 2)

	slot0.btn_get = slot0.main_panel:getChildByName("btn_get")

	slot0.btn_get:setVisible(false)

	slot3 = slot0.btn_get:getChildByName("Text_4")

	slot3:setString(TI18N("领取"))
	slot3:enableOutline(Config.ColorData.data_color4[264], 2)

	slot0.good_cons = slot0.main_panel:getChildByName("good_cons")
	slot0.text_floor = slot0.main_panel:getChildByName("text_floor")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.good_cons, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot0.good_cons:getContentSize(), {
		start_y = 10,
		start_x = 0,
		space_x = 0,
		row = 1,
		space_y = 0,
		col = 0,
		scale = 0.85,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.85,
		item_height = BackPackItem.Height * 0.85
	})

	slot0.item_scrollview:setSwallowTouches(false)
end

function StarTowerAwardItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = slot1
	slot0.tower_data = slot2

	slot0.sprite_get:setVisible(slot2.status == 2)
	slot0.btn_get:setVisible(slot2.status == 1)
	slot0.btn_goto:setVisible(slot2.status == 0)

	if not uv0[slot2.id] then
		return
	end

	slot9 = slot2.id

	slot0.text_floor:setString(uv1(TI18N("通过%d层(%d/%d)"), uv0[slot2.id].tower, uv2:getModel():getNowTowerId(), uv0[slot9].tower))

	slot4 = {}
	slot8 = slot2.id

	for slot8, slot9 in pairs(uv0[slot8].award) do
		uv3(slot4, {
			id = slot9[1],
			quantity = slot9[2]
		})
	end

	slot0.item_scrollview:setData(slot4)
	slot0.item_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.item_scrollview:getItemList()) do
			slot5:setDefaultTip()
		end
	end)
end

function StarTowerAwardItem.registerEvents(slot0)
	registerButtonEventListener(slot0.btn_goto, function ()
		uv0:openAwardWindow(false)
	end, true, 1)
	registerButtonEventListener(slot0.btn_get, function ()
		uv0:sender11328(uv1.tower_data.id)
	end, true, 1)
end

function StarTowerAwardItem.DeleteMe(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.reward_list and next(slot0.reward_list or {}) ~= nil then
		for slot4, slot5 in ipairs(slot0.reward_list) do
			if slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end
	end
end
