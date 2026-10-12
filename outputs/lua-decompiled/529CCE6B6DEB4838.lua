CommonUIController = CommonUIController or BaseClass(BaseController)

function CommonUIController.config(slot0)
end

function CommonUIController.registerEvents(slot0)
end

function CommonUIController.registerProtocals(slot0)
end

function CommonUIController.openCommonComboboxPanel(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot1 == false then
		if slot0.common_combobox_panel ~= nil then
			slot0.common_combobox_panel:close()

			slot0.common_combobox_panel = nil
		end
	else
		if slot0.common_combobox_panel == nil then
			slot0.common_combobox_panel = CommonComboboxPanel.New()
		end

		slot0.common_combobox_panel:open(slot2, slot3, slot4, slot5)
	end
end

function CommonUIController.__delete(slot0)
end
