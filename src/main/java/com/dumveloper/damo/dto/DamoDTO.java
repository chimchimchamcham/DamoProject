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
	
	
	private int anscnt; //답변수 cnt (명예의 전당,마이페이지에서 사용)
	private int fitcnt; //질문수 cnt (마이페이지에서 사용)
	private int choosePct; //채택률 (마이페이지에서 사용)
	private int ranking; //순위 (마이페이지에서 사용)
	

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
	
	private char d_successUpdate; //성공 여부(업데이트용)
	
	private int d_dateDay; //작성 날짜에서 일을 추출
	
	//체크리스트
	private int ch_no; //체크리스트 고유 번호
	private int cd_no; //체크리스트 글 번호
	private String cd_content; //체크리스트 내용
	private String cd_checkYN; //체크 여부
	
	
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
	
	
	//신고
	private int n_no;
	private String n_receiveid;
	private String n_sendid;
	private String n_content;
	private Date n_dt;
	private int n_notifiedno;
	private String n1_code;
	private String n2_code;
	
	
	//신고 히스토리
	private int hn_no;
	private Date hn_date;
	private String hn_adminid;
	private String hn_code;
	

	//신고대분류코드

	private String n1_name;
	
	//신고중분류코드

	private String n2_name;
	
	//코드
	private String c_code;
	private String c_name;
	
	
	//블랙리스트
	private int b_no;
	private String b_code;
	private Date b_startdt;
	private Date b_enddt;
	private String b_content;
	private String b_adminid;
	
	//회원등급
	//private String g_code;//등급분류코드
	private String g_name;//등급분류명
	private String g_fileName;//사진파일명
	private int g_standard;//등급기준
	
	//지식fit 답변
	private String kR_no;//답변번호
	//private int k_no; //지식fit 번호
	//private String u_id; //회원 id
	private String kR_chooseYN;//채낵여부
	private Date kR_date;//작성일
	private String kR_content;//내용
	private String kR_blindYN;//블라인드 여부
	
	//음식항목
	private String food_name;
	private int food_weight;
	private int food_calorie;
	private int food_carbo;
	private int food_protein;
	private int food_fat;
	
	//met
	private String met_name;
	private int met;
	
	//섭취 히스토리
	private String hd_no; //일기 고유번호
	private String hd_code; //일기 분류코드
	private int hd_eat; //섭취량
	private String hd_foodName; //음식 이름
	private int hd_carbo; //탄수화물량
	private int hd_protein; //단백질량
	private int hd_fat; //지방량
	private int hd_kcal; //열량
	
	//운동 히스토리
	private String he_no; //일기 고유번호 
	private int he_time; //운동 시간
	private int he_kcal; //운동 소모 칼로리
	
	//내 사전
	private Date m_date;//등록날짜
	
	//알람
	private int a_no;//알람 번호
	private String a_code; //알람 코드 분류
	private String a_sendId; //알람 보낸 아이디
	private String a_content; //알람 내용
	private Date a_date;//알람 보낸 날짜
	private String a_readYN;//알람 읽음 여부
	private String a_path;//알람 경로
	private String a_impoYN;//중요 여부
	
	public Date getM_date() {
		return m_date;
	}
	public void setM_date(Date m_date) {
		this.m_date = m_date;
	}
	public int getA_no() {
		return a_no;
	}
	public void setA_no(int a_no) {
		this.a_no = a_no;
	}
	public String getA_code() {
		return a_code;
	}
	public void setA_code(String a_code) {
		this.a_code = a_code;
	}
	public String getA_sendId() {
		return a_sendId;
	}
	public void setA_sendId(String a_sendId) {
		this.a_sendId = a_sendId;
	}
	public String getA_content() {
		return a_content;
	}
	public void setA_content(String a_content) {
		this.a_content = a_content;
	}
	public Date getA_date() {
		return a_date;
	}
	public void setA_date(Date a_date) {
		this.a_date = a_date;
	}
	public String getA_readYN() {
		return a_readYN;
	}
	public void setA_readYN(String a_readYN) {
		this.a_readYN = a_readYN;
	}
	public String getA_path() {
		return a_path;
	}
	public void setA_path(String a_path) {
		this.a_path = a_path;
	}
	public String getA_impoYN() {
		return a_impoYN;
	}
	public void setA_impoYN(String a_impoYN) {
		this.a_impoYN = a_impoYN;
	}
	public int getFitcnt() {
		return fitcnt;
	}
	public void setFitcnt(int fitcnt) {
		this.fitcnt = fitcnt;
	}
	public int getChoosePct() {
		return choosePct;
	}
	public void setChoosePct(int choosepct) {
		this.choosePct = choosepct;
	}
	public int getRanking() {
		return ranking;
	}
	public void setRanking(int ranking) {
		this.ranking = ranking;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getB_code() {
		return b_code;
	}
	public void setB_code(String b_code) {
		this.b_code = b_code;
	}
	public Date getB_startdt() {
		return b_startdt;
	}
	public void setB_startdt(Date b_startdt) {
		this.b_startdt = b_startdt;
	}
	public Date getB_enddt() {
		return b_enddt;
	}
	public void setB_enddt(Date b_enddt) {
		this.b_enddt = b_enddt;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public String getB_adminid() {
		return b_adminid;
	}
	public void setB_adminid(String b_adminid) {
		this.b_adminid = b_adminid;
	}
	public String getC_code() {
		return c_code;
	}
	public void setC_code(String c_code) {
		this.c_code = c_code;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public int getN_no() {
		return n_no;
	}
	public void setN_no(int n_no) {
		this.n_no = n_no;
	}
	public String getN_receiveid() {
		return n_receiveid;
	}
	public void setN_receiveid(String n_receiveid) {
		this.n_receiveid = n_receiveid;
	}
	public String getN_sendid() {
		return n_sendid;
	}
	public void setN_sendid(String n_sendid) {
		this.n_sendid = n_sendid;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public Date getN_dt() {
		return n_dt;
	}
	public void setN_dt(Date n_dt) {
		this.n_dt = n_dt;
	}
	public int getN_notifiedno() {
		return n_notifiedno;
	}
	public void setN_notifiedno(int n_notifiedno) {
		this.n_notifiedno = n_notifiedno;
	}
	public String getN1_code() {
		return n1_code;
	}
	public void setN1_code(String n1_code) {
		this.n1_code = n1_code;
	}
	public String getN2_code() {
		return n2_code;
	}
	public void setN2_code(String n2_code) {
		this.n2_code = n2_code;
	}
	public int getHn_no() {
		return hn_no;
	}
	public void setHn_no(int hn_no) {
		this.hn_no = hn_no;
	}
	public Date getHn_date() {
		return hn_date;
	}
	public void setHn_date(Date hn_date) {
		this.hn_date = hn_date;
	}
	public String getHn_adminid() {
		return hn_adminid;
	}
	public void setHn_adminid(String hn_adminid) {
		this.hn_adminid = hn_adminid;
	}
	public String getHn_code() {
		return hn_code;
	}
	public void setHn_code(String hn_code) {
		this.hn_code = hn_code;
	}
	public String getN1_name() {
		return n1_name;
	}
	public void setN1_name(String n1_name) {
		this.n1_name = n1_name;
	}
	public String getN2_name() {
		return n2_name;
	}
	public void setN2_name(String n2_name) {
		this.n2_name = n2_name;
	}
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
	public String getG_name() {
		return g_name;
	}
	public void setG_name(String g_name) {
		this.g_name = g_name;
	}
	public String getG_fileName() {
		return g_fileName;
	}
	public void setG_fileName(String g_fileName) {
		this.g_fileName = g_fileName;
	}
	public int getG_standard() {
		return g_standard;
	}
	public void setG_standard(int g_standard) {
		this.g_standard = g_standard;
	}
	public int getAnscnt() {
		return anscnt;
	}
	public void setAnscnt(int anscnt) {
		this.anscnt = anscnt;
	}
	public String getkR_no() {
		return kR_no;
	}
	public void setkR_no(String kR_no) {
		this.kR_no = kR_no;
	}
	public String getkR_chooseYN() {
		return kR_chooseYN;
	}
	public void setkR_chooseYN(String kR_chooseYN) {
		this.kR_chooseYN = kR_chooseYN;
	}
	public Date getkR_date() {
		return kR_date;
	}
	public void setkR_date(Date kR_date) {
		this.kR_date = kR_date;
	}
	public String getkR_content() {
		return kR_content;
	}
	public void setkR_content(String kR_content) {
		this.kR_content = kR_content;
	}
	public String getkR_blindYN() {
		return kR_blindYN;
	}
	public void setkR_blindYN(String kR_blindYN) {
		this.kR_blindYN = kR_blindYN;
	}

	public String getFood_name() {
		return food_name;
	}
	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}
	public int getFood_weight() {
		return food_weight;
	}
	public void setFood_weight(int food_weight) {
		this.food_weight = food_weight;
	}
	public int getFood_calorie() {
		return food_calorie;
	}
	public void setFood_calorie(int food_calorie) {
		this.food_calorie = food_calorie;
	}
	public int getFood_carbo() {
		return food_carbo;
	}
	public void setFood_carbo(int food_carbo) {
		this.food_carbo = food_carbo;
	}
	public int getFood_protein() {
		return food_protein;
	}
	public void setFood_protein(int food_protein) {
		this.food_protein = food_protein;
	}
	public int getFood_fat() {
		return food_fat;
	}
	public void setFood_fat(int food_fat) {
		this.food_fat = food_fat;
	}
	public String getMet_name() {
		return met_name;
	}
	public void setMet_name(String met_name) {
		this.met_name = met_name;
	}
	public int getMet() {
		return met;
	}
	public void setMet(int met) {
		this.met = met;
	}
	public int getCh_no() {
		return ch_no;
	}
	public void setCh_no(int ch_no) {
		this.ch_no = ch_no;
	}
	public String getCd_content() {
		return cd_content;
	}
	public void setCd_content(String cd_content) {
		this.cd_content = cd_content;
	}
	public String getCd_checkYN() {
		return cd_checkYN;
	}
	public void setCd_checkYN(String cd_checkYN) {
		this.cd_checkYN = cd_checkYN;
	}
	public int getCd_no() {
		return cd_no;
	}
	public void setCd_no(int cd_no) {
		this.cd_no = cd_no;
	}
	public String getHd_no() {
		return hd_no;
	}
	public void setHd_no(String hd_no) {
		this.hd_no = hd_no;
	}
	public String getHd_code() {
		return hd_code;
	}
	public void setHd_code(String hd_code) {
		this.hd_code = hd_code;
	}
	public int getHd_eat() {
		return hd_eat;
	}
	public void setHd_eat(int hd_eat) {
		this.hd_eat = hd_eat;
	}
	public String getHd_foodName() {
		return hd_foodName;
	}
	public void setHd_foodName(String hd_foodName) {
		this.hd_foodName = hd_foodName;
	}
	public int getHd_carbo() {
		return hd_carbo;
	}
	public void setHd_carbo(int hd_carbo) {
		this.hd_carbo = hd_carbo;
	}
	public int getHd_protein() {
		return hd_protein;
	}
	public void setHd_protein(int hd_protein) {
		this.hd_protein = hd_protein;
	}
	public int getHd_fat() {
		return hd_fat;
	}
	public void setHd_fat(int hd_fat) {
		this.hd_fat = hd_fat;
	}
	public int getHd_kcal() {
		return hd_kcal;
	}
	public void setHd_kcal(int hd_kcal) {
		this.hd_kcal = hd_kcal;
	}
	public String getHe_no() {
		return he_no;
	}
	public void setHe_no(String he_no) {
		this.he_no = he_no;
	}
	public int getHe_time() {
		return he_time;
	}
	public void setHe_time(int he_time) {
		this.he_time = he_time;
	}
	public int getHe_kcal() {
		return he_kcal;
	}
	public void setHe_kcal(int he_kcal) {
		this.he_kcal = he_kcal;
	}
	public char getD_successUpdate() {
		return d_successUpdate;
	}
	public void setD_successUpdate(char c) {
		this.d_successUpdate = c;
	}
	public int getD_dateDay() {
		return d_dateDay;
	}
	public void setD_dateDay(int d_dateDay) {
		this.d_dateDay = d_dateDay;
	}

}
