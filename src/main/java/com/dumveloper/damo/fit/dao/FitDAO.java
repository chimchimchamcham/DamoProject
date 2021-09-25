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

	int myRanking(String id);

	void upView(String k_no);

	DamoDTO fitDetail(String k_no);

	ArrayList<DamoDTO> fitImgLinkList(String k_no, String string);

	ArrayList<DamoDTO> fitAnsDetail(String k_no);

	void fitDelete(String k_no);

	int fitAnsWrite(DamoDTO dto);

	void upRpl(String k_no);

	void fitAnsDel(String kr_no);

	void downRpl(String k_no);

	String chkChoosed(String kr_no);

	int knowfitRUpdate(DamoDTO dto);

	String chkChoose(String k_no);

	void chooseFitAns(String kr_no);

	void upFitAns(String k_no);

	DamoDTO chkDir(String k_no, String u_id);

	int delDir(String k_no, String u_id);

	int addDir(String k_no, String u_id);


	//검색시 필요
	ArrayList<DamoDTO> serchtitle(String content);
	ArrayList<DamoDTO> serchcontent(String content);

	int fitNotify(DamoDTO dto);


}
