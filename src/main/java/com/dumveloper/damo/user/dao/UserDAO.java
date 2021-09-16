package com.dumveloper.damo.user.dao;

import com.dumveloper.damo.dto.DamoDTO;

public interface UserDAO {

	int login(String id, String pw);

	int join(DamoDTO dto);

	int checkdbId(String matchid);

	int checkdbnink(String matchnick);

	String dbfilename(String id);

	String dbninkname(String id);

}
