package com.dumveloper.damo.user.dao;

import com.dumveloper.damo.dto.DamoDTO;

public interface UserDAO {

	int login(String id, String pw);

	int join(DamoDTO dto);

	int checkId(String matchid);

}
