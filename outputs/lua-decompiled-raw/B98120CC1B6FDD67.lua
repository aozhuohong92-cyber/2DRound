slot1 = TrainingcampController:getInstance():getModel()
slot2 = table.insert
slot3 = table.sort
TrainingcampWindow = TrainingcampWindow or BaseClass(BaseView)

function TrainingcampWindow.__init(slot0)
	slot0.win_type = WinType.Full
	slot0.is_full_screen = false
	slot0.layout_name = "trainingcamp/trainingcamp_window"
	slot0.tab_list = {}
	slot0.cur_index = nil
	slot0.trainingCampList = {}
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("trainingcamp", "trainingcamp"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_95", true),
			type = ResourcesType.single
		}
	}
end

function TrainingcampWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_95", true), LOADTEXT_TYPE)
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 1)

	slot0.container = slot1
	slot0.titleImage = slot0.container:getChildByName("title_img")
	slot0.tips_button = slot0.container:getChildByName("tips_button")
	slot0.desc_bg = slot0.container:getChildByName("desc_bg")
	slot0.desc_lab = slot0.desc_bg:getChildByName("desc_lab")
	slot7 = 71

	slot0.desc_lab:setTextColor(cc.c4b(slot7, 44, 30, 255))

	for slot7 = 1, 2 do
		slot8 = slot1:getChildByName("tab_container"):getChildByName(string.format("tab_btn_%s", slot7))
		slot8.label = slot8:getChildByName("title")

		slot8.label:setString(({
			TI18N("初阶训练"),
			TI18N("进阶训练")
		})[slot7])

		slot8.normal = slot8:getChildByName("normal")
		slot8.select = slot8:getChildByName("select")

		slot8.select:setVisible(false)
		slot8.label:setTextColor(Config.ColorData.data_color4[1])

		slot8.index = slot7
		slot0.tab_list[slot7] = slot8
	end

	slot4 = slot1:getChildByName("scroll_list")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot4, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot4:getContentSize(), {
		start_y = 0,
		item_width = 633,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 205,
		space_y = 5,
		col = 1,
		need_dynamic = true,
		item_class = TrainingcampItem
	})

	slot0.item_scrollview:setSwallowTouches(false)
	slot0:createTitleEffect()
end

function TrainingcampWindow.register_event(slot0)
	for slot4, slot5 in pairs(slot0.tab_list) do
		registerButtonEventListener(slot5, function ()
			uv0:changeTabView(uv1.index)
		end, false, 1)
	end

	registerButtonEventListener(slot0.tips_button, function (slot0, slot1, slot2)
		if Config.TrainingCampData.data_const and Config.TrainingCampData.data_const.tips_rule then
			TipsManager:getInstance():showCommonTips(Config.TrainingCampData.data_const.tips_rule.desc, slot1:getTouchBeganPosition())
		end
	end, true, 1)
	slot0:addGlobalEvent(TrainingcampEvent.Update_Trainingcamp_Data_Event, function ()
		uv0:setData()
	end)
end

function TrainingcampWindow.createTitleEffect(slot0)
	if MAKELIFEBETTER == true then
		return
	end

	if slot0.title_effect then
		return
	end

	slot0.title_effect = createEffectSpine(PathTool.getEffectRes(646), cc.p(50, -80), cc.p(0.5, 0.5), true)

	slot0.title_effect:setScale(1)
	slot0.titleImage:addChild(slot0.title_effect)
end

function TrainingcampWindow.changeTabView(slot0, slot1)
	if slot0.cur_index == (slot1 or 1) then
		return
	end

	if slot0.cur_tab ~= nil then
		slot0.cur_tab.label:setTextColor(cc.c4b(255, 255, 255, 255))
		slot0.cur_tab.normal:setVisible(true)
		slot0.cur_tab.select:setVisible(false)
	end

	slot0.cur_index = slot1
	slot0.cur_tab = slot0.tab_list[slot0.cur_index]

	if slot0.cur_tab ~= nil then
		slot0.cur_tab.label:setTextColor(cc.c4b(71, 44, 30, 255))
		slot0.cur_tab.normal:setVisible(false)
		slot0.cur_tab.select:setVisible(true)
	end

	slot0:setData()
end

function TrainingcampWindow.updateDesc(slot0)
	if not slot0.desc_lab then
		return
	end

	if Config.TrainingCampData.data_camp_tips[1] then
		slot0.desc_lab:setString(slot1.desc)
	end

	if slot0.time_ticket == nil and Config.TrainingCampData.data_const and Config.TrainingCampData.data_const.camp_tips_cd then
		slot0.time_ticket = GlobalTimeTicket:getInstance():add(function ()
			if Config.TrainingCampData.data_camp_tips[math.random(#Config.TrainingCampData.data_camp_tips) or 1] then
				uv0.desc_lab:setString(slot1.desc)
			end
		end, Config.TrainingCampData.data_const.camp_tips_cd.val)
	end
end

function TrainingcampWindow.openRootWnd(slot0, slot1)
	if slot1 == nil then
		slot1 = 1
	end

	slot0:changeTabView(slot1)
	slot0:updateDesc()
end

function TrainingcampWindow.setData(slot0)
	if slot0.trainingCampList[slot0.cur_index] == nil then
		slot1 = {}

		for slot5, slot6 in ipairs(Config.TrainingCampData.data_info) do
			if slot6.type == slot0.cur_index then
				uv0(slot1, slot6)
			end
		end

		slot0.trainingCampList[slot0.cur_index] = slot1
	end

	slot1 = slot0.trainingCampList[slot0.cur_index] or {}

	for slot5, slot6 in ipairs(slot1) do
		if uv1:IsFinishById(slot6.id) == true then
			slot6.sort = 1
		else
			slot6.sort = 0
		end
	end

	uv2(slot1, SortTools.tableLowerSorter({
		"sort",
		"id"
	}))
	slot0.item_scrollview:setData(slot1)
end

function TrainingcampWindow.close_callback(slot0)
	if slot0.time_ticket then
		GlobalTimeTicket:getInstance():remove(slot0.time_ticket)

		slot0.time_ticket = nil
	end

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.title_effect then
		slot0.title_effect:clearTracks()
		slot0.title_effect:removeFromParent()

		slot0.title_effect = nil
	end

	uv0:openTrainingcampWindow(false)
end

TrainingcampItem = class("TrainingcampItem", function ()
	return ccui.Widget:create()
end)

function TrainingcampItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function TrainingcampItem.configUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("trainingcamp/trainingcamp_item"))

	slot0:setContentSize(cc.size(633, 205))
	slot0:addChild(slot0.root_wnd)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0.main_container:setSwallowTouches(false)

	slot0.desc_lab = slot0.main_container:getChildByName("desc_lab")
	slot0.title_lab = slot0.main_container:getChildByName("title_lab")
	slot0.go_btn = slot0.main_container:getChildByName("go_btn")

	slot0.go_btn:setTitleText(TI18N("进入训练"))

	slot0.go_btn.label = slot0.go_btn:getTitleRenderer()

	if slot0.go_btn.label ~= nil then
		slot0.go_btn.label:enableOutline(cc.c4b(2, 0, 25, 255), 2)
	end

	slot0.status_img = slot0.main_container:getChildByName("status_img")

	slot0.status_img:setVisible(false)
	slot0.status_img:getChildByName("tips_1"):setString(TI18N("已完成"))

	slot0.award_list = slot0.main_container:getChildByName("award_list")
	slot0.award_scrollview = CommonScrollViewLayout.new(slot0.award_list, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot0.award_list:getContentSize(), {
		start_y = 0,
		start_x = 0,
		scale = 0.7,
		space_x = 10,
		row = 1,
		space_y = 0,
		col = 0,
		need_dynamic = true,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.7,
		item_height = BackPackItem.Height * 0.7
	})

	slot0.award_scrollview:setSwallowTouches(false)

	slot0.tips_lab = createRichLabel(20, cc.c3b(105, 55, 5), cc.p(1, 0.5), cc.p(615, 40), nil, , 400)

	slot0.main_container:addChild(slot0.tips_lab)
end

function TrainingcampItem.register_event(slot0)
	registerButtonEventListener(slot0.go_btn, function ()
		if uv0.data then
			for slot3, slot4 in ipairs(uv0.data.unlock) do
				if uv1:IsFinishById(slot4) == false then
					if Config.TrainingCampData.data_info[slot4] then
						message(string.format(TI18N("通关【%s】解锁"), slot5.name))
					end

					return
				end
			end

			uv2:openTrainingcampMainWindow(true, uv0.data)
		end
	end, true, 1)
end

function TrainingcampItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0.title_lab:setString(slot1.name)
	slot0.desc_lab:setString(slot1.desc)

	if slot1.id and slot0.go_btn then
		slot0.go_btn:setName("training_btn_" .. slot1.id)
	end

	slot0.status_img:setVisible(uv0:IsFinishById(slot1.id))

	slot3 = {}

	for slot7, slot8 in pairs(slot1.reward) do
		uv1(slot3, {
			id = slot8[1],
			quantity = slot8[2],
			dataId = slot1.id
		})
	end

	slot0.award_scrollview:setData(slot3)
	slot0.award_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.award_scrollview:getItemList()) do
			if slot5:getData() then
				slot5:IsGetStatus(TrainingcampController:getInstance():getModel():IsFinishById(slot6.dataId) or false)
			end

			slot5:setDefaultTip()
			slot5:setSwallowTouches(false)
		end
	end)

	slot4 = ""
	slot5 = true
	slot6 = true

	if slot2 == false then
		for slot10, slot11 in ipairs(slot0.data.unlock) do
			if uv0:IsFinishById(slot11) == false then
				slot5 = false
				slot6 = false

				if Config.TrainingCampData.data_info[slot11] then
					slot4 = string.format(TI18N("通关<div fontcolor=#d95014>【%s】</div>解锁"), slot12.name)
				end

				break
			end
		end
	else
		slot5 = false
	end

	addRedPointToNodeByStatus(slot0.go_btn, slot5, 5, 5)
	slot0.go_btn:setVisible(slot6)

	if slot1.type == 2 and slot6 == false then
		slot4 = TI18N("通关<div fontcolor=#d95014>【全部初阶关卡】</div>解锁")
	end

	slot0.tips_lab:setString(slot4)
end

function TrainingcampItem.DeleteMe(slot0)
	if slot0.award_scrollview then
		slot0.award_scrollview:DeleteMe()

		slot0.award_scrollview = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
