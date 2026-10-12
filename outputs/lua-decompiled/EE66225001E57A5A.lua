TaskSharePanel = TaskSharePanel or BaseClass(BaseView)
slot0 = TaskController:getInstance()

function TaskSharePanel.__init(slot0)
	slot0.is_full_screen = false
	slot0.title_str = ""
	slot0.layout_name = "vedio/vedio_share_panel"
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("vedio", "vedio"),
			type = ResourcesType.plist
		}
	}
end

function TaskSharePanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setSwallowTouches(false)
	end

	slot0.share_panel = slot0.root_wnd:getChildByName("share_panel")
	slot0.share_bg = slot0.share_panel:getChildByName("share_bg")
	slot0.btn_guild = slot0.share_bg:getChildByName("btn_guild")
	slot0.btn_world = slot0.share_bg:getChildByName("btn_world")
	slot0.btn_cross = slot0.share_bg:getChildByName("btn_cross")

	slot0.btn_guild:getChildByName("label"):setString(TI18N("分享到公会频道"))
	slot0.btn_world:getChildByName("label"):setString(TI18N("分享到世界频道"))
	slot0.btn_cross:getChildByName("label"):setString(TI18N("分享到跨服频道"))
end

function TaskSharePanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickCloseBtn), false, 1)
	registerButtonEventListener(slot0.btn_guild, handler(slot0, slot0.onClickGuildBtn), true, 2)
	registerButtonEventListener(slot0.btn_world, handler(slot0, slot0.onClickWorldBtn), true, 2)
	registerButtonEventListener(slot0.btn_cross, handler(slot0, slot0.onClickCrossBtn), true, 2)
end

function TaskSharePanel.onClickCloseBtn(slot0)
	uv0:openTaskSharePanel(false)
end

function TaskSharePanel.onClickGuildBtn(slot0)
	if RoleController:getInstance():getRoleVo():isHasGuild() == false then
		message(TI18N("您暂未加入公会"))

		return
	end

	if slot0.callback then
		slot0.callback(VedioConst.Share_Btn_Type.eGuildBtn)
	end

	slot0:onClickCloseBtn()
end

function TaskSharePanel.onClickWorldBtn(slot0)
	if slot0.callback then
		slot0.callback(VedioConst.Share_Btn_Type.eWorldBtn)
	end

	slot0.replay_id = nil

	slot0:onClickCloseBtn()
end

function TaskSharePanel.onClickCrossBtn(slot0)
	if RoleController:getInstance():getRoleVo().lev < Config.MiscData.data_const.cross_level.val then
		message(string.format(TI18N("%d级开启跨服频道"), slot1.val))

		return
	end

	if slot0.callback then
		slot0.callback(VedioConst.Share_Btn_Type.eCrossBtn)
	end

	slot0:onClickCloseBtn()
end

function TaskSharePanel.openRootWnd(slot0, slot1, slot2)
	slot3 = slot1 or {}
	slot0.callback = slot3.callback

	if slot0.share_panel:convertToNodeSpace(slot3.world_pos) then
		slot0.share_bg:setPosition(cc.p(slot7.x - 38 + (slot3.x or 0), slot7.y + 70 + (slot3.y or 0)))
	end
end

function TaskSharePanel.close_callback(slot0)
	uv0:openTaskSharePanel(false)
end
