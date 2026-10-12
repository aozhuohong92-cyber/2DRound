BattleDramaUnlockChapterView = BattleDramaUnlockChapterView or BaseClass(BaseView)
slot0 = BattleDramaController:getInstance()

function BattleDramaUnlockChapterView.__init(slot0)
	slot0.is_full_screen = false
	slot0.layout_name = "battledrama/battle_drama_unlock_view"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("battle", "battle"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/battledrama", "battledrama_unlock_icon"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/battledrama", "txt_cn_battledrama_unlock_title"),
			type = ResourcesType.single
		}
	}
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.is_can_close = false
end

function BattleDramaUnlockChapterView.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())
	slot0.background:setVisible(true)

	slot0.main_panel = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_panel, 2)
	slot0.main_panel:setTouchEnabled(true)
	slot0.main_panel:setScale(display.getMaxScale())

	slot0.image_container = slot0.main_panel:getChildByName("image_container")
	slot0.Sprite_1 = slot0.image_container:getChildByName("icon_0")

	if slot0.sprite_1_load == nil then
		slot0.sprite_1_load = loadSpriteTextureFromCDN(slot0.Sprite_1, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_98"), ResourcesType.single, slot0.sprite_1_load)
	end

	slot0.Sprite_2 = slot0.image_container:getChildByName("icon_0_0")

	if slot0.sprite_2_load == nil then
		slot0.sprite_2_load = loadSpriteTextureFromCDN(slot0.Sprite_2, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_98"), ResourcesType.single, slot0.sprite_2_load)
	end

	slot0.title_panel = slot0.main_panel:getChildByName("title_panel")
	slot0.title_sp = slot0.title_panel:getChildByName("title_sp")
	slot0.icon = slot0.main_panel:getChildByName("icon")
	slot0.time_label = createRichLabel(22, 1, cc.p(0.5, 0.5), cc.p(slot0.root_wnd:getContentSize().width / 2 + 5, 355), nil, , 1000)

	slot0.time_label:setString(TI18N("10秒后关闭"))
	slot0.main_panel:addChild(slot0.time_label)

	slot0.star_name = createLabel(40, Config.ColorData.data_color4[197], Config.ColorData.data_color4[196], slot0.main_panel:getContentSize().width / 2, 360, "", slot0.main_panel, 2, cc.p(0.5, 0), "fonts/title.ttf")

	slot0:handleEffect(true)
end

function BattleDramaUnlockChapterView.register_event(slot0)
	slot0.main_panel:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended and uv0.is_can_close == true then
			playCloseSound()
			uv1:openBattleDramaUnlockChapterView(false)
		end
	end)
end

function BattleDramaUnlockChapterView.updateDesc(slot0, slot1)
	slot0.config = slot1

	if slot1 then
		loadSpriteTexture(slot0.title_sp, PathTool.getPlistImgForDownLoad("bigbg/battledrama", "txt_cn_battledrama_unlock_title"), LOADTEXT_TYPE)
		loadSpriteTexture(slot0.icon, PathTool.getPlistImgForDownLoad("bigbg/battledrama", "battledrama_unlock_icon"), LOADTEXT_TYPE)
		slot0.star_name:setString(slot1.name)
	end

	delayOnce(function ()
		uv0.is_can_close = true
	end, 1)
	slot0:updateTimer()
end

function BattleDramaUnlockChapterView.updateTimer(slot0)
	slot1 = 10

	GlobalTimeTicket:getInstance():add(function ()
		uv0 = uv0 - 1

		if uv1.time_label and not tolua.isnull(uv1.time_label) then
			uv1.time_label:setString(math.ceil(uv0) .. TI18N("秒后关闭"))
		end

		if slot0 <= 0 then
			uv2:openBattleDramaUnlockChapterView(false)
			GlobalTimeTicket:getInstance():remove("close_unlock_view")
		end
	end, 1, 0, "close_unlock_view")
end

function BattleDramaUnlockChapterView.openRootWnd(slot0, slot1)
	slot0:updateDesc(slot1)
end

function BattleDramaUnlockChapterView.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	else
		slot2 = slot0.main_panel:getContentSize()

		if not tolua.isnull(slot0.main_panel) and slot0.play_effect == nil then
			slot0.play_effect = createEffectSpine(PathTool.getEffectRes(145), cc.p(slot2.width * 0.5, slot2.height * 0.5 + 10), cc.p(0.5, 0.5), true, PlayerAction.action)

			slot0.main_panel:addChild(slot0.play_effect, -1)
		end
	end
end

function BattleDramaUnlockChapterView.close_callback(slot0)
	GlobalEvent:getInstance():Fire(Battle_dramaEvent.BattleDrama_Drama_Unlock_View, slot0.config)
	uv0:openBattleDramaUnlockChapterView(false)
	GlobalTimeTicket:getInstance():remove("close_unlock_view")
	slot0:handleEffect(false)

	if slot0.item_load_1 then
		slot0.item_load_1:DeleteMe()

		slot0.item_load_1 = nil
	end

	if slot0.sprite_1_load then
		slot0.sprite_1_load:DeleteMe()

		slot0.sprite_1_load = nil
	end

	if slot0.sprite_2_load then
		slot0.sprite_2_load:DeleteMe()

		slot0.sprite_2_load = nil
	end
end
