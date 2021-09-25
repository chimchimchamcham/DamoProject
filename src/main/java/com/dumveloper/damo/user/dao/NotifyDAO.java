package com.dumveloper.damo.user.dao;

import com.dumveloper.damo.dto.DamoDTO;

public interface NotifyDAO {

	void updatenotify(int notifynum);

	int userNotify(DamoDTO dto);

}
