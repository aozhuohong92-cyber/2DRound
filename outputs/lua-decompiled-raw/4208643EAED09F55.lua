slot1 = HeavenController:getInstance():getModel()
slot2 = string.format
HeavenBattleWinView = HeavenBattleWinView or BaseClass(BaseView)

function HeavenBattleWinView.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Tips
	slot0.layout_name = "heaven/heaven_battle_win_view"
	slot0.effect_cache_list = {}
	slot0.desc_txt_list = {}
	slot0.star_list = {}
	slot0.big_star_list = {}
end

function HeavenBattleWinView.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")

	slot1:getChildByName("get_title"):setString(TI18N("获得物品"))

	slot0.success_bg = slot1:getChildByName("success_bg")
	slot0.Sprite_1 = slot0.success_bg:getChildByName("Sprite_1")

	if slot0.sprite_1_load == nil then
		slot0.sprite_1_load = loadSpriteTextureFromCDN(slot0.Sprite_1, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_97"), ResourcesType.single, slot0.sprite_1_load)
	end

	slot0.Sprite_2 = slot0.success_bg:getChildByName("Sprite_2")

	if slot0.sprite_2_load == nil then
		slot0.sprite_2_load = loadSpriteTextureFromCDN(slot0.Sprite_2, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_98"), ResourcesType.single, slot0.sprite_2_load)
	end

	slot0.confirm_btn = slot1:getChildByName("confirm_btn")

	slot0.confirm_btn:setVisible(false)

	slot0.harm_btn = slot1:getChildByName("harm_btn")

	slot0.harm_btn:setVisible(false)

	slot5 = TI18N

	slot0.harm_btn:getChildByName("harm_lab"):setString(slot5("数据统计"))

	for slot5 = 1, 3 do
		if slot1:getChildByName("star_" .. slot5) then
			table.insert(slot0.star_list, slot6)
		end

		if slot1:getChildByName("desc_txt_" .. slot5) then
			table.insert(slot0.desc_txt_list, slot7)
		end

		if slot0.root_wnd:getChildByName("big_star_" .. slot5) then
			table.insert(slot0.big_star_list, slot8)
		end
	end

	slot0.fight_text = createLabel(24, cc.c4b(255, 238, 172, 255), nil, 360, 430, "", slot1, nil, cc.p(0.5, 0.5))
	slot0.comfirm_btn = createButton(slot0.root_wnd, TI18N("确定"), 620, 580, cc.size(162, 62), PathTool.getResFrame("common", "common_1017"), 24, Config.ColorData.data_color4[1])

	slot0.comfirm_btn:setPosition(slot0.root_wnd:getContentSize().width / 2 - 170, 315)
	slot0.comfirm_btn:enableOutline(Config.ColorData.data_color4[264], 2)
	slot0.comfirm_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0:_onClickBtnClose()
		end
	end)

	slot0.cancel_btn = createButton(slot0.root_wnd, TI18N("返回玩法"), 620, 580, cc.size(162, 62), PathTool.getResFrame("common", "common_1018"), 24, Config.ColorData.data_color4[1])

	slot0.cancel_btn:setPosition(slot0.root_wnd:getContentSize().width / 2 + 170, 315)
	slot0.cancel_btn:enableOutline(Config.ColorData.data_color4[263], 2)
	slot0.cancel_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			BattleResultReturnMgr:returnByFightType(BattleConst.Fight_Type.HeavenWar)
			uv0:_onClickBtnClose()
		end
	end)

	slot0.title_container = slot0.root_wnd:getChildByName("title_container")
	slot0.title_width = slot0.title_container:getContentSize().width
	slot0.title_height = slot0.title_container:getContentSize().height
	slot2 = slot1:getChildByName("list_view")
	slot0.scroll_view = CommonScrollViewLayout.new(slot2, nil, , , slot2:getContentSize(), {
		start_y = 0,
		item_width = 120,
		start_x = 94,
		delay = 6,
		space_x = 20,
		row = 4,
		item_height = 145,
		space_y = 10,
		col = 4,
		need_dynamic = true,
		item_class = HeavenBattleAwardItem
	})
	slot0.container = slot1
end

function HeavenBattleWinView.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0._onClickBtnClose), false, 2)
	registerButtonEventListener(slot0.confirm_btn, handler(slot0, slot0._onClickBtnClose), true, 2)
	registerButtonEventListener(slot0.harm_btn, handler(slot0, slot0._onClickHarmBtn), true)
end

function HeavenBattleWinView._onClickBtnClose(slot0)
	uv0:openHeavenBattleWinView(false)
end

function HeavenBattleWinView._onClickHarmBtn(slot0)
	if slot0.data and slot0.data.all_hurt_statistics then
		table.sort(slot0.data.all_hurt_statistics, function (slot0, slot1)
			return slot0.type < slot1.type
		end)

		slot7 = slot0.data.order_id

		for slot7, slot8 in ipairs(slot0.data.all_hurt_statistics) do
			if uv0:getCustomsIsBossType(slot0.data.id, slot7) then
				slot8.atk_name = uv1("%s(队伍%s)", RoleController:getInstance():getRoleVo().name, slot8.a_round)
				slot8.target_role_name = uv1("%s(队伍%s)", slot8.target_role_name, slot8.b_round)
			else
				slot8.atk_name = slot2
			end
		end

		BattleController:getInstance():openBattleHarmInfoView(true, slot0.data.all_hurt_statistics)
	end
end

function HeavenBattleWinView.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	elseif not tolua.isnull(slot0.title_container) and slot0.play_effect == nil then
		slot0.play_effect = createEffectSpine(PathTool.getEffectRes(901), cc.p(slot0.title_width * 0.5, slot0.title_height * 0.5), cc.p(0.5, 0.5), false, PlayerAction.action)

		slot0.title_container:addChild(slot0.play_effect, 1)
	end
end

function HeavenBattleWinView.openRootWnd(slot0, slot1)
	playOtherSound("c_arenasettlement", AudioManager.AUDIO_TYPE.COMMON)

	if slot1 ~= nil then
		slot0.data = slot1

		slot0:setBaseInfo()
		slot0:setRewardsList()
		slot0:handleEffect(true)

		if slot1.all_hurt_statistics then
			slot0.harm_btn:setVisible(true)
		end

		if slot0.fight_text and Config.BattleBgData.data_fight_name[BattleConst.Fight_Type.HeavenWar] then
			slot0.fight_text:setString(TI18N("当前战斗：") .. slot2)
		end
	end
end

function HeavenBattleWinView.setBaseInfo(slot0)
	if not slot0.data then
		return
	end

	slot2 = slot0.data.order_id

	if not Config.DungeonHeavenData.data_customs[slot0.data.id] then
		return
	end

	if not slot3[slot2] then
		return
	end

	for slot8, slot9 in pairs(slot0.star_list) do
		slot9:setVisible(false)
	end

	for slot8, slot9 in pairs(slot0.desc_txt_list) do
		slot9:setVisible(false)
	end

	slot5 = 0

	for slot9, slot10 in ipairs(slot4.cond_info) do
		slot11 = slot10[1]
		slot13 = slot0.desc_txt_list[slot9]

		if Config.DungeonHeavenData.data_star_cond[slot10[2]] and slot13 then
			slot13:setVisible(true)
			slot13:setString(slot14.type)
		end

		if slot0.star_list[slot9] and slot0:checkStarIsShowById(slot11) then
			slot15:setVisible(true)

			slot5 = slot5 + 1
		end
	end

	for slot9, slot10 in ipairs(slot0.big_star_list) do
		slot10:setVisible(slot9 <= slot5)
	end
end

function HeavenBattleWinView.checkStarIsShowById(slot0, slot1)
	slot2 = false

	if slot0.data and slot0.data.star_info then
		for slot6, slot7 in pairs(slot0.data.star_info) do
			if slot7.id == slot1 then
				slot2 = slot7.state == 1

				break
			end
		end
	end

	return slot2
end

function HeavenBattleWinView.setRewardsList(slot0)
	if slot0.data == nil or slot0.data.award == nil or next(slot0.data.award) == nil then
		return
	end

	slot0.scroll_view:setData(slot0.data.award)
end

function HeavenBattleWinView.close_callback(slot0)
	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()

		slot0.scroll_view = nil
	end

	slot0:handleEffect(false)

	if slot0.sprite_1_load then
		slot0.sprite_1_load:DeleteMe()

		slot0.sprite_1_load = nil
	end

	if slot0.sprite_2_load then
		slot0.sprite_2_load:DeleteMe()

		slot0.sprite_2_load = nil
	end

	uv0:openHeavenBattleWinView(false)
end

HeavenBattleAwardItem = class("HeavenBattleAwardItem", function ()
	return ccui.Layout:create()
end)

function HeavenBattleAwardItem.ctor(slot0)
	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(cc.size(120, 145))
	slot0:setCascadeOpacityEnabled(true)

	slot0.item = BackPackItem.new(false, true, false, 1, false, true)

	slot0.item:setPosition(60, 85)
	slot0:addChild(slot0.item)

	slot0.item_name_label = createLabel(24, cc.c4b(255, 232, 135, 255), nil, 60, 0, "", slot0, nil, cc.p(0.5, 0))

	slot0:registerEvent()
end

function HeavenBattleAwardItem.registerEvent(slot0)
	slot0:registerScriptHandler(function (slot0)
		if slot0 == "enter" then
			uv0:setOpacity(0)
			uv0:setScale(2)
			uv0:runAction(cc.Spawn:create(cc.FadeIn:create(0.1), cc.ScaleTo:create(0.1, 1)))
		elseif slot0 == "exit" then
			-- Nothing
		end
	end)
end

function HeavenBattleAwardItem.setData(slot0, slot1)
	if slot1 then
		slot0.item:setBaseData(slot1.item_id, slot1.num)

		if Config.ItemData.data_get_data(slot1.item_id) then
			slot0.item_name_label:setString(slot2.name)
		end
	end
end

function HeavenBattleAwardItem.suspendAllActions(slot0)
end

function HeavenBattleAwardItem.DeleteMe(slot0)
	if slot0.item then
		slot0.item:DeleteMe()
	end

	slot0.item = nil

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
