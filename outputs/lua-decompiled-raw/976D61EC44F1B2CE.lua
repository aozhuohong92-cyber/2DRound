ModeChooseWindow = ModeChooseWindow or BaseClass(BaseView)
slot0 = HeroExpeditController:getInstance()

function ModeChooseWindow.__init(slot0)
	slot0.is_full_screen = false
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "heroexpedit/mode_choose"
end

function ModeChooseWindow.open_callback(slot0)
	slot0.mode_bg = slot0.root_wnd:getChildByName("bg")

	slot0.mode_bg:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot1:getChildByName("Text_1"):setString(TI18N("选择难度后，本轮远征无法更改难度"))
	slot1:getChildByName("Image_6"):getChildByName("Text_7"):setString(TI18N("难度选择"))

	slot2 = slot1:getChildByName("item_cons")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 0,
		item_width = 602,
		start_x = 5,
		space_x = 0,
		row = 0,
		item_height = 170,
		space_y = 5,
		col = 1,
		need_dynamic = true,
		item_class = ModeChooseItem
	})

	slot0.item_scrollview:setSwallowTouches(false)
	slot0.item_scrollview:setClickEnabled(false)
end

function ModeChooseWindow.openRootWnd(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:setData(Config.ExpeditionData.data_sign_reward)
	end
end

function ModeChooseWindow.register_event(slot0)
	registerButtonEventListener(slot0.mode_bg, function ()
		uv0:openModeChooseView(false)
		uv0:openHeroExpeditView(false)
	end, false, 2)
end

function ModeChooseWindow.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	uv0:openModeChooseView(false)
end

ModeChooseItem = class("ModeChooseItem", function ()
	return ccui.Widget:create()
end)
slot1 = table.insert
slot2 = string.format
slot3 = Config.ExpeditionData.data_sign_info
slot4 = Config.ExpeditionData.data_const

function ModeChooseItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function ModeChooseItem.configUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("heroexpedit/mode_choose_item"))

	slot0:addChild(slot0.root_wnd)
	slot0:setContentSize(cc.size(602, 170))

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.item_bg = slot1:getChildByName("item_bg")
	slot0.btn_choose = slot1:getChildByName("btn_choose")

	slot0.btn_choose:setVisible(false)

	slot0.btn_clear = slot1:getChildByName("btn_clear")

	slot0.btn_clear:setVisible(false)

	slot0.open_desc = slot1:getChildByName("open_desc")

	slot0.open_desc:setString("")
	slot0.open_desc:setVisible(false)

	slot0.power_bg = slot1:getChildByName("power_bg")

	slot0.power_bg:setVisible(false)

	slot0.fight_label = slot0.power_bg:getChildByName("power_text")
	slot2 = slot1:getChildByName("good_cons")
	slot0.award_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 22,
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
	slot0.award_scrollview:setClickEnabled(false)

	slot0.main_container = slot1
	slot0.touch_event = false
end

function ModeChooseItem.register_event(slot0)
	registerButtonEventListener(slot0.btn_choose, function ()
		if uv0.data then
			uv1:sender24412(uv0.data.id)
		end
	end, true, 1)
	slot0.main_container:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()
		elseif slot1 == ccui.TouchEventType.ended then
			uv0.touch_end = slot0:getTouchEndPosition()
			slot2 = true

			if uv0.touch_began ~= nil then
				slot2 = math.abs(uv0.touch_end.x - uv0.touch_began.x) <= 20 and math.abs(uv0.touch_end.y - uv0.touch_began.y) <= 20
			end

			if slot2 then
				playButtonSound2()
				uv0:setTouchTips()
			end
		end
	end)
end

function ModeChooseItem.setTouchTips(slot0)
	if slot0.data then
		if slot0.data.id == 1 then
			-- Nothing
		else
			slot2 = RoleController:getInstance():getRoleVo()

			if uv0:getMaxDifficulty() == 0 then
				message(TI18N("全部通关上一难度后开启"))
			elseif slot1 == 1 then
				if slot0.data.id == 2 then
					if slot2.max_power < slot0.data.power then
						message(TI18N("战力达到要求后开启"))
					end
				else
					message(TI18N("全部通关上一难度后开启"))
				end
			elseif slot1 == 2 and slot0.data.id == 3 and slot2.max_power < slot0.data.power then
				message(TI18N("战力达到要求后开启"))
			end
		end
	end
end

function ModeChooseItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1
	slot0.bg_load = loadSpriteTextureFromCDN(slot0.item_bg, PathTool.getPlistImgForDownLoad("heroexpedit/banner", slot1.desc), ResourcesType.single, slot0.bg_load)
	slot3 = RoleController:getInstance():getRoleVo()

	if slot1.id == 1 then
		slot0.btn_choose:setVisible(true)
		slot0.power_bg:setVisible(false)
	else
		slot4 = {
			2,
			3,
			4
		}
		slot5 = uv0:getMaxDifficulty()

		slot0.fight_label:setString(MoneyTool.GetMoneyString(slot1.power))

		if slot1.power <= slot3.max_power then
			if slot4[slot5] then
				if slot1.id <= slot4[slot5] then
					slot0.open_desc:setVisible(false)
					slot0.btn_choose:setVisible(true)
					slot0.power_bg:setVisible(false)
				else
					slot0.btn_choose:setVisible(false)
					slot0.power_bg:setVisible(true)
					slot0.open_desc:setVisible(true)
				end
			else
				slot0.open_desc:setVisible(true)
				slot0.power_bg:setVisible(true)
			end
		else
			slot0.btn_choose:setVisible(false)
			slot0.power_bg:setVisible(true)
			slot0.open_desc:setVisible(true)
		end
	end

	slot4 = ""

	if slot1.id == 2 then
		slot4 = uv1(TI18N("通关普通模式后开启"))
	elseif slot1.id == 3 then
		slot4 = uv1(TI18N("通关困难模式后开启"))
	end

	slot0.open_desc:setString(slot4)

	slot5 = {}

	for slot9, slot10 in pairs(slot1.items) do
		uv2(slot5, {
			bid = slot10[1],
			quantity = slot10[2]
		})
	end

	slot0.award_scrollview:setData(slot5)
	slot0.award_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.award_scrollview:getItemList()) do
			slot5:setDefaultTip()
		end
	end)
end

function ModeChooseItem.DeleteMe(slot0)
	if slot0.award_scrollview then
		slot0.award_scrollview:DeleteMe()
	end

	slot0.award_scrollview = nil

	if slot0.bg_load then
		slot0.bg_load:DeleteMe()

		slot0.bg_load = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
