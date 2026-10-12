HeroexpeditResultWindow = HeroexpeditResultWindow or BaseClass(BaseView)

function HeroexpeditResultWindow.__init(slot0, slot1)
	slot0.data = slot1
	slot0.item_list = {}
	slot0.win_type = WinType.Tips
	slot0.layout_name = "battle/battle_result_view"
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("battle", "battle"),
			type = ResourcesType.plist
		}
	}
end

function HeroexpeditResultWindow.openRootWnd(slot0)
	slot0:setData()
end

function HeroexpeditResultWindow.open_callback(slot0)
	playOtherSound("b_win", AudioManager.AUDIO_TYPE.BATTLE)

	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.source_container = slot0.root_wnd:getChildByName("container")
	slot0.Sprite_1 = slot0.source_container:getChildByName("Sprite_1")

	if slot0.sprite_1_load == nil then
		slot0.sprite_1_load = loadSpriteTextureFromCDN(slot0.Sprite_1, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_97"), ResourcesType.single, slot0.sprite_1_load)
	end

	slot0.Sprite_2 = slot0.source_container:getChildByName("Sprite_2")

	if slot0.sprite_2_load == nil then
		slot0.sprite_2_load = loadSpriteTextureFromCDN(slot0.Sprite_2, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_98"), ResourcesType.single, slot0.sprite_2_load)
	end

	slot0.title_container = slot0.source_container:getChildByName("title_container")
	slot0.title_width = slot0.title_container:getContentSize().width
	slot0.title_height = slot0.title_container:getContentSize().height

	slot0:handleEffect(true)

	slot0.clear_label = createLabel(24, Config.ColorData.data_color4[1], nil, 364, 416, "", slot0.root_wnd)

	slot0.clear_label:setAnchorPoint(0.5, 0.5)

	slot1 = createButton(slot0.root_wnd, TI18N("确定"), 620, 580, cc.size(162, 62), PathTool.getResFrame("common", "common_1017"), 24, Config.ColorData.data_color4[1])

	slot1:setPosition(slot0.root_wnd:getContentSize().width / 2 + 5, 470)
	slot1:enableOutline(Config.ColorData.data_color4[264], 2)
	slot1:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			HeroExpeditController:getInstance():openHeroexpeditResultView(false)
		end
	end)

	slot0.harm_btn = slot0.source_container:getChildByName("harm_btn")

	slot0.harm_btn:setVisible(false)
	slot0.harm_btn:getChildByName("harm_lab"):setString(TI18N("数据统计"))
	createSprite(PathTool.getResFrame("common", "common_90044"), 360, 462, slot0.source_container, cc.p(0.5, 1)):setScaleX(5)

	slot3 = createRichLabel(22, 31, cc.p(0.5, 0.5), cc.p(360, 382), nil, nil, 1000)

	slot3:setString(TI18N("获得物品"))
	slot0.source_container:addChild(slot3)
	createSprite(PathTool.getResFrame("common", "common_1094"), 320, 398, slot0.source_container, cc.p(0, 1)):setScaleX(-1)

	slot5 = createSprite(PathTool.getResFrame("common", "common_1094"), 400, 398, slot0.source_container, cc.p(0, 1))
	slot0.scroll_view = createScrollView(SCREEN_WIDTH, 230, 0, 130, slot0.source_container, ccui.ScrollViewDir.vertical)
end

function HeroexpeditResultWindow.register_event(slot0)
end

function HeroexpeditResultWindow.setData(slot0)
	if slot0.data then
		slot0.clear_label:setString(string.format(TI18N("根据昨日通关关卡数，已自动扫荡%d关"), slot0.data.floor_id))
		slot0:rewardViewUI(slot0.data.rewards)
	end
end

function HeroexpeditResultWindow.rewardViewUI(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = #slot1
	slot3 = 4
	slot0.row = math.ceil(slot2 / slot3)
	slot0.space = 30
	slot0.max_height = math.max(slot0.space + (slot0.space + BackPackItem.Height) * slot0.row, slot0.scroll_view:getContentSize().height)

	slot0.scroll_view:setInnerContainerSize(cc.size(slot0.scroll_view:getContentSize().width, slot0.max_height))

	if slot3 <= slot2 then
		slot2 = slot3
	end

	slot0.start_x = (slot0.scroll_view:getContentSize().width - (slot2 * BackPackItem.Width + (slot2 - 1) * slot0.space)) * 0.5

	if slot0.row == 1 then
		slot0.start_y = slot0.max_height * 0.5
	else
		slot0.start_y = slot0.max_height - slot0.space - BackPackItem.Height * 0.5
	end

	for slot9, slot10 in ipairs(slot1) do
		slot11 = BackPackItem.new(true, true)

		slot11:setBaseData(slot10.bid, slot10.num)
		slot11:setGoodsName(Config.ItemData.data_get_data(slot10.bid).name, nil, nil, 1)
		slot11:setPosition(cc.p(slot0.start_x + BackPackItem.Width * 0.5 + (slot9 - 1) % slot3 * (BackPackItem.Width + slot0.space), slot0.start_y - math.floor((slot9 - 1) / slot3) * (BackPackItem.Height + slot0.space)))
		slot0.scroll_view:addChild(slot11)

		slot0.item_list[slot9] = slot11
	end
end

function HeroexpeditResultWindow.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	elseif not tolua.isnull(slot0.title_container) and slot0.play_effect == nil then
		slot0.play_effect = createEffectSpine(Config.EffectData.data_effect_info[103], cc.p(slot0.title_width * 0.5, slot0.title_height * 0.5), cc.p(0.5, 0.5), false, PlayerAction.action_2)

		slot0.title_container:addChild(slot0.play_effect, 1)
	end
end

function HeroexpeditResultWindow.close_callback(slot0)
	if slot0.item_list and next(slot0.item_list or {}) ~= nil then
		for slot4, slot5 in ipairs(slot0.item_list) do
			if slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end
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

	if not MainuiController:getInstance():checkIsInDramaUIFight() then
		AudioManager:getInstance():playLastMusic()
	end

	if BattleController:getInstance():getModel():getBattleScene() then
		BattleController:getInstance():getModel():result({
			result = slot0.data,
			combat_type = BattleConst.Fight_Type.ExpeditFight
		}, slot0.is_leave_self)
	end
end
