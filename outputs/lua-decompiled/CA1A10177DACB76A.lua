VoiceRecordUI = class("VoiceRecordUI", function ()
	return ccui.Widget:create()
end)

function VoiceRecordUI.ctor(slot0)
	slot0:setContentSize(184, 174)

	slot0.bg = createScale9Sprite(PathTool.getResFrame("mainui", "mainui_voice_bg2"), slot0:getContentSize().width / 2, slot0:getContentSize().height / 2, LOADTEXT_TYPE_PLIST, slot0)

	slot0.bg:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.bg:setContentSize(cc.size(259, 253))

	slot0.icon = createSprite(PathTool.getResFrame("mainui", "mainui_voice1"), slot0.bg:getContentSize().width / 2, slot0.bg:getContentSize().height / 2 + 10, slot0.bg, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)
	slot0.red_bg = createScale9Sprite(PathTool.getResFrame("mainui", "mainui_voice_bg"), slot0.bg:getContentSize().width / 2, 15, LOADTEXT_TYPE_PLIST, slot0.bg)

	slot0.red_bg:setAnchorPoint(0.5, 0)
	slot0.red_bg:setContentSize(cc.size(234, 35))

	slot0.desc_label = createLabel(24, Config.ColorData.data_color4[1], nil, 0, 0, TI18N("手指上滑,取消发送"), slot0.bg)

	slot0.desc_label:setAnchorPoint(0.5, 0)
	slot0.desc_label:setPosition(slot0.bg:getContentSize().width / 2, 20)
end

function VoiceRecordUI.showAction(slot0)
end

function VoiceRecordUI.setIsRecord(slot0, slot1)
	if slot1 then
		slot0.desc_label:setString(TI18N("手指上滑,取消发送"))
		slot0.red_bg:setVisible(false)
		loadSpriteTexture(slot0.icon, PathTool.getResFrame("mainui", "mainui_voice1"), LOADTEXT_TYPE_PLIST)
	else
		slot0.desc_label:setString(TI18N("松开手指,取消发送"))
		slot0.red_bg:setVisible(true)
		loadSpriteTexture(slot0.icon, PathTool.getResFrame("mainui", "mainui_voice2"), LOADTEXT_TYPE_PLIST)
	end
end
