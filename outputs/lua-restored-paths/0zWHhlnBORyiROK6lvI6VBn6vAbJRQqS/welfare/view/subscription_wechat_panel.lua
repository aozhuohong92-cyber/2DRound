SubscriptionWechatPanel = class("SubscriptionWechatPanel", function ()
	return ccui.Widget:create()
end)

function SubscriptionWechatPanel.ctor(slot0)
	slot0.item_list = {}

	slot0:createRootWnd()
	slot0:registerEvent()
end

function SubscriptionWechatPanel.createRootWnd(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("welfare/subscription_wechat_panel"))

	slot0:addChild(slot0.root_wnd)
	slot0:setPosition(-40, -80)
	slot0:setAnchorPoint(0, 0)

	if WECHAT_SUBSCRIPTION == nil then
		WECHAT_SUBSCRIPTION = "sy_sszg"
	end

	if WECHAT_SUBSCRIPTION_NAME == nil then
		WECHAT_SUBSCRIPTION_NAME = "最终之刃"
	end

	slot0.wechat_sub_path = PathTool.getWechatSubRes()
	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0.main_container:getChildByName("txt1"):setString(TI18N("微信搜索:"))
	slot0.main_container:getChildByName("txt2"):setString(string.format(TI18N("%s (%s)公众号"), WECHAT_SUBSCRIPTION_NAME, WECHAT_SUBSCRIPTION))

	slot1 = TI18N("关注点击「福利宝匣」领取礼包码")

	if WECHAT_SUBSCRIPTION_DESC then
		slot1 = WECHAT_SUBSCRIPTION_DESC
	elseif PLATFORM_NAME == "9377" or PLATFORM_NAME == "9377ios" then
		slot1 = TI18N("关注点击【福利补给】领取礼包码")
	elseif PLATFORM_NAME == "icebird" or PLATFORM_NAME == "bingniao" then
		slot1 = TI18N("关注点击「福利补给」领取礼包码")
	end

	slot0.main_container:getChildByName("txt3"):setString(slot1)

	slot0.item_container = slot0.main_container:getChildByName("item_container")
	slot0.bg = slot0.main_container:getChildByName("bg")
	slot0.code_sprite_bg = slot0.main_container:getChildByName("code_sprite_bg")
	slot0.code_sprite = slot0.main_container:getChildByName("code_sprite")
	slot0.save_btn = slot0.main_container:getChildByName("save_btn")

	slot0.save_btn:getChildByName("Text_6"):setString(TI18N("保存至相册"))
	slot0:loadBackground()
	slot0:setItemList()
	WelfareController:getInstance():tellServerWechatStatus()
end

function SubscriptionWechatPanel.loadBackground(slot0)
	slot0.loader = loadSpriteTextureFromCDN(slot0.bg, PathTool.getPlistImgForDownLoad("bigbg/welfare", "txt_cn_subscription_wechat"), ResourcesType.single)

	loadSpriteTexture(slot0.code_sprite, slot0.wechat_sub_path, LOADTEXT_TYPE)
	slot0.code_sprite:setScale(slot0.code_sprite_bg:getContentSize().width / 275)
end

function SubscriptionWechatPanel.registerEvent(slot0)
	registerButtonEventListener(slot0.save_btn, function ()
		if FINAL_CHANNEL == "syios_smzhs" then
			message(TI18N("暂不支持"))

			return
		end

		uv0:savePhotoPicture()
	end, true, 1)
end

function SubscriptionWechatPanel.savePhotoPicture(slot0)
	if not IS_IOS_PLATFORM and callFunc("checkWrite") == "false" then
		return
	end

	if slot0.poste_picture then
		return
	end

	slot0.poste_picture = createSprite("", SCREEN_WIDTH * 0.5, SCREEN_HEIGHT * 0.5, ViewManager:getInstance():getLayerByTag(ViewMgrTag.LOADING_TAG), cc.p(0.5, 0.5), LOADTEXT_TYPE)

	slot0.poste_picture:setScale(display.getMaxScale())
	slot0:savePhotoText(slot0.poste_picture, false)

	slot0.sprite_load = createResourcesLoad(PathTool.getPlistImgForDownLoad("bigbg/welfare", "txt_cn_subscription_wechat_1"), ResourcesType.single, function ()
		if not tolua.isnull(uv0.poste_picture) then
			loadSpriteTexture(uv0.poste_picture, uv1, LOADTEXT_TYPE)

			if uv0.save_layout then
				uv0.save_layout:setVisible(true)
			end

			slot0 = cc.FileUtils:getInstance():getWritablePath() .. "poste_wechat.png"

			delayOnce(function ()
				cc.utils:captureScreen(function (slot0)
					if slot0 then
						saveImageToPhoto(uv0, 3)
					else
						message(TI18N("保存失败"))
					end

					if not tolua.isnull(uv1.poste_picture) then
						uv1.poste_picture:removeFromParent()

						uv1.poste_picture = nil
					end
				end, uv0)
			end, 0.01)
		end
	end, slot0.sprite_load)
end

function SubscriptionWechatPanel.savePhotoText(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	slot0.save_layout = ccui.Layout:create()

	slot0.save_layout:setPosition(49, 650)
	slot0.save_layout:setContentSize(cc.size(100, 100))
	slot1:addChild(slot0.save_layout)
	slot0.save_layout:setVisible(slot2)

	slot3 = createLabel(24, cc.c4b(247, 253, 255, 255), cc.c4b(20, 53, 108, 255), 7, 87, TI18N("微信搜索:"), slot0.save_layout, 2, cc.p(0, 0.5))
	slot5 = createLabel(24, cc.c4b(247, 253, 255, 255), cc.c4b(20, 53, 108, 255), 7, 47, string.format(TI18N("%s (%s)公众号"), WECHAT_SUBSCRIPTION_NAME, WECHAT_SUBSCRIPTION), slot0.save_layout, 2, cc.p(0, 0.5))
	slot6 = createLabel(24, cc.c4b(247, 253, 255, 255), cc.c4b(20, 53, 108, 255), 7, 7, TI18N("关注点击「福利补给」领取礼包码"), slot0.save_layout, 2, cc.p(0, 0.5))
	slot7 = createSprite(slot0.wechat_sub_path, 300, -340, slot0.save_layout, cc.p(0.5, 0.5), LOADTEXT_TYPE)
	slot8 = ccui.Layout:create()

	slot8:setPosition(149, 475)
	slot8:setContentSize(cc.size(100, 100))
	slot1:addChild(slot8)
	slot0:setCopyItemList(slot8)
end

function SubscriptionWechatPanel.setCopyItemList(slot0, slot1)
	if WelfareController:getInstance():getWechatData() == nil or slot2.items == nil then
		return
	end

	for slot6, slot7 in ipairs(slot2.items) do
		slot8 = BackPackItem.new(false, true, false, 1, false, true)

		slot1:addChild(slot8)
		slot8:setPosition(77 + (slot6 - 1) * 138, 77)
		slot8:setBaseData(slot7.bid, slot7.num)
	end
end

function SubscriptionWechatPanel.setItemList(slot0)
	if WelfareController:getInstance():getWechatData() == nil or slot1.items == nil then
		return
	end

	for slot5, slot6 in ipairs(slot1.items) do
		if slot0.item_list[slot5] == nil then
			slot0.item_list[slot5] = BackPackItem.new(false, true, false, 1, false, true)

			slot0.item_container:addChild(slot0.item_list[slot5])
			slot0.item_list[slot5]:setPosition(77 + (slot5 - 1) * 138, 77)
		end

		slot0.item_list[slot5]:setBaseData(slot6.bid, slot6.num)
	end
end

function SubscriptionWechatPanel.setVisibleStatus(slot0, slot1)
	bool = bool or false

	slot0:setVisible(slot1)
end

function SubscriptionWechatPanel.DeleteMe(slot0)
	if slot0.loader then
		slot0.loader:DeleteMe()
	end

	slot0.loader = nil

	if slot0.sprite_load then
		slot0.sprite_load:DeleteMe()
	end

	slot0.sprite_load = nil

	if not tolua.isnull(slot0.poste_picture) then
		slot0.poste_picture:removeFromParent()

		slot0.poste_picture = nil
	end

	if slot0.item_list then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end

		slot0.item_list = nil
	end
end
