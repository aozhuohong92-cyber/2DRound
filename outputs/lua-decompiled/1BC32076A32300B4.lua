HeroSharePanel = HeroSharePanel or BaseClass(BaseView)
slot0 = HeroController:getInstance()

function HeroSharePanel.__init(slot0)
	slot0.is_full_screen = false
	slot0.title_str = ""
	slot0.layout_name = "hero/hero_share_panel"
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {}
end

function HeroSharePanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.share_panel = slot0.root_wnd:getChildByName("share_panel")
	slot0.share_bg = slot0.share_panel:getChildByName("share_bg")
	slot6 = "公会频道"
	slot0.btn_list = {}

	for slot6, slot7 in ipairs({
		HeroConst.ShareBtnType.eHeroShareCross,
		HeroConst.ShareBtnType.eHeroShareWorld,
		HeroConst.ShareBtnType.eHeroShareGuild
	}) do
		slot8 = {
			btn = slot0.share_bg:getChildByName("btn_" .. slot6)
		}
		slot8.label = slot8.btn:getChildByName("label")

		slot8.label:setString(({
			[HeroConst.ShareBtnType.eHeroShareCross] = TI18N("跨服频道"),
			[HeroConst.ShareBtnType.eHeroShareWorld] = TI18N("世界频道"),
			[HeroConst.ShareBtnType.eHeroShareGuild] = TI18N(slot6)
		})[slot7])

		slot0.btn_list[slot7] = slot8
	end
end

function HeroSharePanel.register_event(slot0)
	slot4 = handler(slot0, slot0.onClickCloseBtn)
	slot5 = false

	registerButtonEventListener(slot0.background, slot4, slot5, 1)

	for slot4, slot5 in pairs(slot0.btn_list) do
		registerButtonEventListener(slot5.btn, function ()
			uv0:onClickBtnByIndex(uv1)
		end, true, 2)
	end
end

function HeroSharePanel.onClickCloseBtn(slot0)
	uv0:openHeroSharePanel(false)
end

function HeroSharePanel.onClickBtnByIndex(slot0, slot1)
	slot2 = false

	if slot1 == HeroConst.ShareBtnType.eHeroShareCross then
		slot2 = true
	elseif slot1 == HeroConst.ShareBtnType.eHeroShareWorld then
		slot2 = true
	elseif slot1 == HeroConst.ShareBtnType.eHeroShareGuild then
		if RoleController:getInstance():getRoleVo():isHasGuild() == false then
			message(TI18N("您暂未加入公会"))
		else
			slot2 = true
		end
	end

	if slot2 and slot0.callback then
		slot0.callback(slot1, slot0.setting)
	end

	slot0:onClickCloseBtn()
end

function HeroSharePanel.openRootWnd(slot0, slot1, slot2, slot3)
	if not slot1 then
		return
	end

	slot0.callback = slot2
	slot0.setting = slot3 or {}
	slot0.callback = slot2

	if slot0.share_panel:convertToNodeSpace(slot1) then
		slot0.share_bg:setPosition(cc.p(slot5.x + (slot4.offsetx or 0), slot5.y + (slot4.offsety or 0)))
	end
end

function HeroSharePanel.close_callback(slot0)
	uv0:openHeroSharePanel(false)
end
