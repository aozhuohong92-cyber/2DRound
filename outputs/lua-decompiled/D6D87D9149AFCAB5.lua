cc.FileUtils:getInstance():setPopupNotify(false)
require("config_init")

if not pcall(function ()
	require("config")
end) then
	require("config_demo")
end

package.path = package.path .. ";./src/?.lua"

require("cocos.init")

SCREEN_WIDTH = CC_DESIGN_RESOLUTION.width
SCREEN_HEIGHT = CC_DESIGN_RESOLUTION.height

function main()
	collectgarbage("collect")
	collectgarbage("setpause", 100)
	collectgarbage("setstepmul", 5000)
	cc.Director:getInstance():getScheduler():setTimeScale(1)
	require("sdk_function")

	slot0 = require("file_update"):create()
	FileUpdate_Instance = slot0

	slot0:ver_load_start()
end

function scaleSpine(slot0)
	if Config.PartnerData.data_partner_star(slot0) ~= nil then
		m_res = slot1.res_id
		m_show_effect = slot1.show_effect

		if skin_id ~= nil and skin_id ~= 0 and Config.PartnerSkinData.data_skin_info_fun(skin_id) and slot2.res_id ~= nil and slot2.res_id ~= "" then
			m_res = slot2.res_id

			if m_show_effect ~= "" then
				m_show_effect = slot2.show_effect
			end
		end
	end

	if Config.BattleActData.data_get_model_show_scale[m_res] then
		return slot2 / 1000
	else
		return 1
	end
end

for slot4, slot5 in pairs(_G) do
	-- Nothing
end

_G.base = {
	[slot4] = true
}

main()
