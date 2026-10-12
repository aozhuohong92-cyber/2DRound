slot0 = {};

function slot1(slot0)
	slot1 = {};
	slot2 = false;
	slot1.__init = slot2;
	slot2 = false;
	slot1.__delete = slot2;
	slot1.super = slot0;

	function slot2(...)
		slot0 = {};
		slot1 = uv0;
		slot0._class_type = slot1;
		slot1 = setmetatable;
		slot3 = slot0;
		slot4 = {};
		slot5 = uv1;
		slot6 = uv0;
		slot5 = slot5[slot6];
		slot4.__index = slot5;

		slot1(slot3, slot4);

		slot1 = nil;

		function slot1(slot0, ...)
			slot1 = slot0.super;

			if slot1 then
				slot1 = uv0;
				slot3 = slot0.super;

				slot1(slot3, ...);
			end

			slot1 = slot0.__init;

			if slot1 then
				slot1 = slot0.__init;
				slot3 = uv1;

				slot1(slot3, ...);
			end
		end

		slot2 = slot1;
		slot4 = uv0;

		slot2(slot4, ...);

		function slot1(slot0)
			slot1 = slot0._class_type;

			while slot1 ~= nil do
				slot2 = slot1.__delete;

				if slot2 then
					slot2 = slot1.__delete;
					slot4 = slot0;

					slot2(slot4);
				end

				slot1 = slot1.super;
			end
		end

		slot0.DeleteMe = slot1;

		return slot0
	end

	slot1.New = slot2;
	slot2 = {};
	slot3 = uv0;
	slot3[slot1] = slot2;
	slot3 = setmetatable;
	slot5 = slot1;
	slot6 = {};

	function slot7(slot0, slot1, slot2)
		slot3 = uv0;
		slot3[slot1] = slot2;
	end

	slot6.__newindex = slot7;
	slot6.__index = slot2;

	slot3(slot5, slot6);

	if slot0 then
		slot3 = setmetatable;
		slot5 = slot2;
		slot6 = {};

		function slot7(slot0, slot1)
			slot2 = uv0;
			slot3 = uv1;
			slot2 = slot2[slot3];

			if slot2 == nil or slot1 == nil then
				slot2 = {};

				return slot2
			end

			slot2 = uv0;
			slot3 = uv1;
			slot2 = slot2[slot3];
			slot2 = slot2[slot1];

			return slot2
		end

		slot6.__index = slot7;

		slot3(slot5, slot6);
	end

	return slot1
end

BaseClass = slot1;
slot1 = {};
slot2 = NewModelFile;
slot2 = slot2 or {};
slot3 = {};

setmetatable(_G, slot1);

function slot1.__index(slot0, slot1)
	slot2 = uv0[slot1];

	if slot2 and not uv1[slot2] then
		uv0[slot1] = nil;
		uv1[slot2] = true;
		slot3 = require(slot2);

		if type(slot3) == "boolean" then
			return _G[slot1]
		else
			return slot3
		end
	end
end

slot4 = {};
slot5 = {};
Config = Config or {};

setmetatable(_G.Config, slot4);

function slot4.__index(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = "Config_" .. slot1;
	slot3 = uv0[slot2];

	if slot3 and not uv1[slot3] then
		uv0[slot2] = nil;
		uv1[slot3] = true;
		slot4 = require(slot3);

		if type(slot4) == "boolean" then
			return _G.Config[slot1]
		else
			return slot4
		end
	end
end

function clearSuperClass()
	uv0 = {};
	uv1 = {};
	uv2 = {};
	uv3 = {};
	uv4 = {};
	uv5 = {};
end

function getSuperClass(slot0)
	return uv0[slot0]
end
