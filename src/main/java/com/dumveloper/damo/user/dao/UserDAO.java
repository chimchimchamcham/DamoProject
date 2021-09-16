package com.dumveloper.damo.user.dao;

import com.dumveloper.damo.dto.DamoDTO;

public interface UserDAO {

	int login(String id, String pw);

	int join(DamoDTO dto);
	//중복체크
	int checkdbId(String matchid);
	int checkdbnink(String matchnick);
	int checkdbemail(String email);
	//세션
	String dbfilename(String id);
	String dbninkname(String id);
	String dbmanager(String id);

	

}
