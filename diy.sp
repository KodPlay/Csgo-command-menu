#include <sourcemod>
#include <cstrike>
#include <sdktools>
#include <clientprefs>

#pragma semicolon 1

public Plugin:myinfo =
{
	name = "diy menu",
	author = "Max1mus & F0rest",
	description = "",
	version = "2.0",
	url = "www.max1.top & kodplay.com",
}

public void OnPluginStart()
{
	RegConsoleCmd("sm_plus", command_plus,"Plus特权");
	RegConsoleCmd("sm_kod", command_diymenu,"聚合菜单");
	RegConsoleCmd("sm_kb", command_f,"K币系统");
	RegConsoleCmd("buyammo1", command_diymenu);
	RegConsoleCmd("buyammo2", OnCallStore);
}

public Action OnCallStore(int client,int args)
{
	ClientCommand(client, "sm_store");
	return Plugin_Handled;
}

public Action:command_plus(client ,args )
{
	new Handle:menu = CreateMenu(plusHandler);
	SetMenuTitle(menu, "KOD通行证特权");
	AddMenuItem(menu, "1", "贴纸");
	AddMenuItem(menu, "2", "探员");
	AddMenuItem(menu, "3", "音乐盒");
	AddMenuItem(menu, "4", "特殊检视");
	AddMenuItem(menu, "5", "称号头衔");
	AddMenuItem(menu, "6", "名字颜色");
	AddMenuItem(menu, "7", "聊天颜色");
	AddMenuItem(menu, "8", "投票踢人");
	AddMenuItem(menu, "9", "积分商店");
	AddMenuItem(menu, "10", "死亡音效");
	AddMenuItem(menu, "11", "MVP特效");
	AddMenuItem(menu, "12", "MVP音乐");
	SetMenuExitButton(menu, true);
	bool:DisplayMenu(menu,client,100);
}
public Action:command_diymenu(client , args)
{
	new Handle:menu = CreateMenu(diyHandler);
	SetMenuTitle(menu, "KOD社区聚合菜单");
	AddMenuItem(menu, "1", "皮肤");
	AddMenuItem(menu, "2", "刀具");
	AddMenuItem(menu, "3", "手套");
	AddMenuItem(menu, "4", "等级");
	AddMenuItem(menu, "5", "称号");
	AddMenuItem(menu, "6", "积分");
	SetMenuExitButton(menu, true);
	bool:DisplayMenu(menu,client,100);
}
public Action:command_f(client , args)
{
	new Handle:menu = CreateMenu(fHandler);
	SetMenuTitle(menu, "Kod社区积分系统");
	AddMenuItem(menu, "1", "积分商店");
	AddMenuItem(menu, "2", "会员特权");
	AddMenuItem(menu, "3", "完美兑换");
	SetMenuExitButton(menu, true);
	bool:DisplayMenu(menu,client,100);
}

public diyHandler(Handle:menu, MenuAction:action, client, position)
{
	if ( action == MenuAction_Select )   
	{
		decl String: Item[128];
		GetMenuItem(menu,position,Item,sizeof(Item));
		if(StrEqual(Item,"1"))
		{
			ClientCommand(client,"sm_ws");
		}
		else if(StrEqual(Item,"2"))
		{
			ClientCommand(client,"sm_knife");
		}
		else if(StrEqual(Item,"3"))
		{
			ClientCommand(client,"sm_glove");
		}
		else if(StrEqual(Item,"4"))
		{
			ClientCommand(client,"sm_lvl");
		}
		else if(StrEqual(Item,"5"))
		{
			ClientCommand(client,"sm_usetag");
		}
		else if(StrEqual(Item,"6"))
		{
			ClientCommand(client,"sm_kb");
		}
	}
}
public plusHandler(Handle:menu, MenuAction:action, client, position)
{
	if ( action == MenuAction_Select )   
	{
		decl String: Item[128];
		GetMenuItem(menu,position,Item,sizeof(Item));
		if(StrEqual(Item,"1"))
		{
			ClientCommand(client,"sm_stickers");
		}
		else if(StrEqual(Item,"2"))
		{
			ClientCommand(client,"sm_agents");
		}
		else if(StrEqual(Item,"3"))
		{
			ClientCommand(client,"sm_music");
		}
		else if(StrEqual(Item,"4"))
		{
			ClientCommand(client,"sm_inspect");
		}
		else if(StrEqual(Item,"5"))
		{
			ClientCommand(client,"sm_tag");
		}
		else if(StrEqual(Item,"6"))
		{
			ClientCommand(client,"sm_name");
		}
		else if(StrEqual(Item,"7"))
		{
			ClientCommand(client,"sm_message");
		}
		else if(StrEqual(Item,"8"))
		{
			ClientCommand(client,"sm_viphelp");
		}
		else if(StrEqual(Item,"9"))
		{
			ClientCommand(client,"sm_store");
		}
		else if(StrEqual(Item,"10"))
		{
			ClientCommand(client, "sm_ds");
		}
		else if(StrEqual(Item,"11"))
		{
			ClientCommand(client, "sm_mvpanel");
		}
				else if(StrEqual(Item,"12"))
		{
			ClientCommand(client, "sm_mvp");
		}
	}
}
public fHandler(Handle:menu, MenuAction:action, client, position)
{
	if ( action == MenuAction_Select )   
	{
		decl String: Item[128];
		GetMenuItem(menu,position,Item,sizeof(Item));
		if(StrEqual(Item,"1"))
		{
			ClientCommand(client,"sm_store");
		}
		else if(StrEqual(Item,"2"))
		{
			ClientCommand(client,"sm_plus");
		}
		else if(StrEqual(Item,"3"))
		{
			ClientCommand(client,"sm_pw_store_credits");
		}
	}
}
