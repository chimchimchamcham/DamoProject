<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	<div id="fitTitle" class="container mt-3 mb-3 pt-4 pb-4 pl-5 pr-4">
		<div class="row">
			<div id="title" class="col-md-8">
				<div class="d-flex">
					<span id="q">Q.</span> <span id="titleTxt"> 제 자세 좀 봐주세요!</span> <span
						id="category">자세교정</span>

				</div>
				<br>
				<div>스쿼트 하는데 너무 무릎이 아파서요.. 자세 교정 좀 부탁드립니다!</div>
				<br>
				<iframe width="560" height="315"
					src="https://www.youtube.com/embed/SZEXsfPwkIU"
					title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>
				<br>
				<div>
					<a href="#">다모(회원이름)</a> / 회원등급 아이콘 / 등록날짜 | 조회수
				</div>
			</div>
			<div id="titleBtn" class="col-md-4">
				<button type="button" class="btn btn-primary float-right ml-3 mt-1">신고</button>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br>
				<button type="button" class="btn btn-primary float-right ml-3 mt-1">지식핏
					추가</button>
			</div>

		</div>
	</div>

	<div id="fitContent" class="container pt-4 pl-5">
		<div class="row">
			<div id="title" class="col-md-8">
				<h3>운동고수님, 답변해주세요!</h3>
				채택수를 채워서 등급을 올려보세요!
			</div>
			<div id="titleBtn" class="col-md-4">
				<button type="button" class="btn btn-primary float-right ml-3 mt-1">답변하기</button>


			</div>
		</div>
	</div>

	<div id="fitTitle" class="container mt-3 mb-3 pt-4 pb-4 pl-5 pr-4">
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
				<a href="#">신고</a> <br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<button type="button" class="btn btn-primary float-right ml-3 mt-1">댓글
					수</button>
			</div>

		</div>
		<br>
		<!--<div>
            <textarea></textarea>
        </div>-->
		<div id="comment">
			<br> 댓글 내용을 작성해 주세요 <br>
			<br>
			<br>
			<br>
			<br>
		</div>
		<div id="comment">
			0/500
			<button>댓글등록</button>
		</div>
		<br> <a href="#">다이어트의 신이 될 거야</a> <a href="#">신고</a> <br> 와 진짜 도움 많이 되는
		영상이네요!!!!!! 작성날짜
		<hr>
		<a href="#">와쩐다</a> <a href="#">수정|삭제</a> <br> 와 진짜 쩔어요! 작성날짜
		<hr>
		<a href="#">운동고수</a> 답변작성자 <a href="#">신고</a> <br> 감사합니다!^^도움이 되셨다니 기쁘네요!
		작성날짜
		<hr>
		<a href="#">와쩐다</a> <a href="#">수정|삭제</a> <br>
		<div id="comment">
			<br> 와 진짜 쩔어요! <br>
			<br>
			<br>
			<br>
			<br>
		</div>
		<div id="comment">
			0/500
			<button>수정완료</button>
		</div>
	</div>


</body>

<style>
#fitTitle {
	border: 1px solid #D8D8D8;
	border-top: 5px solid #0275d8;
	transition: 0.5s;
}

#fitContent {
	border: 1px solid #D8D8D8;
	height: 150px;
}

#fitTitle .row {
	vertical-align: middle;
}

#q {
	font-size: 2.3rem;
	font-weight: 700;
	color: #0275d8;
	margin-right: 20px;
}

#titleTxt {
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
</style>
<script>
	
</script>
</html>

