RedpointConst = RedpointConst or {}
slot0 = 0

function slot1(slot0)
	if slot0 then
		uv0 = slot0

		return uv0
	else
		uv0 = uv0 + 1

		return uv0
	end
end

RedpointConst.tequan_libao = slot1(1)
RedpointConst.tequan_libao1 = slot1()
RedpointConst.chongzhi = slot1()
RedpointConst.chelunzhan_all = slot1()
RedpointConst.chelunzhan_reward = slot1()
RedpointConst.free_gift = slot1()
RedpointConst.stronger = slot1()
RedpointConst.partner_bag = slot1()
RedpointConst.emoguoshi = slot1()
RedpointConst.emoguoshi_zhanling = slot1()
RedpointConst.emoguoshi_all = slot1()
RedpointConst.jiyou_group_skill = slot1()
RedpointConst.jiyou_touzhi = slot1()
RedpointConst.jiyou_tiaozhan = slot1()
RedpointConst.jiyou_taofa = slot1()
RedpointConst.jiyou_choujiang = slot1()
RedpointConst.jiyou_all = slot1()
RedpointConst.yanjiusuo = slot1()
RedpointConst.ziyuanzhaohui = slot1()
RedpointConst.one_get_map = {
	[RedpointConst.tequan_libao] = function (...)
		if VipController:getInstance():isCanBuyVipTeQuanLiBao() then
			return 1
		end

		return 0
	end,
	[RedpointConst.chelunzhan_reward] = function (...)
		if WheelBattleController:getInstance():checkHaveReward() then
			return 1
		end

		return 0
	end,
	[RedpointConst.free_gift] = function (...)
		if ActionController:getInstance():getFreeGiftTag() <= 0 then
			return 1
		end

		return 0
	end,
	[RedpointConst.stronger] = function (...)
		if ActionController:getInstance():isHaveHeroStrongerReward() then
			return 1
		end

		return 0
	end,
	[RedpointConst.emoguoshi] = function (...)
		return 0
	end,
	[RedpointConst.emoguoshi_zhanling] = function (...)
		if EmoguoshiController:getInstance():isHaveZhanLingReward() then
			return 1
		end

		return 0
	end,
	[RedpointConst.jiyou_group_skill] = function (...)
		if stampAlbumController:getInstance():isCanUp() then
			return 1
		end

		return 0
	end,
	[RedpointConst.jiyou_touzhi] = function (...)
		if stampAlbumController:getInstance():isCanTouZhi() then
			return 1
		end

		return 0
	end,
	[RedpointConst.jiyou_tiaozhan] = function (...)
		if stampAlbumController:getInstance():isCanTiaoZhan() then
			return 1
		end

		return 0
	end,
	[RedpointConst.jiyou_choujiang] = function (...)
		if stampAlbumController:getInstance():isHaveFreeRandom() then
			return 1
		end

		return 0
	end,
	[RedpointConst.yanjiusuo] = function (...)
		if YanJiuSuoController:getInstance():isCanUp() then
			return 1
		end

		return 0
	end,
	[RedpointConst.ziyuanzhaohui] = function (...)
		if ZiYuanZhaoHuiController:getInstance():isCanGet() then
			return 1
		end

		return 0
	end
}
RedpointConst.combination_map = {
	[RedpointConst.jiyou_taofa] = {
		RedpointConst.jiyou_touzhi,
		RedpointConst.jiyou_tiaozhan
	},
	[RedpointConst.chongzhi] = {
		RedpointConst.tequan_libao,
		RedpointConst.tequan_libao1
	},
	[RedpointConst.chelunzhan_all] = {
		RedpointConst.chelunzhan_reward
	},
	[RedpointConst.partner_bag] = {
		RedpointConst.stronger
	},
	[RedpointConst.emoguoshi_all] = {
		RedpointConst.emoguoshi,
		RedpointConst.emoguoshi_zhanling
	},
	[RedpointConst.jiyou_all] = {
		RedpointConst.jiyou_group_skill,
		RedpointConst.jiyou_touzhi,
		RedpointConst.jiyou_choujiang,
		RedpointConst.jiyou_tiaozhan
	}
}
