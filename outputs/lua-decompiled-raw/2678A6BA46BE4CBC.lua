slot0 = class("AppBase")

function slot0.ctor(slot0, slot1)
	slot0.configs_ = {
		viewsRoot = "app.views",
		defaultSceneName = "MainScene",
		modelsRoot = "app.models"
	}

	for slot5, slot6 in pairs(slot1 or {}) do
		slot0.configs_[slot5] = slot6
	end

	if type(slot0.configs_.viewsRoot) ~= "table" then
		slot0.configs_.viewsRoot = {
			slot0.configs_.viewsRoot
		}
	end

	if type(slot0.configs_.modelsRoot) ~= "table" then
		slot0.configs_.modelsRoot = {
			slot0.configs_.modelsRoot
		}
	end

	if DEBUG > 1 then
		dump(slot0.configs_, "AppBase configs")
	end

	cc.Director:getInstance():setDisplayStats(CC_SHOW_FPS)
	slot0:onCreate()
end

function slot0.run(slot0, slot1)
	slot0:enterScene(slot1 or slot0.configs_.defaultSceneName)
end

function slot0.enterScene(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot0:createView(slot1)

	slot5:showWithScene(slot2, slot3, slot4)

	return slot5
end

function slot0.createView(slot0, slot1)
	for slot5, slot6 in ipairs(slot0.configs_.viewsRoot) do
		slot7 = string.format("%s.%s", slot6, slot1)
		slot8, slot9 = xpcall(function ()
			return require(uv0)
		end, function (slot0)
			if not string.find(slot0, string.format("'%s' not found:", uv0)) then
				print("load view error: ", slot0)
			end
		end)
		slot10 = type(slot9)

		if slot8 and (slot10 == "table" or slot10 == "userdata") then
			return slot9:create(slot0, slot1)
		end
	end

	error(string.format("AppBase:createView() - not found view \"%s\" in search paths \"%s\"", slot1, table.concat(slot0.configs_.viewsRoot, ",")), 0)
end

function slot0.onCreate(slot0)
end

return slot0
