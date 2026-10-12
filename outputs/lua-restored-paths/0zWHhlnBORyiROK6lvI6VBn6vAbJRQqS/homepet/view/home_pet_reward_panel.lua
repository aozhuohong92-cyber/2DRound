HomePetRewardPanel = HomePetRewardPanel or BaseClass(BaseView)
slot0 = HomepetController:getInstance()

function HomePetRewardPanel.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {}
	slot0.layout_name = "homepet/home_pet_reward_panel"
	slot0.cache_list = {}
end

function HomePetRewardPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container_size = slot0.main_container:getContentSize()
	slot0.title_img = slot0.main_container:getChildByName("title_img")
	slot0.title_tips = slot0.main_container:getChildByName("title_tips")

	slot0.title_tips:setString(TI18N("收到了礼物，点击领取"))

	slot0.txt_cn_common_notice_1 = slot0.main_container:getChildByName("txt_cn_common_notice_1")

	slot0.txt_cn_common_notice_1:setVisible(false)

	slot0.click_btn = slot0.main_container:getChildByName("click_btn")
end

function HomePetRewardPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:onClosedBtn()
	end, false, 2)
	registerButtonEventListener(slot0.click_btn, function ()
		uv0:onClickBtn()
	end, false, 1)
end

function HomePetRewardPanel.onClosedBtn(slot0)
	if not slot0.is_show then
		return
	end

	uv0:openHomePetRewardPanel(false)
end

function HomePetRewardPanel.onClickBtn(slot0)
	if not slot0.is_show then
		slot0:showOpenEffect()
	end
end

function HomePetRewardPanel.openRootWnd(slot0, slot1)
	slot0.event_data = (slot1 or {}).event_data

	if not slot0.event_data then
		return
	end

	slot0:setTitleImg(PathTool.getPlistImgForDownLoad("bigbg/homepet", "home_pet_reward_closed", false), true)
end

function HomePetRewardPanel.setTitleImg(slot0, slot1, slot2, slot3)
	if slot0.record_title_img_res == nil or slot0.record_title_img_res ~= slot1 then
		slot0.record_title_img_res = slot1
		slot0.item_load_title_img_res = createResourcesLoad(slot1, ResourcesType.single, function ()
			if not tolua.isnull(uv0.title_img) then
				loadSpriteTexture(uv0.title_img, uv1, LOADTEXT_TYPE)

				if uv2 and not uv0.is_show then
					uv0:runImgAction(uv0.title_img)
				end

				if uv3 then
					uv0.title_img:setPositionY(199.62)
				end
			end
		end, slot0.item_load_title_img_res)
	end
end

function HomePetRewardPanel.runImgAction(slot0, slot1)
	slot1:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.RotateTo:create(0.2, 30), cc.RotateTo:create(0.2, -30), cc.RotateTo:create(0.2, 20), cc.RotateTo:create(0.2, -20), cc.RotateTo:create(0.3, 15), cc.RotateTo:create(0.3, -15), cc.RotateTo:create(0.3, 0))))
end

function HomePetRewardPanel.showOpenEffect(slot0)
	slot0.title_tips:setVisible(false)
	slot0.txt_cn_common_notice_1:setVisible(true)
	doStopAllActions(slot0.title_img)
	slot0.title_img:setRotation(0)
	slot0:setTitleImg(PathTool.getPlistImgForDownLoad("bigbg/homepet", "home_pet_reward_open", false), nil, true)

	slot0.show_list = {}

	if slot0.event_data and slot0.event_data.award and next(slot0.event_data.award) ~= nil then
		slot0.show_list = slot0.event_data.award

		table.sort(slot0.show_list, function (slot0, slot1)
			return slot0.id < slot1.id
		end)
	end

	slot0.is_show = true

	slot0:playOpenEffect(true)
	delayRun(slot0.root_wnd, 0.2, function ()
		uv0:showItemEffect()
	end)
end

function HomePetRewardPanel.playOpenEffect(slot0, slot1)
	if slot1 == false then
		if slot0.item_effect then
			slot0.item_effect:clearTracks()
			slot0.item_effect:removeFromParent()

			slot0.item_effect = nil
		end
	elseif slot0.item_effect == nil then
		slot0.item_effect = createEffectSpine("E24801", cc.p(333, 228), cc.p(0.5, 0.5), false, PlayerAction.action)

		slot0.main_container:addChild(slot0.item_effect, 1)
	end
end

function HomePetRewardPanel.showItemEffect(slot0)
	slot2 = 680
	slot4 = 320
	slot6 = (slot0.main_container_size.width - 40 * 2) / 4
	slot7 = 160

	if #slot0.show_list <= 4 then
		slot2 = 600
	end

	slot9 = math.floor
	slot0.action_effect = {}
	slot10 = slot1 + slot6 * 0.5

	for slot14 = 1, slot8 do
		slot15 = slot0.show_list[slot14]

		delayRun(slot0.root_wnd, slot14 * 0.15, function ()
			function slot0()
				if uv0.action_effect[uv1] then
					uv0.action_effect[uv1]:runAction(cc.RemoveSelf:create(true))

					uv0.action_effect[uv1] = nil
				end
			end

			slot1 = uv2((uv1 - 1) / uv3)

			if (uv1 - 1) % uv3 == 0 and uv4 - uv1 < uv3 then
				uv7 = uv8 + (uv5 - uv6 * (uv4 - uv1 + 1)) * 0.5 + uv6 * 0.5
			end

			uv0.action_effect[uv1] = createEffectSpine(Config.EffectData.data_effect_info[156], cc.p(uv7 + uv6 * slot2, uv9 - slot1 * uv10), cc.p(0.5, 0.5), false, PlayerAction.action_3, slot0, cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A8888)

			uv0.main_container:addChild(uv0.action_effect[uv1], 1)
			uv0.action_effect[uv1]:registerSpineEventHandler(function (slot0)
				if slot0.eventData.name == "appear" then
					slot1 = ShowItemObj.new(uv0)

					slot1:setData(uv1)
					slot1:setPosition(cc.p(uv2, uv3))
					uv4.main_container:addChild(slot1)
					table.insert(uv4.cache_list, slot1)
				end
			end, sp.EventType.ANIMATION_EVENT)
		end)
	end
end

function HomePetRewardPanel.close_callback(slot0)
	if slot0.cache_list then
		for slot4, slot5 in ipairs(slot0.cache_list) do
			slot5:DeleteMe()
		end
	end

	slot0.cache_list = nil

	if slot0.item_load_title_img_res then
		slot0.item_load_title_img_res:DeleteMe()

		item_load_title_img_res = nil
	end

	doStopAllActions(slot0.root_wnd)
	doStopAllActions(slot0.title_img)

	if slot0.action_effect then
		for slot4, slot5 in pairs(slot0.action_effect) do
			slot5:clearTracks()
			slot5:removeFromParent()
		end
	end

	slot0.action_effect = nil

	if slot0.event_data and slot0.event_data.evt_id then
		uv0:sender26106(slot0.event_data.evt_id)
		uv0:setWaitNextEvent(false)
	end

	slot0:playOpenEffect(false)
	uv0:openHomePetRewardPanel(false)
end

ShowItemObj = ShowItemObj or class("ShowItemObj", function ()
	return ccui.Widget:create()
end)
ShowItemObj.WIDTH = 119
ShowItemObj.HEIGHT = 119

function ShowItemObj.ctor(slot0)
	slot0.is_play = true
	slot0.size = cc.size(ShowItemObj.WIDTH, ShowItemObj.HEIGHT)

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot0:setCascadeOpacityEnabled(true)
	slot0:registerEvent()
end

function ShowItemObj.registerEvent(slot0)
	slot0:registerScriptHandler(function (slot0)
		if slot0 == "enter" then
			if uv0.is_play == true then
				uv0:setOpacity(0)
				uv0:setScale(2)
				uv0:runAction(cc.Spawn:create(cc.FadeIn:create(0.1), cc.ScaleTo:create(0.1, 1)))
			end
		elseif slot0 == "exit" then
			-- Nothing
		end
	end)
end

function ShowItemObj.setData(slot0, slot1, slot2)
	slot0:showItemUI(slot1, slot2)
end

function ShowItemObj.showItemUI(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	slot4, slot5, slot6 = nil

	if Config.ItemData.data_get_data(slot1.id) == nil then
		return
	end

	if slot6 ~= nil then
		slot4 = slot6.quality
		slot5 = slot6.name

		if not slot0.item then
			slot0.item = BackPackItem.new(true, false)

			slot0.item:setPosition(0, 0)
			slot0.item:setAnchorPoint(cc.p(0, 0))
			slot0:addChild(slot0.item)
		end

		slot0.item:setBaseData(slot1.id, slot1.num)
	end

	if slot4 ~= nil and slot5 ~= nil and slot0.item then
		slot0.item:setExtendDesc(true, slot5, 275, 2, false, 24)
	end
end

function ShowItemObj.DeleteMe(slot0)
	slot0:stopAllActions()

	if slot0.item then
		slot0.item:DeleteMe()

		slot0.item = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
