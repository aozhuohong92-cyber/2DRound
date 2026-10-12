GuildBossResetWindow = GuildBossResetWindow or BaseClass(BaseView)
slot0 = GuildbossController:getInstance()
slot1 = GuildbossController:getInstance():getModel()
slot2 = string.format

function GuildBossResetWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.win_type = WinType.Mini
	slot0.reset_type_list = {}
	slot0.layout_name = "guildboss/guildboss_reset_window"
	slot0.cur_type = 0
end

function GuildBossResetWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("win_title"):setString(TI18N("副本重置"))
	slot1:getChildByName("title_desc"):setString(TI18N("请选择公会副本重置方式："))

	slot0.pass_desc = slot1:getChildByName("pass_desc")
	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.confirm_btn = slot1:getChildByName("confirm_btn")
	slot5 = TI18N

	slot0.confirm_btn:getChildByName("label"):setString(slot5("确定"))

	for slot5 = 1, 2 do
		slot6 = {
			reset_title = slot1:getChildByName("reset_title_" .. slot5),
			reset_desc = slot1:getChildByName("reset_desc_" .. slot5),
			reset_notice = slot1:getChildByName("reset_notice_" .. slot5),
			reset_checkbox = slot1:getChildByName("reset_checkbox_" .. slot5)
		}

		slot6.reset_desc:setTextAreaSize(cc.size(235, 100))

		slot6.index = slot5 - 1

		slot6.reset_checkbox:setSelected(false)

		slot0.reset_type_list[slot5] = slot6
	end
end

function GuildBossResetWindow.register_event(slot0)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openGuildBossResetWindow(false)
		end
	end)

	function slot4(slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:requestResetGuildDun(uv1.cur_type)
		end
	end

	slot0.confirm_btn:addTouchEventListener(slot4)

	for slot4, slot5 in pairs(slot0.reset_type_list) do
		slot5.reset_checkbox:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				uv0:changeCheckBoxStatus(uv1)
			end
		end)
	end
end

function GuildBossResetWindow.changeCheckBoxStatus(slot0, slot1)
	slot4 = slot0.reset_type_list[slot1].reset_checkbox:isSelected()

	for slot8, slot9 in pairs(slot0.reset_type_list) do
		if slot9.reset_checkbox ~= slot3 then
			slot9.reset_checkbox:setSelected(not slot4)

			if slot4 == false then
				slot0.cur_type = slot9.index
			else
				slot0.cur_type = slot2.index
			end
		end
	end
end

function GuildBossResetWindow.openRootWnd(slot0)
	slot0:fillBaseInfo()
	slot0:fillResetDesc()
end

function GuildBossResetWindow.fillBaseInfo(slot0)
	if uv0:getBaseInfo() ~= nil then
		for slot5, slot6 in ipairs(slot0.reset_type_list) do
			if slot6.index == slot1.type then
				slot0.cur_type = slot1.type

				slot6.reset_checkbox:setSelected(true)
			else
				slot6.reset_checkbox:setSelected(false)
			end

			slot6.reset_checkbox:setTouchEnabled(slot1.fid > 1)

			if slot1.fid <= 1 then
				if slot5 == 1 then
					slot6.reset_notice:setString(string.format(TI18N("可重置至%s章"), slot1.fid))
				elseif slot5 == 2 then
					slot6.reset_notice:setTextColor(Config.ColorData.data_color4[183])
					slot6.reset_notice:setString(TI18N("(未通关第一章无法回退)"))
				end
			elseif slot5 == 1 then
				slot6.reset_notice:setString(string.format(TI18N("可重置至%s章"), slot1.fid))
			elseif slot5 == 2 then
				slot6.reset_notice:setTextColor(Config.ColorData.data_color4[181])
				slot6.reset_notice:setString(string.format(TI18N("可回退至%s章"), slot1.fid - 1))
			end
		end

		if slot1.fid == 0 then
			slot0.pass_desc:setString(TI18N("当前未通关任意章节"))
		else
			slot0.pass_desc:setString(string.format(TI18N("历史达到最高章节：%s章"), slot1.fid))
		end
	end
end

function GuildBossResetWindow.fillResetDesc(slot0)
	for slot4, slot5 in ipairs(slot0.reset_type_list) do
		if Config.GuildDunData.data_const["reset_desc_" .. slot5.index] ~= nil then
			slot5.reset_title:setString(slot6.val)
			slot5.reset_desc:setString(slot6.desc)
		end
	end
end

function GuildBossResetWindow.close_callback(slot0)
	uv0:openGuildBossResetWindow(false)
end
