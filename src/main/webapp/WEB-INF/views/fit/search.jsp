<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>검색결과</title>
<style>

.card-body{
	cursor: pointer;
}

.card-body:hover{
	background:gray;
	cursor: pointer;
}

.hidden{
	display: none !important;
	}

</style>
</head>
<body>

<jsp:include page="../header.jsp"></jsp:include>
<div class="d-flex p-5">
	<div class="container mx-auto my-5">
		<div class="row d-flex justify-content-center align-content-center">
			<div class="col-12 text-center">"${whatcherch}"검색 결과 총 ${allcnt}건</div>
			<button class="col-1 btn btn-outline-primary active rounded-pill mr-2 px-1">전체</button>
			<button class="col-1 btn btn-outline-primary rounded-pill px-1">제목</button>
			<button class="col-1 btn btn-outline-primary rounded-pill ml-2 px-1">내용</button>
		</div>
		
		<div class="row d-flex flex-column titleallcard">
			<h6 class="col-12 mt-3">제목  ${titlecnt}건</h6>
			<div class="card-group row">
				<div class="card col-12">
				<c:choose>
					<c:when test="${title ne null}">
						<c:forEach items="${title}" var="link">
							<div class="card-body" onclick="goknowpage(${link.k_no})">					
								<div class="card-title d-flex flex-row"><h3 class="text-primary">Q</h3><div class="align-self-center">${link.k_title}</div></div>
								<div class="card-text">${link.k_content}</div>
								<hr>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
							<div class="card-body">					
								<div class="card-text">검색한 결과가 없습니다</div>
							</div>
	   				</c:otherwise>
				</c:choose>	
				</div>
			</div>
		</div>
		
		<div class="row d-flex flex-column contentallcard">
			<h6 class="col-12 mt-5">내용 ${contentcnt}건</h6>
			<div class="card-group row">
				<div class="card col-12">
				<c:choose>
					<c:when test="${maincontent ne null}">
						<c:forEach items="${maincontent}" var="link">
							<div class="card-body" onclick="goknowpage(${link.k_no})">					
								<div class="card-title d-flex flex-row"><h3 class="text-primary">Q</h3><div class="align-self-center">${link.k_title}</div></div>
								<div class="card-text">${link.k_content}</div>
								<hr>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
							<div class="card-body">					
								<div class="card-text">검색한 결과가 없습니다</div>
							</div>
	   				</c:otherwise>
				</c:choose>	
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script>

//무한 스크롤을 실행 시킨 횟수, 목록을 불러올 때 마다 +1씩 증가한다 버튼을 바꾸면 초기화
var cnt = 1;
//목록을 불러올 카테고리
var category = '전체';
var whatsherch = '${whatcherch}';

//처음에 눌렀을때
$(document).on('click','button',function(){
	$('button').removeClass('active');
	$(this).addClass('active');
	
	var clickbtn = $(this).text();
	console.log("clickbtn",clickbtn);
	
	if (clickbtn=='전체') {
		location.href = 'search'+'?content='+'${whatcherch}';
		cnt = 1;
		category = '전체';
		
	}else if(clickbtn=='제목') {
		$('div.titleallcard').empty();		
		$('div.contentallcard').empty();
		cnt = 1;
		category = '제목';
		sherch = whatsherch;
		
		newserchListCall(sherch,cnt,category);
	}else if(clickbtn=='내용'){		
		$('div.contentallcard').empty();
		$('div.titleallcard').empty();
		cnt = 1;
		category = '내용';
		sherch = whatsherch;
		
		newserchListCall(sherch,cnt,category);
	}	
});

//제목 목록을 불러오는 함수 (페이징처리를 위한 cnt, 카테고리)
function newserchListCall(sherch,cnt,category){
	
	
	$.ajax({
		url:'./serching/searchlist',
	    type:'post',
	    data:{'whatcherch':sherch,
	    	'cnt':cnt,
	        'category':category
	    },
	    dataType:'json',
	    success:function(data){
	        console.log(data.list);
	        console.log(data.listSize);
	        console.log(data.category);
	    },
	    error:function(e){
			console.log(e);
		}
	});
}




function goknowpage(k_no){
	var content = k_no;
	location.href ='/damo/fitDetail?k_no='+content;
}

</script>
</html>