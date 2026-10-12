Config = Config or {}
Config.HallowsRefineData = Config.HallowsRefineData or {}
Config.HallowsRefineData.data_const_length = 1
Config.HallowsRefineData.data_const = {
	open_lev = {
		val = 55,
		desc = "开启等级"
	}
}

function Config.HallowsRefineData.data_const_fun(slot0)
	slot1 = Config.HallowsRefineData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HallowsRefineData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HallowsRefineData.data_refine_length = 5
Config.HallowsRefineData.data_refine = {
	{
		{
			add_dps = 300,
			lev = 1,
			id = 1,
			need_lev = 1,
			expend = {
				{
					32,
					500
				},
				{
					1,
					50000
				}
			},
			decompose_award = {
				{
					32,
					500
				}
			}
		},
		{
			add_dps = 800,
			lev = 2,
			id = 1,
			need_lev = 1,
			expend = {
				{
					32,
					1000
				},
				{
					1,
					60000
				}
			},
			decompose_award = {
				{
					32,
					1500
				}
			}
		},
		{
			add_dps = 1300,
			lev = 3,
			id = 1,
			need_lev = 1,
			expend = {
				{
					32,
					2000
				},
				{
					1,
					70000
				}
			},
			decompose_award = {
				{
					32,
					3500
				}
			}
		},
		{
			add_dps = 1800,
			lev = 4,
			id = 1,
			need_lev = 2,
			expend = {
				{
					32,
					3500
				},
				{
					1,
					80000
				}
			},
			decompose_award = {
				{
					32,
					7000
				}
			}
		},
		{
			add_dps = 2300,
			lev = 5,
			id = 1,
			need_lev = 2,
			expend = {
				{
					32,
					5000
				},
				{
					1,
					90000
				}
			},
			decompose_award = {
				{
					32,
					12000
				}
			}
		},
		{
			add_dps = 2800,
			lev = 6,
			id = 1,
			need_lev = 2,
			expend = {
				{
					32,
					8000
				},
				{
					1,
					100000
				}
			},
			decompose_award = {
				{
					32,
					20000
				}
			}
		},
		{
			add_dps = 3400,
			lev = 7,
			id = 1,
			need_lev = 3,
			expend = {
				{
					32,
					11000
				},
				{
					1,
					120000
				}
			},
			decompose_award = {
				{
					32,
					31000
				}
			}
		},
		{
			add_dps = 4000,
			lev = 8,
			id = 1,
			need_lev = 3,
			expend = {
				{
					32,
					14400
				},
				{
					1,
					140000
				}
			},
			decompose_award = {
				{
					32,
					45400
				}
			}
		},
		{
			add_dps = 4600,
			lev = 9,
			id = 1,
			need_lev = 3,
			expend = {
				{
					32,
					15600
				},
				{
					1,
					156000
				}
			},
			decompose_award = {
				{
					32,
					61000
				}
			}
		},
		{
			add_dps = 5200,
			lev = 10,
			id = 1,
			need_lev = 4,
			expend = {
				{
					32,
					16800
				},
				{
					1,
					168000
				}
			},
			decompose_award = {
				{
					32,
					77800
				}
			}
		},
		{
			add_dps = 5800,
			lev = 11,
			id = 1,
			need_lev = 4,
			expend = {
				{
					32,
					18000
				},
				{
					1,
					180000
				}
			},
			decompose_award = {
				{
					32,
					95800
				}
			}
		},
		{
			add_dps = 6400,
			lev = 12,
			id = 1,
			need_lev = 4,
			expend = {
				{
					32,
					19200
				},
				{
					1,
					192000
				}
			},
			decompose_award = {
				{
					32,
					115000
				}
			}
		},
		{
			add_dps = 7200,
			lev = 13,
			id = 1,
			need_lev = 5,
			expend = {
				{
					32,
					27200
				},
				{
					1,
					272000
				}
			},
			decompose_award = {
				{
					32,
					142200
				}
			}
		},
		{
			add_dps = 8000,
			lev = 14,
			id = 1,
			need_lev = 5,
			expend = {
				{
					32,
					28800
				},
				{
					1,
					288000
				}
			},
			decompose_award = {
				{
					32,
					171000
				}
			}
		},
		{
			add_dps = 8800,
			lev = 15,
			id = 1,
			need_lev = 5,
			expend = {
				{
					32,
					30400
				},
				{
					1,
					304000
				}
			},
			decompose_award = {
				{
					32,
					201400
				}
			}
		},
		{
			add_dps = 9600,
			lev = 16,
			id = 1,
			need_lev = 6,
			expend = {
				{
					32,
					32000
				},
				{
					1,
					320000
				}
			},
			decompose_award = {
				{
					32,
					233400
				}
			}
		},
		{
			add_dps = 10400,
			lev = 17,
			id = 1,
			need_lev = 6,
			expend = {
				{
					32,
					33600
				},
				{
					1,
					336000
				}
			},
			decompose_award = {
				{
					32,
					267000
				}
			}
		},
		{
			add_dps = 11200,
			lev = 18,
			id = 1,
			need_lev = 6,
			expend = {
				{
					32,
					35200
				},
				{
					1,
					352000
				}
			},
			decompose_award = {
				{
					32,
					302200
				}
			}
		},
		{
			add_dps = 12200,
			lev = 19,
			id = 1,
			need_lev = 7,
			expend = {
				{
					32,
					46000
				},
				{
					1,
					460000
				}
			},
			decompose_award = {
				{
					32,
					348200
				}
			}
		},
		{
			add_dps = 13200,
			lev = 20,
			id = 1,
			need_lev = 7,
			expend = {
				{
					32,
					48000
				},
				{
					1,
					480000
				}
			},
			decompose_award = {
				{
					32,
					396200
				}
			}
		},
		{
			add_dps = 14200,
			lev = 21,
			id = 1,
			need_lev = 7,
			expend = {
				{
					32,
					50000
				},
				{
					1,
					550000
				}
			},
			decompose_award = {
				{
					32,
					446200
				}
			}
		},
		{
			add_dps = 15200,
			lev = 22,
			id = 1,
			need_lev = 8,
			expend = {
				{
					32,
					52000
				},
				{
					1,
					572000
				}
			},
			decompose_award = {
				{
					32,
					498200
				}
			}
		},
		{
			add_dps = 16200,
			lev = 23,
			id = 1,
			need_lev = 8,
			expend = {
				{
					32,
					54000
				},
				{
					1,
					594000
				}
			},
			decompose_award = {
				{
					32,
					552200
				}
			}
		},
		{
			add_dps = 17200,
			lev = 24,
			id = 1,
			need_lev = 8,
			expend = {
				{
					32,
					56000
				},
				{
					1,
					616000
				}
			},
			decompose_award = {
				{
					32,
					608200
				}
			}
		},
		{
			add_dps = 18400,
			lev = 25,
			id = 1,
			need_lev = 9,
			expend = {
				{
					32,
					69600
				},
				{
					1,
					765600
				}
			},
			decompose_award = {
				{
					32,
					677800
				}
			}
		},
		{
			add_dps = 19600,
			lev = 26,
			id = 1,
			need_lev = 9,
			expend = {
				{
					32,
					72000
				},
				{
					1,
					792000
				}
			},
			decompose_award = {
				{
					32,
					749800
				}
			}
		},
		{
			add_dps = 20800,
			lev = 27,
			id = 1,
			need_lev = 9,
			expend = {
				{
					32,
					74400
				},
				{
					1,
					818400
				}
			},
			decompose_award = {
				{
					32,
					824200
				}
			}
		},
		{
			add_dps = 22000,
			lev = 28,
			id = 1,
			need_lev = 10,
			expend = {
				{
					32,
					76800
				},
				{
					1,
					844800
				}
			},
			decompose_award = {
				{
					32,
					901000
				}
			}
		},
		{
			add_dps = 23200,
			lev = 29,
			id = 1,
			need_lev = 10,
			expend = {
				{
					32,
					79200
				},
				{
					1,
					871200
				}
			},
			decompose_award = {
				{
					32,
					980200
				}
			}
		},
		{
			add_dps = 24400,
			lev = 30,
			id = 1,
			need_lev = 10,
			expend = {
				{
					32,
					81600
				},
				{
					1,
					979200
				}
			},
			decompose_award = {
				{
					32,
					1061800
				}
			}
		},
		{
			add_dps = 25800,
			lev = 31,
			id = 1,
			need_lev = 11,
			expend = {
				{
					32,
					98000
				},
				{
					1,
					1176000
				}
			},
			decompose_award = {
				{
					32,
					1159800
				}
			}
		},
		{
			add_dps = 27200,
			lev = 32,
			id = 1,
			need_lev = 11,
			expend = {
				{
					32,
					100800
				},
				{
					1,
					1209600
				}
			},
			decompose_award = {
				{
					32,
					1260600
				}
			}
		},
		{
			add_dps = 28600,
			lev = 33,
			id = 1,
			need_lev = 11,
			expend = {
				{
					32,
					103600
				},
				{
					1,
					1243200
				}
			},
			decompose_award = {
				{
					32,
					1364200
				}
			}
		},
		{
			add_dps = 30000,
			lev = 34,
			id = 1,
			need_lev = 12,
			expend = {
				{
					32,
					106400
				},
				{
					1,
					1276800
				}
			},
			decompose_award = {
				{
					32,
					1470600
				}
			}
		},
		{
			add_dps = 31400,
			lev = 35,
			id = 1,
			need_lev = 12,
			expend = {
				{
					32,
					109200
				},
				{
					1,
					1310400
				}
			},
			decompose_award = {
				{
					32,
					1579800
				}
			}
		},
		{
			add_dps = 32800,
			lev = 36,
			id = 1,
			need_lev = 12,
			expend = {
				{
					32,
					112000
				},
				{
					1,
					1344000
				}
			},
			decompose_award = {
				{
					32,
					1691800
				}
			}
		},
		{
			add_dps = 34400,
			lev = 37,
			id = 1,
			need_lev = 13,
			expend = {
				{
					32,
					131200
				},
				{
					1,
					1574400
				}
			},
			decompose_award = {
				{
					32,
					1823000
				}
			}
		},
		{
			add_dps = 36000,
			lev = 38,
			id = 1,
			need_lev = 13,
			expend = {
				{
					32,
					134400
				},
				{
					1,
					1612800
				}
			},
			decompose_award = {
				{
					32,
					1957400
				}
			}
		},
		{
			add_dps = 37600,
			lev = 39,
			id = 1,
			need_lev = 13,
			expend = {
				{
					32,
					137600
				},
				{
					1,
					1651200
				}
			},
			decompose_award = {
				{
					32,
					2095000
				}
			}
		},
		{
			add_dps = 39200,
			lev = 40,
			id = 1,
			need_lev = 14,
			expend = {
				{
					32,
					140800
				},
				{
					1,
					1830400
				}
			},
			decompose_award = {
				{
					32,
					2235800
				}
			}
		},
		{
			add_dps = 40800,
			lev = 41,
			id = 1,
			need_lev = 14,
			expend = {
				{
					32,
					144000
				},
				{
					1,
					1872000
				}
			},
			decompose_award = {
				{
					32,
					2379800
				}
			}
		},
		{
			add_dps = 42400,
			lev = 42,
			id = 1,
			need_lev = 14,
			expend = {
				{
					32,
					147200
				},
				{
					1,
					1913600
				}
			},
			decompose_award = {
				{
					32,
					2527000
				}
			}
		},
		{
			add_dps = 44200,
			lev = 43,
			id = 1,
			need_lev = 15,
			expend = {
				{
					32,
					169200
				},
				{
					1,
					2199600
				}
			},
			decompose_award = {
				{
					32,
					2696200
				}
			}
		},
		{
			add_dps = 46000,
			lev = 44,
			id = 1,
			need_lev = 15,
			expend = {
				{
					32,
					172800
				},
				{
					1,
					2246400
				}
			},
			decompose_award = {
				{
					32,
					2869000
				}
			}
		},
		{
			add_dps = 47800,
			lev = 45,
			id = 1,
			need_lev = 15,
			expend = {
				{
					32,
					176400
				},
				{
					1,
					2293200
				}
			},
			decompose_award = {
				{
					32,
					3045400
				}
			}
		},
		{
			add_dps = 49600,
			lev = 46,
			id = 1,
			need_lev = 16,
			expend = {
				{
					32,
					180000
				},
				{
					1,
					2340000
				}
			},
			decompose_award = {
				{
					32,
					3225400
				}
			}
		},
		{
			add_dps = 51400,
			lev = 47,
			id = 1,
			need_lev = 16,
			expend = {
				{
					32,
					183600
				},
				{
					1,
					2386800
				}
			},
			decompose_award = {
				{
					32,
					3409000
				}
			}
		},
		{
			add_dps = 53200,
			lev = 48,
			id = 1,
			need_lev = 16,
			expend = {
				{
					32,
					187200
				},
				{
					1,
					2433600
				}
			},
			decompose_award = {
				{
					32,
					3596200
				}
			}
		},
		{
			add_dps = 55650,
			lev = 49,
			id = 1,
			need_lev = 17,
			expend = {
				{
					32,
					259700
				},
				{
					1,
					3376100
				}
			},
			decompose_award = {
				{
					32,
					3855900
				}
			}
		},
		{
			add_dps = 58150,
			lev = 50,
			id = 1,
			need_lev = 17,
			expend = {
				{
					32,
					270000
				},
				{
					1,
					3780000
				}
			},
			decompose_award = {
				{
					32,
					4125900
				}
			}
		},
		{
			add_dps = 60700,
			lev = 51,
			id = 1,
			need_lev = 17,
			expend = {
				{
					32,
					280500
				},
				{
					1,
					3927000
				}
			},
			decompose_award = {
				{
					32,
					4406400
				}
			}
		},
		{
			add_dps = 63300,
			lev = 52,
			id = 1,
			need_lev = 18,
			expend = {
				{
					32,
					291200
				},
				{
					1,
					4076800
				}
			},
			decompose_award = {
				{
					32,
					4697600
				}
			}
		},
		{
			add_dps = 65950,
			lev = 53,
			id = 1,
			need_lev = 18,
			expend = {
				{
					32,
					302100
				},
				{
					1,
					4229400
				}
			},
			decompose_award = {
				{
					32,
					4999700
				}
			}
		},
		{
			add_dps = 68650,
			lev = 54,
			id = 1,
			need_lev = 18,
			expend = {
				{
					32,
					313200
				},
				{
					1,
					4384800
				}
			},
			decompose_award = {
				{
					32,
					5312900
				}
			}
		},
		{
			add_dps = 73050,
			lev = 55,
			id = 1,
			need_lev = 19,
			expend = {
				{
					32,
					330400
				},
				{
					1,
					4625600
				}
			},
			decompose_award = {
				{
					32,
					5643300
				}
			}
		},
		{
			add_dps = 77530,
			lev = 56,
			id = 1,
			need_lev = 19,
			expend = {
				{
					32,
					348000
				},
				{
					1,
					4872000
				}
			},
			decompose_award = {
				{
					32,
					5991300
				}
			}
		},
		{
			add_dps = 82090,
			lev = 57,
			id = 1,
			need_lev = 19,
			expend = {
				{
					32,
					366000
				},
				{
					1,
					5124000
				}
			},
			decompose_award = {
				{
					32,
					6357300
				}
			}
		},
		{
			add_dps = 86730,
			lev = 58,
			id = 1,
			need_lev = 20,
			expend = {
				{
					32,
					384400
				},
				{
					1,
					5381600
				}
			},
			decompose_award = {
				{
					32,
					6741700
				}
			}
		},
		{
			add_dps = 91450,
			lev = 59,
			id = 1,
			need_lev = 20,
			expend = {
				{
					32,
					403200
				},
				{
					1,
					5644800
				}
			},
			decompose_award = {
				{
					32,
					7144900
				}
			}
		},
		{
			add_dps = 96250,
			lev = 60,
			id = 1,
			need_lev = 20,
			expend = {
				{
					32,
					422400
				},
				{
					1,
					6336000
				}
			},
			decompose_award = {
				{
					32,
					7567300
				}
			}
		},
		{
			add_dps = 101130,
			lev = 61,
			id = 1,
			need_lev = 21,
			expend = {
				{
					32,
					442000
				},
				{
					1,
					6630000
				}
			},
			decompose_award = {
				{
					32,
					8009300
				}
			}
		},
		{
			add_dps = 106090,
			lev = 62,
			id = 1,
			need_lev = 21,
			expend = {
				{
					32,
					462000
				},
				{
					1,
					6930000
				}
			},
			decompose_award = {
				{
					32,
					8471300
				}
			}
		},
		{
			add_dps = 111130,
			lev = 63,
			id = 1,
			need_lev = 21,
			expend = {
				{
					32,
					482400
				},
				{
					1,
					7236000
				}
			},
			decompose_award = {
				{
					32,
					8953700
				}
			}
		},
		{
			add_dps = 116250,
			lev = 64,
			id = 1,
			need_lev = 22,
			expend = {
				{
					32,
					503200
				},
				{
					1,
					7548000
				}
			},
			decompose_award = {
				{
					32,
					9456900
				}
			}
		},
		{
			add_dps = 121450,
			lev = 65,
			id = 1,
			need_lev = 22,
			expend = {
				{
					32,
					524400
				},
				{
					1,
					7866000
				}
			},
			decompose_award = {
				{
					32,
					9981300
				}
			}
		},
		{
			add_dps = 126730,
			lev = 66,
			id = 1,
			need_lev = 22,
			expend = {
				{
					32,
					546000
				},
				{
					1,
					8190000
				}
			},
			decompose_award = {
				{
					32,
					10527300
				}
			}
		},
		{
			add_dps = 132090,
			lev = 67,
			id = 1,
			need_lev = 23,
			expend = {
				{
					32,
					568000
				},
				{
					1,
					8520000
				}
			},
			decompose_award = {
				{
					32,
					11095300
				}
			}
		},
		{
			add_dps = 137530,
			lev = 68,
			id = 1,
			need_lev = 23,
			expend = {
				{
					32,
					590400
				},
				{
					1,
					8856000
				}
			},
			decompose_award = {
				{
					32,
					11685700
				}
			}
		},
		{
			add_dps = 143050,
			lev = 69,
			id = 1,
			need_lev = 23,
			expend = {
				{
					32,
					613200
				},
				{
					1,
					9198000
				}
			},
			decompose_award = {
				{
					32,
					12298900
				}
			}
		},
		{
			add_dps = 148650,
			lev = 70,
			id = 1,
			need_lev = 24,
			expend = {
				{
					32,
					636400
				},
				{
					1,
					9546000
				}
			},
			decompose_award = {
				{
					32,
					12935300
				}
			}
		},
		{
			add_dps = 154330,
			lev = 71,
			id = 1,
			need_lev = 24,
			expend = {
				{
					32,
					660000
				},
				{
					1,
					9900000
				}
			},
			decompose_award = {
				{
					32,
					13595300
				}
			}
		},
		{
			add_dps = 160090,
			lev = 72,
			id = 1,
			need_lev = 24,
			expend = {
				{
					32,
					684000
				},
				{
					1,
					10260000
				}
			},
			decompose_award = {
				{
					32,
					14279300
				}
			}
		}
	},
	{
		{
			add_dps = 350,
			lev = 1,
			id = 2,
			need_lev = 1,
			expend = {
				{
					32,
					500
				},
				{
					1,
					50000
				}
			},
			decompose_award = {
				{
					32,
					500
				}
			}
		},
		{
			add_dps = 850,
			lev = 2,
			id = 2,
			need_lev = 1,
			expend = {
				{
					32,
					1000
				},
				{
					1,
					60000
				}
			},
			decompose_award = {
				{
					32,
					1500
				}
			}
		},
		{
			add_dps = 1350,
			lev = 3,
			id = 2,
			need_lev = 1,
			expend = {
				{
					32,
					2000
				},
				{
					1,
					70000
				}
			},
			decompose_award = {
				{
					32,
					3500
				}
			}
		},
		{
			add_dps = 1850,
			lev = 4,
			id = 2,
			need_lev = 2,
			expend = {
				{
					32,
					3500
				},
				{
					1,
					80000
				}
			},
			decompose_award = {
				{
					32,
					7000
				}
			}
		},
		{
			add_dps = 2350,
			lev = 5,
			id = 2,
			need_lev = 2,
			expend = {
				{
					32,
					5000
				},
				{
					1,
					90000
				}
			},
			decompose_award = {
				{
					32,
					12000
				}
			}
		},
		{
			add_dps = 2850,
			lev = 6,
			id = 2,
			need_lev = 2,
			expend = {
				{
					32,
					8000
				},
				{
					1,
					100000
				}
			},
			decompose_award = {
				{
					32,
					20000
				}
			}
		},
		{
			add_dps = 3450,
			lev = 7,
			id = 2,
			need_lev = 3,
			expend = {
				{
					32,
					11000
				},
				{
					1,
					120000
				}
			},
			decompose_award = {
				{
					32,
					31000
				}
			}
		},
		{
			add_dps = 4050,
			lev = 8,
			id = 2,
			need_lev = 3,
			expend = {
				{
					32,
					14400
				},
				{
					1,
					140000
				}
			},
			decompose_award = {
				{
					32,
					45400
				}
			}
		},
		{
			add_dps = 4650,
			lev = 9,
			id = 2,
			need_lev = 3,
			expend = {
				{
					32,
					15600
				},
				{
					1,
					156000
				}
			},
			decompose_award = {
				{
					32,
					61000
				}
			}
		},
		{
			add_dps = 5250,
			lev = 10,
			id = 2,
			need_lev = 4,
			expend = {
				{
					32,
					16800
				},
				{
					1,
					168000
				}
			},
			decompose_award = {
				{
					32,
					77800
				}
			}
		},
		{
			add_dps = 5850,
			lev = 11,
			id = 2,
			need_lev = 4,
			expend = {
				{
					32,
					18000
				},
				{
					1,
					180000
				}
			},
			decompose_award = {
				{
					32,
					95800
				}
			}
		},
		{
			add_dps = 6450,
			lev = 12,
			id = 2,
			need_lev = 4,
			expend = {
				{
					32,
					19200
				},
				{
					1,
					192000
				}
			},
			decompose_award = {
				{
					32,
					115000
				}
			}
		},
		{
			add_dps = 7250,
			lev = 13,
			id = 2,
			need_lev = 5,
			expend = {
				{
					32,
					27200
				},
				{
					1,
					272000
				}
			},
			decompose_award = {
				{
					32,
					142200
				}
			}
		},
		{
			add_dps = 8050,
			lev = 14,
			id = 2,
			need_lev = 5,
			expend = {
				{
					32,
					28800
				},
				{
					1,
					288000
				}
			},
			decompose_award = {
				{
					32,
					171000
				}
			}
		},
		{
			add_dps = 8850,
			lev = 15,
			id = 2,
			need_lev = 5,
			expend = {
				{
					32,
					30400
				},
				{
					1,
					304000
				}
			},
			decompose_award = {
				{
					32,
					201400
				}
			}
		},
		{
			add_dps = 9650,
			lev = 16,
			id = 2,
			need_lev = 6,
			expend = {
				{
					32,
					32000
				},
				{
					1,
					320000
				}
			},
			decompose_award = {
				{
					32,
					233400
				}
			}
		},
		{
			add_dps = 10450,
			lev = 17,
			id = 2,
			need_lev = 6,
			expend = {
				{
					32,
					33600
				},
				{
					1,
					336000
				}
			},
			decompose_award = {
				{
					32,
					267000
				}
			}
		},
		{
			add_dps = 11250,
			lev = 18,
			id = 2,
			need_lev = 6,
			expend = {
				{
					32,
					35200
				},
				{
					1,
					352000
				}
			},
			decompose_award = {
				{
					32,
					302200
				}
			}
		},
		{
			add_dps = 12250,
			lev = 19,
			id = 2,
			need_lev = 7,
			expend = {
				{
					32,
					46000
				},
				{
					1,
					460000
				}
			},
			decompose_award = {
				{
					32,
					348200
				}
			}
		},
		{
			add_dps = 13250,
			lev = 20,
			id = 2,
			need_lev = 7,
			expend = {
				{
					32,
					48000
				},
				{
					1,
					480000
				}
			},
			decompose_award = {
				{
					32,
					396200
				}
			}
		},
		{
			add_dps = 14250,
			lev = 21,
			id = 2,
			need_lev = 7,
			expend = {
				{
					32,
					50000
				},
				{
					1,
					550000
				}
			},
			decompose_award = {
				{
					32,
					446200
				}
			}
		},
		{
			add_dps = 15250,
			lev = 22,
			id = 2,
			need_lev = 8,
			expend = {
				{
					32,
					52000
				},
				{
					1,
					572000
				}
			},
			decompose_award = {
				{
					32,
					498200
				}
			}
		},
		{
			add_dps = 16250,
			lev = 23,
			id = 2,
			need_lev = 8,
			expend = {
				{
					32,
					54000
				},
				{
					1,
					594000
				}
			},
			decompose_award = {
				{
					32,
					552200
				}
			}
		},
		{
			add_dps = 17250,
			lev = 24,
			id = 2,
			need_lev = 8,
			expend = {
				{
					32,
					56000
				},
				{
					1,
					616000
				}
			},
			decompose_award = {
				{
					32,
					608200
				}
			}
		},
		{
			add_dps = 18450,
			lev = 25,
			id = 2,
			need_lev = 9,
			expend = {
				{
					32,
					69600
				},
				{
					1,
					765600
				}
			},
			decompose_award = {
				{
					32,
					677800
				}
			}
		},
		{
			add_dps = 19650,
			lev = 26,
			id = 2,
			need_lev = 9,
			expend = {
				{
					32,
					72000
				},
				{
					1,
					792000
				}
			},
			decompose_award = {
				{
					32,
					749800
				}
			}
		},
		{
			add_dps = 20850,
			lev = 27,
			id = 2,
			need_lev = 9,
			expend = {
				{
					32,
					74400
				},
				{
					1,
					818400
				}
			},
			decompose_award = {
				{
					32,
					824200
				}
			}
		},
		{
			add_dps = 22050,
			lev = 28,
			id = 2,
			need_lev = 10,
			expend = {
				{
					32,
					76800
				},
				{
					1,
					844800
				}
			},
			decompose_award = {
				{
					32,
					901000
				}
			}
		},
		{
			add_dps = 23250,
			lev = 29,
			id = 2,
			need_lev = 10,
			expend = {
				{
					32,
					79200
				},
				{
					1,
					871200
				}
			},
			decompose_award = {
				{
					32,
					980200
				}
			}
		},
		{
			add_dps = 24450,
			lev = 30,
			id = 2,
			need_lev = 10,
			expend = {
				{
					32,
					81600
				},
				{
					1,
					979200
				}
			},
			decompose_award = {
				{
					32,
					1061800
				}
			}
		},
		{
			add_dps = 25850,
			lev = 31,
			id = 2,
			need_lev = 11,
			expend = {
				{
					32,
					98000
				},
				{
					1,
					1176000
				}
			},
			decompose_award = {
				{
					32,
					1159800
				}
			}
		},
		{
			add_dps = 27250,
			lev = 32,
			id = 2,
			need_lev = 11,
			expend = {
				{
					32,
					100800
				},
				{
					1,
					1209600
				}
			},
			decompose_award = {
				{
					32,
					1260600
				}
			}
		},
		{
			add_dps = 28650,
			lev = 33,
			id = 2,
			need_lev = 11,
			expend = {
				{
					32,
					103600
				},
				{
					1,
					1243200
				}
			},
			decompose_award = {
				{
					32,
					1364200
				}
			}
		},
		{
			add_dps = 30050,
			lev = 34,
			id = 2,
			need_lev = 12,
			expend = {
				{
					32,
					106400
				},
				{
					1,
					1276800
				}
			},
			decompose_award = {
				{
					32,
					1470600
				}
			}
		},
		{
			add_dps = 31450,
			lev = 35,
			id = 2,
			need_lev = 12,
			expend = {
				{
					32,
					109200
				},
				{
					1,
					1310400
				}
			},
			decompose_award = {
				{
					32,
					1579800
				}
			}
		},
		{
			add_dps = 32850,
			lev = 36,
			id = 2,
			need_lev = 12,
			expend = {
				{
					32,
					112000
				},
				{
					1,
					1344000
				}
			},
			decompose_award = {
				{
					32,
					1691800
				}
			}
		},
		{
			add_dps = 34450,
			lev = 37,
			id = 2,
			need_lev = 13,
			expend = {
				{
					32,
					131200
				},
				{
					1,
					1574400
				}
			},
			decompose_award = {
				{
					32,
					1823000
				}
			}
		},
		{
			add_dps = 36050,
			lev = 38,
			id = 2,
			need_lev = 13,
			expend = {
				{
					32,
					134400
				},
				{
					1,
					1612800
				}
			},
			decompose_award = {
				{
					32,
					1957400
				}
			}
		},
		{
			add_dps = 37650,
			lev = 39,
			id = 2,
			need_lev = 13,
			expend = {
				{
					32,
					137600
				},
				{
					1,
					1651200
				}
			},
			decompose_award = {
				{
					32,
					2095000
				}
			}
		},
		{
			add_dps = 39250,
			lev = 40,
			id = 2,
			need_lev = 14,
			expend = {
				{
					32,
					140800
				},
				{
					1,
					1830400
				}
			},
			decompose_award = {
				{
					32,
					2235800
				}
			}
		},
		{
			add_dps = 40850,
			lev = 41,
			id = 2,
			need_lev = 14,
			expend = {
				{
					32,
					144000
				},
				{
					1,
					1872000
				}
			},
			decompose_award = {
				{
					32,
					2379800
				}
			}
		},
		{
			add_dps = 42450,
			lev = 42,
			id = 2,
			need_lev = 14,
			expend = {
				{
					32,
					147200
				},
				{
					1,
					1913600
				}
			},
			decompose_award = {
				{
					32,
					2527000
				}
			}
		},
		{
			add_dps = 44250,
			lev = 43,
			id = 2,
			need_lev = 15,
			expend = {
				{
					32,
					169200
				},
				{
					1,
					2199600
				}
			},
			decompose_award = {
				{
					32,
					2696200
				}
			}
		},
		{
			add_dps = 46050,
			lev = 44,
			id = 2,
			need_lev = 15,
			expend = {
				{
					32,
					172800
				},
				{
					1,
					2246400
				}
			},
			decompose_award = {
				{
					32,
					2869000
				}
			}
		},
		{
			add_dps = 47850,
			lev = 45,
			id = 2,
			need_lev = 15,
			expend = {
				{
					32,
					176400
				},
				{
					1,
					2293200
				}
			},
			decompose_award = {
				{
					32,
					3045400
				}
			}
		},
		{
			add_dps = 49650,
			lev = 46,
			id = 2,
			need_lev = 16,
			expend = {
				{
					32,
					180000
				},
				{
					1,
					2340000
				}
			},
			decompose_award = {
				{
					32,
					3225400
				}
			}
		},
		{
			add_dps = 51450,
			lev = 47,
			id = 2,
			need_lev = 16,
			expend = {
				{
					32,
					183600
				},
				{
					1,
					2386800
				}
			},
			decompose_award = {
				{
					32,
					3409000
				}
			}
		},
		{
			add_dps = 53250,
			lev = 48,
			id = 2,
			need_lev = 16,
			expend = {
				{
					32,
					187200
				},
				{
					1,
					2433600
				}
			},
			decompose_award = {
				{
					32,
					3596200
				}
			}
		},
		{
			add_dps = 55700,
			lev = 49,
			id = 2,
			need_lev = 17,
			expend = {
				{
					32,
					259700
				},
				{
					1,
					3376100
				}
			},
			decompose_award = {
				{
					32,
					3855900
				}
			}
		},
		{
			add_dps = 58200,
			lev = 50,
			id = 2,
			need_lev = 17,
			expend = {
				{
					32,
					270000
				},
				{
					1,
					3780000
				}
			},
			decompose_award = {
				{
					32,
					4125900
				}
			}
		},
		{
			add_dps = 60750,
			lev = 51,
			id = 2,
			need_lev = 17,
			expend = {
				{
					32,
					280500
				},
				{
					1,
					3927000
				}
			},
			decompose_award = {
				{
					32,
					4406400
				}
			}
		},
		{
			add_dps = 63350,
			lev = 52,
			id = 2,
			need_lev = 18,
			expend = {
				{
					32,
					291200
				},
				{
					1,
					4076800
				}
			},
			decompose_award = {
				{
					32,
					4697600
				}
			}
		},
		{
			add_dps = 66000,
			lev = 53,
			id = 2,
			need_lev = 18,
			expend = {
				{
					32,
					302100
				},
				{
					1,
					4229400
				}
			},
			decompose_award = {
				{
					32,
					4999700
				}
			}
		},
		{
			add_dps = 68700,
			lev = 54,
			id = 2,
			need_lev = 18,
			expend = {
				{
					32,
					313200
				},
				{
					1,
					4384800
				}
			},
			decompose_award = {
				{
					32,
					5312900
				}
			}
		},
		{
			add_dps = 73100,
			lev = 55,
			id = 2,
			need_lev = 19,
			expend = {
				{
					32,
					330400
				},
				{
					1,
					4625600
				}
			},
			decompose_award = {
				{
					32,
					5643300
				}
			}
		},
		{
			add_dps = 77580,
			lev = 56,
			id = 2,
			need_lev = 19,
			expend = {
				{
					32,
					348000
				},
				{
					1,
					4872000
				}
			},
			decompose_award = {
				{
					32,
					5991300
				}
			}
		},
		{
			add_dps = 82140,
			lev = 57,
			id = 2,
			need_lev = 19,
			expend = {
				{
					32,
					366000
				},
				{
					1,
					5124000
				}
			},
			decompose_award = {
				{
					32,
					6357300
				}
			}
		},
		{
			add_dps = 86780,
			lev = 58,
			id = 2,
			need_lev = 20,
			expend = {
				{
					32,
					384400
				},
				{
					1,
					5381600
				}
			},
			decompose_award = {
				{
					32,
					6741700
				}
			}
		},
		{
			add_dps = 91500,
			lev = 59,
			id = 2,
			need_lev = 20,
			expend = {
				{
					32,
					403200
				},
				{
					1,
					5644800
				}
			},
			decompose_award = {
				{
					32,
					7144900
				}
			}
		},
		{
			add_dps = 96300,
			lev = 60,
			id = 2,
			need_lev = 20,
			expend = {
				{
					32,
					422400
				},
				{
					1,
					6336000
				}
			},
			decompose_award = {
				{
					32,
					7567300
				}
			}
		},
		{
			add_dps = 101180,
			lev = 61,
			id = 2,
			need_lev = 21,
			expend = {
				{
					32,
					442000
				},
				{
					1,
					6630000
				}
			},
			decompose_award = {
				{
					32,
					8009300
				}
			}
		},
		{
			add_dps = 106140,
			lev = 62,
			id = 2,
			need_lev = 21,
			expend = {
				{
					32,
					462000
				},
				{
					1,
					6930000
				}
			},
			decompose_award = {
				{
					32,
					8471300
				}
			}
		},
		{
			add_dps = 111180,
			lev = 63,
			id = 2,
			need_lev = 21,
			expend = {
				{
					32,
					482400
				},
				{
					1,
					7236000
				}
			},
			decompose_award = {
				{
					32,
					8953700
				}
			}
		},
		{
			add_dps = 116300,
			lev = 64,
			id = 2,
			need_lev = 22,
			expend = {
				{
					32,
					503200
				},
				{
					1,
					7548000
				}
			},
			decompose_award = {
				{
					32,
					9456900
				}
			}
		},
		{
			add_dps = 121500,
			lev = 65,
			id = 2,
			need_lev = 22,
			expend = {
				{
					32,
					524400
				},
				{
					1,
					7866000
				}
			},
			decompose_award = {
				{
					32,
					9981300
				}
			}
		},
		{
			add_dps = 126780,
			lev = 66,
			id = 2,
			need_lev = 22,
			expend = {
				{
					32,
					546000
				},
				{
					1,
					8190000
				}
			},
			decompose_award = {
				{
					32,
					10527300
				}
			}
		},
		{
			add_dps = 132140,
			lev = 67,
			id = 2,
			need_lev = 23,
			expend = {
				{
					32,
					568000
				},
				{
					1,
					8520000
				}
			},
			decompose_award = {
				{
					32,
					11095300
				}
			}
		},
		{
			add_dps = 137580,
			lev = 68,
			id = 2,
			need_lev = 23,
			expend = {
				{
					32,
					590400
				},
				{
					1,
					8856000
				}
			},
			decompose_award = {
				{
					32,
					11685700
				}
			}
		},
		{
			add_dps = 143100,
			lev = 69,
			id = 2,
			need_lev = 23,
			expend = {
				{
					32,
					613200
				},
				{
					1,
					9198000
				}
			},
			decompose_award = {
				{
					32,
					12298900
				}
			}
		},
		{
			add_dps = 148700,
			lev = 70,
			id = 2,
			need_lev = 24,
			expend = {
				{
					32,
					636400
				},
				{
					1,
					9546000
				}
			},
			decompose_award = {
				{
					32,
					12935300
				}
			}
		},
		{
			add_dps = 154380,
			lev = 71,
			id = 2,
			need_lev = 24,
			expend = {
				{
					32,
					660000
				},
				{
					1,
					9900000
				}
			},
			decompose_award = {
				{
					32,
					13595300
				}
			}
		},
		{
			add_dps = 160140,
			lev = 72,
			id = 2,
			need_lev = 24,
			expend = {
				{
					32,
					684000
				},
				{
					1,
					10260000
				}
			},
			decompose_award = {
				{
					32,
					14279300
				}
			}
		}
	},
	{
		{
			add_dps = 400,
			lev = 1,
			id = 3,
			need_lev = 1,
			expend = {
				{
					32,
					500
				},
				{
					1,
					50000
				}
			},
			decompose_award = {
				{
					32,
					500
				}
			}
		},
		{
			add_dps = 900,
			lev = 2,
			id = 3,
			need_lev = 1,
			expend = {
				{
					32,
					1000
				},
				{
					1,
					60000
				}
			},
			decompose_award = {
				{
					32,
					1500
				}
			}
		},
		{
			add_dps = 1400,
			lev = 3,
			id = 3,
			need_lev = 1,
			expend = {
				{
					32,
					2000
				},
				{
					1,
					70000
				}
			},
			decompose_award = {
				{
					32,
					3500
				}
			}
		},
		{
			add_dps = 1900,
			lev = 4,
			id = 3,
			need_lev = 2,
			expend = {
				{
					32,
					3500
				},
				{
					1,
					80000
				}
			},
			decompose_award = {
				{
					32,
					7000
				}
			}
		},
		{
			add_dps = 2400,
			lev = 5,
			id = 3,
			need_lev = 2,
			expend = {
				{
					32,
					5000
				},
				{
					1,
					90000
				}
			},
			decompose_award = {
				{
					32,
					12000
				}
			}
		},
		{
			add_dps = 2900,
			lev = 6,
			id = 3,
			need_lev = 2,
			expend = {
				{
					32,
					8000
				},
				{
					1,
					100000
				}
			},
			decompose_award = {
				{
					32,
					20000
				}
			}
		},
		{
			add_dps = 3500,
			lev = 7,
			id = 3,
			need_lev = 3,
			expend = {
				{
					32,
					11000
				},
				{
					1,
					120000
				}
			},
			decompose_award = {
				{
					32,
					31000
				}
			}
		},
		{
			add_dps = 4100,
			lev = 8,
			id = 3,
			need_lev = 3,
			expend = {
				{
					32,
					14400
				},
				{
					1,
					140000
				}
			},
			decompose_award = {
				{
					32,
					45400
				}
			}
		},
		{
			add_dps = 4700,
			lev = 9,
			id = 3,
			need_lev = 3,
			expend = {
				{
					32,
					15600
				},
				{
					1,
					156000
				}
			},
			decompose_award = {
				{
					32,
					61000
				}
			}
		},
		{
			add_dps = 5300,
			lev = 10,
			id = 3,
			need_lev = 4,
			expend = {
				{
					32,
					16800
				},
				{
					1,
					168000
				}
			},
			decompose_award = {
				{
					32,
					77800
				}
			}
		},
		{
			add_dps = 5900,
			lev = 11,
			id = 3,
			need_lev = 4,
			expend = {
				{
					32,
					18000
				},
				{
					1,
					180000
				}
			},
			decompose_award = {
				{
					32,
					95800
				}
			}
		},
		{
			add_dps = 6500,
			lev = 12,
			id = 3,
			need_lev = 4,
			expend = {
				{
					32,
					19200
				},
				{
					1,
					192000
				}
			},
			decompose_award = {
				{
					32,
					115000
				}
			}
		},
		{
			add_dps = 7300,
			lev = 13,
			id = 3,
			need_lev = 5,
			expend = {
				{
					32,
					27200
				},
				{
					1,
					272000
				}
			},
			decompose_award = {
				{
					32,
					142200
				}
			}
		},
		{
			add_dps = 8100,
			lev = 14,
			id = 3,
			need_lev = 5,
			expend = {
				{
					32,
					28800
				},
				{
					1,
					288000
				}
			},
			decompose_award = {
				{
					32,
					171000
				}
			}
		},
		{
			add_dps = 8900,
			lev = 15,
			id = 3,
			need_lev = 5,
			expend = {
				{
					32,
					30400
				},
				{
					1,
					304000
				}
			},
			decompose_award = {
				{
					32,
					201400
				}
			}
		},
		{
			add_dps = 9700,
			lev = 16,
			id = 3,
			need_lev = 6,
			expend = {
				{
					32,
					32000
				},
				{
					1,
					320000
				}
			},
			decompose_award = {
				{
					32,
					233400
				}
			}
		},
		{
			add_dps = 10500,
			lev = 17,
			id = 3,
			need_lev = 6,
			expend = {
				{
					32,
					33600
				},
				{
					1,
					336000
				}
			},
			decompose_award = {
				{
					32,
					267000
				}
			}
		},
		{
			add_dps = 11300,
			lev = 18,
			id = 3,
			need_lev = 6,
			expend = {
				{
					32,
					35200
				},
				{
					1,
					352000
				}
			},
			decompose_award = {
				{
					32,
					302200
				}
			}
		},
		{
			add_dps = 12300,
			lev = 19,
			id = 3,
			need_lev = 7,
			expend = {
				{
					32,
					46000
				},
				{
					1,
					460000
				}
			},
			decompose_award = {
				{
					32,
					348200
				}
			}
		},
		{
			add_dps = 13300,
			lev = 20,
			id = 3,
			need_lev = 7,
			expend = {
				{
					32,
					48000
				},
				{
					1,
					480000
				}
			},
			decompose_award = {
				{
					32,
					396200
				}
			}
		},
		{
			add_dps = 14300,
			lev = 21,
			id = 3,
			need_lev = 7,
			expend = {
				{
					32,
					50000
				},
				{
					1,
					550000
				}
			},
			decompose_award = {
				{
					32,
					446200
				}
			}
		},
		{
			add_dps = 15300,
			lev = 22,
			id = 3,
			need_lev = 8,
			expend = {
				{
					32,
					52000
				},
				{
					1,
					572000
				}
			},
			decompose_award = {
				{
					32,
					498200
				}
			}
		},
		{
			add_dps = 16300,
			lev = 23,
			id = 3,
			need_lev = 8,
			expend = {
				{
					32,
					54000
				},
				{
					1,
					594000
				}
			},
			decompose_award = {
				{
					32,
					552200
				}
			}
		},
		{
			add_dps = 17300,
			lev = 24,
			id = 3,
			need_lev = 8,
			expend = {
				{
					32,
					56000
				},
				{
					1,
					616000
				}
			},
			decompose_award = {
				{
					32,
					608200
				}
			}
		},
		{
			add_dps = 18500,
			lev = 25,
			id = 3,
			need_lev = 9,
			expend = {
				{
					32,
					69600
				},
				{
					1,
					765600
				}
			},
			decompose_award = {
				{
					32,
					677800
				}
			}
		},
		{
			add_dps = 19700,
			lev = 26,
			id = 3,
			need_lev = 9,
			expend = {
				{
					32,
					72000
				},
				{
					1,
					792000
				}
			},
			decompose_award = {
				{
					32,
					749800
				}
			}
		},
		{
			add_dps = 20900,
			lev = 27,
			id = 3,
			need_lev = 9,
			expend = {
				{
					32,
					74400
				},
				{
					1,
					818400
				}
			},
			decompose_award = {
				{
					32,
					824200
				}
			}
		},
		{
			add_dps = 22100,
			lev = 28,
			id = 3,
			need_lev = 10,
			expend = {
				{
					32,
					76800
				},
				{
					1,
					844800
				}
			},
			decompose_award = {
				{
					32,
					901000
				}
			}
		},
		{
			add_dps = 23300,
			lev = 29,
			id = 3,
			need_lev = 10,
			expend = {
				{
					32,
					79200
				},
				{
					1,
					871200
				}
			},
			decompose_award = {
				{
					32,
					980200
				}
			}
		},
		{
			add_dps = 24500,
			lev = 30,
			id = 3,
			need_lev = 10,
			expend = {
				{
					32,
					81600
				},
				{
					1,
					979200
				}
			},
			decompose_award = {
				{
					32,
					1061800
				}
			}
		},
		{
			add_dps = 25900,
			lev = 31,
			id = 3,
			need_lev = 11,
			expend = {
				{
					32,
					98000
				},
				{
					1,
					1176000
				}
			},
			decompose_award = {
				{
					32,
					1159800
				}
			}
		},
		{
			add_dps = 27300,
			lev = 32,
			id = 3,
			need_lev = 11,
			expend = {
				{
					32,
					100800
				},
				{
					1,
					1209600
				}
			},
			decompose_award = {
				{
					32,
					1260600
				}
			}
		},
		{
			add_dps = 28700,
			lev = 33,
			id = 3,
			need_lev = 11,
			expend = {
				{
					32,
					103600
				},
				{
					1,
					1243200
				}
			},
			decompose_award = {
				{
					32,
					1364200
				}
			}
		},
		{
			add_dps = 30100,
			lev = 34,
			id = 3,
			need_lev = 12,
			expend = {
				{
					32,
					106400
				},
				{
					1,
					1276800
				}
			},
			decompose_award = {
				{
					32,
					1470600
				}
			}
		},
		{
			add_dps = 31500,
			lev = 35,
			id = 3,
			need_lev = 12,
			expend = {
				{
					32,
					109200
				},
				{
					1,
					1310400
				}
			},
			decompose_award = {
				{
					32,
					1579800
				}
			}
		},
		{
			add_dps = 32900,
			lev = 36,
			id = 3,
			need_lev = 12,
			expend = {
				{
					32,
					112000
				},
				{
					1,
					1344000
				}
			},
			decompose_award = {
				{
					32,
					1691800
				}
			}
		},
		{
			add_dps = 34500,
			lev = 37,
			id = 3,
			need_lev = 13,
			expend = {
				{
					32,
					131200
				},
				{
					1,
					1574400
				}
			},
			decompose_award = {
				{
					32,
					1823000
				}
			}
		},
		{
			add_dps = 36100,
			lev = 38,
			id = 3,
			need_lev = 13,
			expend = {
				{
					32,
					134400
				},
				{
					1,
					1612800
				}
			},
			decompose_award = {
				{
					32,
					1957400
				}
			}
		},
		{
			add_dps = 37700,
			lev = 39,
			id = 3,
			need_lev = 13,
			expend = {
				{
					32,
					137600
				},
				{
					1,
					1651200
				}
			},
			decompose_award = {
				{
					32,
					2095000
				}
			}
		},
		{
			add_dps = 39300,
			lev = 40,
			id = 3,
			need_lev = 14,
			expend = {
				{
					32,
					140800
				},
				{
					1,
					1830400
				}
			},
			decompose_award = {
				{
					32,
					2235800
				}
			}
		},
		{
			add_dps = 40900,
			lev = 41,
			id = 3,
			need_lev = 14,
			expend = {
				{
					32,
					144000
				},
				{
					1,
					1872000
				}
			},
			decompose_award = {
				{
					32,
					2379800
				}
			}
		},
		{
			add_dps = 42500,
			lev = 42,
			id = 3,
			need_lev = 14,
			expend = {
				{
					32,
					147200
				},
				{
					1,
					1913600
				}
			},
			decompose_award = {
				{
					32,
					2527000
				}
			}
		},
		{
			add_dps = 44300,
			lev = 43,
			id = 3,
			need_lev = 15,
			expend = {
				{
					32,
					169200
				},
				{
					1,
					2199600
				}
			},
			decompose_award = {
				{
					32,
					2696200
				}
			}
		},
		{
			add_dps = 46100,
			lev = 44,
			id = 3,
			need_lev = 15,
			expend = {
				{
					32,
					172800
				},
				{
					1,
					2246400
				}
			},
			decompose_award = {
				{
					32,
					2869000
				}
			}
		},
		{
			add_dps = 47900,
			lev = 45,
			id = 3,
			need_lev = 15,
			expend = {
				{
					32,
					176400
				},
				{
					1,
					2293200
				}
			},
			decompose_award = {
				{
					32,
					3045400
				}
			}
		},
		{
			add_dps = 49700,
			lev = 46,
			id = 3,
			need_lev = 16,
			expend = {
				{
					32,
					180000
				},
				{
					1,
					2340000
				}
			},
			decompose_award = {
				{
					32,
					3225400
				}
			}
		},
		{
			add_dps = 51500,
			lev = 47,
			id = 3,
			need_lev = 16,
			expend = {
				{
					32,
					183600
				},
				{
					1,
					2386800
				}
			},
			decompose_award = {
				{
					32,
					3409000
				}
			}
		},
		{
			add_dps = 53300,
			lev = 48,
			id = 3,
			need_lev = 16,
			expend = {
				{
					32,
					187200
				},
				{
					1,
					2433600
				}
			},
			decompose_award = {
				{
					32,
					3596200
				}
			}
		},
		{
			add_dps = 55750,
			lev = 49,
			id = 3,
			need_lev = 17,
			expend = {
				{
					32,
					259700
				},
				{
					1,
					3376100
				}
			},
			decompose_award = {
				{
					32,
					3855900
				}
			}
		},
		{
			add_dps = 58250,
			lev = 50,
			id = 3,
			need_lev = 17,
			expend = {
				{
					32,
					270000
				},
				{
					1,
					3780000
				}
			},
			decompose_award = {
				{
					32,
					4125900
				}
			}
		},
		{
			add_dps = 60800,
			lev = 51,
			id = 3,
			need_lev = 17,
			expend = {
				{
					32,
					280500
				},
				{
					1,
					3927000
				}
			},
			decompose_award = {
				{
					32,
					4406400
				}
			}
		},
		{
			add_dps = 63400,
			lev = 52,
			id = 3,
			need_lev = 18,
			expend = {
				{
					32,
					291200
				},
				{
					1,
					4076800
				}
			},
			decompose_award = {
				{
					32,
					4697600
				}
			}
		},
		{
			add_dps = 66050,
			lev = 53,
			id = 3,
			need_lev = 18,
			expend = {
				{
					32,
					302100
				},
				{
					1,
					4229400
				}
			},
			decompose_award = {
				{
					32,
					4999700
				}
			}
		},
		{
			add_dps = 68750,
			lev = 54,
			id = 3,
			need_lev = 18,
			expend = {
				{
					32,
					313200
				},
				{
					1,
					4384800
				}
			},
			decompose_award = {
				{
					32,
					5312900
				}
			}
		},
		{
			add_dps = 73150,
			lev = 55,
			id = 3,
			need_lev = 19,
			expend = {
				{
					32,
					330400
				},
				{
					1,
					4625600
				}
			},
			decompose_award = {
				{
					32,
					5643300
				}
			}
		},
		{
			add_dps = 77630,
			lev = 56,
			id = 3,
			need_lev = 19,
			expend = {
				{
					32,
					348000
				},
				{
					1,
					4872000
				}
			},
			decompose_award = {
				{
					32,
					5991300
				}
			}
		},
		{
			add_dps = 82190,
			lev = 57,
			id = 3,
			need_lev = 19,
			expend = {
				{
					32,
					366000
				},
				{
					1,
					5124000
				}
			},
			decompose_award = {
				{
					32,
					6357300
				}
			}
		},
		{
			add_dps = 86830,
			lev = 58,
			id = 3,
			need_lev = 20,
			expend = {
				{
					32,
					384400
				},
				{
					1,
					5381600
				}
			},
			decompose_award = {
				{
					32,
					6741700
				}
			}
		},
		{
			add_dps = 91550,
			lev = 59,
			id = 3,
			need_lev = 20,
			expend = {
				{
					32,
					403200
				},
				{
					1,
					5644800
				}
			},
			decompose_award = {
				{
					32,
					7144900
				}
			}
		},
		{
			add_dps = 96350,
			lev = 60,
			id = 3,
			need_lev = 20,
			expend = {
				{
					32,
					422400
				},
				{
					1,
					6336000
				}
			},
			decompose_award = {
				{
					32,
					7567300
				}
			}
		},
		{
			add_dps = 101230,
			lev = 61,
			id = 3,
			need_lev = 21,
			expend = {
				{
					32,
					442000
				},
				{
					1,
					6630000
				}
			},
			decompose_award = {
				{
					32,
					8009300
				}
			}
		},
		{
			add_dps = 106190,
			lev = 62,
			id = 3,
			need_lev = 21,
			expend = {
				{
					32,
					462000
				},
				{
					1,
					6930000
				}
			},
			decompose_award = {
				{
					32,
					8471300
				}
			}
		},
		{
			add_dps = 111230,
			lev = 63,
			id = 3,
			need_lev = 21,
			expend = {
				{
					32,
					482400
				},
				{
					1,
					7236000
				}
			},
			decompose_award = {
				{
					32,
					8953700
				}
			}
		},
		{
			add_dps = 116350,
			lev = 64,
			id = 3,
			need_lev = 22,
			expend = {
				{
					32,
					503200
				},
				{
					1,
					7548000
				}
			},
			decompose_award = {
				{
					32,
					9456900
				}
			}
		},
		{
			add_dps = 121550,
			lev = 65,
			id = 3,
			need_lev = 22,
			expend = {
				{
					32,
					524400
				},
				{
					1,
					7866000
				}
			},
			decompose_award = {
				{
					32,
					9981300
				}
			}
		},
		{
			add_dps = 126830,
			lev = 66,
			id = 3,
			need_lev = 22,
			expend = {
				{
					32,
					546000
				},
				{
					1,
					8190000
				}
			},
			decompose_award = {
				{
					32,
					10527300
				}
			}
		},
		{
			add_dps = 132190,
			lev = 67,
			id = 3,
			need_lev = 23,
			expend = {
				{
					32,
					568000
				},
				{
					1,
					8520000
				}
			},
			decompose_award = {
				{
					32,
					11095300
				}
			}
		},
		{
			add_dps = 137630,
			lev = 68,
			id = 3,
			need_lev = 23,
			expend = {
				{
					32,
					590400
				},
				{
					1,
					8856000
				}
			},
			decompose_award = {
				{
					32,
					11685700
				}
			}
		},
		{
			add_dps = 143150,
			lev = 69,
			id = 3,
			need_lev = 23,
			expend = {
				{
					32,
					613200
				},
				{
					1,
					9198000
				}
			},
			decompose_award = {
				{
					32,
					12298900
				}
			}
		},
		{
			add_dps = 148750,
			lev = 70,
			id = 3,
			need_lev = 24,
			expend = {
				{
					32,
					636400
				},
				{
					1,
					9546000
				}
			},
			decompose_award = {
				{
					32,
					12935300
				}
			}
		},
		{
			add_dps = 154430,
			lev = 71,
			id = 3,
			need_lev = 24,
			expend = {
				{
					32,
					660000
				},
				{
					1,
					9900000
				}
			},
			decompose_award = {
				{
					32,
					13595300
				}
			}
		},
		{
			add_dps = 160190,
			lev = 72,
			id = 3,
			need_lev = 24,
			expend = {
				{
					32,
					684000
				},
				{
					1,
					10260000
				}
			},
			decompose_award = {
				{
					32,
					14279300
				}
			}
		}
	},
	{
		{
			add_dps = 450,
			lev = 1,
			id = 4,
			need_lev = 1,
			expend = {
				{
					32,
					500
				},
				{
					1,
					50000
				}
			},
			decompose_award = {
				{
					32,
					500
				}
			}
		},
		{
			add_dps = 950,
			lev = 2,
			id = 4,
			need_lev = 1,
			expend = {
				{
					32,
					1000
				},
				{
					1,
					60000
				}
			},
			decompose_award = {
				{
					32,
					1500
				}
			}
		},
		{
			add_dps = 1450,
			lev = 3,
			id = 4,
			need_lev = 1,
			expend = {
				{
					32,
					2000
				},
				{
					1,
					70000
				}
			},
			decompose_award = {
				{
					32,
					3500
				}
			}
		},
		{
			add_dps = 1950,
			lev = 4,
			id = 4,
			need_lev = 2,
			expend = {
				{
					32,
					3500
				},
				{
					1,
					80000
				}
			},
			decompose_award = {
				{
					32,
					7000
				}
			}
		},
		{
			add_dps = 2450,
			lev = 5,
			id = 4,
			need_lev = 2,
			expend = {
				{
					32,
					5000
				},
				{
					1,
					90000
				}
			},
			decompose_award = {
				{
					32,
					12000
				}
			}
		},
		{
			add_dps = 2950,
			lev = 6,
			id = 4,
			need_lev = 2,
			expend = {
				{
					32,
					8000
				},
				{
					1,
					100000
				}
			},
			decompose_award = {
				{
					32,
					20000
				}
			}
		},
		{
			add_dps = 3550,
			lev = 7,
			id = 4,
			need_lev = 3,
			expend = {
				{
					32,
					11000
				},
				{
					1,
					120000
				}
			},
			decompose_award = {
				{
					32,
					31000
				}
			}
		},
		{
			add_dps = 4150,
			lev = 8,
			id = 4,
			need_lev = 3,
			expend = {
				{
					32,
					14400
				},
				{
					1,
					140000
				}
			},
			decompose_award = {
				{
					32,
					45400
				}
			}
		},
		{
			add_dps = 4750,
			lev = 9,
			id = 4,
			need_lev = 3,
			expend = {
				{
					32,
					15600
				},
				{
					1,
					156000
				}
			},
			decompose_award = {
				{
					32,
					61000
				}
			}
		},
		{
			add_dps = 5350,
			lev = 10,
			id = 4,
			need_lev = 4,
			expend = {
				{
					32,
					16800
				},
				{
					1,
					168000
				}
			},
			decompose_award = {
				{
					32,
					77800
				}
			}
		},
		{
			add_dps = 5950,
			lev = 11,
			id = 4,
			need_lev = 4,
			expend = {
				{
					32,
					18000
				},
				{
					1,
					180000
				}
			},
			decompose_award = {
				{
					32,
					95800
				}
			}
		},
		{
			add_dps = 6550,
			lev = 12,
			id = 4,
			need_lev = 4,
			expend = {
				{
					32,
					19200
				},
				{
					1,
					192000
				}
			},
			decompose_award = {
				{
					32,
					115000
				}
			}
		},
		{
			add_dps = 7350,
			lev = 13,
			id = 4,
			need_lev = 5,
			expend = {
				{
					32,
					27200
				},
				{
					1,
					272000
				}
			},
			decompose_award = {
				{
					32,
					142200
				}
			}
		},
		{
			add_dps = 8150,
			lev = 14,
			id = 4,
			need_lev = 5,
			expend = {
				{
					32,
					28800
				},
				{
					1,
					288000
				}
			},
			decompose_award = {
				{
					32,
					171000
				}
			}
		},
		{
			add_dps = 8950,
			lev = 15,
			id = 4,
			need_lev = 5,
			expend = {
				{
					32,
					30400
				},
				{
					1,
					304000
				}
			},
			decompose_award = {
				{
					32,
					201400
				}
			}
		},
		{
			add_dps = 9750,
			lev = 16,
			id = 4,
			need_lev = 6,
			expend = {
				{
					32,
					32000
				},
				{
					1,
					320000
				}
			},
			decompose_award = {
				{
					32,
					233400
				}
			}
		},
		{
			add_dps = 10550,
			lev = 17,
			id = 4,
			need_lev = 6,
			expend = {
				{
					32,
					33600
				},
				{
					1,
					336000
				}
			},
			decompose_award = {
				{
					32,
					267000
				}
			}
		},
		{
			add_dps = 11350,
			lev = 18,
			id = 4,
			need_lev = 6,
			expend = {
				{
					32,
					35200
				},
				{
					1,
					352000
				}
			},
			decompose_award = {
				{
					32,
					302200
				}
			}
		},
		{
			add_dps = 12350,
			lev = 19,
			id = 4,
			need_lev = 7,
			expend = {
				{
					32,
					46000
				},
				{
					1,
					460000
				}
			},
			decompose_award = {
				{
					32,
					348200
				}
			}
		},
		{
			add_dps = 13350,
			lev = 20,
			id = 4,
			need_lev = 7,
			expend = {
				{
					32,
					48000
				},
				{
					1,
					480000
				}
			},
			decompose_award = {
				{
					32,
					396200
				}
			}
		},
		{
			add_dps = 14350,
			lev = 21,
			id = 4,
			need_lev = 7,
			expend = {
				{
					32,
					50000
				},
				{
					1,
					550000
				}
			},
			decompose_award = {
				{
					32,
					446200
				}
			}
		},
		{
			add_dps = 15350,
			lev = 22,
			id = 4,
			need_lev = 8,
			expend = {
				{
					32,
					52000
				},
				{
					1,
					572000
				}
			},
			decompose_award = {
				{
					32,
					498200
				}
			}
		},
		{
			add_dps = 16350,
			lev = 23,
			id = 4,
			need_lev = 8,
			expend = {
				{
					32,
					54000
				},
				{
					1,
					594000
				}
			},
			decompose_award = {
				{
					32,
					552200
				}
			}
		},
		{
			add_dps = 17350,
			lev = 24,
			id = 4,
			need_lev = 8,
			expend = {
				{
					32,
					56000
				},
				{
					1,
					616000
				}
			},
			decompose_award = {
				{
					32,
					608200
				}
			}
		},
		{
			add_dps = 18550,
			lev = 25,
			id = 4,
			need_lev = 9,
			expend = {
				{
					32,
					69600
				},
				{
					1,
					765600
				}
			},
			decompose_award = {
				{
					32,
					677800
				}
			}
		},
		{
			add_dps = 19750,
			lev = 26,
			id = 4,
			need_lev = 9,
			expend = {
				{
					32,
					72000
				},
				{
					1,
					792000
				}
			},
			decompose_award = {
				{
					32,
					749800
				}
			}
		},
		{
			add_dps = 20950,
			lev = 27,
			id = 4,
			need_lev = 9,
			expend = {
				{
					32,
					74400
				},
				{
					1,
					818400
				}
			},
			decompose_award = {
				{
					32,
					824200
				}
			}
		},
		{
			add_dps = 22150,
			lev = 28,
			id = 4,
			need_lev = 10,
			expend = {
				{
					32,
					76800
				},
				{
					1,
					844800
				}
			},
			decompose_award = {
				{
					32,
					901000
				}
			}
		},
		{
			add_dps = 23350,
			lev = 29,
			id = 4,
			need_lev = 10,
			expend = {
				{
					32,
					79200
				},
				{
					1,
					871200
				}
			},
			decompose_award = {
				{
					32,
					980200
				}
			}
		},
		{
			add_dps = 24550,
			lev = 30,
			id = 4,
			need_lev = 10,
			expend = {
				{
					32,
					81600
				},
				{
					1,
					979200
				}
			},
			decompose_award = {
				{
					32,
					1061800
				}
			}
		},
		{
			add_dps = 25950,
			lev = 31,
			id = 4,
			need_lev = 11,
			expend = {
				{
					32,
					98000
				},
				{
					1,
					1176000
				}
			},
			decompose_award = {
				{
					32,
					1159800
				}
			}
		},
		{
			add_dps = 27350,
			lev = 32,
			id = 4,
			need_lev = 11,
			expend = {
				{
					32,
					100800
				},
				{
					1,
					1209600
				}
			},
			decompose_award = {
				{
					32,
					1260600
				}
			}
		},
		{
			add_dps = 28750,
			lev = 33,
			id = 4,
			need_lev = 11,
			expend = {
				{
					32,
					103600
				},
				{
					1,
					1243200
				}
			},
			decompose_award = {
				{
					32,
					1364200
				}
			}
		},
		{
			add_dps = 30150,
			lev = 34,
			id = 4,
			need_lev = 12,
			expend = {
				{
					32,
					106400
				},
				{
					1,
					1276800
				}
			},
			decompose_award = {
				{
					32,
					1470600
				}
			}
		},
		{
			add_dps = 31550,
			lev = 35,
			id = 4,
			need_lev = 12,
			expend = {
				{
					32,
					109200
				},
				{
					1,
					1310400
				}
			},
			decompose_award = {
				{
					32,
					1579800
				}
			}
		},
		{
			add_dps = 32950,
			lev = 36,
			id = 4,
			need_lev = 12,
			expend = {
				{
					32,
					112000
				},
				{
					1,
					1344000
				}
			},
			decompose_award = {
				{
					32,
					1691800
				}
			}
		},
		{
			add_dps = 34550,
			lev = 37,
			id = 4,
			need_lev = 13,
			expend = {
				{
					32,
					131200
				},
				{
					1,
					1574400
				}
			},
			decompose_award = {
				{
					32,
					1823000
				}
			}
		},
		{
			add_dps = 36150,
			lev = 38,
			id = 4,
			need_lev = 13,
			expend = {
				{
					32,
					134400
				},
				{
					1,
					1612800
				}
			},
			decompose_award = {
				{
					32,
					1957400
				}
			}
		},
		{
			add_dps = 37750,
			lev = 39,
			id = 4,
			need_lev = 13,
			expend = {
				{
					32,
					137600
				},
				{
					1,
					1651200
				}
			},
			decompose_award = {
				{
					32,
					2095000
				}
			}
		},
		{
			add_dps = 39350,
			lev = 40,
			id = 4,
			need_lev = 14,
			expend = {
				{
					32,
					140800
				},
				{
					1,
					1830400
				}
			},
			decompose_award = {
				{
					32,
					2235800
				}
			}
		},
		{
			add_dps = 40950,
			lev = 41,
			id = 4,
			need_lev = 14,
			expend = {
				{
					32,
					144000
				},
				{
					1,
					1872000
				}
			},
			decompose_award = {
				{
					32,
					2379800
				}
			}
		},
		{
			add_dps = 42550,
			lev = 42,
			id = 4,
			need_lev = 14,
			expend = {
				{
					32,
					147200
				},
				{
					1,
					1913600
				}
			},
			decompose_award = {
				{
					32,
					2527000
				}
			}
		},
		{
			add_dps = 44350,
			lev = 43,
			id = 4,
			need_lev = 15,
			expend = {
				{
					32,
					169200
				},
				{
					1,
					2199600
				}
			},
			decompose_award = {
				{
					32,
					2696200
				}
			}
		},
		{
			add_dps = 46150,
			lev = 44,
			id = 4,
			need_lev = 15,
			expend = {
				{
					32,
					172800
				},
				{
					1,
					2246400
				}
			},
			decompose_award = {
				{
					32,
					2869000
				}
			}
		},
		{
			add_dps = 47950,
			lev = 45,
			id = 4,
			need_lev = 15,
			expend = {
				{
					32,
					176400
				},
				{
					1,
					2293200
				}
			},
			decompose_award = {
				{
					32,
					3045400
				}
			}
		},
		{
			add_dps = 49750,
			lev = 46,
			id = 4,
			need_lev = 16,
			expend = {
				{
					32,
					180000
				},
				{
					1,
					2340000
				}
			},
			decompose_award = {
				{
					32,
					3225400
				}
			}
		},
		{
			add_dps = 51550,
			lev = 47,
			id = 4,
			need_lev = 16,
			expend = {
				{
					32,
					183600
				},
				{
					1,
					2386800
				}
			},
			decompose_award = {
				{
					32,
					3409000
				}
			}
		},
		{
			add_dps = 53350,
			lev = 48,
			id = 4,
			need_lev = 16,
			expend = {
				{
					32,
					187200
				},
				{
					1,
					2433600
				}
			},
			decompose_award = {
				{
					32,
					3596200
				}
			}
		},
		{
			add_dps = 55800,
			lev = 49,
			id = 4,
			need_lev = 17,
			expend = {
				{
					32,
					259700
				},
				{
					1,
					3376100
				}
			},
			decompose_award = {
				{
					32,
					3855900
				}
			}
		},
		{
			add_dps = 58300,
			lev = 50,
			id = 4,
			need_lev = 17,
			expend = {
				{
					32,
					270000
				},
				{
					1,
					3780000
				}
			},
			decompose_award = {
				{
					32,
					4125900
				}
			}
		},
		{
			add_dps = 60850,
			lev = 51,
			id = 4,
			need_lev = 17,
			expend = {
				{
					32,
					280500
				},
				{
					1,
					3927000
				}
			},
			decompose_award = {
				{
					32,
					4406400
				}
			}
		},
		{
			add_dps = 63450,
			lev = 52,
			id = 4,
			need_lev = 18,
			expend = {
				{
					32,
					291200
				},
				{
					1,
					4076800
				}
			},
			decompose_award = {
				{
					32,
					4697600
				}
			}
		},
		{
			add_dps = 66100,
			lev = 53,
			id = 4,
			need_lev = 18,
			expend = {
				{
					32,
					302100
				},
				{
					1,
					4229400
				}
			},
			decompose_award = {
				{
					32,
					4999700
				}
			}
		},
		{
			add_dps = 68800,
			lev = 54,
			id = 4,
			need_lev = 18,
			expend = {
				{
					32,
					313200
				},
				{
					1,
					4384800
				}
			},
			decompose_award = {
				{
					32,
					5312900
				}
			}
		},
		{
			add_dps = 73200,
			lev = 55,
			id = 4,
			need_lev = 19,
			expend = {
				{
					32,
					330400
				},
				{
					1,
					4625600
				}
			},
			decompose_award = {
				{
					32,
					5643300
				}
			}
		},
		{
			add_dps = 77680,
			lev = 56,
			id = 4,
			need_lev = 19,
			expend = {
				{
					32,
					348000
				},
				{
					1,
					4872000
				}
			},
			decompose_award = {
				{
					32,
					5991300
				}
			}
		},
		{
			add_dps = 82240,
			lev = 57,
			id = 4,
			need_lev = 19,
			expend = {
				{
					32,
					366000
				},
				{
					1,
					5124000
				}
			},
			decompose_award = {
				{
					32,
					6357300
				}
			}
		},
		{
			add_dps = 86880,
			lev = 58,
			id = 4,
			need_lev = 20,
			expend = {
				{
					32,
					384400
				},
				{
					1,
					5381600
				}
			},
			decompose_award = {
				{
					32,
					6741700
				}
			}
		},
		{
			add_dps = 91600,
			lev = 59,
			id = 4,
			need_lev = 20,
			expend = {
				{
					32,
					403200
				},
				{
					1,
					5644800
				}
			},
			decompose_award = {
				{
					32,
					7144900
				}
			}
		},
		{
			add_dps = 96400,
			lev = 60,
			id = 4,
			need_lev = 20,
			expend = {
				{
					32,
					422400
				},
				{
					1,
					6336000
				}
			},
			decompose_award = {
				{
					32,
					7567300
				}
			}
		},
		{
			add_dps = 101280,
			lev = 61,
			id = 4,
			need_lev = 21,
			expend = {
				{
					32,
					442000
				},
				{
					1,
					6630000
				}
			},
			decompose_award = {
				{
					32,
					8009300
				}
			}
		},
		{
			add_dps = 106240,
			lev = 62,
			id = 4,
			need_lev = 21,
			expend = {
				{
					32,
					462000
				},
				{
					1,
					6930000
				}
			},
			decompose_award = {
				{
					32,
					8471300
				}
			}
		},
		{
			add_dps = 111280,
			lev = 63,
			id = 4,
			need_lev = 21,
			expend = {
				{
					32,
					482400
				},
				{
					1,
					7236000
				}
			},
			decompose_award = {
				{
					32,
					8953700
				}
			}
		},
		{
			add_dps = 116400,
			lev = 64,
			id = 4,
			need_lev = 22,
			expend = {
				{
					32,
					503200
				},
				{
					1,
					7548000
				}
			},
			decompose_award = {
				{
					32,
					9456900
				}
			}
		},
		{
			add_dps = 121600,
			lev = 65,
			id = 4,
			need_lev = 22,
			expend = {
				{
					32,
					524400
				},
				{
					1,
					7866000
				}
			},
			decompose_award = {
				{
					32,
					9981300
				}
			}
		},
		{
			add_dps = 126880,
			lev = 66,
			id = 4,
			need_lev = 22,
			expend = {
				{
					32,
					546000
				},
				{
					1,
					8190000
				}
			},
			decompose_award = {
				{
					32,
					10527300
				}
			}
		},
		{
			add_dps = 132240,
			lev = 67,
			id = 4,
			need_lev = 23,
			expend = {
				{
					32,
					568000
				},
				{
					1,
					8520000
				}
			},
			decompose_award = {
				{
					32,
					11095300
				}
			}
		},
		{
			add_dps = 137680,
			lev = 68,
			id = 4,
			need_lev = 23,
			expend = {
				{
					32,
					590400
				},
				{
					1,
					8856000
				}
			},
			decompose_award = {
				{
					32,
					11685700
				}
			}
		},
		{
			add_dps = 143200,
			lev = 69,
			id = 4,
			need_lev = 23,
			expend = {
				{
					32,
					613200
				},
				{
					1,
					9198000
				}
			},
			decompose_award = {
				{
					32,
					12298900
				}
			}
		},
		{
			add_dps = 148800,
			lev = 70,
			id = 4,
			need_lev = 24,
			expend = {
				{
					32,
					636400
				},
				{
					1,
					9546000
				}
			},
			decompose_award = {
				{
					32,
					12935300
				}
			}
		},
		{
			add_dps = 154480,
			lev = 71,
			id = 4,
			need_lev = 24,
			expend = {
				{
					32,
					660000
				},
				{
					1,
					9900000
				}
			},
			decompose_award = {
				{
					32,
					13595300
				}
			}
		},
		{
			add_dps = 160240,
			lev = 72,
			id = 4,
			need_lev = 24,
			expend = {
				{
					32,
					684000
				},
				{
					1,
					10260000
				}
			},
			decompose_award = {
				{
					32,
					14279300
				}
			}
		}
	},
	{
		{
			add_dps = 500,
			lev = 1,
			id = 5,
			need_lev = 1,
			expend = {
				{
					32,
					500
				},
				{
					1,
					50000
				}
			},
			decompose_award = {
				{
					32,
					500
				}
			}
		},
		{
			add_dps = 1000,
			lev = 2,
			id = 5,
			need_lev = 1,
			expend = {
				{
					32,
					1000
				},
				{
					1,
					60000
				}
			},
			decompose_award = {
				{
					32,
					1500
				}
			}
		},
		{
			add_dps = 1500,
			lev = 3,
			id = 5,
			need_lev = 1,
			expend = {
				{
					32,
					2000
				},
				{
					1,
					70000
				}
			},
			decompose_award = {
				{
					32,
					3500
				}
			}
		},
		{
			add_dps = 2000,
			lev = 4,
			id = 5,
			need_lev = 2,
			expend = {
				{
					32,
					3500
				},
				{
					1,
					80000
				}
			},
			decompose_award = {
				{
					32,
					7000
				}
			}
		},
		{
			add_dps = 2500,
			lev = 5,
			id = 5,
			need_lev = 2,
			expend = {
				{
					32,
					5000
				},
				{
					1,
					90000
				}
			},
			decompose_award = {
				{
					32,
					12000
				}
			}
		},
		{
			add_dps = 3000,
			lev = 6,
			id = 5,
			need_lev = 2,
			expend = {
				{
					32,
					8000
				},
				{
					1,
					100000
				}
			},
			decompose_award = {
				{
					32,
					20000
				}
			}
		},
		{
			add_dps = 3600,
			lev = 7,
			id = 5,
			need_lev = 3,
			expend = {
				{
					32,
					11000
				},
				{
					1,
					120000
				}
			},
			decompose_award = {
				{
					32,
					31000
				}
			}
		},
		{
			add_dps = 4200,
			lev = 8,
			id = 5,
			need_lev = 3,
			expend = {
				{
					32,
					14400
				},
				{
					1,
					140000
				}
			},
			decompose_award = {
				{
					32,
					45400
				}
			}
		},
		{
			add_dps = 4800,
			lev = 9,
			id = 5,
			need_lev = 3,
			expend = {
				{
					32,
					15600
				},
				{
					1,
					156000
				}
			},
			decompose_award = {
				{
					32,
					61000
				}
			}
		},
		{
			add_dps = 5400,
			lev = 10,
			id = 5,
			need_lev = 4,
			expend = {
				{
					32,
					16800
				},
				{
					1,
					168000
				}
			},
			decompose_award = {
				{
					32,
					77800
				}
			}
		},
		{
			add_dps = 6000,
			lev = 11,
			id = 5,
			need_lev = 4,
			expend = {
				{
					32,
					18000
				},
				{
					1,
					180000
				}
			},
			decompose_award = {
				{
					32,
					95800
				}
			}
		},
		{
			add_dps = 6600,
			lev = 12,
			id = 5,
			need_lev = 4,
			expend = {
				{
					32,
					19200
				},
				{
					1,
					192000
				}
			},
			decompose_award = {
				{
					32,
					115000
				}
			}
		},
		{
			add_dps = 7400,
			lev = 13,
			id = 5,
			need_lev = 5,
			expend = {
				{
					32,
					27200
				},
				{
					1,
					272000
				}
			},
			decompose_award = {
				{
					32,
					142200
				}
			}
		},
		{
			add_dps = 8200,
			lev = 14,
			id = 5,
			need_lev = 5,
			expend = {
				{
					32,
					28800
				},
				{
					1,
					288000
				}
			},
			decompose_award = {
				{
					32,
					171000
				}
			}
		},
		{
			add_dps = 9000,
			lev = 15,
			id = 5,
			need_lev = 5,
			expend = {
				{
					32,
					30400
				},
				{
					1,
					304000
				}
			},
			decompose_award = {
				{
					32,
					201400
				}
			}
		},
		{
			add_dps = 9800,
			lev = 16,
			id = 5,
			need_lev = 6,
			expend = {
				{
					32,
					32000
				},
				{
					1,
					320000
				}
			},
			decompose_award = {
				{
					32,
					233400
				}
			}
		},
		{
			add_dps = 10600,
			lev = 17,
			id = 5,
			need_lev = 6,
			expend = {
				{
					32,
					33600
				},
				{
					1,
					336000
				}
			},
			decompose_award = {
				{
					32,
					267000
				}
			}
		},
		{
			add_dps = 11400,
			lev = 18,
			id = 5,
			need_lev = 6,
			expend = {
				{
					32,
					35200
				},
				{
					1,
					352000
				}
			},
			decompose_award = {
				{
					32,
					302200
				}
			}
		},
		{
			add_dps = 12400,
			lev = 19,
			id = 5,
			need_lev = 7,
			expend = {
				{
					32,
					46000
				},
				{
					1,
					460000
				}
			},
			decompose_award = {
				{
					32,
					348200
				}
			}
		},
		{
			add_dps = 13400,
			lev = 20,
			id = 5,
			need_lev = 7,
			expend = {
				{
					32,
					48000
				},
				{
					1,
					480000
				}
			},
			decompose_award = {
				{
					32,
					396200
				}
			}
		},
		{
			add_dps = 14400,
			lev = 21,
			id = 5,
			need_lev = 7,
			expend = {
				{
					32,
					50000
				},
				{
					1,
					550000
				}
			},
			decompose_award = {
				{
					32,
					446200
				}
			}
		},
		{
			add_dps = 15400,
			lev = 22,
			id = 5,
			need_lev = 8,
			expend = {
				{
					32,
					52000
				},
				{
					1,
					572000
				}
			},
			decompose_award = {
				{
					32,
					498200
				}
			}
		},
		{
			add_dps = 16400,
			lev = 23,
			id = 5,
			need_lev = 8,
			expend = {
				{
					32,
					54000
				},
				{
					1,
					594000
				}
			},
			decompose_award = {
				{
					32,
					552200
				}
			}
		},
		{
			add_dps = 17400,
			lev = 24,
			id = 5,
			need_lev = 8,
			expend = {
				{
					32,
					56000
				},
				{
					1,
					616000
				}
			},
			decompose_award = {
				{
					32,
					608200
				}
			}
		},
		{
			add_dps = 18600,
			lev = 25,
			id = 5,
			need_lev = 9,
			expend = {
				{
					32,
					69600
				},
				{
					1,
					765600
				}
			},
			decompose_award = {
				{
					32,
					677800
				}
			}
		},
		{
			add_dps = 19800,
			lev = 26,
			id = 5,
			need_lev = 9,
			expend = {
				{
					32,
					72000
				},
				{
					1,
					792000
				}
			},
			decompose_award = {
				{
					32,
					749800
				}
			}
		},
		{
			add_dps = 21000,
			lev = 27,
			id = 5,
			need_lev = 9,
			expend = {
				{
					32,
					74400
				},
				{
					1,
					818400
				}
			},
			decompose_award = {
				{
					32,
					824200
				}
			}
		},
		{
			add_dps = 22200,
			lev = 28,
			id = 5,
			need_lev = 10,
			expend = {
				{
					32,
					76800
				},
				{
					1,
					844800
				}
			},
			decompose_award = {
				{
					32,
					901000
				}
			}
		},
		{
			add_dps = 23400,
			lev = 29,
			id = 5,
			need_lev = 10,
			expend = {
				{
					32,
					79200
				},
				{
					1,
					871200
				}
			},
			decompose_award = {
				{
					32,
					980200
				}
			}
		},
		{
			add_dps = 24600,
			lev = 30,
			id = 5,
			need_lev = 10,
			expend = {
				{
					32,
					81600
				},
				{
					1,
					979200
				}
			},
			decompose_award = {
				{
					32,
					1061800
				}
			}
		},
		{
			add_dps = 26000,
			lev = 31,
			id = 5,
			need_lev = 11,
			expend = {
				{
					32,
					98000
				},
				{
					1,
					1176000
				}
			},
			decompose_award = {
				{
					32,
					1159800
				}
			}
		},
		{
			add_dps = 27400,
			lev = 32,
			id = 5,
			need_lev = 11,
			expend = {
				{
					32,
					100800
				},
				{
					1,
					1209600
				}
			},
			decompose_award = {
				{
					32,
					1260600
				}
			}
		},
		{
			add_dps = 28800,
			lev = 33,
			id = 5,
			need_lev = 11,
			expend = {
				{
					32,
					103600
				},
				{
					1,
					1243200
				}
			},
			decompose_award = {
				{
					32,
					1364200
				}
			}
		},
		{
			add_dps = 30200,
			lev = 34,
			id = 5,
			need_lev = 12,
			expend = {
				{
					32,
					106400
				},
				{
					1,
					1276800
				}
			},
			decompose_award = {
				{
					32,
					1470600
				}
			}
		},
		{
			add_dps = 31600,
			lev = 35,
			id = 5,
			need_lev = 12,
			expend = {
				{
					32,
					109200
				},
				{
					1,
					1310400
				}
			},
			decompose_award = {
				{
					32,
					1579800
				}
			}
		},
		{
			add_dps = 33000,
			lev = 36,
			id = 5,
			need_lev = 12,
			expend = {
				{
					32,
					112000
				},
				{
					1,
					1344000
				}
			},
			decompose_award = {
				{
					32,
					1691800
				}
			}
		},
		{
			add_dps = 34600,
			lev = 37,
			id = 5,
			need_lev = 13,
			expend = {
				{
					32,
					131200
				},
				{
					1,
					1574400
				}
			},
			decompose_award = {
				{
					32,
					1823000
				}
			}
		},
		{
			add_dps = 36200,
			lev = 38,
			id = 5,
			need_lev = 13,
			expend = {
				{
					32,
					134400
				},
				{
					1,
					1612800
				}
			},
			decompose_award = {
				{
					32,
					1957400
				}
			}
		},
		{
			add_dps = 37800,
			lev = 39,
			id = 5,
			need_lev = 13,
			expend = {
				{
					32,
					137600
				},
				{
					1,
					1651200
				}
			},
			decompose_award = {
				{
					32,
					2095000
				}
			}
		},
		{
			add_dps = 39400,
			lev = 40,
			id = 5,
			need_lev = 14,
			expend = {
				{
					32,
					140800
				},
				{
					1,
					1830400
				}
			},
			decompose_award = {
				{
					32,
					2235800
				}
			}
		},
		{
			add_dps = 41000,
			lev = 41,
			id = 5,
			need_lev = 14,
			expend = {
				{
					32,
					144000
				},
				{
					1,
					1872000
				}
			},
			decompose_award = {
				{
					32,
					2379800
				}
			}
		},
		{
			add_dps = 42600,
			lev = 42,
			id = 5,
			need_lev = 14,
			expend = {
				{
					32,
					147200
				},
				{
					1,
					1913600
				}
			},
			decompose_award = {
				{
					32,
					2527000
				}
			}
		},
		{
			add_dps = 44400,
			lev = 43,
			id = 5,
			need_lev = 15,
			expend = {
				{
					32,
					169200
				},
				{
					1,
					2199600
				}
			},
			decompose_award = {
				{
					32,
					2696200
				}
			}
		},
		{
			add_dps = 46200,
			lev = 44,
			id = 5,
			need_lev = 15,
			expend = {
				{
					32,
					172800
				},
				{
					1,
					2246400
				}
			},
			decompose_award = {
				{
					32,
					2869000
				}
			}
		},
		{
			add_dps = 48000,
			lev = 45,
			id = 5,
			need_lev = 15,
			expend = {
				{
					32,
					176400
				},
				{
					1,
					2293200
				}
			},
			decompose_award = {
				{
					32,
					3045400
				}
			}
		},
		{
			add_dps = 49800,
			lev = 46,
			id = 5,
			need_lev = 16,
			expend = {
				{
					32,
					180000
				},
				{
					1,
					2340000
				}
			},
			decompose_award = {
				{
					32,
					3225400
				}
			}
		},
		{
			add_dps = 51600,
			lev = 47,
			id = 5,
			need_lev = 16,
			expend = {
				{
					32,
					183600
				},
				{
					1,
					2386800
				}
			},
			decompose_award = {
				{
					32,
					3409000
				}
			}
		},
		{
			add_dps = 53400,
			lev = 48,
			id = 5,
			need_lev = 16,
			expend = {
				{
					32,
					187200
				},
				{
					1,
					2433600
				}
			},
			decompose_award = {
				{
					32,
					3596200
				}
			}
		},
		{
			add_dps = 55850,
			lev = 49,
			id = 5,
			need_lev = 17,
			expend = {
				{
					32,
					259700
				},
				{
					1,
					3376100
				}
			},
			decompose_award = {
				{
					32,
					3855900
				}
			}
		},
		{
			add_dps = 58350,
			lev = 50,
			id = 5,
			need_lev = 17,
			expend = {
				{
					32,
					270000
				},
				{
					1,
					3780000
				}
			},
			decompose_award = {
				{
					32,
					4125900
				}
			}
		},
		{
			add_dps = 60900,
			lev = 51,
			id = 5,
			need_lev = 17,
			expend = {
				{
					32,
					280500
				},
				{
					1,
					3927000
				}
			},
			decompose_award = {
				{
					32,
					4406400
				}
			}
		},
		{
			add_dps = 63500,
			lev = 52,
			id = 5,
			need_lev = 18,
			expend = {
				{
					32,
					291200
				},
				{
					1,
					4076800
				}
			},
			decompose_award = {
				{
					32,
					4697600
				}
			}
		},
		{
			add_dps = 66150,
			lev = 53,
			id = 5,
			need_lev = 18,
			expend = {
				{
					32,
					302100
				},
				{
					1,
					4229400
				}
			},
			decompose_award = {
				{
					32,
					4999700
				}
			}
		},
		{
			add_dps = 68850,
			lev = 54,
			id = 5,
			need_lev = 18,
			expend = {
				{
					32,
					313200
				},
				{
					1,
					4384800
				}
			},
			decompose_award = {
				{
					32,
					5312900
				}
			}
		},
		{
			add_dps = 73250,
			lev = 55,
			id = 5,
			need_lev = 19,
			expend = {
				{
					32,
					330400
				},
				{
					1,
					4625600
				}
			},
			decompose_award = {
				{
					32,
					5643300
				}
			}
		},
		{
			add_dps = 77730,
			lev = 56,
			id = 5,
			need_lev = 19,
			expend = {
				{
					32,
					348000
				},
				{
					1,
					4872000
				}
			},
			decompose_award = {
				{
					32,
					5991300
				}
			}
		},
		{
			add_dps = 82290,
			lev = 57,
			id = 5,
			need_lev = 19,
			expend = {
				{
					32,
					366000
				},
				{
					1,
					5124000
				}
			},
			decompose_award = {
				{
					32,
					6357300
				}
			}
		},
		{
			add_dps = 86930,
			lev = 58,
			id = 5,
			need_lev = 20,
			expend = {
				{
					32,
					384400
				},
				{
					1,
					5381600
				}
			},
			decompose_award = {
				{
					32,
					6741700
				}
			}
		},
		{
			add_dps = 91650,
			lev = 59,
			id = 5,
			need_lev = 20,
			expend = {
				{
					32,
					403200
				},
				{
					1,
					5644800
				}
			},
			decompose_award = {
				{
					32,
					7144900
				}
			}
		},
		{
			add_dps = 96450,
			lev = 60,
			id = 5,
			need_lev = 20,
			expend = {
				{
					32,
					422400
				},
				{
					1,
					6336000
				}
			},
			decompose_award = {
				{
					32,
					7567300
				}
			}
		},
		{
			add_dps = 101330,
			lev = 61,
			id = 5,
			need_lev = 21,
			expend = {
				{
					32,
					442000
				},
				{
					1,
					6630000
				}
			},
			decompose_award = {
				{
					32,
					8009300
				}
			}
		},
		{
			add_dps = 106290,
			lev = 62,
			id = 5,
			need_lev = 21,
			expend = {
				{
					32,
					462000
				},
				{
					1,
					6930000
				}
			},
			decompose_award = {
				{
					32,
					8471300
				}
			}
		},
		{
			add_dps = 111330,
			lev = 63,
			id = 5,
			need_lev = 21,
			expend = {
				{
					32,
					482400
				},
				{
					1,
					7236000
				}
			},
			decompose_award = {
				{
					32,
					8953700
				}
			}
		},
		{
			add_dps = 116450,
			lev = 64,
			id = 5,
			need_lev = 22,
			expend = {
				{
					32,
					503200
				},
				{
					1,
					7548000
				}
			},
			decompose_award = {
				{
					32,
					9456900
				}
			}
		},
		{
			add_dps = 121650,
			lev = 65,
			id = 5,
			need_lev = 22,
			expend = {
				{
					32,
					524400
				},
				{
					1,
					7866000
				}
			},
			decompose_award = {
				{
					32,
					9981300
				}
			}
		},
		{
			add_dps = 126930,
			lev = 66,
			id = 5,
			need_lev = 22,
			expend = {
				{
					32,
					546000
				},
				{
					1,
					8190000
				}
			},
			decompose_award = {
				{
					32,
					10527300
				}
			}
		},
		{
			add_dps = 132290,
			lev = 67,
			id = 5,
			need_lev = 23,
			expend = {
				{
					32,
					568000
				},
				{
					1,
					8520000
				}
			},
			decompose_award = {
				{
					32,
					11095300
				}
			}
		},
		{
			add_dps = 137730,
			lev = 68,
			id = 5,
			need_lev = 23,
			expend = {
				{
					32,
					590400
				},
				{
					1,
					8856000
				}
			},
			decompose_award = {
				{
					32,
					11685700
				}
			}
		},
		{
			add_dps = 143250,
			lev = 69,
			id = 5,
			need_lev = 23,
			expend = {
				{
					32,
					613200
				},
				{
					1,
					9198000
				}
			},
			decompose_award = {
				{
					32,
					12298900
				}
			}
		},
		{
			add_dps = 148850,
			lev = 70,
			id = 5,
			need_lev = 24,
			expend = {
				{
					32,
					636400
				},
				{
					1,
					9546000
				}
			},
			decompose_award = {
				{
					32,
					12935300
				}
			}
		},
		{
			add_dps = 154530,
			lev = 71,
			id = 5,
			need_lev = 24,
			expend = {
				{
					32,
					660000
				},
				{
					1,
					9900000
				}
			},
			decompose_award = {
				{
					32,
					13595300
				}
			}
		},
		{
			add_dps = 160290,
			lev = 72,
			id = 5,
			need_lev = 24,
			expend = {
				{
					32,
					684000
				},
				{
					1,
					10260000
				}
			},
			decompose_award = {
				{
					32,
					14279300
				}
			}
		}
	}
}
Config.HallowsRefineData.data_max_lev_length = 5
Config.HallowsRefineData.data_max_lev = {
	72,
	72,
	72,
	72,
	72
}
