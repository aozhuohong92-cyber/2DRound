AdventureEvent = AdventureEvent or {}
AdventureEvent.UPDATE_ROLE_ATTRIBUTE = "AdventureEvent.UPDATE_ROLE_ATTRIBUTE"
AdventureEvent.SCENE_WALKEND = "AdventureEvent.SCENE_WALKEND"
AdventureEvent.SCENE_CHANGE = "AdventureEvent.SCENE_CHANGE"
AdventureEvent.UPDATE_RED_INFO = "AdventureEvent.UPDATE_RED_INFO"
AdventureEvent.Update_Room_Base_Info = "AdventureEvent.Update_Room_Base_Info"
AdventureEvent.Update_Buff_Info = "AdventureEvent.Update_Buff_Info"
AdventureEvent.Update_Room_Info = "AdventureEvent.Update_Room_Info"
AdventureEvent.Update_BackPack_Info = "AdventureEvent.Update_BackPack_Info"
AdventureEvent.Update_Single_Room_Info = "AdventureEvent.Update_Single_Room_Info"
AdventureEvent.Update_Evt_Buff_Info = "AdventureEvent.Update_Evt_Buff_Info"
AdventureEvent.Update_Evt_Answer_Info = "AdventureEvent.Update_Evt_Answer_Info"
AdventureEvent.Update_Adventure_Formation_Info = "AdventureEvent.Update_Adventure_Formation_Info"
AdventureEvent.Update_Evt_Plunder_Info = "AdventureEvent.Update_Evt_Plunder_Info"
AdventureEvent.Update_Evt_Npc_Info = "AdventureEvent.Update_Evt_Npc_Info"
AdventureEvent.Update_Evt_Plunder_Partner_Info = "AdventureEvent.Update_Evt_Plunder_Partner_Info"
AdventureEvent.Update_Evt_Guess_Result = "AdventureEvent.Update_Evt_Guess_Result"
AdventureEvent.Update_Evt_Box_Result_Info = "AdventureEvent.Update_Evt_Box_Result_Info"
AdventureEvent.Update_Plunder_Record_Info = "AdventureEvent.Update_Plunder_Record_Info"
AdventureEvent.Update_Record_Plunder_View_Info = "AdventureEvent.Update_Record_Plunder_View_Info"
AdventureEvent.Update_Red_Point_Info = "AdventureEvent.Update_Red_Point_Info"
AdventureEvent.Update_Evt_Shop_Info = "AdventureEvent.Update_Evt_Shop_Info"
AdventureEvent.Update_event_over_Info = "AdventureEvent.Update_event_over_Info"
AdventureEvent.ResetFloorEvent = "AdventureEvent.ResetFloorEvent"
AdventureEvent.HandleRoomOverEvent = "AdventureEvent.HandleRoomOverEvent"
AdventureEvent.UpdateAdventureForm = "AdventureEvent.UpdateAdventureForm"
AdventureEvent.UpdateSkillInfo = "AdventureEvent.UpdateSkillInfo"
AdventureEvent.UpdateAdventureSelectHero = "AdventureEvent.UpdateAdventureSelectHero"
AdventureEvent.UpdateMonsterHP = "AdventureEvent.UpdateMonsterHP"
AdventureEvent.UpdateShotKillInfo = "AdventureEvent.UpdateShotKillInfo"
AdventureEvent.UpdateShopTotalEvent = "AdventureEvent.UpdateShopTotalEvent"
AdventureEvent.UpdateShopItemEvent = "AdventureEvent.UpdateShopItemEvent"
AdventureEvent.GetSkillForEffectAction = "AdventureEvent.GetSkillForEffectAction"
AdventureEvent.UpdateBoxTeskEvent = "AdventureEvent.UpdateBoxTeskEvent"
AdventureEvent.ADVENTURE_MINE_BASE_INFO_EVENT = "AdventureEvent.ADVENTURE_MINE_BASE_INFO_EVENT"
AdventureEvent.ADVENTURE_MINE_SINGLE_INFO_EVENT = "AdventureEvent.ADVENTURE_MINE_SINGLE_INFO_EVENT"
AdventureEvent.ADVENTURE_MINE_ALL_LOG_EVENT = "AdventureEvent.ADVENTURE_MINE_ALL_LOG_EVENT"
AdventureEvent.ADVENTURE_MINE_SINGE_LOG_EVENT = "AdventureEvent.ADVENTURE_MINE_SINGE_LOG_EVENT"
AdventureEvent.ADVENTURE_MINE_BOX_LIST_EVENT = "AdventureEvent.ADVENTURE_MINE_BOX_LIST_EVENT"
AdventureEvent.ADVENTURE_MINE_RECEIVE_BOX_EVENT = "AdventureEvent.ADVENTURE_MINE_RECEIVE_BOX_EVENT"
AdventureEvent.ADVENTURE_MINE_SAVE_FORM_EVENT = "AdventureEvent.ADVENTURE_MINE_SAVE_FORM_EVENT"
AdventureEvent.ADVENTURE_MINE_SAVE_BACK_EVENT = "AdventureEvent.ADVENTURE_MINE_SAVE_BACK_EVENT"
AdventureEvent.ADVENTURE_MINE_GIVE_UP_OCCUPY_EVENT = "AdventureEvent.ADVENTURE_MINE_GIVE_UP_OCCUPY_EVENT"
AdventureEvent.ADVENTURE_MINE_MY_MINE_INFO_EVENT = "AdventureEvent.ADVENTURE_MINE_MY_MINE_INFO_EVENT"
AdventureEvent.ADVENTURE_MINE_All_LAYER_INFO_EVENT = "AdventureEvent.ADVENTURE_MINE_All_LAYER_INFO_EVENT"
AdventureEvent.ADVENTURE_MINE_BUY_EMPLOY_EVENT = "AdventureEvent.ADVENTURE_MINE_BUY_EMPLOY_EVENT"
AdventureEvent.ADVENTURE_MINE_BUY_COUNT_EVENT = "AdventureEvent.ADVENTURE_MINE_BUY_COUNT_EVENT"
AdventureEvent.ADVENTURE_MINE_STRIKE_BACK_EVENT = "AdventureEvent.ADVENTURE_MINE_STRIKE_BACK_EVENT"
AdventureEvent.ADVENTURE_MINE_RECORD_RED_POINT_EVENT = "AdventureEvent.ADVENTURE_MINE_RECORD_RED_POINT_EVENT"
AdventureEvent.ADVENTURE_MINE_FIGHT_EVENT = "AdventureEvent.ADVENTURE_MINE_FIGHT_EVENT"
AdventureEvent.ADVENTURE_MINE_CHALLEAGE_RED_POINT_EVENT = "AdventureEvent.ADVENTURE_MINE_CHALLEAGE_RED_POINT_EVENT"
AdventureEvent.ADVENTURE_MINE_HALLOWS_LIST_EVENT = "AdventureEvent.ADVENTURE_MINE_HALLOWS_LIST_EVENT"
AdventureEvent.ADVENTURE_MINE_LOGIN_RED_POINT_EVENT = "AdventureEvent.ADVENTURE_MINE_LOGIN_RED_POINT_EVENT"
AdventureEvent.BackPackType = {
	NextFloor = 2,
	BackPackView = 1
}
AdventureEvent.EventType = {
	npc_talk = 13,
	freebox = 12,
	buff = 1,
	boss = 2,
	next = 9,
	mysterious = 15,
	mon1 = 17,
	mon3 = 19,
	skill = 20,
	box = 4,
	answer = 7,
	effect = 10,
	init = 16,
	npc = 6,
	block = 11,
	finger_guessing = 3,
	shop = 14,
	mon = 5,
	null = 0,
	mon2 = 18
}

function AdventureEvent.isMonster(slot0)
	return slot0 == AdventureEvent.EventType.boss or slot0 == AdventureEvent.EventType.mon or slot0 == AdventureEvent.EventType.mon1 or slot0 == AdventureEvent.EventType.mon2 or slot0 == AdventureEvent.EventType.mon3
end

AdventureEvenHandleType = {
	handle = 1,
	hook = 3,
	refresh = 2,
	requst = 0
}
AdventurePluderRecordType = {
	defence = 1,
	act = 2
}
AdventureResetType = {
	reset = 1,
	next = 2
}
AdventureViewType = {
	myself = 1,
	other = 2
}
AdventureConst = AdventureConst or {}
AdventureConst.status = {
	open = 2,
	can_open = 1,
	lock = 0,
	over = 3
}
