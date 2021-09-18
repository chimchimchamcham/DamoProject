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
	private String u_gender; //성별
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
	
	//일기
	private int d_no; //일기 번호
	private String d_id; //일기 작성 아이디
	private String d_date; //일기 작성 날짜
	private String d_memo; //일기 메모
	private int d_weight; //몸무게
	private int d_carbo; //권장 탄수화물량
	private int d_protein; //권장 단백질량
	private int d_fat; //권장 지방량
	private int d_resultEat; //섭취칼로리 합계
	private int d_resultExe; //운동칼로리 합계
	private int d_resultCarbo; //섭취 탄수화물 합계
	private int d_resultProtein; //섭취 답백질 합계
	private int d_resultFat; //섭취 지방 합계
	private int d_tarKcal; //목표섭취 칼로리
	private int d_tarExe; //목표 운동 칼로리
	private boolean d_success; //성공 여부
	private String d_code; //분류 코드
	
	
	//지식fit
	private int k_no; //글번호
	//private String u_id; //작성 아이디
	private String k_code; //분류코드
	private String k_name; //분류코드명
	private String k_title; //글제목
	private String k_content; //글내묭
	private Date k_date; //작성일
	private int k_view; //조회수
	private int k_replyCnt; //답변수
	private String k_solutionYN; //해결여부
	private String k_blindYN; //블라인드 여부
	
	//지식핏 이미지
	private int ki_no;
	private String ki_name;
	private String ki_imgYN;
	public int getKi_no() {
		return ki_no;
	}
	public void setKi_no(int ki_no) {
		this.ki_no = ki_no;
	}
	public String getKi_name() {
		return ki_name;
	}
	public void setKi_name(String ki_name) {
		this.ki_name = ki_name;
	}
	public String getKi_imgYN() {
		return ki_imgYN;
	}
	public void setKi_imgYN(String ki_imgYN) {
		this.ki_imgYN = ki_imgYN;
	}
	public String getKi_knowYN() {
		return ki_knowYN;
	}
	public void setKi_knowYN(String ki_knowYN) {
		this.ki_knowYN = ki_knowYN;
	}
	private String ki_knowYN;
	
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
	public String getU_gender() {
		return u_gender;
	}
	public void setU_gender(String u_gender) {
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
	public int getK_no() {
		return k_no;
	}
	public void setK_no(int k_no) {
		this.k_no = k_no;
	}
	public String getK_code() {
		return k_code;
	}
	public void setK_code(String k_code) {
		this.k_code = k_code;
	}
	public String getK_name() {
		return k_name;
	}
	public void setK_name(String k_name) {
		this.k_name = k_name;
	}
	public String getK_title() {
		return k_title;
	}
	public void setK_title(String k_title) {
		this.k_title = k_title;
	}
	public String getK_content() {
		return k_content;
	}
	public void setK_content(String k_content) {
		this.k_content = k_content;
	}
	public Date getK_date() {
		return k_date;
	}
	public void setK_date(Date k_date) {
		this.k_date = k_date;
	}
	public int getK_view() {
		return k_view;
	}
	public void setK_view(int k_view) {
		this.k_view = k_view;
	}
	public int getK_replyCnt() {
		return k_replyCnt;
	}
	public void setK_replyCnt(int k_replyCnt) {
		this.k_replyCnt = k_replyCnt;
	}
	public String getK_solutionYN() {
		return k_solutionYN;
	}
	public void setK_solutionYN(String k_solutionYN) {
		this.k_solutionYN = k_solutionYN;
	}
	public String getK_blindYN() {
		return k_blindYN;
	}
	public void setK_blindYN(String k_blindYN) {
		this.k_blindYN = k_blindYN;
	}
	public int getD_no() {
		return d_no;
	}
	public void setD_no(int d_no) {
		this.d_no = d_no;
	}
	public String getD_id() {
		return d_id;
	}
	public void setD_id(String d_id) {
		this.d_id = d_id;
	}
	public String getD_date() {
		return d_date;
	}
	public void setD_date(String d_date) {
		this.d_date = d_date;
	}
	public String getD_memo() {
		return d_memo;
	}
	public void setD_memo(String d_memo) {
		this.d_memo = d_memo;
	}
	public int getD_weight() {
		return d_weight;
	}
	public void setD_weight(int d_weight) {
		this.d_weight = d_weight;
	}
	public int getD_carbo() {
		return d_carbo;
	}
	public void setD_carbo(int d_carbo) {
		this.d_carbo = d_carbo;
	}
	public int getD_protein() {
		return d_protein;
	}
	public void setD_protein(int d_protein) {
		this.d_protein = d_protein;
	}
	public int getD_fat() {
		return d_fat;
	}
	public void setD_fat(int d_fat) {
		this.d_fat = d_fat;
	}
	public int getD_resultEat() {
		return d_resultEat;
	}
	public void setD_resultEat(int d_resultEat) {
		this.d_resultEat = d_resultEat;
	}
	public int getD_resultExe() {
		return d_resultExe;
	}
	public void setD_resultExe(int d_resultExe) {
		this.d_resultExe = d_resultExe;
	}
	public int getD_resultCarbo() {
		return d_resultCarbo;
	}
	public void setD_resultCarbo(int d_resultCarbo) {
		this.d_resultCarbo = d_resultCarbo;
	}
	public int getD_resultProtein() {
		return d_resultProtein;
	}
	public void setD_resultProtein(int d_resultProtein) {
		this.d_resultProtein = d_resultProtein;
	}
	public int getD_resultFat() {
		return d_resultFat;
	}
	public void setD_resultFat(int d_resultFat) {
		this.d_resultFat = d_resultFat;
	}
	public int getD_tarKcal() {
		return d_tarKcal;
	}
	public void setD_tarKcal(int d_tarKcal) {
		this.d_tarKcal = d_tarKcal;
	}
	public int getD_tarExe() {
		return d_tarExe;
	}
	public void setD_tarExe(int d_tarExe) {
		this.d_tarExe = d_tarExe;
	}
	public boolean isD_success() {
		return d_success;
	}
	public void setD_success(boolean d_success) {
		this.d_success = d_success;
	}
	public String getD_code() {
		return d_code;
	}
	public void setD_code(String d_code) {
		this.d_code = d_code;
	}
	
}
