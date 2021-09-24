package com.dumveloper.damo.diary.dao;

import java.util.ArrayList;

import com.dumveloper.damo.dto.DamoDTO;

public interface StatisticsDAO {

	ArrayList<DamoDTO> myChart(String u_id, String dateData);

}
