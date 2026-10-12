Config = Config or {}
Config.DramaData = Config.DramaData or {}
Config.DramaData.data_const_length = 7
Config.DramaData.data_const = {
	home_pet_dump_id = {
		val = 10350,
		key = "home_pet_dump_id",
		desc = "家园触发萌宠回归对应的id，跳过任意一个或完成最后一个触发萌宠回归"
	},
	home_pet_leap_id = {
		key = "home_pet_leap_id",
		desc = "家园触发萌宠回归对应的id，跳过任意一个或完成最后一个触发萌宠回归",
		val = {
			10330,
			10340
		}
	},
	delay_drama_id = {
		val = 10330,
		key = "delay_drama_id",
		desc = "该剧情延迟x秒播放，时间服务端固定"
	},
	heaven_world_lev = {
		val = 110,
		key = "heaven_world_lev",
		desc = "神装引导开启的世界等级区分（世界等级达到的瞬间，heaven_player_lev2≤玩家等级＜heaven_player_lev1 直接触发神装引导）"
	},
	heaven_player_lev1 = {
		val = 120,
		key = "heaven_player_lev1",
		desc = "世界等级＜heaven_world_lev，玩家按照该个人等级，开启神装引导"
	},
	heaven_player_lev2 = {
		val = 105,
		key = "heaven_player_lev2",
		desc = "世界等级≥heaven_world_lev，玩家按照该个人等级，开启神装引导"
	},
	guide_heavn_id = {
		key = "guide_heavn_id",
		desc = "神装穿戴引导，特殊使用了点击英雄顺序格子数，对应引导id必须填在这里",
		val = {
			10390,
			10400
		}
	}
}

function Config.DramaData.data_const_fun(slot0)
	slot1 = Config.DramaData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.DramaData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.DramaData.data_get_length = 102
Config.DramaData.data_get = {
	[10008] = {
		name = "开场黑幕",
		desc = "",
		is_switch = 0,
		bid = 10008,
		is_skip = 0,
		act = {
			{
				"unit_black",
				0,
				20,
				"300年前，&邪恶的魔族自黑暗中苏醒，&于危难之中，&伟大先知集齐传说中的五大神器，\n以驱逐恶魔未名，组建先知圣殿。&就在人类即将大获全胜之时，&恶魔之主发动了蓄谋已久的永夜祭典，&企图让永恒的黑暗降临世界。&先知以生命为代价，借助五大神器将之禁锢。&但魔主不死，黑暗不灭。&“唯有异界之人，方能驱逐黑暗”。&遵循着先知的最终预言，异界之门被打开，&大陆也迎来了新的冒险时代。",
				1.5,
				2
			}
		}
	},
	[10010] = {
		name = "开场对话",
		desc = "",
		is_switch = 0,
		bid = 10010,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"传说中<div fontcolor=#d95014>集齐失落神器</div>，重现诸神荣耀的勇者，你终于来了！",
				"d_1001"
			},
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"顺着神灵的指引，你一定可以再次<div fontcolor=#d95014>封印魔族，拯救冒险大陆</div>的！"
			},
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"现在，先告诉我你的名字吧~"
			}
		}
	},
	[10011] = {
		name = "月骑召唤引导",
		desc = "",
		is_switch = 0,
		bid = 10011,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10010
			}
		}
	},
	[10012] = {
		name = "月骑召唤对话",
		desc = "",
		is_switch = 0,
		bid = 10012,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"未来，这个名字必将传遍整个冒险大陆，但寻找失落神器之路一定会有很多艰难险阻！",
				"d_1025"
			},
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"你需要大陆上英雄们的帮助，现在就去召唤他们吧！"
			}
		}
	},
	[10030] = {
		name = "推图第一关引导",
		desc = "",
		is_switch = 0,
		bid = 10030,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10030
			}
		}
	},
	[10040] = {
		name = "领取通关奖励对话",
		desc = "",
		is_switch = 0,
		bid = 10040,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"通关一定关卡后就可以领取通关奖励啦！",
				"d_1006"
			}
		}
	},
	[10041] = {
		name = "领取通关奖励引导",
		desc = "",
		is_switch = 0,
		bid = 10041,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10040
			}
		}
	},
	[10050] = {
		name = "碎片合成对话",
		desc = "",
		is_switch = 0,
		bid = 10050,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"刚才的战斗中获得了英雄碎片，现在可以合成英雄啦~",
				"d_1007"
			}
		}
	},
	[10051] = {
		name = "碎片合成引导",
		desc = "",
		is_switch = 0,
		bid = 10051,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10050
			}
		}
	},
	[10060] = {
		name = "英雄升级对话",
		desc = "",
		is_switch = 0,
		bid = 10060,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"现在就让我们为英雄进行升级！",
				"d_1009"
			}
		}
	},
	[10061] = {
		name = "英雄升级引导",
		desc = "",
		is_switch = 0,
		bid = 10061,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10060
			}
		}
	},
	[10071] = {
		name = "装备穿戴引导",
		desc = "",
		is_switch = 0,
		bid = 10071,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10070
			}
		}
	},
	[10080] = {
		name = "推图第二关对话",
		desc = "",
		is_switch = 0,
		bid = 10080,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"实力大增，让我们继续前进吧！"
			}
		}
	},
	[10081] = {
		name = "推图第二关引导",
		desc = "",
		is_switch = 0,
		bid = 10081,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10080
			}
		}
	},
	[10090] = {
		name = "召唤券购买对话",
		desc = "",
		is_switch = 0,
		bid = 10090,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"主城的精灵商店中经常会有打折的物品出售！"
			},
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"一起去看看吧~"
			}
		}
	},
	[10091] = {
		name = "召唤券购买引导",
		desc = "",
		is_switch = 0,
		bid = 10091,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10090
			}
		}
	},
	[10100] = {
		name = "第二次召唤对话",
		desc = "",
		is_switch = 0,
		bid = 10100,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"接下来又可以继续前往召唤啦，这次我们可以使用高级召唤！",
				"d_1018"
			},
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"除了用召唤卷召唤之外，每天还有1次免费召唤的机会！"
			}
		}
	},
	[10101] = {
		name = "第二次召唤引导",
		desc = "",
		is_switch = 0,
		bid = 10101,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10100
			}
		}
	},
	[10120] = {
		name = "快速作战对话",
		desc = "",
		is_switch = 0,
		bid = 10120,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"觉得升级速度太慢？每天都有一次免费的快速作战！"
			}
		}
	},
	[10121] = {
		name = "快速作战引导",
		desc = "",
		is_switch = 0,
		bid = 10121,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10120
			}
		}
	},
	[10130] = {
		name = "推图第三关对话",
		desc = "",
		is_switch = 0,
		bid = 10130,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"准备好就一起继续前进吧！",
				"d_1014"
			}
		}
	},
	[10131] = {
		name = "推图第三关引导",
		desc = "",
		is_switch = 0,
		bid = 10131,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10130
			}
		}
	},
	[10140] = {
		name = "神器任务对话",
		desc = "",
		is_switch = 0,
		bid = 10140,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"神器开启了！神器拥有特殊技能，还可以在战斗中提升英雄属性！",
				"d_1019"
			},
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"但是，解锁神器需要先达成目标，一起去看看吧~"
			}
		}
	},
	[10141] = {
		name = "神器界面引导",
		desc = "",
		is_switch = 0,
		bid = 10141,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10140
			}
		}
	},
	[10142] = {
		name = "神器任务引导",
		desc = "",
		is_switch = 0,
		bid = 10142,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10141
			}
		}
	},
	[10151] = {
		name = "任务奖励引导",
		desc = "",
		is_switch = 0,
		bid = 10151,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10150
			}
		}
	},
	[10152] = {
		name = "任务跳转引导（5级以下）",
		desc = "",
		is_switch = 0,
		bid = 10152,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10151
			}
		}
	},
	[10153] = {
		name = "任务跳转引导（5级以上）",
		desc = "",
		is_switch = 0,
		bid = 10153,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10152
			}
		}
	},
	[10160] = {
		name = "推图第四关引导（5级以下）",
		desc = "",
		is_switch = 0,
		bid = 10160,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10160
			}
		}
	},
	[10161] = {
		name = "推图第四关引导（5级以上）",
		desc = "",
		is_switch = 0,
		bid = 10161,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10161
			}
		}
	},
	[10165] = {
		name = "领取挂机收益对话",
		desc = "",
		is_switch = 0,
		bid = 10165,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"每隔一段时间就会积累一定的挂机收益，记得及时领取哟~",
				"d_1013"
			}
		}
	},
	[10166] = {
		name = "领取挂机收益引导",
		desc = "",
		is_switch = 0,
		bid = 10166,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10165
			}
		}
	},
	[10170] = {
		name = "推图第五关对话",
		desc = "",
		is_switch = 0,
		bid = 10170,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"通关的<div fontcolor=#d95014>关卡数越高，挂机收益越多</div>，让我们继续出发吧~"
			}
		}
	},
	[10171] = {
		name = "推图第五关引导",
		desc = "",
		is_switch = 0,
		bid = 10171,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10170
			}
		}
	},
	[10172] = {
		name = "变强升级对话",
		desc = "",
		is_switch = 0,
		bid = 10172,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"如果对英雄还不熟悉的话，可以通过英雄变强去了解噢~"
			}
		}
	},
	[10173] = {
		name = "变强升级引导",
		desc = "",
		is_switch = 0,
		bid = 10173,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10172
			}
		}
	},
	[10174] = {
		name = "变强升级提示",
		desc = "",
		is_switch = 0,
		bid = 10174,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"升级和进阶是提升英雄最快的途径，长按<div fontcolor=#d95014>升级按钮</div>还可以进行连续升级哦~"
			}
		}
	},
	[10175] = {
		name = "七天登录奖励对话",
		desc = "",
		is_switch = 0,
		bid = 10175,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"本小助手给你准备了冒险大礼包哟~每天登录即可领取！"
			}
		}
	},
	[10176] = {
		name = "七天登录奖励引导",
		desc = "",
		is_switch = 0,
		bid = 10176,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10175
			}
		}
	},
	[10177] = {
		name = "每日签到对话",
		desc = "",
		is_switch = 0,
		bid = 10177,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"每日签到轻轻一点也可以领取到丰厚奖励，千万不要错过啦！"
			}
		}
	},
	[10178] = {
		name = "每日签到引导",
		desc = "",
		is_switch = 0,
		bid = 10178,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10177
			}
		}
	},
	[10179] = {
		name = "推图第六关引导",
		desc = "",
		is_switch = 0,
		bid = 10179,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10179
			}
		}
	},
	[10180] = {
		name = "竞技场对话",
		desc = "",
		is_switch = 0,
		bid = 10180,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"竞技场的荣耀之门已经开启！每次战斗均可获得相应奖励噢~"
			}
		}
	},
	[10181] = {
		name = "竞技场引导",
		desc = "",
		is_switch = 0,
		bid = 10181,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10180
			}
		}
	},
	[10182] = {
		name = "探宝对话",
		desc = "",
		is_switch = 0,
		bid = 10182,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"探宝开启，刚才获得的探宝券可以派上用场了！"
			}
		}
	},
	[10183] = {
		name = "探宝引导",
		desc = "",
		is_switch = 0,
		bid = 10183,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10182
			}
		}
	},
	[10192] = {
		name = "新版首充对话",
		desc = "",
		is_switch = 0,
		bid = 10192,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"满足首次充值的条件后，即可选择一位强力五星英雄与你并肩作战，并领取强力橙装！"
			},
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"获得五星英雄之后，也别忘了接下来两天前往领取装备噢~"
			}
		}
	},
	[10193] = {
		name = "新版首充引导",
		desc = "",
		is_switch = 0,
		bid = 10193,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10192
			}
		}
	},
	[10194] = {
		name = "新版2首充引导（耶梦加得）",
		desc = "",
		is_switch = 0,
		bid = 10194,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"满足首次充值的条件后，即可与强力五星英雄耶梦加得并肩作战，并领取强力橙装！"
			},
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"获得耶梦加得之后，也别忘了接下来两天前往领取装备噢~"
			}
		}
	},
	[10195] = {
		name = "新版2首充引导（耶梦加得）",
		desc = "",
		is_switch = 0,
		bid = 10195,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10194
			}
		}
	},
	[20010] = {
		name = "新版3首充对话（利维坦）",
		desc = "",
		is_switch = 0,
		bid = 20010,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"满足首次充值的条件后，即可与强力五星英雄利维坦并肩作战，并领取强力橙装！"
			},
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"获得利维坦之后，也别忘了接下来两天前往领取装备噢~"
			}
		}
	},
	[20011] = {
		name = "新版3首充引导（利维坦）",
		desc = "",
		is_switch = 0,
		bid = 20011,
		is_skip = 0,
		act = {
			{
				"play_guide",
				20010
			}
		}
	},
	[20020] = {
		name = "新版4首充对话（耶梦&利维坦）",
		desc = "",
		is_switch = 0,
		bid = 20020,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"满足首次充值的条件后，即可与五星法师英雄耶梦加得并肩作战，并领取强力橙装！"
			},
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"后续满足条件的话还可获得五星战士英雄英雄利维坦哦！"
			}
		}
	},
	[20021] = {
		name = "新版4首充引导（耶梦&利维坦）",
		desc = "",
		is_switch = 0,
		bid = 20021,
		is_skip = 0,
		act = {
			{
				"play_guide",
				20020
			}
		}
	},
	[10187] = {
		name = "旧版首充对话",
		desc = "",
		is_switch = 0,
		bid = 10187,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"满足首次充值的条件后，即可与强力五星英雄雅典娜并肩作战，并领取强力橙装！"
			},
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"获得雅典娜之后，也别忘了接下来两天前往领取装备噢~"
			}
		}
	},
	[10188] = {
		name = "旧版首充引导",
		desc = "",
		is_switch = 0,
		bid = 10188,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10187
			}
		}
	},
	[10185] = {
		name = "远航对话",
		desc = "",
		is_switch = 0,
		bid = 10185,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"远航开启，派遣英雄接取任务，等待一段时间即可领取丰厚奖励噢！"
			}
		}
	},
	[10186] = {
		name = "远航引导",
		desc = "",
		is_switch = 0,
		bid = 10186,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10185
			}
		}
	},
	[10197] = {
		name = "杂货店购买对话（商业街去除，已废弃）",
		desc = "",
		is_switch = 0,
		bid = 10197,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"储备足够的冒险物资才能有备无患！"
			},
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"这个时候不妨前往<div fontcolor=#d95014>精灵商店</div>看看，那里经常会出售各种折扣商品噢~"
			}
		}
	},
	[10198] = {
		name = "杂货店购买引导（商业街去除，已废弃）",
		desc = "",
		is_switch = 0,
		bid = 10198,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10197
			}
		}
	},
	[10199] = {
		name = "杂货店后续对话（商业街去除，已废弃）",
		desc = "",
		is_switch = 0,
		bid = 10199,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"除此之外，商业区中还有其他的商店，各种惊喜等着你来发掘。"
			},
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"别忘了常来看看哟~"
			}
		}
	},
	[10190] = {
		name = "金币副本对话",
		desc = "",
		is_switch = 0,
		bid = 10190,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"日常副本开启了，赶紧去看看！"
			}
		}
	},
	[10191] = {
		name = "金币副本引导",
		desc = "",
		is_switch = 0,
		bid = 10191,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10190
			}
		}
	},
	[10200] = {
		name = "试练塔对话",
		desc = "",
		is_switch = 0,
		bid = 10200,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"英雄进阶可以解锁技能、提高属性成长，是提升的重要方式之一！"
			},
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"而试炼塔则是神秘的进阶最重要的获取途径！"
			}
		}
	},
	[10201] = {
		name = "试练塔引导",
		desc = "",
		is_switch = 0,
		bid = 10201,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10200
			}
		}
	},
	[10210] = {
		name = "公会对话",
		desc = "",
		is_switch = 0,
		bid = 10210,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"是时候加入<div fontcolor=#d95014>公会</div>了！在这里可以和其他人打Boss，抢红包~"
			},
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"同时<div fontcolor=#d95014>公会技能</div>能够大幅度提升英雄的属性！"
			}
		}
	},
	[10211] = {
		name = "公会引导",
		desc = "",
		is_switch = 0,
		bid = 10211,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10210
			}
		}
	},
	[10212] = {
		name = "加入公会对话",
		desc = "",
		is_switch = 0,
		bid = 10212,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"千万别忘了加入<div fontcolor=#d95014>公会</div>哦~"
			}
		}
	},
	[10220] = {
		name = "先知圣殿对话",
		desc = "",
		is_switch = 0,
		bid = 10220,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"冒险大陆上的先知圣殿，是比召唤更为强大的神秘存在。"
			},
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"在这里可以指定召唤出各系的四星、五星英雄。"
			}
		}
	},
	[10221] = {
		name = "先知圣殿引导",
		desc = "",
		is_switch = 0,
		bid = 10221,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10220
			}
		}
	},
	[10222] = {
		name = "圣殿道具对话",
		desc = "",
		is_switch = 0,
		bid = 10222,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"选择相应系别的卡牌即可召唤，当然啦，开启先知召唤所需的先知水晶也更为珍贵！"
			},
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"竞技场宝箱等可以获得先知水晶，可别忘了及时召唤噢~"
			}
		}
	},
	[10223] = {
		name = "圣殿礼包弹出引导",
		desc = "",
		is_switch = 0,
		bid = 10223,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10222
			}
		}
	},
	[10250] = {
		name = "神器穿戴对话",
		desc = "",
		is_switch = 0,
		bid = 10250,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"神器激活后就可以携带进入战斗啦！"
			}
		}
	},
	[10251] = {
		name = "神器穿戴引导",
		desc = "",
		is_switch = 0,
		bid = 10251,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10250
			}
		}
	},
	[10300] = {
		name = "获取家园钥匙引导",
		desc = "",
		is_switch = 0,
		bid = 10300,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10300
			}
		}
	},
	[10310] = {
		name = "家园进入剧情",
		desc = "",
		is_switch = 0,
		bid = 10310,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"哇！获得了这把钥匙，就意味着你在冒险大陆上拥有自己的家啦！"
			},
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"快点回去看看吧！"
			}
		}
	},
	[10311] = {
		name = "家园进入引导",
		desc = "",
		is_switch = 0,
		bid = 10311,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10310
			}
		}
	},
	[10330] = {
		name = "购买家具剧情",
		desc = "",
		is_switch = 0,
		bid = 10330,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"新家还是空荡荡的，不过没关系，商店中可以购买各种家具~"
			}
		}
	},
	[10331] = {
		name = "购买家具引导",
		desc = "",
		is_switch = 0,
		bid = 10331,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10330
			}
		}
	},
	[10340] = {
		name = "摆放家具剧情",
		desc = "",
		is_switch = 0,
		bid = 10340,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"拥有家具之后，我们就可以来装饰自己的家啦~"
			}
		}
	},
	[10341] = {
		name = "摆放家具引导",
		desc = "",
		is_switch = 0,
		bid = 10341,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10340
			}
		}
	},
	[10350] = {
		name = "调整家具剧情",
		desc = "",
		is_switch = 0,
		bid = 10350,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"如果对已摆放的家具不满意，编辑模式中也可以进行调整~"
			}
		}
	},
	[10351] = {
		name = "调整家具引导",
		desc = "",
		is_switch = 0,
		bid = 10351,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10350
			}
		}
	},
	[10360] = {
		name = "新手训练营剧情",
		desc = "",
		is_switch = 0,
		bid = 10360,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"了解这片大陆的规则有助于你更好地应对危机！"
			},
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"现在就让我们一起去新手训练营学习一下吧~"
			}
		}
	},
	[10361] = {
		name = "新手训练营引导",
		desc = "",
		is_switch = 0,
		bid = 10361,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10360
			}
		}
	},
	[10370] = {
		name = "位面之境剧情",
		desc = "",
		is_switch = 0,
		bid = 10370,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"元素乱流中的新位面开启了！"
			},
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"在位面中征战，完成副本后可以获得大量金币、<div fontcolor=#d95014>征战勋章</div>和特定系别<div fontcolor=#d95014>英雄碎片</div>！"
			},
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"副本中还可拾取蕴含神秘力量的<div fontcolor=#d95014>增益遗物</div>，体验不一样的战斗和英雄技能效果！"
			},
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"现在就一起去位面之境探险吧！"
			}
		}
	},
	[10371] = {
		name = "位面之境引导",
		desc = "",
		is_switch = 0,
		bid = 10371,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10370
			}
		}
	},
	[10372] = {
		name = "",
		desc = "",
		is_switch = 0,
		bid = 10372,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"接下来就不断地向前探索吧！位面之境每<div fontcolor=#d95014>2天的0点</div>会自动重置，探索得越多奖励越丰厚哦~"
			}
		}
	},
	[10380] = {
		name = "精灵剧情",
		desc = "",
		is_switch = 0,
		bid = 10380,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"精灵可以依附于神器之上进行战斗，在固定回合释放强力技能！"
			},
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"而精灵可以通过孵化精灵蛋获得，现在就一起去看看吧~"
			}
		}
	},
	[10381] = {
		name = "精灵引导",
		desc = "",
		is_switch = 0,
		bid = 10381,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10380
			}
		}
	},
	[10382] = {
		name = "精灵孵化说明",
		desc = "",
		is_switch = 0,
		bid = 10382,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"等待孵化倒计时结束后就可以获取精灵了，运气好的话还有可能获得极其稀有的橙色精灵~"
			},
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"当然，还可以直接召唤精灵！通过许愿池许愿后再召唤，有更高概率获得指定精灵哦~"
			}
		}
	},
	[10383] = {
		name = "精灵召唤引导",
		desc = "",
		is_switch = 0,
		bid = 10383,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10382
			}
		}
	},
	[10390] = {
		name = "神装祈祷对话",
		desc = "",
		is_switch = 0,
		bid = 10390,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"神装是由矮人族使用神石锻造出来的特别装备，可以为英雄额外附加特殊属性和技能！"
			},
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"通过天界祈祷和天界副本可以获得神装，现在就一起去看看吧~"
			}
		}
	},
	[10391] = {
		name = "神装祈祷引导",
		desc = "",
		is_switch = 0,
		bid = 10391,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10390
			}
		}
	},
	[10400] = {
		name = "神装穿戴对话",
		desc = "",
		is_switch = 0,
		bid = 10400,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"哇，获得了神装耳环，现在就给英雄穿戴上吧！"
			}
		}
	},
	[10401] = {
		name = "神装穿戴引导",
		desc = "",
		is_switch = 0,
		bid = 10401,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10400
			}
		}
	},
	[10410] = {
		name = "神装副本对话",
		desc = "",
		is_switch = 0,
		bid = 10410,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"神装凑齐两件套和四件套时还能拥有更强大的效果！天界副本中也会掉落神装和材料哟~"
			}
		}
	},
	[10411] = {
		name = "神装副本引导",
		desc = "",
		is_switch = 0,
		bid = 10411,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10410
			}
		}
	},
	[10412] = {
		name = "神装副本对话",
		desc = "",
		is_switch = 0,
		bid = 10412,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"通关的章节关卡越高，获得的奖励就越丰厚哦，努力挑战吧！"
			}
		}
	},
	[10420] = {
		name = "原力水晶对话",
		desc = "",
		is_switch = 0,
		bid = 10420,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"哇，发现了神秘的原力水晶！我们的英雄可以加入水晶的槽位之中，从而提升为和水晶相同的等级！"
			},
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"而水晶的等级，则取决于我们最高级的5个英雄！"
			}
		}
	},
	[10421] = {
		name = "原力水晶引导",
		desc = "",
		is_switch = 0,
		bid = 10421,
		is_skip = 0,
		act = {
			{
				"play_guide",
				10420
			}
		}
	},
	[10422] = {
		name = "原力水晶引导",
		desc = "",
		is_switch = 0,
		bid = 10422,
		is_skip = 0,
		act = {
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"放入英雄之后就可以提升英雄等级啦，但是最大不能超过英雄所能达到的等级哦~"
			},
			{
				"unit_dialog",
				0,
				5,
				1,
				235,
				1,
				"小助手",
				"槽位上的英雄取下来后，也需要等待24小时才能再次放入英雄！"
			}
		}
	}
}

function Config.DramaData.data_get_fun(slot0)
	slot1 = Config.DramaData.data_get[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.DramaData.data_get[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.DramaData.data_guide_length = 52
Config.DramaData.data_guide = {
	[10010] = {
		is_close = 0,
		id = 10010,
		over_step = 5,
		skip = 1,
		desc = "召唤英雄引导",
		special_step = {},
		act = {
			{
				"conditonstatus",
				"checkmainui",
				0.1,
				{
					{
						{
							"name",
							0.3,
							"mainui_tab_1",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"现在先回到主城~",
							-20,
							0,
							0,
							100
						},
						{
							"checkstatus",
							"centercity",
							5,
							0.3
						},
						{
							"name",
							0.3,
							"guidesign_build_5",
							1,
							0,
							0,
							0,
							1,
							0,
							0,
							"点击【召唤】开启神秘的招募仪式~",
							-210,
							0,
							1,
							100,
							"d_1002"
						},
						{
							"summon",
							0.3
						},
						{
							"name",
							0.3,
							"guildsign_summon_1_1",
							0,
							1,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"summonresult",
							4
						},
						{
							"name",
							0.3,
							"guildsign_summon_comfirm_btn",
							0,
							0,
							1,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0,
							"d_1003"
						}
					},
					{
						{
							"emptystep"
						},
						{
							"checkstatus",
							"centercity",
							5,
							0.3
						},
						{
							"name",
							0.3,
							"guidesign_build_5",
							1,
							0,
							0,
							0,
							1,
							0,
							0,
							"点击【召唤】开启神秘的招募仪式~",
							-210,
							0,
							1,
							100,
							"d_1002"
						},
						{
							"summon",
							0.3
						},
						{
							"name",
							0.3,
							"guildsign_summon_1_1",
							0,
							1,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"summonresult",
							4
						},
						{
							"name",
							0.3,
							"guildsign_summon_comfirm_btn",
							0,
							0,
							1,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0,
							"d_1003"
						}
					}
				}
			}
		}
	},
	[10030] = {
		is_close = 0,
		id = 10030,
		over_step = 0,
		skip = 1,
		desc = "推图第一关引导",
		special_step = {},
		act = {
			{
				"conditonstatus",
				"battlesceneview",
				0.1,
				{
					{
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"battletopscene",
							0.1
						},
						{
							"name",
							0.1,
							"guildsign_battle_boss_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0,
							"d_1004"
						},
						{
							"partnergofight",
							0.3
						},
						{
							"name",
							0.3,
							"hero_10302",
							1,
							0,
							0,
							0,
							1,
							0,
							0,
							"让美狄亚上阵~",
							0,
							0,
							0,
							100,
							"d_1005"
						},
						{
							"name",
							0.3,
							"fight_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"(。-`ω´-)火力全开，挑战Boss",
							0,
							0,
							0,
							100
						}
					},
					{
						{
							"mainui",
							0.1
						},
						{
							"name",
							0.1,
							"mainui_tab_4",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"battletopscene",
							0.1
						},
						{
							"name",
							0.3,
							"guildsign_battle_boss_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0,
							"d_1004"
						},
						{
							"partnergofight",
							0.3
						},
						{
							"name",
							0.3,
							"hero_10302",
							1,
							0,
							0,
							0,
							1,
							0,
							0,
							"让美狄亚上阵~",
							0,
							0,
							0,
							100,
							"d_1005"
						},
						{
							"name",
							0.3,
							"fight_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"(。-`ω´-)火力全开，挑战Boss",
							0,
							0,
							0,
							100
						}
					}
				}
			}
		}
	},
	[10040] = {
		is_close = 0,
		id = 10040,
		over_step = 6,
		skip = 1,
		desc = "领取通关奖励引导",
		special_step = {},
		act = {
			{
				"conditonstatus",
				"battlesceneview",
				0.1,
				{
					{
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"battletopscene",
							0.1
						},
						{
							"name",
							0.3,
							"guidesign_battle_reward_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							100
						},
						{
							"battletoppassrewards",
							0.3
						},
						{
							"tag",
							0.3,
							10010,
							0,
							1,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"getitemview",
							0.3
						},
						{
							"name",
							0.3,
							"confirm_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						}
					},
					{
						{
							"mainui",
							0.1
						},
						{
							"name",
							0.1,
							"mainui_tab_4",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"battletopscene",
							0.3
						},
						{
							"name",
							0.3,
							"guidesign_battle_reward_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							100
						},
						{
							"battletoppassrewards",
							0.3
						},
						{
							"tag",
							0.3,
							10010,
							0,
							1,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"getitemview",
							0.3
						},
						{
							"name",
							0.3,
							"confirm_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						}
					}
				}
			}
		}
	},
	[10050] = {
		is_close = 0,
		id = 10050,
		over_step = 7,
		skip = 1,
		desc = "英雄合成引导",
		special_step = {},
		act = {
			{
				"mainui",
				0.1
			},
			{
				"name",
				0.1,
				"mainui_tab_3",
				0,
				0,
				0,
				0,
				1,
				0,
				0,
				"",
				0,
				0,
				0,
				0
			},
			{
				"backpack",
				0.2
			},
			{
				"name",
				0.1,
				"tab_btn_3",
				0,
				0,
				0,
				0,
				1,
				0,
				0,
				"打开【碎片背包】",
				0,
				0,
				0,
				100
			},
			{
				"name",
				0.3,
				"item_24802",
				0,
				0,
				0,
				0,
				1,
				0,
				0,
				"",
				-70,
				0,
				1,
				100
			},
			{
				"comptipsview",
				0.2
			},
			{
				"name",
				0.3,
				"com_btn",
				0,
				0,
				0,
				0,
				1,
				0,
				0,
				"",
				0,
				0,
				0,
				0
			},
			{
				"getitemview",
				0.2
			},
			{
				"name",
				0.3,
				"confirm_btn",
				0,
				0,
				0,
				0,
				1,
				0,
				0,
				"",
				0,
				0,
				0,
				0,
				"d_1008"
			}
		}
	},
	[10060] = {
		is_close = 0,
		id = 10060,
		over_step = 0,
		skip = 1,
		desc = "英雄升级引导",
		special_step = {},
		act = {
			{
				"conditonstatus",
				"partner",
				0.1,
				{
					{
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"name",
							0.1,
							"hero_10403",
							1,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"partnereinfoview",
							0.3
						},
						{
							"name",
							0.3,
							"level_up_btn",
							0,
							1,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"name",
							0.3,
							"level_up_btn",
							0,
							1,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						}
					},
					{
						{
							"mainui",
							0.1
						},
						{
							"name",
							0.1,
							"mainui_tab_2",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"partner",
							0.3
						},
						{
							"name",
							0.1,
							"hero_10403",
							1,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"partnereinfoview",
							0.3
						},
						{
							"name",
							0.3,
							"level_up_btn",
							0,
							1,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"name",
							0.3,
							"level_up_btn",
							0,
							1,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						}
					}
				}
			}
		}
	},
	[10070] = {
		is_close = 0,
		id = 10070,
		over_step = 0,
		skip = 1,
		desc = "装备穿戴引导",
		special_step = {},
		act = {
			{
				"conditonstatus",
				"partnereinfoview",
				0.1,
				{
					{
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"name",
							0.3,
							"key_up_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0,
							"d_1011"
						}
					},
					{
						{
							"mainui",
							0.1
						},
						{
							"name",
							0.1,
							"mainui_tab_2",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"partner",
							0.3
						},
						{
							"name",
							0.1,
							"hero_10403",
							1,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"partnereinfoview",
							0.3
						},
						{
							"name",
							0.3,
							"key_up_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0,
							"d_1011"
						}
					}
				}
			}
		}
	},
	[10080] = {
		is_close = 0,
		id = 10080,
		over_step = 0,
		skip = 1,
		desc = "推图第二关引导",
		special_step = {},
		act = {
			{
				"conditonstatus",
				"battlesceneview",
				0.1,
				{
					{
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"battletopscene",
							0.1
						},
						{
							"name",
							0.1,
							"guildsign_battle_boss_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0,
							"d_1010"
						},
						{
							"partnergofight",
							0.3
						},
						{
							"name",
							0.3,
							"hero_10403",
							1,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							100
						},
						{
							"name",
							0.3,
							"fight_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							100
						}
					},
					{
						{
							"mainui",
							0.1
						},
						{
							"name",
							0.1,
							"mainui_tab_4",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"battletopscene",
							0.1
						},
						{
							"name",
							0.3,
							"guildsign_battle_boss_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0,
							"d_1010"
						},
						{
							"partnergofight",
							0.3
						},
						{
							"name",
							0.3,
							"hero_10403",
							1,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							100
						},
						{
							"name",
							0.3,
							"fight_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							100
						}
					}
				}
			}
		}
	},
	[10090] = {
		is_close = 0,
		id = 10090,
		over_step = 0,
		skip = 1,
		desc = "召唤券购买引导",
		special_step = {},
		act = {
			{
				"conditonstatus",
				"checkmainui",
				0.1,
				{
					{
						{
							"name",
							0.3,
							"mainui_tab_1",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"回到主城~",
							-20,
							0,
							0,
							100
						},
						{
							"checkstatus",
							"centercity",
							10,
							0.3
						},
						{
							"name",
							0.3,
							"guidesign_build_10",
							1,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							-210,
							0,
							1,
							100
						},
						{
							"varietystoreview",
							0.3
						},
						{
							"name",
							0.3,
							"buy_btn_4",
							0,
							1,
							0,
							0,
							1,
							0,
							-80,
							"发现超低价格的召唤券",
							0,
							-160,
							0,
							100
						}
					},
					{
						{
							"emptystep"
						},
						{
							"checkstatus",
							"centercity",
							10,
							0.3
						},
						{
							"name",
							0.3,
							"guidesign_build_10",
							1,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							-210,
							0,
							1,
							100
						},
						{
							"varietystoreview",
							0.3
						},
						{
							"name",
							0.3,
							"buy_btn_4",
							0,
							1,
							0,
							0,
							1,
							0,
							-80,
							"发现超低价格的召唤券",
							0,
							-160,
							0,
							100
						}
					}
				}
			}
		}
	},
	[10100] = {
		is_close = 0,
		id = 10100,
		over_step = 5,
		skip = 1,
		desc = "第二次召唤引导",
		special_step = {},
		act = {
			{
				"conditonstatus",
				"checkmainui",
				0.1,
				{
					{
						{
							"name",
							0.3,
							"mainui_tab_1",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"现在先回到主城~",
							-20,
							0,
							0,
							100
						},
						{
							"checkstatus",
							"centercity",
							5,
							0.3
						},
						{
							"name",
							0.3,
							"guidesign_build_5",
							1,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							-210,
							0,
							1,
							100
						},
						{
							"summon",
							0.3
						},
						{
							"name",
							0.3,
							"guildsign_summon_3_1",
							0,
							1,
							0,
							0,
							1,
							0,
							0,
							"进行高级召唤",
							0,
							0,
							0,
							100
						},
						{
							"summonresult",
							4
						},
						{
							"name",
							0.3,
							"guildsign_summon_next_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							-550,
							"",
							0,
							0,
							0,
							0
						},
						{
							"name",
							0.3,
							"guildsign_summon_comfirm_btn",
							0,
							0,
							1,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						}
					},
					{
						{
							"emptystep"
						},
						{
							"checkstatus",
							"centercity",
							5,
							0.3
						},
						{
							"name",
							0.3,
							"guidesign_build_5",
							1,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							-210,
							0,
							1,
							100
						},
						{
							"summon",
							0.3
						},
						{
							"name",
							0.3,
							"guildsign_summon_3_1",
							0,
							1,
							0,
							0,
							1,
							0,
							0,
							"进行高级召唤",
							0,
							0,
							0,
							100
						},
						{
							"summonresult",
							4
						},
						{
							"name",
							0.3,
							"guildsign_summon_next_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							-550,
							"",
							0,
							0,
							0,
							0
						},
						{
							"name",
							0.3,
							"guildsign_summon_comfirm_btn",
							0,
							0,
							1,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						}
					}
				}
			}
		}
	},
	[10120] = {
		is_close = 0,
		id = 10120,
		over_step = 6,
		skip = 1,
		desc = "快速作战引导",
		special_step = {},
		act = {
			{
				"conditonstatus",
				"battlesceneview",
				0.1,
				{
					{
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"battletopscene",
							0.2
						},
						{
							"name",
							0.3,
							"guidesign_battle_quick_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"点击【快速作战】获得大量经验装备",
							0,
							0,
							0,
							100
						},
						{
							"battlequickview",
							0.6
						},
						{
							"name",
							0.1,
							"guidesign_quick_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0,
							"d_1023"
						},
						{
							"battletophookrewards",
							0.3
						},
						{
							"name",
							0.3,
							"guidesign_rewards_quick_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"battlequickview",
							0.1
						},
						{
							"name",
							0.1,
							"close_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						}
					},
					{
						{
							"mainui",
							0.1
						},
						{
							"name",
							0.1,
							"mainui_tab_4",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"battletopscene",
							0.2
						},
						{
							"name",
							0.3,
							"guidesign_battle_quick_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"点击【快速作战】获得大量经验装备",
							0,
							0,
							0,
							100
						},
						{
							"battlequickview",
							0.6
						},
						{
							"name",
							0.1,
							"guidesign_quick_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0,
							"d_1023"
						},
						{
							"battletophookrewards",
							0.3
						},
						{
							"name",
							0.3,
							"guidesign_rewards_quick_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"battlequickview",
							0.1
						},
						{
							"name",
							0.1,
							"close_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						}
					}
				}
			}
		}
	},
	[10130] = {
		is_close = 0,
		id = 10130,
		over_step = 0,
		skip = 1,
		desc = "推图第三关引导",
		special_step = {},
		act = {
			{
				"conditonstatus",
				"battlesceneview",
				0.1,
				{
					{
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"battletopscene",
							0.1
						},
						{
							"name",
							0.1,
							"guildsign_battle_boss_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"partnergofight",
							0.3
						},
						{
							"name",
							0.3,
							"hero_30405",
							1,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							100
						},
						{
							"name",
							0.3,
							"fight_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							100
						}
					},
					{
						{
							"mainui",
							0.1
						},
						{
							"name",
							0.1,
							"mainui_tab_4",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"battletopscene",
							0.1
						},
						{
							"name",
							0.3,
							"guildsign_battle_boss_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"partnergofight",
							0.3
						},
						{
							"name",
							0.3,
							"hero_30405",
							1,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							100
						},
						{
							"name",
							0.3,
							"fight_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							100
						}
					}
				}
			}
		}
	},
	[10140] = {
		is_close = 0,
		id = 10140,
		over_step = 0,
		skip = 1,
		desc = "神器界面引导",
		special_step = {},
		act = {
			{
				"conditonstatus",
				"battlesceneview",
				0.1,
				{
					{
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"battletopscene",
							0.2
						},
						{
							"name",
							0.3,
							"hallows_stage",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							1,
							100
						}
					},
					{
						{
							"mainui",
							0.1
						},
						{
							"name",
							0.1,
							"mainui_tab_4",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"battletopscene",
							0.2
						},
						{
							"name",
							0.3,
							"hallows_stage",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							1,
							100
						}
					}
				}
			}
		}
	},
	[10141] = {
		is_close = 0,
		id = 10141,
		over_step = 0,
		skip = 1,
		desc = "神器任务引导",
		special_step = {},
		act = {
			{
				"conditonstatus",
				"hallowspreview",
				0.1,
				{
					{
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"name",
							0.3,
							"hallows_1",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							1,
							100,
							"d_1020"
						}
					},
					{
						{
							"mainui",
							0.1
						},
						{
							"name",
							0.1,
							"mainui_tab_4",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"battletopscene",
							0.1
						},
						{
							"name",
							0.3,
							"hallows_stage",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							1,
							100
						},
						{
							"hallowspreview",
							0.2
						},
						{
							"name",
							0.3,
							"hallows_1",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							1,
							100,
							"d_1020"
						}
					}
				}
			}
		}
	},
	[10150] = {
		is_close = 0,
		id = 10150,
		over_step = 0,
		skip = 1,
		desc = "任务奖励引导",
		special_step = {},
		act = {
			{
				"conditonstatus",
				"hallowswindow",
				0.1,
				{
					{
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"name",
							0.3,
							"get_btn_101",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							1,
							100,
							"d_1021"
						}
					},
					{
						{
							"mainui",
							0.1
						},
						{
							"name",
							0.1,
							"mainui_tab_7",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"hallowswindow",
							0.2
						},
						{
							"name",
							0.3,
							"get_btn_101",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							1,
							100,
							"d_1021"
						}
					}
				}
			}
		}
	},
	[10151] = {
		is_close = 0,
		id = 10151,
		over_step = 0,
		skip = 1,
		desc = "任务跳转引导（5级以下）",
		special_step = {},
		act = {
			{
				"conditonstatus",
				"hallowswindow",
				0.1,
				{
					{
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"name",
							0.3,
							"goto_btn_102",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"继续下一个指引",
							0,
							0,
							1,
							100,
							"d_1022"
						}
					},
					{
						{
							"mainui",
							0.1
						},
						{
							"name",
							0.1,
							"mainui_tab_4",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"battletopscene",
							0.2
						},
						{
							"name",
							0.3,
							"hallows_stage",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							1,
							100
						},
						{
							"hallowswindow",
							0.2
						},
						{
							"name",
							0.3,
							"goto_btn_102",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"继续下一个指引",
							0,
							0,
							1,
							100,
							"d_1022"
						}
					}
				}
			}
		}
	},
	[10152] = {
		is_close = 0,
		id = 10152,
		over_step = 6,
		skip = 1,
		desc = "任务跳转引导（5级以上）",
		special_step = {},
		act = {
			{
				"conditonstatus",
				"hallowswindow",
				0.1,
				{
					{
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"name",
							0.3,
							"get_btn_102",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"继续领取奖励吧",
							0,
							0,
							1,
							100
						},
						{
							"getitemview",
							0.2
						},
						{
							"name",
							0.3,
							"confirm_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"mainui",
							0.1
						},
						{
							"name",
							0.3,
							"mainui_tab_4",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							-20,
							0,
							0,
							100
						}
					},
					{
						{
							"mainui",
							0.1
						},
						{
							"name",
							0.1,
							"mainui_tab_4",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"battletopscene",
							0.2
						},
						{
							"name",
							0.3,
							"hallows_stage",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							1,
							100
						},
						{
							"hallowswindow",
							0.2
						},
						{
							"name",
							0.3,
							"get_btn_102",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"继续领取奖励吧",
							0,
							0,
							1,
							100
						},
						{
							"getitemview",
							0.2
						},
						{
							"name",
							0.3,
							"confirm_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"mainui",
							0.1
						},
						{
							"name",
							0.3,
							"mainui_tab_4",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							-20,
							0,
							0,
							100
						}
					}
				}
			}
		}
	},
	[10160] = {
		is_close = 0,
		id = 10160,
		over_step = 0,
		skip = 1,
		desc = "推图第四关引导（5级以下）",
		special_step = {},
		act = {
			{
				"conditonstatus",
				"battlesceneview",
				0.1,
				{
					{
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"battletopscene",
							0.1
						},
						{
							"name",
							0.1,
							"guildsign_battle_boss_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"关卡越高，升级越快噢",
							0,
							0,
							0,
							100
						},
						{
							"partnergofight",
							0.3
						},
						{
							"name",
							0.3,
							"fight_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							100
						}
					},
					{
						{
							"mainui",
							0.1
						},
						{
							"name",
							0.1,
							"mainui_tab_4",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"battletopscene",
							0.1
						},
						{
							"name",
							0.3,
							"guildsign_battle_boss_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"关卡越高，升级越快噢",
							0,
							0,
							0,
							100
						},
						{
							"partnergofight",
							0.3
						},
						{
							"name",
							0.3,
							"fight_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							100
						}
					}
				}
			}
		}
	},
	[10161] = {
		is_close = 0,
		id = 10161,
		over_step = 0,
		skip = 1,
		desc = "推图第四关引导（5级以上）",
		special_step = {},
		act = {
			{
				"conditonstatus",
				"battlesceneview",
				0.1,
				{
					{
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"battletopscene",
							0.1
						},
						{
							"name",
							0.1,
							"guildsign_battle_boss_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"关卡越高，升级越快噢",
							0,
							0,
							0,
							100
						},
						{
							"partnergofight",
							0.3
						},
						{
							"name",
							0.3,
							"fight_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							100
						}
					},
					{
						{
							"mainui",
							0.1
						},
						{
							"name",
							0.1,
							"mainui_tab_4",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"battletopscene",
							0.1
						},
						{
							"name",
							0.3,
							"guildsign_battle_boss_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"关卡越高，升级越快噢",
							0,
							0,
							0,
							100
						},
						{
							"partnergofight",
							0.3
						},
						{
							"name",
							0.3,
							"fight_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							100
						}
					}
				}
			}
		}
	},
	[10165] = {
		is_close = 0,
		id = 10165,
		over_step = 0,
		skip = 1,
		desc = "领取挂机收益引导",
		special_step = {},
		act = {
			{
				"conditonstatus",
				"battlesceneview",
				0.1,
				{
					{
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"battletopscene",
							0.2
						},
						{
							"name",
							0.3,
							"resources_model",
							0,
							0,
							0,
							0,
							1,
							-150,
							0,
							"点击领取收益",
							-150,
							-20,
							0,
							100
						},
						{
							"battletophookrewards",
							0.3
						},
						{
							"name",
							0.3,
							"guidesign_rewards_quick_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						}
					},
					{
						{
							"mainui",
							0.1
						},
						{
							"name",
							0.1,
							"mainui_tab_4",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"battletopscene",
							0.2
						},
						{
							"name",
							0.3,
							"resources_model",
							0,
							0,
							0,
							0,
							1,
							-150,
							0,
							"点击领取收益",
							-150,
							-20,
							0,
							100
						},
						{
							"battletophookrewards",
							0.3
						},
						{
							"name",
							0.3,
							"guidesign_rewards_quick_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						}
					}
				}
			}
		}
	},
	[10170] = {
		is_close = 0,
		id = 10170,
		over_step = 0,
		skip = 1,
		desc = "推图第五关引导",
		special_step = {},
		act = {
			{
				"conditonstatus",
				"battlesceneview",
				0.1,
				{
					{
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"battletopscene",
							0.1
						},
						{
							"name",
							0.1,
							"guildsign_battle_boss_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						}
					},
					{
						{
							"mainui",
							0.1
						},
						{
							"name",
							0.1,
							"mainui_tab_4",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"battletopscene",
							0.1
						},
						{
							"name",
							0.3,
							"guildsign_battle_boss_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						}
					}
				}
			}
		}
	},
	[10172] = {
		is_close = 0,
		id = 10172,
		over_step = 0,
		skip = 1,
		desc = "变强升级引导",
		special_step = {},
		act = {
			{
				"conditonstatus",
				"battlesceneview",
				0.1,
				{
					{
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"battletopscene",
							0.2
						},
						{
							"name",
							0.3,
							"hero_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							100
						},
						{
							"strongerview",
							0.6
						},
						{
							"name",
							0.1,
							"go_btn_1",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"partnereinfoview",
							0.3
						},
						{
							"name",
							0.3,
							"level_up_btn",
							0,
							1,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						}
					},
					{
						{
							"mainui",
							0.1
						},
						{
							"name",
							0.1,
							"mainui_tab_4",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"battletopscene",
							0.2
						},
						{
							"name",
							0.3,
							"hero_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							100
						},
						{
							"strongerview",
							0.6
						},
						{
							"name",
							0.1,
							"go_btn_1",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"partnereinfoview",
							0.3
						},
						{
							"name",
							0.3,
							"level_up_btn",
							0,
							1,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						}
					}
				}
			}
		}
	},
	[10175] = {
		is_close = 0,
		id = 10175,
		over_step = 0,
		skip = 1,
		desc = "七天登录奖励引导",
		special_step = {},
		act = {
			{
				"conditonstatus",
				"checkmainui",
				0.1,
				{
					{
						{
							"name",
							0.3,
							"mainui_tab_1",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							-20,
							0,
							0,
							0
						},
						{
							"name",
							0.1,
							"icon_login_day",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"sevenloginview",
							0.5
						},
						{
							"name",
							2.1,
							"get_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						}
					},
					{
						{
							"mainui",
							0.1
						},
						{
							"name",
							0.1,
							"icon_login_day",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"sevenloginview",
							0.5
						},
						{
							"name",
							2.1,
							"get_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						}
					}
				}
			}
		}
	},
	[10177] = {
		is_close = 0,
		id = 10177,
		over_step = 0,
		skip = 1,
		desc = "每日签到引导",
		special_step = {},
		act = {
			{
				"conditonstatus",
				"checkmainui",
				0.1,
				{
					{
						{
							"name",
							0.3,
							"mainui_tab_1",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							-20,
							0,
							0,
							0
						},
						{
							"name",
							0.1,
							"icon_welfare",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"welfareview",
							0.5
						},
						{
							"name",
							0.5,
							"sign_btn_1",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"getitemview",
							0.2
						},
						{
							"name",
							0.3,
							"confirm_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						}
					},
					{
						{
							"mainui",
							0.1
						},
						{
							"name",
							0.1,
							"icon_welfare",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"welfareview",
							0.5
						},
						{
							"name",
							0.5,
							"sign_btn_1",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"getitemview",
							0.2
						},
						{
							"name",
							0.3,
							"confirm_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						}
					}
				}
			}
		}
	},
	[10179] = {
		is_close = 0,
		id = 10179,
		over_step = 0,
		skip = 1,
		desc = "推图第六关引导",
		special_step = {},
		act = {
			{
				"conditonstatus",
				"welfareview",
				0.1,
				{
					{
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"battletopscene",
							0.1
						},
						{
							"name",
							0.1,
							"guildsign_battle_boss_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						}
					},
					{
						{
							"mainui",
							0.1
						},
						{
							"name",
							0.1,
							"mainui_tab_4",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"battletopscene",
							0.1
						},
						{
							"name",
							0.3,
							"guildsign_battle_boss_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						}
					}
				}
			}
		}
	},
	[10180] = {
		is_close = 0,
		id = 10180,
		over_step = 0,
		skip = 1,
		desc = "竞技场引导",
		special_step = {},
		act = {
			{
				"conditonstatus",
				"checkmainui",
				0.1,
				{
					{
						{
							"name",
							0.3,
							"mainui_tab_1",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							-20,
							0,
							0,
							0
						},
						{
							"checkstatus",
							"centercity",
							3,
							0.3
						},
						{
							"name",
							0.3,
							"guidesign_build_3",
							1,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							1,
							0
						},
						{
							"arenaloopview",
							0.3
						},
						{
							"tag",
							0.1,
							1001
						}
					},
					{
						{
							"emptystep"
						},
						{
							"checkstatus",
							"centercity",
							3,
							0.3
						},
						{
							"name",
							0.3,
							"guidesign_build_3",
							1,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							-140,
							0,
							1,
							0
						},
						{
							"arenaloopview",
							0.3
						},
						{
							"tag",
							0.1,
							1001
						}
					}
				}
			}
		}
	},
	[10182] = {
		is_close = 0,
		id = 10182,
		over_step = 0,
		skip = 1,
		desc = "探宝引导",
		special_step = {},
		act = {
			{
				"conditonstatus",
				"checkmainui",
				0.1,
				{
					{
						{
							"name",
							0.3,
							"mainui_tab_1",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							-20,
							0,
							0,
							0
						},
						{
							"name",
							0.1,
							"icon_dial",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"treasureview",
							0.1
						},
						{
							"name",
							0.1,
							"btn_treasure_1",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						}
					},
					{
						{
							"mainui",
							0.1
						},
						{
							"name",
							0.1,
							"icon_dial",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"treasureview",
							0.1
						},
						{
							"name",
							0.1,
							"btn_treasure_1",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						}
					}
				}
			}
		}
	},
	[10192] = {
		is_close = 0,
		id = 10192,
		over_step = 0,
		skip = 1,
		desc = "新版首充引导",
		special_step = {},
		act = {
			{
				"openview",
				"newfirstrecharge",
				0.3
			}
		}
	},
	[10194] = {
		is_close = 0,
		id = 10194,
		over_step = 0,
		skip = 1,
		desc = "新版2首充引导（耶梦加得）",
		special_step = {},
		act = {
			{
				"openview",
				"newfirstrecharge1",
				0.3
			}
		}
	},
	[20010] = {
		is_close = 0,
		id = 20010,
		over_step = 0,
		skip = 1,
		desc = "新版3首充引导（利维坦）",
		special_step = {},
		act = {
			{
				"openview",
				"newfirstrecharge2",
				0.3
			}
		}
	},
	[20020] = {
		is_close = 0,
		id = 20020,
		over_step = 0,
		skip = 1,
		desc = "新版4首充引导（耶梦&利维坦）",
		special_step = {},
		act = {
			{
				"openview",
				"newfirstrecharge3",
				0.3
			}
		}
	},
	[10187] = {
		is_close = 0,
		id = 10187,
		over_step = 0,
		skip = 1,
		desc = "旧版首充引导",
		special_step = {},
		act = {
			{
				"openview",
				"firstrecharge",
				0.3
			}
		}
	},
	[10185] = {
		is_close = 0,
		id = 10185,
		over_step = 0,
		skip = 1,
		desc = "远航引导",
		special_step = {},
		act = {
			{
				"conditonstatus",
				"battlesceneview",
				0.1,
				{
					{
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"battletopscene",
							0.1
						},
						{
							"name",
							0.1,
							"guidesign_tipsqingbao",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"voyageview",
							0.3
						},
						{
							"name",
							0.3,
							"get_btn_1",
							1,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							100
						},
						{
							"voyagedispatchview",
							0.3
						},
						{
							"name",
							0.3,
							"quick_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							100
						},
						{
							"name",
							0.3,
							"dispatch_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							100
						}
					},
					{
						{
							"mainui",
							0.1
						},
						{
							"name",
							0.1,
							"mainui_tab_4",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"battletopscene",
							0.1
						},
						{
							"name",
							0.1,
							"guidesign_tipsqingbao",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"voyageview",
							0.3
						},
						{
							"name",
							0.3,
							"get_btn_1",
							1,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							100
						},
						{
							"voyagedispatchview",
							0.3
						},
						{
							"name",
							0.3,
							"quick_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							100
						},
						{
							"name",
							0.3,
							"dispatch_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							100
						}
					}
				}
			}
		}
	},
	[10197] = {
		is_close = 0,
		id = 10197,
		over_step = 0,
		skip = 1,
		desc = "杂货店购买引导（商业街去除，已废弃）",
		special_step = {},
		act = {
			{
				"conditonstatus",
				"checkmainui",
				0.1,
				{
					{
						{
							"name",
							0.3,
							"mainui_tab_1",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							-20,
							0,
							0,
							100
						},
						{
							"checkstatus",
							"centercity",
							1,
							0.3
						},
						{
							"name",
							0.3,
							"guidesign_build_1",
							1,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							-210,
							0,
							1,
							100
						},
						{
							"areascene",
							0.3
						},
						{
							"name",
							0.3,
							"guide_build_2",
							0,
							1,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						}
					},
					{
						{
							"emptystep"
						},
						{
							"checkstatus",
							"centercity",
							1,
							0.3
						},
						{
							"name",
							0.3,
							"guidesign_build_1",
							1,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							-210,
							0,
							1,
							100
						},
						{
							"areascene",
							0.3
						},
						{
							"name",
							0.3,
							"guide_build_2",
							0,
							1,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						}
					}
				}
			}
		}
	},
	[10190] = {
		is_close = 0,
		id = 10190,
		over_step = 0,
		skip = 1,
		desc = "金币副本引导",
		special_step = {},
		act = {
			{
				"mainui",
				0.1
			},
			{
				"name",
				0.1,
				"mainui_tab_5",
				0,
				0,
				0,
				0,
				1,
				0,
				0,
				"",
				0,
				0,
				0,
				0
			},
			{
				"esecsiceview",
				0.2
			},
			{
				"name",
				0.1,
				"guide_activity_item_1",
				0,
				0,
				0,
				0,
				1,
				0,
				0,
				"",
				0,
				0,
				0,
				100
			},
			{
				"stonedunview",
				0.2
			},
			{
				"name",
				0.3,
				"stone_change_btn_101",
				0,
				0,
				0,
				0,
				1,
				0,
				0,
				"",
				0,
				0,
				0,
				0
			}
		}
	},
	[10200] = {
		is_close = 0,
		id = 10200,
		over_step = 0,
		skip = 1,
		desc = "试练塔引导",
		special_step = {},
		act = {
			{
				"conditonstatus",
				"checkmainui",
				0.1,
				{
					{
						{
							"name",
							0.3,
							"mainui_tab_1",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							-20,
							0,
							0,
							0
						},
						{
							"checkstatus",
							"centercity",
							4,
							0.3
						},
						{
							"name",
							0.3,
							"guidesign_build_4",
							1,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							1,
							0
						},
						{
							"startowerview",
							0.2
						},
						{
							"name",
							0.1,
							"guildsign_startower_1",
							1,
							0,
							0,
							0,
							1,
							0,
							0,
							"挑战走起~",
							0,
							0,
							0,
							100
						},
						{
							"startowerchallengeview",
							0.2
						},
						{
							"name",
							0.1,
							"btn1",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						}
					},
					{
						{
							"emptystep"
						},
						{
							"checkstatus",
							"centercity",
							4,
							0.3
						},
						{
							"name",
							0.3,
							"guidesign_build_4",
							1,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							1,
							0
						},
						{
							"startowerview",
							0.2
						},
						{
							"name",
							0.1,
							"guildsign_startower_1",
							1,
							0,
							0,
							0,
							1,
							0,
							0,
							"挑战走起~",
							0,
							0,
							0,
							100
						},
						{
							"startowerchallengeview",
							0.2
						},
						{
							"name",
							0.1,
							"btn1",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						}
					}
				}
			}
		}
	},
	[10210] = {
		is_close = 0,
		id = 10210,
		over_step = 0,
		skip = 1,
		desc = "公会引导",
		special_step = {},
		act = {
			{
				"mainui",
				0.1
			},
			{
				"name",
				0.8,
				"mainui_tab_6",
				0,
				0,
				0,
				0,
				1,
				0,
				0,
				"",
				0,
				0,
				0,
				0
			}
		}
	},
	[10220] = {
		is_close = 0,
		id = 10220,
		over_step = 0,
		skip = 1,
		desc = "先知圣殿引导",
		special_step = {},
		act = {
			{
				"conditonstatus",
				"checkmainui",
				0.1,
				{
					{
						{
							"name",
							0.3,
							"mainui_tab_1",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							-20,
							0,
							0,
							0
						},
						{
							"checkstatus",
							"centercity",
							8,
							0.3
						},
						{
							"name",
							0.3,
							"guidesign_build_8",
							1,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							1,
							0
						},
						{
							"seerpalaceview",
							0.2
						},
						{
							"name",
							0.5,
							"guide_card_1",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							100
						}
					},
					{
						{
							"emptystep"
						},
						{
							"checkstatus",
							"centercity",
							8,
							0.3
						},
						{
							"name",
							0.8,
							"guidesign_build_8",
							1,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							-140,
							0,
							1,
							0
						},
						{
							"seerpalaceview",
							0.2
						},
						{
							"name",
							0.5,
							"guide_card_1",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							100
						}
					}
				}
			}
		}
	},
	[10222] = {
		is_close = 0,
		id = 10222,
		over_step = 0,
		skip = 1,
		desc = "圣殿礼包弹出引导",
		special_step = {},
		act = {
			{
				"openview",
				"limittimeview",
				0.3
			}
		}
	},
	[10250] = {
		is_close = 0,
		id = 10250,
		over_step = 0,
		skip = 1,
		desc = "神器穿戴引导",
		special_step = {},
		act = {
			{
				"mainui",
				0.1
			},
			{
				"name",
				0.1,
				"mainui_tab_2",
				0,
				0,
				0,
				0,
				1,
				0,
				0,
				"",
				0,
				0,
				0,
				0
			},
			{
				"partner",
				0.3
			},
			{
				"name",
				0.3,
				"embattle_btn",
				0,
				0,
				0,
				0,
				1,
				0,
				0,
				"",
				0,
				0,
				0,
				100
			}
		}
	},
	[10300] = {
		is_close = 0,
		id = 10300,
		over_step = 1,
		skip = 1,
		desc = "获取家园钥匙引导",
		special_step = {},
		act = {
			{
				"homeworldunlockkey",
				0.3
			},
			{
				"name",
				0.3,
				"goto_home_world_btn",
				0,
				0,
				0,
				0,
				1,
				0,
				0,
				"",
				0,
				0,
				0,
				0
			}
		}
	},
	[10310] = {
		is_close = 0,
		id = 10310,
		over_step = 0,
		skip = 1,
		desc = "家园进入引导",
		special_step = {},
		act = {
			{
				"conditonstatus",
				"checkmainui",
				0.1,
				{
					{
						{
							"name",
							0.3,
							"mainui_tab_1",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"checkstatus",
							"centercity",
							14,
							0.3
						},
						{
							"name",
							0.3,
							"guidesign_build_14",
							1,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							1,
							0
						}
					},
					{
						{
							"emptystep"
						},
						{
							"checkstatus",
							"centercity",
							14,
							0.3
						},
						{
							"name",
							0.3,
							"guidesign_build_14",
							1,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							1,
							0
						}
					}
				}
			}
		}
	},
	[10330] = {
		is_close = 0,
		id = 10330,
		over_step = 9,
		skip = 1,
		desc = "购买家具引导",
		special_step = {},
		act = {
			{
				"conditonstatus",
				"homeworldscene",
				0.1,
				{
					{
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"name",
							0.1,
							"guide_shop_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"homeworldshop",
							0.3
						},
						{
							"name",
							0.3,
							"guide_btn_shop_4",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"name",
							0.3,
							"guide_shop_item_200104",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"homeworldshopbuy",
							0.3
						},
						{
							"name",
							0.3,
							"guide_buy_btn",
							0,
							1,
							0,
							0,
							1,
							0,
							0,
							"购买小圆桌",
							0,
							0,
							0,
							0
						},
						{
							"homeworldshop",
							0.3
						},
						{
							"name",
							0.3,
							"guide_close_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						}
					},
					{
						{
							"checkstatus",
							"centercity",
							14,
							0.3
						},
						{
							"name",
							0.3,
							"guidesign_build_14",
							1,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							1,
							0
						},
						{
							"homeworldscene",
							0.3
						},
						{
							"name",
							0.1,
							"guide_shop_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"homeworldshop",
							0.3
						},
						{
							"name",
							0.3,
							"guide_btn_shop_4",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"name",
							0.3,
							"guide_shop_item_200104",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"homeworldshopbuy",
							0.3
						},
						{
							"name",
							0.3,
							"guide_buy_btn",
							0,
							1,
							0,
							0,
							1,
							0,
							0,
							"购买小圆桌",
							0,
							0,
							0,
							0
						},
						{
							"homeworldshop",
							0.3
						},
						{
							"name",
							0.3,
							"guide_close_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						}
					}
				}
			}
		}
	},
	[10340] = {
		is_close = 0,
		id = 10340,
		over_step = 0,
		skip = 1,
		desc = "摆放家具引导",
		special_step = {},
		act = {
			{
				"conditonstatus",
				"homeworldscene",
				0.1,
				{
					{
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"name",
							0.1,
							"guide_edit_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"打开编辑模式",
							0,
							0,
							0,
							0
						},
						{
							"name",
							0.3,
							"guide_btn_my_unit_4",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"name",
							0.3,
							"guide_my_unit_200104",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"选择自己想要摆放的家具",
							0,
							0,
							0,
							0
						},
						{
							"name",
							0.3,
							"guide_save_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						}
					},
					{
						{
							"checkstatus",
							"centercity",
							14,
							0.3
						},
						{
							"name",
							0.3,
							"guidesign_build_14",
							1,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							1,
							0
						},
						{
							"homeworldscene",
							0.3
						},
						{
							"name",
							0.1,
							"guide_edit_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"打开编辑模式",
							0,
							0,
							0,
							0
						},
						{
							"name",
							0.3,
							"guide_btn_my_unit_4",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"name",
							0.3,
							"guide_my_unit_200104",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"选择自己想要摆放的家具",
							0,
							0,
							0,
							0
						},
						{
							"name",
							0.3,
							"guide_save_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						}
					}
				}
			}
		}
	},
	[10350] = {
		is_close = 0,
		id = 10350,
		over_step = 0,
		skip = 1,
		desc = "调整家具引导",
		special_step = {},
		act = {
			{
				"conditonstatus",
				"homeworldscene",
				0.1,
				{
					{
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"name",
							0.1,
							"guide_edit_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"name",
							0.3,
							"guide_furniture_200104",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"name",
							0.3,
							"guide_dir_btn_200104",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"name",
							0.3,
							"guide_confirm_btn_200104",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"name",
							0.3,
							"guide_save_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						}
					},
					{
						{
							"checkstatus",
							"centercity",
							14,
							0.3
						},
						{
							"name",
							0.3,
							"guidesign_build_14",
							1,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							1,
							0
						},
						{
							"homeworldscene",
							0.3
						},
						{
							"name",
							0.1,
							"guide_edit_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"name",
							0.3,
							"guide_furniture_200104",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"name",
							0.3,
							"guide_dir_btn_200104",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"name",
							0.3,
							"guide_confirm_btn_200104",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"name",
							0.3,
							"guide_save_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						}
					}
				}
			}
		}
	},
	[10360] = {
		is_close = 0,
		id = 10360,
		over_step = 0,
		skip = 1,
		desc = "新手训练营引导",
		special_step = {},
		act = {
			{
				"conditonstatus",
				"checkmainui",
				0.1,
				{
					{
						{
							"name",
							0.3,
							"mainui_tab_1",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							-20,
							0,
							0,
							0
						},
						{
							"name",
							0.1,
							"guide_effect_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"trainingcampview",
							0.5
						},
						{
							"name",
							2.1,
							"training_btn_1",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						}
					},
					{
						{
							"mainui",
							0.1
						},
						{
							"name",
							0.1,
							"guide_effect_btn",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"trainingcampview",
							0.5
						},
						{
							"name",
							2.1,
							"training_btn_1",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						}
					}
				}
			}
		}
	},
	[10370] = {
		is_close = 0,
		id = 10370,
		over_step = 0,
		skip = 1,
		desc = "位面之境引导",
		special_step = {},
		act = {
			{
				"mainui",
				0.1
			},
			{
				"name",
				0.1,
				"mainui_tab_5",
				0,
				0,
				0,
				0,
				1,
				0,
				0,
				"",
				0,
				0,
				0,
				0
			},
			{
				"esecsiceview",
				0.2
			},
			{
				"name",
				0.1,
				"guide_activity_item_3",
				0,
				0,
				0,
				0,
				1,
				0,
				0,
				"",
				0,
				0,
				0,
				100
			}
		}
	},
	[10380] = {
		is_close = 0,
		id = 10380,
		over_step = 0,
		skip = 1,
		desc = "精灵引导",
		special_step = {},
		act = {
			{
				"conditonstatus",
				"partner",
				0.1,
				{
					{
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"name",
							0.3,
							"tab_btn_3",
							0,
							1,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"name",
							0.3,
							"guide_add_btn",
							0,
							1,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"elfinSelectview",
							0.1
						},
						{
							"name",
							0.3,
							"guide_select_btn",
							0,
							1,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						}
					},
					{
						{
							"mainui",
							0.1
						},
						{
							"name",
							0.1,
							"mainui_tab_2",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"partner",
							0.3
						},
						{
							"name",
							0.3,
							"tab_btn_3",
							0,
							1,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"name",
							0.3,
							"guide_add_btn",
							0,
							1,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"elfinSelectview",
							0.1
						},
						{
							"name",
							0.3,
							"guide_select_btn",
							0,
							1,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						}
					}
				}
			}
		}
	},
	[10382] = {
		is_close = 0,
		id = 10382,
		over_step = 0,
		skip = 1,
		desc = "精灵召唤引导",
		special_step = {},
		act = {
			{
				"conditonstatus",
				"partner",
				0.1,
				{
					{
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"name",
							0.3,
							"guide_tab_btn",
							0,
							1,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"name",
							0.3,
							"guide_wish_btn",
							0,
							1,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						}
					},
					{
						{
							"mainui",
							0.1
						},
						{
							"name",
							0.1,
							"mainui_tab_2",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"partner",
							0.3
						},
						{
							"name",
							0.3,
							"tab_btn_3",
							0,
							1,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"name",
							0.3,
							"guide_tab_btn",
							0,
							1,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"name",
							0.3,
							"guide_wish_btn",
							0,
							1,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						}
					}
				}
			}
		}
	},
	[10390] = {
		is_close = 0,
		id = 10390,
		over_step = 9,
		skip = 1,
		desc = "神装祈祷引导",
		special_step = {},
		act = {
			{
				"conditonstatus",
				"partner",
				0.1,
				{
					{
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"name",
							0.1,
							"hero_1",
							1,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"partnereinfoview",
							0.3
						},
						{
							"name",
							0.3,
							"holy_equip_btn",
							0,
							1,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"name",
							0.3,
							"guide_dungeon_btn",
							0,
							1,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"heavenmainview",
							0.3
						},
						{
							"name",
							0.3,
							"guide_extract_btn_1",
							0,
							1,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"getitemview",
							0.3
						},
						{
							"name",
							0.3,
							"guide_close_btn",
							0,
							1,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						}
					},
					{
						{
							"mainui",
							0.1
						},
						{
							"name",
							0.1,
							"mainui_tab_2",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"partner",
							0.3
						},
						{
							"name",
							0.1,
							"hero_1",
							1,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"partnereinfoview",
							0.3
						},
						{
							"name",
							0.3,
							"holy_equip_btn",
							0,
							1,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"name",
							0.3,
							"guide_dungeon_btn",
							0,
							1,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"heavenmainview",
							0.3
						},
						{
							"name",
							0.3,
							"guide_extract_btn_1",
							0,
							1,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"getitemview",
							0.3
						},
						{
							"name",
							0.3,
							"guide_close_btn",
							0,
							1,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						}
					}
				}
			}
		}
	},
	[10400] = {
		is_close = 0,
		id = 10400,
		over_step = 0,
		skip = 0,
		desc = "神装穿戴引导",
		special_step = {},
		act = {
			{
				"conditonstatus",
				"heavenmainview",
				0.1,
				{
					{
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"emptystep"
						},
						{
							"name",
							0.1,
							"guide_close_btn",
							0,
							1,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"partnereinfoview",
							0.3
						},
						{
							"name",
							0.1,
							"guidehloye_equip_item_1",
							1,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"equipclothview",
							0.3
						},
						{
							"name",
							0.1,
							"guildsign_equip_list_item_1",
							0,
							1,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						}
					},
					{
						{
							"mainui",
							0.1
						},
						{
							"name",
							0.1,
							"mainui_tab_2",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"partner",
							0.3
						},
						{
							"name",
							0.1,
							"hero_1",
							1,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"partnereinfoview",
							0.3
						},
						{
							"name",
							0.3,
							"holy_equip_btn",
							0,
							1,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"name",
							0.3,
							"guidehloye_equip_item_1",
							0,
							1,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						},
						{
							"equipclothview",
							0.3
						},
						{
							"name",
							0.1,
							"guildsign_equip_list_item_1",
							0,
							1,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							0
						}
					}
				}
			}
		}
	},
	[10410] = {
		is_close = 0,
		id = 10410,
		over_step = 0,
		skip = 0,
		desc = "神装副本引导",
		special_step = {},
		act = {
			{
				"conditonstatus",
				"checkmainui",
				0.1,
				{
					{
						{
							"name",
							0.3,
							"mainui_tab_1",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							100
						},
						{
							"checkstatus",
							"centercity",
							11,
							0.3
						},
						{
							"name",
							0.3,
							"guidesign_build_11",
							1,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							1,
							100
						},
						{
							"adventureactivityview",
							0.3
						},
						{
							"name",
							0.3,
							"guildadventure_activity_item_3",
							0,
							1,
							0,
							0,
							1,
							150,
							0,
							"",
							0,
							0,
							0,
							0
						}
					},
					{
						{
							"emptystep"
						},
						{
							"checkstatus",
							"centercity",
							11,
							0.3
						},
						{
							"name",
							0.3,
							"guidesign_build_11",
							1,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							1,
							100
						},
						{
							"adventureactivityview",
							0.3
						},
						{
							"name",
							0.3,
							"guildadventure_activity_item_3",
							0,
							1,
							0,
							0,
							1,
							150,
							0,
							"",
							0,
							0,
							0,
							0
						}
					}
				}
			}
		}
	},
	[10420] = {
		is_close = 0,
		id = 10420,
		over_step = 0,
		skip = 0,
		desc = "原力水晶引导",
		special_step = {},
		act = {
			{
				"conditonstatus",
				"checkmainui",
				0.1,
				{
					{
						{
							"name",
							0.3,
							"mainui_tab_1",
							0,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							100
						},
						{
							"checkstatus",
							"centercity",
							15,
							0.3
						},
						{
							"name",
							0.3,
							"guidesign_build_15",
							1,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							1,
							100
						},
						{
							"heroresonateiew",
							0.3
						},
						{
							"name",
							1,
							"hero_1",
							0,
							1,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							100
						}
					},
					{
						{
							"emptystep"
						},
						{
							"checkstatus",
							"centercity",
							15,
							0.3
						},
						{
							"name",
							0.3,
							"guidesign_build_15",
							1,
							0,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							1,
							100
						},
						{
							"heroresonateiew",
							0.3
						},
						{
							"name",
							1,
							"hero_1",
							0,
							1,
							0,
							0,
							1,
							0,
							0,
							"",
							0,
							0,
							0,
							100
						}
					}
				}
			}
		}
	}
}

function Config.DramaData.data_guide_fun(slot0)
	slot1 = Config.DramaData.data_guide[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.DramaData.data_guide[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.DramaData.data_lev_guide_length = 0
Config.DramaData.data_lev_guide = {}

function Config.DramaData.data_lev_guide_fun(slot0)
	slot1 = Config.DramaData.data_lev_guide[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.DramaData.data_lev_guide[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
