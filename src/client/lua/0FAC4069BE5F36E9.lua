PathTool = PathTool or {}
PathTool.DEFAULT_IMAGE = "resource/common/common_miss_image.png"
slot0 = string.format
slot1 = cc.SpriteFrameCache:getInstance()
_file_exist_list = _file_exist_list or {}

function PathTool.isFileExist(slot0)
	if type(slot0) ~= "string" then
		return false
	end

	slot1 = nil

	if _file_exist_list[slot0] ~= nil then
		slot1 = _file_exist_list[slot0]
	else
		_file_exist_list[slot0] = cc.FileUtils:getInstance():isFileExist(slot0)
	end

	if IS_REQUIRE_RES_GY == true and not MAKELIFEBETTER and string.find(slot0, ".atlas") ~= nil then
		if slot1 then
			if _file_exist_list[string.gsub(slot0, ".atlas", ".png")] ~= nil then
				slot1 = _file_exist_list[slot0]
			else
				_file_exist_list[slot0] = ResourcesLoadMgr:getInstance():checkDirFull(slot0)
			end
		end

		if not slot1 then
			ResourcesLoadMgr:getInstance():checkResouces(slot0, true)
		end
	end

	return slot1
end

function PathTool.checkRes(slot0)
	if PathTool.isFileExist(slot0) then
		return slot0
	else
		if not MAKELIFEBETTER and (string.find(slot0, ".png") ~= nil or string.find(slot0, ".jpg") ~= nil and IS_REQUIRE_RES_GY == true) then
			print(uv0("============> 警告：资源 %s 不存在，尝试去cdn上下载", slot0))
			ResourcesLoadMgr:getInstance():checkResouces(slot0, true)
		end

		return PathTool.DEFAULT_IMAGE
	end
end

function PathTool.getSelectBg()
	return PathTool.getResFrame("common", "common_90019")
end

function PathTool.getNormalSkillBg()
	return PathTool.getResFrame("common", "common_1005")
end

function PathTool.getNormalCell()
	return PathTool.getResFrame("common", "common_1005")
end

PathTool.AttrIcon = {
	crit_ratio = "common_90039",
	def = "common_90023",
	dodge_magic = "common_90037",
	hp_max_per = "common_90022",
	hp_max = "common_90022",
	crit_rate = "common_90043",
	be_cure = "common_90021_6",
	dam = "common_90021_7",
	dodge_rate = "common_90021_4",
	hit_rate = "common_90021_2",
	skill = "common_90021_9",
	atk = "common_90021",
	def_per = "common_90023",
	res_s = "common_90021_3",
	hit_magic = "common_90040",
	tenacity = "common_90021_1",
	random = "common_90021_8",
	dam_s = "common_90021",
	atk_per = "common_90021",
	dam_p = "common_90021",
	res_p = "common_90021_3",
	speed = "common_90038",
	res = "common_90021_3",
	hp = "common_90022",
	cure = "common_90021_5"
}

function PathTool.getAttrIconByStr(slot0)
	if PathTool.AttrIcon[slot0] then
		return PathTool.AttrIcon[slot0]
	end

	return "common_90037"
end

function PathTool.getCheckBoxRes()
	return PathTool.getResFrame("common", "common_1044"), PathTool.getResFrame("common", "common_1043")
end

function PathTool.getCheckBoxRes_2()
	return PathTool.getResFrame("mainui", "mainui_caht_box"), PathTool.getResFrame("mainui", "mainui_caht_box_s")
end

function PathTool.getCareerIcon(slot0)
	return PathTool.getResFrame("common", uv0("common_%s", 90045 + (slot0 or 1)))
end

function PathTool.getQualityBg(slot0)
	if (slot0 or 1) > 5 then
		slot1 = 5
	end

	return PathTool.getResFrame("common", "common_" .. 1005 + slot1)
end

function PathTool.getRoundQualityBg(slot0)
	if (slot0 or 1) > 5 then
		slot1 = 5
	end

	return PathTool.getResFrame("mainui", "mainui_" .. 2000 + slot1)
end

function PathTool.getBarQualityBg(slot0)
	if (slot0 or 0) == BackPackConst.quality.red then
		return PathTool.getResFrame("common", "common_90006_5")
	elseif slot1 == BackPackConst.quality.green then
		return PathTool.getResFrame("common", "common_90006")
	elseif slot1 == BackPackConst.quality.blue then
		return PathTool.getResFrame("common", "common_90006_2")
	elseif slot1 == BackPackConst.quality.purple then
		return PathTool.getResFrame("common", "common_90006_3")
	elseif slot1 == BackPackConst.quality.orange then
		return PathTool.getResFrame("common", "common_90006_4")
	else
		return PathTool.getResFrame("common", "common_90006_1")
	end
end

function PathTool.getEnchantQualityIcon(slot0)
	if slot0 == nil then
		slot0 = 1
	elseif slot0 > 5 then
		slot0 = 5
	end

	return PathTool.getResFrame("common", "common_9006" .. slot0)
end

function PathTool.getLogoRes()
	return "resource/login/app/txt_cn_logo.png"
end

function PathTool.useMainLogo()
	if FINAL_CHANNEL == "syios_symphony" then
		return true
	end

	return false
end

function PathTool.getLoadingRes()
	slot0 = string.format("resource/login/%s/first_loading_bg.jpg", PLATFORM_PNG)

	if isVestPackage() == true then
		slot0 = ROOT_DIR .. "loading_bg_sy.jpg"
	elseif PathTool.is9377Platform() then
		slot0 = "resource/login/9377/loading_bg.jpg"
	elseif PathTool.checkSpecialChannel() == true then
		slot0 = "resource/login/app/first_loading_bg.jpg"
	end

	return slot0
end

function PathTool.is9377Platform()
	return false
end

function PathTool.checkSpecialChannel()
	if IS_NOT_USE_SY_LOGIN == true then
		return false
	elseif not IS_IOS_PLATFORM then
		if FINAL_CHANNEL == "bingniaoysjx" or FINAL_CHANNEL == "9377mtzx" then
			return false
		elseif PLATFORM_NAME == "9377" or PLATFORM_NAME == "icebird" or PLATFORM_NAME == "bingniao" then
			return true
		elseif FINAL_CHANNEL and type(FINAL_CHANNEL) == "string" then
			if FINAL_CHANNEL == "tanwan" then
				return true
			elseif string.find(FINAL_CHANNEL, "9377") ~= nil then
				return true
			elseif string.find(FINAL_CHANNEL, "bingniao") ~= nil then
				return true
			end
		end
	elseif MAKELIFEBETTER == true then
		return false
	elseif FINAL_CHANNEL == "syios_symphony" then
		return true
	elseif FINAL_CHANNEL == "syios_fzyz" or FINAL_CHANNEL == "syios_djsdmm" or FINAL_CHANNEL == "syios_gmzhs" or FINAL_CHANNEL == "ssgc_D1" or FINAL_CHANNEL == "9377_wiseInfo" then
		return true
	elseif PLATFORM_NAME == "9377ios" then
		return true
	end

	return false
end

function PathTool.getLoginRes()
	slot0 = string.format("resource/login/%s/loading_bg.jpg", PLATFORM_PNG)

	if isVestPackage() == true then
		slot0 = ROOT_DIR .. "loading_bg1_sy.jpg"
	elseif PathTool.is9377Platform() then
		slot0 = "resource/login/9377/loading_bg.jpg"
	elseif PathTool.checkSpecialChannel() == true then
		slot0 = "resource/login/app/loading_bg.jpg"
	end

	return slot0
end

function PathTool.getFlashRes()
	slot0 = string.format("resource/login/%s/flash.jpg", PLATFORM_PNG)

	if isVestPackage() == true then
		slot0 = ROOT_DIR .. "flash.jpg"
	end

	if PathTool.isFileExist(slot0) == false then
		slot0 = "resource/login/app/flash.jpg"
	end

	return slot0
end

function PathTool.getWechatSubRes()
	if WECHAT_SUBSCRIPTION_IMG == nil then
		WECHAT_SUBSCRIPTION_IMG = "wechat_subscription_sszg"
	end

	return string.format("resource/platform/%s.png", WECHAT_SUBSCRIPTION_IMG)
end

function PathTool.getPartnerTypeIcon(slot0)
	return PathTool.getResFrame("common", "common_900" .. 45 + (slot0 or 1))
end

function PathTool.getHeroCampTypeIcon(slot0)
	if (slot0 or 1) == HeroConst.CampType.eWater then
		return PathTool.getResFrame("common", "common_90067")
	elseif slot0 == HeroConst.CampType.eFire then
		return PathTool.getResFrame("common", "common_90068")
	elseif slot0 == HeroConst.CampType.eWind then
		return PathTool.getResFrame("common", "common_90069")
	elseif slot0 == HeroConst.CampType.eLight then
		return PathTool.getResFrame("common", "common_90070")
	elseif slot0 == HeroConst.CampType.eLingtDark then
		return PathTool.getResFrame("common", "common_90079")
	elseif slot0 == HeroConst.CampType.eLegend then
		return PathTool.getResFrame("common", "common_900072")
	else
		return PathTool.getResFrame("common", "common_90071")
	end
end

function PathTool.getCampGroupIcon(slot0)
	if slot0 == 0 then
		slot0 = 1000
	end

	return PathTool.checkRes(uv0("resource/campicon/campicon_%s.png", slot0))
end

function PathTool.getItemRes(slot0, slot1)
	return PathTool.checkRes(uv0("resource/item/%s.png", slot0))
end

function PathTool.getRedGoldRes(slot0)
	return PathTool.getItemRes(slot0)
end

function PathTool.getPromptRes(slot0)
	return PathTool.checkRes(uv0("resource/prompt/prompt_%s.png", slot0))
end

function PathTool.getPreviewBg(slot0)
	return PathTool.checkRes(uv0("scene/preview/%s.jpg", slot0))
end

function PathTool.getGuildLevIcon(slot0, slot1)
	return PathTool.checkRes(uv0("resource/guild/icon/guild_lev_%s.png", slot0))
end

function PathTool.getTalkNpcImg(slot0)
	return PathTool.checkRes(uv0("resource/talknpc/talknpc_%s.png", slot0))
end

function PathTool.getEffectRes(slot0)
	return Config.EffectData.data_effect_info[slot0] or "E88888"
end

function PathTool.getActionRes(slot0, slot1)
	if slot1 then
		return PathTool.checkRes(uv0("resource/action/%s.jpg", slot0))
	else
		return PathTool.checkRes(uv0("resource/action/%s.png", slot0))
	end
end

function PathTool.getActionTopBannerRes(slot0, slot1)
	if slot1 then
		return PathTool.checkRes(uv0("resource/action/top_banner/%s.jpg", slot0))
	else
		return PathTool.checkRes(uv0("resource/action/top_banner/%s.png", slot0))
	end
end

function PathTool.getActionZeroGiftRes(slot0, slot1)
	if slot1 then
		return PathTool.checkRes(uv0("resource/action_zero_gift/zero_gift/%s.jpg", slot0))
	else
		return PathTool.checkRes(uv0("resource/action_zero_gift/zero_gift/%s.png", slot0))
	end
end

function PathTool.getPartnerIconRes(slot0, slot1)
	if slot1 then
		return PathTool.checkRes(uv0("resource/partner_icon/%s.jpg", slot0))
	else
		return PathTool.checkRes(uv0("resource/partner_icon/%s.png", slot0))
	end
end

function PathTool.getEliteIconRes(slot0)
	return PathTool.checkRes(uv0("resource/elitematch/elitematch_icon/%s.png", slot0))
end

function PathTool.getEmptyMark()
	return PathTool.checkRes(uv0("resource/bigbg/bigbg_3.png"))
end

function PathTool.getFunctionRes(slot0)
	return PathTool.checkRes(uv0("resource/functionicon/%s.png", slot0))
end

function PathTool.getWorldMapRes(slot0)
	return PathTool.checkRes(uv0("resource/worldmap/worldmap_mainland_%s.png", slot0))
end

function PathTool.getHeadIcon(slot0)
	if slot0 == nil or slot0 == 0 or slot0 == 30000 then
		slot0 = 1001
	end

	return PathTool.checkRes(uv0("resource/headicon/%s.png", slot0))
end

function PathTool.getHeadIconJpg(slot0)
	if slot0 == nil or slot0 == 0 or slot0 == 30000 then
		slot0 = 1001
	end

	return PathTool.checkRes(uv0("resource/headicon/%s.jpg", slot0))
end

function PathTool.getElfinHeadIcon(slot0)
	if slot0 == nil or slot0 == 0 then
		slot0 = 113001
	end

	return PathTool.checkRes(uv0("resource/elfin/elfinicon/%s.png", slot0))
end

function PathTool.getHeadcircle(slot0)
	return PathTool.checkRes(uv0("resource/headcircle/txt_cn_headcircle_%s.png", slot0 or 0))
end

function PathTool.getSkillRes(slot0)
	return PathTool.checkRes(uv0("resource/skillicon/%s.png", slot0 or 20003))
end

function PathTool.getPokedexRes(slot0, slot1)
	return PathTool.checkRes(uv0("resource/partnerpaint/%s/partnerpaint_%s.png", slot1 or 0, slot0 or 30009))
end

function PathTool.getSuitRes(slot0)
	return PathTool.checkRes(uv0("resource/hero/holy_eqm_icon/%s_icon.png", slot0))
end

function PathTool.getBuffRes(slot0, slot1)
	return PathTool.checkRes(uv0("resource/bufficon/%s.png", slot0))
end

function PathTool.getBigBuffRes(slot0)
	return PathTool.checkRes(uv0("resource/bigbufficon/%s.png", slot0))
end

function PathTool.getShaderRes(slot0)
	if PathTool.isFileExist(uv0("shaders/%s.fsh", slot0)) == false then
		slot1 = ""
	end

	return slot1
end

function PathTool.getBattleSceneRes(slot0, slot1)
	if slot1 == true then
		return uv0("resource/bigbg/battle_bg/%s.jpg", slot0)
	else
		return uv0("resource/bigbg/battle_bg/%s.png", slot0)
	end
end

function PathTool.getBattleDramaIconRes(slot0)
	return PathTool.checkRes(uv0("resource/battle/icon/%s.png", slot0))
end

function PathTool.getSevenLoginRes(slot0, slot1)
	if slot1 then
		return PathTool.checkRes(uv0("resource/action/seven_login/%s.jpg", slot0))
	else
		return PathTool.checkRes(uv0("resource/action/seven_login/%s.png", slot0))
	end
end

function PathTool.getActionTreasureHeroRes(slot0, slot1)
	if slot1 then
		return PathTool.checkRes(uv0("resource/actiontreasure/hero/%s.jpg", slot0))
	else
		return PathTool.checkRes(uv0("resource/actiontreasure/hero/%s.png", slot0))
	end
end

function PathTool.getActionTreasureTopIconRes(slot0, slot1)
	if slot1 then
		return PathTool.checkRes(uv0("resource/actiontreasure/top_banner/%s.jpg", slot0))
	else
		return PathTool.checkRes(uv0("resource/actiontreasure/top_banner/%s.png", slot0))
	end
end

function PathTool.getArtifactItemRes(slot0, slot1)
	return PathTool.checkRes(uv0("resource/artifacticon/%s.png", slot0))
end

function PathTool.getTargetRes(slot0, slot1, slot2, slot3)
	if slot2 and true then
		return uv0("resource/%s/%s.plist", slot0, slot1), PathTool.checkRes(uv0("resource/%s/%s.png", slot0, slot1))
	elseif slot3 then
		return PathTool.checkRes(uv0("resource/%s/%s.jpg", slot0, slot1))
	else
		return PathTool.checkRes(uv0("resource/%s/%s.png", slot0, slot1))
	end
end

function PathTool.getHorcruxRes(slot0)
	return PathTool.checkRes(uv0("resource/horcrux/%s.png", slot0 or 0))
end

function PathTool.getPlistImgForDownLoad(slot0, slot1, slot2)
	if slot2 == true then
		return uv0("resource/%s/%s.jpg", slot0, slot1)
	else
		return uv0("resource/%s/%s.png", slot0, slot1)
	end
end

function PathTool.getUiRes(slot0, slot1)
	if slot1 == true then
		return PathTool.checkRes(uv0("resource/ui/%s.jpg", slot0))
	else
		return PathTool.checkRes(uv0("resource/ui/%s.png", slot0))
	end
end

function PathTool.getTargetCSB(slot0)
	return PathTool.checkRes(uv0("SI4YKjtXKGfkpPZhfeZcJEE6b4gGZbox/%s.csb", slot0))
end

function PathTool.getTargetPng(slot0, slot1)
	return PathTool.checkRes(uv0("resource/%s/%s.png", slot0, slot1))
end

function PathTool.abc()
	if not cc.SpriteFrameCache:getInstance():getSpriteFrame("common_99999") then
		cc.SpriteFrameCache:getInstance():addSpriteFrames("resource/common/common.plist")
	end
end

function PathTool.getResFrame(slot0, slot1, slot2, slot3, slot4)
	function slot5(slot0, slot1)
		if not cc.SpriteFrameCache:getInstance():getSpriteFrame(uv0) then
			uv0 = uv1("%s.png", "common_99999")
		end

		if uv2 then
			uv2(uv0)
		end
	end

	if not cc.SpriteFrameCache:getInstance():getSpriteFrame((slot2 ~= true or string.format("%s.jpg", slot1)) and string.format("%s.png", string.format("%s.jpg", slot1))) then
		slot7, slot8 = PathTool.getTargetRes(slot0, slot3 or slot0, true)

		if display.isSpriteFramesWithFileLoaded(slot7) then
			return uv0("%s.png", "common_99999")
		else
			display.loadSpriteFrames(slot7, slot8, slot5)

			return uv0("%s.png", "common_99999")
		end
	else
		return slot1
	end
end

function PathTool.getMapRes(slot0, slot1)
	slot2 = ".png"

	if slot1 then
		slot2 = ".jpg"
	end

	return PathTool.checkRes(uv0("scene/preview/%s%s", slot0, slot2))
end

function PathTool.getLittleMapRes(slot0, slot1)
	slot2 = ".png"

	if slot1 then
		slot2 = ".jpg"
	end

	return PathTool.checkRes(uv0("scene/map/%s%s", slot0, slot2))
end

function PathTool.getSound(slot0, slot1)
	slot2 = uv0("sound/%s/%s.mp3", "scene", "s_001")

	if slot0 == AudioManager.AUDIO_TYPE.COMMON then
		slot2 = uv0("sound/%s/%s.mp3", slot0, slot1)
	elseif slot0 == AudioManager.AUDIO_TYPE.SCENE then
		slot2 = uv0("sound/%s/%s.mp3", slot0, slot1)
	elseif slot0 == AudioManager.AUDIO_TYPE.BATTLE then
		slot2 = uv0("sound/%s/%s.mp3", slot0, slot1)
	elseif slot0 == AudioManager.AUDIO_TYPE.DUBBING then
		slot2 = uv0("sound/%s/%s.mp3", slot0, slot1)
	elseif slot0 == AudioManager.AUDIO_TYPE.Recruit then
		slot2 = uv0("sound/%s/%s.mp3", slot0, slot1)
	elseif slot0 == AudioManager.AUDIO_TYPE.Drama then
		slot2 = uv0("sound/%s/%s.mp3", slot0, slot1)
	end

	return slot2
end

function PathTool.checkSound(slot0)
	return cc.FileUtils:getInstance():isFileExist(PathTool.getVoicePath(slot0))
end

function PathTool.getVoicePath(slot0)
	if not cc.FileUtils:getInstance():isDirectoryExist(uv0("%svoice", cc.FileUtils:getInstance():getWritablePath())) then
		cc.FileUtils:getInstance():createDirectory(slot1)
	end

	return uv0("%svoice/%s", cc.FileUtils:getInstance():getWritablePath(), slot0)
end

function PathTool.getVerificationcodePath(slot0)
	if not cc.FileUtils:getInstance():isDirectoryExist(uv0("%sverificationcode", cc.FileUtils:getInstance():getWritablePath())) then
		cc.FileUtils:getInstance():createDirectory(slot1)
	end

	return uv0("%sverificationcode/%s.png", cc.FileUtils:getInstance():getWritablePath(), slot0)
end

SpineTypeByFristLetter = {
	E = "ele",
	W = "role",
	H = "hero",
	R = "role",
	N = "mon",
	S = "hero",
	M = "mon"
}

function WriteSpine(slot0, slot1)
	slot3 = assert(io.open(cc.FileUtils:getInstance():getWritablePath() .. "/spine.txt", "a"))

	slot3:write(slot0 .. "---------action_name" .. slot1)
	slot3:close()
end

function PathTool.getSpineByName(slot0, slot1)
	WriteSpine(slot0, slot1 or "空")

	slot2 = ""
	slot2 = (slot1 ~= nil or uv0("v9o8qm1Y40cbOAlh6LDp0kMDi5CzXlsO/%s/action", slot0)) and uv0("v9o8qm1Y40cbOAlh6LDp0kMDi5CzXlsO/%s/%s", slot0, slot1)
	slot3 = uv0("%s.skel", slot2)
	slot5 = uv0("%s.png", slot2)

	if not PathTool.isFileExist(uv0("%s.atlas", slot2)) then
		print(slot2 .. "    不存在")

		if not force then
			slot3, slot4, slot5, slot2, slot0 = PathTool.defaultSpine(slot0, slot1, true)
		end
	end

	return slot3, slot4, slot5, slot2, slot0
end

function PathTool.defaultSpine(slot0, slot1)
	slot2 = "E88888"

	if slot0 ~= nil and string.sub(slot0, 1, 1) == "H" then
		slot2 = "H99999"
	end

	slot3 = ""
	slot3 = (slot1 ~= nil or uv0("v9o8qm1Y40cbOAlh6LDp0kMDi5CzXlsO/%s/action", slot2)) and uv0("v9o8qm1Y40cbOAlh6LDp0kMDi5CzXlsO/%s/%s", slot2, slot1)

	return uv0("%s.skel", slot3), uv0("%s.atlas", slot3), uv0("%s.png", slot3), slot3, slot2
end

function PathTool.specialBSModel(slot0)
	return slot0 == 37300 or slot0 == 37301 or slot0 == 37302
end

function PathTool.checkResourcesExist(slot0)
	if _file_exist_list[slot0] then
		return true
	elseif cc.FileUtils:getInstance():isFileExist(slot0) then
		_file_exist_list[slot0] = true

		return true
	else
		return false
	end
end

function PathTool.downloadResources(slot0, slot1)
	if slot0 == nil or slot0.path == nil or MAKELIFEBETTER == true then
		slot1(slot0)

		return
	end

	if _file_exist_list[path] == true then
		if slot1 ~= nil then
			slot1(slot0)
		end
	else
		ResourcesLoadMgr:getInstance():checkResouces(slot0.path, true, slot1, slot0)
	end
end

function PathTool.getWelfareBannerRes(slot0, slot1)
	if slot1 then
		return PathTool.checkRes(uv0("resource/welfare/welfare_banner/%s.jpg", slot0))
	else
		return PathTool.checkRes(uv0("resource/welfare/welfare_banner/%s.png", slot0))
	end
end

function PathTool.getReturnWelfareBannerRes(slot0)
	return uv0("resource/welfare/welfare_return/%s.png", slot0)
end

function PathTool.getPartnerBustRes(slot0)
	return uv0("resource/partner/%d.png", tonumber(slot0 or 10000))
end

function PathTool.getPartnerBustRes_2(slot0)
	return uv0("resource/partnerbust/%d.png", tonumber(slot0 or 10090))
end

function PathTool.getStrongerIconRes(slot0)
	return PathTool.checkRes(uv0("resource/strongericon/stronger_%d.png", tonumber(slot0 or 1001)))
end

function PathTool.getHeavenCustomsIconRes(slot0)
	return uv0("resource/heavencustoms/heavencustoms_%d.png", tonumber(slot0 or 1))
end

function PathTool.getReturnActionRes(slot0, slot1)
	if slot1 then
		return PathTool.checkRes(uv0("resource/bigbg/returnaction/%s.jpg", slot0))
	else
		return PathTool.checkRes(uv0("resource/bigbg/returnaction/%s.png", slot0))
	end
end

function PathTool.getHomeBuildRes(slot0, slot1)
	return uv0("resource/homeworld/background/%d/%s.png", slot0 or 1, slot1 or "build_1")
end

function PathTool.getFurnitureSceneRes(slot0)
	if not slot0 or slot0 == "" then
		return
	end

	return uv0("resource/homeworld/unit/%s.png", slot0)
end

function PathTool.getFurnitureNormalRes(slot0)
	if not slot0 or slot0 == "" then
		return
	end

	return PathTool.checkRes(uv0("resource/homeworld/furniture/%s.png", slot0))
end

function PathTool.getFigureIconRes(slot0)
	if not slot0 or slot0 == "" then
		return
	end

	return uv0("resource/homeworld/figureicon/%s.png", slot0)
end

function PathTool.getSuitIconRes(slot0)
	if not slot0 or slot0 == "" then
		return
	end

	return uv0("resource/homeworld/cover/%s.png", slot0)
end

function PathTool.getElfinEggRes(slot0)
	return uv0("resource/elfin/eggicon/eggicon_%d.png", slot0 or 1)
end

function PathTool.getElfinTreeBgRes(slot0)
	return uv0("resource/elfin/elfin_tree_bg/elfin_tree_bg_%d.png", slot0 or 1)
end

function PathTool.getHeadPath(slot0)
	return string.format("%sassets/src/photo/%s.jpg", cc.FileUtils:getInstance():getWritablePath(), slot0)
end

function PathTool.getHeadSavePath(slot0)
	return string.format("photo/%s.jpg", slot0)
end

function PathTool.getPhotoPath()
	if not cc.FileUtils:getInstance():isDirectoryExist(string.format("%sassets/src/photo/", cc.FileUtils:getInstance():getWritablePath())) then
		cc.FileUtils:getInstance():createDirectory(slot0)
	end

	return slot0
end
