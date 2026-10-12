slot0 = {
	DEFAULT_FPS = 60
}

if not cc.Director:getInstance():getOpenGLView() then
	slot3 = 720
	slot4 = 1280

	if CC_DESIGN_RESOLUTION then
		if CC_DESIGN_RESOLUTION.width then
			slot3 = CC_DESIGN_RESOLUTION.width
		end

		if CC_DESIGN_RESOLUTION.height then
			slot4 = CC_DESIGN_RESOLUTION.height
		end
	end

	slot1:setOpenGLView(cc.GLViewImpl:createWithRect("Sy_Mhfx", cc.rect(0, 0, slot3, slot4)))
end

slot1:setDisplayStats(CC_SHOW_FPS)
slot1:setProjection(cc.DIRECTOR_PROJECTION2_D)
slot1:setDepthTest(false)
slot1:setAnimationInterval(1 / slot0.DEFAULT_FPS)
cc.Device:setKeepScreenOn(true)

slot3 = slot2:getFrameSize()
slot4 = slot1:getTextureCache()
slot5 = cc.SpriteFrameCache:getInstance()
slot6 = cc.AnimationCache:getInstance()

function slot7(slot0)
	slot0.width = checknumber(slot0.width)
	slot0.height = checknumber(slot0.height)
	slot0.autoscale = string.upper(slot0.autoscale)

	assert(slot0.width > 0 and slot0.height > 0, string.format("display - invalid design resolution size %d, %d", slot0.width, slot0.height))
end

function slot8(slot0, slot1)
	if slot0.autoscale == "FILL_ALL" then
		uv0:setDesignResolutionSize(slot1.width, slot1.height, cc.ResolutionPolicy.FILL_ALL)
	else
		slot2 = slot1.width / slot0.width
		slot3 = slot1.height / slot0.height
		slot4 = slot1.width
		slot5 = slot1.height

		if slot0.autoscale == "FIXED_WIDTH" then
			uv0:setDesignResolutionSize(slot1.width / slot2, slot1.height / slot2, cc.ResolutionPolicy.NO_BORDER)
		elseif slot0.autoscale == "FIXED_HEIGHT" then
			uv0:setDesignResolutionSize(slot1.width / slot3, slot1.height / slot3, cc.ResolutionPolicy.NO_BORDER)
		elseif slot0.autoscale == "EXACT_FIT" then
			uv0:setDesignResolutionSize(slot0.width, slot0.height, cc.ResolutionPolicy.EXACT_FIT)
		elseif slot0.autoscale == "NO_BORDER" then
			uv0:setDesignResolutionSize(slot0.width, slot0.height, cc.ResolutionPolicy.NO_BORDER)
		elseif slot0.autoscale == "SHOW_ALL" then
			uv0:setDesignResolutionSize(slot0.width, slot0.height, cc.ResolutionPolicy.SHOW_ALL)
		else
			printError(string.format("display - invalid r.autoscale \"%s\"", slot0.autoscale))
		end
	end
end

function slot9()
	slot0 = uv0:getFrameSize()
	uv1.sizeInPixels = {
		width = slot0.width,
		height = slot0.height
	}
	slot1 = uv2:getWinSize()
	uv1.contentScaleFactor = uv2:getContentScaleFactor()
	uv1.size = {
		width = slot1.width,
		height = slot1.height
	}
	uv1.width = uv1.size.width
	uv1.height = uv1.size.height
	uv1.cx = uv1.width / 2
	uv1.cy = uv1.height / 2
	uv1.c_left = -uv1.width / 2
	uv1.c_right = uv1.width / 2
	uv1.c_top = uv1.height / 2
	uv1.c_bottom = -uv1.height / 2
	uv1.left = 0
	uv1.right = uv1.width
	uv1.top = uv1.height
	uv1.bottom = 0
	uv1.center = cc.p(uv1.cx, uv1.cy)
	uv1.left_top = cc.p(uv1.left, uv1.top)
	uv1.left_bottom = cc.p(uv1.left, uv1.bottom)
	uv1.left_center = cc.p(uv1.left, uv1.cy)
	uv1.right_top = cc.p(uv1.right, uv1.top)
	uv1.right_bottom = cc.p(uv1.right, uv1.bottom)
	uv1.right_center = cc.p(uv1.right, uv1.cy)
	uv1.top_center = cc.p(uv1.cx, uv1.top)
	uv1.top_bottom = cc.p(uv1.cx, uv1.bottom)

	printInfo(string.format("# display.sizeInPixels         = {width = %0.2f, height = %0.2f}", uv1.sizeInPixels.width, uv1.sizeInPixels.height))
	printInfo(string.format("# display.size                 = {width = %0.2f, height = %0.2f}", uv1.size.width, uv1.size.height))
	printInfo(string.format("# display.contentScaleFactor   = %0.2f", uv1.contentScaleFactor))
	printInfo(string.format("# display.width                = %0.2f", uv1.width))
	printInfo(string.format("# display.height               = %0.2f", uv1.height))
	printInfo(string.format("# display.cx                   = %0.2f", uv1.cx))
	printInfo(string.format("# display.cy                   = %0.2f", uv1.cy))
	printInfo(string.format("# display.left                 = %0.2f", uv1.left))
	printInfo(string.format("# display.right                = %0.2f", uv1.right))
	printInfo(string.format("# display.top                  = %0.2f", uv1.top))
	printInfo(string.format("# display.bottom               = %0.2f", uv1.bottom))
	printInfo(string.format("# display.c_left               = %0.2f", uv1.c_left))
	printInfo(string.format("# display.c_right              = %0.2f", uv1.c_right))
	printInfo(string.format("# display.c_top                = %0.2f", uv1.c_top))
	printInfo(string.format("# display.c_bottom             = %0.2f", uv1.c_bottom))
	printInfo(string.format("# display.center               = {x = %0.2f, y = %0.2f}", uv1.center.x, uv1.center.y))
	printInfo(string.format("# display.left_top             = {x = %0.2f, y = %0.2f}", uv1.left_top.x, uv1.left_top.y))
	printInfo(string.format("# display.left_bottom          = {x = %0.2f, y = %0.2f}", uv1.left_bottom.x, uv1.left_bottom.y))
	printInfo(string.format("# display.left_center          = {x = %0.2f, y = %0.2f}", uv1.left_center.x, uv1.left_center.y))
	printInfo(string.format("# display.right_top            = {x = %0.2f, y = %0.2f}", uv1.right_top.x, uv1.right_top.y))
	printInfo(string.format("# display.right_bottom         = {x = %0.2f, y = %0.2f}", uv1.right_bottom.x, uv1.right_bottom.y))
	printInfo(string.format("# display.right_center         = {x = %0.2f, y = %0.2f}", uv1.right_center.x, uv1.right_center.y))
	printInfo(string.format("# display.top_center           = {x = %0.2f, y = %0.2f}", uv1.top_center.x, uv1.top_center.y))
	printInfo(string.format("# display.top_bottom           = {x = %0.2f, y = %0.2f}", uv1.top_bottom.x, uv1.top_bottom.y))
	printInfo("#")
end

function slot0.setAutoScale(slot0)
	if type(slot0) ~= "table" then
		return
	end

	uv0(slot0)

	if type(slot0.callback) == "function" then
		for slot5, slot6 in pairs(slot0.callback(uv1) or {}) do
			slot0[slot5] = slot6
		end

		uv0(slot0)
	end

	uv2(slot0, uv1)
	printInfo(string.format("# design resolution size       = {width = %0.2f, height = %0.2f}", slot0.width, slot0.height))
	printInfo(string.format("# design resolution autoscale  = %s", slot0.autoscale))
	uv3()
end

if type(CC_DESIGN_RESOLUTION) == "table" then
	slot0.setAutoScale(CC_DESIGN_RESOLUTION)
end

slot0.COLOR_WHITE = cc.c3b(255, 255, 255)
slot0.COLOR_BLACK = cc.c3b(0, 0, 0)
slot0.COLOR_RED = cc.c3b(255, 0, 0)
slot0.COLOR_GREEN = cc.c3b(0, 255, 0)
slot0.COLOR_BLUE = cc.c3b(0, 0, 255)
slot0.AUTO_SIZE = 0
slot0.FIXED_SIZE = 1
slot0.LEFT_TO_RIGHT = 0
slot0.RIGHT_TO_LEFT = 1
slot0.TOP_TO_BOTTOM = 2
slot0.BOTTOM_TO_TOP = 3
slot0.CENTER = cc.p(0.5, 0.5)
slot0.LEFT_TOP = cc.p(0, 1)
slot0.LEFT_BOTTOM = cc.p(0, 0)
slot0.LEFT_CENTER = cc.p(0, 0.5)
slot0.RIGHT_TOP = cc.p(1, 1)
slot0.RIGHT_BOTTOM = cc.p(1, 0)
slot0.RIGHT_CENTER = cc.p(1, 0.5)
slot0.CENTER_TOP = cc.p(0.5, 1)
slot0.CENTER_BOTTOM = cc.p(0.5, 0)
slot0.SCENE_TRANSITIONS = {
	CROSSFADE = {
		cc.TransitionCrossFade
	},
	FADE = {
		cc.TransitionFade,
		cc.c3b(0, 0, 0)
	},
	FADEBL = {
		cc.TransitionFadeBL
	},
	FADEDOWN = {
		cc.TransitionFadeDown
	},
	FADETR = {
		cc.TransitionFadeTR
	},
	FADEUP = {
		cc.TransitionFadeUp
	},
	FLIPANGULAR = {
		cc.TransitionFlipAngular,
		cc.TRANSITION_ORIENTATION_LEFT_OVER
	},
	FLIPX = {
		cc.TransitionFlipX,
		cc.TRANSITION_ORIENTATION_LEFT_OVER
	},
	FLIPY = {
		cc.TransitionFlipY,
		cc.TRANSITION_ORIENTATION_UP_OVER
	},
	JUMPZOOM = {
		cc.TransitionJumpZoom
	},
	MOVEINB = {
		cc.TransitionMoveInB
	},
	MOVEINL = {
		cc.TransitionMoveInL
	},
	MOVEINR = {
		cc.TransitionMoveInR
	},
	MOVEINT = {
		cc.TransitionMoveInT
	},
	PAGETURN = {
		cc.TransitionPageTurn,
		false
	},
	ROTOZOOM = {
		cc.TransitionRotoZoom
	},
	SHRINKGROW = {
		cc.TransitionShrinkGrow
	},
	SLIDEINB = {
		cc.TransitionSlideInB
	},
	SLIDEINL = {
		cc.TransitionSlideInL
	},
	SLIDEINR = {
		cc.TransitionSlideInR
	},
	SLIDEINT = {
		cc.TransitionSlideInT
	},
	SPLITCOLS = {
		cc.TransitionSplitCols
	},
	SPLITROWS = {
		cc.TransitionSplitRows
	},
	TURNOFFTILES = {
		cc.TransitionTurnOffTiles
	},
	ZOOMFLIPANGULAR = {
		cc.TransitionZoomFlipAngular
	},
	ZOOMFLIPX = {
		cc.TransitionZoomFlipX,
		cc.TRANSITION_ORIENTATION_LEFT_OVER
	},
	ZOOMFLIPY = {
		cc.TransitionZoomFlipY,
		cc.TRANSITION_ORIENTATION_UP_OVER
	}
}
slot0.TEXTURES_PIXEL_FORMAT = {}
slot0.DEFAULT_TTF_FONT = "Arial"
slot0.DEFAULT_TTF_FONT_SIZE = 32
slot10 = {}
slot11 = cc.rect(0, 0, 0, 0)
slot12 = 0

function slot0.newScene(slot0, slot1)
	slot1 = slot1 or uv0
	uv1 = uv1 + 1
	slot2 = nil
	((slot1.physics or cc.Scene:create()) and cc.Scene:createWithPhysics()).name_ = string.format("%s:%d", slot0 or "<unknown-scene>", uv1)

	if slot1.transition then
		slot2 = uv2.wrapSceneWithTransition(slot2, slot1.transition, slot1.time, slot1.more)
	end

	return slot2
end

function slot0.wrapScene(slot0, slot1, slot2, slot3)
	if string.upper(tostring(slot1)) == "RANDOM" then
		slot5 = table.keys(uv0.SCENE_TRANSITIONS)
		slot4 = slot5[math.random(1, #slot5)]
	end

	if uv0.SCENE_TRANSITIONS[slot4] then
		if (slot3 or slot5[2]) ~= nil then
			slot0 = uv0.SCENE_TRANSITIONS[slot4][1]:create(slot2 or 0.2, slot0, slot3)
		else
			slot0 = slot6:create(slot2, slot0)
		end
	else
		error(string.format("display.wrapScene() - invalid transition %s", tostring(slot1)))
	end

	return slot0
end

function slot0.runScene(slot0, slot1, slot2, slot3)
	if uv0:getRunningScene() then
		if slot1 then
			slot0 = uv1.wrapScene(slot0, slot1, slot2, slot3)
		end

		uv0:replaceScene(slot0)
	else
		uv0:runWithScene(slot0)
	end
end

function slot0.getRunningScene()
	return uv0:getRunningScene()
end

function slot0.newNode()
	return cc.Node:create()
end

function slot0.newLayer(...)
	slot2 = nil

	if #{
		...
	} == 0 then
		slot2 = cc.Layer:create()
	elseif slot1 == 1 then
		slot2 = cc.LayerColor:create(cc.convertColor(slot0[1], "4b"))
	elseif slot1 == 2 then
		assert(type(slot0[2]) == "table" and (slot4.width or slot4.r), "display.newLayer() - invalid paramerter 2")

		if slot4.r then
			slot2 = cc.LayerGradient:create(cc.convertColor(slot0[1], "4b"), cc.convertColor(slot4, "4b"))
		else
			slot2 = cc.LayerColor:create(slot3, slot4.width, slot4.height)
		end
	elseif slot1 == 3 then
		slot3 = cc.convertColor(slot0[1], "4b")
		slot2 = (type(slot0[2]) ~= "table" or cc.LayerGradient:create(slot3, cc.convertColor(slot4, "4b"), slot0[3])) and cc.LayerColor:create(slot3, slot4, slot0[3])
	end

	return slot2
end

function slot0.newSprite(slot0, slot1, slot2, slot3)
	slot4 = cc.Sprite
	slot5 = false

	if type(slot1) == "table" and not slot1.x then
		slot3 = slot1
		slot1, slot2 = nil
	end

	if (slot3 or uv0).scale9 or slot6.capInsets then
		slot4 = ccui.Scale9Sprite
		slot5 = true
		slot6.capInsets = slot6.capInsets or uv1
		slot6.rect = slot6.rect or uv1
	end

	slot7 = nil

	while true do
		if not slot0 then
			slot7 = slot4:create()

			break
		end

		if type(slot0) == "string" then
			if string.byte(slot0) == 35 then
				if not slot5 then
					slot7 = slot4:createWithSpriteFrameName(string.sub(slot0, 2))

					break
				end

				slot7 = slot4:createWithSpriteFrameName(string.sub(slot0, 2), slot6.capInsets)

				break
			end

			if uv2.TEXTURES_PIXEL_FORMAT[slot0] then
				cc.Texture2D:setDefaultAlphaPixelFormat(uv2.TEXTURES_PIXEL_FORMAT[slot0])
			end

			slot7 = (slot5 or slot4:create(slot0)) and slot4:create(slot0, slot6.rect, slot6.capInsets)

			if uv2.TEXTURES_PIXEL_FORMAT[slot0] then
				cc.Texture2D:setDefaultAlphaPixelFormat(cc.TEXTURE2_D_PIXEL_FORMAT_BGR_A8888)

				break
			end

			break
		end

		if slot8 ~= "userdata" then
			error(string.format("display.newSprite() - invalid source type \"%s\"", slot8), 0)

			break
		end

		if tolua.type(slot0) == "cc.SpriteFrame" then
			if not slot5 then
				slot7 = slot4:createWithSpriteFrame(slot0)

				break
			end

			slot7 = slot4:createWithSpriteFrame(slot0, slot6.capInsets)

			break
		end

		if slot8 == "cc.Texture2D" then
			slot7 = slot4:createWithTexture(slot0)

			break
		end

		error(string.format("display.newSprite() - invalid source type \"%s\"", slot8), 0)

		break
	end

	if slot7 then
		if slot1 and slot2 then
			slot7:setPosition(slot1, slot2)
		end

		if slot6.size then
			slot7:setContentSize(slot6.size)
		end
	else
		error(string.format("display.newSprite() - create sprite failure, source \"%s\"", tostring(slot0)), 0)
	end

	return slot7
end

function slot0.newSpriteFrame(slot0, ...)
	slot1 = nil

	if type(slot0) == "string" then
		if string.byte(slot0) == 35 then
			slot0 = string.sub(slot0, 2)
		end

		if not uv0:getSpriteFrame(slot0) then
			error(string.format("display.newSpriteFrame() - invalid frame name \"%s\"", tostring(slot0)), 0)
		end
	elseif tolua.type(slot0) == "cc.Texture2D" then
		slot1 = cc.SpriteFrame:createWithTexture(slot0, ...)
	else
		error("display.newSpriteFrame() - invalid parameters", 0)
	end

	return slot1
end

function slot0.isSpriteFramesWithFileLoaded(slot0)
	if uv0.isSpriteFramesWithFileLoaded then
		return uv0:isSpriteFramesWithFileLoaded(slot0)
	else
		return false
	end
end

function slot0.newFrames(slot0, slot1, slot2, slot3)
	slot4 = {}
	slot5 = 1

	if slot3 then
		slot6 = slot1 + slot2 - 1
		slot5 = -1
	end

	for slot10 = slot1, slot6, slot5 do
		if not uv0:getSpriteFrame(string.format(slot0, slot10)) then
			error(string.format("display.newFrames() - invalid frame name %s", tostring(slot11)), 0)
		end

		slot4[#slot4 + 1] = slot12
	end

	return slot4
end

function slot13(slot0, slot1)
	assert(#slot0 > 0, "display.newAnimation() - invalid frames")

	return cc.Animation:createWithSpriteFrames(slot0, slot1 or 1 / slot2), cc.Sprite:createWithSpriteFrame(slot0[1])
end

function slot0.newAnimation(...)
	if #{
		...
	} == 2 then
		return uv0(slot0[1], slot0[2])
	elseif slot1 == 4 then
		return uv0(uv1.newFrames(slot0[1], slot0[2], slot0[3]), slot0[4])
	elseif slot1 == 5 then
		return uv0(uv1.newFrames(slot0[1], slot0[2], slot0[3], slot0[4]), slot0[5])
	else
		error("display.newAnimation() - invalid parameters")
	end
end

function slot0.loadImage(slot0, slot1)
	if not slot1 then
		return uv0:addImage(slot0)
	else
		uv0:addImageAsync(slot0, slot1)
	end
end

slot14 = cc.FileUtils:getInstance()

function slot0.getImage(slot0)
	return uv1:getTextureForKey(uv0:fullPathForFilename(slot0))
end

function slot0.removeImage(slot0)
	uv0:removeTextureForKey(slot0)
end

function slot0.loadSpriteFrames(slot0, slot1, slot2)
	slot4 = nil

	if type(slot2) == "function" then
		function slot4()
			slot0 = uv0:getTextureForKey(uv1)

			uv2:addSpriteFrames(uv3, uv1)
			uv4(uv3, uv1)
		end
	end

	if uv2.TEXTURES_PIXEL_FORMAT[slot1] then
		cc.Texture2D:setDefaultAlphaPixelFormat(uv2.TEXTURES_PIXEL_FORMAT[slot1])
	end

	if slot3 then
		uv0:addImageAsync(slot1, slot4)
	else
		uv1:addSpriteFrames(slot0, slot1)
	end

	if uv2.TEXTURES_PIXEL_FORMAT[slot1] then
		cc.Texture2D:setDefaultAlphaPixelFormat(cc.TEXTURE2_D_PIXEL_FORMAT_BGR_A8888)
	end
end

function slot0.removeSpriteFrames(slot0, slot1)
	uv0:removeSpriteFramesFromFile(slot0)

	if slot1 then
		uv1.removeImage(slot1)
	end
end

function slot0.removeSpriteFrame(slot0)
	uv0:removeSpriteFrameByName(slot0)
end

function slot0.setTexturePixelFormat(slot0, slot1)
	uv0.TEXTURES_PIXEL_FORMAT[slot0] = slot1
end

function slot0.setAnimationCache(slot0, slot1)
	uv0:addAnimation(slot1, slot0)
end

function slot0.getAnimationCache(slot0)
	return uv0:getAnimation(slot0)
end

function slot0.removeAnimationCache(slot0)
	uv0:removeAnimation(slot0)
end

function slot0.removeUnusedSpriteFrames()
	uv0:removeUnusedSpriteFrames()
	uv1:removeUnusedTextures()
end

function slot0.removeUnusedTextures()
	cc.SkeletonCache:getInstance():disposeAllCache()
	uv0:removeUnusedTextures()
end

function slot0.removeUnusedSpine()
	cc.SkeletonCache:getInstance():disposeAllCache()
end

function slot0.isPrefixExist(slot0)
	return cc.SkeletonCache:getInstance():isPrefixExist(slot0)
end

function slot0.getMaxScale()
	slot0 = 1

	if CC_DESIGN_RESOLUTION.autoscale ~= "FIXED_HEIGHT" then
		slot1 = uv0.size
		slot2 = cc.size(CC_DESIGN_RESOLUTION.width, CC_DESIGN_RESOLUTION.height)
		slot0 = math.max(slot1.width / slot2.width, slot1.height / slot2.height)
	end

	return slot0
end

function slot0.getMinScale()
	slot0 = 1

	if CC_DESIGN_RESOLUTION.autoscale ~= "FIXED_HEIGHT" then
		slot1 = uv0.size
		slot2 = cc.size(CC_DESIGN_RESOLUTION.width, CC_DESIGN_RESOLUTION.height)
		slot0 = math.min(slot1.width / slot2.width, slot1.height / slot2.height)
	end

	return slot0
end

function slot0.getScale()
	if CC_DESIGN_RESOLUTION.autoscale == "FIXED_HEIGHT" then
		return 1
	else
		return uv0.width / CC_DESIGN_RESOLUTION.width
	end
end

function slot0.getBottom(slot0)
	if CC_DESIGN_RESOLUTION.autoscale == "FIXED_HEIGHT" then
		return 0
	else
		slot1 = CC_DESIGN_RESOLUTION.height

		if not tolua.isnull(slot0) then
			slot1 = slot0:getContentSize().height
		end

		slot2 = cc.rect(0, 0, uv0.width, uv0.height)
		slot3 = 0

		if (PLATFORM == cc.PLATFORM_OS_IPHONE or PLATFORM == cc.PLATFORM_OS_MAC) and uv0.getSafeAreaRect().y ~= 0 then
			slot3 = slot2.y * 0.5
		end

		return (slot1 - uv0.height) * 0.5 + slot3
	end
end

function slot0.getTop(slot0)
	if CC_DESIGN_RESOLUTION.autoscale == "FIXED_HEIGHT" then
		return CC_DESIGN_RESOLUTION.height
	else
		slot1 = CC_DESIGN_RESOLUTION.height

		if not tolua.isnull(slot0) then
			slot1 = slot0:getContentSize().height
		end

		slot2 = cc.rect(0, 0, uv0.width, uv0.height)
		slot3 = 0

		if PLATFORM == cc.PLATFORM_OS_IPHONE or PLATFORM == cc.PLATFORM_OS_MAC then
			if uv0.getSafeAreaRect().y ~= 0 then
				slot3 = slot2.y * 1.4
			end
		elseif PLATFORM == cc.PLATFORM_OS_ANDROID and hasNotchInScreen() == true then
			slot3 = -50

			if device.getDeviceName() and slot4 ~= "" and (slot4 == " HONOR_HWOXF(OXF-AN00)" or slot4 == "HUAWEI_HWVCE(VCE-AL00)" or slot4 == "HONOR_HWPCT(PCT-AL10)") then
				slot3 = -65
			end
		end

		return slot3 + slot2.height - (uv0.height - slot1) * 0.5
	end
end

function slot0.getRight(slot0)
	if CC_DESIGN_RESOLUTION.autoscale == "FIXED_HEIGHT" then
		return CC_DESIGN_RESOLUTION.width
	else
		slot1 = CC_DESIGN_RESOLUTION.width

		if not tolua.isnull(slot0) then
			slot1 = slot0:getContentSize().width
		end

		return (slot1 + uv0:getWinSize().width) * 0.5
	end
end

function slot0.getLeft(slot0)
	if CC_DESIGN_RESOLUTION.autoscale == "FIXED_HEIGHT" then
		return 0
	else
		slot1 = CC_DESIGN_RESOLUTION.width

		if not tolua.isnull(slot0) then
			slot1 = slot0:getContentSize().width
		end

		return (slot1 - uv0:getWinSize().width) * 0.5
	end
end

function slot0.getSafeAreaRect()
	if uv0.safe_size == nil then
		uv0.safe_size = uv1:getSafeAreaRect()
	end

	return uv0.safe_size
end

function slot0.getScreenWH(slot0, slot1)
	if tolua.isnull(slot0) then
		return uv0.width, uv0.height
	end

	return uv0.getRight(slot0, slot1) - uv0.getLeft(slot0, slot1), uv0.getTop(slot0) - uv0.getBottom(slot0)
end

function slot0.specialScale()
	if CC_DESIGN_RESOLUTION.autoscale == "FIXED_WIDTH" then
		return uv0.getMinScale()
	elseif CC_DESIGN_RESOLUTION.autoscale == "FIXED_HEIGHT" then
		return 1
	end

	return 1
end

return slot0
