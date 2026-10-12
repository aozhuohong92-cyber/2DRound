cc.loaded_packages = {}
slot0 = cc.loaded_packages

function cc.register(slot0, slot1)
	cc.loaded_packages[slot0] = slot1
end

function cc.load(...)
	assert(#{
		...
	} > 0, "cc.load() - invalid package names")

	slot1 = {}

	for slot5, slot6 in ipairs(slot0) do
		assert(type(slot6) == "string", string.format("cc.load() - invalid package name \"%s\"", tostring(slot6)))

		if not uv0[slot6] then
			slot7 = string.format("packages.%s.init", slot6)
			slot8 = require(slot7)

			assert(slot8, string.format("cc.load() - package class \"%s\" load failed", slot7))

			uv0[slot6] = slot8

			if DEBUG > 1 then
				printInfo("cc.load() - load module \"packages.%s.init\"", slot6)
			end
		end

		slot1[#slot1 + 1] = uv0[slot6]
	end

	return unpack(slot1)
end

slot1 = cc.load
slot2 = nil

function cc.bind(slot0, ...)
	assert(type(slot0) == "table" or slot1 == "userdata", string.format("cc.bind() - invalid target, expected is object, actual is %s", slot1))
	assert(#{
		...
	} > 0, "cc.bind() - package names expected")
	uv0(...)

	if not slot0.components_ then
		slot0.components_ = {}
	end

	for slot6, slot7 in ipairs(slot2) do
		assert(type(slot7) == "string" and slot7 ~= "", string.format("cc.bind() - invalid package name \"%s\"", slot7))

		if not slot0.components_[slot7] then
			for slot12, slot13 in ipairs(uv1[slot7].depends or {}) do
				if not slot0.components_[slot13] then
					uv2(slot0, slot13)
				end
			end

			slot9 = slot8:create()
			slot0.components_[slot7] = slot9

			slot9:bind(slot0)
		end
	end

	return slot0
end

function cc.unbind(slot0, ...)
	if not slot0.components_ then
		return
	end

	assert(#{
		...
	} > 0, "cc.unbind() - invalid package names")

	for slot5, slot6 in ipairs(slot1) do
		assert(type(slot6) == "string" and slot6 ~= "", string.format("cc.unbind() - invalid package name \"%s\"", slot6))

		slot7 = slot0.components_[slot6]

		assert(slot7, string.format("cc.unbind() - component \"%s\" not found", tostring(slot6)))
		slot7:unbind(slot0)

		slot0.components_[slot6] = nil
	end

	return slot0
end

function cc.setmethods(slot0, slot1, slot2)
	for slot6, slot7 in ipairs(slot2) do
		slot8 = slot1[slot7]

		slot0[slot7] = function (slot0, ...)
			return uv0(uv1, ...)
		end
	end
end

function cc.unsetmethods(slot0, slot1)
	for slot5, slot6 in ipairs(slot1) do
		slot0[slot6] = nil
	end
end
