
DBInsert(_TABLE,colarray,valuearray)
{
	if !isObject(colarray) || !IsObject(valuearray) || !_TABLE
		return -1
	if colarray.MaxIndex() != valuearray.MaxIndex()
		return -2
	cval:=0,ccol:=0,tmpcols:="",tmpvals:=""
	for i, col in colarray
		tmpcols .= col "" ((i == colarray.MaxIndex()) ? ("") : (","))
	for i, val in valuearray
		tmpvals .= "'" val "'" ((i == valuearray.MaxIndex()) ? ("") : (","))
	_r := DB.Exec(tmp_Query := "INSERT INTO " _TABLE "_table (" tmpcols ") VALUES (" tmpvals ");")
	return ((_r) ? (True) : (False))
}

DBUpdate(_TABLE, playername, colarray, valuearray)
{
	if !isObject(colarray) || !IsObject(valuearray) || !_TABLE
		return -1
	if colarray.MaxIndex() != valuearray.MaxIndex()
		return -2
	tmpvals:=""
	for i, col in colarray
		tmpvals .= col " = '" valuearray[i] "'" ((i == colarray.MaxIndex()) ? ("") : (","))
	_r := DB.Exec(tmp_Query := "UPDATE " _TABLE "_table SET " tmpvals " WHERE name = '" playername "';")
	return ((_r) ? (True) : (False))
}

DBGetValue(_TABLE, playername, columnArray)
{
	global DB
	if(columnArray.MaxIndex() >= 1){
		resp := {}
		for i, col in columnArray {
			DB.Query("SELECT " col " FROM " _TABLE "_table WHERE name='" playername "';", RS)
			if RS.HasRows {
				if RS.Next(_r)
					resp[col] := _r[1]
			}
		}
		return resp
	}
}
