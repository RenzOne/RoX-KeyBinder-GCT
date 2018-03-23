#Persistent
#SingleInstance force
#include sqlite3.ahk
#include Funcs.ahk
global projectName := "RoX"
global DB_NAME := projectName ".db"
global DB := new SQLiteDB
if(!FileExist(DB_NAME))
{
	DB.OpenDB(DB_NAME)
	DB.Exec("CREATE TABLE IF NOT EXISTS spieler_table (id int,name varchar(50), level int, geld int, kills int,tode int, gruppe int, PRIMARY KEY(id));")	
	DB.CloseDB()
}

Settimer, SpielerTimer, on
Settimer, InternerTimer, on

return 


PlayerTimer:
;---- Rob/Kill/Tod Counter etc... Diverse Spieler Funktionen
return

InternerTimer:

;----  Overlay 	Sektion

;----  Text 	Sektion

;----  Fahrzeug Seltion

return
