SoundEffect = class("SoundEffect", function ()
	return ccui.Widget:create()
end)

function SoundEffect.ctor(slot0)
	slot0:registerScriptHandler(function (slot0)
		if slot0 == "exit" and uv0.stop then
			uv0:stop()
		end
	end)

	slot5 = 0

	slot0:setAnchorPoint(slot5, 0)

	for slot5 = 1, 3 do
		slot0["record" .. slot5] = cc.Sprite:create(PathTool.getResFrame("mainui", "record" .. slot5))

		slot0["record" .. slot5]:setVisible(slot5 == 3)

		if slot5 ~= 3 then
			slot0["record" .. slot5]:setPositionY(2)
		end

		slot0:addChild(slot0["record" .. slot5])
	end

	slot0:setContentSize(slot0.record1:getContentSize())
end

function SoundEffect.play(slot0)
	slot1 = 1

	if not slot0.time_ticket then
		slot0.time_ticket = GlobalTimeTicket:getInstance():add(function ()
			if not uv0.record1 then
				if uv0.time_ticket then
					GlobalTimeTicket:getInstance():remove(uv0.time_ticket)

					uv0.time_ticket = nil
				end

				return
			end

			if uv1 > 3 then
				uv1 = 1
			end

			for slot3 = 1, 3 do
				uv0["record" .. slot3]:setVisible(slot3 == uv1)
			end

			uv1 = uv1 + 1
		end, 0.5, 0)
	end
end

function SoundEffect.stop(slot0)
	if slot0.time_ticket then
		slot0.bg:stopAllActions()
		GlobalTimeTicket:getInstance():remove(slot0.time_ticket)

		slot0.time_ticket = nil
	end
end

function SoundEffect.over(slot0)
	if tolua.isnull(slot0.record1) then
		return
	end

	for slot4 = 1, 3 do
		slot0["record" .. slot4]:setVisible(slot4 == 3)
	end

	if slot0.stop then
		slot0:stop()
	end
end
