package com.dumveloper.damo.user.dao;

import java.sql.Date;

public interface BlackListDAO {

	void dbregister(String resivedid, String adminid, Date endtime, String scope, String content);

	int checkrecbid(String resivedid);
	
}
