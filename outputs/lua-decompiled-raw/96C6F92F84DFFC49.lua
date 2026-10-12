Debug = Debug or {}

function Debug.trace(...)
	if not DEBUG then
		return
	end

	print(debug.traceback(), ...)
end

function Debug.log(...)
	if not DEBUG then
		return
	end

	Debug.print("debug", true, ...)
end

function Debug.socket(slot0, ...)
	if not SOCKET_DEBUG then
		return
	end

	if not slot0 then
		return
	end

	if slot0 == 1169 then
		return
	end

	if slot0 == 10204 then
		return
	end

	if type(SOCKET_DEBUG) == "number" and SOCKET_DEBUG >= 100 and slot0 ~= SOCKET_DEBUG and math.floor(slot0 / 100) ~= SOCKET_DEBUG then
		return
	end

	Debug.print("socket", SOCKET_DEBUG ~= 1, os.time(), ...)
end

function Debug.info(...)
	Debug.print("info", true, ...)
end

function Debug.error(...)
	Debug.print("error", true, ...)
end

function Debug.is_true(slot0, ...)
	if not DEBUG or not slot0 then
		return
	end

	Debug.print("cond", true, ...)
end

function Debug.print(slot0, slot1, ...)
	slot2 = slot0 and "[" .. slot0 .. "]" .. Debug.track_info(4) or ""

	if slot1 then
		slot3 = {}

		for slot7, slot8 in pairs({
			...
		}) do
			if type(slot8) == "table" then
				if #slot3 > 0 then
					print(slot2, unpack(slot3))

					slot3 = {}
				end

				print("↓--" .. slot2 .. "--↓")
				Debug.printTable(slot8)
				print("↑--" .. slot2 .. "--↑")
			else
				slot3[slot7] = slot8
			end
		end

		if #slot3 > 0 then
			print(slot2, unpack(slot3))
		end
	else
		print(slot2, ...)
	end
end

function Debug.printParent(slot0)
	print(Debug.track_info(slot0))
end

function Debug.track_info(slot0)
	return string.format("%s:%d(%s): ", string.match(debug.getinfo(slot0 or 2, "Sln").short_src, "[^\"\\]+.lua") or "nil", slot1.currentline, slot1.name or "")
end

function Debug.printTable(slot0, slot1)
	slot1 = slot1 or 0

	for slot5, slot6 in pairs(slot0) do
		slot7 = ""
		TypeV = type(slot6)

		if TypeV == "table" then
			slot7 = "{"
		end

		formatting = string.rep(" ", slot1) .. slot5 .. " = " .. slot7

		if TypeV == "table" then
			print(formatting)
			Debug.printTable(slot6, slot1 + 1)
			print(slot8 .. "},")
		else
			slot9 = ""

			print(formatting .. ((TypeV ~= "string" or string.format("%q", slot6)) and tostring(slot6)) .. ",")
		end
	end
end
