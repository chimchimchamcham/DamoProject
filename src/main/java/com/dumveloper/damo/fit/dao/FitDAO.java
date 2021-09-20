package com.dumveloper.damo.fit.dao;

import java.util.ArrayList;

import com.dumveloper.damo.dto.DamoDTO;

public interface FitDAO {

	ArrayList<DamoDTO> bestFitList();

	ArrayList<DamoDTO> newFitList(int start, int end, String category);

	int upload(int ki_no, String ki_name, String ki_imgyn, String ki_knowyn);

	int fitWrite(DamoDTO dto);

	DamoDTO fitUpdateForm(String k_no);

	ArrayList<String> fitImgList(String k_no, String ki_imgYN, String ki_knowYN);

	int knowfitUpdate(DamoDTO dto);

	int knowfitImgInsert(String k_no, String url, String ki_imgYN, String ki_knowYN);

	int knowfitimgUpdate(String k_no, String url, String ki_imgYN, String ki_knowYN);

	int knowfitImgDelete(String k_no, String photo, String ki_imgYN, String ki_knowYN);

	int knowfitUrlDelete(String k_no, String ki_imgYN, String ki_knowYN);

	ArrayList<DamoDTO> fitRanking();

}
