//--------------------------------
// Скрипт Администрация онлайн для SA-MP
// Skype: dev.oleg
// Версия от 14.09.15
//--------------------------------
#include <a_samp>

public OnPlayerCommandText(playerid, cmdtext[])
{
	if(strcmp("/admins", cmdtext, true, 10) == 0)
	{
	    new string[256];
//	    if(PlayerInfo[playerid][pVip] == 0 && !IsPlayerAdmin(playerid)) return SendClientMesage(playerid,-1,"У вас нет прав на использование данной команды.");
	    new wat = 0;
	    new sendername[24];
		SendClientMessage(playerid,0xFFFF00FF,"Администрация в сети:");
		for(new i = 0; i < MAX_PLAYERS; i++)//Цикл для всех игроков
        {
			if(IsPlayerConnected(i) && IsPlayerAdmin(i))//Поставьте свое условие
			{
			    GetPlayerName(i,sendername,sizeof(sendername));
				wat++;
				format(string, sizeof(string), "%d. {FFC000}%s | ID: %d",wat, sendername, i);
				SendClientMessage(playerid, 0xFF0000FF, string);
			}
		}
		if(wat == 0)
		{
		    SendClientMessage(playerid, -1, " Администрации нету в сети.");
		    return 1;
		}
		format(string, sizeof(string), " Администраторов в сети: {00FF00}%d", wat);
		SendClientMessage(playerid, -1, string);
		return 1;
	}
	return 1;
}
