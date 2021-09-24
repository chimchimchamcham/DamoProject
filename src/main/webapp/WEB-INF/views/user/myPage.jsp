<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
    <div class="container mt-4">
        <div class="row">
            <div id="userInfo" class="col-md-4 bg-white shadow">
                <!-- 상단 회원정보 -->
                <div id="profileTop">
                	<c:if test="${dto.u_fileName eq 'default-profile.png' }">
                		<img id="profileTopImg" class="rounded-circle" src="resources/img/${dto.u_fileName }">
                	</c:if>
                	<c:if test="${dto.u_fileName ne 'default-profile.png' }">
                		<img id="profileTopImg" class="rounded-circle" src="/photo/${dto.u_fileName }">
                	</c:if>
                    <div id="profileTopNick">${dto.u_nick }</div>
                    <c:if test="${sessionScope.loginId eq dto.u_id }">
                    	<button id="userInfoUpdateBtn" type="button" class="btn btn-secondary btn-sm">수정</button>
                    </c:if>
                    <img id="profileTopGradeImg" src="resources/img/${dto.g_fileName}.png" class="rounded-circle">
                    <div id="profileTopRanking"><span>${dto.ranking }</span><span>위</span></div>
                </div>

                <!-- 자기소개글 -->
                <div id="profileTopIntro" class="m-3 text-secondary">
                	${dto.u_intro }
                </div>

                <!-- 테이블 프로필 -->
                <div id="profileTable">
                	<c:if test="${sessionScope.loginId eq dto.u_id }">
                    <table>
                        <tr>
                            <th>이름</th><td>${dto.u_name }</td>
                        </tr>
                        <tr>
                            <th>아이디</th><td>${dto.u_id }</td>
                        </tr>
                        <tr>
                            <th>이메일</th><td>${dto.u_email }</td>
                        </tr>
                        <tr>
                            <th>나이</th><td><span>${dto.u_age }</span><span>세</span></td>
                        </tr>
                        <tr>
                            <th>키</th><td><span>${dto.u_height }</span><span>cm</span></td>
                        </tr>
                        <tr>
                            <th>몸무게</th><td><span>${dto.u_weight }</span><span>kg</span></td>
                        </tr>
                        <tr>
                            <th>목표 몸무게</th><td><span>${dto.u_tarWeight }</span><span>kg</span></td>
                        </tr>
                    </table>
                    </c:if>
                </div>

                <!-- 회원탈퇴 -->
                <c:if test="${sessionScope.loginId eq dto.u_id }">
                	<div class="mt-3"><a href="#" id="userBlind" class="link-primary mt-3">회원탈퇴</a></div>
                </c:if>
                <!-- 신고하기(타인프로필) -->
                <c:if test="${sessionScope.loginId ne dto.u_id }">
                	<div class="mt-3"><a href="#" id="userNotify" class="link-primary mt-3 float-right">신고하기</a></div>
                </c:if>
                
            </div>
            <div id="fitSection" class="col-md-8">
                <!-- 통계 -->
                <div id="fitStatistics" class="row ml-0 mr-0 pt-3 pb-0 bg-white shadow">
                    <div class="fitStatisticsCol col">
                        <p class="text-secondary">질문 수</p>
                        <p><span>${dto.fitcnt }</span><span>개</span></p>
                    </div>
                    <div class="fitStatisticsCol col">
                        <p class="text-secondary">답변 수</p>
                        <p><span>${dto.anscnt }</span><span>개</span></p>
                    </div>
                    <div class="fitStatisticsCol col">
                        <p class="text-primary">채택 수</p>
                        <p><span>${dto.u_chooseCnt }</span><span>개</span></p>
                    </div>
                    <div class="fitStatisticsCol fitStatisticsColLast col">
                        <p class="text-danger">채택률</p>
                        <p><span>${dto.choosePct }</span><span>%</span></p>
                    </div>
                </div>

                <!-- 글 목록 -->
                <div id="fitMenu" class="bg-white mt-3">
                    <!-- 탭 클릭 -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item mr-2">
                            <a class="nav-link nav-links navSelected rounded-top" data-toggle="tab" href="#myFitWrite">내가 쓴 Fit</a>
                        </li>
                        <li class="nav-item mr-2">
                            <a class="nav-link nav-links rounded-top" data-toggle="tab" href="#myFitAnswer">내가 쓴 답변</a>
                        </li>
                        <c:if test="${sessionScope.loginId eq dto.u_id }">
                        <li class="nav-item mr-2">
                            <a class="nav-link nav-links rounded-top" data-toggle="tab" href="#myFitDictionary">내 사전</a>
                        </li>
                        </c:if>
                    </ul>
                
                  <!-- 탭 클릭시 보여지는 화면 -->
                    <div class="tab-content">
                        <div id="myFitWrite" class="container tab-pane active overflow-auto shadow pl-4 pr-4"><br>
                            <!-- <div class="container shadow items solution">
                                <div class="itemsTop container pt-3">
                                    <span class="q text-success">Q. </span>
                                    <span class="title">제 자세좀 봐주세요!</span>
                                    <span class="category text-secondary float-right">자세교정</span>
                                </div>
                                <div class="itemsBottom container pt-2">
                                    <p class="text-secondary">스쿼트 하는데 너무 무릎이 아파서요.. 자세 교정좀 부탁드립니다!</p>
                                </div>
                            </div> -->
                            <c:forEach items="${myFitList }" var="myFit">
                            	<div class="container shadow items 
                            		<c:if test="${myFit.k_solutionYN eq 'Y'}"> solution</c:if>" onclick="location.href='fitDetail?k_no=${myFit.k_no}'">
	                                <div class="itemsTop container pt-3">
	                                    <span class=" 
	                                    	<c:if test="${myFit.k_solutionYN eq 'Y'}"> text-success</c:if>
	                                    	<c:if test="${myFit.k_solutionYN ne 'Y'}"> text-primary</c:if>">Q. 
	                                    </span>
	                                    <span class="title">${myFit.k_title }</span>
	                                    <span class="category text-secondary float-right">${myFit.c_name }</span>
	                                </div>
	                                <div class="itemsBottom container pt-2">
	                                    <p class="text-secondary">${myFit.k_content }</p>
	                                </div>
	                            </div>
                            </c:forEach>      
                        </div>
                        <div id="myFitAnswer" class="container tab-pane fade overflow-auto shadow"><br>
                        	<c:forEach items="${myAnsList }" var="myAns">
                        		<div class="container shadow items 
                            		<c:if test="${myAns.kR_chooseYN eq 'Y'}"> solution</c:if>" onclick="location.href='fitDetail?k_no=${myAns.k_no}'">
	                                <div class="itemsTop container pt-3">
	                                    <span class="text-secondary">Q. </span>
	                                    <span class="title text-secondary">${myAns.k_title }</span>
	                                    <span class="category text-secondary float-right">${myAns.c_name}</span>
	                                </div>
	                                <div class="itemsBottom container pt-2">
	                                    <span class=" 
	                                    	<c:if test="${myAns.kR_chooseYN eq 'Y'}"> text-success</c:if>
	                                    	<c:if test="${myAns.kR_chooseYN ne 'Y'}"> text-primary</c:if>">A. 
	                                    </span>
	                                    <span>${myAns.kR_content }</span>
	                                </div>
	                            </div>
                        	</c:forEach>
                        </div>
                        <c:if test="${sessionScope.loginId eq dto.u_id }">
                        <div id="myFitDictionary" class="container tab-pane fade overflow-auto shadow"><br>
                        	 <c:forEach items="${myDirList }" var="myDir">
                            	<div class="container shadow items 
                            		<c:if test="${myDir.k_solutionYN eq 'Y'}"> solution</c:if>" onclick="location.href='fitDetail?k_no=${myDir.k_no}'">
	                                <div class="itemsTop container pt-3">
	                                    <span class=" 
	                                    	<c:if test="${myDir.k_solutionYN eq 'Y'}"> text-success</c:if>
	                                    	<c:if test="${myDir.k_solutionYN ne 'Y'}"> text-primary</c:if>">Q. 
	                                    </span>
	                                    <span class="title">${myDir.k_title }</span>
	                                    <span class="category text-secondary float-right">${myDir.c_name }</span>
	                                </div>
	                                <div class="itemsBottom container pt-2">
	                                    <p class="text-secondary">${myDir.k_content }</p>
	                                </div>
	                            </div>
                            </c:forEach> 
                        </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
<style>


    /* 상단 회원정보 */
    #profileTop{
        position:relative;
        height:400px;
        width:350px;
    }
    #profileTopImg{
        position:absolute;
        height:200px;
        width:200px;
        top:50px;
        left:75px;
    }
    #profileTopNick{
        position:absolute;
        width:350px;
        top:280px;  
        text-align:center;
        font-size: 2.4rem;
        font-weight:600;
    }
    #userInfoUpdateBtn{
        position:absolute;
        top:350px;
        left:260px;
    }
    #profileTopGradeImg{
        width:30px;
        height:30px;
        position:absolute;
        top:350px;
        left:135px;
    }
    #profileTopRanking{
        width:100px;
        font-size: 1.2rem;
        font-weight:500;
        position:absolute;
        top:350px;
        left:175px;
    }

    /* 테이블 프로필 */
    #profileTable{
        height:200px;
		margin-top:80px;
    }
    
    #profileTable table{
        width:350px;
        text-align:center;
    }
    #profileTable td,#profileTable th{
        padding:3px;
    }

    /* 통계 */
    .fitStatisticsCol{
        text-align: center;
        font-size: 1.1rem;
        border-right:1px solid gray;
    }
    .fitStatisticsColLast{
        border-right:none;
    }

    /*탭 관련*/
    ul.nav{
        background-color:#EAEAED;
    }
    .tab-content>div{
        height:658px;
    }
    .nav-links{
        font-size: 1.0rem;
        font-weight:500;
        color:#585858;
        background-color: #A4A4A4;
    }
    .navSelected{
        background-color: white;
    }
    .items{
        border-radius:10px/10px;
        border-left: 7px solid #0275d8;
        height:100px;
        margin-bottom:35px;
    }
    .items:hover{
        cursor:pointer;
    }
    .itemsTop{
        font-size:1.0rem;
    }
    /*완료 답변은 초록색으로,,,*/
    .solution{
        border-left: 7px solid #5cb85c;
        background-color: rgba(92, 184, 92, 0.1);
    }
    .category{
        font-size:1rem;
    }
    .itemsBottom{
        font-size:1.0rem;
    }
</style>
<script>
    //탭 클릭시 색을 변경
    $(".nav-link").on("click",function(){
        $(".nav-link").removeClass("navSelected");
        $(this).addClass("navSelected");
    });
    
    //수정 버튼 클릭시 회원정보수정 페이지로 이동
    $("#userInfoUpdateBtn").on("click",function(){
    	location.href = 'goupdate';
    });
</script>
</html>