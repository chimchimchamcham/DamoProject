package com.dumveloper.damo.user.dao;

import java.util.ArrayList;
import java.util.HashMap;
import com.dumveloper.damo.dto.DamoDTO;
public interface UserDAO {

	int login(String id, String pw);
	HashMap<Object, String> dbblacklist(String id);
	String iddbfind(String name, String email);
	int pwdbfind(String id, String name, String email, String pw);
	DamoDTO userinfo(String id);
	//프사 바꾸기
	void dbphotoname(String id, String newFileName);
	//알람여부 바꾸기
	void dbalarmupdate(String yn, String id);
	
	//신고 상태 바꾸기
	void dbchangenotifystate(int notifyval, String state);
	
	
	int update(DamoDTO dto);
	int join(DamoDTO dto);
	
	//중복체크
	int checkdbId(String matchid);
	int checkdbnink(String matchnick);
	int checkdbemail(String email);
	int nink_me_and_aother_check(String mynick);
	
	//세션
	String dbfilename(String id);
	String dbninkname(String id);
	String dbmanager(String id);
	
	//관리자 
	//회원 목록
	ArrayList<DamoDTO> dbuser(int start, int end);
	ArrayList<DamoDTO> dbnotify(int start, int end);
	ArrayList<DamoDTO> dbblack(int start, int end);
	int userallCount();
	int notifyallCount();
	int blackallCount();

	
	//팝업
	ArrayList<DamoDTO> dbnotifyinfo(int notify_no);
	ArrayList<DamoDTO> dbblackinfo(int black_no);
	
	//마이페이지 관련
	DamoDTO myPageUserInfo(String u_id);
	ArrayList<DamoDTO> myFitList(String u_id);
	ArrayList<DamoDTO> myAnsList(String u_id);
	ArrayList<DamoDTO> myDirList(String u_id);
	
	//알람 관련
	DamoDTO alarmList(String loginId); //알람 리스트 뽑아오기
	
	
	

	
	
	
	


	



	

}
