RoleSetWindow = RoleSetWindow or BaseClass(BaseView)

function RoleSetWindow.__init(slot0, slot1)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.ctrl = slot1
	slot0.role_vo = slot0.ctrl:getRoleVo()
	slot0.is_full_screen = true
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.layout_name = "roleinfo/role_set_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("face", "face"),
			type = ResourcesType.plist
		}
	}
end

function RoleSetWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.title_container = slot0.main_container:getChildByName("title_container")
	slot0.title_label = slot0.title_container:getChildByName("title_label")

	slot0.title_label:setString(TI18N("设置"))

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.info_con = slot0.main_container:getChildByName("info_con")
	slot0.name = slot0.info_con:getChildByName("name")
	slot0.pen = slot0.info_con:getChildByName("pen")
	slot0.country = slot0.info_con:getChildByName("country")

	slot0.info_con:getChildByName("title"):setString(TI18N("称号："))

	slot0.title_val = slot0.info_con:getChildByName("title_val")

	slot0.title_val:setString(TI18N("暂无"))

	slot0.head = PlayerHead.new(PlayerHead.type.circle)

	slot0.head:setAnchorPoint(cc.p(0, 0))
	slot0.head:setPosition(cc.p(20, 40))
	slot0.info_con:addChild(slot0.head, -1)

	slot0.music_con = slot0.main_container:getChildByName("music_con")
	slot0.music_btn = slot0.music_con:getChildByName("music_btn")

	slot0.music_btn:getChildByName("name"):setString(TI18N("音乐"))

	slot0.sound_btn = slot0.music_con:getChildByName("sound_btn")

	slot0.sound_btn:getChildByName("name"):setString(TI18N("音效"))

	slot0.voice_btn = slot0.music_con:getChildByName("voice_btn")

	slot0.voice_btn:getChildByName("name"):setString(TI18N("语音"))

	slot0.auto_pk_btn = slot0.music_con:getChildByName("auto_pk_btn")

	slot0.auto_pk_btn:getChildByName("name"):setString(TI18N("切磋无需验证"))

	slot0.property_btn = slot0.music_con:getChildByName("property_btn")

	slot0.property_btn:getChildByName("name"):setString(TI18N("高品质"))

	slot0.hide_vip_btn = slot0.music_con:getChildByName("hide_vip_btn")

	slot0.hide_vip_btn:getChildByName("name"):setString(TI18N("隐藏VIP标识"))
	slot0.hide_vip_btn:setVisible(false)

	slot0.btn_con = slot0.main_container:getChildByName("btn_con")
	slot0.quit_btn = slot0.btn_con:getChildByName("quit_btn")

	slot0.quit_btn:setTitleText(TI18N("退出游戏"))

	slot0.quit_btn.label = slot0.quit_btn:getTitleRenderer()

	if slot0.quit_btn.label ~= nil then
		slot0.quit_btn.label:enableOutline(Config.ColorData.data_color4[264], 2)
	end

	slot0.switch_btn = slot0.btn_con:getChildByName("switch_btn")

	slot0.switch_btn:setTitleText(TI18N("切换账号"))

	slot0.switch_btn.label = slot0.switch_btn:getTitleRenderer()

	if slot0.switch_btn.label ~= nil then
		slot0.switch_btn.label:enableOutline(Config.ColorData.data_color4[264], 2)
	end

	slot0.contact_btn = slot0.btn_con:getChildByName("contact_btn")

	slot0.contact_btn:setTitleText(TI18N("Bug反馈"))

	slot0.contact_btn.label = slot0.contact_btn:getTitleRenderer()

	if slot0.contact_btn.label ~= nil then
		slot0.contact_btn.label:enableOutline(Config.ColorData.data_color4[263], 2)
	end

	slot0.exchange_btn = slot0.btn_con:getChildByName("exchange_btn")

	slot0.exchange_btn:setTitleText(TI18N("礼包兑换"))

	slot0.exchange_btn.label = slot0.exchange_btn:getTitleRenderer()

	if slot0.exchange_btn.label ~= nil then
		slot0.exchange_btn.label:enableOutline(Config.ColorData.data_color4[263], 2)
	end

	slot0.share_btn = slot0.btn_con:getChildByName("share_btn")

	slot0.share_btn:setTitleText(TI18N("游戏分享"))

	slot0.share_btn.label = slot0.share_btn:getTitleRenderer()

	if slot0.share_btn.label ~= nil then
		slot0.share_btn.label:enableOutline(Config.ColorData.data_color4[263], 2)
	end

	slot0.invitecode_btn = slot0.btn_con:getChildByName("invitecode_btn")

	slot0.invitecode_btn:setTitleText(TI18N("推荐码"))

	slot0.invitecode_btn.label = slot0.invitecode_btn:getTitleRenderer()

	if slot0.invitecode_btn.label ~= nil then
		slot0.invitecode_btn.label:enableOutline(Config.ColorData.data_color4[263], 2)
	end

	slot0.model_con = slot0.main_container:getChildByName("model_con")
	slot0.change_btn = slot0.model_con:getChildByName("change_btn")

	slot0.change_btn:setTitleText(TI18N("个性设置"))

	slot0.title_img = slot0.model_con:getChildByName("title_img")

	if MAKELIFEBETTER or IS_APPLE_RMUI then
		slot0.contact_btn:setVisible(false)
		slot0.exchange_btn:setVisible(false)
		slot0.change_btn:setVisible(false)
		slot0.invitecode_btn:setVisible(false)
	end

	if FILTER_EXCHANGE then
		slot0.exchange_btn:setVisible(false)
	end

	if not SHOW_GAME_SHARE then
		slot0.share_btn:setVisible(false)
	end

	if not SHOW_SINGLE_INVICODE then
		slot0.invitecode_btn:setVisible(false)
	end

	slot0.ctrl:sender23300()
	slot0.ctrl:requestRoleModelInfo()
end

function RoleSetWindow.openRootWnd(slot0)
end

function RoleSetWindow.setData(slot0)
	slot0.name:setString(slot0.role_vo.name)
	slot0.head:setHeadRes(slot0.role_vo.face_id, false, LOADTEXT_TYPE, slot0.role_vo.face_file, slot0.role_vo.face_update_time)
	slot0.head:setLev(slot0.role_vo.lev)
	slot0.head:setSex(slot0.role_vo.sex, cc.p(80, 4))

	if Config.AvatarData.data_avatar[slot0.role_vo.avatar_base_id] then
		slot0.head:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot1.res_id or 1), false, false), nil, false, slot1.offy)
	end

	if Config.HonorData.data_title[slot0.use_id] then
		slot0.title_val:setString(slot2.name)
	end

	if slot2 and slot2.res_id then
		slot0.item_load = createResourcesLoad(PathTool.getTargetRes("honor", "txt_cn_honor_" .. slot2.res_id, false, false), ResourcesType.single, function ()
			if not tolua.isnull(uv0.title_img) then
				loadSpriteTexture(uv0.title_img, uv1, LOADTEXT_TYPE)
			end
		end, slot0.item_load)
	end

	slot0:updateSpine(slot0.role_vo.look_id)
	slot0.music_btn:setSelected(SysEnv:getInstance():getBool(SysEnv.keys.music_is_open, true))
	slot0.sound_btn:setSelected(SysEnv:getInstance():getBool(SysEnv.keys.audio_is_open, true))
	slot0.voice_btn:setSelected(SysEnv:getInstance():getBool(SysEnv.keys.voice_is_open, true))
	slot0.auto_pk_btn:setSelected(slot0.role_vo.auto_pk == 1)
	slot0.property_btn:setSelected(SysEnv:getInstance():getBool(SysEnv.keys.high_quality, true))
	slot0.auto_pk_btn:setPositionY(slot0.hide_vip_btn:getPositionY())
end

function RoleSetWindow.updateSpine(slot0, slot1)
	if not slot1 then
		return
	end

	if slot0.record_look_id and slot0.record_look_id == slot1 then
		return
	end

	slot0.record_look_id = slot1

	function slot2()
		if not uv0.spine then
			uv0.spine = BaseRole.new(BaseRole.type.role, uv1)

			uv0.spine:setAnimation(0, PlayerAction.show, true)
			uv0.spine:setCascade(true)

			if partner_id == 21005 then
				uv0.spine:setPosition(cc.p(110, 295))
			else
				uv0.spine:setPosition(cc.p(110, 250))
			end

			uv0.spine:setAnchorPoint(cc.p(0.5, 0))
			uv0.model_con:addChild(uv0.spine)
			uv0.spine:setCascade(true)
			uv0.spine:setOpacity(0)
			uv0.spine:runAction(cc.Sequence:create(cc.FadeIn:create(0.2)))
		end
	end

	if slot0.spine then
		slot0.spine:setCascade(true)
		slot0.spine:runAction(cc.Sequence:create(cc.FadeOut:create(0.2), cc.CallFunc:create(function ()
			doStopAllActions(uv0.spine)
			uv0.spine:removeFromParent()

			uv0.spine = nil

			uv1()
		end)))
	else
		slot2()
	end
end

function RoleSetWindow.register_event(slot0)
	if slot0.updateList == nil then
		slot0.updateList = GlobalEvent:getInstance():Bind(RoleEvent.GetTitleList, function (slot0)
			uv0.use_id = slot0.base_id

			uv0:setData()
		end)
	end

	if slot0.updateHaveList_event == nil then
		slot0.updateHaveList_event = GlobalEvent:getInstance():Bind(RoleEvent.UpdataTitleList, function (slot0)
		end)
	end

	if slot0.use_event == nil then
		slot0.use_event = GlobalEvent:getInstance():Bind(RoleEvent.UseTitle, function (slot0)
			if slot0 then
				uv0.use_id = slot0

				uv0:setData()
			end
		end)
	end

	if not slot0.updateModelList then
		slot0.updateModelList = GlobalEvent:getInstance():Bind(RoleEvent.GetModelList, function (slot0)
			if slot0 ~= nil then
				uv0:updateSpine(slot0.use_id)
			end
		end)
	end

	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0.ctrl:openNewRoleInfoView(false)
		end
	end)
	slot0.change_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0.ctrl:openRoleDecorateView(true)
			uv0.ctrl:openNewRoleInfoView(false)
		end
	end)

	if slot0.background then
		slot0.background:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				uv0.ctrl:openNewRoleInfoView(false)
			end
		end)
	end

	slot0.music_btn:addEventListener(function (slot0, slot1)
		if slot1 == ccui.CheckBoxEventType.selected then
			playButtonSound2()
			SysEnv:getInstance():set(SysEnv.keys.music_is_open, true, nil)
		elseif slot1 == ccui.CheckBoxEventType.unselected then
			playButtonSound2()
			SysEnv:getInstance():set(SysEnv.keys.music_is_open, false, nil)
		end
	end)
	slot0.sound_btn:addEventListener(function (slot0, slot1)
		if slot1 == ccui.CheckBoxEventType.selected then
			playButtonSound2()
			SysEnv:getInstance():set(SysEnv.keys.audio_is_open, true, nil)
		elseif slot1 == ccui.CheckBoxEventType.unselected then
			playButtonSound2()
			SysEnv:getInstance():set(SysEnv.keys.audio_is_open, false, nil)
		end
	end)
	slot0.voice_btn:addEventListener(function (slot0, slot1)
		if slot1 == ccui.CheckBoxEventType.selected then
			playButtonSound2()
			SysEnv:getInstance():set(SysEnv.keys.voice_is_open, true, nil)
		elseif slot1 == ccui.CheckBoxEventType.unselected then
			playButtonSound2()
			SysEnv:getInstance():set(SysEnv.keys.voice_is_open, false, nil)
		end
	end)
	slot0.auto_pk_btn:addEventListener(function (slot0, slot1)
		if slot1 == ccui.CheckBoxEventType.selected then
			playButtonSound2()
			RoleController:getInstance():sender10318(1)
		elseif slot1 == ccui.CheckBoxEventType.unselected then
			playButtonSound2()
			RoleController:getInstance():sender10318(0)
		end
	end)
	slot0.property_btn:addEventListener(function (slot0, slot1)
		if slot1 == ccui.CheckBoxEventType.selected then
			playButtonSound2()
			SysEnv:getInstance():set(SysEnv.keys.high_quality, true, nil)
		elseif slot1 == ccui.CheckBoxEventType.unselected then
			playButtonSound2()
			SysEnv:getInstance():set(SysEnv.keys.high_quality, false, nil)
		end
	end)
	slot0.hide_vip_btn:addEventListener(function (slot0, slot1)
		if slot1 == ccui.CheckBoxEventType.selected then
			playButtonSound2()
			RoleController:getInstance():sender10348(1)
		elseif slot1 == ccui.CheckBoxEventType.unselected then
			playButtonSound2()
			RoleController:getInstance():sender10348(0)
		end
	end)

	if slot0.pen ~= nil then
		slot0.pen:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()

				if uv0.role_vo.sex == 2 then
					uv0.ctrl:openRoleChangeNameView(true)
				else
					function slot2(slot0)
						if slot0 == nil or slot0 == "" then
							message(TI18N("名字已占用"))

							return
						end

						if not uv0.role_vo then
							return
						end

						RoleController:getInstance():changeRoleName(string.gsub(slot0, "\n", ""), uv0.role_vo.sex)
					end

					function slot3()
					end

					slot4 = TI18N(string.format("<div fontcolor=#a95f0f>改名需消耗200 <img src=%s scale=0.3 visible=true /></div>", PathTool.getItemRes(Config.ItemData.data_get_data(3).icon)))

					if uv0.role_vo ~= nil and uv0.role_vo.is_first_rename == TRUE then
						slot4 = TI18N("首次更改免费哦~")
					end

					uv0.alert = CommonAlert.showInputApply(slot4, TI18N("请输入名字(限制6字)"), TI18N("确 定"), slot2, TI18N("取 消"), slot3, true, slot3, 20, CommonAlert.type.rich, FALSE, cc.size(270, 50), nil, {
						off_y = -15
					})

					uv0.alert.alert_txt:setPositionY(20)
					uv0.alert.line:setVisible(false)

					slot5 = createLabel(26, Config.ColorData.data_color4[175], nil, 75, 75, TI18N("名字："), uv0.alert.alert_panel)
				end
			end
		end)
	end

	if slot0.role_vo and slot0.role_update_event == nil then
		slot0.role_update_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "face_id" or slot0 == "avatar_base_id" or slot0 == "name" or slot0 == "sex" or slot0 == "look_id" then
				uv0:setData()
			end
		end)
	end

	if slot0.quit_btn ~= nil then
		slot0.quit_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				sdkOnExit()
			end
		end)
	end

	if slot0.switch_btn ~= nil then
		slot0.switch_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				AudioManager:getInstance():stopMusic()
				sdkOnSwitchAccount()
			end
		end)
	end

	if slot0.exchange_btn ~= nil then
		slot0.exchange_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				CommonAlert.showInputApply(nil, TI18N("请输入正确的兑换码"), TI18N("兑换"), function (slot0)
					if slot0 == nil or slot0 == "" then
						message(TI18N("请输入正确的兑换码"))

						return
					end

					RoleController:getInstance():sender10945(string.gsub(slot0, "\n", ""))
				end, nil, nil, true, function ()
				end, 18, CommonAlert.type.rich, FALSE)
			end
		end)
	end

	if slot0.contact_btn ~= nil then
		slot0.contact_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				NoticeController:getInstance():openServiceCenterWindow(true)
			end
		end)
	end

	if slot0.share_btn ~= nil then
		slot0.share_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				WelfareController:getInstance():openMainWindow(true, WelfareIcon.share_game)
			end
		end)
	end

	if slot0.invitecode_btn ~= nil then
		slot0.invitecode_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				WelfareController:getInstance():openMainWindow(true, WelfareIcon.invicode)
			end
		end)
	end
end

function RoleSetWindow.closeSetNameAlert(slot0)
	if slot0.alert then
		slot0.alert:close()

		slot0.alert = nil
	end
end

function RoleSetWindow.close_callback(slot0)
	if slot0.updateList ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.updateList)

		slot0.updateList = nil
	end

	if slot0.use_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.use_event)

		slot0.use_event = nil
	end

	if slot0.updateHaveList_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.updateHaveList_event)

		slot0.updateHaveList_event = nil
	end

	if slot0.role_vo then
		if slot0.role_update_event ~= nil then
			slot0.role_vo:UnBind(slot0.role_update_event)

			slot0.role_update_event = nil
		end

		slot0.role_vo = nil
	end

	if slot0.updateModelList then
		slot0.updateModelList = GlobalEvent:getInstance():UnBind(slot0.updateModelList)
		slot0.updateModelList = nil
	end

	if slot0.head then
		slot0.head:DeleteMe()

		slot0.head = nil
	end

	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	SysEnv:getInstance():save()
	slot0.ctrl:openNewRoleInfoView(false)
end
