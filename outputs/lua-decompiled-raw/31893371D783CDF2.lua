slot0 = false
slot1 = nil
slot2 = -1
slot3 = {
	1,
	1,
	1,
	1
}
slot4 = -1
slot5 = 1
slot6 = "ShaderPosition_uColor"
slot7 = cc.Application:getInstance():getTargetPlatform()

function slot8()
	if not uv0 then
		uv1 = cc.ShaderCache:getInstance():getProgram(uv2)

		if uv1 ~= nil then
			uv3 = gl.getUniformLocation(uv1:getProgram(), "u_color")
			uv4 = gl.getUniformLocation(uv1:getProgram(), "u_pointSize")
			dp_Initialized = true
		end
	end

	if uv1 == nil then
		print("Error:dp_shader is nil!")

		return false
	end

	return true
end

function slot9()
	gl.glEnableVertexAttribs(CCConstants.VERTEX_ATTRIB_FLAG_POSITION)
	uv0:use()
	uv0:setUniformsForBuiltins()
	uv0:setUniformLocationWith4fv(uv1, uv2, 1)
end

function ccDrawInit()
	uv0()
end

function ccDrawFree()
	uv0 = false
end

function ccDrawColor4f(slot0, slot1, slot2, slot3)
	uv0[1] = slot0
	uv0[2] = slot1
	uv0[3] = slot2
	uv0[4] = slot3
end

function ccPointSize(slot0)
	uv0 = slot0 * cc.Director:getInstance():getContentScaleFactor()
end

function ccDrawColor4B(slot0, slot1, slot2, slot3)
	uv0[1] = slot0 / 255
	uv0[2] = slot1 / 255
	uv0[3] = slot2 / 255
	uv0[4] = slot3 / 255
end

function ccDrawPoint(slot0)
	if not uv0() then
		return
	end

	function ()
		uv0.buffer_id = gl.createBuffer()

		gl.bindBuffer(gl.ARRAY_BUFFER, uv0.buffer_id)
		gl.bufferData(gl.ARRAY_BUFFER, 2, {
			uv1.x,
			uv1.y
		}, gl.STATIC_DRAW)
		gl.bindBuffer(gl.ARRAY_BUFFER, 0)
	end()
	uv1()
	uv2:setUniformLocationWith1f(uv3, uv4)
	gl.bindBuffer(gl.ARRAY_BUFFER, ({}).buffer_id)
	gl.vertexAttribPointer(CCConstants.VERTEX_ATTRIB_POSITION, 2, gl.FLOAT, false, 0, 0)
	gl.drawArrays(gl.POINTS, 0, 1)
	gl.bindBuffer(gl.ARRAY_BUFFER, 0)
end

function ccDrawPoints(slot0, slot1)
	if not uv0() then
		return
	end

	slot3 = 1

	function ()
		uv0.buffer_id = gl.createBuffer()

		gl.bindBuffer(gl.ARRAY_BUFFER, uv0.buffer_id)

		for slot4 = 1, uv1 do
		end

		gl.bufferData(gl.ARRAY_BUFFER, uv1 * 2, {
			[2 * slot4 - 1] = uv2[slot4].x,
			[2 * slot4] = uv2[slot4].y
		}, gl.STATIC_DRAW)
		gl.bindBuffer(gl.ARRAY_BUFFER, 0)
	end()
	uv1()
	uv2:setUniformLocationWith1f(uv3, uv4)
	gl.bindBuffer(gl.ARRAY_BUFFER, ({}).buffer_id)
	gl.vertexAttribPointer(CCConstants.VERTEX_ATTRIB_POSITION, 2, gl.FLOAT, false, 0, 0)
	gl.drawArrays(gl.POINTS, 0, slot1)
	gl.bindBuffer(gl.ARRAY_BUFFER, 0)
end

function ccDrawLine(slot0, slot1)
	if not uv0() then
		return
	end

	function ()
		uv0.buffer_id = gl.createBuffer()

		gl.bindBuffer(gl.ARRAY_BUFFER, uv0.buffer_id)
		gl.bufferData(gl.ARRAY_BUFFER, 4, {
			uv1.x,
			uv1.y,
			uv2.x,
			uv2.y
		}, gl.STATIC_DRAW)
		gl.bindBuffer(gl.ARRAY_BUFFER, 0)
	end()
	uv1()
	gl.bindBuffer(gl.ARRAY_BUFFER, ({}).buffer_id)
	gl.vertexAttribPointer(CCConstants.VERTEX_ATTRIB_POSITION, 2, gl.FLOAT, false, 0, 0)
	gl.drawArrays(gl.LINES, 0, 2)
	gl.bindBuffer(gl.ARRAY_BUFFER, 0)
end

function ccDrawPoly(slot0, slot1, slot2)
	if not uv0() then
		return
	end

	slot4 = 1

	function ()
		uv0.buffer_id = gl.createBuffer()

		gl.bindBuffer(gl.ARRAY_BUFFER, uv0.buffer_id)

		for slot4 = 1, uv1 do
		end

		gl.bufferData(gl.ARRAY_BUFFER, uv1 * 2, {
			[2 * slot4 - 1] = uv2[slot4].x,
			[2 * slot4] = uv2[slot4].y
		}, gl.STATIC_DRAW)
		gl.bindBuffer(gl.ARRAY_BUFFER, 0)
	end()
	uv1()
	gl.bindBuffer(gl.ARRAY_BUFFER, ({}).buffer_id)
	gl.vertexAttribPointer(CCConstants.VERTEX_ATTRIB_POSITION, 2, gl.FLOAT, false, 0, 0)

	if slot2 then
		gl.drawArrays(gl.LINE_LOOP, 0, slot1)
	else
		gl.drawArrays(gl.LINE_STRIP, 0, slot1)
	end

	gl.bindBuffer(gl.ARRAY_BUFFER, 0)
end

function ccDrawSolidPoly(slot0, slot1, slot2)
	if not uv0() then
		return
	end

	slot4 = 1

	function ()
		uv0.buffer_id = gl.createBuffer()

		gl.bindBuffer(gl.ARRAY_BUFFER, uv0.buffer_id)

		for slot4 = 1, uv1 do
		end

		gl.bufferData(gl.ARRAY_BUFFER, uv1 * 2, {
			[2 * slot4 - 1] = uv2[slot4].x,
			[2 * slot4] = uv2[slot4].y
		}, gl.STATIC_DRAW)
		gl.bindBuffer(gl.ARRAY_BUFFER, 0)
	end()
	gl.glEnableVertexAttribs(CCConstants.VERTEX_ATTRIB_FLAG_POSITION)
	uv1:use()
	uv1:setUniformsForBuiltins()
	uv1:setUniformLocationWith4fv(uv2, slot2, 1)
	gl.bindBuffer(gl.ARRAY_BUFFER, ({}).buffer_id)
	gl.vertexAttribPointer(CCConstants.VERTEX_ATTRIB_POSITION, 2, gl.FLOAT, false, 0, 0)
	gl.drawArrays(gl.TRIANGLE_FAN, 0, slot1)
	gl.bindBuffer(gl.ARRAY_BUFFER, 0)
end

function ccDrawRect(slot0, slot1)
	ccDrawLine(CCPoint:__call(slot0.x, slot0.y), CCPoint:__call(slot1.x, slot0.y))
	ccDrawLine(CCPoint:__call(slot1.x, slot0.y), CCPoint:__call(slot1.x, slot1.y))
	ccDrawLine(CCPoint:__call(slot1.x, slot1.y), CCPoint:__call(slot0.x, slot1.y))
	ccDrawLine(CCPoint:__call(slot0.x, slot1.y), CCPoint:__call(slot0.x, slot0.y))
end

function ccDrawSolidRect(slot0, slot1, slot2)
	ccDrawSolidPoly({
		slot0,
		CCPoint:__call(slot1.x, slot0.y),
		slot1,
		CCPoint:__call(slot0.x, slot1.y)
	}, 4, slot2)
end

function ccDrawCircleScale(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if not uv0() then
		return
	end

	if slot4 then
		slot7 = 1 + 1
	end

	function ()
		slot1 = 1
		uv1.buffer_id = gl.createBuffer()
		slot6 = uv1.buffer_id

		gl.bindBuffer(gl.ARRAY_BUFFER, slot6)

		for slot6 = 1, uv0 + 1 do
			slot7 = (slot6 - 1) * 2 * math.pi / uv0
		end

		gl.bufferData(gl.ARRAY_BUFFER, (uv0 + 2) * 2, {
			[slot6 * 2 - 1] = uv2 * math.cos(slot7 + uv3) * uv4 + uv5.x,
			[slot6 * 2] = uv2 * math.sin(slot7 + uv3) * uv6 + uv5.y,
			[(uv0 + 2) * 2 - 1] = uv5.x,
			[(uv0 + 2) * 2] = uv5.y
		}, gl.STATIC_DRAW)
		gl.bindBuffer(gl.ARRAY_BUFFER, 0)
	end()
	uv1()
	gl.bindBuffer(gl.ARRAY_BUFFER, ({}).buffer_id)
	gl.vertexAttribPointer(CCConstants.VERTEX_ATTRIB_POSITION, 2, gl.FLOAT, false, 0, 0)
	gl.drawArrays(gl.LINE_STRIP, 0, slot3 + slot7)
	gl.bindBuffer(gl.ARRAY_BUFFER, 0)
end

function ccDrawCircle(slot0, slot1, slot2, slot3, slot4)
	ccDrawCircleScale(slot0, slot1, slot2, slot3, slot4, 1, 1)
end

function ccDrawSolidCircle(slot0, slot1, slot2, slot3, slot4, slot5)
	if not uv0() then
		return
	end

	function ()
		slot1 = 1
		uv1.buffer_id = gl.createBuffer()
		slot6 = uv1.buffer_id

		gl.bindBuffer(gl.ARRAY_BUFFER, slot6)

		for slot6 = 1, uv0 + 1 do
			slot7 = (slot6 - 1) * 2 * math.pi / uv0
		end

		gl.bufferData(gl.ARRAY_BUFFER, (uv0 + 2) * 2, {
			[slot6 * 2 - 1] = uv2 * math.cos(slot7 + uv3) * uv4 + uv5.x,
			[slot6 * 2] = uv2 * math.sin(slot7 + uv3) * uv6 + uv5.y,
			[(uv0 + 2) * 2 - 1] = uv5.x,
			[(uv0 + 2) * 2] = uv5.y
		}, gl.STATIC_DRAW)
		gl.bindBuffer(gl.ARRAY_BUFFER, 0)
	end()
	uv1()
	gl.bindBuffer(gl.ARRAY_BUFFER, ({}).buffer_id)
	gl.vertexAttribPointer(CCConstants.VERTEX_ATTRIB_POSITION, 2, gl.FLOAT, false, 0, 0)
	gl.drawArrays(gl.TRIANGLE_FAN, 0, slot3 + 1)
	gl.bindBuffer(gl.ARRAY_BUFFER, 0)
end

function ccDrawQuadBezier(slot0, slot1, slot2, slot3)
	if not uv0() then
		return
	end

	function ()
		slot1 = 1
		slot2 = 0

		for slot6 = 1, uv0 do
			slot2 = slot2 + 1 / uv0
		end

		uv4.buffer_id = gl.createBuffer()

		gl.bindBuffer(gl.ARRAY_BUFFER, uv4.buffer_id)
		gl.bufferData(gl.ARRAY_BUFFER, (uv0 + 1) * 2, {
			[2 * slot6 - 1] = math.pow(1 - slot2, 2) * uv1.x + 2 * (1 - slot2) * slot2 * uv2.x + slot2 * slot2 * uv3.x,
			[2 * slot6] = math.pow(1 - slot2, 2) * uv1.y + 2 * (1 - slot2) * slot2 * uv2.y + slot2 * slot2 * uv3.y,
			[2 * (uv0 + 1) - 1] = uv3.x,
			[2 * (uv0 + 1)] = uv3.y
		}, gl.STATIC_DRAW)
		gl.bindBuffer(gl.ARRAY_BUFFER, 0)
	end()
	uv1()
	gl.bindBuffer(gl.ARRAY_BUFFER, ({}).buffer_id)
	gl.vertexAttribPointer(CCConstants.VERTEX_ATTRIB_POSITION, 2, gl.FLOAT, false, 0, 0)
	gl.drawArrays(gl.LINE_STRIP, 0, slot3 + 1)
	gl.bindBuffer(gl.ARRAY_BUFFER, 0)
end

function ccDrawCubicBezier(slot0, slot1, slot2, slot3, slot4)
	if not uv0 then
		return
	end

	function ()
		slot1 = 0
		slot2 = 1

		for slot6 = 1, uv0 do
			slot1 = slot1 + 1 / uv0
		end

		uv5.buffer_id = gl.createBuffer()

		gl.bindBuffer(gl.ARRAY_BUFFER, uv5.buffer_id)
		gl.bufferData(gl.ARRAY_BUFFER, (uv0 + 1) * 2, {
			[2 * slot6 - 1] = math.pow(1 - slot1, 3) * uv1.x + 3 * math.pow(1 - slot1, 2) * slot1 * uv2.x + 3 * (1 - slot1) * slot1 * slot1 * uv3.x + slot1 * slot1 * slot1 * uv4.x,
			[2 * slot6] = math.pow(1 - slot1, 3) * uv1.y + 3 * math.pow(1 - slot1, 2) * slot1 * uv2.y + 3 * (1 - slot1) * slot1 * slot1 * uv3.y + slot1 * slot1 * slot1 * uv4.y,
			[2 * (uv0 + 1) - 1] = uv4.x,
			[2 * (uv0 + 1)] = uv4.y
		}, gl.STATIC_DRAW)
		gl.bindBuffer(gl.ARRAY_BUFFER, 0)
	end()
	uv1()
	gl.bindBuffer(gl.ARRAY_BUFFER, ({}).buffer_id)
	gl.vertexAttribPointer(CCConstants.VERTEX_ATTRIB_POSITION, 2, gl.FLOAT, false, 0, 0)
	gl.drawArrays(gl.LINE_STRIP, 0, slot4 + 1)
	gl.bindBuffer(gl.ARRAY_BUFFER, 0)
end
