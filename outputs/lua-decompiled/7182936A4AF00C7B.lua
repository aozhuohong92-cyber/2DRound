Config = Config or {}
Config.HomePetData = Config.HomePetData or {}
Config.HomePetData.data_const_length = 16
Config.HomePetData.data_const = {
	pet_name = {
		val = 1,
		desc = "呆萌二哈"
	},
	pet_interest = {
		val = 1,
		desc = "旅行、写信、吃东西"
	},
	pet_character = {
		val = 1,
		desc = "活泼、呆萌"
	},
	pet_story = {
		val = 1,
		desc = "打一出生就被你带回家精心饲养的狗狗，拥有无穷无尽的精力，喜欢卖萌和思考狗生。\n据说是狼的后代，长相上也与西伯利海贼11号有相似之处，但看着它蹭在主人脚边的样子，可能也就只有长相和狼有点关系了。\n二哈偶尔也会思考下狗生和一些奇奇怪怪的问题，所以有时候会一汪惊人。"
	},
	power_initial_value = {
		val = 20,
		desc = "初始值"
	},
	power_upper_limit = {
		val = 100,
		desc = "上限"
	},
	power_recovery_speed = {
		val = 1200,
		desc = "恢复速度 （多少秒/点）"
	},
	pet_tips = {
		val = 1,
		desc = [[
1.萌宠每次出行会消耗一定的精力值。
2.萌宠在家时，会定时恢复精力值。
3.与萌宠互动时，精力值也可以得到些许恢复。
4.精力值越高，萌宠出行的可能性越大。]]
	},
	travelling_bag_tips = {
		val = 1,
		desc = [[
1.萌宠出行所需要的食物和道具可以在商城中购买。
2.在背包中放入食物后，萌宠会在一段时间后自主旅行。
3.萌宠的精力值越高，出行概率则越高。与萌宠互动有几率恢复少量精力值。
4.萌宠出行除了可以带回稀有的家具、灵墓、培养道具、明信片、日记、珍品等特色奖励，还伴随着贝里、钻石、英雄碎片、强化训练等养成资源。]]
	},
	travel_judgement_interval = {
		val = 900,
		desc = "多久判断一次出行（秒）"
	},
	rename_cost = {
		val = 100,
		desc = "每次消耗的钻石数"
	},
	conversation_upper_limit = {
		val = 10,
		desc = "每天对话次数上限"
	},
	pocket_money_upper_limit = {
		val = 2,
		desc = "每天消耗（给零花钱）次数上限"
	},
	initial_city = {
		val = 100,
		desc = "首次出行城市id"
	},
	pet_act_interval = {
		val = 15,
		desc = "长时间停留界面时，多久切换动作（秒）"
	},
	initial_sid = {
		desc = "首次出行事件奖励",
		val = {
			{
				1,
				1060101,
				{
					{
						100401,
						1
					}
				}
			},
			{
				2,
				1070101,
				{
					{
						100501,
						1
					}
				}
			},
			{
				3,
				2,
				{
					{
						3,
						20
					},
					{
						1,
						120000
					},
					{
						200113,
						1
					},
					{
						29905,
						1
					},
					{
						10450,
						30
					}
				}
			}
		}
	}
}

function Config.HomePetData.data_const_fun(slot0)
	slot1 = Config.HomePetData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HomePetData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HomePetData.data_event_info_length = 206
Config.HomePetData.data_event_info = {
	{
		is_award = 0,
		type = 0,
		is_show = 0,
		desc = "萌宠出行事件",
		id = 10001,
		is_notice = 1,
		s_id = 1,
		award = {},
		drop_ids = {}
	},
	{
		is_award = 0,
		type = 0,
		is_show = 0,
		desc = "萌宠归来事件",
		id = 10002,
		is_notice = 1,
		s_id = 2,
		award = {},
		drop_ids = {}
	},
	[1010101] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "一只蝴蝶飞过，<div fontcolor=#e25a00>%s</div>奋力一跃，没有抓到蝴蝶，“噗通”一声摔到了草地上。",
		id = 10101,
		is_notice = 0,
		s_id = 1010101,
		award = {},
		drop_ids = {}
	},
	[1010102] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>在路上遇到了一只柴柴，两只狗狗欢快地一起玩耍。",
		id = 10101,
		is_notice = 0,
		s_id = 1010102,
		award = {},
		drop_ids = {}
	},
	[1010103] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "呆呆地看着到处狂奔接主人扔出去的飞盘，<div fontcolor=#e25a00>%s</div>脸上露出了向往的表情。",
		id = 10101,
		is_notice = 0,
		s_id = 1010103,
		award = {},
		drop_ids = {}
	},
	[1010104] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>路过了一家服装店，透过玻璃窗看着里面的衣服，想象着自己的主人穿上它们会怎么样 。",
		id = 10101,
		is_notice = 0,
		s_id = 1010104,
		award = {},
		drop_ids = {}
	},
	[1010105] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "因为在电视上看到了西伯利海贼11号，觉得和自己长得有点像，<div fontcolor=#e25a00>%s</div>开始陷入了沉思。",
		id = 10101,
		is_notice = 0,
		s_id = 1010105,
		award = {},
		drop_ids = {}
	},
	[1010106] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>在屋檐下躲雨，屋子的主人看到后，好心地打开了门让它进去。",
		id = 10101,
		is_notice = 0,
		s_id = 1010106,
		award = {},
		drop_ids = {}
	},
	[1010107] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "一个人正在坐在路边吃着什么水果，<div fontcolor=#e25a00>%s</div>闻到了传来的味道，远远地走开了。",
		id = 10101,
		is_notice = 0,
		s_id = 1010107,
		award = {},
		drop_ids = {}
	},
	[1010108] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "天气实在是太热了，<div fontcolor=#e25a00>%s</div>坐在树下，伸出了舌头给自己散热。",
		id = 10101,
		is_notice = 0,
		s_id = 1010108,
		award = {},
		drop_ids = {}
	},
	[1010109] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "一只乌龟正在慢悠悠地爬着，<div fontcolor=#e25a00>%s</div>好奇地用爪子拨了拨龟壳，吓得乌龟立刻把头伸进了龟壳里面。",
		id = 10101,
		is_notice = 0,
		s_id = 1010109,
		award = {},
		drop_ids = {}
	},
	[1010110] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>觉得有点累了，趴在了一棵大树下面，懒洋洋地打了个哈欠。",
		id = 10101,
		is_notice = 0,
		s_id = 1010110,
		award = {},
		drop_ids = {}
	},
	[1020101] = {
		is_award = 1,
		type = 2,
		is_show = 1,
		desc = "角落发出了一点光芒，<div fontcolor=#e25a00>%s</div>走近一看，发现原来是<div fontcolor=#e25a00>钻石</div>。",
		id = 10201,
		is_notice = 0,
		s_id = 1020101,
		award = {
			{
				3,
				20
			}
		},
		drop_ids = {}
	},
	[1030101] = {
		is_award = 1,
		type = 3,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>在公园长椅边的草地上发现了<div fontcolor=#e25a00>贝里</div>，趁着没人注意偷偷藏了起来。",
		id = 10301,
		is_notice = 0,
		s_id = 1030101,
		award = {
			{
				1,
				120000
			}
		},
		drop_ids = {}
	},
	[1040101] = {
		is_award = 1,
		type = 4,
		is_show = 1,
		desc = "一套温馨的家具吸引住了<div fontcolor=#e25a00>%s</div>的眼球！",
		id = 10401,
		is_notice = 0,
		s_id = 1040101,
		award = {
			{
				200113,
				1
			}
		},
		drop_ids = {}
	},
	[1050101] = {
		is_award = 1,
		type = 5,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>发现了一件好看的<div fontcolor=#e25a00>珍品</div>，决定送给你。",
		id = 10501,
		is_notice = 0,
		s_id = 1050101,
		award = {},
		drop_ids = {}
	},
	[1060101] = {
		is_award = 0,
		type = 6,
		is_show = 1,
		desc = "在旅途中看到了美丽的景色，<div fontcolor=#e25a00>%s</div>决定拍下<div fontcolor=#e25a00>明信片</div>分享给你看。",
		id = 10601,
		is_notice = 1,
		s_id = 1060101,
		award = {
			{
				100401,
				1
			}
		},
		drop_ids = {}
	},
	[1070101] = {
		is_award = 0,
		type = 7,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>将爪子伸进背包里摸索了一番，掏出了笔，写下了一封<div fontcolor=#e25a00>信</div>。",
		id = 10701,
		is_notice = 1,
		s_id = 1070101,
		award = {
			{
				100501,
				1
			}
		},
		drop_ids = {}
	},
	[1090101] = {
		is_award = 1,
		type = 9,
		is_show = 1,
		desc = "在角落里发现了一片<div fontcolor=#e25a00>神秘的碎片</div>，<div fontcolor=#e25a00>%s</div>顺手丢到了背包里。",
		id = 10901,
		is_notice = 0,
		s_id = 1090101,
		award = {
			{
				29905,
				1
			}
		},
		drop_ids = {}
	},
	[1100101] = {
		is_award = 1,
		type = 10,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>一不小心闯进了占星师的家中，发现了<div fontcolor=#e25a00>强化训练</div>。",
		id = 11001,
		is_notice = 0,
		s_id = 1100101,
		award = {
			{
				10450,
				30
			}
		},
		drop_ids = {}
	},
	[1110101] = {
		is_award = 1,
		type = 11,
		is_show = 1,
		desc = "在沉睡森卡莉法里发现了一颗<div fontcolor=#e25a00>神秘的蛋</div>，<div fontcolor=#e25a00>%s</div>小心翼翼地将它装进了背包。",
		id = 11101,
		is_notice = 0,
		s_id = 1110101,
		award = {},
		drop_ids = {}
	},
	[1120101] = {
		is_award = 1,
		type = 12,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>拜访了工匠请教孵蛋的方法，它竟然建议说可以用<div fontcolor=#e25a00>锤子</div>砸开。",
		id = 11201,
		is_notice = 0,
		s_id = 1120101,
		award = {},
		drop_ids = {}
	},
	[1011101] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "一只蝴蝶飞过，<div fontcolor=#e25a00>%s</div>奋力一跃，没有抓到蝴蝶，“噗通”一声摔到了草地上。",
		id = 10111,
		is_notice = 0,
		s_id = 1011101,
		award = {},
		drop_ids = {}
	},
	[1011102] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>在路上遇到了一只柴柴，两只狗狗欢快地一起玩耍。",
		id = 10111,
		is_notice = 0,
		s_id = 1011102,
		award = {},
		drop_ids = {}
	},
	[1011103] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "呆呆地看着到处狂奔接主人扔出去的飞盘，<div fontcolor=#e25a00>%s</div>脸上露出了向往的表情。",
		id = 10111,
		is_notice = 0,
		s_id = 1011103,
		award = {},
		drop_ids = {}
	},
	[1011104] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>路过了一家服装店，透过玻璃窗看着里面的衣服，想象着自己的主人穿上它们会怎么样 。",
		id = 10111,
		is_notice = 0,
		s_id = 1011104,
		award = {},
		drop_ids = {}
	},
	[1011105] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "因为在电视上看到了西伯利海贼11号，觉得和自己长得有点像，<div fontcolor=#e25a00>%s</div>开始陷入了沉思。",
		id = 10111,
		is_notice = 0,
		s_id = 1011105,
		award = {},
		drop_ids = {}
	},
	[1011106] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>在屋檐下躲雨，屋子的主人看到后，好心地打开了门让它进去。",
		id = 10111,
		is_notice = 0,
		s_id = 1011106,
		award = {},
		drop_ids = {}
	},
	[1011107] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "一个人正在坐在路边吃着什么水果，<div fontcolor=#e25a00>%s</div>闻到了传来的味道，远远地走开了。",
		id = 10111,
		is_notice = 0,
		s_id = 1011107,
		award = {},
		drop_ids = {}
	},
	[1011108] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "天气实在是太热了，<div fontcolor=#e25a00>%s</div>坐在树下，伸出了舌头给自己散热。",
		id = 10111,
		is_notice = 0,
		s_id = 1011108,
		award = {},
		drop_ids = {}
	},
	[1011109] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "一只乌龟正在慢悠悠地爬着，<div fontcolor=#e25a00>%s</div>好奇地用爪子拨了拨龟壳，吓得乌龟立刻把头伸进了龟壳里面。",
		id = 10111,
		is_notice = 0,
		s_id = 1011109,
		award = {},
		drop_ids = {}
	},
	[1011110] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>觉得有点累了，趴在了一棵大树下面，懒洋洋地打了个哈欠。",
		id = 10111,
		is_notice = 0,
		s_id = 1011110,
		award = {},
		drop_ids = {}
	},
	[1021101] = {
		is_award = 1,
		type = 2,
		is_show = 1,
		desc = "拿出放大镜的<div fontcolor=#e25a00>%s</div>，在附近发现了<div fontcolor=#e25a00>钻石</div>。",
		id = 10211,
		is_notice = 0,
		s_id = 1021101,
		award = {
			{
				3,
				20
			}
		},
		drop_ids = {}
	},
	[1031101] = {
		is_award = 1,
		type = 3,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>拿出了放大镜，在附近发现了<div fontcolor=#e25a00>贝里</div>。",
		id = 10311,
		is_notice = 0,
		s_id = 1031101,
		award = {
			{
				1,
				120000
			}
		},
		drop_ids = {}
	},
	[1041101] = {
		is_award = 1,
		type = 4,
		is_show = 1,
		desc = "因为帮助了家具店老板，老板决定送给<div fontcolor=#e25a00>%s</div>一件<div fontcolor=#e25a00>家具</div>。",
		id = 10411,
		is_notice = 0,
		s_id = 1041101,
		award = {},
		drop_ids = {
			1041101
		}
	},
	[1051101] = {
		is_award = 1,
		type = 5,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>路过一条特色小街，发现了许多当地独有的<div fontcolor=#e25a00>珍品</div>。",
		id = 10511,
		is_notice = 0,
		s_id = 1051101,
		award = {},
		drop_ids = {
			1051101
		}
	},
	[1061101] = {
		is_award = 0,
		type = 6,
		is_show = 1,
		desc = "路过一个地方，<div fontcolor=#e25a00>%s</div>觉得你一定会喜欢的，于是掏出相机拍了一张<div fontcolor=#e25a00>照片</div>。",
		id = 10611,
		is_notice = 1,
		s_id = 1061101,
		award = {},
		drop_ids = {
			1061101
		}
	},
	[1071101] = {
		is_award = 0,
		type = 7,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>将熬夜写下的<div fontcolor=#e25a00>信件</div>投入了邮筒里。",
		id = 10711,
		is_notice = 1,
		s_id = 1071101,
		award = {},
		drop_ids = {
			1071101
		}
	},
	[1091101] = {
		is_award = 1,
		type = 9,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>在一个礼品店里发现了一个装着<div fontcolor=#e25a00>神秘碎片</div>的礼盒。",
		id = 10911,
		is_notice = 0,
		s_id = 1091101,
		award = {
			{
				29905,
				1
			}
		},
		drop_ids = {}
	},
	[1101101] = {
		is_award = 1,
		type = 10,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>无意间进入了一个神秘的洞穴中，发现了<div fontcolor=#e25a00>强化训练</div>。",
		id = 11011,
		is_notice = 0,
		s_id = 1101101,
		award = {
			{
				10450,
				30
			}
		},
		drop_ids = {}
	},
	[1111101] = {
		is_award = 1,
		type = 11,
		is_show = 1,
		desc = "在沉睡森卡莉法里发现了一颗<div fontcolor=#e25a00>神秘的蛋</div>，<div fontcolor=#e25a00>%s</div>小心翼翼地将它装进了背包。",
		id = 11111,
		is_notice = 0,
		s_id = 1111101,
		award = {},
		drop_ids = {
			1111101
		}
	},
	[1121101] = {
		is_award = 1,
		type = 12,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>拜访了工匠请教孵蛋的方法，它竟然建议说可以用<div fontcolor=#e25a00>锤子</div>砸开。",
		id = 11211,
		is_notice = 0,
		s_id = 1121101,
		award = {},
		drop_ids = {
			1121101
		}
	},
	[1012101] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>在屋檐下躲雨，屋子的主人看到后，好心地打开了门让它进去。",
		id = 10121,
		is_notice = 0,
		s_id = 1012101,
		award = {},
		drop_ids = {}
	},
	[1012102] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "一个人正在坐在路边吃着什么水果，<div fontcolor=#e25a00>%s</div>闻到了传来的味道，远远地走开了。",
		id = 10121,
		is_notice = 0,
		s_id = 1012102,
		award = {},
		drop_ids = {}
	},
	[1012103] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "天气实在是太热了，<div fontcolor=#e25a00>%s</div>坐在树下，伸出了舌头给自己散热。",
		id = 10121,
		is_notice = 0,
		s_id = 1012103,
		award = {},
		drop_ids = {}
	},
	[1012104] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "一只乌龟正在慢悠悠地爬着，<div fontcolor=#e25a00>%s</div>好奇地用爪子拨了拨龟壳，吓得乌龟立刻把头伸进了龟壳里面。",
		id = 10121,
		is_notice = 0,
		s_id = 1012104,
		award = {},
		drop_ids = {}
	},
	[1012105] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>觉得有点累了，趴在了一棵大树下面，懒洋洋地打了个哈欠。",
		id = 10121,
		is_notice = 0,
		s_id = 1012105,
		award = {},
		drop_ids = {}
	},
	[1012106] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "肚子开始咕咕地叫，<div fontcolor=#e25a00>%s</div>从背包里掏出了主人精心准备的食物，大口大口地吃了起来。",
		id = 10121,
		is_notice = 0,
		s_id = 1012106,
		award = {},
		drop_ids = {}
	},
	[1012107] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>拿出为主人买的威士忌，偷偷地尝了一口，昏昏沉沉地睡了过去。",
		id = 10121,
		is_notice = 0,
		s_id = 1012107,
		award = {},
		drop_ids = {}
	},
	[1012108] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "在路边的石头缝中发现了一枚银光闪闪的硬币，<div fontcolor=#e25a00>%s</div>觉得很喜欢，并放进了背包中。",
		id = 10121,
		is_notice = 0,
		s_id = 1012108,
		award = {},
		drop_ids = {}
	},
	[1012109] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>在旅途中发现了一种很好看的酒杯，真想买一个送给主人。",
		id = 10121,
		is_notice = 0,
		s_id = 1012109,
		award = {},
		drop_ids = {}
	},
	[1012110] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>被贝雕画深深地迷住了，看了许久。",
		id = 10121,
		is_notice = 0,
		s_id = 1012110,
		award = {},
		drop_ids = {}
	},
	[1022101] = {
		is_award = 1,
		type = 2,
		is_show = 1,
		desc = "角落发出了一点光芒，<div fontcolor=#e25a00>%s</div>走近一看，发现原来是<div fontcolor=#e25a00>钻石</div>。",
		id = 10221,
		is_notice = 0,
		s_id = 1022101,
		award = {
			{
				3,
				20
			}
		},
		drop_ids = {}
	},
	[1032101] = {
		is_award = 1,
		type = 3,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>发现了一个小型金矿，只取一点<div fontcolor=#e25a00>黄金</div>应该不会被发现吧！",
		id = 10321,
		is_notice = 0,
		s_id = 1032101,
		award = {
			{
				1,
				120000
			}
		},
		drop_ids = {}
	},
	[1042101] = {
		is_award = 1,
		type = 4,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>看中了一件很有特色的<div fontcolor=#e25a00>家具</div>。",
		id = 10421,
		is_notice = 0,
		s_id = 1042101,
		award = {},
		drop_ids = {
			1042101
		}
	},
	[1052101] = {
		is_award = 1,
		type = 5,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>走过一条满是当地特色的街道，看着琳琅满目的<div fontcolor=#e25a00>珍品</div>店，若有不舍。",
		id = 10521,
		is_notice = 0,
		s_id = 1052101,
		award = {},
		drop_ids = {
			1052101
		}
	},
	[1062101] = {
		is_award = 0,
		type = 6,
		is_show = 1,
		desc = "你的<div fontcolor=#e25a00>%s</div>旅途中给你寄来了<div fontcolor=#e25a00>明信片</div>！",
		id = 10621,
		is_notice = 1,
		s_id = 1062101,
		award = {},
		drop_ids = {
			1062101
		}
	},
	[1072101] = {
		is_award = 0,
		type = 7,
		is_show = 1,
		desc = "望着天空思考良久的<div fontcolor=#e25a00>%s</div>，最后决定写一封<div fontcolor=#e25a00>信</div>。",
		id = 10721,
		is_notice = 1,
		s_id = 1072101,
		award = {},
		drop_ids = {
			1072101
		}
	},
	[1092101] = {
		is_award = 1,
		type = 9,
		is_show = 1,
		desc = "在角落里发现了一片<div fontcolor=#e25a00>神秘的碎片</div>，<div fontcolor=#e25a00>%s</div>顺手丢到了背包里。",
		id = 10921,
		is_notice = 0,
		s_id = 1092101,
		award = {
			{
				29905,
				1
			}
		},
		drop_ids = {}
	},
	[1102101] = {
		is_award = 1,
		type = 10,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>一不小心闯进了占星师的家中，发现了<div fontcolor=#e25a00>强化训练</div>。",
		id = 11021,
		is_notice = 0,
		s_id = 1102101,
		award = {
			{
				10450,
				30
			}
		},
		drop_ids = {}
	},
	[1112101] = {
		is_award = 1,
		type = 11,
		is_show = 1,
		desc = "在沉睡森卡莉法里发现了一颗<div fontcolor=#e25a00>神秘的蛋</div>，<div fontcolor=#e25a00>%s</div>小心翼翼地将它装进了背包。",
		id = 11121,
		is_notice = 0,
		s_id = 1112101,
		award = {},
		drop_ids = {
			1112101
		}
	},
	[1122101] = {
		is_award = 1,
		type = 12,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>拜访了工匠请教孵蛋的方法，它竟然建议说可以用<div fontcolor=#e25a00>锤子</div>砸开。",
		id = 11221,
		is_notice = 0,
		s_id = 1122101,
		award = {},
		drop_ids = {
			1122101
		}
	},
	[1013101] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "肚子开始咕咕地叫，<div fontcolor=#e25a00>%s</div>从背包里掏出了主人精心准备的食物，大口大口地吃了起来。",
		id = 10131,
		is_notice = 0,
		s_id = 1013101,
		award = {},
		drop_ids = {}
	},
	[1013102] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>拿出为主人买的威士忌，偷偷地尝了一口，昏昏沉沉地睡了过去。",
		id = 10131,
		is_notice = 0,
		s_id = 1013102,
		award = {},
		drop_ids = {}
	},
	[1013103] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "在路边的石头缝中发现了一枚银光闪闪的硬币，<div fontcolor=#e25a00>%s</div>觉得很喜欢，并放进了背包中。",
		id = 10131,
		is_notice = 0,
		s_id = 1013103,
		award = {},
		drop_ids = {}
	},
	[1013104] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>在旅途中发现了一种很好看的酒杯，真想买一个送给主人。",
		id = 10131,
		is_notice = 0,
		s_id = 1013104,
		award = {},
		drop_ids = {}
	},
	[1013105] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>被贝雕画深深地迷住了，看了许久。",
		id = 10131,
		is_notice = 0,
		s_id = 1013105,
		award = {},
		drop_ids = {}
	},
	[1013106] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>突然闻见了一股很香的味道，顺着味道寻找过去，原来是香水。",
		id = 10131,
		is_notice = 0,
		s_id = 1013106,
		award = {},
		drop_ids = {}
	},
	[1013107] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "路边有人在吹着萧笛，<div fontcolor=#e25a00>%s</div>开心地笑了。",
		id = 10131,
		is_notice = 0,
		s_id = 1013107,
		award = {},
		drop_ids = {}
	},
	[1013108] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "正在路边悠闲地散着步的<div fontcolor=#e25a00>%s</div>，感受着傍晚的习习凉风。",
		id = 10131,
		is_notice = 0,
		s_id = 1013108,
		award = {},
		drop_ids = {}
	},
	[1013109] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>拨弄着脖子上的铃铛，铃铛不断地发出了响声。",
		id = 10131,
		is_notice = 0,
		s_id = 1013109,
		award = {},
		drop_ids = {}
	},
	[1013110] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>来到了一处荒无人烟的地方，旅行果然偶尔也会有点寂寞。",
		id = 10131,
		is_notice = 0,
		s_id = 1013110,
		award = {},
		drop_ids = {}
	},
	[1023101] = {
		is_award = 1,
		type = 2,
		is_show = 1,
		desc = "拿出放大镜的<div fontcolor=#e25a00>%s</div>，在附近发现了<div fontcolor=#e25a00>钻石</div>。",
		id = 10231,
		is_notice = 0,
		s_id = 1023101,
		award = {
			{
				3,
				20
			}
		},
		drop_ids = {}
	},
	[1033101] = {
		is_award = 1,
		type = 3,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>在公园长椅边的草地上发现了<div fontcolor=#e25a00>贝里</div>，趁着没人注意偷偷藏了起来。",
		id = 10331,
		is_notice = 0,
		s_id = 1033101,
		award = {
			{
				1,
				120000
			}
		},
		drop_ids = {}
	},
	[1043101] = {
		is_award = 1,
		type = 4,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>径直地走进了一家摆满<div fontcolor=#e25a00>家具</div>的专卖店！",
		id = 10431,
		is_notice = 0,
		s_id = 1043101,
		award = {},
		drop_ids = {
			1043101
		}
	},
	[1053101] = {
		is_award = 1,
		type = 5,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>发现了一件好看的<div fontcolor=#e25a00>珍品</div>，决定送给你。",
		id = 10531,
		is_notice = 0,
		s_id = 1053101,
		award = {},
		drop_ids = {
			1053101
		}
	},
	[1063101] = {
		is_award = 0,
		type = 6,
		is_show = 1,
		desc = "在旅途中看到了美丽的景色，<div fontcolor=#e25a00>%s</div>决定拍下<div fontcolor=#e25a00>明信片</div>分享给你看。",
		id = 10631,
		is_notice = 1,
		s_id = 1063101,
		award = {},
		drop_ids = {
			1063101
		}
	},
	[1073101] = {
		is_award = 0,
		type = 7,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>将爪子伸进背包里摸索了一番，掏出了笔，写下了一封<div fontcolor=#e25a00>信</div>。",
		id = 10731,
		is_notice = 1,
		s_id = 1073101,
		award = {},
		drop_ids = {
			1073101
		}
	},
	[1093101] = {
		is_award = 1,
		type = 9,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>在一个礼品店里发现了一个装着<div fontcolor=#e25a00>神秘碎片</div>的礼盒。",
		id = 10931,
		is_notice = 0,
		s_id = 1093101,
		award = {
			{
				29905,
				1
			}
		},
		drop_ids = {}
	},
	[1103101] = {
		is_award = 1,
		type = 10,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>无意间进入了一个神秘的洞穴中，发现了<div fontcolor=#e25a00>强化训练</div>。",
		id = 11031,
		is_notice = 0,
		s_id = 1103101,
		award = {
			{
				10450,
				30
			}
		},
		drop_ids = {}
	},
	[1113101] = {
		is_award = 1,
		type = 11,
		is_show = 1,
		desc = "在沉睡森卡莉法里发现了一颗<div fontcolor=#e25a00>神秘的蛋</div>，<div fontcolor=#e25a00>%s</div>小心翼翼地将它装进了背包。",
		id = 11131,
		is_notice = 0,
		s_id = 1113101,
		award = {},
		drop_ids = {
			1113101
		}
	},
	[1123101] = {
		is_award = 1,
		type = 12,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>拜访了工匠请教孵蛋的方法，它竟然建议说可以用<div fontcolor=#e25a00>锤子</div>砸开。",
		id = 11231,
		is_notice = 0,
		s_id = 1123101,
		award = {},
		drop_ids = {
			1123101
		}
	},
	[1014101] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>突然闻见了一股很香的味道，顺着味道寻找过去，原来是香水。",
		id = 10141,
		is_notice = 0,
		s_id = 1014101,
		award = {},
		drop_ids = {}
	},
	[1014102] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "路边有人在吹着萧笛，<div fontcolor=#e25a00>%s</div>开心地笑了。",
		id = 10141,
		is_notice = 0,
		s_id = 1014102,
		award = {},
		drop_ids = {}
	},
	[1014103] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "正在路边悠闲地散着步的<div fontcolor=#e25a00>%s</div>，感受着傍晚的习习凉风。",
		id = 10141,
		is_notice = 0,
		s_id = 1014103,
		award = {},
		drop_ids = {}
	},
	[1014104] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>拨弄着脖子上的铃铛，铃铛不断地发出了响声。",
		id = 10141,
		is_notice = 0,
		s_id = 1014104,
		award = {},
		drop_ids = {}
	},
	[1014105] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>来到了一处荒无人烟的地方，旅行果然偶尔也会有点寂寞。",
		id = 10141,
		is_notice = 0,
		s_id = 1014105,
		award = {},
		drop_ids = {}
	},
	[1014106] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>在背包中拿出了玻璃球，阳光下玻璃球散发出了耀眼的光芒。",
		id = 10141,
		is_notice = 0,
		s_id = 1014106,
		award = {},
		drop_ids = {}
	},
	[1014107] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>停下来驻足休息，拿出手机欣赏旅途中拍下的照片。",
		id = 10141,
		is_notice = 0,
		s_id = 1014107,
		award = {},
		drop_ids = {}
	},
	[1014108] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "路上遇到了恶犬，<div fontcolor=#e25a00>%s</div>凭借着学来的狼嚎成功将其吓跑。",
		id = 10141,
		is_notice = 0,
		s_id = 1014108,
		award = {},
		drop_ids = {}
	},
	[1014109] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>在路上遇到了一只同样背着包包的青蛙，于是它们一起前行了一段路。",
		id = 10141,
		is_notice = 0,
		s_id = 1014109,
		award = {},
		drop_ids = {}
	},
	[1014110] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "一片落叶被风吹上了半空，<div fontcolor=#e25a00>%s</div>兴奋地跟随着落叶一路狂奔。",
		id = 10141,
		is_notice = 0,
		s_id = 1014110,
		award = {},
		drop_ids = {}
	},
	[1024101] = {
		is_award = 1,
		type = 2,
		is_show = 1,
		desc = "角落发出了一点光芒，<div fontcolor=#e25a00>%s</div>走近一看，发现原来是<div fontcolor=#e25a00>钻石</div>。",
		id = 10241,
		is_notice = 0,
		s_id = 1024101,
		award = {
			{
				3,
				20
			}
		},
		drop_ids = {}
	},
	[1034101] = {
		is_award = 1,
		type = 3,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>拿出了放大镜，在附近发现了<div fontcolor=#e25a00>贝里</div>。",
		id = 10341,
		is_notice = 0,
		s_id = 1034101,
		award = {
			{
				1,
				120000
			}
		},
		drop_ids = {}
	},
	[1044101] = {
		is_award = 1,
		type = 4,
		is_show = 1,
		desc = "因为帮助了家具店老板，老板决定送给<div fontcolor=#e25a00>%s</div>一件<div fontcolor=#e25a00>家具</div>。",
		id = 10441,
		is_notice = 0,
		s_id = 1044101,
		award = {},
		drop_ids = {
			1044101
		}
	},
	[1054101] = {
		is_award = 1,
		type = 5,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>路过一条特色小街，发现了许多当地独有的<div fontcolor=#e25a00>珍品</div>。",
		id = 10541,
		is_notice = 0,
		s_id = 1054101,
		award = {},
		drop_ids = {
			1054101
		}
	},
	[1064101] = {
		is_award = 0,
		type = 6,
		is_show = 1,
		desc = "路过一个地方，<div fontcolor=#e25a00>%s</div>觉得你一定会喜欢的，于是掏出相机拍了一张<div fontcolor=#e25a00>照片</div>。",
		id = 10641,
		is_notice = 1,
		s_id = 1064101,
		award = {},
		drop_ids = {
			1064101
		}
	},
	[1074101] = {
		is_award = 0,
		type = 7,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>将熬夜写下的<div fontcolor=#e25a00>信件</div>投入了邮筒里。",
		id = 10741,
		is_notice = 1,
		s_id = 1074101,
		award = {},
		drop_ids = {
			1074101
		}
	},
	[1094101] = {
		is_award = 1,
		type = 9,
		is_show = 1,
		desc = "在角落里发现了一片<div fontcolor=#e25a00>神秘的碎片</div>，<div fontcolor=#e25a00>%s</div>顺手丢到了背包里。",
		id = 10941,
		is_notice = 0,
		s_id = 1094101,
		award = {
			{
				29905,
				1
			}
		},
		drop_ids = {}
	},
	[1104101] = {
		is_award = 1,
		type = 10,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>一不小心闯进了占星师的家中，发现了<div fontcolor=#e25a00>强化训练</div>。",
		id = 11041,
		is_notice = 0,
		s_id = 1104101,
		award = {
			{
				10450,
				30
			}
		},
		drop_ids = {}
	},
	[1114101] = {
		is_award = 1,
		type = 11,
		is_show = 1,
		desc = "在沉睡森卡莉法里发现了一颗<div fontcolor=#e25a00>神秘的蛋</div>，<div fontcolor=#e25a00>%s</div>小心翼翼地将它装进了背包。",
		id = 11141,
		is_notice = 0,
		s_id = 1114101,
		award = {},
		drop_ids = {
			1114101
		}
	},
	[1124101] = {
		is_award = 1,
		type = 12,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>拜访了工匠请教孵蛋的方法，它竟然建议说可以用<div fontcolor=#e25a00>锤子</div>砸开。",
		id = 11241,
		is_notice = 0,
		s_id = 1124101,
		award = {},
		drop_ids = {
			1124101
		}
	},
	[1015101] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>在背包中拿出了玻璃球，阳光下玻璃球散发出了耀眼的光芒。",
		id = 10151,
		is_notice = 0,
		s_id = 1015101,
		award = {},
		drop_ids = {}
	},
	[1015102] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>停下来驻足休息，拿出手机欣赏旅途中拍下的照片。",
		id = 10151,
		is_notice = 0,
		s_id = 1015102,
		award = {},
		drop_ids = {}
	},
	[1015103] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "路上遇到了恶犬，<div fontcolor=#e25a00>%s</div>凭借着学来的狼嚎成功将其吓跑。",
		id = 10151,
		is_notice = 0,
		s_id = 1015103,
		award = {},
		drop_ids = {}
	},
	[1015104] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>在路上遇到了一只同样背着包包的青蛙，于是它们一起前行了一段路。",
		id = 10151,
		is_notice = 0,
		s_id = 1015104,
		award = {},
		drop_ids = {}
	},
	[1015105] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "一片落叶被风吹上了半空，<div fontcolor=#e25a00>%s</div>兴奋地跟随着落叶一路狂奔。",
		id = 10151,
		is_notice = 0,
		s_id = 1015105,
		award = {},
		drop_ids = {}
	},
	[1015106] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "晴空万里无云的日子，<div fontcolor=#e25a00>%s</div>望着蓝天发呆。",
		id = 10151,
		is_notice = 0,
		s_id = 1015106,
		award = {},
		drop_ids = {}
	},
	[1015107] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>在旅途中看到了华丽的灯饰，觉得特别好看。",
		id = 10151,
		is_notice = 0,
		s_id = 1015107,
		award = {},
		drop_ids = {}
	},
	[1015108] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>掏出背包中的地图，看了看上面的地点，然后继续前行。",
		id = 10151,
		is_notice = 0,
		s_id = 1015108,
		award = {},
		drop_ids = {}
	},
	[1015109] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "在小水塘边喝了点水的<div fontcolor=#e25a00>%s</div>，突然就不渴了。",
		id = 10151,
		is_notice = 0,
		s_id = 1015109,
		award = {},
		drop_ids = {}
	},
	[1015110] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>在森卡莉法中悠闲的散步，走啊走的就到了一条比较宽阔的小道上。",
		id = 10151,
		is_notice = 0,
		s_id = 1015110,
		award = {},
		drop_ids = {}
	},
	[1025101] = {
		is_award = 1,
		type = 2,
		is_show = 1,
		desc = "拿出放大镜的<div fontcolor=#e25a00>%s</div>，在附近发现了<div fontcolor=#e25a00>钻石</div>。",
		id = 10251,
		is_notice = 0,
		s_id = 1025101,
		award = {
			{
				3,
				20
			}
		},
		drop_ids = {}
	},
	[1035101] = {
		is_award = 1,
		type = 3,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>发现了一个小型金矿，只取一点<div fontcolor=#e25a00>黄金</div>应该不会被发现吧！",
		id = 10351,
		is_notice = 0,
		s_id = 1035101,
		award = {
			{
				1,
				120000
			}
		},
		drop_ids = {}
	},
	[1045101] = {
		is_award = 1,
		type = 4,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>看中了一件很有特色的<div fontcolor=#e25a00>家具</div>。",
		id = 10451,
		is_notice = 0,
		s_id = 1045101,
		award = {},
		drop_ids = {
			1045101
		}
	},
	[1055101] = {
		is_award = 1,
		type = 5,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>走过一条满是当地特色的街道，看着琳琅满目的<div fontcolor=#e25a00>珍品</div>店，若有不舍。",
		id = 10551,
		is_notice = 0,
		s_id = 1055101,
		award = {},
		drop_ids = {
			1055101
		}
	},
	[1065101] = {
		is_award = 0,
		type = 6,
		is_show = 1,
		desc = "你的<div fontcolor=#e25a00>%s</div>旅途中给你寄来了<div fontcolor=#e25a00>明信片</div>！",
		id = 10651,
		is_notice = 1,
		s_id = 1065101,
		award = {},
		drop_ids = {
			1065101
		}
	},
	[1075101] = {
		is_award = 0,
		type = 7,
		is_show = 1,
		desc = "望着天空思考良久的<div fontcolor=#e25a00>%s</div>，最后决定写一封<div fontcolor=#e25a00>信</div>。",
		id = 10751,
		is_notice = 1,
		s_id = 1075101,
		award = {},
		drop_ids = {
			1075101
		}
	},
	[1095101] = {
		is_award = 1,
		type = 9,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>在一个礼品店里发现了一个装着<div fontcolor=#e25a00>神秘碎片</div>的礼盒。",
		id = 10951,
		is_notice = 0,
		s_id = 1095101,
		award = {
			{
				29905,
				1
			}
		},
		drop_ids = {}
	},
	[1105101] = {
		is_award = 1,
		type = 10,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>无意间进入了一个神秘的洞穴中，发现了<div fontcolor=#e25a00>强化训练</div>。",
		id = 11051,
		is_notice = 0,
		s_id = 1105101,
		award = {
			{
				10450,
				30
			}
		},
		drop_ids = {}
	},
	[1115101] = {
		is_award = 1,
		type = 11,
		is_show = 1,
		desc = "在沉睡森卡莉法里发现了一颗<div fontcolor=#e25a00>神秘的蛋</div>，<div fontcolor=#e25a00>%s</div>小心翼翼地将它装进了背包。",
		id = 11151,
		is_notice = 0,
		s_id = 1115101,
		award = {},
		drop_ids = {
			1115101
		}
	},
	[1125101] = {
		is_award = 1,
		type = 12,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>拜访了工匠请教孵蛋的方法，它竟然建议说可以用<div fontcolor=#e25a00>锤子</div>砸开。",
		id = 11251,
		is_notice = 0,
		s_id = 1125101,
		award = {},
		drop_ids = {
			1125101
		}
	},
	[1016101] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "晴空万里无云的日子，<div fontcolor=#e25a00>%s</div>望着蓝天发呆。",
		id = 10161,
		is_notice = 0,
		s_id = 1016101,
		award = {},
		drop_ids = {}
	},
	[1016102] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>在旅途中看到了华丽的灯饰，觉得特别好看。",
		id = 10161,
		is_notice = 0,
		s_id = 1016102,
		award = {},
		drop_ids = {}
	},
	[1016103] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>掏出背包中的地图，看了看上面的地点，然后继续前行。",
		id = 10161,
		is_notice = 0,
		s_id = 1016103,
		award = {},
		drop_ids = {}
	},
	[1016104] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "在小水塘边喝了点水的<div fontcolor=#e25a00>%s</div>，突然就不渴了。",
		id = 10161,
		is_notice = 0,
		s_id = 1016104,
		award = {},
		drop_ids = {}
	},
	[1016105] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>在森卡莉法中悠闲的散步，走啊走的就到了一条比较宽阔的小道上。",
		id = 10161,
		is_notice = 0,
		s_id = 1016105,
		award = {},
		drop_ids = {}
	},
	[1016106] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "一只蝴蝶飞过，<div fontcolor=#e25a00>%s</div>奋力一跃，没有抓到蝴蝶，“噗通”一声摔到了草地上。",
		id = 10161,
		is_notice = 0,
		s_id = 1016106,
		award = {},
		drop_ids = {}
	},
	[1016107] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>在路上遇到了一只柴柴，两只狗狗欢快地一起玩耍。",
		id = 10161,
		is_notice = 0,
		s_id = 1016107,
		award = {},
		drop_ids = {}
	},
	[1016108] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "呆呆地看着到处狂奔接主人扔出去的飞盘，<div fontcolor=#e25a00>%s</div>脸上露出了向往的表情。",
		id = 10161,
		is_notice = 0,
		s_id = 1016108,
		award = {},
		drop_ids = {}
	},
	[1016109] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>路过了一家服装店，透过玻璃窗看着里面的衣服，想象着自己的主人穿上它们会怎么样 。",
		id = 10161,
		is_notice = 0,
		s_id = 1016109,
		award = {},
		drop_ids = {}
	},
	[1016110] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "因为在电视上看到了西伯利海贼11号，觉得和自己长得有点像，<div fontcolor=#e25a00>%s</div>开始陷入了沉思。",
		id = 10161,
		is_notice = 0,
		s_id = 1016110,
		award = {},
		drop_ids = {}
	},
	[1026101] = {
		is_award = 1,
		type = 2,
		is_show = 1,
		desc = "角落发出了一点光芒，<div fontcolor=#e25a00>%s</div>走近一看，发现原来是<div fontcolor=#e25a00>钻石</div>。",
		id = 10261,
		is_notice = 0,
		s_id = 1026101,
		award = {
			{
				3,
				20
			}
		},
		drop_ids = {}
	},
	[1036101] = {
		is_award = 1,
		type = 3,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>在公园长椅边的草地上发现了<div fontcolor=#e25a00>贝里</div>，趁着没人注意偷偷藏了起来。",
		id = 10361,
		is_notice = 0,
		s_id = 1036101,
		award = {
			{
				1,
				120000
			}
		},
		drop_ids = {}
	},
	[1046101] = {
		is_award = 1,
		type = 4,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>径直地走进了一家摆满<div fontcolor=#e25a00>家具</div>的专卖店！",
		id = 10461,
		is_notice = 0,
		s_id = 1046101,
		award = {},
		drop_ids = {
			1046101
		}
	},
	[1056101] = {
		is_award = 1,
		type = 5,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>发现了一件好看的<div fontcolor=#e25a00>珍品</div>，决定送给你。",
		id = 10561,
		is_notice = 0,
		s_id = 1056101,
		award = {},
		drop_ids = {
			1056101
		}
	},
	[1066101] = {
		is_award = 0,
		type = 6,
		is_show = 1,
		desc = "在旅途中看到了美丽的景色，<div fontcolor=#e25a00>%s</div>决定拍下<div fontcolor=#e25a00>明信片</div>分享给你看。",
		id = 10661,
		is_notice = 1,
		s_id = 1066101,
		award = {},
		drop_ids = {
			1066101
		}
	},
	[1076101] = {
		is_award = 0,
		type = 7,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>将爪子伸进背包里摸索了一番，掏出了笔，写下了一封<div fontcolor=#e25a00>信</div>。",
		id = 10761,
		is_notice = 1,
		s_id = 1076101,
		award = {},
		drop_ids = {
			1076101
		}
	},
	[1096101] = {
		is_award = 1,
		type = 9,
		is_show = 1,
		desc = "在角落里发现了一片<div fontcolor=#e25a00>神秘的碎片</div>，<div fontcolor=#e25a00>%s</div>顺手丢到了背包里。",
		id = 10961,
		is_notice = 0,
		s_id = 1096101,
		award = {
			{
				29905,
				1
			}
		},
		drop_ids = {}
	},
	[1106101] = {
		is_award = 1,
		type = 10,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>一不小心闯进了占星师的家中，发现了<div fontcolor=#e25a00>强化训练</div>。",
		id = 11061,
		is_notice = 0,
		s_id = 1106101,
		award = {
			{
				10450,
				30
			}
		},
		drop_ids = {}
	},
	[1116101] = {
		is_award = 1,
		type = 11,
		is_show = 1,
		desc = "在沉睡森卡莉法里发现了一颗<div fontcolor=#e25a00>神秘的蛋</div>，<div fontcolor=#e25a00>%s</div>小心翼翼地将它装进了背包。",
		id = 11161,
		is_notice = 0,
		s_id = 1116101,
		award = {},
		drop_ids = {
			1116101
		}
	},
	[1126101] = {
		is_award = 1,
		type = 12,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>拜访了工匠请教孵蛋的方法，它竟然建议说可以用<div fontcolor=#e25a00>锤子</div>砸开。",
		id = 11261,
		is_notice = 0,
		s_id = 1126101,
		award = {},
		drop_ids = {
			1126101
		}
	},
	[1017101] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "一只蝴蝶飞过，<div fontcolor=#e25a00>%s</div>奋力一跃，没有抓到蝴蝶，“噗通”一声摔到了草地上。",
		id = 10171,
		is_notice = 0,
		s_id = 1017101,
		award = {},
		drop_ids = {}
	},
	[1017102] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>在路上遇到了一只柴柴，两只狗狗欢快地一起玩耍。",
		id = 10171,
		is_notice = 0,
		s_id = 1017102,
		award = {},
		drop_ids = {}
	},
	[1017103] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "呆呆地看着到处狂奔接主人扔出去的飞盘，<div fontcolor=#e25a00>%s</div>脸上露出了向往的表情。",
		id = 10171,
		is_notice = 0,
		s_id = 1017103,
		award = {},
		drop_ids = {}
	},
	[1017104] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>路过了一家服装店，透过玻璃窗看着里面的衣服，想象着自己的主人穿上它们会怎么样 。",
		id = 10171,
		is_notice = 0,
		s_id = 1017104,
		award = {},
		drop_ids = {}
	},
	[1017105] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "因为在电视上看到了西伯利海贼11号，觉得和自己长得有点像，<div fontcolor=#e25a00>%s</div>开始陷入了沉思。",
		id = 10171,
		is_notice = 0,
		s_id = 1017105,
		award = {},
		drop_ids = {}
	},
	[1017106] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>在屋檐下躲雨，屋子的主人看到后，好心地打开了门让它进去。",
		id = 10171,
		is_notice = 0,
		s_id = 1017106,
		award = {},
		drop_ids = {}
	},
	[1017107] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "一个人正在坐在路边吃着什么水果，<div fontcolor=#e25a00>%s</div>闻到了传来的味道，远远地走开了。",
		id = 10171,
		is_notice = 0,
		s_id = 1017107,
		award = {},
		drop_ids = {}
	},
	[1017108] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "天气实在是太热了，<div fontcolor=#e25a00>%s</div>坐在树下，伸出了舌头给自己散热。",
		id = 10171,
		is_notice = 0,
		s_id = 1017108,
		award = {},
		drop_ids = {}
	},
	[1017109] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "一只乌龟正在慢悠悠地爬着，<div fontcolor=#e25a00>%s</div>好奇地用爪子拨了拨龟壳，吓得乌龟立刻把头伸进了龟壳里面。",
		id = 10171,
		is_notice = 0,
		s_id = 1017109,
		award = {},
		drop_ids = {}
	},
	[1017110] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>觉得有点累了，趴在了一棵大树下面，懒洋洋地打了个哈欠。",
		id = 10171,
		is_notice = 0,
		s_id = 1017110,
		award = {},
		drop_ids = {}
	},
	[1027101] = {
		is_award = 1,
		type = 2,
		is_show = 1,
		desc = "拿出放大镜的<div fontcolor=#e25a00>%s</div>，在附近发现了<div fontcolor=#e25a00>钻石</div>。",
		id = 10271,
		is_notice = 0,
		s_id = 1027101,
		award = {
			{
				3,
				20
			}
		},
		drop_ids = {}
	},
	[1037101] = {
		is_award = 1,
		type = 3,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>拿出了放大镜，在附近发现了<div fontcolor=#e25a00>贝里</div>。",
		id = 10371,
		is_notice = 0,
		s_id = 1037101,
		award = {
			{
				1,
				120000
			}
		},
		drop_ids = {}
	},
	[1047101] = {
		is_award = 1,
		type = 4,
		is_show = 1,
		desc = "因为帮助了家具店老板，老板决定送给<div fontcolor=#e25a00>%s</div>一件<div fontcolor=#e25a00>家具</div>。",
		id = 10471,
		is_notice = 0,
		s_id = 1047101,
		award = {},
		drop_ids = {
			1047101
		}
	},
	[1057101] = {
		is_award = 1,
		type = 5,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>路过一条特色小街，发现了许多当地独有的<div fontcolor=#e25a00>珍品</div>。",
		id = 10571,
		is_notice = 0,
		s_id = 1057101,
		award = {},
		drop_ids = {
			1057101
		}
	},
	[1067101] = {
		is_award = 0,
		type = 6,
		is_show = 1,
		desc = "路过一个地方，<div fontcolor=#e25a00>%s</div>觉得你一定会喜欢的，于是掏出相机拍了一张<div fontcolor=#e25a00>照片</div>。",
		id = 10671,
		is_notice = 1,
		s_id = 1067101,
		award = {},
		drop_ids = {
			1067101
		}
	},
	[1077101] = {
		is_award = 0,
		type = 7,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>将熬夜写下的<div fontcolor=#e25a00>信件</div>投入了邮筒里。",
		id = 10771,
		is_notice = 1,
		s_id = 1077101,
		award = {},
		drop_ids = {
			1077101
		}
	},
	[1097101] = {
		is_award = 1,
		type = 9,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>在一个礼品店里发现了一个装着<div fontcolor=#e25a00>神秘碎片</div>的礼盒。",
		id = 10971,
		is_notice = 0,
		s_id = 1097101,
		award = {
			{
				29905,
				1
			}
		},
		drop_ids = {}
	},
	[1107101] = {
		is_award = 1,
		type = 10,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>无意间进入了一个神秘的洞穴中，发现了<div fontcolor=#e25a00>强化训练</div>。",
		id = 11071,
		is_notice = 0,
		s_id = 1107101,
		award = {
			{
				10450,
				30
			}
		},
		drop_ids = {}
	},
	[1117101] = {
		is_award = 1,
		type = 11,
		is_show = 1,
		desc = "在沉睡森卡莉法里发现了一颗<div fontcolor=#e25a00>神秘的蛋</div>，<div fontcolor=#e25a00>%s</div>小心翼翼地将它装进了背包。",
		id = 11171,
		is_notice = 0,
		s_id = 1117101,
		award = {},
		drop_ids = {
			1117101
		}
	},
	[1127101] = {
		is_award = 1,
		type = 12,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>拜访了工匠请教孵蛋的方法，它竟然建议说可以用<div fontcolor=#e25a00>锤子</div>砸开。",
		id = 11271,
		is_notice = 0,
		s_id = 1127101,
		award = {},
		drop_ids = {
			1127101
		}
	},
	[1018101] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>在屋檐下躲雨，屋子的主人看到后，好心地打开了门让它进去。",
		id = 10181,
		is_notice = 0,
		s_id = 1018101,
		award = {},
		drop_ids = {}
	},
	[1018102] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "一个人正在坐在路边吃着什么水果，<div fontcolor=#e25a00>%s</div>闻到了传来的味道，远远地走开了。",
		id = 10181,
		is_notice = 0,
		s_id = 1018102,
		award = {},
		drop_ids = {}
	},
	[1018103] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "天气实在是太热了，<div fontcolor=#e25a00>%s</div>坐在树下，伸出了舌头给自己散热。",
		id = 10181,
		is_notice = 0,
		s_id = 1018103,
		award = {},
		drop_ids = {}
	},
	[1018104] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "一只乌龟正在慢悠悠地爬着，<div fontcolor=#e25a00>%s</div>好奇地用爪子拨了拨龟壳，吓得乌龟立刻把头伸进了龟壳里面。",
		id = 10181,
		is_notice = 0,
		s_id = 1018104,
		award = {},
		drop_ids = {}
	},
	[1018105] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>觉得有点累了，趴在了一棵大树下面，懒洋洋地打了个哈欠。",
		id = 10181,
		is_notice = 0,
		s_id = 1018105,
		award = {},
		drop_ids = {}
	},
	[1018106] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "肚子开始咕咕地叫，<div fontcolor=#e25a00>%s</div>从背包里掏出了主人精心准备的食物，大口大口地吃了起来。",
		id = 10181,
		is_notice = 0,
		s_id = 1018106,
		award = {},
		drop_ids = {}
	},
	[1018107] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>拿出为主人买的威士忌，偷偷地尝了一口，昏昏沉沉地睡了过去。",
		id = 10181,
		is_notice = 0,
		s_id = 1018107,
		award = {},
		drop_ids = {}
	},
	[1018108] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "在路边的石头缝中发现了一枚银光闪闪的硬币，<div fontcolor=#e25a00>%s</div>觉得很喜欢，并放进了背包中。",
		id = 10181,
		is_notice = 0,
		s_id = 1018108,
		award = {},
		drop_ids = {}
	},
	[1018109] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>在旅途中发现了一种很好看的酒杯，真想买一个送给主人。",
		id = 10181,
		is_notice = 0,
		s_id = 1018109,
		award = {},
		drop_ids = {}
	},
	[1018110] = {
		is_award = 0,
		type = 1,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>被贝雕画深深地迷住了，看了许久。",
		id = 10181,
		is_notice = 0,
		s_id = 1018110,
		award = {},
		drop_ids = {}
	},
	[1028101] = {
		is_award = 1,
		type = 2,
		is_show = 1,
		desc = "角落发出了一点光芒，<div fontcolor=#e25a00>%s</div>走近一看，发现原来是<div fontcolor=#e25a00>钻石</div>。",
		id = 10281,
		is_notice = 0,
		s_id = 1028101,
		award = {
			{
				3,
				20
			}
		},
		drop_ids = {}
	},
	[1038101] = {
		is_award = 1,
		type = 3,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>发现了一个小型金矿，只取一点<div fontcolor=#e25a00>黄金</div>应该不会被发现吧！",
		id = 10381,
		is_notice = 0,
		s_id = 1038101,
		award = {
			{
				1,
				120000
			}
		},
		drop_ids = {}
	},
	[1048101] = {
		is_award = 1,
		type = 4,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>看中了一件很有特色的<div fontcolor=#e25a00>家具</div>。",
		id = 10481,
		is_notice = 0,
		s_id = 1048101,
		award = {},
		drop_ids = {
			1048101
		}
	},
	[1058101] = {
		is_award = 1,
		type = 5,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>走过一条满是当地特色的街道，看着琳琅满目的<div fontcolor=#e25a00>珍品</div>店，若有不舍。",
		id = 10581,
		is_notice = 0,
		s_id = 1058101,
		award = {},
		drop_ids = {
			1058101
		}
	},
	[1068101] = {
		is_award = 0,
		type = 6,
		is_show = 1,
		desc = "你的<div fontcolor=#e25a00>%s</div>旅途中给你寄来了<div fontcolor=#e25a00>明信片</div>！",
		id = 10681,
		is_notice = 1,
		s_id = 1068101,
		award = {},
		drop_ids = {
			1068101
		}
	},
	[1078101] = {
		is_award = 0,
		type = 7,
		is_show = 1,
		desc = "望着天空思考良久的<div fontcolor=#e25a00>%s</div>，最后决定写一封<div fontcolor=#e25a00>信</div>。",
		id = 10781,
		is_notice = 1,
		s_id = 1078101,
		award = {},
		drop_ids = {
			1078101
		}
	},
	[1098101] = {
		is_award = 1,
		type = 9,
		is_show = 1,
		desc = "在角落里发现了一片<div fontcolor=#e25a00>神秘的碎片</div>，<div fontcolor=#e25a00>%s</div>顺手丢到了背包里。",
		id = 10981,
		is_notice = 0,
		s_id = 1098101,
		award = {
			{
				29905,
				1
			}
		},
		drop_ids = {}
	},
	[1108101] = {
		is_award = 1,
		type = 10,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>一不小心闯进了占星师的家中，发现了<div fontcolor=#e25a00>强化训练</div>。",
		id = 11081,
		is_notice = 0,
		s_id = 1108101,
		award = {
			{
				10450,
				30
			}
		},
		drop_ids = {}
	},
	[1118101] = {
		is_award = 1,
		type = 11,
		is_show = 1,
		desc = "在沉睡森卡莉法里发现了一颗<div fontcolor=#e25a00>神秘的蛋</div>，<div fontcolor=#e25a00>%s</div>小心翼翼地将它装进了背包。",
		id = 11181,
		is_notice = 0,
		s_id = 1118101,
		award = {},
		drop_ids = {
			1118101
		}
	},
	[1128101] = {
		is_award = 1,
		type = 12,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>拜访了工匠请教孵蛋的方法，它竟然建议说可以用<div fontcolor=#e25a00>锤子</div>砸开。",
		id = 11281,
		is_notice = 0,
		s_id = 1128101,
		award = {},
		drop_ids = {
			1128101
		}
	},
	[1043201] = {
		is_award = 1,
		type = 4,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>径直地走进了一家摆满<div fontcolor=#e25a00>家具</div>的专卖店！",
		id = 10432,
		is_notice = 0,
		s_id = 1043201,
		award = {},
		drop_ids = {
			1043201
		}
	},
	[1044201] = {
		is_award = 1,
		type = 4,
		is_show = 1,
		desc = "因为帮助了家具店老板，老板决定送给<div fontcolor=#e25a00>%s</div>一件<div fontcolor=#e25a00>家具</div>。",
		id = 10442,
		is_notice = 0,
		s_id = 1044201,
		award = {},
		drop_ids = {
			1044201
		}
	},
	[1045201] = {
		is_award = 1,
		type = 4,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>看中了一件很有特色的<div fontcolor=#e25a00>家具</div>。",
		id = 10452,
		is_notice = 0,
		s_id = 1045201,
		award = {},
		drop_ids = {
			1045201
		}
	},
	[1046201] = {
		is_award = 1,
		type = 4,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>径直地走进了一家摆满<div fontcolor=#e25a00>家具</div>的专卖店！",
		id = 10462,
		is_notice = 0,
		s_id = 1046201,
		award = {},
		drop_ids = {
			1046201
		}
	},
	[1047201] = {
		is_award = 1,
		type = 4,
		is_show = 1,
		desc = "因为帮助了家具店老板，老板决定送给<div fontcolor=#e25a00>%s</div>一件<div fontcolor=#e25a00>家具</div>。",
		id = 10472,
		is_notice = 0,
		s_id = 1047201,
		award = {},
		drop_ids = {
			1047201
		}
	},
	[1048201] = {
		is_award = 1,
		type = 4,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>看中了一件很有特色的家具。",
		id = 10482,
		is_notice = 0,
		s_id = 1048201,
		award = {},
		drop_ids = {
			1048201
		}
	},
	[1043301] = {
		is_award = 1,
		type = 4,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>径直地走进了一家摆满<div fontcolor=#e25a00>家具</div>的专卖店！",
		id = 10433,
		is_notice = 0,
		s_id = 1043301,
		award = {},
		drop_ids = {
			1043301
		}
	},
	[1044301] = {
		is_award = 1,
		type = 4,
		is_show = 1,
		desc = "因为帮助了家具店老板，老板决定送给<div fontcolor=#e25a00>%s</div>一件<div fontcolor=#e25a00>家具</div>。",
		id = 10443,
		is_notice = 0,
		s_id = 1044301,
		award = {},
		drop_ids = {
			1044301
		}
	},
	[1045301] = {
		is_award = 1,
		type = 4,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>看中了一件很有特色的家具。",
		id = 10453,
		is_notice = 0,
		s_id = 1045301,
		award = {},
		drop_ids = {
			1045301
		}
	},
	[1046301] = {
		is_award = 1,
		type = 4,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>径直地走进了一家摆满<div fontcolor=#e25a00>家具</div>的专卖店！",
		id = 10463,
		is_notice = 0,
		s_id = 1046301,
		award = {},
		drop_ids = {
			1046301
		}
	},
	[1047301] = {
		is_award = 1,
		type = 4,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>帮助了家具店老板，老板决定送给它一件家具。",
		id = 10473,
		is_notice = 0,
		s_id = 1047301,
		award = {},
		drop_ids = {
			1047301
		}
	},
	[1048301] = {
		is_award = 1,
		type = 4,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>看中了一件很有特色的家具。",
		id = 10483,
		is_notice = 0,
		s_id = 1048301,
		award = {},
		drop_ids = {
			1048301
		}
	},
	[1043401] = {
		is_award = 1,
		type = 4,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>径直地走进了一家摆满<div fontcolor=#e25a00>家具</div>的专卖店！",
		id = 10434,
		is_notice = 0,
		s_id = 1043401,
		award = {},
		drop_ids = {
			1043401
		}
	},
	[1044401] = {
		is_award = 1,
		type = 4,
		is_show = 1,
		desc = "因为帮助了家具店老板，老板决定送给<div fontcolor=#e25a00>%s</div>一件<div fontcolor=#e25a00>家具</div>。",
		id = 10444,
		is_notice = 0,
		s_id = 1044401,
		award = {},
		drop_ids = {
			1044401
		}
	},
	[1045401] = {
		is_award = 1,
		type = 4,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>看中了一件很有特色的家具。",
		id = 10454,
		is_notice = 0,
		s_id = 1045401,
		award = {},
		drop_ids = {
			1045401
		}
	},
	[1046401] = {
		is_award = 1,
		type = 4,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>径直地走进了一家摆满<div fontcolor=#e25a00>家具</div>的专卖店！",
		id = 10464,
		is_notice = 0,
		s_id = 1046401,
		award = {},
		drop_ids = {
			1046401
		}
	},
	[1047401] = {
		is_award = 1,
		type = 4,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>帮助了家具店老板，老板决定送给它一件家具。",
		id = 10474,
		is_notice = 0,
		s_id = 1047401,
		award = {},
		drop_ids = {
			1047401
		}
	},
	[1048401] = {
		is_award = 1,
		type = 4,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>看中了一件很有特色的家具。",
		id = 10484,
		is_notice = 0,
		s_id = 1048401,
		award = {},
		drop_ids = {
			1048401
		}
	},
	[1043501] = {
		is_award = 1,
		type = 4,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>径直地走进了一家摆满<div fontcolor=#e25a00>家具</div>的专卖店！",
		id = 10435,
		is_notice = 0,
		s_id = 1043501,
		award = {},
		drop_ids = {
			1043501
		}
	},
	[1044501] = {
		is_award = 1,
		type = 4,
		is_show = 1,
		desc = "因为帮助了家具店老板，老板决定送给<div fontcolor=#e25a00>%s</div>一件<div fontcolor=#e25a00>家具</div>。",
		id = 10445,
		is_notice = 0,
		s_id = 1044501,
		award = {},
		drop_ids = {
			1044501
		}
	},
	[1045501] = {
		is_award = 1,
		type = 4,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>看中了一件很有特色的家具。",
		id = 10455,
		is_notice = 0,
		s_id = 1045501,
		award = {},
		drop_ids = {
			1045501
		}
	},
	[1046501] = {
		is_award = 1,
		type = 4,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>径直地走进了一家摆满<div fontcolor=#e25a00>家具</div>的专卖店！",
		id = 10465,
		is_notice = 0,
		s_id = 1046501,
		award = {},
		drop_ids = {
			1046501
		}
	},
	[1047501] = {
		is_award = 1,
		type = 4,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>帮助了家具店老板，老板决定送给它一件家具。",
		id = 10475,
		is_notice = 0,
		s_id = 1047501,
		award = {},
		drop_ids = {
			1047501
		}
	},
	[1048501] = {
		is_award = 1,
		type = 4,
		is_show = 1,
		desc = "<div fontcolor=#e25a00>%s</div>看中了一件很有特色的家具。",
		id = 10485,
		is_notice = 0,
		s_id = 1048501,
		award = {},
		drop_ids = {
			1048501
		}
	}
}

function Config.HomePetData.data_event_info_fun(slot0)
	slot1 = Config.HomePetData.data_event_info[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HomePetData.data_event_info[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HomePetData.data_interaction_info_length = 40
Config.HomePetData.data_interaction_info = {
	{
		award = 0,
		type = 1,
		id = 1,
		pro = 200,
		desc = "主人你好久没有陪我玩了，我决定送你一份“拆家大礼包”，哼！",
		expend = {},
		award2 = {}
	},
	{
		award = 0,
		type = 1,
		id = 2,
		pro = 200,
		desc = "玩的太久了有点累了，本哈想去睡觉啦！",
		expend = {},
		award2 = {}
	},
	{
		award = 0,
		type = 1,
		id = 3,
		pro = 200,
		desc = "主人主人，我想出去外面玩了~",
		expend = {},
		award2 = {}
	},
	{
		award = 0,
		type = 1,
		id = 4,
		pro = 200,
		desc = "要来比一比谁跑的更快吗？",
		expend = {},
		award2 = {}
	},
	{
		award = 0,
		type = 1,
		id = 5,
		pro = 200,
		desc = "这一生无论去到哪里，我最终都会回到这里的。",
		expend = {},
		award2 = {}
	},
	{
		award = 0,
		type = 1,
		id = 6,
		pro = 200,
		desc = "人类总说摸摸头，难得真的有那么舒服吗？（被摸头的二哈舒服地摇了摇尾巴）",
		expend = {},
		award2 = {}
	},
	{
		award = 0,
		type = 1,
		id = 7,
		pro = 200,
		desc = "主人主人，你打算什么时候给我喂狗粮？",
		expend = {},
		award2 = {}
	},
	{
		award = 0,
		type = 1,
		id = 8,
		pro = 200,
		desc = "人类真的好厉害，我两只脚站一会儿就累了。",
		expend = {},
		award2 = {}
	},
	{
		award = 0,
		type = 1,
		id = 9,
		pro = 200,
		desc = "我最喜欢主人送我的蓝色包包了！",
		expend = {},
		award2 = {}
	},
	{
		award = 0,
		type = 1,
		id = 10,
		pro = 200,
		desc = "主人你都不陪我玩的，等下我自己出门玩去了！",
		expend = {},
		award2 = {}
	},
	{
		award = 0,
		type = 1,
		id = 11,
		pro = 200,
		desc = "我寄回来的明信片好看吗？",
		expend = {},
		award2 = {}
	},
	{
		award = 0,
		type = 1,
		id = 12,
		pro = 200,
		desc = "等吃的准备好我就会出门去玩啦，不要太想我哦~",
		expend = {},
		award2 = {}
	},
	{
		award = 0,
		type = 1,
		id = 13,
		pro = 200,
		desc = "外面的世界真的好大，每次旅行都是令狗惊心动魄的冒险，汪！",
		expend = {},
		award2 = {}
	},
	{
		award = 0,
		type = 1,
		id = 14,
		pro = 200,
		desc = "虽然外面很好玩，但我不会出去太久的啦~",
		expend = {},
		award2 = {}
	},
	{
		award = 0,
		type = 1,
		id = 15,
		pro = 200,
		desc = "相比起外面的世界，还是有主人的地方更让我留恋。",
		expend = {},
		award2 = {}
	},
	{
		award = 0,
		type = 1,
		id = 16,
		pro = 200,
		desc = "主人主人，什么时候和我一起重新装饰下房间！",
		expend = {},
		award2 = {}
	},
	{
		award = 0,
		type = 1,
		id = 17,
		pro = 200,
		desc = "每走一步，铃铛就会响一次，铃铛每响一次，我就会想你一次。",
		expend = {},
		award2 = {}
	},
	{
		award = 0,
		type = 1,
		id = 18,
		pro = 200,
		desc = "主人的朋友真好，经常会来找我玩~",
		expend = {},
		award2 = {}
	},
	{
		award = 0,
		type = 1,
		id = 19,
		pro = 200,
		desc = "虽然我不是很会表达心情，但是我的尾巴可以！",
		expend = {},
		award2 = {}
	},
	{
		award = 0,
		type = 1,
		id = 20,
		pro = 200,
		desc = "主人主人，带我出去溜达溜达！",
		expend = {},
		award2 = {}
	},
	{
		award = 0,
		type = 1,
		id = 21,
		pro = 200,
		desc = "小嘛小二哈，背着个书包去玩耍~（愉快地哼着不知道哪里学来的歌）",
		expend = {},
		award2 = {}
	},
	{
		award = 0,
		type = 1,
		id = 22,
		pro = 200,
		desc = "（背对着你，不知道在思考着什么）",
		expend = {},
		award2 = {}
	},
	{
		award = 0,
		type = 1,
		id = 23,
		pro = 200,
		desc = "最近除了睡就是吃，好像都有点长肉了……",
		expend = {},
		award2 = {}
	},
	{
		award = 0,
		type = 1,
		id = 24,
		pro = 200,
		desc = "主人，猜猜我接下来要去哪里玩？",
		expend = {},
		award2 = {}
	},
	{
		award = 0,
		type = 1,
		id = 25,
		pro = 200,
		desc = "嗷呜~嗷呜~~我这样子像不像狼？",
		expend = {},
		award2 = {}
	},
	{
		award = 0,
		type = 1,
		id = 26,
		pro = 200,
		desc = "想要和我拍拍爪吗？我的小肉球软绵绵的很舒服的！",
		expend = {},
		award2 = {}
	},
	{
		award = 0,
		type = 1,
		id = 27,
		pro = 200,
		desc = "（趴在地上，发出呜呜呜的声音）",
		expend = {},
		award2 = {}
	},
	{
		award = 0,
		type = 1,
		id = 28,
		pro = 200,
		desc = "吃饱喝足我就要出去玩啦！",
		expend = {},
		award2 = {}
	},
	{
		award = 0,
		type = 1,
		id = 29,
		pro = 200,
		desc = "主人主人，给我点零花钱可好？",
		expend = {},
		award2 = {}
	},
	{
		award = 0,
		type = 1,
		id = 30,
		pro = 200,
		desc = "我现在精力满满，再给我些吃的我就可以出去玩了！",
		expend = {},
		award2 = {}
	},
	{
		award = 2,
		type = 2,
		id = 31,
		pro = 150,
		desc = "",
		expend = {
			{
				3,
				6
			}
		},
		award2 = {}
	},
	{
		award = 3,
		type = 2,
		id = 32,
		pro = 250,
		desc = "",
		expend = {
			{
				3,
				9
			}
		},
		award2 = {}
	},
	{
		award = 4,
		type = 2,
		id = 33,
		pro = 250,
		desc = "",
		expend = {
			{
				3,
				12
			}
		},
		award2 = {}
	},
	{
		award = 5,
		type = 2,
		id = 34,
		pro = 250,
		desc = "",
		expend = {
			{
				3,
				15
			}
		},
		award2 = {}
	},
	{
		award = 6,
		type = 2,
		id = 35,
		pro = 100,
		desc = "",
		expend = {
			{
				3,
				18
			}
		},
		award2 = {}
	},
	{
		award = 0,
		type = 2,
		id = 36,
		pro = 200,
		desc = "",
		expend = {
			{
				1,
				520
			}
		},
		award2 = {}
	},
	{
		award = 0,
		type = 2,
		id = 37,
		pro = 300,
		desc = "",
		expend = {
			{
				1,
				8888
			}
		},
		award2 = {}
	},
	{
		award = 0,
		type = 2,
		id = 38,
		pro = 300,
		desc = "",
		expend = {
			{
				1,
				18888
			}
		},
		award2 = {}
	},
	{
		award = 0,
		type = 2,
		id = 39,
		pro = 150,
		desc = "",
		expend = {
			{
				1,
				68888
			}
		},
		award2 = {
			{
				72001,
				1
			}
		}
	},
	{
		award = 0,
		type = 2,
		id = 40,
		pro = 50,
		desc = "",
		expend = {
			{
				1,
				88888
			}
		},
		award2 = {
			{
				29905,
				1
			}
		}
	}
}

function Config.HomePetData.data_interaction_info_fun(slot0)
	slot1 = Config.HomePetData.data_interaction_info[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HomePetData.data_interaction_info[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
