__spine_list = {};
__down_spine_list = {};

function spSkeletonAnimationCreate(slot0, slot1, slot2)
	slot2 = slot2 or cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A4444;

	if (PLATFORM_NAME == "demo" or PLATFORM_NAME == "release" or PLATFORM_NAME == "release2") and __down_spine_list[Split(slot0, "/")[2]] == nil then
		__down_spine_list[slot3[2]] = slot3[2];
	end

	if not slot0 or not slot1 or slot0 == "" or slot1 == "" or not PathTool.isFileExist(slot0) or not PathTool.isFileExist(string.gsub(string.format("%s", slot0), "skel", "png")) or not PathTool.isFileExist(slot1) then
		slot0, slot1 = PathTool.defaultSpine();
	end

	if PLATFORM == cc.PLATFORM_OS_ANDROID then
		if buglyAddUserValue then
			buglyAddUserValue("spSkeletonAnimationCreate", slot0);
		end

		if buglyLog then
			buglyLog(0, "buglyLog", slot0);
		end
	end

	slot4 = nil;

	return (string.find(slot0, ".skel") == nil or sp.SkeletonAnimation:createBinary(slot0, slot1, 1, slot2)) and sp.SkeletonAnimation:create(slot0, slot1, 1, slot2)
end

function createSpineByName(slot0, slot1, slot2, slot3, slot4, slot5)
	if string.sub(slot0 or "H99999", 1, 1) == "H" and slot5 == nil then
		slot5 = getPixelFormat(slot0);
	end

	slot7, slot8, slot9 = PathTool.getSpineByName(slot0, slot1);

	if not tolua.isnull(slot2) then
		slot2:addChild(spSkeletonAnimationCreate(slot7, slot8, slot5), slot3 or 0);
	end

	if slot4 and type(slot4) == "number" then
		slot10:setScale(slot4);
	end

	return slot10
end

function setHallowsSpineScale(slot0, slot1)
	if slot0 == "E21050" or slot0 == "E21070" or slot0 == "E21020" or slot0 == "E21010" or slot0 == "E21030" or slot0 == "E21090" or slot0 == "E21014" or slot0 == "E21080" or slot0 == "E21100" or slot0 == "H21050" or slot0 == "H21070" or slot0 == "H21020" or slot0 == "H21010" or slot0 == "H21030" or slot0 == "H21090" or slot0 == "H21014" or slot0 == "H21080" or slot0 == "H21100" then
		if slot0 == "E21050" or slot0 == "H21050" then
			slot1:setScale(1);
		end

		if slot0 == "E21070" or slot0 == "H21070" then
			slot1:setScale(1);
		end

		if slot0 == "E21020" or slot0 == "H21020" then
			slot1:setScale(1);
		end

		if slot0 == "E21010" or slot0 == "H21010" then
			slot1:setScale(1);
		end

		if slot0 == "E21030" or slot0 == "H21030" then
			slot1:setScale(1);
		end

		if slot0 == "E21090" or slot0 == "H21090" then
			slot1:setScale(0.25);
		end

		if slot0 == "E21014" or slot0 == "H21014" then
			slot1:setScale(0.35);
		end

		if slot0 == "E21080" or slot0 == "H21080" then
			slot1:setScale(0.6);
		end

		if slot0 == "E21100" or slot0 == "H21100" then
			slot1:setScale(1);
		end
	end
end

function createEffectSpine(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	if slot3 == nil then
		slot3 = true;
	end

	slot8, slot9, slot10, slot11, slot12 = PathTool.getSpineByName(slot0 or "E88888");

	if slot6 == nil then
		slot6 = getPixelFormat(slot0);
	end

	if PLATFORM == cc.PLATFORM_OS_WINDOWS then
		print("骨骼路径" .. slot8);
	end

	spSkeletonAnimationCreate(slot8, slot9, slot6):setPosition(slot1 or cc.p(0, -200));

	if slot7 == nil then
		slot13:setAnimation(0, slot4 or PlayerAction.action, slot3);
	end

	slot13:setAnchorPoint(slot2 or cc.p(0.5, 0.5));

	if slot5 then
		slot13:registerSpineEventHandler(slot5, sp.EventType.ANIMATION_COMPLETE);
	end

	return slot13
end

function createRichLabel(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot7 = require("UUn2rw1Xe79sI0UaGlea5iQRvaDeuUng.richlabel.RichLabel");

	if type(slot1) == "number" then
		slot1 = Config.ColorData.data_color3[slot1];
	end

	slot8 = slot7.new({
		fontName = DEFAULT_FONT,
		fontSize = slot0,
		fontColor = slot1 or cc.c3b(255, 255, 255),
		maxWidth = slot6 or 300,
		lineSpace = slot4 or 0,
		charSpace = slot5 or 0,
		anchorPoint = slot2 or cc.p(0, 0)
	});

	slot8:setAnchorPoint(slot2 or cc.p(0, 0));
	slot8:setPosition(slot3 or cc.p(0, 0));

	return slot8
end

function createCSBNote(slot0)
	return cc.CSLoader:createNode(slot0)
end

function createWithSystemFont(slot0, ...)
	return cc.Label:createWithTTF(slot0 or "", ...)
end

function createLabel(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	slot10 = createWithSystemFont("", slot9 or DEFAULT_FONT, slot0);

	if type(slot1) == "number" then
		slot1 = Config.ColorData.data_color4[slot1];
	end

	slot10:setTextColor(slot1 or Config.ColorData.data_color4[1]);
	slot10:setAnchorPoint(slot8 or cc.p(0, 0));

	if slot2 then
		if type(slot2) == "number" then
			slot2 = Config.ColorData.data_color4[slot2];
		end

		slot10:enableOutline(slot2, slot7 or 1);
	end

	if slot3 and slot4 then
		slot10:setPosition(cc.p(slot3, slot4));
	end

	if slot5 then
		slot10:setString(slot5);
	end

	if not tolua.isnull(slot6) then
		slot6:addChild(slot10);
	end

	return slot10
end

function createButton(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11)
	slot1 = slot1 or "";

	if slot6 == nil then
		CustomButton.New(slot0, slot5, slot8, slot9, slot10 or LOADTEXT_TYPE_PLIST, slot11):setLabelSize(30);
	else
		slot12:setLabelSize(slot6);
	end

	slot12:setBtnLableColor(slot7 or Config.ColorData.data_color4[1]);
	slot12:setBtnLabel(slot1, slot11);
	slot12:setOffsetPos(2, 2);
	slot12:setPosition(cc.p(slot2 or 0, slot3 or 0));

	if slot4 ~= nil then
		slot12:setSize(slot4);
	end

	return slot12
end

function createImage(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	if slot1 ~= nil then
		if slot5 == true then
			ccui.ImageView:create():loadTexture(slot1, LOADTEXT_TYPE_PLIST);
		else
			slot8:loadTexture(slot1, LOADTEXT_TYPE);
		end
	end

	if slot4 == nil then
		slot8:setAnchorPoint(cc.p(0.5, 0.5));
	else
		slot8:setAnchorPoint(slot4);
	end

	if slot7 == true then
		slot8:setScale9Enabled(true);
	end

	if slot2 ~= nil and slot3 ~= nil then
		slot8:setPosition(cc.p(slot2, slot3));
	end

	if not tolua.isnull(slot0) then
		slot0:addChild(slot8, slot6 or 0);
	end

	return slot8
end

function createScale9Sprite(slot0, slot1, slot2, slot3, slot4)
	if slot0 ~= nil then
		loadScale9SpriteTexture(ccui.Scale9Sprite:create(), slot0, slot3 or LOADTEXT_TYPE_PLIST);
	end

	if slot1 ~= nil and slot2 ~= nil then
		slot5:setPosition(cc.p(slot1, slot2));
	end

	if not tolua.isnull(slot4) then
		slot4:addChild(slot5);
	end

	return slot5
end

function createSprite(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot1 = slot1 or 0;
	slot2 = slot2 or 0;
	slot7 = cc.Sprite:create();

	if slot0 ~= nil and slot0 ~= "" then
		loadSpriteTexture(slot7, slot0, slot5 or LOADTEXT_TYPE_PLIST);
	end

	slot7:setPosition(cc.p(slot1, slot2));

	if not tolua.isnull(slot3) then
		slot3:addChild(slot7, slot6 or 0);
	end

	if slot4 ~= nil then
		slot7:setAnchorPoint(slot4);
	end

	return slot7
end

function loadScale9SpriteTexture(slot0, slot1, slot2)
	if (slot2 or ccui.TextureResType.plistType) == ccui.TextureResType.localType then
		slot0:initWithFile(slot1);
	else
		slot0:initWithSpriteFrameName(slot1);
	end
end

function loadSpriteTexture(slot0, slot1, slot2)
	if not slot0 then
		return
	end

	if not slot1 then
		return
	end

	if slot2 == ccui.TextureResType.localType then
		slot0:setTexture(slot1);
	elseif type(slot1) == "string" and string.len(slot1) > 0 and cc.SpriteFrameCache:getInstance():getSpriteFrame(slot1) then
		safeCallFunc(function ()
			uv0:setSpriteFrame(uv1);
		end);
	end
end

function changeAchPoint(slot0, slot1)
	slot2 = slot0:getAnchorPoint();
	slot3, slot4 = slot0:getPosition();
	slot5 = slot0:getContentSize();

	slot0:setAnchorPoint(slot1);
	slot0:setPosition(slot3 - slot5.width * slot2.x + slot5.width * slot1.x, slot4 - slot5.height * slot2.y + slot5.height * slot1.y);
end

function mergeAtt(slot0, slot1)
	for slot6, slot7 in pairs(slot1) do
		(function (slot0)
			slot1 = false;

			for slot5, slot6 in pairs(uv0) do
				if slot6[1] == slot0[1] then
					slot1 = true;
					slot6[2] = slot6[2] + slot0[2];

					break
				end
			end

			if not slot1 then
				table.insert(uv0, {
					slot0[1],
					slot0[2]
				});
			end
		end)(slot7);
	end
end

function createEditBox(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13)
	slot14 = ccui.EditBox:create(slot2 or cc.size(100, 30), slot1, slot10 or LOADTEXT_TYPE);

	slot14:setInputMode(slot11 or cc.EDITBOX_INPUT_MODE_SINGLELINE);
	slot14:setInputFlag(slot12 or cc.EDITBOX_INPUT_FLAG_INITIAL_CAPS_WORD);
	slot14:setReturnType(slot13 or cc.KEYBOARD_RETURNTYPE_DEFAULT);

	if slot8 then
		slot14:setPosition(slot8);
	end

	slot14:setPlaceHolder(slot7 or "");
	slot14:setPlaceholderFontSize(slot6 or 20);
	slot14:setPlaceholderFontColor(slot5 or Config.ColorData.data_color3[5]);
	slot14:setFont(DEFAULT_FONT, slot4 or 20);
	slot14:setFontColor(slot3 or Config.ColorData.data_color3[1]);

	if slot9 then
		slot14:setMaxLength(slot9);
	end

	if slot0 then
		slot0:addChild(slot14, 10);
	end

	return slot14
end

function createScrollView(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = ccui.ScrollView:create();

	slot6:setBounceEnabled(true);
	slot6:setScrollBarEnabled(false);

	if slot5 == ccui.ScrollViewDir.horizontal then
		slot6:setDirection(ccui.ScrollViewDir.horizontal);
	else
		slot6:setDirection(ccui.ScrollViewDir.vertical);
	end

	slot6:setTouchEnabled(true);
	slot6:setContentSize(cc.size(slot0, slot1));
	slot6:setInnerContainerSize(slot6:getContentSize());
	slot6:setPosition(cc.p(slot2, slot3));

	if not tolua.isnull(slot4) then
		slot4:addChild(slot6);
	end

	return slot6
end

function createLoadingBar(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)
	slot9 = slot7 and LOADTEXT_TYPE_PLIST or LOADTEXT_TYPE;
	slot11 = createScale9Sprite(slot0, slot5, slot6, slot9, slot3);

	slot11:setContentSize(slot2);
	slot11:setCascadeOpacityEnabled(true);
	slot11:setAnchorPoint(slot4);

	slot12 = ccui.LoadingBar:create();

	slot12:setAnchorPoint(cc.p(0, 0.5));
	slot12:setScale9Enabled(slot8 or true);
	slot12:setCascadeOpacityEnabled(true);
	slot12:loadTexture(slot1, slot9);
	slot12:setContentSize(cc.size(slot2.width - 4, slot2.height - 4));
	slot12:setPosition(cc.p(1, slot2.height / 2));
	slot11:addChild(slot12);

	return slot11, slot12
end

function handleTouchEnded(slot0, slot1)
	slot0:addTouchEventListener(function (slot0, slot1)
		if ccui.TouchEventType.ended == slot1 then
			uv0();
		end
	end);
end

function tranformC3bTostr(slot0)
	return c3bToStr(Config.ColorData.data_color3[slot0])
end

function showLayoutRect(slot0, slot1)
	if tolua.isnull(slot0) then
		return
	end

	slot0:setBackGroundColor(cc.c3b(0, 0, 0));
	slot0:setBackGroundColorOpacity(slot1 or 216);
	slot0:setBackGroundColorType(1);
end

function delayOnce(slot0, slot1)
	slot2 = nil;
	slot2 = cc.Director:getInstance():getScheduler():scheduleScriptFunc(function (slot0)
		if uv0 then
			cc.Director:getInstance():getScheduler():unscheduleScriptEntry(uv0);

			uv0 = nil;
		end

		uv1();
	end, slot1, false);
end

function setChildUnEnabled(slot0, slot1, slot2)
	if tolua.isnull(slot1) then
		return
	end

	setAllChildFilter(slot1, slot0, PathTool.getShaderRes("grey_shader"), slot2);
end

function setChildBlurShader(slot0, slot1)
	if tolua.isnull(slot1) then
		return
	end

	setAllChildFilter(slot1, slot0, PathTool.getShaderRes("blur_shader"));
end

function setChildDarkShader(slot0, slot1, slot2)
	if tolua.isnull(slot1) then
		return
	end

	setAllChildFilter(slot1, slot0, PathTool.getShaderRes("darkness_shader"), slot2);
end

function setOutlineStatus(slot0, slot1, slot2, slot3, slot4)
	if tolua.isnull(slot1) then
		return
	end

	slot5 = PathTool.getShaderRes("stroke_shader");

	if slot1.setOutlineStatus then
		if slot0 == false then
			slot1:setOutlineStatus(slot0);
		else
			slot2 = slot2 or 0.8;

			if slot3 and type(slot3) == "number" then
				slot3 = Config.ColorData.data_color3[slot3];
			end

			slot1:setOutlineStatus(slot0, slot2, slot3 or Config.ColorData.data_color3[169], slot4 or slot1:getContentSize(), slot5);
		end
	end
end

function setChildFrozenShader(slot0, slot1, slot2)
	if tolua.isnull(slot1) then
		return
	end

	setAllChildFilter(slot1, slot0, PathTool.getShaderRes("frozen_shader"), slot2);
end

function delayRun(slot0, slot1, slot2)
	if not tolua.isnull(slot0) then
		slot0:runAction(cc.Sequence:create(cc.DelayTime:create(slot1), cc.CallFunc:create(function ()
			if not tolua.isnull(uv0) and uv1 ~= nil then
				uv1();
			end
		end)));
	end
end

_effect_once = _effect_once or {};

function playEffectOnce(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10)
	slot8 = slot8 or PlayerAction.action;

	if _effect_once_playing and not slot5 then
		if _effect_once_last ~= slot0 or slot10 == true then
			table.insert(_effect_once, {
				slot0,
				slot1,
				slot2,
				slot3,
				slot4,
				slot5,
				slot6
			});
		end
	else
		_effect_once_playing = true;

		if not _G.GlobalTimeTicket then
			require("mmtZgQAwkKz4pG9sW05wVoadNxAlGKg9/global_time_ticket");
		end

		GlobalTimeTicket:getInstance():remove("play_effect_timeout");
		GlobalTimeTicket:getInstance():add(function ()
			_effect_once_playing = false;
		end, 1, 1, "play_effect_timeout");

		_effect_once_last = slot0;
		slot11, slot12, slot13 = PathTool.getSpineByName(slot0);

		function slot14()
			if uv0 then
				uv0();
			end

			if #_effect_once > 0 then
				slot0 = _effect_once[1];
				_ignore_battle = slot0[7];
				_isgore_playing = slot0[6];
				_finish_call = slot0[5];
				_parent = slot0[4];
				_y = slot0[3];
				_x = slot0[2];
				_effect_name = slot0[1];

				table.remove(_effect_once, 1);
				playEffectOnce(_effect_name, _x, _y, _parent, _finish_call, _isgore_playing, _ignore_battle);
			end
		end

		(function (slot0)
			if type(uv0) == "table" then
				if not tolua.isnull(uv0[1]) then
					uv0[1]:addChild(slot0, uv0[2]);
				else
					uv1();

					return
				end
			elseif not tolua.isnull(uv0) then
				uv0:addChild(slot0, 99);
			else
				uv1();

				return
			end

			function slot1(slot0)
				if slot0.animation == uv0 then
					_effect_once_playing = false;

					uv1:runAction(cc.RemoveSelf:create(true));

					_effect_once_last = nil;

					uv2();
				end
			end

			if uv3 == true then
				slot0:registerScriptHandler(function (slot0)
					if slot0 == "enter" then
						-- Nothing
					elseif slot0 == "exit" then
						_effect_once_playing = false;
					end
				end);
			end

			slot0:setPosition(uv4, uv5);
			slot0:registerSpineEventHandler(slot1, sp.EventType.ANIMATION_COMPLETE);
			slot0:setAnimation(0, uv2 or PlayerAction.action, false);

			uv6 = uv6 or 1;

			slot0:setScale(uv6);
		end)(createSpineByName(slot0));
	end
end

function doRelease(slot0)
	if not tolua.isnull(slot0) and slot0:getReferenceCount() > 1 then
		slot0:release();
	end
end

function doRemoveFromParent(slot0)
	if not tolua.isnull(slot0) then
		slot0:removeFromParent();
	end
end

function safeCallFunc(slot0)
	xpcall(slot0, function (slot0)
		print_log(string.format("[%s,%s,%s]%s\n%s", cc.UserDefault:getInstance():getIntegerForKey("local_version"), PLATFORM, PLATFORM_NAME, slot0, debug.traceback()));

		if buglyReportLuaException then
			buglyReportLuaException(string.format("[%s,%s,%s]%s", slot2, PLATFORM, PLATFORM_NAME, slot0), slot1);
		end
	end);
end

function transformNameByServ(slot0, slot1)
	slot2 = slot0;

	if slot1 == nil or slot0 == nil then
		return slot2
	end

	if slot0 and string.find(slot2, "【") then
		return slot2
	end

	if not RoleController:getInstance():isTheSameSvr(slot1) and RoleController:getInstance():getRoleVo() then
		slot5 = Split(slot3.srv_id, "_");

		if Split(slot1, "_")[2] and slot5[1] and slot4[1] ~= slot5[1] then
			slot2 = string.format(TI18N("[异域]%s"), slot2);
		elseif #slot4 > 1 then
			slot2 = string.format("[S%s]%s", slot4[#slot4], slot2);
		end

		if slot1 == "robot_1" or slot1 == "robot" then
			slot2 = slot0;
		end
	end

	return slot2
end

function getServerName(slot0)
	if slot0 == nil then
		return ""
	end

	slot1 = "";

	if RoleController:getInstance():getRoleVo() then
		slot4 = Split(slot2.srv_id, "_");

		if Split(slot0, "_")[2] and slot4[1] and slot3[1] ~= slot4[1] then
			slot1 = TI18N("异域");
		elseif #slot3 > 1 then
			slot1 = string.format("S%s", slot3[#slot3]);
		end

		if slot0 == "robot_1" then
			slot1 = name;
		end
	end

	return slot1
end

function getServerIndex(slot0)
	if slot0 == nil then
		return ""
	end

	if slot0 == "robot_1" or slot0 == "robot" then
		return 0
	end

	if RoleController:getInstance():getRoleVo() then
		slot3 = Split(slot1.srv_id, "_");

		if Split(slot0, "_")[2] and slot3[1] and slot2[1] ~= slot3[1] then
			return 0
		elseif #slot2 > 1 then
			if slot0 == slot1.srv_id or slot0 == slot1.main_srv_id then
				return slot2[#slot2], true
			else
				return slot2[#slot2]
			end
		end
	end

	return 0
end

function _T(slot0)
	return slot0
end

function doScrollToPage(slot0, slot1)
	if not tolua.isnull(slot0) then
		slot0:scrollToPage(slot1 or 0);
	end
end

function appendToTarget(slot0, slot1, slot2, slot3)
	slot2 = slot2 or 0;
	slot3 = slot3 or 0;

	if slot0 ~= nil and slot1 ~= nil then
		slot4, slot5 = slot0:getPosition();

		slot1:setPosition(cc.p(slot4 + slot0:getContentSize().width + slot2, slot5 + slot3));
		slot1:setPosition(cc.p(slot4 + slot0:getContentSize().width + slot2, slot5 + slot3));
	end
end

function customClickAction(slot0, slot1, slot2)
	if tolua.isnull(slot0) then
		return
	end

	if slot1 == ccui.TouchEventType.began then
		slot0:stopAllActions();
		slot0:runAction(cc.ScaleTo:create(0.05, 1.1 * (slot2 or 1)));
	elseif slot1 == ccui.TouchEventType.ended then
		slot0:stopAllActions();
		slot0:runAction(cc.Sequence:create(cc.ScaleTo:create(0.1, 0.95 * slot2), cc.ScaleTo:create(0.1, 1 * slot2)));
	elseif slot1 == ccui.TouchEventType.canceled then
		slot0:stopAllActions();
		slot0:runAction(cc.Sequence:create(cc.ScaleTo:create(0.1, 0.95 * slot2), cc.ScaleTo:create(0.1, 1 * slot2)));
	end
end

function customClickAction_2(slot0, slot1, slot2)
	if tolua.isnull(slot0) then
		return
	end

	if slot1 == ccui.TouchEventType.began then
		slot0:stopAllActions();
		slot0:runAction(cc.ScaleTo:create(0.05, 0.95 * (slot2 or 1)));
	elseif slot1 == ccui.TouchEventType.ended then
		slot0:stopAllActions();
		slot0:runAction(cc.Sequence:create(cc.ScaleTo:create(0.1, 1.1 * slot2), cc.ScaleTo:create(0.1, 1 * slot2)));
	elseif slot1 == ccui.TouchEventType.canceled then
		slot0:stopAllActions();
		slot0:runAction(cc.Sequence:create(cc.ScaleTo:create(0.1, 1.1 * slot2), cc.ScaleTo:create(0.1, 1 * slot2)));
	end
end

function customClickActionByXY(slot0, slot1, slot2, slot3)
	if tolua.isnull(slot0) then
		return
	end

	if slot1 == ccui.TouchEventType.began then
		slot0:stopAllActions();
		slot0:runAction(cc.ScaleTo:create(0.05, 0.95 * (slot2 or 1), 0.95 * (slot3 or 1)));
	elseif slot1 == ccui.TouchEventType.ended then
		slot0:stopAllActions();
		slot0:runAction(cc.Sequence:create(cc.ScaleTo:create(0.1, 1.1 * slot4, 1.1 * slot5), cc.ScaleTo:create(0.1, 1 * slot4, 1 * slot5)));
	elseif slot1 == ccui.TouchEventType.canceled then
		slot0:stopAllActions();
		slot0:runAction(cc.Sequence:create(cc.ScaleTo:create(0.1, 1.1 * slot4, 1.1 * slot5), cc.ScaleTo:create(0.1, 1 * slot4, 1 * slot5)));
	end
end

function splitDataStr(slot0)
	if slot0 ~= nil and slot1 ~= "" then
		while string.find(slot1, "{") ~= nil do
			slot2, slot3 = string.find(slot1, "{");
			slot4, slot5 = string.find(slot1, "}");
			slot6 = string.sub(slot1, slot2, slot5);
			slot8 = Split(string.sub(slot6, 2, #slot6 - 1), ":");
			slot1 = string.gsub(slot1, slot6, string.format("<div fontcolor=%s>%s</div>", tranformC3bTostr(tonumber(slot8[1])), slot8[2]), 1);
		end
	end

	if RoleController:getInstance():getRoleVo() ~= nil then
		slot1 = string.gsub(slot1, "~n", slot2.name);
	end

	return slot1
end

function registerRemmovePointer(slot0, slot1, slot2)
	function slot3(slot0)
		if slot0 == "enter" then
			if uv0 then
				uv0();
			end
		elseif slot0 == "exit" then
			if uv1 then
				uv1();
			end

			uv2 = nil;
		end
	end
end

function playButtonSound()
	if AudioManager then
		AudioManager:getInstance():playEffect(AudioManager.AUDIO_TYPE.COMMON, "c_002");
	end
end

function playTabButtonSound()
	AudioManager:getInstance():playEffect(AudioManager.AUDIO_TYPE.COMMON, "c_002");
end

function playButtonSound2()
	if AudioManager then
		AudioManager:getInstance():playEffect(AudioManager.AUDIO_TYPE.COMMON, "c_button1");
	end
end

function playCloseSound()
	if AudioManager then
		AudioManager:getInstance():playEffect(AudioManager.AUDIO_TYPE.COMMON, "c_close");
	end
end

function playPartnerSound(slot0)
	if AudioManager then
		AudioManager:getInstance():playEffect(AudioManager.AUDIO_TYPE.DUBBING, slot0, false);
	end
end

function playOtherSound(slot0, slot1)
	AudioManager:getInstance():playEffect(slot1 or AudioManager.AUDIO_TYPE.COMMON, slot0);
end

function touchPoint(slot0, slot1)
end

function findNodeByTag(slot0, slot1)
	if tolua.isnull(slot0) == nil then
		return
	end

	if slot0 == nil then
		return
	end

	if slot0 and slot0.getTag and slot0:getTag() == slot1 then
		return slot0
	end

	slot2 = {
		slot0:getChildren()
	};
	slot3 = 0;

	while slot3 < #slot2 do
		for slot7, slot8 in pairs(slot2[slot3 + 1]) do
			if not tolua.isnull(slot8) then
				if slot8.getTag and slot8:getTag() == slot1 then
					return slot8
				end

				if slot8.getChildren then
					table.insert(slot2, slot8:getChildren());
				end
			end
		end
	end

	return nil
end

function findNodeByName(slot0, slot1)
	if tolua.isnull(slot0) == nil then
		return
	end

	if slot0 == nil then
		return
	end

	if slot0 and slot0.getName and slot0:getName() == slot1 then
		return slot0
	end

	slot2 = {
		slot0:getChildren()
	};
	slot3 = 0;

	while slot3 < #slot2 do
		for slot7, slot8 in pairs(slot2[slot3 + 1]) do
			if not tolua.isnull(slot8) then
				if slot8.getName and slot8:getName() == slot1 then
					return slot8
				end

				if slot8.getChildren then
					table.insert(slot2, slot8:getChildren());
				end
			end
		end
	end

	return nil
end

function now_ver()
	if cc.UserDefault:getInstance():getBoolForKey("is_enter_try_srv") then
		slot0 = cc.UserDefault:getInstance():getIntegerForKey("local_try_version") or (cc.UserDefault:getInstance():getIntegerForKey("local_version") or 0);
	end

	return math.max(slot0, NOW_VERSION)
end

function check_min_ver(slot0, slot1)
	if not slot1 and (not WIN_UPDATE and (PLATFORM == cc.PLATFORM_OS_WINDOWS or PLATFORM == cc.PLATFORM_OS_MAC) or UPDATE_SKIP) then
		return
	end

	slot3 = string.format("%s/min_version2.txt?ts=%s", URL_PATH.update, os.time());

	if cc.UserDefault:getInstance():getBoolForKey("is_enter_try_srv") then
		slot3 = string.format("%s/min_tryver.txt?ts=%s", URL_PATH.update, os.time());
	end

	print("get_min_ver_url==>", slot3);

	slot4 = cc.XMLHttpRequest:new();
	slot4.responseType = cc.XMLHTTPREQUEST_RESPONSE_STRING;

	slot4:open("GET", slot3);
	slot4:registerScriptHandler(function ()
		if uv0.readyState == 4 and uv0.status >= 200 and uv0.status < 207 then
			uv1(now_ver(), tonumber(uv0.response));
		end
	end);
	slot4:send();

	return true
end

function breatheShineAction(slot0, slot1, slot2)
	slot1 = slot1 or 0.7;
	slot2 = slot2 or 0.4;

	if slot0 == nil or tolua.isnull(slot0) then
		return
	end

	slot0:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.FadeIn:create(slot1), cc.FadeOut:create(slot2))));
end

function breatheShineAction2(slot0, slot1, slot2, slot3, slot4)
	slot3 = slot3 or 0.7;
	slot4 = slot4 or 0.4;
	slot1 = slot1 or 10;
	slot2 = slot2 or 5;

	if slot0 == nil or tolua.isnull(slot0) then
		return
	end

	slot0:setOpacity(0);
	slot0:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(slot1), cc.FadeIn:create(slot3), cc.DelayTime:create(slot2), cc.FadeOut:create(slot4))));
end

function breatheShineAction3(slot0, slot1, slot2)
	slot1 = slot1 or 1.05;
	slot2 = slot2 or 0.6;

	if slot0 == nil or tolua.isnull(slot0) then
		return
	end

	slot0:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.ScaleTo:create(slot2, slot1), cc.ScaleTo:create(slot2, 1))));
end

function breatheShineAction4(slot0, slot1, slot2)
	if tolua.isnull(slot0) then
		return
	end

	slot1 = slot1 or 0.5;
	slot2 = slot2 or 10;

	slot0:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.MoveBy:create(slot1, cc.p(0, -slot2)), cc.MoveBy:create(slot1 * 2, cc.p(0, 2 * slot2)), cc.MoveBy:create(slot1, cc.p(0, -slot2)))));
end

function commonOpenActionLeftMove(slot0)
	if slot0 == nil or tolua.isnull(slot0) then
		return
	end

	doStopAllActions(slot0);

	slot1 = slot0:getPositionY();

	slot0:setPosition(0, slot1);
	slot0:setOpacity(0);
	slot0:runAction(cc.Spawn:create(cc.EaseBackOut:create(cc.MoveTo:create(0.3, cc.p(360, slot1))), cc.FadeIn:create(0.25)));
end

function commonOpenActionRightMove(slot0)
	if slot0 == nil or tolua.isnull(slot0) then
		return
	end

	doStopAllActions(slot0);

	slot1 = slot0:getPositionY();

	slot0:setPosition(720, slot1);
	slot0:setOpacity(0);
	slot0:runAction(cc.Spawn:create(cc.EaseBackOut:create(cc.MoveTo:create(0.3, cc.p(360, slot1))), cc.FadeIn:create(0.25)));
end

function commonOpenActionCentreScale(slot0)
	if slot0 == nil or tolua.isnull(slot0) then
		return
	end

	doStopAllActions(slot0);
	slot0:setPositionX(360);
	slot0:setOpacity(0);
	slot0:setScale(0.3);
	slot0:runAction(cc.Spawn:create(cc.EaseBackOut:create(cc.ScaleTo:create(0.3, 1)), cc.FadeIn:create(0.25)));
end

function checkGoldIsEnough(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot1();
end

function createResourcesLoad(slot0, slot1, slot2, slot3, slot4)
	if slot3 ~= nil then
		slot3:DeleteMe();

		slot3 = nil;
	end

	slot5 = ResourcesLoad.New();

	slot5:addDownloadList(slot0, slot1, function ()
		uv0();
	end);

	return slot5
end

function loadSpriteTextureFromCDN(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot3 ~= nil then
		slot3:DeleteMe();

		slot3 = nil;
	end

	if tolua.isnull(slot0) then
		return
	end

	slot6 = ResourcesLoad.New();

	slot6:addDownloadList(slot1, slot2, function ()
		if not tolua.isnull(uv0) then
			loadSpriteTexture(uv0, uv1, LOADTEXT_TYPE);

			if uv2 then
				uv2();
			end
		end
	end, slot4);

	return slot6
end

function loadImageTextureFromCDN(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot3 ~= nil then
		slot3:DeleteMe();

		slot3 = nil;
	end

	if tolua.isnull(slot0) then
		return
	end

	slot6 = ResourcesLoad.New();

	slot6:addDownloadList(slot1, slot2, function ()
		if not tolua.isnull(uv0) then
			uv0:loadTexture(uv1, LOADTEXT_TYPE);

			if uv2 then
				uv2();
			end
		end
	end, slot4);

	return slot6
end

function TI18N(slot0)
	return slot0
end

function createArmature(slot0, slot1)
	slot2 = nil;
	slot2 = (string.find(slot0, "E") ~= nil or createSpineByName(slot0 or "H99999", slot1)) and createSpineByName(slot0);
	slot3 = 1;

	if not BattleController:getInstance():getIsNoramalBattle() then
		slot3 = BattleController:getInstance():getModel():getTimeScale();
	end

	slot2:setTimeScale(slot3);
	slot2:setAnchorPoint(cc.p(0.5, 0));

	return slot2
end

slot0 = tolua.isnull;

function doStopAllActions(slot0)
	if uv0(slot0) then
		return
	end

	slot0:stopAllActions();
end

function hasNotchInScreen()
	if NOTICE_IN_SCREEN == nil then
		if not callFunc then
			require("call_function");
		end

		if callFunc("hasNotchInScreen") == "true" then
			notch_in_screen = true;
		else
			notch_in_screen = false;
		end

		NOTICE_IN_SCREEN = notch_in_screen;
	end

	return NOTICE_IN_SCREEN
end

function getTextBgSizeByTextContent(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	slot8 = 0;
	slot9 = 0;
	slot5 = slot5 or 20;
	slot6 = slot6 or 0;
	slot7 = slot7 or 0;

	if slot0 and slot0 ~= "" then
		if (slot4 or 100) > math.ceil(StringUtil.getStrLen(slot0) / 2) * (slot5 + slot7) then
			slot8 = (slot3 or 30) * 2 + slot11 * (slot5 + slot7);
			slot9 = slot5 + (slot1 or 30) + (slot2 or 30);
		else
			slot12 = math.ceil(slot11 * (slot5 + slot7) / slot4);
			slot8 = slot3 * 2 + slot4;
			slot9 = slot12 * slot5 + (slot12 - 1) * slot6 + slot1 + slot2;
		end
	end

	return cc.size(slot8, slot9)
end

function addRedPointToNodeByStatus(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot0 and not tolua.isnull(slot0) then
		if slot1 == true then
			if not slot0.red_point then
				slot2 = slot2 or 0;
				slot3 = slot3 or 0;
				slot4 = slot4 or 10;
				slot6 = PathTool.getResFrame("common", "common_1014");
				slot7 = 0.7142857142857143;

				if slot5 and slot5 == 2 then
					slot7 = 1;
				end

				slot8 = createSprite(slot6, 0, 0, slot0, cc.p(1, 1), LOADTEXT_TYPE_PLIST, slot4);
				slot9 = slot0:getContentSize();
				slot10 = slot9.width + slot2;
				slot11 = slot9.height + slot3;

				print(slot10, slot11);
				slot8:setPosition(cc.p(slot10, slot11));
				slot8:setScale(slot7);

				slot0.red_point = slot8;
			end

			slot0.red_point:setVisible(true);
		elseif slot0.red_point then
			slot0.red_point:setVisible(false);
		end
	end
end

REGISTER_BUTTON_SOUND_BUTTON_TYPY = 1;
REGISTER_BUTTON_SOUND_CLOSED_TYPY = 2;
REGISTER_BUTTON_SOUND_TAB_BUTTON_TYPY = 3;

function registerButtonEventListener(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	if tolua.isnull(slot0) then
		return
	end

	slot8 = slot2 or false;
	slot9 = slot3 or 1;
	slot10 = slot6 or 0;

	slot0:addTouchEventListener(function (slot0, slot1)
		if uv0 then
			customClickAction(slot0, slot1, uv1);
		end

		if uv2 and slot1 == ccui.TouchEventType.began then
			uv3.touch_began = slot0:getTouchBeganPosition();
		end

		if slot1 == ccui.TouchEventType.ended then
			if uv2 then
				slot3 = slot0:getTouchEndPosition();

				if uv3.touch_began and slot3 and (math.abs(slot3.x - slot2.x) > 20 or math.abs(slot3.y - slot2.y) > 20) then
					return
				end
			end

			if uv4 > 0 and uv3.last_time and math.abs(GameNet:getInstance():getTimeFloat() - uv3.last_time) < uv4 then
				return
			end

			uv3.last_time = GameNet:getInstance():getTimeFloat();

			if uv5 == REGISTER_BUTTON_SOUND_BUTTON_TYPY then
				playButtonSound2();
			elseif uv5 == REGISTER_BUTTON_SOUND_CLOSED_TYPY then
				playCloseSound();
			elseif uv5 == REGISTER_BUTTON_SOUND_TAB_BUTTON_TYPY then
				playTabButtonSound();
			end

			if uv6 then
				uv6(uv7, slot0, slot1);
			end
		end
	end);
end

function getPixelFormat(slot0)
	if slot0 == nil then
		return cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A4444
	end

	slot1 = cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A4444;

	if string.sub(slot0, 1, 1) == "E" and Config.SpecialSpineData and Config.SpecialSpineData.data_effect[slot0] == 1 then
		slot1 = cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A8888;
	end

	if EQUIPMENT_QUALITY == 3 then
		slot1 = cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A8888;
	end

	return slot1
end

function getRandomSaveName()
	return "sy" .. (function (slot0)
		slot1 = slot0;

		if StringUtil.getStrLen(math.random(3) % 3 == 0 and slot1 .. string.char(math.random(65, 90)) or math.random(3) % 2 == 0 and slot1 .. string.char(math.random(97, 122)) or slot1 .. string.char(math.random(48, 57))) < 12 then
			slot1 = uv0(slot1);
		end

		return slot1
	end)("")
end

function commonShowSingleRowItemList(slot0, slot1, slot2, slot3)
	if not slot0 then
		return
	end

	if not slot2 then
		return
	end

	if slot1 then
		for slot8, slot9 in ipairs(slot4) do
			slot9:setVisible(false);
		end
	end

	if slot4 == nil then
		slot4 = {};
	end

	if #slot2 == 0 then
		return
	end

	slot5 = slot3 or {};
	slot11 = slot5.lock or false;
	slot12 = slot5.lock_pos or nil;
	slot13 = slot5.is_show_action or false;
	slot14 = slot5.is_tip;
	slot15 = slot5.callback or false;
	slot16 = slot5.is_get_status or false;
	slot17 = slot5.get_status_res or nil;
	slot18 = slot5.is_show_bg;
	slot19 = slot5.is_show_got;
	slot20 = #slot2;
	slot22 = slot0:getContentSize();

	slot0:setInnerContainerSize(cc.size(math.max(slot22.width, (slot5.start_x or 5) * 2 + (slot5.item_width or BackPackItem.Width) * (slot5.scale or 1) * slot20 + (slot5.space_x or 5) * (slot20 - 1)), slot22.height));

	if slot5.max_count and slot20 <= slot9 then
		slot0:setTouchEnabled(false);

		if slot5.is_center and (slot22.width - slot21) * 0.5 < 0 then
			slot7 = 0;
		end
	else
		slot0:setTouchEnabled(true);
	end

	slot0:stopAllActions();

	slot25 = nil;
	slot26 = #slot4;

	for slot30, slot31 in ipairs(slot2) do
		if slot4[slot30] then
			(function (slot0, slot1, slot2)
				slot0:setVisible(true);
				slot0:setPosition(uv0 + (slot2 - 1) * (uv1 + uv2), uv3.height * 0.5);
				slot0:setBaseData(slot1[1], slot1[2], true);
				slot0:showOrderWarLock(uv4, uv5);
				slot0:IsGetStatus(uv6, nil, uv7);

				if uv8 then
					slot0:addCallBack(function ()
						uv0();
					end);
				end

				if slot1[3] then
					slot0:setGoodsName(slot1[3], nil, 24, nil);
				end

				slot0:setDefaultTip(uv9);

				if uv10.show_effect_id then
					slot0:showItemEffect(true, uv10.show_effect_id, PlayerAction.action_1, true, 1.1);
				end

				if uv11 ~= nil then
					slot0:setIsShowBackground(uv11);
				end

				if uv12 ~= nil then
					slot0:setGotIcon(uv12);
				end
			end)(slot25, slot31, slot30);
		else
			if slot30 - slot26 <= 0 then
				slot32 = 1;
			end

			slot33 = 0;

			delayRun(slot0, slot13 and 0.1 * slot32 or slot32 / display.DEFAULT_FPS, function ()
				if not uv0[uv1] then
					uv2 = BackPackItem.new(true, true);

					uv2:setAnchorPoint(0, 0.5);
					uv2:setScale(uv3);
					uv2:setSwallowTouches(false);
					uv4:addChild(uv2);

					uv0[uv1] = uv2;

					uv5(uv2, uv6, uv1);

					if uv7 then
						uv2:setScale(uv3 * 1.3);
						uv2:runAction(cc.ScaleTo:create(0.1, uv3));
					end
				end
			end);
		end
	end

	return slot4
end

function commonGetAttrInfoByIDValue(slot0, slot1)
	if not slot0 or not slot1 then
		return
	end

	return commonGetAttrInfoByKeyValue(Config.AttrData.data_id_to_key[slot0], slot1)
end

function commonGetAttrInfoByKeyValue(slot0, slot1)
	if not slot0 or not slot1 then
		return
	end

	if Config.AttrData.data_key_to_name[slot0] then
		slot3 = PathTool.getAttrIconByStr(slot0);

		if PartnerCalculate.isShowPerByStr(slot0) == true then
			slot1 = slot1 / 10 .. "%";
		end

		return PathTool.getResFrame("common", slot3), slot2, slot1
	end
end

function commonShowEmptyIcon(slot0, slot1, slot2)
	if not slot0 then
		return
	end

	if slot1 then
		slot4 = (slot2 or {}).text or TI18N("暂无数据");

		if not slot0.empty_con then
			slot5 = slot0:getContentSize();
			slot11 = cc.size(200, 200);
			slot0.empty_con = ccui.Widget:create();

			slot0.empty_con:setContentSize(slot11);
			slot0.empty_con:setAnchorPoint(cc.p(0.5, 0.5));
			slot0.empty_con:setPosition(slot3.pos or cc.p(slot5.width * 0.5, slot5.height * 0.5 + 10));
			slot0:addChild(slot0.empty_con, 10);
			createImage(slot0.empty_con, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_3"), slot11.width / 2, slot11.height / 2, cc.p(0.5, 0.5), false):setScale(slot3.scale or 1);

			slot0.empty_label = createLabel(slot3.font_size or 26, slot3.label_color or Config.ColorData.data_color4[175], nil, slot11.width / 2, slot3.offset_y or -10, "", slot0.empty_con, 0, cc.p(0.5, 0));
		else
			slot0.empty_con:setVisible(true);
		end

		slot0.empty_label:setString(slot4);
	elseif slot0.empty_con then
		slot0.empty_con:setVisible(false);
	end
end

function commonCountDownTime(slot0, slot1, slot2)
	if tolua.isnull(slot0) then
		return
	end

	slot3 = slot2 or {};
	slot4 = slot3.callback;
	slot5 = slot3.end_callback;
	slot7 = slot3.end_title or "";
	slot8 = slot3.time_title or "";
	slot9 = nil;
	slot10 = string.format;

	if slot3.label_type and slot6 == CommonAlert.type.rich then
		slot9 = slot3.time_color;
	end

	doStopAllActions(slot0);

	if slot1 > 0 then
		(function (slot0)
			if tolua.isnull(uv0) then
				return
			end

			if uv1 then
				uv1(slot0);

				return
			end

			if uv2 and uv2 == CommonAlert.type.rich and uv3 then
				if slot0 > 0 then
					uv0:setString(uv4("%s <div fontcolor=%s>%s</div>%s", uv5, uv3, TimeTool.GetTimeForFunction(slot0), uv6));
				else
					doStopAllActions(uv0);
					uv0:setString(uv4("%s <div fontcolor=%s>00:00:00</div>%s", uv5, uv3, uv6));

					if uv7 then
						uv7(slot0);
					end
				end
			elseif slot0 > 0 then
				uv0:setString(uv5 .. TimeTool.GetTimeForFunction(slot0) .. uv6);
			else
				doStopAllActions(uv0);
				uv0:setString(uv5 .. "00:00:00" .. uv6);

				if uv7 then
					uv7(slot0);
				end
			end
		end)(slot1);
		slot0:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1;

			uv1(uv0);
		end))));
	else
		slot11(slot1);
	end
end

function setCountDownTime(slot0, slot1)
	if tolua.isnull(slot0) then
		return
	end

	doStopAllActions(slot0);

	if slot1 > 0 then
		(function (slot0)
			if tolua.isnull(uv0) then
				return
			end

			if slot0 > 0 then
				uv0:setString(TimeTool.GetTimeFormatDayII(slot0));
			else
				doStopAllActions(uv0);
				uv0:setString("00:00:00");
			end
		end)(slot1);
		slot0:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1;

			if uv0 < 0 then
				doStopAllActions(uv1);
				uv1:setString("00:00:00");
			else
				uv2(uv0);
			end
		end))));
	else
		slot2(slot1);
	end
end

function addCountForCampIcon(slot0, slot1)
	slot1 = slot1 or {};
	slot3 = slot1[2];
	slot4 = slot1[3];

	if slot1[1] and slot2 > 0 then
		if not slot0.top_num_txt then
			slot5 = slot0:getContentSize();
			slot0.top_sp = createSprite(PathTool.getResFrame("common", "common_90088"), slot5.width / 2, slot5.height - 15, slot0, cc.p(0.5, 0.5));
			slot0.top_num_txt = createLabel(20, cc.c4b(255, 249, 242, 255), nil, slot5.width / 2 - 1, slot5.height - 15, slot2, slot0, nil, cc.p(0.5, 0.5));
		else
			slot0.top_num_txt:setString(slot2);
			slot0.top_num_txt:setVisible(true);
			slot0.top_sp:setVisible(true);
		end
	elseif slot0.top_num_txt then
		slot0.top_num_txt:setVisible(false);
		slot0.top_sp:setVisible(false);
	end

	if slot3 and slot3 > 0 then
		if not slot0.bottom_num_txt then
			slot5 = slot0:getContentSize();
			slot0.bottom_sp = createSprite(PathTool.getResFrame("common", "common_90089"), slot5.width / 2, 15, slot0, cc.p(0.5, 0.5));
			slot0.bottom_num_txt = createLabel(20, cc.c4b(255, 249, 242, 255), nil, slot5.width / 2 - 1, 15, slot3, slot0, nil, cc.p(0.5, 0.5));
		else
			slot0.bottom_num_txt:setString(slot3);
			slot0.bottom_num_txt:setVisible(true);
			slot0.bottom_sp:setVisible(true);
		end
	elseif slot0.bottom_num_txt then
		slot0.bottom_num_txt:setVisible(false);
		slot0.bottom_sp:setVisible(false);
	end

	if slot4 and slot4 > 0 then
		if not slot0.bottom_num_txt2 then
			slot5 = slot0:getContentSize();
			slot0.bottom_sp2 = createSprite(PathTool.getResFrame("common", "common_90089"), 64, 22, slot0, cc.p(0.5, 0.5));

			slot0.bottom_sp2:setRotation(-45);

			slot0.bottom_num_txt2 = createLabel(20, cc.c4b(255, 249, 242, 255), nil, 63, 21, slot4, slot0, nil, cc.p(0.5, 0.5));
		else
			slot0.bottom_num_txt2:setString(slot4);
			slot0.bottom_num_txt2:setVisible(true);
			slot0.bottom_sp2:setVisible(true);
		end

		if slot0.bottom_num_txt then
			slot5 = slot0:getContentSize();

			slot0.bottom_sp:setRotation(45);
			slot0.bottom_sp:setPosition(22, 22);
			slot0.bottom_num_txt:setPosition(20, 21);
		end
	elseif slot0.bottom_num_txt2 then
		slot0.bottom_num_txt2:setVisible(false);
		slot0.bottom_sp2:setVisible(false);

		if slot0.bottom_num_txt then
			slot5 = slot0:getContentSize();

			slot0.bottom_sp:setRotation(0);
			slot0.bottom_sp:setPosition(slot5.width / 2, 15);
			slot0.bottom_num_txt:setPosition(slot5.width / 2 - 1, 15);
		end
	end
end

function commonShowRollStr(slot0, slot1)
	if not slot0 then
		return
	end

	slot2 = slot1 or {};
	slot4 = slot2.max_width or 100;
	slot5 = slot2.dir or 1;
	slot6 = slot2.label_type or CommonAlert.type.common;
	slot7 = slot2.start_x or slot0:getPositionX();

	if slot2.content ~= nil and slot3 ~= "" then
		slot0:setString(slot3);
	end

	slot8 = nil;

	slot0:setPositionX(slot7);
	doStopAllActions(slot0);

	if slot4 < ((slot6 ~= CommonAlert.type.rich or slot0:getSize()) and slot0:getContentSize()).width then
		slot9 = (slot8.width - slot4) * slot5;
		slot12 = cc.CallFunc:create(function ()
			uv0:setPositionX(uv1);
		end);

		slot0:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(2), slot12, cc.MoveBy:create(slot9 * 0.02, cc.p(-slot9, 0)), cc.DelayTime:create(2), slot12)));
	end
end

function transformTextToShort(slot0, slot1)
	if not slot0 or not slot1 then
		return ""
	end

	if slot1 < StringUtil.SubStringGetTotalIndex(slot0) then
		slot0 = StringUtil.SubStringUTF8(slot0, 1, slot1) .. "...";
	end

	return slot0
end

function setTextContentList(slot0, slot1)
	if tolua.isnull(slot0) then
		return
	end

	if not slot1 or next(slot1) == nil then
		return
	end

	for slot5, slot6 in pairs(slot1) do
		if findNodeByName(slot0, slot6[1]) then
			slot9:setString(TI18N(slot6[2] or ""));
		end
	end
end

function showAttrChangeAni(slot0, slot1, slot2)
	if not slot0 or tolua.isnull(slot0) then
		return
	end

	if not slot0.effect_widget then
		slot0.effect_widget = ccui.Widget:create();

		slot0.effect_widget:setCascadeOpacityEnabled(true);
		slot0.effect_widget:setAnchorPoint(0, 0);
		slot0:addChild(slot0.effect_widget, slot2 or 2);

		slot0.level_label_list = {};
		slot3 = 25;

		for slot8 = 1, 4 do
			slot0.level_label_list[slot8] = createLabel(20, cc.c3b(72, 244, 80), cc.c3b(0, 0, 0), -40, 50 - slot3 * (slot8 - 1) - slot3 * 0.5, "", slot0.effect_widget, 2, cc.p(0, 0.5));
		end
	end

	for slot7, slot8 in ipairs({
		"atk",
		"hp_max",
		"def",
		"speed"
	}) do
		if slot0.level_label_list[slot7] then
			slot0.level_label_list[slot7]:setString(string.format("%s + %s", Config.AttrData.data_key_to_name[slot8], slot1[slot8]));
		end
	end

	slot0.effect_widget:setVisible(true);
	slot0.effect_widget:stopAllActions();
	slot0.effect_widget:setPosition(-80, 0);
	slot0.effect_widget:setOpacity(10);
	slot0.effect_widget:runAction(cc.Sequence:create(cc.Spawn:create(cc.MoveTo:create(0.2, cc.p(0, 0)), cc.FadeIn:create(0.2)), cc.EaseSineOut:create(cc.MoveTo:create(0.4, cc.p(0, 10))), cc.CallFunc:create(function ()
		uv0.effect_widget:setVisible(false);
	end)));
end

function isVestPackage()
	if IS_SPECIAL_UNION_CHANNEL == true then
		return true
	elseif IS_SY_UNION_SDK == true and (device.getChannel() == "46_1" or slot0 == "47_9" or slot0 == "16_30" or slot0 == "59_1" or slot0 == "60_1" or slot0 == "61_1" or slot0 == "63_1") then
		return true
	end

	return false
end

function signProto(slot0)
	return cc.CCGameLib:getInstance():logsign(string.format("sszg_key_%s", slot0))
end

function getVersionDesc()
	slot0 = math.floor(MAIN_VERSION / 100);

	return string.format("%s.%s", slot0, math.floor((MAIN_VERSION - slot0 * 100) / 10))
end

function checkUserProto(slot0)
	return false
end

function commonDumpConfigData(slot0, slot1)
	slot2 = string.format;

	if Config.CombatHaloData then
		slot6 = slot0;
		slot7 = "---------------------";

		print("-------------打印表数据: Config." .. slot6 .. slot7);

		for slot6, slot7 in pairs(Config[slot0]) do
			if type(slot7) == "table" then
				slot12 = "Config.%s.%s = {";

				print(slot2(slot12, slot0, slot6));

				for slot11, slot12 in pairs(slot7) do
					if type(slot12) ~= "table" then
						print(slot2("[%s] = %s"));
					else
						slot13 = true;

						for slot17, slot18 in pairs(slot12) do
							if type(slot18) ~= "table" then
								slot13 = false;

								break
							end
						end

						if not slot13 then
							print(slot2("[%s] = %s", slot11, commonGetConfigLine(slot12)));
						end
					end
				end

				print("}");
			end
		end
	else
		print("找不到配置名字: " .. slot0);
	end
end

function commonGetConfigLine(slot0)
	slot1 = "{";

	for slot5, slot6 in pairs(slot0) do
		slot1 = type(slot6) == "table" and slot1 .. commonGetConfigLine(slot6) or slot1 .. commonGetConfigLine(slot6) .. slot5 .. "=" .. slot6 .. ", ";
	end

	return slot1 .. "}"
end

function canAddScannig()
	if CAN_ADD_SCANNING == true then
		if LoginController:getInstance():getModel():getLoginData() == nil or slot0.usrName == "" then
			return false
		end

		slot1 = Config.QrcodeData.data_acc[slot0.usrName];

		Debug.info(slot1);

		return slot1 == TRUE
	else
		return false
	end
end

function isQingmingShield(slot0)
	if is_qingming_shield then
		if not slot0 then
			message("功能维护中，暂时关闭，请谅解");
		end

		return true
	else
		return false
	end
end

function setQingmingShield(slot0)
	is_qingming_shield = slot0;
end

function needMourning()
	return false
end
