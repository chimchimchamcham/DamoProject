<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
	<!-- 알람 -->
	<li class="nav-item dropdown no-arrow mx-1 active"><a
		class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
		role="button" data-toggle="dropdown" aria-haspopup="true"
		aria-expanded="false"> <i class="fas fa-bell fa-fw mr-0"></i> <!-- 알람 갯수 -->
			<span class="badge badge-danger badge-counter"
			style="margin-left: -10px; font-size: 10px;">3</span> <!-- 알람 목록 -->
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
						class="alert alert-danger alert-dismissible fade show ml-1 mr-1" style="font-size: 14px;">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<strong>게시글 제지 알람</strong><br/>작성하신 글이 관리자에 의해 제지 당하였습니다.<br/>
						“물어보고 싶은 게 있는데요 이거 어떻게 된건가요?”
					</div>

					<!-- 일반알람-->
					<a class="dropdown-item d-flex align-items-center p-2"
						href="fitMain">
						<div>
							<div class="small text-gray-500">2021.09.26</div>
							<span class="font-weight-bold" style="font-size: 14px;">작성하신 질문에 답변이 달렸습니다.<br/>
						“물어보고 싶은 게 있는데요 이거 어떻게 된건가요?”
						</span>
						</div>
					</a> <a class="dropdown-item d-flex align-items-center p-2" href="#">
						<div style="opacity:0.3;">
							<div class="small text-gray-500">2021.09.26</div>
							<span class="font-weight-bold" style="font-size: 14px;">축하합니다!<br/>
						회원님의 등급이 [주황아령]으로 승급 되었습니다.
						</span>
						</div>
					</a> <a class="dropdown-item d-flex align-items-center p-2" href="#">
						<div style="opacity:0.3;">
							<div class="small text-gray-500">2021.09.25</div>
							<span class="font-weight-bold" style="font-size: 14px;">작성하신 답변이 채택되었습니다.<br/>
							"제 운동자세 좀 봐주실분 있나요? 부탁 드립니다!"</span>
						</div>
					</a> <a class="dropdown-item d-flex align-items-center p-2" href="#">
						<div style="opacity:0.3;">
							<div class="small text-gray-500">2021.09.25</div>
							<span class="font-weight-bold" style="font-size: 14px;">작성하신 답변이 채택되었습니다.<br/>
							"안녕하세요? 제가 다이어트 식단을 짰는데 혹시 고구마 칼로리..."</span>
						</div>
					</a>
				</div>
			</div>
		</div></li>
</body>
<script>
var loginId = "${sessionScope.loginId}";
</script>
</html>