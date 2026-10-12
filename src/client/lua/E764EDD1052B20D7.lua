function setDefaultlColor()
	cc.Texture2D:setDefaultAlphaPixelFormat(cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A8888)
end

function setSimpleColor()
	cc.Texture2D:setDefaultAlphaPixelFormat(cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A4444)
end

slot0 = deepCopy(ccui.EditBox.create)

function ccui.EditBox.create(...)
	slot0 = uv0(...)

	slot0:retain()

	return slot0
end

function printAllRes()
	for slot4, slot5 in pairs(_game_res_all) do
		print(slot4)

		slot0 = 0 + 1
	end

	print("资源总量:", slot0)
end

function writeAllRes()
	slot0 = io.open("all_res.txt", "w")

	for slot5, slot6 in pairs(_game_res_all) do
		print(slot5)

		slot1 = 0 + 1

		slot0:write(slot5 .. "\n")
	end

	print("资源总量:", slot1)
	slot0:close()
end
