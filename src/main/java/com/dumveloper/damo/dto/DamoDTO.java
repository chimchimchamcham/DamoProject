package com.dumveloper.damo.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("damo")
public class DamoDTO {
	//회원정보
	private String u_id; //아이디
	private String u_pw; //비밀번호
	private String u_name; //이름
	private String u_email; //이메일
	private String u_nick; //닉네임
	private int u_age; //나이
	private int u_weight; //몸무게
	private int u_tarWeight; //목표 몸무게
	private int u_height; //키
	private boolean u_gender; //성별
	private boolean u_alarmYN; //알람여부
	private String u_intro; //자기소개
	private boolean u_adminYN; //관리자 여부
	private Date u_joinTm; //가입날짜
	private String u_fileName; //프로필 사진명
	private boolean u_blindYN; //탈퇴여부
	private int u_chooseCnt; //채택 수
	private String g_code; //등급 분류 코드
	
	//캘린더
	private String c_id; //캘린더 사용자 아이디
	private Date c_date; //등록날짜
	private String c_content; //목표내용
	private int c_tarKcal; //목표 섭취 칼로리
	private int c_tarExe; //목표 운동 칼로리
	
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_pw() {
		return u_pw;
	}
	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public String getU_nick() {
		return u_nick;
	}
	public void setU_nick(String u_nick) {
		this.u_nick = u_nick;
	}
	public int getU_age() {
		return u_age;
	}
	public void setU_age(int u_age) {
		this.u_age = u_age;
	}
	public int getU_weight() {
		return u_weight;
	}
	public void setU_weight(int u_weight) {
		this.u_weight = u_weight;
	}
	public int getU_tarWeight() {
		return u_tarWeight;
	}
	public void setU_tarWeight(int u_tarWeight) {
		this.u_tarWeight = u_tarWeight;
	}
	public int getU_height() {
		return u_height;
	}
	public void setU_height(int u_height) {
		this.u_height = u_height;
	}
	public boolean isU_gender() {
		return u_gender;
	}
	public void setU_gender(boolean u_gender) {
		this.u_gender = u_gender;
	}
	public boolean isU_alarmYN() {
		return u_alarmYN;
	}
	public void setU_alarmYN(boolean u_alarmYN) {
		this.u_alarmYN = u_alarmYN;
	}
	public String getU_intro() {
		return u_intro;
	}
	public void setU_intro(String u_intro) {
		this.u_intro = u_intro;
	}
	public boolean isU_adminYN() {
		return u_adminYN;
	}
	public void setU_adminYN(boolean u_adminYN) {
		this.u_adminYN = u_adminYN;
	}
	public Date getU_joinTm() {
		return u_joinTm;
	}
	public void setU_joinTm(Date u_joinTm) {
		this.u_joinTm = u_joinTm;
	}
	public String getU_fileName() {
		return u_fileName;
	}
	public void setU_fileName(String u_fileName) {
		this.u_fileName = u_fileName;
	}
	public boolean isU_blindYN() {
		return u_blindYN;
	}
	public void setU_blindYN(boolean u_blindYN) {
		this.u_blindYN = u_blindYN;
	}
	public int getU_chooseCnt() {
		return u_chooseCnt;
	}
	public void setU_chooseCnt(int u_chooseCnt) {
		this.u_chooseCnt = u_chooseCnt;
	}
	public String getG_code() {
		return g_code;
	}
	public void setG_code(String g_code) {
		this.g_code = g_code;
	}
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public Date getC_date() {
		return c_date;
	}
	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public int getC_tarKcal() {
		return c_tarKcal;
	}
	public void setC_tarKcal(int c_tarKcal) {
		this.c_tarKcal = c_tarKcal;
	}
	public int getC_tarExe() {
		return c_tarExe;
	}
	public void setC_tarExe(int c_tarExe) {
		this.c_tarExe = c_tarExe;
	}


	
	
	
	
	
	
	
}
