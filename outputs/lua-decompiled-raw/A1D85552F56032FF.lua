TencentCos = TencentCos or BaseClass(BaseController)
slot0 = cc.FileUtils:getInstance()

function TencentCos.config(slot0)
	slot0.secretid = ""
	slot0.secretkey = ""
	slot0.url = "http://sszg-image-1256453865.picsh.myqcloud.com/"
	slot0.headUrl = "sszg_head/"
	slot0.had_init = false
	slot0.local_filetime_list = {}
	slot0.wait_download_list = {}
	slot0.is_in_download = false
	slot0.io_url_list = {}
end

function TencentCos.initCos(slot0, slot1, slot2)
	if not slot0.had_init then
		slot0.had_init = true
		slot0.secretid = slot1
		slot0.secretkey = slot2

		PathTool.getPhotoPath()

		slot0.local_filetime_list = SysEnv:getInstance():getTable(SysEnv.keys.custom_head_info)

		if CAN_USE_CAMERA then
			callFunc("initUpload", slot0.secretid, 0, 0, slot0.secretkey)
		end
	end
end

function TencentCos.getSecretid(slot0)
	return slot0.secretid
end

function TencentCos.upLoadHeadFile(slot0, slot1, slot2)
	if not CAN_USE_CAMERA then
		message(TI18N("请下载最新的安装包进行游戏体验,非常抱歉给你带来不好的游戏体验"))
	elseif slot0.secretid == "" or slot0.secretkey == "" then
		message(TI18N("上传头像图片异常"))
	else
		if RoleController:getInstance():getRoleVo() == nil then
			return
		end

		callFunc("uploadImage", string.format("%s%s.jpg", slot0.headUrl, slot1), 0, 0, slot2)
	end
end

function TencentCos.deleteHeadFile(slot0, slot1)
	callFunc("deleteImage", string.format("%s%s.jpg", slot0.headUrl, slot1))
end

function TencentCos.downLoadHeadFileBack(slot0, slot1)
	if not uv0:isFileExist(PathTool.getHeadPath(slot1)) then
		return
	end

	if slot0.wait_download_list[slot1] == nil or #slot3 == 0 then
		return
	end

	display.removeImage(slot1)

	for slot7, slot8 in ipairs(slot3) do
		slot8(slot1)
	end

	SysEnv:getInstance():set(SysEnv.keys.custom_head_info, slot0.local_filetime_list, true)

	slot0.wait_download_list[slot1] = nil
end

function TencentCos.downLoadHeadFile(slot0, slot1, slot2, slot3)
	if slot1 == nil or slot1 == "" or slot3 == nil then
		return
	end

	slot4 = PathTool.getHeadPath(slot1)

	if slot0.wait_download_list and slot0.wait_download_list[slot4] ~= nil then
		table.insert(slot0.wait_download_list[slot4], slot3)
	else
		slot5 = true

		if slot2 > (slot0.local_filetime_list[slot1] or 0) then
			slot5 = false
			slot0.local_filetime_list[slot1] = slot2
		end

		if uv0:isFileExist(slot4) and slot5 == true then
			slot3(slot4)
		else
			if slot0.wait_download_list[slot4] == nil then
				slot0.wait_download_list[slot4] = {}
			end

			table.insert(slot0.wait_download_list[slot4], slot3)
			slot0:downloadImg(string.format("%s%s%s.jpg", slot0.url, slot0.headUrl, slot1), slot1)
		end
	end
end

function TencentCos.downloadImg(slot0, slot1, slot2)
	if slot0.is_in_download == true then
		table.insert(slot0.io_url_list, {
			url = slot1,
			local_path = slot2
		})

		return
	end

	slot0.is_in_download = true

	function OnFileDownloadResult(slot0, slot1)
		if slot0 == 0 then
			uv0:downLoadHeadFileBack(uv1)
			delayOnce(function ()
				uv0.is_in_download = false

				if #uv0.io_url_list ~= 0 and table.remove(uv0.io_url_list, 1) and slot0.url and slot0.local_path then
					uv0:downloadImg(slot0.url, slot0.local_path)
				end
			end, 0.5)
		end
	end

	cc.FmodexManager:getInstance():downloadOtherFile(slot1, PathTool.getHeadSavePath(slot2))
end

function TencentCos.getStrData(slot0, slot1)
	for slot9 = 1, math.floor(table.getn(slot1) / 5120) do
		slot4 = "" .. string.char(unpack(slot1, 1 + (slot9 - 1) * slot3, slot9 * slot3))
	end

	return slot4 .. string.char(unpack(slot1, slot5 * slot3 + 1, slot2))
end
