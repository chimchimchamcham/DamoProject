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
	
	int update(DamoDTO dto);
	int join(DamoDTO dto);
	//중복체크
	int checkdbId(String matchid);
	int checkdbnink(String matchnick);
	int checkdbemail(String email);
	
	//세션
	String dbfilename(String id);
	String dbninkname(String id);
	String dbmanager(String id);
	
	//관리자 
	//회원 목록
	ArrayList<DamoDTO> dbuser();
	ArrayList<DamoDTO> dbnotify();
	ArrayList<DamoDTO> dbblack();
	

	
	
	
	


	



	

}
