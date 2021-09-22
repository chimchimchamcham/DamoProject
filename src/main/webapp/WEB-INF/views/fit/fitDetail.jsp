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
<body>
	<jsp:include page="../header.jsp"></jsp:include>

	<div id="fitQuestion" class="container mt-3 mb-3 pt-4 pb-4 pl-5 pr-4">

		<div class="">
			<span id="q">Q.</span> <span class="titleTxt">${bean.k_title }</span>
			<span id="category">${bean.c_name }</span>

			<c:set var="fitId" value="${bean.u_id}" />
			<c:set var="sessionId" value="${sessionScope.loginId}" />
			<!-- 유저와 글 작성자가 다를 경우 -->
			<c:if test="${fitId ne sessionId }">
				<div class="d-inline-flex float-right">
					<a href="#" class="notify float-right ml-3 mt-1">신고</a>
				</div>
			</c:if>
			<c:if test="${fitId eq sessionId }">
				<div class="d-inline-flex float-right">
					<a href="fitUpdateForm?k_no=${bean.k_no }" id="qUpd"
						class="upd float-right mr-1 mt-1">수정</a> |<a
						href="fitDelete?k_no=${bean.k_no }" id="qDel"
						class="del float-right ml-1 mt-1">삭제</a>
				</div>
			</c:if>
		</div>
		<br>
		<div id="qContent">${bean.k_content }</div>
		<br>
		<div id="qPhoto">
			<c:forEach items="${qPhoto }" var="photo">
				<c:if test="${photo.ki_imgYN eq 'Y' }">
					<img class="qImag" src="/photo/${ photo.ki_name}"
						alt="${ photo.ki_name}">
				</c:if>
			</c:forEach>
		</div>
		<c:forEach items="${qPhoto }" var="link">
			<c:if test="${link.ki_imgYN eq 'N' }">
				${ link.ki_name}
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


		<div class="userInfo">
			<a href="#">${bean.u_id }</a> <img class="userGrade"
				src="resources/img/${bean.g_fileName }.png"
				alt="${bean.g_fileName }"> ${bean.k_date } | 조회수 ${bean.k_view }
			<div class="d-inline-flex float-right">
				<button type="button" class="btn btn-primary float-right ml-3 mt-1">
					추가</button>
			</div>
		</div>

	</div>

	<!-- 유저와 글 작성자가 다를 경우 -->
	<c:set var="loop_flag" value="false" />
	<c:if test="${fitId ne sessionId }">
		<c:if test="${bean.k_replyCnt ne '0' }">
			<!-- 답변을 작성한 유저인지 확인 -->
			<c:forEach items="${answer}" var="ans">
				<c:if test="${ans.u_id eq sessionId and ans.kR_blindYN eq 'N'}">
					<c:set var="loop_flag" value="true" />
				</c:if>
			</c:forEach>
		</c:if>
		<c:if test="${bean.k_replyCnt eq '0' }">
			<c:set var="loop_flag" value="false" />
		</c:if>
		<%-- <c:if test="${loop_flag eq 'false'}">
			
		</c:if> --%>
	</c:if>
	<div id="goAnsForm" class="container mt-3 mb-3 pt-4 pb-4 pl-5 pr-4">
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

					<!-- 동영상 url추출 저장 -->
					<input type="hidden" name="url" id="iframeUrl">

					<!-- 빈칸-->
					<div id="emptyWrap"></div>
				</div>
			</form>
		</div>
	</div>
	<%-- 	</c:if>
	</c:if> --%>

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
							href="#"> ${ans.u_nick }</a>님의 답변</span> <a href="#"
							class="notify float-right ml-3 mt-1">신고</a>
					</div>
					<!-- 답변 내용 -->
					<div class="aContent ">${ans.kR_content }</div>
					<br>
					<div class="aPhoto">${ans.kR_no }
						<c:forEach items="${ aPhoto}" var="photo">
							<c:if
								test="${ans.kR_no eq photo.ki_no &&  photo.ki_imgYN eq 'Y'}">
								<img class="aImag" src="upload/${ photo.ki_name}"
									alt="${ photo.ki_name}">
							</c:if>
						</c:forEach>
					</div>
					<div id="qVideo">
						<c:forEach items="${aPhoto }" var="link">
							<c:if test="${ans.kR_no eq photo.ki_no && link.ki_imgYN eq 'N' }">
								<iframe id="video"
									src="https://www.youtube.com/embed/${link.ki_name }"
									title="YouTube video player" frameborder="0"
									allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
									allowfullscreen></iframe>
							</c:if>
						</c:forEach>
					</div>
					<div>${ans.kR_date }</div>
					<button type="button" class="btn btn-primary float-right ml-3 mt-1">댓글</button>
				</div>
			</c:if>
			<!-- 채택되지 않은 답변들 -->

			<c:if test="${ans.kR_chooseYN eq 'N' and ans.kR_blindYN eq 'N'}">
				<div class="ansContainer container mt-3 mb-3 pt-4 pb-4 pl-5 pr-4 ">
					<!-- 답변자 정보 -->
					<div class="hhh">

						<img class="ansGrade" src="resources/img/${ans.g_fileName }.png"
							alt="${bean.g_fileName }"> <span class="titleTxt ml-2"><a
							href="#"> ${ans.u_nick }</a>님의 답변</span>
						<!-- 채택된 답변이 없을 때 채택하기 생성 -->
						<c:if test="${bean.k_solutionYN eq 'N' && bean.u_id eq sessionId}">
							<button type="button" class="btn btn-primary" name="${ans.kR_no}"
								onclick="selectAns(this)">채택하기</button>
						</c:if>

						<c:if test="${ans.u_id ne sessionId}">
							<a href="#" class="notify float-right ml-3 mt-1">신고</a>
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
						<c:forEach items="${ aPhoto}" var="photo">
							<c:if
								test="${ans.kR_no eq photo.ki_no &&  photo.ki_imgYN eq 'Y'}">
								<img class="aImag" src="/photo/${ photo.ki_name}"
									alt="${ photo.ki_name}">
							</c:if>
						</c:forEach>
					</div>
					<div id="aVideo">
						<c:forEach items="${aPhoto }" var="link">
							<c:if test="${ans.kR_no eq photo.ki_no && link.ki_imgYN eq 'N' }">
								<iframe id="video"
									src="https://www.youtube.com/embed/${link.ki_name }"
									title="YouTube video player" frameborder="0"
									allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
									allowfullscreen></iframe>
							</c:if>
						</c:forEach>
					</div>
					<div class="container mt-2">
						${ans.kR_date }
						<button type="button"
							class="btn btn-primary float-right ml-3 mt-1">댓글</button>${ans.kR_cmtCnt }
					</div>
				</div>
			</c:if>

		</c:forEach>

	</c:if>

</body>

<style>
#fitQuestion {
	border: 1px solid #D8D8D8;
	border-top: 5px solid #0275d8;
	transition: 0.5s;
}

#goAnsForm {
	border: 1px solid #D8D8D8;
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
	font-size: 2.3rem;
	font-weight: 700;
	margin-right: 20px;
	vertical-align: middle;
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
	width: 120px;
	vertical-align: middle;
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
	padding-left: 210px;
	font-weight: 500;
}

#modalBody {
	text-align: center;
}

#modalContent {
	position: relative;
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

#photo {
	display: none;
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

#modalTitle {
	padding-left: 210px;
	font-weight: 500;
}

#modalBody {
	text-align: center;
}

#modalContent {
	position: relative;
}

.imgWrap {
	width: 440px;
	height: 300px;
	margin: 5px;
	position: relative;
}

.closeImgWrap {
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
</style>
<script type="text/javascript">
	//console.log(${bean.k_solutionYN});
	var loginId = "${sessionScope.loginId}";
	var writerId = "${bean.u_id}";
	var kNo = "${bean.k_no}";
	var flag = '<c:out value="${loop_flag}"/>';//글 작성자가 아니고, 답변한 유저이면 true
	//console.log(loginId);
	//console.log(typeof(loginId));
	var myAnswer;
	var content;
	var formName = document.fitAnsWrite;
	var ansNo;

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

	//flag 값에 따라 답변하기 감춘다
	function hideAnsForm() {
		console.log(flag);
		//console.log(typeof(flag));
		if (flag=='true') {
			$("#goAnsForm").css({
				"display" : "none"
			});
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

		if (flag=='true') {//답변글 수정을 눌렀을 경우			
			$("#right")
					.append(
							'<button type="submit" class="btn ans btn-primary float-right ml-3 mt-1" onclick="ansUpdate()">답변수정</button>');
			$("#right")
					.append(
							'<button type="button" class="btn ans btn-outline-primary float-right ml-3 mt-1" onclick="closeAnsForm()">수정취소</button>');
		} else {//답변하기를 눌렀을 경우
			$("#right")
					.append(
							'<button type="submit" class="btn ans btn-primary float-right ml-3 mt-1" onclick="ansWrite()">답변등록</button>');
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
		if (flag=='true') {//수정취소
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
		formName.action = "fitAnsUpdate?kr_no=" + ansNo + "&k_no=" + kNo;
		formName.method = "post";
		formName.enctype = "multipart/form-data"
		formName.submit();
	}

	function ansWrite() {
		$("form").submit();
	}

	//답변 채택하기
	function selectAns(e) {
		//console.log($(e).attr('name'));

	}

	//수정 버튼을 눌렀을 경우
	function updateAns(e) {
		$("#goAnsForm").css({
			"display" : "block"
		});//답변하기 div 나타내기
		openAnsForm();//답변 작성 form 나타내기
		myAnswer = $(e).parents("div");//작성한 답변 div 변수에 저장
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
		var img = myAnswer.find(".aPhoto img");
		while (img.length != 0) {
			//console.log(img.attr("alt"));
			content += '<div class="imgWrap">';
			content += '        <img src="/photo/' + img.attr("alt")
					+ '" width="400px" height="300px"> <!-- 이미지 4장까지 -->';
			content += '        <a href="#" class="closeImgWrap"><img src="resources/img/close.png" width="20px" height="20px"></a>';
			content += '        <input type="hidden" name="imgNo" value="'
					+ img.attr("alt") + '">';
			content += '	</div>';
			img = img.next();
		}
		$("#imageWrap").empty().html(content);

		myAnswer.css({
			"display" : "none"
		});//답변 숨기기
		/* myAnswer.css({
			"display" : "block"
		}); */

	}

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

	//x를 클릭 했을 때 동영상 삭제하기
	$(document).on("click", ".closeImgWrap", function() {
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
							url = url.split('=')[1].split('&')[0]

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

						//기존의 썸네일을 삭제
						$("#imageWrap").empty();

						//썸네일 등록
						var files = e.target.files;
						console.log(e.target.files);
						console.log(e.target.files.length);

						if (e.target.files.length >= 5) {
							alert("최대 4장까지만 업로드 가능합니다.");
							$("#photo").val("");
						} else {
							//유사배열을 배열로 변환
							var filesArr = Array.prototype.slice.call(files);

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
											content += '<div class="imgWrap">';
											content += '<img src="'+e.target.result+'" width="400px" height="300px">';
											content += '<a href="#" class="closeImgWrap"><img src="resources/img/close.png" width="20px" height="20px"></a>';
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

					});

	//글등록 전 처리
	$("#submit").click(function() {
		if ($("#k_content").val() == "") {
			alert("내용을 입력하세요");
			return false;
		} else if ($("#k_content").val().length > 1000) {
			alert("글자수를 1000자 이하로 작성해주세요");
			return false;
		}

		//빈 칸이 없으면 글쓰기 등록
	});

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
</script>
</html>

