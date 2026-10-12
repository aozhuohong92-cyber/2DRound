CommonUI = CommonUI or BaseClass()
CommonUI.__ZOrder = 0
CommonUI.close_panel = "CommonUI_close_panel"
CommonUI.close_cur_panel = "CommonUI_close_cur_panel"
CommonUI.close_all_panel = "CommonUI_close_all_panel"

function CommonUI.__init(slot0)
end

function CommonUI.setCommonUIZOrder(slot0, slot1)
	CommonUI.__ZOrder = CommonUI.__ZOrder + 1

	slot1:setLocalZOrder(CommonUI.__ZOrder)
end

function CommonUI.getCommonUIZOrder(slot0)
	return CommonUI.__ZOrder
end

function CommonUI.open(slot0)
end

function CommonUI.__delete(slot0)
end
