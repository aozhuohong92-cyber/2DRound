slot1 = ElfinController:getInstance():getModel()
slot2 = string.format
ElfinLvUpTipsWindow = ElfinLvUpTipsWindow or BaseClass(BaseView)

function ElfinLvUpTipsWindow.__init(slot0)
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "elfin/elfin_up_lv_tips"
end

function ElfinLvUpTipsWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 2)

	slot0.btn_uplv = slot1:getChildByName("btn_uplv")
	slot0.btn_uplv_label = slot0.btn_uplv:getChildByName("label")

	slot0.btn_uplv_label:setString(TI18N("确定"))

	slot0.btn_cancel = slot1:getChildByName("btn_cancel")

	slot0.btn_cancel:getChildByName("label"):setString(TI18N("取消"))
	slot1:getChildByName("win_title"):setString(TI18N("提示"))

	slot0.vip_tips = slot1:getChildByName("vip_tips")

	slot0.vip_tips:setVisible(false)
	slot1:getChildByName("cur_hatch_plan_title"):setString(TI18N("培养效率:"))

	slot0.cur_hatch_plan_txt = slot1:getChildByName("cur_hatch_plan_txt")

	slot1:getChildByName("cur_hatch_lv_title"):setString(TI18N("当前等级:"))

	slot0.cur_hatch_lv_txt = slot1:getChildByName("cur_hatch_lv_txt")

	slot1:getChildByName("next_hatch_plan_title"):setString(TI18N("培养效率:"))

	slot0.next_hatch_plan_txt = slot1:getChildByName("next_hatch_plan_txt")

	slot1:getChildByName("next_hatch_lv_title"):setString(TI18N("当前等级:"))

	slot0.next_hatch_lv_txt = slot1:getChildByName("next_hatch_lv_txt")

	if not slot0.lv_up_tips_txt then
		slot0.lv_up_tips_txt = createRichLabel(24, 274, cc.p(0.5, 0.5), cc.p(340, 300), 10, nil, 550)

		slot1:addChild(slot0.lv_up_tips_txt)
	end
end

function ElfinLvUpTipsWindow.register_event(slot0)
	registerButtonEventListener(slot0.btn_cancel, function ()
		uv0:openElfinLvUpTipsWindow(false)
	end, true, 2)
	registerButtonEventListener(slot0.background, function ()
		uv0:openElfinLvUpTipsWindow(false)
	end, false, 2)
	registerButtonEventListener(slot0.btn_uplv, function ()
		uv0:onClickLvUpBtn()
	end, true)
end

function ElfinLvUpTipsWindow.onClickLvUpBtn(slot0)
	if slot0.hatch_id then
		uv0:sender26502(slot0.hatch_id)
	end

	uv0:openElfinLvUpTipsWindow(false)
end

function ElfinLvUpTipsWindow.openRootWnd(slot0, slot1, slot2)
	slot0.hatch_id = slot1

	slot0:setData(slot2)
end

function ElfinLvUpTipsWindow.setData(slot0, slot1)
	slot3 = Config.SpriteData.data_hatch_lev[slot1 + 1]

	if not Config.SpriteData.data_hatch_lev[slot1] or not slot3 then
		return
	end

	for slot8, slot9 in ipairs(slot3.expend) do
		if Config.ItemData.data_get_data(slot9[1]) then
			slot4 = TI18N("是否花费") .. uv0(TI18N(" <img src='%s' scale=0.3 /> %d"), PathTool.getItemRes(slot12.icon), slot9[2])
		end
	end

	slot0.lv_up_tips_txt:setString(slot4 .. TI18N("提升培养等级，加快自动培养的速度？"))
	slot0.cur_hatch_lv_txt:setString("Lv." .. slot1)
	slot0.cur_hatch_plan_txt:setString(uv0(TI18N("-1点/%d秒"), slot2.do_time))
	slot0.next_hatch_lv_txt:setString("Lv." .. slot1 + 1)
	slot0.next_hatch_plan_txt:setString(uv0(TI18N("-1点/%d秒"), slot3.do_time))
	slot0.vip_tips:setString(uv0(TI18N("VIP%d开启"), slot3.limit_vip))
	slot0.vip_tips:setVisible(RoleController:getInstance():getRoleVo().vip_lev < slot3.limit_vip)

	if slot5.vip_lev < slot3.limit_vip then
		setChildUnEnabled(true, slot0.btn_uplv)
		slot0.btn_uplv_label:disableEffect(cc.LabelEffect.OUTLINE)
		slot0.btn_uplv:setTouchEnabled(false)
	end
end

function ElfinLvUpTipsWindow.close_callback(slot0)
	uv0:openElfinLvUpTipsWindow(false)
end
