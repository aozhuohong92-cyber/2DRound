ServerCell = class("ServerCell", function ()
	return ccui.Widget:create()
end)
slot1 = LoginController:getInstance():getModel()

function ServerCell.ctor(slot0)
	slot0.rolesNum = 0
	slot0.roles = {}
	slot0.role_cell_list = {}
	slot0.scroll_h = 100
	slot0.isOpenRoles = false
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("login/server_cell"))

	slot0:addChild(slot0.root_wnd)

	slot1 = slot0.root_wnd:getContentSize()

	slot0:retain()
	slot0:setContentSize(slot1)
	slot0:setAnchorPoint(0, 1)
	slot0:setCascadeOpacityEnabled(true)

	slot0.cell_w = slot1.width
	slot0.cell_h = slot1.height
	slot0.select_bg = slot0.root_wnd:getChildByName("select_bg")
	slot0.state_icon = slot0.root_wnd:getChildByName("state_icon")
	slot0.close_icon = slot0.root_wnd:getChildByName("close_icon")
	slot0.icon_state = slot0.root_wnd:getChildByName("icon_state")
	slot0.server_id = slot0.root_wnd:getChildByName("server_id")
	slot0.server_name = slot0.root_wnd:getChildByName("server_name")
	slot0.role_info = slot0.root_wnd:getChildByName("role_info")
	slot0.role_lev = slot0.role_info:getChildByName("role_sum")
end

function ServerCell.setBaseData(slot0, slot1, slot2)
	if slot1 == nil or slot1.v == nil then
		return
	end

	slot0.data = slot1
	slot0.idx = slot1.idx
	slot3 = 1

	if slot0.data.v.isClose then
		slot3 = 2

		slot0.close_icon:setVisible(true)
		slot0.state_icon:setVisible(false)
	else
		slot0.close_icon:setVisible(false)

		if slot0.data.v.isNew then
			slot3 = 0

			slot0.state_icon:setVisible(true)
		else
			slot0.state_icon:setVisible(false)
		end
	end

	slot0.icon_state:loadTexture(PathTool.getResFrame("login2", "login2_100" .. slot3), LOADTEXT_TYPE_PLIST)
	slot0:addRolesSelectPanel()
	slot0.server_name:setString(slot0.data.v.srv_name)

	if slot2 then
		slot0.server_name:setPositionX(309)
		slot0.server_id:setString(LoginController:getInstance():getModel():getSrvGroupNameByGroupId(slot0.data.v.group_id) .. string.format(TI18N("%s服"), slot0.data.v.group_num))
	else
		slot0.server_name:setPositionX(222)
		slot0.server_id:setString(string.format(TI18N("%s服"), slot0.data.v.group_num))
	end

	slot0.role_first = {
		isEmpty = true
	}

	if slot1.v.role_count > 0 then
		slot0.role_lev:setString(slot1.role_count)
		slot0.role_info:setVisible(true)
		slot0.role_lev:setVisible(true)
	else
		slot0.role_lev:setVisible(false)
		slot0.role_info:setVisible(false)
	end
end

function ServerCell.updateRoleData(slot0, slot1)
	if slot1 then
		slot0.roles = slot1
		slot0.rolesNum = #slot1

		table.sort(slot0.roles, function (slot0, slot1)
			return slot1.lev < slot0.lev
		end)
		slot0:updateRoleCellContentSize()
		slot0:update()
	end
end

function ServerCell.addRolesSelectPanel(slot0)
	if slot0.data == nil or slot0.data.v == nil then
		return
	end

	slot2 = 84 + 10

	if slot0.roleSelectedPanel == nil then
		slot0.roleSelectedPanel = ccui.Layout:create()

		slot0.roleSelectedPanel:setAnchorPoint(cc.p(0, 1))
		slot0.roleSelectedPanel:setPosition(cc.p(16, 0))
		slot0.roleSelectedPanel:setTouchEnabled(false)
		slot0:addChild(slot0.roleSelectedPanel)
		slot0.roleSelectedPanel:setCascadeOpacityEnabled(true)
	end

	slot0.roleSelectedPanel:setContentSize(cc.size(397, slot2))

	if slot0.scroll_view == nil then
		slot0.scroll_view = createScrollView(397, 163, 0, 0, slot0.roleSelectedPanel, ccui.ScrollViewDir.vertical)

		slot0.scroll_view:setCascadeOpacityEnabled(true)
		slot0.scroll_view:setAnchorPoint(0, 0)
	end

	slot0.scroll_view:setContentSize(cc.size(397, slot2))
	slot0.roleSelectedPanel:setVisible(false)

	slot0.scroll_h = slot2
end

function ServerCell.updateRoleCellContentSize(slot0)
	if not slot0.roleSelectedPanel or not slot0.scroll_view then
		return
	end

	slot1 = 84
	slot2 = 0
	slot2 = (slot0.rolesNum <= 1 and slot1 + 0 or slot1 * 2 + 5) + 10

	slot0.roleSelectedPanel:setContentSize(cc.size(397, slot2))
	slot0.scroll_view:setContentSize(cc.size(397, slot2))

	slot0.scroll_h = slot2
end

function ServerCell.update(slot0)
	if slot0.scroll_view then
		slot0.scroll_view:removeAllChildren()
	end

	function slot1(slot0)
		if checkUserProto and checkUserProto() and not SysEnv:getInstance():getBool(SysEnv.keys.user_proto_agree, false) then
			message(TI18N("请勾选同意开始游戏按钮下方的 游戏用户协议 和 隐私保护指引,即可进入游戏"))

			return
		end

		if uv0.data == nil or uv0.data.v == nil then
			return
		end

		if NEED_CHECK_CLOSE and not uv1:isWhite() and uv0.data.v.isClose then
			return
		end

		uv1:setCurSrv(uv0.data.v, true)

		if not GameNet:getInstance():IsServerConnect() then
			slot2 = uv1:getLoginData()
			slot2.host = uv0.data.v.host
			slot2.open_time = uv0.data.v.open_time

			if slot2 and slot2.usrName and slot2.usrName ~= "" and not uv0.connecting then
				uv0.connecting = true

				uv2:requestLoginGame(slot2.usrName, uv0.data.v.ip, uv0.data.v.port, false)
				delayOnce(function ()
					uv0.connecting = false
				end, 0.5)
			end
		elseif slot0.isEmpty then
			uv2:request10101Create()
		else
			uv2:request10102Login(slot0.data.rid, slot0.data.srv_id)
		end
	end

	slot2 = 0
	slot3 = nil
	slot4 = 88

	if #slot0.roles > 0 then
		slot5 = #slot0.roles
		slot6 = slot0.scroll_view:getContentSize()
		slot11 = cc.size

		slot0.scroll_view:setInnerContainerSize(slot11(slot6.width, math.max(slot5 * 78 + (slot5 + 1) * 5, slot6.height)))

		for slot11, slot12 in ipairs(slot0.roles) do
			slot13 = RoleLoginCell.new(slot12, slot0.scroll_view)

			slot13:setPosition(0, slot7 - (5 + (slot11 - 1) * 88))
			slot13:addCallBack(slot1)

			slot2 = slot2 + 1
			slot0.role_cell_list[slot11] = slot13
		end
	else
		slot6 = RoleLoginCell.new({
			isEmpty = true
		}, slot0.scroll_view)

		slot6:setPosition(0, slot4)
		slot6:addCallBack(slot1)

		slot2 = slot2 + 1
	end

	slot5 = slot0.scroll_view:getContentSize()

	slot0.scroll_view:setInnerContainerSize(cc.size(slot5.width, math.max(slot5.height, slot4)))
end

function ServerCell.addCallBack(slot0, slot1)
	slot0.callBack = slot1

	slot0:setTouchEnabled(true)
	slot0:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			if uv0.data == nil or uv0.data.v == nil then
				return
			end

			if NEED_CHECK_CLOSE and not uv1:isWhite() and (uv0.data.v.isClose or GameNet:getInstance():getTime() - uv0.data.v.open_time < 0) then
				uv1:checkReloadServerData(uv0.data.v)
			elseif uv0.callBack ~= nil then
				uv0:callBack()
			end
		end
	end)
end

function ServerCell.setSelected(slot0, slot1)
	if slot0.select_bg then
		slot0.select_bg:setVisible(slot1)
	end

	if slot1 == true then
		slot0.server_id:setTextColor(cc.c4b(2, 62, 1, 255))
		slot0.server_name:setTextColor(cc.c4b(2, 62, 1, 255))
	else
		slot0.server_id:setTextColor(cc.c4b(104, 69, 42, 255))
		slot0.server_name:setTextColor(cc.c4b(104, 69, 42, 255))
	end
end

function ServerCell.showRoles(slot0)
	slot0.roleSelectedPanel:setVisible(true)
	slot0:setSelected(true)

	slot0.isOpenRoles = true
end

function ServerCell.closeRoles(slot0)
	slot0.roleSelectedPanel:setVisible(false)
	slot0:setSelected(false)

	slot0.isOpenRoles = false
end

function ServerCell.clearLayout(slot0)
	slot0:setSelected(false)
	slot0:removeFromParent()
end

function ServerCell.DeleteMe(slot0)
	if slot0.role_cell_list then
		for slot4, slot5 in ipairs(slot0.role_cell_list) do
			if slot5 and slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
	slot0:release()
end

function ServerCell.getData(slot0)
	return slot0.data
end
