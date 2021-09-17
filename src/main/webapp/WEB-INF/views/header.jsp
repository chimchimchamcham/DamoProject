<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

<title>Insert title here</title>

</head>
<body>
	${cursor}
	<div class="sticky-top">
		<!-- Topbar -->
		<nav
			class="navbar navbar-expand navbar-dark bg-primary topbar mb-0 static-top mr-0"
			style="height: 35px;">
			<div class="container">
				<!-- Topbar Navbar -->
				<ul class="navbar-nav ml-auto">

					<!-- 로그인 되어있을 경우 -->
					<c:if test="${loginId ne null}">
					
						<!-- 로그인 되어있고 일반 회원일 경우 -->
						<c:if test="${loginManager eq 'N'}">
							<!-- 알람 -->
							<li class="nav-item dropdown no-arrow mx-1 active"><a
							class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-bell fa-fw mr-0"></i>

								<!-- 알람 갯수 --> <span class="badge badge-danger badge-counter"
								style="margin-left: -10px; font-size: 10px;">3</span>
								
								<!-- 알람 목록 -->
						</a> 
							<div
								class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="alertsDropdown">
								<h6 class="dropdown-header">
									<b>알람</b> 3
								</h6>
								<div class="card-body p-1 mt-0">
									<div class="custom-scrollbar-css p-1"
										style="border: 0px; height: 300px; width: 450px;">

										<!-- 중요알람 (운영자 알람)-->
										<div
											class="alert alert-danger alert-dismissible fade show ml-1 mr-1">
											<button type="button" class="close" data-dismiss="alert">&times;</button>
											<strong>Danger!</strong> This alert box could indicate a
											dangerous or potentially negative action.
										</div>

										<!-- 일반알람-->
										<a class="dropdown-item d-flex align-items-center p-2"
											href="fitMain">
											<div>
												<div class="small text-gray-500">December 12, 2019</div>
												<span class="font-weight-bold">A new monthly report
													is ready to download!</span>
											</div>
										</a> <a class="dropdown-item d-flex align-items-center p-2"
											href="#">
											<div>
												<div class="small text-gray-500">December 12, 2019</div>
												<span class="font-weight-bold">A new monthly report
													is ready to download!</span>
											</div>
										</a> <a class="dropdown-item d-flex align-items-center p-2"
											href="#">
											<div>
												<div class="small text-gray-500">December 12, 2019</div>
												<span class="font-weight-bold">A new monthly report
													is ready to download!</span>
											</div>
										</a> <a class="dropdown-item d-flex align-items-center p-2"
											href="#">
											<div>
												<div class="small text-gray-500">December 12, 2019</div>
												<span class="font-weight-bold">A new monthly report
													is ready to download!</span>
											</div>
										</a> <a class="dropdown-item d-flex align-items-center p-2"
											href="#">
											<div>
												<div class="small text-gray-500">December 12, 2019</div>
												<span class="font-weight-bold">A new monthly report
													is ready to download!</span>
											</div>
										</a>
									</div>
								</div>
							</div></li>
						</c:if>

						<!-- 회원 정보 -->
						<li class="nav-item dropdown no-arrow active">
						<a class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<span class="mr-2 d-none d-lg-inline text-gray-600 small">${sessionScope.loginNick} 님</span>
							<c:if test="${loginFile eq 'default-profile.png'}">
								<img class="img-profile rounded-circle" src="resources/img/default-profile.png" width="23px;">
							</c:if>
							<c:if test="${loginFile ne 'default-profile.png'}">
								<img class="img-profile rounded-circle" src="/photo/${loginFile}" width="23px;">
							</c:if>
							
						</a> <!-- 회원 드롭메뉴 -->
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown" style="font-size: 14px;">

								<!-- 회원만 나타나는 메뉴 -->
								<c:if test="${loginManager ne 'Y'}">
									<a class="dropdown-item" href="logout"> <i
										class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 마이 페이지
									</a>
								<div class="dropdown-divider"></div>
								</c:if>
								<a class="dropdown-item" href="logout"> <i
									class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									로그아웃
								</a>
							</div>
					</c:if>

					<!-- 로그인 안 되어있을 경우(로그인 버튼) -->
					<c:if test="${loginId eq null}">
						<li><a class="nav-link" href="Gologin" id="userDropdown"
							role="button"> <span
								class="mr-2 d-none d-lg-inline text-white-600 small">로그인</span>
						</a></li>
					</c:if>
				</ul>
			</div>
		</nav>
		<!-- End of Topbar -->
		
		
		<!-- 메인 메뉴 -->
		<nav class="navbar navbar-expand-lg navbar-light bg-white shadow"
			style="height: 50px;">
			<div class="container">
				<a class="navbar-brand" href="./"><img
					src="resources/img/logo4.png" alt="Logo" style="width: 80px;"
					id="logo"></a>

				<div class="collapse navbar-collapse" id="navb"
					style="font-size: 15px;">
					<ul class="navbar-nav ml-auto">
					
						<c:if test="${loginManager eq 'Y'}"><!-- 관리자 일 경우 -->
							<li class="nav-item" style="margin-left: 40px;"><a
								class="nav-link" href="javascript:void(0)">관리 페이지</a></li>
						</c:if>
						<c:if test="${loginManager ne 'Y'}"> <!-- 일반회원 -->
						<li class="nav-item" style="margin-left: 40px;"><a
							class="nav-link" href="javascript:void(0)">캘린더</a></li>	
						<li class="nav-item" style="margin-left: 40px;"><a
							class="nav-link" href="javascript:void(0)">통계 그래프</a></li>
						</c:if>
						<li class="nav-item dropdown justify-content-center"><a
							class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
							style="margin-left: 40px; margin-right: 60px;" id="dropdown">지식Fit</a>
							<div class="dropdown-menu" style="font-size: 14px;"
								id="dropdown-menu">
								<a class="dropdown-item text-muted mt-1" href="fitMain">지식Fit</a>
								<a class="dropdown-item text-muted mt-1" href="#">명예의 전당</a>
								<c:if test="${loginManager ne 'Y'}"> <!-- 일반회원 -->
								<a
									class="dropdown-item text-muted mt-1" href="fitWriteForm">질문하기</a>
								<a class="dropdown-item text-muted mt-1 mb-1" href="logout">내 지식사전</a>
								</c:if>
							</div></li>
					</ul>

					<!--searchBar-->
					<form class="form-inline my-2 my-lg-0">
						<input class="form-control" type="text"
							placeholder="지식Fit 제목/내용 검색..." id="search"
							style="font-size: 12px; width: 200px;">
						<button class="btn btn-white" type="button">
							<i class="fas fa-search" aria-hidden="true"></i>
						</button>
					</form>

				</div>

			</div>
		</nav>
	</div>
           
</body>
<style>
/* 폰트 설정 (나눔 스퀘어) */
 @import url('https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css');
*{ font-family:'Nanum-Square',sans-serif;}

#logo:hover {
	opacity: 0.8;
	cursor: pointer;
}

#search {
	border: 0px;
	border-bottom: 1px solid gray;
	border-radius: 0px;
}


/*알람 스크롤 바*/
.custom-scrollbar-js, .custom-scrollbar-css {
	height: 200px;
}

/* Custom Scrollbar using CSS */
.custom-scrollbar-css {
	overflow-y: scroll;
}

/* scrollbar width */
.custom-scrollbar-css::-webkit-scrollbar {
	width: 5px;
}

/* scrollbar track */
.custom-scrollbar-css::-webkit-scrollbar-track {
	background: #eee;
}

/* scrollbar handle */
.custom-scrollbar-css::-webkit-scrollbar-thumb {
	border-radius: 1rem;
	background-color: #00d2ff;
	background-image: linear-gradient(to top, #00d2ff 0%, #3a7bd5 100%);
}
</style>
<script type="text/javascript">
	var loginId="${sessionScope.loginManager}";
	var loginFile="${sessionScope.loginFile}";
	var loginNick="${sessionScope.loginNick}";
	var loginManager="${sessionScope.loginManager}";
</script>

</html>