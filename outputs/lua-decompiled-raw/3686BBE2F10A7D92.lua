IS_NEW_VERSION = nil
AUDIO_RECORD_TYPE = 10
AUDIO_RECORD_FILE = "zsyz"
AUDIO_WAV_FILE_ENCODE_OUT = "zsyz_encode_out.wav"
AUDIO_WAV_FILE_DECODE_IN = "zsyz_decode_in.wav"

function getChatFileName(slot0)
	if AUDIO_RECORD_TYPE == 10 then
		return string.format("%s%s", string.gsub(slot0, "-", "_"), ".wav")
	else
		return string.format("%s%s", string.gsub(slot0, "-", "_"), ".mp3")
	end
end

function callSpeexEncode(slot0, slot1)
	slot0 = slot0 or PathTool.getVoicePath(getChatFileName(AUDIO_RECORD_FILE))
	slot1 = slot1 or PathTool.getVoicePath(AUDIO_WAV_FILE_ENCODE_OUT)

	print("speex_encode=====", slot0, slot1)

	return cc.CCGameLib:getInstance():speex_encode(slot0, slot1)
end

function callSpeexDecode(slot0, slot1)
	if PLATFORM == cc.PLATFORM_OS_WINDOWS or PLATFORM == cc.PLATFORM_OS_MAC then
		return
	end

	slot0 = slot0 or PathTool.getVoicePath(AUDIO_WAV_FILE_DECODE_IN)

	print("speex_decode=====", slot0, slot1)
	cc.CCGameLib:getInstance():speex_decode(slot0, slot1)
end

function callSpeechInit()
	if not _callSpeechInit then
		_callSpeechInit = true

		print("callSpeechInit====")
		sdkCallFunc("speechInit", "", 0, 0, "")
	end
end

function callSpeechRecognizeDo(slot0, slot1)
	callSpeechRecognize(slot0, readBinaryFile(PathTool.getVoicePath(AUDIO_RECORD_FILE .. ".wav")))

	_speech_recognize_fun = slot1
end

function callSpeechRecognizeFile(slot0, slot1)
	callSpeechInit()
	sdkCallFunc("speechRecognize", slot1, 0, 0, slot0)
end

function callSpeechRecognize(slot0, slot1, slot2)
	if PLATFORM == cc.PLATFORM_OS_WINDOWS then
		return
	end

	callSpeechInit()

	slot2 = slot2 or string.len(slot1)

	print("speechRecognize=====>>>", slot0, slot2)
	cc.GameDevice:speechRecognize(slot0, slot1, slot2)
end

function callBackSpeech(slot0, slot1)
	print("callBackSpeech=====", slot0, slot1)

	if _speech_recognize_fun and slot0 == 0 then
		_speech_recognize_fun(slot1)
	end

	_speech_recognize_fun = nil
end

function callAudioInit(slot0, slot1, slot2)
	slot0 = slot0 or PathTool.getVoicePath(ChatHelp.formatFileName(AUDIO_RECORD_FILE))
	slot1 = slot1 or 16000

	if not _callAudioInit then
		_callAudioInit = true

		print("callAudioInit=====", slot0, slot1)
		sdkCallFunc("audioInit", slot0, slot1, 2, "")
		delayOnce(function ()
			sdkCallFunc("audioStart", "", 0, 0, "")
		end, 0.1)
		delayOnce(function ()
			sdkCallFunc("audioStop", "", 0, 0, "")
			delayOnce(function ()
				AudioManager:getInstance():playMusic(AudioManager.AUDIO_TYPE.SCENE, "s_001", true)
			end, 0.1)
		end, 0.2)
	elseif slot2 then
		sdkCallFunc("audioInit", slot0, slot1, 0, "")
	end
end

function callAudioStart()
	print("callAudioStart=====")

	if AUDIO_RECORD_TYPE == 10 then
		if sdkCallFunc("audioStart", "", 0, 0, "") ~= 1 then
			print("录音开始失败")

			__audio_record_err = (__audio_record_err or 0) + 1

			if __audio_record_err > 2 then
				callAudioInit(nil, , true)
			end
		else
			__audio_record_err = 0
		end
	else
		cc.FmodexManager:startRecord(AUDIO_RECORD_FILE, AUDIO_RECORD_TYPE)
	end
end

function callAudioStop()
	print("callAudioStop=====")

	if AUDIO_RECORD_TYPE == 10 then
		sdkCallFunc("audioStop", "", 0, 0, "")
	else
		cc.FmodexManager:stopRecord()
	end
end

function callAudioSetVolume(slot0)
	print("callAudioSetVolume=====", slot0)

	slot1 = SysEnv:getInstance():getBool(SysEnv.keys.voice_is_open, true)

	print("---------voice_open--callfunction---", slot1)

	if slot1 then
		sdkCallFunc("audioSetVolume", "", slot0, 0, "")
	else
		sdkCallFunc("audioSetVolume", "", 0, 0, "")
	end
end

function callAudioGetVolume()
	print("callAudioGetVolume=====")

	return sdkCallFunc("audioGetVolume", "", 0, 0, "")
end

function callAudioIsRecording()
	print("callAudioIsRecording=====")

	return sdkCallFunc("audioIsRecording", "", 0, 0, "") == 1
end

function callWebcamTakePhoto(slot0, slot1)
	if CAN_USE_CAMERA == true then
		if IS_IOS_PLATFORM == true then
			sdkCallFunc("webcam", slot0 or PathTool.getPhotoPath(), 3, 0, slot1 or "photo.jpg")
		elseif callFunc("checkcamera") == "true" then
			sdkCallFunc("webcam", slot0, 3, 0, slot1)
		else
			message(TI18N("未获取相机权限"))
		end
	elseif IS_IOS_PLATFORM == true then
		message(TI18N("该功能需最新版本安装包才可使用，请耐心等待。"))
	else
		message(TI18N("请下载最新的安装包进行游戏体验，非常抱歉给你带来不好的游戏体验。"))
	end
end

function callWebcamOpenPhotoGallery(slot0, slot1)
	if CAN_USE_CAMERA == true then
		if IS_IOS_PLATFORM == true then
			sdkCallFunc("webcam", slot0 or PathTool.getPhotoPath(), 4, 0, slot1 or "photo.jpg")
		elseif callFunc("checkcamera") == "true" then
			sdkCallFunc("webcam", slot0, 4, 0, slot1)
		else
			message(TI18N("未获取相机权限"))
		end
	elseif IS_IOS_PLATFORM == true then
		message(TI18N("该功能需最新版本安装包才可使用，请耐心等待。"))
	else
		message(TI18N("请下载最新的安装包进行游戏体验，非常抱歉给你带来不好的游戏体验。"))
	end
end

function saveImageToPhoto(slot0, slot1)
	sdkCallFunc("savePhoto", slot0, slot1)
end

function callBackWebcam(slot0, slot1)
	print("callBackWebcam======", slot0, slot1)

	if slot0 ~= 0 then
		message(slot1)
	else
		MainuiController:getInstance():updateCustomHeadImg(slot1)
	end
end

function OnPhotoReceive(slot0, slot1)
	print(slot0, slot1)

	if slot0 == 1 then
		MainuiController:getInstance():updateCustomHeadImg(msg)
	end
end

function cosDownloadImageCallback(slot0, slot1)
end

function cosUploadImageCallback(slot0, slot1)
	if slot0 == 0 then
		if PLATFORM_NAME == "release2" then
			CommonAlert.show(string.format("头像上传失败：%s", slot1), TI18N("确定"))
		else
			message(TI18N("上传图片失败"))
		end
	else
		RoleController:getInstance():tellServerCustomSuccess()
	end
end

function callIDFA()
	return callFunc("idfa")
end

function getBindPhone()
	return callFunc("getBindPhone")
end

function bindPhone(slot0, slot1, slot2)
	if slot0 == nil or slot0 == "" then
		return
	end

	__bind_phone_back_func = slot2

	callFunc("bindPhone", slot0, 0, 0, slot1)
end

function bindPhoneBack(slot0, slot1)
	if __bind_phone_back_func then
		__bind_phone_back_func(slot0, slot1)

		__bind_phone_back_func = nil
	end
end

function showRealNameWindow()
	callFunc("realNameVerify")
end

function queryRealNameInfo()
	return callFunc("queryRealName")
end

function sdkBackRealName(slot0, slot1)
	if slot0 <= 0 then
		slot0 = 0
		DO_NOT_REALNAME_STATUS = true
	else
		DO_NOT_REALNAME_STATUS = false
		OPEN_SDK_VISITIOR_WINDOW = false
		NEED_OPEN_OPEN_SDK_VISITIOR_WINDOW = false
	end

	RoleController:getInstance():sender10395(slot0)
end

function wxShareText(slot0, slot1)
	callFunc("wx_share_text", slot0, slot1 or 1)
end

function wxSharePhoto(slot0, slot1, slot2, slot3, slot4, slot5)
	callFunc("wx_share_photo", table.concat({
		slot0,
		slot1,
		slot2,
		slot3 or slot2
	}, "#"), slot4 or 1, slot5 or 200)
end

function wxShareUrl(slot0, slot1, slot2, slot3, slot4, slot5)
	callFunc("wx_share_url", table.concat({
		slot0,
		slot1,
		slot2,
		slot3
	}, "#"), slot4 or 1, slot5 or 200)
end

function wxShareBack(slot0, slot1)
	game_print("wxShareBack===>", slot0, slot1)
	message(slot1)

	if slot0 == 0 then
		PartnersummonController:getInstance():send23203()
	end
end

function callFunc(slot0, slot1, slot2, slot3, slot4)
	if not cc.GameDevice.callFunc then
		return ""
	end

	if slot0 == nil or slot0 == "" then
		return ""
	end

	return cc.GameDevice:callFunc(slot0, slot1 or "", slot2 or 0, slot3 or 0, slot4 or "")
end
