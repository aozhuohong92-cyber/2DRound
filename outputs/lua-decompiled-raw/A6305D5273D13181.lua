VerificationcodeController = VerificationcodeController or BaseClass(BaseController)

function VerificationcodeController.config(slot0)
	slot0.model = VerificationcodeModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function VerificationcodeController.getModel(slot0)
	return slot0.model
end

function VerificationcodeController.registerEvents(slot0)
end

function VerificationcodeController.registerProtocals(slot0)
	slot0:RegisterProtocal(10990, "handle10990")
end

function VerificationcodeController.send10990(slot0, slot1)
	if not slot0.cmd then
		return
	end

	slot0:SendProtocal(10990, {
		code = tonumber(slot1),
		cmd = slot0.cmd
	})
end

function VerificationcodeController.handle10990(slot0, slot1)
	if slot1 then
		slot0.cmd = slot1.cmd
		slot0.flag = slot1.flag

		if slot0.flag == 99 then
			slot0:OpenVerificationcodeMainWindow(false)
			CommonAlert.show(TI18N("验证码错误，请重启游戏后尝试"), TI18N("确定"), sdkOnSwitchAccount, nil, , , , {
				view_tag = ViewMgrTag.RECONNECT_TAG
			})

			return
		end

		slot3 = PathTool.getVerificationcodePath("code")
		slot0.path = slot3

		display.removeImage(slot3)
		writeBinaryFile(slot3, slot1.img)
		slot0.dispather:Fire(VerificationcodeEvent.VERIFICATION_CODE_CHANGE, slot1)

		if slot1.flag ~= 1 then
			slot0:OpenVerificationcodeMainWindow(true)
		end
	end
end

function VerificationcodeController.getImgPath(slot0)
	return slot0.path
end

function VerificationcodeController.getFlagValue(slot0)
	return slot0.flag or 0
end

function VerificationcodeController.OpenVerificationcodeMainWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.code_window then
			slot0.code_window = VerificationcodeMainWindow.New()
		end

		if slot0.code_window:isOpen() == false then
			slot0.code_window:open()
		end
	elseif slot0.code_window then
		slot0.code_window:close()

		slot0.code_window = nil
	end
end

function VerificationcodeController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
