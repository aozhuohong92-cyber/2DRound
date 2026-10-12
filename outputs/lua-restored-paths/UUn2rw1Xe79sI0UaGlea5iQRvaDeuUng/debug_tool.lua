function xzy()
end

function cgq()
end

function lhp()
end

function lfl()
end

function wcy()
end

function zwx()
end

function wyy()
end

function mjb()
end

function fei()
end

function mjb(...)
	debug_Print("mjb", ...);
end

function gjj(...)
	debug_Print("gjj", ...);
end

function fei(...)
	debug_Print("fei", ...);
end

function childNum()
	slot0 = nil;
	slot1 = 0;
	slot2 = ViewManager:getInstance();

	for slot7, slot8 in pairs({
		{
			"scene_layer ",
			slot2.scene_layer
		},
		{
			"effect_layer",
			slot2.effect_layer
		},
		{
			"ui_layer    ",
			slot2.ui_layer
		},
		{
			"top_layer   ",
			slot2.top_layer
		},
		{
			"buttom_layer",
			slot2.buttom_layer
		},
		{
			"msg_layer   ",
			slot2.msg_layer
		},
		{
			"gm_layer    ",
			slot2.gm_layer
		}
	}) do
		(function (slot0)
			if slot0:getChildren() and #slot1 > 0 then
				uv0 = uv0 + #slot1;

				for slot5, slot6 in pairs(slot1) do
					slot6.is_add = true;

					uv1(slot6);
				end
			elseif slot0.is_add == nil then
				uv0 = uv0 + 1;
			end

			if #slot1 > 100 then
				print("all_child", #slot1, getCCName(slot0), tolua.isnull(slot0), slot0.getString and slot0:getString());
			end
		end)(slot8[2]);
		print(slot8[1] .. "層孩子數:" .. 0);
	end
end

function showAll()
	slot0 = 0;
	slot1 = nil;
	slot2 = ViewManager:getInstance();

	for slot7, slot8 in pairs({
		{
			"scene_layer ",
			slot2.scene_layer
		},
		{
			"effect_layer",
			slot2.effect_layer
		},
		{
			"ui_layer    ",
			slot2.ui_layer
		},
		{
			"top_layer   ",
			slot2.top_layer
		},
		{
			"buttom_layer",
			slot2.buttom_layer
		},
		{
			"msg_layer   ",
			slot2.msg_layer
		},
		{
			"gm_layer    ",
			slot2.gm_layer
		}
	}) do
		(function (slot0)
			if slot0:getChildren() and #slot1 > 0 then
				uv0 = uv0 + #slot1;

				for slot5, slot6 in pairs(slot1) do
					slot6.is_add = true;

					uv1(slot6);
				end
			else
				slot0:setVisible(true);

				if slot0.is_add == nil then
					uv0 = uv0 + 1;
				end

				if slot0.setBackGroundColorOpacity then
					showLayoutRect(slot0);
				end
			end
		end)(slot8[2]);
		print(slot8[1] .. "層孩子數:" .. 0);
	end
end

function debug_Print(slot0, ...)
	printParent(4);

	slot4 = slot0;
	slot5 = "----print--------↓";

	print("↓--------" .. slot4 .. slot5);

	for slot4, slot5 in pairs({
		...
	}) do
		if type(slot5) == "table" then
			printLuaTable(slot5);
		else
			print(slot5);
		end
	end

	print("↑--------" .. slot0 .. "----print--------↑");
end

function print_log(...)
	print(string.format(...));

	if PLATFORM_NAME == "demo" or PLATFORM_NAME == "release" or PLATFORM_NAME == "release2" then
		ErrorMessage.show(slot0);
	end
end

slot0 = error;

function error(...)
	print_log(string.format(...));
	uv0(string.format(...));
end

function simpleTrace(slot0)
	slot1, slot2 = string.find(slot0, "[_a-z]+.luac?\"]:?%d*");

	if slot1 and slot2 then
		slot3 = string.sub(slot0, slot1, slot2);

		return string.format("|%s,%s%s", string.sub(slot3, string.find(slot3, "[_a-z]+")), string.sub(slot3, string.find(slot3, "%d+")), simpleTrace(string.gsub(slot0, slot3, "")))
	else
		return ""
	end
end

function simleLogErrorMsg(slot0, slot1)
	slot2, slot3 = string.find(slot0, "[_a-z]+.lua");

	return string.gsub(string.sub(slot0, slot2), "\"]", "") .. simpleTrace(slot1)
end

__error_log = {};

function writeErrorLog(slot0, slot1)
	if debugger or __error_log[slot0] then
		return
	end

	__error_log[slot0] = true;

	if buglyReportLuaException then
		buglyReportLuaException(slot0, slot1);
	elseif ProtocalRulesMgr then
		Send(10999, {
			msg = simleLogErrorMsg(slot0, slot1)
		});
	else
		print(slot0);
	end

	return true
end

function sendErrorToSrv(slot0)
	if not GameNet:getInstance():IsServerConnect() or __error_log[slot0] then
		return
	end

	__error_log[slot0] = true;

	Send(10999, {
		msg = "" .. "-------------------------------------------------\n" .. "now_ver: " .. now_ver() .. "\n" .. "LUA ERROR: " .. slot0 .. "\n" .. "-------------------------------------------------\n" .. debug.traceback() .. "\n" .. "-------------------------------------------------\n"
	});
end

function __G__TRACKBACK__(slot0)
	slot1 = slot0;
	slot2 = debug.traceback();

	if writeErrorLog(slot1, slot2) then
		print_log("" .. "-------------------------------------------------\n" .. "LUA ERROR: " .. slot1 .. "\n" .. "-------------------------------------------------\n" .. slot2 .. "\n" .. "-------------------------------------------------\n");
	elseif debugger then
		print_log(slot3);
	end

	if SHOW_ERROR then
		error(slot3);
	end
end
