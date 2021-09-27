<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<style>
</style>
</head>
<body style="background-color: #F2F2F2;">
	<jsp:include page="../header.jsp"></jsp:include>

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
						<!-- <div id="n1_code"
							class="container col-md-4"></div>
						<div id="ntfTitle" class="container col-md-3"></div>
						<div id="n2_code" class="container form-group col-md-5">
							<select name="n2_code" class="form-control">
								<option></option>
							</select>
						</div> -->
						<span id="n1_code" class="container pr-0 mr-0 col-md-4"></span> <span
							id="ntfTitle" class="container pl-0 pr-0 ml-0 col-md-4"
							style="text-align: left"></span> <span id="n2_code"
							class="container pl-0 form-group col-md-4"> <select
							name="n2_code" class="form-control " style="width: 150px">
								<option></option>
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

	<!-- 질문 글 -->
	<div class="container-fluid bg-light py-3">
	<div id="fitQuestion" class="container mt-3 mb-3 pt-4 pb-4 pl-5 pr-4">
		<div class="">
			<span id="q">Q.</span> <span class="titleTxt">${bean.k_title }</span>
			<span id="category">${bean.c_name }</span>

			<c:set var="fitId" value="${bean.u_id}" />
			<c:set var="sessionId" value="${sessionScope.loginId}" />

			<c:if test="${bean.k_solutionYN eq 'N' }">
				<c:if test="${fitId eq sessionId }">
					<div class="d-inline-flex float-right">
						<a href="fitUpdateForm?k_no=${bean.k_no }" id="qUpd"
							class="upd float-right mr-1 mt-1">수정</a> |<a
							href="fitDelete?k_no=${bean.k_no }" id="qDel"
							class="del float-right ml-1 mt-1">삭제</a>
					</div>
				</c:if>
			</c:if>
			<!-- 유저와 글 작성자가 다를 경우 -->
			<c:if test="${fitId ne sessionId and sessionId ne null}">
				<div class="d-inline-flex float-right">
					<a class="notify float-right ml-3 mt-1" data-toggle="modal"
						data-target="#notify" title="qNotify" onclick="notify(this)">신고</a>

				</div>
			</c:if>
		</div>
		<br>
		<div id="qContent" >${bean.k_content }</div>
		<br>
		<div id="qPhoto">
			<c:forEach items="${qPhoto }" var="photo">
				<c:if test="${photo.ki_imgYN eq 'Y' }">
					<div class="imagWrap">
						<img class="qImag" src="/photo/${ photo.ki_name}"
							alt="${ photo.ki_name}">
					</div>
				</c:if>
			</c:forEach>
		</div>
		<c:forEach items="${qPhoto }" var="link">
			<c:if test="${link.ki_imgYN eq 'N' }">				
				<div id="qVideo">
					<iframe id="video"
						src="https://www.youtube.com/embed/${link.ki_name }"
						alt="${ link.ki_name}" title="YouTube video player"
						frameborder="0"
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe>
				</div>
			</c:if>
		</c:forEach>

		<div class="userInfo container mt-0 mb-0">
		
			<div class="row">
			<hr/>
				<div class="col-sm-6 float-left p-0 text-left">
				<img class="userGrade" src="resources/img/${bean.g_fileName }.png" alt="${bean.g_fileName }">
			<a href="myPage?u_id=${bean.u_id }" style="color:black;">${bean.u_id }</a>
			</div>
			
			<div class="col-sm-6 float-right text-right">
			${bean.k_date } | 조회수 ${bean.k_view }
			<!-- <div class="d-inline-flex float-right"> -->
			<c:if test="${sessionId ne bean.u_id and sessionId ne null}">
				<!-- <button type="button" class="btn btn-primary float-right ml-3 mt-1"
						onclick="href">추가</button> -->
				<span class="float-right ml-3 mt-1" onclick="dirAddDel()"><a><img
						id="dir" src="resources/img/dir.png" alt="dir"></a><span></span></span>
			</c:if>
			<!-- </div> -->
		</div>
		</div>
		</div>
	</div>
</div>

	<!-- 중간 상자 -->
	<!-- 기본은 답변하기가 출력 -->
	<c:set var="loop_flag" value="false" />
	<c:choose>

		<c:when test="${bean.k_solutionYN eq 'N'}">
			<c:choose>

				<c:when test="${fitId eq sessionId}">
					<c:choose>

						<c:when test="${bean.k_replyCnt ne '0'}">

							<c:set var="loop_flag" value="change" />
						</c:when>

						<c:otherwise>

							<c:set var="loop_flag" value="true" />
						</c:otherwise>
					</c:choose>
				</c:when>

				<c:otherwise>
					<c:choose>
						<c:when test="${sessionId eq null}">

							<c:set var="loop_flag" value="del" />
						</c:when>
						<c:otherwise>
							<c:forEach items="${answer}" var="ans">
								<c:if test="${ans.u_id eq sessionId and ans.kR_blindYN eq 'N'}">

									<c:set var="loop_flag" value="true" />
								</c:if>
							</c:forEach>

						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
		</c:when>

		<c:otherwise>

			<c:set var="loop_flag" value="true" />
		</c:otherwise>
	</c:choose>

	<div id="goAnsForm" class="container p-3 bg-light" >
		<div class="row">
			<div id="title" class="col-md-8">
				<h3 class="titleTxt">${sessionScope.loginNick }님,답변해주세요!</h3>
				채택수를 채워서 등급을 올려보세요!
			</div>
			<div id="right" class="col-md-4">
				<button type="button" id="ansBtn"
					class="btn btn-primary float-right ml-3 mt-1"
					onclick="openAnsForm()">답변하기</button>
			</div>
		</div>

		<div id="ansForm" class="container">
			<hr>
			<form name="fitAnsWrite" action="fitAnsWrite?k_no=${bean.k_no }"
				method="post" enctype="multipart/form-data">


				<div id="fitContent" class="container pt-4 pl-5">
					<div class="d-inline-flex"></div>
					<div class="d-inline-flex float-left">
						<label for="photo" class="mr-3"><img
							src="resources/img/image.png" alt="사진등록" width="30px"
							height="30px" id="photoRegister"></label> <input type="file"
							name="photo" multiple id="photo"
							accept="image/gif,image/jpeg,image/png,image/jpg">
						<!-- 사진 -->
						<a class="mr-3" data-toggle="modal" data-target="#myModal"><img
							src="resources/img/link.png" alt="링크등록" width="30px"
							height="30px" id="linkRegister"></a>

						<!-- 링크를 입력하는 모달 -->
						<!-- The Modal -->
						<div class="modal fade" id="myModal">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content" id="modalContent">
									<!-- Modal Header -->
									<div class="modal-header">
										<h4 class="modal-title" id="modalTitle">링크</h4>
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>

									<!-- Modal body -->
									<div class="modal-body p" id="modalBody">
										<input type="text" class="form-control" id="link"
											placeholder="링크를 입력하세요.">
										<button type="button" class="btn btn-outline-secondary mt-4"
											data-dismiss="modal" id="checkBtn">확인</button>
									</div>

									<img src="resources/img/search.png" alt="링크" width="20px"
										height="20px" id="linkSearch">
								</div>
							</div>
						</div>

					</div>

					<hr />

					<div id="contentWrap">
						<!-- 글이 들어간다 -->
						<textarea id="k_content" name="k_content"
							placeholder="질문과 관련된 답변 등록 부탁드립니다.
질문과 관련 없는 답변 등록시 삭제 조치가 들어갑니다.
추후 블랙리스트 등록이 될 수 있음에 유의 바랍니다.
            "></textarea>
						<!-- 내용 -->
						<!-- 글자수 카운트 -->
						<div id="textCountWrap">
							<span id="textCount">0</span><span>/1000</span>
						</div>
					</div>
					<hr />
					<!-- 이미지가 들어간다 -->
					<div id="imageWrap">
						<!-- <div class="imgWrap">
                <img src="resources/img/fitimg.jpg" width="400px" height="300px"> 이미지 4장까지
                <a href="#" class="closeWrap"><img src="resources/img/close.png" width="20px" height="20px"></a>
            </div> -->
					</div>
					<!-- 동영상이 들어간다 -->
					<div id="movieWrap">
						<!-- <div class="iframeWrap"> 동영상 1개만
                <iframe width="400" height="300" src="https://www.youtube.com/embed/myNjmnvI6x0" title="YouTube video player" 
                    frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
                </iframe>
                <a href="#" class="closeIframeWrap"><img src="resources/img/close.png" width="20px" height="20px"></a>
            </div> -->
					</div>

					<!-- 이미지 순서 저장 ??? 추후 논의 -->
					<!-- 에러처리를 위해 0을 기본으로 집어넣음 -->
					<input type="hidden" name="imgNo" value="0">

					<!-- id를 부여하기 위해 임시로 input type file을 저장해 놓는 곳 -->
					<div id="fileTemp"></div>

					<!-- 업로드할 input type file을 저장하는 곳 -->
					<div id="uploadFile"></div>

					<!-- 동영상 url추출 저장 -->
					<input type="hidden" name="url" id="iframeUrl">

					<!-- 동영상 url추출 저장 -->
					<input type="hidden" name="url" id="iframeUrl" value="">

					<!-- 빈칸-->
					<div id="emptyWrap"></div>
				</div>
			</form>
		</div>
	</div>


	<!-- 답변이 있을 때  -->
	<c:if test="${bean.k_replyCnt != 0 }">
		<div class="container">
			<span id="a">A.</span><span class="titleTxt">${bean.k_replyCnt}개
			</span>
		</div>

		<c:forEach items="${answer}" var="ans">
			<!-- 채택된 답변 -->
			<c:if test="${ans.kR_chooseYN eq 'Y' }">
				<div id="choosedAns" class="container mt-3 mb-3 pt-4 pb-4 pl-5 pr-4">
					<!-- 답변자 정보 -->
					<div class="title">
						<img class="ansGrade" src="resources/img/${ans.g_fileName }.png"
							alt="${bean.g_fileName }"> <span class="titleTxt"><a
							href="myPage?u_id=${ans.u_id }"> ${ans.u_nick }</a>님의 답변</span>
						<!-- <a href="#"	class="notify float-right ml-3 mt-1">신고</a> -->
					</div>
					<!-- 답변 내용 -->
					<div class="aContent ">${ans.kR_content }</div>

					<br>
					<div class="aPhoto">
						<c:forEach items="${ aPhoto }" var="photo">
							<c:if test="${photo.key eq ans.kR_no}">
								<c:forEach items="${photo.value}" var="item">
									<c:if test="${item.ki_imgYN eq 'Y'}">
										<div class="imageWrap">
											<img class="aImag imageWrap" src="/photo/${ item.ki_name}"
												alt="${ item.ki_name}">
										</div>
									</c:if>
								</c:forEach>
							</c:if>
						</c:forEach>
					</div>
					<br>
					<div class="aVideo">
						<c:forEach items="${ aPhoto }" var="link">
							<c:if test="${link.key eq ans.kR_no}">
								<c:forEach items="${link.value}" var="item">
									<c:if test="${item.ki_imgYN eq 'N'}">
										<iframe width="560" height="315"
											src="https://www.youtube.com/embed/${item.ki_name }"
											title="YouTube video player" frameborder="0"
											alt="${item.ki_name }"
											allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
											allowfullscreen></iframe>
									</c:if>
								</c:forEach>
							</c:if>
						</c:forEach>
					</div>
					<div>${ans.kR_date }
						<!-- <button type="button"
							class="btn btn-primary float-right ml-3 mt-1">댓글</button> -->
					</div>
				</div>
			</c:if>
			<!-- 채택되지 않은 답변들 -->

			<c:if test="${ans.kR_chooseYN eq 'N' and ans.kR_blindYN eq 'N'}">
				<div class="ansContainer container mt-3 mb-3 pt-4 pb-4 pl-5 pr-4 ">
					<!-- 답변자 정보 -->
					<div class="hhh">

						<img class="ansGrade" src="resources/img/${ans.g_fileName }.png"
							alt="${bean.g_fileName }"> <span class="titleTxt ml-2"><a
							href="myPage?u_id=${ans.u_id }"> ${ans.u_nick }</a>님의 답변</span>
						<!-- 채택된 답변이 없을 때 채택하기 생성 -->
						<c:if test="${bean.k_solutionYN eq 'N' && bean.u_id eq sessionId}">
							<a
								onclick="location.href='chooseFitAns?kr_no=${ans.kR_no}&k_no=${bean.k_no}'&ans_id=${ans.u_id}'">
								<span class="container fitChoose"> <img class="fitChoose"
									alt="fitChoose" src="resources/img/fitChoose.png">채택하기
							</span>
							</a>
						</c:if>

						<c:if test="${ans.u_id ne sessionId and sessionId ne null}">
							<a class="notify float-right ml-3 mt-1" data-toggle="modal"
								data-target="#notify"
								title="${ans.kR_no},${ans.u_id},${ans.u_nick}"
								onclick="notify(this);">신고</a>
							<!-- <a href="#" class="notify float-right ml-3 mt-1">신고</a> -->
						</c:if>
						<c:if test="${ans.u_id eq sessionId}">
							<span class="float-right "><a href="javascript:void(0)"
								class="upd ml-3 mt-1" data-no="${ans.kR_no}"
								onclick="updateAns(this)">수정</a> |<a
								href="fitAnsDel?kr_no=${ans.kR_no}&k_no=${bean.k_no}"
								class="del ml-1 mt-1">삭제</a></span>
						</c:if>
					</div>
					<br>
					<div class="aContent container mt-1">${ans.kR_content }</div>
					<br>
					<div class="aPhoto">
						<c:forEach items="${ aPhoto }" var="photo">
							<c:if test="${photo.key eq ans.kR_no}">
								<c:forEach items="${photo.value}" var="item">
									<c:if test="${item.ki_imgYN eq 'Y'}">
										<div class="imageWrap">
											<img class="aImag " src="/photo/${ item.ki_name}"
												alt="${ item.ki_name}">
										</div>
									</c:if>
								</c:forEach>
							</c:if>
						</c:forEach>
					</div>
					<br>
					<div class="aVideo">
						<c:forEach items="${ aPhoto }" var="link">
							<c:if test="${link.key eq ans.kR_no}">
								<c:forEach items="${link.value}" var="item">
									<c:if test="${item.ki_imgYN eq 'N'}">
										<iframe width="560" height="315"
											src="https://www.youtube.com/embed/${item.ki_name }"
											title="YouTube video player" frameborder="0"
											alt="${item.ki_name }"
											allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
											allowfullscreen></iframe>
									</c:if>
								</c:forEach>
							</c:if>
						</c:forEach>
					</div>
					<div class="container mt-2">
						${ans.kR_date }
						<!-- <button type="button"
							class="btn btn-primary float-right ml-3 mt-1">댓글</button> -->
					</div>
				</div>
			</c:if>

		</c:forEach>

	</c:if>

</body>

<style>
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

#n2_code select {
	width: 200px;
}

#fitQuestion {
	border: 1px solid #D8D8D8;
	border-top: 5px solid #0275d8;
	transition: 0.5s;
}

#goAnsForm {
	border: 1px solid #D8D8D8;
	font-size: 17px;
	/* height: 150px; */
	/* display: none; */
}

#ansForm {
	display: none;
}

.ansContainer {
	border: 1px solid #D8D8D8;

	/* display: none; */
}

#fitTitle .row {
	vertical-align: middle;
}

#choosedAns {
	border: 1px solid #5cb85c;
	border-top: 5px solid #5cb85c;
	transition: 0.5s;
}

#q {
	font-size: 2.3rem;
	font-weight: 700;
	color: #0275d8;
	margin-right: 20px;
	vertical-align: middle;
}

#a {
	font-size: 2.3rem;
	font-weight: 700;
	color: #5cb85c;
	margin-right: 20px;
	vertical-align: middle;
}

.titleTxt {
	font-size: 27px;
	font-weight: 700;
	margin-right: 20px;
	vertical-align: middle;
}

.fitChoose {
	font-size: 1.3rem;
	font-weight: 700;
	color: #0275d8;
	width: 40px;
	height: 30px;
}

#inputTitle {
	border: none;
	border-bottom: 2px solid #0275d8;
	border-radius: 0px;
	font-size: 1.5rem;
}

#titleBtn button {
	border-radius: 0px;
}

#category {
	width: 100px;
	vertical-align: middle;
	background-color: #eaeaea;
	border-radius: 30px;
	padding: 3px 10px;
	font-size: 13px;
	color: #666;
}

#qContent{
	font-size: 17px;
}

#photo {
	display: none;
}

#checkBtn {
	width: 100px;
}

#link {
	padding-right: 30px;
}

#modalTitle {
	font-weight: 500;
}

#modalBody {
	text-align: center;
}

#modalContent {
	position: relative;
}

#dir {
	width: 50px;
	height: 50px;
}

/* .userInfo{
	height: 20px;
} */
.userGrade {
	width: 20px;
	height: 20px;
}

.ansGrade {
	width: 45px;
	height: 45px;
	vertical-align: middle;
}

.qImag {
	width: 440px;
	height: 300px;
	margin: 5px;
	position: relative;
}

.aImag {
	width: 440px;
	height: 300px;
	margin: 5px;
	position: relative;
}

.ansTitle {
	vertical-align: middle;
}

a.notify, a.del {
	color: red;
}

.upd {
	color: #D8D8D8;
}

#n1_code {
	height: 10px;
}

#ntfTitle {
	white-space: nowrap;
	width: 10px;
	overflow: hidden;
	text-overflow: ellipsis; /* 말줄임 적용 */
}
/*  */
#fitTitle {
	border: 1px solid #D8D8D8;
}

#fitContent {
	border: 1px solid #D8D8D8;
}

#fitTitle .row {
	vertical-align: middle;
}

#k_title {
	border: none;
	border-bottom: 2px solid #0275d8;
	border-radius: 0px;
	font-size: 1.5rem;
}

#titleBtn button {
	border-radius: 0px;
}

#linkSearch {
	position: absolute;
	top: 88px;
	left: 455px
}

#checkBtn {
	width: 100px;
}

#link {
	padding-right: 30px;
}

#modalContent {
	position: relative;
}

.imageWrap {
	width: 440px;
	height: 300px;
	margin: 5px;
	position: relative;
}

.closeImageWrap {
	position: absolute;
	top: 10px;
	left: 410px;
}

.closeIframeWrap {
	position: absolute;
	top: 10px;
	left: 410px;
}

.iframeWrap {
	width: 440px;
	height: 300px;
	margin: 5px;
	position: relative;
}

#emptyWrap {
	height: 200px;
}

#contentWrap {
	position: relative;
}

#k_content {
	resize: none;
	padding: 20px;
	width: 98%;
	height: 300px;
}

#k_content:focus {
	outline: none;
}

#textCountWrap {
	position: absolute;
	top: 280px;
	left: 30px;
	color: gray;
}

#uploadFile {
	display: none;
}
</style>
<script type="text/javascript">
	//console.log(${bean.k_solutionYN});
	var loginId = "${sessionScope.loginId}";
	var loginNick = "${sessionScope.loginNick}";
	var writerId = "${bean.u_id}";
	var kNo = "${bean.k_no}";
	var title = "${bean.k_title}";
	var flag = '<c:out value="${loop_flag}"/>';//글 작성자가 아니고, 답변한 유저이면 true
	//console.log(loginId);
	//console.log(typeof(loginId));
	var myAnswer;
	var content;
	var formName = document.fitAnsWrite;
	var ansNo;
	var ntfId;
	var ntfNo;
	//사진 추가 등록시 번호를 부여하는 변수
	var uploadNo = 1;
	//답변/수정 구분
	var ansOrUp = 0;

	//답변 채택 시 색 변환
	if ($("#choosedAns").length != 0) {
		$("#fitQuestion").css({
			"border-top" : "5px solid #5cb85c"
		});
		$("#q").css({
			"color" : "#5cb85c"
		});
	}

	hideAnsForm();
	if (loginId != writerId && loginId != '') {
		chkDir();
	}

	function chkDir() {
		$.ajax({
			url : 'chkDir',
			method : 'GET',
			data : {
				"k_no" : kNo,
				"u_id" : loginId
			},
			dataType : "text",
			success : function(data) {
				console.log(data);
				if (data == '+') {
					$("#dir").parent().next().html('+');
				} else if (data == '-') {
					$("#dir").parent().next().html('-');
				}
			},
			error : function(e) {
				console.log(e);
			}

		});
	}

	function dirAddDel() {
		var dir = $("#dir").parent().next().html();
		//console.log(dir);
		//console.log(typeof(dir));
		if (dir == '+') {
			$.ajax({
				url : 'addDir',
				method : 'GET',
				data : {
					"k_no" : kNo,
					"u_id" : loginId
				},
				success : function(data) {
					console.log(data);
					if (data != 'failed') {
						$("#dir").parent().next().html('-');

					}
					alert(data);

				},
				error : function(e) {
					console.log(e);
				}
			});
		} else if (dir == '-') {
			$.ajax({
				url : 'delDir',
				method : 'GET',
				data : {
					"k_no" : kNo,
					"u_id" : loginId
				},
				success : function(data) {
					console.log(data);
					if (data != 'failed') {
						$("#dir").parent().next().html('+');
					}
					alert(data);
				},
				error : function(e) {
					console.log(e);
				}
			});
		}
	}

	//flag 값에 따라 답변하기 변화
	function hideAnsForm() {
		console.log(flag);
		//console.log(typeof(flag));
		if (flag == 'true') {
			$("#goAnsForm").css({
				"display" : "none"
			});
		} else if (flag == 'change') {
			/* $("#goAnsForm h3").html("답변을 채택해 주세요!"); */
			$("#title").html(
					'<h3 class="titleTxt">' + loginNick
							+ '님, 답변을 채택해 주세요!</h3>답변 채택 부탁드립니다!');
			$("#right").css({
				"display" : "none"
			});
		} else if (flag == 'del') {
			/* $("#goAnsForm h3").html("답변을 채택해 주세요!"); */
			$("#title").html('<h3 class="titleTxt">답변해 주세요!</h3>');
		}
	}

	//답변 작성폼을 보여준다
	function openAnsForm() {
		//console.log(loginId);
		if (loginId == "") {
			alert("로그인 후 이용할 수 있는 서비스 입니다.");
			window.location.href = "Gologin";
		}
		//답변하기 버튼을 감춘다
		$("#ansBtn").css({
			"display" : "none"
		});

		if (flag == 'true') {//답변글 수정을 눌렀을 경우			
			$("#right")
					.append(
							'<button id="submit" type="submit" class="btn ans btn-primary float-right ml-3 mt-1" onclick="ansUpdate()">답변수정</button>');
			$("#right")
					.append(
							'<button type="button" class="btn ans btn-outline-primary float-right ml-3 mt-1" onclick="closeAnsForm()">수정취소</button>');
		} else {//답변하기를 눌렀을 경우
			$("#right")
					.append(
							'<button id="submit" type="submit" class="btn ans btn-primary float-right ml-3 mt-1" onclick="ansWrite()">답변등록</button>');
			$("#right")
					.append(
							'<button type="button" class="btn ans btn-outline-primary float-right ml-3 mt-1" onclick="closeAnsForm()">등록취소</button>');
		}
		//답변글 작성 폼을 보여준다
		$("#ansForm").css({
			"display" : "block"
		});

	}

	//취소 버튼을 눌렀을 경우
	function closeAnsForm() {
		if (flag == 'true') {//수정취소
			ansOrUp = 0;
			hideAnsForm();//답변해주세요 숨기기
			myAnswer.css({
				"display" : "block"
			});//답변 다시 보이기
		} else {//답변취소
			$("#ansForm").css({
				"display" : "none"
			});//답변글 작성 폼 숨기기
		}
		$("#right .ans").remove();//생성했던 버튼 삭제
		$("#ansBtn").css({
			"display" : "inline"
		});//답변하기 버튼 다시 나타내기
	}

	function ansUpdate() {
		if (chkForm()) {
			ansOrUp = 0;
			formName.action = "fitAnsUpdate?kr_no=" + ansNo + "&k_no=" + kNo;
			formName.method = "post";
			formName.enctype = "multipart/form-data"
			formName.submit();
		}
	}

	function ansWrite() {
		if (chkForm()) {
			$("form").submit();
		}
	}

	//답변 채택하기
	function selectAns(e) {
		//console.log($(e).attr('name'));

	}

	//수정 버튼을 눌렀을 경우
	function updateAns(e) {
		ansOrUp = 1;
		$("#goAnsForm").css({
			"display" : "block"
		});//답변하기 div 나타내기
		openAnsForm();//답변 작성 form 나타내기
		myAnswer = $(e).parents("div");//작성한 답변div 변수에 저장
		//console.log($(e).attr("data-no"));
		ansNo = $(e).attr("data-no");//답변번호 가져오기
		//console.log(myAnswer.find(".aContent").html());
		$("#k_content").html(myAnswer.find(".aContent").html());//글내용 옮김
		//console.log(myAnswer.find(".aPhoto img").attr("alt"));
		//console.log(myAnswer.find(".aPhoto img").next().attr("alt"));
		//console.log(myAnswer.find(".aPhoto img").next().next().attr("alt"));
		//console.log(myAnswer.find(".aPhoto img").next().next().next().attr("alt"));
		//console.log(myAnswer.find(".aPhoto img").next().next().next().next().attr("alt"));
		//console.log(myAnswer.find(".aPhoto img").next().next().next().next());
		var link = myAnswer.find(".aVideo iframe").attr("alt");
		//console.log(link.attr("alt"));
		$("#iframeUrl").attr("value", link);
		console.log($("#iframeUrl").attr("value"));
		var img = myAnswer.find(".aPhoto img");
		while (img.length != 0) {//이미지 옮기기
			//console.log(img.attr("alt"));
			content += '<div class="imageWrap">';
			content += '        <img src="/photo/' + img.attr("alt")
					+ '" width="400px" height="300px"> <!-- 이미지 4장까지 -->';
			content += '        <a href="#" class="closeImageWrap"><img src="resources/img/close.png" width="20px" height="20px"></a>';
			content += '        <input type="hidden" name="imgNo" value="'
					+ img.attr("alt") + '">';
			content += '	</div>';
			img = img.parent().next().find("img");
		}
		$("#imageWrap").empty().html(content);

		myAnswer.css({
			"display" : "none"
		});//답변 숨기기

	}

	function notify(e) {//신고를 눌렀을 경우
		//console.log($(e).attr("title"));
		var qna = $(e).attr("title");
		var option = '<option value="" >신고분류 선택 </option>';
		$("#n2_code").children().empty();
		$("#ntf_content").val('');
		if (qna == 'qNotify') {
			ntfNo = kNo;
			ntfId = writerId;
			$("#n1_code").html('신고할 지식fit');
			$("#ntfTitle").html(title);
			$("#n1_code").attr("name", 'KNOWFIT');
			option += '<option value="KNOWFIT_001" >음란/선정성 게시글 </option>';
			option += '<option value="KNOWFIT_002" >도배/욕설 게시글 </option>';
			option += '<option value="KNOWFIT_003" >권리침해(사생활침해/명예훼손/괴롭힘) 게시글 </option>';
			option += '<option value="KNOWFIT_004" >광고/홍보성 게시글 </option>';
			option += '<option value="KNOWFIT_005" >불법 정보(도박/사행성) 게시글 </option>';
			option += '<option value="KNOWFIT_006" >분란 유도 게시글 </option>';
			option += '<option value="KNOWFIT_007" >불법 촬영물 등 유통 게시글 </option>';
			option += '<option value="KNOWFIT_008" >기타 </option>';

		} else {
			//console.log(qna.split(',')[0]);
			//console.log(qna.split(',')[1]	);
			ntfNo = qna.split(',')[0];
			ntfId = qna.split(',')[1];

			$("#n1_code").html("신고할 답변");
			$("#ntfTitle").html(qna.split(',')[2] + "님의 답변");
			$("#n1_code").attr("name", 'KNOWFIT_R');
			option += '<option value="KNOWFIT_R_001" >음란/선정성 답변 </option>';
			option += '<option value="KNOWFIT_R_002" >도배/욕설 답변 </option>';
			option += '<option value="KNOWFIT_R_003" >권리침해(사생활침해/명예훼손/괴롭힘) 답변 </option>';
			option += '<option value="KNOWFIT_R_004" >광고/홍보성 답변 </option>';
			option += '<option value="KNOWFIT_R_005" >불법 정보(도박/사행성) 답변 </option>';
			option += '<option value="KNOWFIT_R_006" >분란 유도 답변 </option>';
			option += '<option value="KNOWFIT_R_007" >불법 촬영물 등 유통 답변 </option>';
			option += '<option value="KNOWFIT_R_008" >기타 </option>';

		}
		$("#n2_code").children().append(option);

	}

	function regNotify() {//신고 등록 눌렀을 때
		if (chkNotify()) {

			$.ajax({
				url : 'fitNotify',
				method : 'GET',
				data : {
					"n1_code" : $("#n1_code").attr("name"),
					"n2_code" : $("#n2_code option:selected").val(),
					"n_sendid" : loginId,
					"n_receiveid" : ntfId,
					"n_content" : $("#ntf_content").val(),
					"n_notifiedno" : ntfNo
				},
				success : function(data) {
					console.log(data);
					if (data != 'failed') {
						alert(data);
					}

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
		} else if ($("#ntf_content").val().length == 0) {
			alert("신고 내용을 작성해주세요");
			return false;
		}

		//빈 칸이 없으면 글쓰기 등록
		return true;
	};
	//session.loginId
	/* $.ajax({
		url:'newFitList',
	    type:'get',
	    data:{'bean':bean,	        
	    },
	    dataType:'json',
	    success:function(data){
	        console.log(data.success);	        
	        
	    },
	    error:function(e){
			console.log(e);
		}); */

	/* 가져온 내용 */

	//내용 글자수 카운트
	var textCount = 0;

	//x를 클릭 했을 때 이미지 삭제하기
	$(document).on("click", ".closeImageWrap", function() {
		$(this).parent().remove();
		changeImgIcon();

		var imgNo = $(this).parent().find("input[type='hidden']").val();
		deleteInputTyleFile(imgNo);
	});

	//x를 클릭 했을 때 동영상 삭제하기
	$(document).on("click", ".closeIframeWrap", function() {
		$(this).parent().remove();
		$("#iframeUrl").val("");
		$("#linkRegister").attr("src", "resources/img/link.png");
	});

	//x를 클릭 했을 때 동영상 삭제하기
	$(document).on("click", ".closeImageWrap", function() {
		$(this).parent().remove();
		changeImgIcon();
	});

	//x를 클릭 했을 때 동영상 삭제하기
	$(document).on("click", ".closeIframeWrap", function() {
		$(this).parent().remove();
		$("#linkRegister").attr("src", "resources/img/link.png");
	});

	//키보드 입력시 문자수를 카운트
	$("#k_content").on("keyup keypress keydown", function() {
		textCount = $("#k_content").val().length;
		$("#textCount").html(textCount);
		if (textCount > 1000) {
			$("#textCountWrap").css({
				"color" : "red"
			});
		} else {
			$("#textCountWrap").css({
				"color" : "gray"
			});
		}
	});

	//등록취소를 눌렀을 때 지식핏 목록으로 이동
	$("#cancel").on("click", function() {
		location.href = "fitMain";
	});

	//모달 닫기 버튼 클릭시 링크에 있는 주소 일부를 추출해서 iframe으로 만들어 주기
	$("#checkBtn")
			.on(
					"click",
					function() {
						var url = $("#link").val();
						console.log(url);

						if (url == '') {
							$("#movieWrap").empty();
							$("#iframeUrl").val('');
						} else {
							if (url.includes('iframe')) {
								url = url.split('embed/')[1].split('"')[0];
								console.log(url);
							} else if (url.includes('watch')) {
								url = url.split('=')[1].split('&')[0];
								console.log(url);
							} else {
								url = url.split('/').reverse()[0];
								console.log(url);
							}

							var content = "";
							content += '<div class="iframeWrap">';
							content += '<iframe width="400" height="300" src="https://www.youtube.com/embed/'+url+'" title="YouTube video player" ';
        	content += 'frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>';
							content += '</iframe>';
							content += '<a href="#" class="closeIframeWrap"><img src="resources/img/close.png" width="20px" height="20px"></a>';
							content += '</div>';

							$("#iframeUrl").val(url);
							$("#movieWrap").empty().html(content);
							$("#linkRegister").attr("src",
									"resources/img/link_green.png");
							$("#link").val('');
						}

					});

	//파일 등록시 이벤트

	/*     $("#photo").on("change",function(e){
	 console.log('썸네일 등록');
	 //썸네일 등록
	 var reader = new FileReader();
	 reader.onload = function(e){
	 var content = "";
	 content += '<div class="imgWrap">';
	 content += '<img src="'+e.target.result+'" width="400px" height="300px">';
	 content += '<a href="#" class="closeImgWrap"><img src="resources/img/close.png" width="20px" height="20px"></a>';
	 content += '</div>';
	
	 $("#imageWrap").empty().html(content);
	 console.log('value',$("#photo").val());
	 console.log('e.target.files',e.target.files);
	 console.log('e.target.result',e.target.result);
	
	 }; 
	 console.log('e.target.files[0]',e.target.files[0]);
	
	 reader.readAsDataURL(e.target.files[0]); 
	
	 }); */

	//파일 등록시 이벤트 (최대 4장)
	$("#photo")
			.on(
					"change",
					function(e) {
						console.log('썸네일 등록');
						if (ansOrUp == 0) {
							//기존의 썸네일을 삭제
							$("#imageWrap").empty();

							//썸네일 등록
							var files = e.target.files;
							console.log(e.target.files);
							console.log(e.target.files.length);

							if (e.target.files.length >= 4) {
								alert("최대 4장까지만 업로드 가능합니다.");
								$("#photo").val("");
							} else {
								//유사배열을 배열로 변환
								var filesArr = Array.prototype.slice
										.call(files);

								filesArr
										.forEach(function(file, index) {

											var reader = new FileReader();

											//파일이름
											console.log('file.name', file.name);
											console.log('file', file);

											var result = '';
											reader.onload = function(e) {

												console.log('e.target.result',
														e.target.result);

												var content = '';
												content += '<div class="imageWrap">';
												content += '<img src="'+e.target.result+'" width="400px" height="300px">';
												content += '<a href="#" class="closeImageWrap"><img src="resources/img/close.png" width="20px" height="20px"></a>';
												content += '<input type="hidden" name="imgNo" value="'
														+ (index + 1) + '">';
												content += '</div>';

												$("#imageWrap").append(content);
											};

											console.log('file', file);
											reader.readAsDataURL(file);

										});

								//아이콘을 초록색으로 변경
								$("#photoRegister").attr("src",
										"resources/img/image_green.png");
							}//end else

						} else if (ansOrUp == 1) {
							//imageWrap에 자식요소가 4개 이상 있을 경우 업로드 막기
							if ($("#imageWrap").children().length >= 4) {
								alert("최대 4장까지만 업로드 가능합니다.");
								$("#photo").val("");
							} else {
								var reader = new FileReader();

								reader.onload = function(e) {

									var content = '';
									content += '<div class="imageWrap">';
									content += '<img src="'+e.target.result+'" width="400px" height="300px">';
									content += '<a href="#" class="closeImageWrap"><img src="resources/img/close.png" width="20px" height="20px"></a>';
									content += '<input type="hidden" name="imgNo" value="'+uploadNo+'">';
									content += '</div>';

									$("#imageWrap").append(content);

									//file 객체 복사 함수
									copyInputTypeFile(uploadNo);

								};

								reader.readAsDataURL(e.target.files[0]);

								//changeImgIcon()를 사용해면 length가 0이 되는 버그가 있어 강제로 초록색을 변경
								$("#photoRegister").attr("src",
										"resources/img/image_green.png");

							}//end else
						}

					});

	//글 등록 전 처리
	function chkForm() {
		if ($("#k_content").val() == "") {
			alert("내용을 입력하세요");
			return false;
		} else if ($("#k_content").val().length > 1000) {
			alert("글자수를 1000자 이하로 작성해주세요");
			return false;
		}

		//빈 칸이 없으면 글쓰기 등록
		return true;
	};

	//이미지가 있냐 없냐에 따라 아이콘의 색을 변경 (1장 이상이면 초록, 없으면 검정)
	function changeImgIcon() {
		var length = $("#imageWrap").children().length;
		console.log("length : ", length);
		if (length > 0) {
			$("#photoRegister").attr("src", "resources/img/image_green.png");
		} else {
			$("#photoRegister").attr("src", "resources/img/image.png");
		}
	}
	//등록한 input type file을 임시 div #fileTemp에 저장하고 id를 부여한 뒤, #uploadFile에 복사본 저장 -> #photo value 비우기
	function copyInputTypeFile(idNo) {
		console.log("copyImputTypeFile 실행");

		//#photo를 #fileTemp에 복사
		$("#fileTemp").append($("#photo").clone());
		//uploadNo로 id를 부여 (나중에 삭제할 때 이 번호를사용)
		$("#fileTemp #photo").attr("id", idNo);
		//uploadNo로 name을 file로 부여
		$("#fileTemp #" + idNo).attr("name", "file");
		//#fileTemp -> #uploadFile로 이동
		$("#uploadFile").append($("#fileTemp #" + idNo));
		console.log("#uploadFile length", $("#uploadFile").children().length);
		//#fileTemp 비우기
		$("#fileTemp").empty();
		//#photo val 비우기
		$("#photo").val("");
		//uploadNo +1하기
		uploadNo++;
		console.log('uploadNo', uploadNo);
	}

	//x버튼을 클릭 했을 때 #uploadFile에 있는 file삭제
	function deleteInputTyleFile(imgNo) {
		console.log("deleteImputTypeFile 실행");
		console.log("imgNo : ", imgNo);

		$("uploadFile #" + imgNo).remove();
	}
</script>
</html>

