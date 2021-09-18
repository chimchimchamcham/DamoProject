package com.dumveloper.damo.fit.dao;

import java.util.ArrayList;

import com.dumveloper.damo.dto.DamoDTO;

public interface FitDAO {

	ArrayList<DamoDTO> bestFitList();

	ArrayList<DamoDTO> newFitList(int start, int end, String category);

	int upload(int ki_no, String ki_name, String ki_imgyn, String ki_knowyn);

	int fitWrite(DamoDTO dto);

}
