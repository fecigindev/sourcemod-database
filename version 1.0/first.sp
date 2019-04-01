#include <sourcemod>
#include <sdktools>

public Plugin myinfo = 
{
	name = "my first plugin",
	author = "neo",
	description = "message",
	version = "1.0",
	url = "http://www.sourcemod.net/"
};

Database Connect()
{
	char error[255];
	Database db;
	
	if (SQL_CheckConfig("default"))
	{
		db = SQL_Connect("default", true, error, sizeof(error));
	} else {
		db = SQL_Connect("default", true, error, sizeof(error));
	}
	
	if (db == null)
	{
		LogError("Could not connect to database: %s", error);
		PrintToChat(true, "Could not connect to database: %s", error);
	}
	
	return db;
}

public void OnPluginStart() 
{
	PrintToServer("Hello my name is neo");
	RegConsoleCmd("sm_banana", banana);
}

public Action banana(client, args)
{
	Database db = Connect();

	if (!SQL_FastQuery(db, "CREATE TABLE `sourcemod`.`player` ( `id` INT NULL , `player` VARCHAR(120) NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;"))
	{
		char error[255];
		SQL_GetError(db, error, sizeof(error));
		PrintToServer("Failed to query (error: %s)", error);
		PrintToChat(true, "Failed to query (error: %s)", error);
	}
	else
	{
		PrintToChat(true, "got connection database");
	}
	PrintToChat(true, "hello there");
}
