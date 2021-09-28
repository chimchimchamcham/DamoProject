<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<!-- 신고 모달 -->

<div class="modal fade" id="notify">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content" id="modalContent">
			<!-- Modal Header -->
			<div class="notify-header pt-2 pb-2">
				<div class="modal-title ml-2 float-left" id="modalTitle">신고하기</div>
				<button type="button" class="close mr-2" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body p" id="nModalBody">
				<div class="row">
					<span id="n1_code" class="container pr-0 mr-0 col-md-4">신고할
						사용자</span> <span id="ntfTitle" class="container pl-0 pr-0 ml-0 col-md-4"
						style="text-align: left">${dto.u_nick}</span> <span id="n2_code"
						class="container pl-0 form-group col-md-4"> <select
						name="n2_code" class="form-control " style="width: 150px">
							<option value="" selected>신고분류 선택</option>
							<option value="USER_001">음란/선정성</option>
							<option value="USER_002">도배/욕설 메시지</option>
							<option value="USER_003">권리침해(사생활침해/명예훼손/괴롭힘)</option>
							<option value="USER_004">광고/홍보성</option>
							<option value="USER_005">불법 정보(도박/사행성)</option>
							<option value="USER_006">불법 촬영물 등 유통</option>
							<option value="USER_007">불건전 프로필사진</option>
							<option value="USER_008">불건전 닉네임</option>
							<option value="USER_009">기타</option>
					</select>
					</span>
				</div>
				<div id="contentWrap">
					<textarea id="ntf_content" placeholder="신고 내용을 입력하세요."></textarea>
				</div>
				<button type="button"
					class="btn btn-outline-secondary float-right mt-4"
					data-dismiss="modal" id="ntfBtn" onclick="regNotify()">신고
					등록</button>
			</div>
		</div>
	</div>
</div>
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
                    <div id="profileTopNick">${fn:substring(dto.u_nick,0,8) }
                    	<c:if test="${fn:length(dto.u_nick) > 8}">...</c:if>
                    </div>
                    <c:if test="${sessionScope.loginId eq dto.u_id }">
                       <button id="userInfoUpdateBtn" type="button" class="btn btn-secondary btn-sm">수정</button>
                    </c:if>
                     <!-- 모달 버튼 -->
                    <img id="profileTopGradeImg" src="resources/img/${dto.g_fileName}.png" class="rounded-circle" data-toggle="modal" data-target="#myModal">
					
					  <!-- 모달 본체 -->
					  <div class="modal" id="myModal">
					    <div class="modal-dialog modal-xl modal-dialog-centered">
					      <div class="modal-content">
					      
					        <!-- 모달 헤더 -->
					        <div class="modal-header">
					          <h4 class="modal-title">등급설명</h4>
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					        </div>
					        
					        <!-- 모달 내용 -->
					        <div class="modal-body">
					          <div class="container">
					          	<div class="row">
					          		<div class="col-lg-6 border-right-1 mb-4">
					          			<table id="gradeTable" class="gradeTable">
					          				<tr><th>계급</th><th>계급명</th><th>등업조건</th></tr>
					          				<tr><td class="gradeImg"><img src="resources/img/level1.png" width="40px" height="40px"></td><td>빨강아령</td><td>없음</td></tr>
					          				<tr><td class="gradeImg"><img src="resources/img/level2.png" width="40px" height="40px"></td><td>주황아령</td><td>채택수 3</td></tr>
					          				<tr><td class="gradeImg"><img src="resources/img/level3.png" width="40px" height="40px"></td><td>노랑아령</td><td>채택수 30</td></tr>
					          				<tr><td class="gradeImg"><img src="resources/img/level4.png" width="40px" height="40px"></td><td>초록아령</td><td>채택수 200</td></tr>
					          				<tr><td class="gradeImg"><img src="resources/img/level5.png" width="40px" height="40px"></td><td>파랑아령</td><td>채택수 500</td></tr>
					          			</table>
					          		</div>
					          		<div class="col-lg-6 mb-4">
					          			<table id="gradeTable" class="gradeTable">
					          				<tr><th>계급</th><th>계급명</th><th>등업조건</th></tr>
					          				<tr><td class="gradeImg"><img src="resources/img/level6.png" width="40px" height="40px"></td><td>남색아령</td><td>채택수 1000</td></tr>
					          				<tr><td class="gradeImg"><img src="resources/img/level7.png" width="40px" height="40px"></td><td>보라색아령</td><td>채택수 2500</td></tr>
					          				<tr><td class="gradeImg"><img src="resources/img/level8.png" width="40px" height="40px"></td><td>핑크아령</td><td>채택수 5500</td></tr>
					          				<tr><td class="gradeImg"><img src="resources/img/level9.png" width="40px" height="40px"></td><td>은색아령</td><td>채택수 15000</td></tr>
					          				<tr><td class="gradeImg"><img src="resources/img/level10.png" width="40px" height="40px"></td><td>금색아령</td><td>채택수 30000</td></tr>
					          			</table>
					          		</div>
					          	</div>
					          </div>
					        </div><!-- end body -->
					        
					      </div>
					    </div>
					  </div>
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
                <c:if
					test="${sessionScope.loginId ne dto.u_id and sessionScope.loginId ne null }">
					<div class="mt-3">
						<a id="userNotify" class="link-primary mt-3 float-right"
							data-toggle="modal" data-target="#notify">신고하기</a>
					</div>
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
                        <li class="nav-item mr-2 shadow-sm">
                            <a class="navLink nav-link nav-links <c:if test="${myDirYN eq 'N' }"> navSelected</c:if> rounded-top" data-toggle="tab" href="#myFitWrite">내가 쓴 Fit</a>
                        </li>
                        <li class="nav-item mr-2 shadow-sm">
                            <a class="navLink nav-link nav-links rounded-top" data-toggle="tab" href="#myFitAnswer">내가 쓴 답변</a>
                        </li>
                        <c:if test="${sessionScope.loginId eq dto.u_id }">
                        <li class="nav-item mr-2 shadow-sm">
                            <a class="navLink nav-link nav-links <c:if test="${myDirYN eq 'Y' }"> navSelected</c:if> rounded-top" data-toggle="tab" href="#myFitDictionary">내 사전</a>
                        </li>
                        </c:if>
                    </ul>
                <%-- <c:if test="${myDirYN eq 'N' }"> active</c:if> --%>
                  <!-- 탭 클릭시 보여지는 화면 -->
                    <div class="tab-content">
                        <div id="myFitWrite" class="container tab-pane <c:if test="${myDirYN eq 'N' }"> active</c:if><c:if test="${myDirYN eq 'Y' }"> fade</c:if> overflow-auto shadow pl-4 pr-4"><br>
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
                                       <span class="title">${fn:substring(myFit.k_title,0,35) }<c:if test="${fn:length(myFit.k_title) > 35}">...</c:if></span>
                                       <span class="category text-secondary float-right">${myFit.c_name }</span>
                                   </div>
                                   <div class="itemsBottom container pt-2">
                                       <p class="text-secondary">${fn:substring(myFit.k_content,0,70) }<c:if test="${fn:length(myFit.k_content) > 70}">...</c:if></p>
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
                                       <span class="title text-secondary">${fn:substring(myAns.k_title,0,35) }<c:if test="${fn:length(myAns.k_title) > 35}">...</c:if></span>
                                       <span class="category text-secondary float-right">${myAns.c_name}</span>
                                   </div>
                                   <div class="itemsBottom container pt-2">
                                       <span class=" 
                                          <c:if test="${myAns.kR_chooseYN eq 'Y'}"> text-success</c:if>
                                          <c:if test="${myAns.kR_chooseYN ne 'Y'}"> text-primary</c:if>">A. 
                                       </span>
                                       <span>${fn:substring(myAns.kR_content,0,70) }<c:if test="${fn:length(myAns.kR_content) > 70}">...</c:if></span>
                                   </div>
                               </div>
                           </c:forEach>
                        </div>
                        <c:if test="${sessionScope.loginId eq dto.u_id }">
                        <div id="myFitDictionary" class="container tab-pane  <c:if test="${myDirYN eq 'Y' }"> active</c:if><c:if test="${myDirYN eq 'N' }"> fade</c:if>  overflow-auto shadow"><br>
                            <c:forEach items="${myDirList }" var="myDir">
                               <div class="container shadow items 
                                  <c:if test="${myDir.k_solutionYN eq 'Y'}"> solution</c:if>" onclick="location.href='fitDetail?k_no=${myDir.k_no}'">
                                   <div class="itemsTop container pt-3">
                                       <span class=" 
                                          <c:if test="${myDir.k_solutionYN eq 'Y'}"> text-success</c:if>
                                          <c:if test="${myDir.k_solutionYN ne 'Y'}"> text-primary</c:if>">Q. 
                                       </span>
                                       <span class="title">${fn:substring(myDir.k_title,0,35) }<c:if test="${fn:length(myDir.k_title) > 35}">...</c:if></span>
                                       <span class="category text-secondary float-right">${myDir.c_name }</span>
                                   </div>
                                   <div class="itemsBottom container pt-2">
                                       <p class="text-secondary">${fn:substring(myDir.k_content,0,70) }<c:if test="${fn:length(myDir.k_content) > 70}">...</c:if></p>
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
    #profileTopIntro{
    	overflow-y:scroll;
    	height:150px;
    }

    /* 테이블 프로필 */
    #profileTable{
        height:200px;
      margin-top:30px;
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
        border-right:1px solid #BDBDBD;
    }
    .fitStatisticsColLast{
        border-right:none;
    }

    /*탭 관련*/
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
    /* 신고 modal */
.notify-header {
	background-color: red;
	color: white;
}

#ntfBtn {
	width: 100px;
	background-color: red;
	color: white;
}

#ntf_content {
	resize: none;
	padding: 20px;
	width: 98%;
	height: 150px;
}

/* 신고 모달 관련 */
.gradeTable{
	width:100%;
}
.gradeTable th{
	text-align : left;
	padding-left : 10px;
	font-size : 1.2rem;
	padding-bottom : 10px;
}
#gradeTable td{
	padding : 10px;
	text_align : right;
	font-size:1.2rem;
}
</style>
<script>

    //탭 클릭시 색을 변경
    $(".navLink").on("click",function(){
        $(".navLink").removeClass("navSelected");
        $(this).addClass("navSelected");
    });
    
    //수정 버튼 클릭시 회원정보수정 페이지로 이동
    $("#userInfoUpdateBtn").on("click",function(){
       location.href = 'goupdate';
    });
    
    function regNotify() {//신고 등록 눌렀을 때
		if (chkNotify()) {
			$.ajax({
				url : 'userNotify',
				method : 'GET',
				data : {
					"n1_code" : "USER",
					"n2_code" : $("#n2_code option:selected").val(),
					"n_sendid" : "${sessionScope.loginId}",
					"n_receiveid" : "${dto.u_id}",
					"n_content" : $("#ntf_content").val()

				},
				success : function(data) {
					//console.log(data);				
					alert(data);

				},
				error : function(e) {
					console.log(e);
				}
			});
		}
	
	}
	//신고 전 처리
	function chkNotify() {
		if (loginId == "") {
			alert("로그인하세요");
			return false;
		} else if ($("#n2_code option:selected").val()=="") {
			alert("신고분류를 선택해 주세요");
			return false;
		} else if ($("#ntf_content").val().length > 1000) {
			alert("글자수를 1000자 이하로 작성해주세요");
			return false;
		}else if ($("#ntf_content").val() == "") {
			alert("신고 내용을 입력해주세요");
			return false;
		}

		//빈 칸이 없으면 글쓰기 등록
		return true;
	};
</script>
</html>