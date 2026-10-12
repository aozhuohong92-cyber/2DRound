ActionSpriteResetWindow = class("ActionSpriteResetWindow", function ()
	return ccui.Widget:create()
end)
slot1 = ActionController:getInstance():getModel()
slot2 = HeroController:getInstance()

function ActionSpriteResetWindow.ctor(slot0)
	slot0.sprite_retrun_items = {}
	slot0.cur_action_id = 17422
	slot0.config_list = {}

	slot0:loadResources()
end

function ActionSpriteResetWindow.loadResources(slot0)
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("actionspritereset", "actionspritereset"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/action", "action_sprite_return_bg", false),
			type = ResourcesType.single
		}
	}
	slot0.resources_load = ResourcesLoad.New(true)

	slot0.resources_load:addAllList(slot0.res_list, function ()
		uv0:configUI()
		uv0:register_event()
	end)
end

function ActionSpriteResetWindow.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_sprite_reset_panel"))

	slot0.root_wnd:setPosition(-40, -80)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.background = slot0.main_container:getChildByName("background")

	if not slot0.bg_load then
		slot0.bg_load = createResourcesLoad(PathTool.getPlistImgForDownLoad("bigbg/action", "action_sprite_return_bg", false), ResourcesType.single, function ()
			if not tolua.isnull(uv0.background) then
				loadSpriteTexture(uv0.background, uv1, LOADTEXT_TYPE)
			end
		end, slot0.bg_load)
	end

	slot0.change_btn = slot0.main_container:getChildByName("change_btn")
	slot2 = slot0.change_btn:getContentSize()
	slot0.change_btn_label = createRichLabel(26, cc.c4b(255, 255, 255, 255), cc.p(0.5, 0.5), cc.p(slot2.width * 0.5, slot2.height * 0.5), nil, , 900)

	slot0.change_btn:addChild(slot0.change_btn_label)
	slot0.change_btn_label:setString(TI18N("<div outline=2,#020019>重 生</div>"))

	slot0.reset_layout = slot0.main_container:getChildByName("reset_layout")
	slot0.time_title_0 = slot0.reset_layout:getChildByName("time_title_0")

	slot0.time_title_0:setString(TI18N([[
获
得
预
览]]))

	slot0.item_scrollview = slot0.main_container:getChildByName("item_scrollview")
	slot3 = createRichLabel(22, cc.c4b(255, 255, 255, 255), cc.p(0.5, 0.5), cc.p(360, 230), nil, , 9000)

	slot0.main_container:addChild(slot3)
	slot3:setString(TI18N("<div outline=2,#000000>幽灵重生会返还全部训练果实与一定数量的幽灵之魂</div>"))

	slot0.look_btn = slot0.main_container:getChildByName("look_btn")
	slot0.lay_hero = slot0.main_container:getChildByName("lay_hero")
	slot0.hero_info_panel = slot0.lay_hero:getChildByName("hero_info_panel")
	slot0.bg_img = slot0.lay_hero:getChildByName("bg_img")
	slot0.mode_node = slot0.lay_hero:getChildByName("mode_node")

	slot0.mode_node:setZOrder(2)

	slot0.name = slot0.hero_info_panel:getChildByName("name")

	if uv0:getActionSubTabVo(ActionRankCommonType.sprite_return) then
		slot0.cur_action_id = uv0:getActionSubTabVo(ActionRankCommonType.sprite_return).camp_id
	end

	slot0:initData()
end

function ActionSpriteResetWindow.register_event(slot0)
	registerButtonEventListener(slot0.change_btn, function ()
		uv0:onChangeBtn()
	end, true, 1)
	registerButtonEventListener(slot0.lay_hero, function ()
		uv0:onResetBtn()
	end, false, 1)
	registerButtonEventListener(slot0.look_btn, function (slot0, slot1, slot2)
		if Config.SpriteData.data_const.reborn_tips then
			TipsManager:getInstance():showCommonTips(slot3.desc, slot1:getTouchBeganPosition())
		end
	end, true, 1)

	if not slot0.action_sprite_reset_event then
		slot0.action_sprite_reset_event = GlobalEvent:getInstance():Bind(ActionEvent.SPRITE_RESET_EVENT, function (slot0)
			if not slot0 then
				return
			end

			uv0.is_reseting = false

			if slot0.flag == TRUE then
				uv0.select_sprite_vo = nil

				uv0:initData()
			end
		end)
	end

	if not slot0.hero_sprite_select_event then
		slot0.hero_sprite_select_event = GlobalEvent:getInstance():Bind(ActionEvent.SPRITE_RESET_SELECT_EVENT, function (slot0)
			uv0.select_sprite_vo = slot0

			uv0:initData()
		end)
	end
end

function ActionSpriteResetWindow.onChangeBtn(slot0)
	if not slot0.select_sprite_vo then
		message(TI18N("请选择重生的幽灵"))

		return
	end

	if slot0.is_reseting then
		message(TI18N("幽灵重生中"))

		return
	end

	if slot0.sprite_retrun_items and #slot0.sprite_retrun_items[slot0.select_sprite_vo.base_id] == 0 then
		slot0:checkSender()
	elseif slot0.sprite_retrun_items[slot0.select_sprite_vo.base_id] then
		uv0:openHeroResetOfferPanel(true, slot0.sprite_retrun_items[slot0.select_sprite_vo.base_id], false, function ()
			uv0:checkSender()
		end, HeroConst.ResetType.eSpriteReturn)
	end
end

function ActionSpriteResetWindow.initData(slot0)
	slot1 = {}
	slot2 = {
		scale = 0.8,
		max_count = 4,
		is_center = true,
		space_x = 20
	}
	slot0.config_list = Config.SpriteData.data_elfin_reset[slot0.cur_action_id]

	if slot0.select_sprite_vo == nil then
		slot0.bg_img:setVisible(true)
		slot0.hero_info_panel:setVisible(false)
		slot0.mode_node:setVisible(false)
		slot0:playCommonEffect(false)

		if Config.SpriteData.data_const.reborn_exhibition then
			slot1 = Config.SpriteData.data_const.reborn_exhibition.val
		end

		slot0.item_list = uv0:showSingleRowItemList(slot0.item_scrollview, slot0.item_list, slot1, slot2)
	else
		slot0.bg_img:setVisible(false)

		if slot0.select_sprite_vo.config then
			slot0.name:setString(slot0.select_sprite_vo.config.name)
		end

		slot0.hero_info_panel:setVisible(true)
		slot0.mode_node:setVisible(true)
		slot0:updateSprite(slot0.select_sprite_vo)
		slot0:playCommonEffect(true)

		if slot0.sprite_retrun_items and slot0.sprite_retrun_items[slot0.select_sprite_vo.base_id] then
			slot0.item_list = uv0:showSingleRowItemList(slot0.item_scrollview, slot0.item_list, slot0.sprite_retrun_items[slot0.select_sprite_vo.base_id], slot2)
		else
			slot4 = {}

			if slot3 and slot3[slot0.select_sprite_vo.base_id] and slot5[1] then
				slot0.sprite_retrun_items[slot0.select_sprite_vo.base_id] = slot5[1].award
			end

			slot0.item_list = uv0:showSingleRowItemList(slot0.item_scrollview, slot0.item_list, slot4, slot2)
		end
	end
end

function ActionSpriteResetWindow.updateSprite(slot0, slot1)
	if slot1 and slot1.config then
		slot0.item_load = loadSpriteTextureFromCDN(slot0.mode_node, PathTool.getPlistImgForDownLoad("actionspritereset", "sprite_" .. slot1.config.icon, false), ResourcesType.single, slot0.item_load)
	end
end

function ActionSpriteResetWindow.playCommonEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	elseif slot0.play_effect == nil then
		slot0.play_effect = createEffectSpine("E24702", cc.p(75, 45), cc.p(0.5, 0.5), true, PlayerAction.action)

		slot0.play_effect:setScale(0.8)
		slot0.lay_hero:addChild(slot0.play_effect, 1)
	else
		slot0.play_effect:setAnimation(0, PlayerAction.action, true)
	end
end

function ActionSpriteResetWindow.onResetBtn(slot0)
	if slot0.is_reseting then
		return
	end

	uv0:openActionSpriteResetSelectPanel(true, {
		select_sprite_vo = slot0.select_sprite_vo,
		can_select_sprite_list = slot0.config_list
	})
end

function ActionSpriteResetWindow.checkSender(slot0)
	if not slot0.select_sprite_vo then
		return
	end

	CommonAlert.show(TI18N("请确认需要重生该幽灵，重生后该幽灵会消失！"), TI18N("确定"), function ()
		if tolua.isnull(uv0.root_wnd) then
			return
		end

		uv0.is_reseting = true

		uv0:playResetEffect(true)
		delayRun(uv0.main_container, 1, function ()
			uv0:send26530(uv1.select_sprite_vo.base_id)
		end)
	end, TI18N("取消"), nil, CommonAlert.type.rich)
end

function ActionSpriteResetWindow.playResetEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect2 then
			slot0.play_effect2:clearTracks()
			slot0.play_effect2:removeFromParent()

			slot0.play_effect2 = nil
		end
	elseif slot0.play_effect2 == nil then
		slot0.play_effect2 = createEffectSpine("E24701", cc.p(83, 175), cc.p(0.5, 0.5), false, PlayerAction.action)

		slot0.lay_hero:addChild(slot0.play_effect2, 3)
	else
		slot0.play_effect2:setAnimation(0, PlayerAction.action, false)
	end
end

function ActionSpriteResetWindow.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function ActionSpriteResetWindow.DeleteMe(slot0)
	if slot0.resources_load then
		slot0.resources_load:DeleteMe()

		slot0.resources_load = nil
	end

	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	if slot0.action_sprite_reset_event then
		GlobalEvent:getInstance():UnBind(slot0.action_sprite_reset_event)

		slot0.action_sprite_reset_event = nil
	end

	if slot0.hero_sprite_select_event then
		GlobalEvent:getInstance():UnBind(slot0.hero_sprite_select_event)

		slot0.hero_sprite_select_event = nil
	end

	CommonAlert.closeAllWin()

	if slot0.item_list ~= nil then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end
	end

	slot0.item_list = nil

	slot0:playCommonEffect(false)
	slot0:playResetEffect(false)

	if slot0.bg_load ~= nil then
		slot0.bg_load:DeleteMe()

		slot0.bg_load = nil
	end
end
