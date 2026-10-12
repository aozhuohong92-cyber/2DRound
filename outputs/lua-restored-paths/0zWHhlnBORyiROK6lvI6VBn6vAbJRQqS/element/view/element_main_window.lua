ElementMainWindow = ElementMainWindow or BaseClass(BaseView)
slot1 = ElementController:getInstance():getModel()
slot2 = table.insert

function ElementMainWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.layout_name = "element/element_main_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("element", "element"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/element", "element_main_bg", true),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/element", "element_land_1"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/element", "element_land_2"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/element", "element_land_3"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/element", "element_land_4"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/element", "element_land_5"),
			type = ResourcesType.single
		}
	}
	slot0.pos_node_list = {}
	slot0.item_list = {}
	slot0.land_list = {}
	slot0.count_is_full = true
end

function ElementMainWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg/element", "element_main_bg", true), LOADTEXT_TYPE)
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot1 = slot0.main_container:getChildByName("top_panel")
	slot2 = slot0.main_container:getChildByName("bottom_panel")
	slot0.bottom_panel = slot2
	slot3 = slot0.main_container:getChildByName("sp_land_1")

	loadSpriteTexture(slot3, PathTool.getPlistImgForDownLoad("bigbg/element", "element_land_4"), LOADTEXT_TYPE)

	slot0.land_list[ElementConst.Ele_Type.Light] = slot3
	slot4 = slot0.main_container:getChildByName("sp_land_2")

	loadSpriteTexture(slot4, PathTool.getPlistImgForDownLoad("bigbg/element", "element_land_5"), LOADTEXT_TYPE)

	slot0.land_list[ElementConst.Ele_Type.Dark] = slot4
	slot5 = slot0.main_container:getChildByName("sp_land_3")

	loadSpriteTexture(slot5, PathTool.getPlistImgForDownLoad("bigbg/element", "element_land_3"), LOADTEXT_TYPE)

	slot0.land_list[ElementConst.Ele_Type.Wind] = slot5
	slot6 = slot0.main_container:getChildByName("sp_land_4")

	loadSpriteTexture(slot6, PathTool.getPlistImgForDownLoad("bigbg/element", "element_land_1"), LOADTEXT_TYPE)

	slot0.land_list[ElementConst.Ele_Type.Water] = slot6
	slot7 = slot0.main_container:getChildByName("sp_land_5")

	loadSpriteTexture(slot7, PathTool.getPlistImgForDownLoad("bigbg/element", "element_land_2"), LOADTEXT_TYPE)

	slot0.land_list[ElementConst.Ele_Type.Fire] = slot7
	slot0.btn_rule = slot1:getChildByName("btn_rule")
	slot0.btn_rank = slot1:getChildByName("btn_rank")
	slot0.close_btn = slot2:getChildByName("close_btn")
	slot0.add_btn = slot2:getChildByName("add_btn")
	slot0.count_label = slot2:getChildByName("count_label")
	slot0.time_txt = slot2:getChildByName("time_txt")
	slot0.sp_time = slot2:getChildByName("sp_time")
	slot11 = TI18N

	slot2:getChildByName("count_title"):setString(slot11("挑战次数:"))

	for slot11 = 1, 5 do
		if slot0.main_container:getChildByName("pos_node_" .. slot11) then
			uv0(slot0.pos_node_list, slot12)
		end
	end

	slot1:setPositionY(display.getTop(slot0.main_container) - 220)
	slot2:setPositionY(display.getBottom(slot0.main_container))
end

function ElementMainWindow.openRootWnd(slot0, slot1)
	slot0.setting = slot1 or {}

	if uv0:checkIsHaveElementData() then
		slot0:setData()
	else
		uv1:sender25000()
	end
end

function ElementMainWindow.setData(slot0)
	slot0.element_data = uv0:getElementData()
	slot1 = slot0.setting.open_type

	for slot5, slot6 in ipairs(slot0.element_data.list or {}) do
		delayRun(slot0.main_container, slot5 / display.DEFAULT_FPS, function ()
			if not uv0.item_list[uv1] then
				slot0 = ElementMainItem.new()

				uv0.pos_node_list[uv1]:addChild(slot0)

				uv0.item_list[uv1] = slot0
			end

			slot0:setVisible(true)
			slot0:setData(uv2)

			if uv3 and uv3 == uv2.type then
				slot0:onClickOpen()
			end
		end)
	end

	slot0:refreshLandStatus()
	slot0:refreshCountData()
	slot0:updateLeftBuyCount()
end

function ElementMainWindow.refreshLandStatus(slot0)
	if not slot0.element_data then
		return
	end

	for slot5, slot6 in ipairs(slot0.element_data.list or {}) do
		if slot0.land_list[slot6.type] then
			if not slot6.endtime or slot6.endtime <= 0 or slot6.endtime <= GameNet:getInstance():getTime() then
				setChildUnEnabled(true, slot7)
			else
				setChildUnEnabled(false, slot7)
			end
		end
	end
end

function ElementMainWindow.refreshCountData(slot0)
	if not slot0.element_data then
		return
	end

	slot1 = Config.ElementTempleData.data_const.refresh_number

	slot0.count_label:setString(slot0.element_data.num .. "/" .. slot1.val)

	slot0.count_is_full = slot1.val <= slot0.element_data.num

	if slot0.element_data.refresh_time < GameNet:getInstance():getTime() then
		slot0:setLessTime(0)
		slot0.time_txt:setVisible(false)
		slot0.sp_time:setVisible(false)
	else
		slot0:setLessTime(slot0.element_data.refresh_time - slot2)
		slot0.time_txt:setVisible(true)
		slot0.sp_time:setVisible(true)
	end
end

function ElementMainWindow.updateLeftBuyCount(slot0)
	if not slot0.left_buy_count then
		slot0.left_buy_count = createRichLabel(20, 1, cc.p(0.5, 0.5), cc.p(590, 116))

		slot0.bottom_panel:addChild(slot0.left_buy_count)
	end

	slot0.left_buy_count:setString(string.format(TI18N("<div fontcolor=#fff8bf outline=2,#000000>(剩余购买次数:</div><div fontcolor=#39e522 outline=2,#000000>%d</div><div fontcolor=#fff8bf outline=2,#000000>)</div>"), uv0:getTodayLeftBuyCount()))
end

function ElementMainWindow.setLessTime(slot0, slot1)
	if tolua.isnull(slot0.time_txt) then
		return
	end

	slot0.time_txt:stopAllActions()

	if slot1 > 0 then
		slot0.time_txt:setString(TimeTool.GetTimeFormat(slot1))
		slot0.time_txt:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				uv1.time_txt:stopAllActions()
			else
				uv1.time_txt:setString(TimeTool.GetTimeFormat(uv0))
			end
		end))))
	else
		slot0.time_txt:setString(TimeTool.GetTimeFormat(slot1))
	end
end

function ElementMainWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openElementMainWindow(false)
	end, false, 2)
	registerButtonEventListener(slot0.btn_rule, function ()
		MainuiController:getInstance():openCommonExplainView(true, Config.ElementTempleData.data_explain)
	end)
	registerButtonEventListener(slot0.btn_rank, function ()
		uv0:openElementRankWindow(true)
	end)
	registerButtonEventListener(slot0.add_btn, handler(slot0, slot0._onClickAddCountBtn))
	slot0:addGlobalEvent(ElementEvent.Update_Element_Data_Event, function ()
		uv0:setData()
	end)
	slot0:addGlobalEvent(ElementEvent.Update_Element_Count_Event, function ()
		uv0.element_data = uv1:getElementData()

		uv0:refreshCountData()
		uv0:updateLeftBuyCount()
	end)
end

function ElementMainWindow._onClickAddCountBtn(slot0)
	if slot0.element_data then
		if not slot0.count_is_full then
			slot2 = RoleController:getInstance():getModel():checkPrivilegeStatus(4)

			if Config.ElementTempleData.data_buy_count[slot0.element_data.buy_num + 1] or slot2 == true then
				if slot1 and slot1.vip <= RoleController:getInstance():getRoleVo().vip_lev then
					slot4 = string.format(TI18N([[








               是否消耗<img src=%s visible=true scale=0.3 />%d购买一次挑战次数？











<div fontsize=22>领地挑战特权:每日免费挑战2次，额外购买%d次</div><div href=privilege fontcolor=#289b14>前往激活</div>]]), PathTool.getItemRes(3), slot1.cost, Config.ElementTempleData.data_privilege_length or 0)

					if slot2 == true then
						slot4 = string.format(TI18N([[








               是否消耗<img src=%s visible=true scale=0.3 />%d购买一次挑战次数？











<div fontsize=22>领地挑战特权:每日免费挑战2次，额外购买%d次</div><div fontcolor=#289b14>(已激活)</div>]]), PathTool.getItemRes(3), slot1.cost, Config.ElementTempleData.data_privilege_length or 0)
					end

					CommonAlert.show(slot4, TI18N("确定"), function ()
						uv0:sender25003()
					end, TI18N("取消"), nil, CommonAlert.type.rich)
				elseif slot2 == true then
					if Config.ElementTempleData.data_privilege[uv1:getPrivilegeBuyCount() + 1] then
						slot6 = string.format(TI18N([[








               是否消耗<img src=%s visible=true scale=0.3 />%d购买一次挑战次数？











<div fontsize=22>领地挑战特权:每日免费挑战2次，额外购买%d次</div><div href=privilege fontcolor=#289b14>前往激活</div>]]), PathTool.getItemRes(3), slot5, Config.ElementTempleData.data_privilege_length or 0)

						if slot2 == true then
							slot6 = string.format(TI18N([[








               是否消耗<img src=%s visible=true scale=0.3 />%d购买一次挑战次数？











<div fontsize=22>领地挑战特权:每日免费挑战2次，额外购买%d次</div><div fontcolor=#289b14>(已激活)</div>]]), PathTool.getItemRes(3), slot5, Config.ElementTempleData.data_privilege_length or 0)
						end

						CommonAlert.show(slot6, TI18N("确定"), function ()
							uv0:sender25003()
						end, TI18N("取消"), nil, CommonAlert.type.rich)
					else
						message(TI18N("购买次数已用完"))
					end
				else
					message(TI18N("购买次数已用完"))
				end
			else
				message(TI18N("购买次数已用完"))
			end
		else
			message(TI18N("当前挑战次数已满"))
		end
	end
end

function ElementMainWindow.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.item_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	slot0:setLessTime(0)
	uv0:openElementMainWindow(false)
end

ElementMainItem = class("ElementMainItem", function ()
	return ccui.Widget:create()
end)

function ElementMainItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function ElementMainItem.configUI(slot0)
	slot0.size = cc.size(150, 150)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("element/element_main_item"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("container")
	slot0.container = slot2
	slot0.ele_icon = slot2:getChildByName("ele_icon")

	slot0.ele_icon:ignoreContentAdaptWithSize(true)

	slot0.ele_name = slot2:getChildByName("ele_name")
	slot0.open_time = slot2:getChildByName("open_time")
	slot0.sp_head_k_2 = slot2:getChildByName("sp_head_k_2")
end

function ElementMainItem.register_event(slot0)
	registerButtonEventListener(slot0.container, function ()
		uv0:onClickOpen()
	end, true)
end

function ElementMainItem.onClickOpen(slot0)
	if slot0._is_open and slot0.data then
		uv0:setRecordOpenType(slot0.data.type)
		uv1:openElementEctypeWindow(true, slot0.data)
	elseif slot0.base_cfg then
		message(TimeTool.getWeekDay(slot0.base_cfg.open_day) .. TI18N("开启"))
	end
end

function ElementMainItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1
	slot0.base_cfg = Config.ElementTempleData.data_base[slot1.type]

	if not slot0.base_cfg then
		return
	end

	if slot0.base_cfg.res_id then
		slot0.ele_icon:loadTexture(PathTool.getResFrame("element", "element_build_" .. slot0.base_cfg.res_id), LOADTEXT_TYPE_PLIST)

		if slot0.base_cfg.type == ElementConst.Ele_Type.Wind then
			slot0.ele_icon:setPositionY(135)
		elseif slot0.base_cfg.type == ElementConst.Ele_Type.Fire then
			slot0.ele_icon:setPositionY(122)
		end
	end

	slot0.ele_name:setString(slot0.base_cfg.name)

	if not slot1.endtime or slot1.endtime <= 0 or slot1.endtime <= GameNet:getInstance():getTime() then
		slot0._is_open = false

		slot0.sp_head_k_2:setVisible(true)
		setChildUnEnabled(true, slot0.ele_icon)
		slot0:setLessTime(0)
		slot0.open_time:setString(TimeTool.getWeekDay(slot0.base_cfg.open_day) .. TI18N("开启"))
		slot0.open_time:setTextColor(cc.c3b(255, 93, 93))

		if slot0.hero_head then
			slot0.hero_head:setVisible(false)
		end
	else
		setChildUnEnabled(false, slot0.ele_icon)
		slot0.open_time:setTextColor(cc.c3b(104, 199, 75))

		slot0._is_open = true

		slot0:setLessTime(slot1.endtime - slot2)
		slot0.sp_head_k_2:setVisible(false)

		if Config.ElementTempleData.data_monster[slot1.group] then
			if not slot0.hero_head then
				slot0.hero_head = PlayerHead.new(PlayerHead.type.circle)

				slot0.hero_head:setAnchorPoint(0.5, 0.5)
				slot0.hero_head:setScale(0.56)
				slot0.hero_head:showBg()
				slot0.hero_head:setPosition(cc.p(20, 34))
				slot0.container:addChild(slot0.hero_head)
			end

			slot0.hero_head:setHeadRes(PathTool.getHeadIcon(slot4.head_id), true)
		end
	end
end

function ElementMainItem.setLessTime(slot0, slot1)
	if tolua.isnull(slot0.open_time) then
		return
	end

	slot0.open_time:stopAllActions()

	if slot1 > 0 then
		slot0.open_time:setString(TimeTool.GetTimeFormat(slot1) .. TI18N("后结束"))
		slot0.open_time:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				uv1.open_time:stopAllActions()
			else
				uv1.open_time:setString(TimeTool.GetTimeFormat(uv0) .. TI18N("后结束"))
			end
		end))))
	else
		slot0.open_time:setString(TimeTool.GetTimeFormat(slot1) .. TI18N("后结束"))
	end
end

function ElementMainItem.DeleteMe(slot0)
	if slot0.hero_head then
		slot0.hero_head:DeleteMe()

		slot0.hero_head = nil
	end

	slot0:setLessTime(0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
