if type(DEBUG) ~= "number" then
	DEBUG = 0
end

printInfo("")
printInfo("# DEBUG                        = " .. DEBUG)
printInfo("#")

device = require("cocos.framework.device")
display = require("cocos.framework.display")
audio = require("cocos.framework.audio")
transition = require("cocos.framework.transition")

require("cocos.framework.extends.NodeEx")
require("cocos.framework.extends.SpriteEx")
require("cocos.framework.extends.LayerEx")
require("cocos.framework.extends.MenuEx")

if ccui then
	require("cocos.framework.extends.UIWidget")
	require("cocos.framework.extends.UICheckBox")
	require("cocos.framework.extends.UIEditBox")
	require("cocos.framework.extends.UIListView")
	require("cocos.framework.extends.UIPageView")
	require("cocos.framework.extends.UIScrollView")
	require("cocos.framework.extends.UISlider")
	require("cocos.framework.extends.UITextField")
end

require("cocos.framework.package_support")
cc.register("event", require("cocos.framework.components.event"))

slot0 = _G
cc.exports = {}

setmetatable(cc.exports, {
	__newindex = function (slot0, slot1, slot2)
		rawset(uv0, slot1, slot2)
	end,
	__index = function (slot0, slot1)
		return rawget(uv0, slot1)
	end
})

function cc.disable_global()
	setmetatable(uv0, {
		__newindex = function (slot0, slot1, slot2)
			error(string.format("USE \" cc.exports.%s = value \" INSTEAD OF SET GLOBAL VARIABLE", slot1), 0)
		end
	})
end

if CC_DISABLE_GLOBAL then
	cc.disable_global()
end
