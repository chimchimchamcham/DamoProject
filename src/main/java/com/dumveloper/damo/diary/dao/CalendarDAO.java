package com.dumveloper.damo.diary.dao;

import java.util.ArrayList;

import com.dumveloper.damo.dto.DamoDTO;

public interface CalendarDAO {

	ArrayList<DamoDTO> list(String id);

	DamoDTO getMonthData(String id, String formattedDate);

	DamoDTO getWeight(String id);
}
