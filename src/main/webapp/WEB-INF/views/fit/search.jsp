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
</style>
</head>
<body>
<div class="d-flex p-5">
	<div class="container mx-auto my-5">
		<div class="row d-flex justify-content-center align-content-center">
			<div class="col-12 text-center">"content"검색 결과 총 cnt건</div>
			<button class="col-1 btn btn-outline-primary active rounded-pill mr-2 px-1">전체</button>
			<button class="col-1 btn btn-outline-primary rounded-pill px-1">제목</button>
			<button class="col-1 btn btn-outline-primary rounded-pill ml-2 px-1">내용</button>
		</div>
		
		<div class="row d-flex flex-column">
			<h6 class="col-12 mt-3">제목 cnt건</h6>
			<div class="card-group row">
				<div class="card col-12">
				<c:choose>
					<c:when test="${title ne null }">
						<c:forEach items="${title}" var="link">
							<div class="card-body">					
								<div class="card-title d-flex flex-row"><h3 class="${link.k_no}">Q</h3><div class="align-self-center">${link.k_title}</div></div>
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
		
		<div class="row d-flex flex-column">
			<h6 class="col-12 mt-5">내용 cnt건</h6>
			<div class="card-group row">
				<div class="card col-12">
				<c:choose>
					<c:when test="${maincontent ne null}">
						<c:forEach items="${maincontent}" var="link">
							<div class="card-body">					
								<div class="card-title d-flex flex-row"><h3 class="${link.k_no}">Q</h3><div class="align-self-center">${link.k_title}</div></div>
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


$(document).on('click','button',function(){
	$('button').removeClass('active');
	$(this).addClass('active');
});





</script>
</html>