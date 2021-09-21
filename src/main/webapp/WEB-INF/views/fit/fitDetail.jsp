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
<style>
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>

	<div id="fitQuestion" class="container mt-3 mb-3 pt-4 pb-4 pl-5 pr-4">

		<div class="d-flex">
			<span id="q">Q.</span> <span class="titleTxt">${bean.k_title }</span>
			<span id="category">${bean.c_name }</span>

		</div>
		<div class="d-inline-flex float-right">
			<button type="button" class="btn btn-primary float-right ml-3 mt-1">신고</button>
		</div>
		<br>
		<div id="qContent">${bean.k_content }</div>
		<br>
		<div id="qPhoto">
			<c:forEach items="${qPhoto }" var="photo">
				<c:if test="${photo.ki_imgYN eq 'Y' }">
					<img class="qImag" src="upload/${ photo.ki_name}"
						alt="${ photo.ki_name}">
				</c:if>
			</c:forEach>
		</div>
		<div id="qVideo">
			<c:forEach items="${qPhoto }" var="link">
				<c:if test="${link.ki_imgYN eq 'N' }">
					<iframe id="video"
						src="https://www.youtube.com/embed/${link.ki_name }"
						title="YouTube video player" frameborder="0"
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe>
				</c:if>
			</c:forEach>
		</div>

		<div class="userInfo">
			<a href="#">${bean.u_id }</a> <img class="userGrade"
				src="resources/img/${bean.g_fileName }.png"
				alt="${bean.g_fileName }"> ${bean.k_date } | 조회수 ${bean.k_view }
		</div>
		<div class="d-inline-flex float-right">
			<button type="button" class="btn btn-primary float-right ml-3 mt-1">
				추가</button>
		</div>
	</div>

	<c:set var="fitId" value="${bean.u_id}" />
	<c:set var="sessionId" value="${sessionScope.loginId}" />
	<c:if test="${fitId ne sessionId }">
		<div id="goAnsForm" class="container mt-3 mb-3 pt-4 pb-4 pl-5 pr-4">
			<div class="row">
				<div id="title" class="col-md-8">
					<h3 class="titleTxt">${sessionScope.loginNick }님,답변해주세요!</h3>
					채택수를 채워서 등급을 올려보세요!
				</div>
				<div id="right" class="col-md-4">
					<button type="button" class="btn btn-primary float-right ml-3 mt-1">답변하기</button>
				</div>
			</div>
		</div>
	</c:if>

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
					<div class="titleTxt">
						<img class="ansGrade" src="resources/img/${ans.g_fileName }.png"
							alt="${bean.g_fileName }"> <a href="#"> ${ans.u_nick }</a>님의
						답변
					</div>
					<!-- 채택된 답변이 없을 때 채택하기 생성 -->
					<c:if test="${bean.k_solutionYN eq 'N' }">
						<button type="button"
							class="btn btn-primary float-right ml-3 mt-1">채택하기</button>
					</c:if>
					<a href="#" class="float-right ml-3 mt-1">신고</a>
					<!-- 답변 내용 -->
					<div class="aContent ">${ans.kR_content }</div>
					<br>
					<div class="aPhoto">${ans.kR_no }
						<c:forEach items="${ aPhoto}" var="photo">
							<c:if
								test="${ans.kR_no eq photo.ki_no &&  photo.ki_imgYN eq 'Y'}">
								<img class="qImag" src="upload/${ photo.ki_name}"
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
					<button type="button" class="btn btn-primary float-right ml-3 mt-1">댓글</button>${ans.kR_date }
				</div>
			</c:if>
			<!-- 채택되지 않은 답변들 -->
			<c:if test="${ans.kR_chooseYN eq 'N' }">
				<div class="ansContainer container mt-3 mb-3 pt-4 pb-4 pl-5 pr-4 ">
					<!-- 답변자 정보 -->
					<div class="titleTxt">
						<img class="ansGrade" src="resources/img/${ans.g_fileName }.png"
							alt="${bean.g_fileName }"> <a href="#"> ${ans.u_nick }</a>님의
						답변
					</div>
					<!-- 채택된 답변이 없을 때 채택하기 생성 -->
					<c:if test="${bean.k_solutionYN eq 'N' }">
						<button type="button"
							class="btn btn-primary float-right ml-3 mt-1">채택하기</button>
					</c:if>
					<a href="#" class="float-right ml-3 mt-1">신고</a>

					<div class="aContent">${ans.kR_content }</div>
					<br>
					<div class="aPhoto">${ans.kR_no }
						<c:forEach items="${ aPhoto}" var="photo">
							<c:if
								test="${ans.kR_no eq photo.ki_no &&  photo.ki_imgYN eq 'Y'}">
								<img class="qImag" src="upload/${ photo.ki_name}"
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

		</c:forEach>

	</c:if>


	<!-- <div id="fitTitle" class="container mt-3 mb-3 pt-4 pb-4 pl-5 pr-4">
		<div class="row">
			<div id="title" class="col-md-8">
				<div class="d-flex">
					<img> <span id="titleTxt"> 운동고수님의 답변</span>
					<button>채택하기</button>

				</div>
				<br>
				<div>이 영상보고 따라해 보세요</div>
				<br>
				<iframe width="560" height="315"
					src="https://www.youtube.com/embed/SZEXsfPwkIU"
					title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>
				<br>
				<div>작성날짜</div>


			</div>
			<div id="titleBtn" class="col-md-4">
				<a href="#">신고</a> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br>
				<button type="button" class="btn btn-primary float-right ml-3 mt-1">댓글
					수</button>
			</div>

		</div>
		<br>
		<div>
            <textarea></textarea>
        </div>
		<div id="comment">
			<br> 댓글 내용을 작성해 주세요 <br> <br> <br> <br> <br>
		</div>
		<div id="comment">
			0/500
			<button>댓글등록</button>
		</div>
		<br> <a href="#">다이어트의 신이 될 거야</a> <a href="#">신고</a> <br> 와
		진짜 도움 많이 되는 영상이네요!!!!!! 작성날짜
		<hr>
		<a href="#">와쩐다</a> <a href="#">수정|삭제</a> <br> 와 진짜 쩔어요! 작성날짜
		<hr>
		<a href="#">운동고수</a> 답변작성자 <a href="#">신고</a> <br> 감사합니다!^^도움이
		되셨다니 기쁘네요! 작성날짜
		<hr>
		<a href="#">와쩐다</a> <a href="#">수정|삭제</a> <br>
		<div id="comment">
			<br> 와 진짜 쩔어요! <br> <br> <br> <br> <br>
		</div>
		<div id="comment">
			0/500
			<button>수정완료</button>
		</div>
	</div>
 -->

</body>

<style>
#fitQuestion {
	border: 1px solid #D8D8D8;
	border-top: 5px solid #0275d8;
	transition: 0.5s;
}

#goAnsForm {
	border: 1px solid #D8D8D8;
	height: 150px;
	/* display: none; */
}

.ansContainer {
	border: 1px solid #D8D8D8;
	height: 150px;
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
}

#a {
	font-size: 2.3rem;
	font-weight: 700;
	color: #5cb85c;
	margin-right: 20px;
}

.titleTxt {
	font-size: 2.3rem;
	font-weight: 700;
	margin-right: 20px;
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

#search {
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
}
</style>
<script>
	//session.loginId
	/* $.ajax({
		url:'newFitList',
	    type:'post',
	    data:{'cnt':cnts,
	        'category':category
	    },
	    dataType:'json',
	    success:function(data){
	        console.log(data.success);	        
	        
	    },
	    error:function(e){
			console.log(e);
		}); */
</script>
</html>

