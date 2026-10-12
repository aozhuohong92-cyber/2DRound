ElfinHatchPanel = class("ElfinHatchPanel", function ()
	return ccui.Layout:create()
end)
slot1 = ElfinController:getInstance():getModel()
slot2 = table.insert
slot3 = table.sort
slot4 = string.format

function ElfinHatchPanel.ctor(slot0, slot1)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("hero/hero_elfin_hatch_panel"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)
	slot0:initElfinData()
	uv0({}, {
		path = PathTool.getPlistImgForDownLoad("elfin", "elfin"),
		type = ResourcesType.plist
	})

	if slot0.init_res_load then
		slot0.init_res_load:DeleteMe()

		slot0.init_res_load = nil
	end

	slot0.init_res_load = ResourcesLoad.New()

	slot0.init_res_load:addAllList(slot2, function ()
		if not tolua.isnull(uv0.root_wnd) then
			uv0:loadResListCompleted(uv1)
		end
	end)
end

function ElfinHatchPanel.loadResListCompleted(slot0, slot1)
	slot0:initView()
	slot0:registerEvent()
	slot0:updateElfinPrivileg()
end

function ElfinHatchPanel.initElfinData(slot0)
	slot0.egg_list = {}
end

function ElfinHatchPanel.initView(slot0)
	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.elfin_book_txt = createRichLabel(24, cc.c4b(15, 91, 206, 255), cc.p(0.5, 0.5), cc.p(621, 850))

	slot0.container:addChild(slot0.elfin_book_txt)
	slot0.elfin_book_txt:setString(uv0(TI18N("<div href=xxx >幽灵图鉴 </div><img src='%s'/>"), PathTool.getResFrame("elfin", "elfin_1016")))
	slot0.elfin_book_txt:addTouchEventListener(function ()
		uv0:openElfinBookWindow(true)
	end)

	slot0.hatch_panel = slot0.container:getChildByName("hatch_panel")

	slot0.hatch_panel:setLocalZOrder(1)

	slot0.hatch_bg = slot0.hatch_panel:getChildByName("hatch_bg")

	slot0.hatch_bg:ignoreContentAdaptWithSize(true)

	slot0.hatch_bg_load = loadImageTextureFromCDN(slot0.hatch_bg, PathTool.getPlistImgForDownLoad("elfin", "elfin_hatch_bg"), ResourcesType.single, slot0.hatch_bg_load)
	slot0.vip_btn = slot0.hatch_panel:getChildByName("vip_btn")

	slot0.vip_btn:getChildByName("label"):setString(TI18N("幽灵特权"))
	UITool.SetTitleColor(slot0.vip_btn:getChildByName("label"))

	slot0.time_lab = slot0.vip_btn:getChildByName("time_lab")
	slot5 = ""

	slot0.time_lab:setString(slot5)

	for slot5 = 1, 6 do
		slot7 = ElfinHatchItem.new()

		slot7:setData(slot5)
		slot0.hatch_panel:getChildByName("egg_" .. slot5):addChild(slot7)

		slot0.egg_list[slot5] = slot7
	end
end

function ElfinHatchPanel.registerEvent(slot0)
	registerButtonEventListener(slot0.vip_btn, function ()
		uv0:openElfinPrivilegeWindow(true)
	end, true)

	if slot0.update_hatch_event == nil then
		slot0.update_hatch_event = GlobalEvent:getInstance():Bind(VipEvent.PRIVILEGE_INFO, function ()
			uv0:updateElfinPrivileg()
		end)
	end
end

function ElfinHatchPanel.updateElfinPrivileg(slot0)
	if RoleController:getInstance():getModel():getPrivilegeDataById(5) and slot1.expire_time and slot1.status == 1 then
		setChildUnEnabled(false, slot0.vip_btn)
		slot0.time_lab:setString(TimeTool.GetTimeFormatDayIIIIII(slot1.expire_time - GameNet:getInstance():getTime()))
	else
		setChildUnEnabled(true, slot0.vip_btn)
		slot0.time_lab:setString("")
	end
end

function ElfinHatchPanel.DeleteMe(slot0)
	if slot0.init_res_load then
		slot0.init_res_load:DeleteMe()

		slot0.init_res_load = nil
	end

	if slot0.hatch_bg_load then
		slot0.hatch_bg_load:DeleteMe()

		slot0.hatch_bg_load = nil
	end

	if slot0.update_hatch_event then
		GlobalEvent:getInstance():UnBind(slot0.update_hatch_event)

		slot0.update_hatch_event = nil
	end

	for slot4, slot5 in pairs(slot0.egg_list) do
		if slot5 then
			slot5:DeleteMe()
		end
	end

	slot0.egg_list = nil
end

ElfinHatchItem = class("ElfinHatchItem", function ()
	return ccui.Widget:create()
end)

function ElfinHatchItem.ctor(slot0)
	slot0.ctrl = ActionController:getInstance()
	slot0.model = slot0.ctrl:getModel()

	slot0:configUI()
	slot0:register_event()

	slot0.cur_hatch_index = 1
	slot0.cur_hatch_vo = nil
	slot0.cur_hatch_status = nil
	slot0.all_hatch_data = {}
end

function ElfinHatchItem.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("elfin/elfin_hatch_iten"))

	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(100, 120))
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.egg_icon = slot0.main_container:getChildByName("egg_icon")

	slot0.egg_icon:ignoreContentAdaptWithSize(true)

	slot0.hatch_lock_sp = slot0.main_container:getChildByName("hatch_lock_sp")

	slot0.hatch_lock_sp:setVisible(false)

	slot0.egg_home_sp = slot0.main_container:getChildByName("egg_home_sp")
	slot0.name_bg = slot0.main_container:getChildByName("name_bg")
	slot0.add_egg_btn = slot0.main_container:getChildByName("add_egg_btn")
	slot0.egg_name = slot0.main_container:getChildByName("egg_name")

	slot0.egg_name:setString(TI18N("幽地"))
	UITool.SetDarkColor(slot0.egg_name)

	slot0.tip_lab = slot0.main_container:getChildByName("tip_lab")

	slot0.tip_lab:setString(TI18N("可放入"))

	slot1 = cc.size(143, 19)
	slot0.comp_bar_bg, slot0.comp_bar = createLoadingBar(PathTool.getResFrame("common", "common_90005"), PathTool.getResFrame("common", "common_90006"), slot1, slot0.main_container, cc.p(0.5, 0.5), 100, 208, true, true)
	slot0.comp_bar_label = createLabel(16, cc.c3b(255, 255, 255), cc.c3b(0, 0, 0), slot1.width / 2, slot1.height / 2, "", slot0.comp_bar, 2, cc.p(0.5, 0.5))

	slot0.comp_bar_bg:setVisible(false)
	slot0.comp_bar:setVisible(false)
	slot0.comp_bar_label:setVisible(false)

	slot0.open_lab = createLabel(20, cc.c4b(122, 250, 109, 255), cc.c4b(2, 0, 25, 255), 100, 100, "", slot0.main_container, 2, cc.p(0.5, 0.5))
end

function ElfinHatchItem.register_event(slot0)
	registerButtonEventListener(slot0.add_egg_btn, function ()
		uv0:onClickAddEggBtn()
	end, true)
	registerButtonEventListener(slot0.egg_icon, function ()
		uv0:onClickEggIcon()
	end, false)

	if not slot0.get_hatch_data_event then
		slot0.get_hatch_data_event = GlobalEvent:getInstance():Bind(ElfinEvent.Get_Elfin_Hatch_Data_Event, function ()
			uv0.all_hatch_data = uv1:getElfinHatchList()

			uv2(uv0.all_hatch_data, SortTools.KeyLowerSorter("sort"))
			uv0:setHatchData()
		end)
	end

	if not slot0.update_red_status_event then
		slot0.update_red_status_event = GlobalEvent:getInstance():Bind(ElfinEvent.Update_Elfin_Red_Event, function (slot0, slot1)
			uv0:updateElfinRedInfo()
		end)
	end
end

function ElfinHatchItem.onClickAddEggBtn(slot0)
	uv0:openElfSelectItemWindow(true, {
		view_type = ElfinConst.Select_Type.Egg,
		hatch_id = slot0.cur_hatch_vo.id
	})
end

function ElfinHatchItem.onClickEggIcon(slot0)
	if slot0.cur_hatch_vo and slot0.cur_hatch_vo.is_open == 0 or slot0.cur_hatch_vo.is_open == 2 then
		if Config.SpriteData.data_hatch_data[slot0.cur_hatch_vo.id] and slot1.res_id == 2 then
			uv0:openElfinPrivilegeWindow(true)
		else
			uv0:openElfinHatchUnlockPanel(true, slot0.cur_hatch_vo)
		end
	elseif slot0.cur_hatch_vo and slot0.cur_hatch_vo.state == ElfinConst.Hatch_Status.Hatch then
		CommonAlert.show(string.format("是否花费%s<img src=%s visible=true scale=0.3 />培养灵蛋", slot0.cur_hatch_egg_cfg.expend[1][2], PathTool.getItemRes(slot0.cur_hatch_egg_cfg.expend[1][1])), TI18N("确定"), function ()
			uv0:sender26505(uv1.cur_hatch_vo.id)
		end, TI18N("取消"), nil, CommonAlert.type.rich)
	end
end

function ElfinHatchItem.setHatchData(slot0)
	if slot0.cur_hatch_vo ~= nil and slot0.update_self_event ~= nil then
		slot0.cur_hatch_vo:UnBind(slot0.update_self_event)

		slot0.update_self_event = nil
	end

	if not slot0.cur_hatch_index or not slot0.all_hatch_data then
		return
	end

	slot0.cur_hatch_vo = slot0.all_hatch_data[slot0.cur_hatch_index]

	if not slot0.cur_hatch_vo then
		return
	end

	if slot0.update_self_event == nil then
		slot0.update_self_event = slot0.cur_hatch_vo:Bind(ElfinEvent.Update_Elfin_Hatch_Vo_Event, function ()
			uv0:updateHatchInfo()
		end)
	end

	slot0:updateHatchInfo()
	slot0:updateElfinRedInfo()
end

function ElfinHatchItem.updateHatchInfo(slot0)
	if not slot0.cur_hatch_vo then
		return
	end

	slot0.cur_hatch_status = slot0.cur_hatch_vo.state

	if slot0.cur_hatch_vo.lev then
		slot0.cur_hatch_lev_cfg = Config.SpriteData.data_hatch_lev[slot0.cur_hatch_vo.lev]
		slot0.next_hatch_lev_cfg = Config.SpriteData.data_hatch_lev[slot0.cur_hatch_vo.lev + 1]
	end

	if slot0.cur_hatch_vo.do_id and slot0.cur_hatch_vo.do_id ~= 0 then
		slot0.cur_hatch_egg_cfg = Config.SpriteData.data_hatch_egg[slot0.cur_hatch_vo.do_id]
	else
		slot0.cur_hatch_egg_cfg = nil
	end

	slot1 = Config.SpriteData.data_hatch_data[slot0.cur_hatch_vo.id]

	if slot0.cur_hatch_egg_cfg then
		if Config.ItemData.data_get_data(slot0.cur_hatch_egg_cfg.item_bid) then
			slot0.egg_name:setString(slot2.name)
		end
	elseif slot1 then
		slot0.egg_name:setString(slot1.name)
		slot0.open_lab:setString(slot1.desc1)
	else
		slot0.egg_name:setString(TI18N("幽地"))
	end

	if slot1 and slot1.res_id == 2 then
		loadSpriteTexture(slot0.egg_home_sp, PathTool.getResFrame("elfin", "elfin_1046"), LOADTEXT_TYPE_PLIST)
		loadSpriteTexture(slot0.name_bg, PathTool.getResFrame("elfin", "elfin_1052"), LOADTEXT_TYPE_PLIST)
		slot0.egg_name:setTextColor(cc.c4b(255, 247, 201, 255))
		slot0.egg_name:setPositionY(30)
	else
		UITool.SetDarkColor(slot0.egg_name)
		slot0.egg_name:setPositionY(38.4)
		loadSpriteTexture(slot0.egg_home_sp, PathTool.getResFrame("elfin", "elfin_1047"), LOADTEXT_TYPE_PLIST)
		loadSpriteTexture(slot0.name_bg, PathTool.getResFrame("elfin", "elfin_1053"), LOADTEXT_TYPE_PLIST)
	end

	slot0.egg_icon:setVisible(true)
	slot0.egg_icon:setTouchEnabled(false)
	slot0.add_egg_btn:setVisible(false)
	slot0.tip_lab:setVisible(false)
	slot0:showEggHatchSuccessAni(false)
	doStopAllActions(slot0.comp_bar_label)

	slot2 = PathTool.getPlistImgForDownLoad("elfin", "elfin_egg_icon")
	slot3 = 0.6
	slot4 = 38.8

	if slot0.cur_hatch_status == ElfinConst.Hatch_Status.Open and slot0.cur_hatch_vo.is_open == 0 then
		loadSpriteTexture(slot0.hatch_lock_sp, PathTool.getResFrame("common", "common_90009"), LOADTEXT_TYPE_PLIST)
		slot0.hatch_lock_sp:setScale(0.8)
		slot0.hatch_lock_sp:setVisible(true)
		slot0.open_lab:setTextColor(cc.c4b(255, 255, 255, 255))
		slot0.open_lab:enableOutline(cc.c4b(2, 0, 25, 255), 2)
		slot0.open_lab:setVisible(true)
		slot0.egg_icon:setTouchEnabled(true)
		slot0.comp_bar_bg:setVisible(false)
		slot0.comp_bar:setVisible(false)
		slot0.comp_bar_label:setVisible(false)
	elseif slot0.cur_hatch_status == ElfinConst.Hatch_Status.Open and slot0.cur_hatch_vo.is_open == 2 then
		loadSpriteTexture(slot0.hatch_lock_sp, PathTool.getResFrame("elfin", "elfin_1049"), LOADTEXT_TYPE_PLIST)
		slot0.hatch_lock_sp:setScale(1)
		slot0.hatch_lock_sp:setVisible(true)
		slot0.open_lab:setTextColor(cc.c4b(122, 250, 109, 255))
		slot0.open_lab:enableOutline(cc.c4b(25, 59, 23, 255), 2)
		slot0.open_lab:setString(TI18N("可解锁"))
		slot0.open_lab:setVisible(true)
		slot0.egg_icon:setTouchEnabled(true)
		slot0.comp_bar_bg:setVisible(false)
		slot0.comp_bar:setVisible(false)
		slot0.comp_bar_label:setVisible(false)
	elseif slot0.cur_hatch_status == ElfinConst.Hatch_Status.Hatch or slot0.cur_hatch_status == ElfinConst.Hatch_Status.Over then
		slot0.hatch_lock_sp:setVisible(false)
		slot0.open_lab:setVisible(false)

		if slot0.cur_hatch_vo.all_end_time - GameNet:getInstance():getTime() > 0 then
			commonCountDownTime(slot0.comp_bar_label, slot5)
		else
			slot0.comp_bar_label:setString(TI18N("已完成"))
		end

		slot6 = 0

		if slot0.cur_hatch_egg_cfg then
			slot2 = PathTool.getElfinEggRes(slot0.cur_hatch_egg_cfg.res_id)
			slot3 = 1
			slot4 = 45

			slot0:showEggAction(true)

			if Config.SpriteData.data_const.hatch_rate then
				slot8 = slot0.cur_hatch_egg_cfg.need_piont * slot7.val
				slot6 = (slot8 - slot5) / slot8 * 100
			end
		end

		slot0.comp_bar_bg:setVisible(true)
		slot0.comp_bar:setVisible(true)
		slot0.comp_bar_label:setVisible(true)
		slot0.comp_bar:setPercent(slot6)

		if slot0.cur_hatch_status ~= ElfinConst.Hatch_Status.Hatch then
			slot0:showEggHatchSuccessAni(true)
		else
			slot0.egg_icon:setTouchEnabled(true)
		end
	elseif slot0.cur_hatch_status == ElfinConst.Hatch_Status.Open then
		slot0.hatch_lock_sp:setVisible(false)
		slot0.open_lab:setVisible(false)
		slot0.add_egg_btn:setVisible(true)
		slot0.tip_lab:setVisible(true)
		slot0.comp_bar_bg:setVisible(false)
		slot0.comp_bar:setVisible(false)
		slot0.comp_bar_label:setVisible(false)
	end

	if not slot0.cur_egg_path or slot0.cur_egg_path ~= slot2 then
		slot0.cur_egg_path = slot2

		slot0.egg_icon:setScale(slot3)
		slot0.egg_icon:setPositionY(slot4)

		slot0.egg_img_load = loadImageTextureFromCDN(slot0.egg_icon, slot2, ResourcesType.single, slot0.egg_img_load)
	end
end

function ElfinHatchItem.showEggHatchSuccessAni(slot0, slot1)
	if slot1 == true then
		slot0.cur_ani_hatch_id = slot0.cur_hatch_vo.id

		slot0:handleEggEffect(true)
	else
		if slot0.egg_effect then
			slot0.egg_effect:setVisible(false)
		end

		slot0.cur_ani_hatch_id = nil
	end
end

function ElfinHatchItem.onEndEggAniCallBack(slot0)
	slot0.egg_effect:setVisible(false)

	slot0.is_show_egg_effect = false
end

function ElfinHatchItem.handleEggEffect(slot0, slot1)
	doStopAllActions(slot0.main_container)

	slot0.is_show_egg_effect = slot1

	if slot1 == false then
		if slot0.egg_effect then
			slot0.egg_effect:clearTracks()
			slot0.egg_effect:removeFromParent()

			slot0.egg_effect = nil
		end
	else
		playOtherSound("c_hatchegg")
		slot0:showEggAction(false)

		if not tolua.isnull(slot0.main_container) and slot0.egg_effect == nil then
			slot2 = slot0.egg_icon:getContentSize()
			slot0.egg_effect = createEffectSpine(Config.EffectData.data_effect_info[1353], cc.p(slot0.main_container:getContentSize().width / 2 - 10, slot0.main_container:getContentSize().height / 2 - 50), cc.p(0.5, 0.5), false, PlayerAction.action, handler(slot0, slot0.onEndEggAniCallBack))

			slot0.egg_effect:setScale(0.6)
			slot0.main_container:addChild(slot0.egg_effect)
		elseif slot0.egg_effect then
			slot0.egg_effect:setVisible(true)
			slot0.egg_effect:setToSetupPose()
			slot0.egg_effect:setAnimation(0, PlayerAction.action, false)
		end

		function slot2()
			if uv0.cur_ani_hatch_id and uv0.cur_ani_hatch_id == uv0.cur_hatch_vo.id then
				uv1:sender26506(uv0.cur_hatch_vo.id)
			end
		end

		slot3 = 2

		if Config.SpriteData.data_const.end_time then
			slot3 = Config.SpriteData.data_const.end_time.val / 1000
		end

		slot0.main_container:runAction(cc.Sequence:create(cc.DelayTime:create(slot3), cc.CallFunc:create(slot2)))

		if slot0.smash_crack_icon then
			slot0.smash_crack_icon:stopAllActions()
			slot0.smash_crack_icon:setVisible(false)

			slot0.is_smash_crack_ani = false
		end

		slot0.egg_icon:runAction(cc.Sequence:create(cc.DelayTime:create(slot3), cc.CallFunc:create(function ()
			uv0.egg_icon:setVisible(false)
		end)))
	end
end

function ElfinHatchItem.setData(slot0, slot1)
	slot0.cur_hatch_index = slot1

	if slot1 == 1 then
		slot0.add_egg_btn:setName("guide_add_btn")
	end
end

function ElfinHatchItem.updateElfinRedInfo(slot0)
	slot1 = false

	if slot0.cur_hatch_vo then
		if slot0.cur_hatch_vo.state == ElfinConst.Hatch_Status.Open and slot0.cur_hatch_vo.is_open == 2 then
			slot1 = true
		end

		if slot1 == false and slot0.cur_hatch_vo.is_open == 1 and slot0.cur_hatch_vo.state == ElfinConst.Hatch_Status.Open and #BackpackController:getInstance():getModel():getBackPackItemListByType(BackPackConst.item_type.ELFIN_EGG) > 0 then
			slot1 = true
		end

		if slot1 == false and slot0.cur_hatch_vo.state == ElfinConst.Hatch_Status.Over then
			slot1 = true
		end
	end

	addRedPointToNodeByStatus(slot0.main_container, slot1, -50, -50)
end

function ElfinHatchItem.showEggAction(slot0, slot1)
	if slot1 == true then
		slot0.egg_icon:setRotation(0)
		slot0.egg_icon:stopAllActions()

		slot5 = cc.DelayTime:create(2)
		slot6 = {}

		for slot10 = 1, 5 do
			uv0(slot6, cc.RotateBy:create(0.05, -2))
			uv0(slot6, cc.RotateBy:create(0.1, 4))
			uv0(slot6, cc.RotateBy:create(0.05, -2))
		end

		uv0(slot6, slot5)
		slot0.egg_icon:runAction(cc.RepeatForever:create(cc.Sequence:create(unpack(slot6))))
	else
		slot0.egg_icon:setRotation(0)
		slot0.egg_icon:stopAllActions()
	end
end

function ElfinHatchItem.DeleteMe(slot0)
	slot0:showEggAction(false)
	slot0:handleEggEffect(false)
	doStopAllActions(slot0.comp_bar_label)
	doStopAllActions(slot0.main_container)

	if slot0.egg_img_load then
		slot0.egg_img_load:DeleteMe()

		slot0.egg_img_load = nil
	end

	if slot0.cur_hatch_vo ~= nil and slot0.update_self_event ~= nil then
		slot0.cur_hatch_vo:UnBind(slot0.update_self_event)

		slot0.update_self_event = nil
	end

	if slot0.get_hatch_data_event then
		GlobalEvent:getInstance():UnBind(slot0.get_hatch_data_event)

		slot0.get_hatch_data_event = nil
	end

	if slot0.update_red_status_event then
		GlobalEvent:getInstance():UnBind(slot0.update_red_status_event)

		slot0.update_red_status_event = nil
	end
end
