PlatformPanel = class("PlatformPanel", function ()
	return ccui.Widget:create()
end)

function PlatformPanel.ctor(slot0, slot1, slot2)
	slot0.ctrl = slot2
	slot0.model = slot0.ctrl:getModel()
	slot0.data = slot0.model:getLoginData()
	slot0.ip = slot0.data.ip
	slot0.port = slot0.data.port
	slot0.size = slot1 and slot1:getContentSize() or cc.size(SCREEN_WIDTH, SCREEN_HEIGHT)

	slot0:setAnchorPoint(cc.p(0, 0.5))
	slot0:setContentSize(slot0.size)
	slot0:configUI()
	slot0:setTouchEnabled(true)
end

function PlatformPanel.configUI(slot0)
	slot0:initEvent()
end

function PlatformPanel.initEvent(slot0)
	if MUTIL_LOGIN == 0 or not MUTIL_LOGIN then
		slot0:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended and PLATFORM_NAME ~= "icebird" and not IS_IOS_PLATFORM then
				LoginPlatForm:getInstance():login()
			end
		end)

		if not LoginPlatForm:getInstance():isLogin() then
			LoginPlatForm:getInstance():login()
		end
	elseif not LoginPlatForm:getInstance():isLogin() then
		LoginPlatForm:getInstance():login()
	end
end

function PlatformPanel.update(slot0)
end

function PlatformPanel.setMsg(slot0, slot1)
end

function PlatformPanel.effectHandler(slot0)
end

function PlatformPanel.DeleteMe(slot0)
end
