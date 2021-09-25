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
						class="alert alert-danger alert-dismissible fade show ml-1 mr-1">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<strong>Danger!</strong> This alert box could indicate a dangerous
						or potentially negative action.
					</div>

					<!-- 일반알람-->
					<a class="dropdown-item d-flex align-items-center p-2"
						href="fitMain">
						<div>
							<div class="small text-gray-500">December 12, 2019</div>
							<span class="font-weight-bold">A new monthly report is
								ready to download!</span>
						</div>
					</a> <a class="dropdown-item d-flex align-items-center p-2" href="#">
						<div>
							<div class="small text-gray-500">December 12, 2019</div>
							<span class="font-weight-bold">A new monthly report is
								ready to download!</span>
						</div>
					</a> <a class="dropdown-item d-flex align-items-center p-2" href="#">
						<div>
							<div class="small text-gray-500">December 12, 2019</div>
							<span class="font-weight-bold">A new monthly report is
								ready to download!</span>
						</div>
					</a> <a class="dropdown-item d-flex align-items-center p-2" href="#">
						<div>
							<div class="small text-gray-500">December 12, 2019</div>
							<span class="font-weight-bold">A new monthly report is
								ready to download!</span>
						</div>
					</a> <a class="dropdown-item d-flex align-items-center p-2" href="#">
						<div>
							<div class="small text-gray-500">December 12, 2019</div>
							<span class="font-weight-bold">A new monthly report is
								ready to download!</span>
						</div>
					</a>
				</div>
			</div>
		</div></li>
</body>
<script>
var loginId = "${sessionScope.loginId}";
/*
$.ajax({
	type:'GET',
	url:'alarmList',
	data:{"loginId":loginId},
	dataType:'JSON',
	success:function(data){
		console.log(data);
	},
	error:function(e){
		console.log(e);
	}
	
});*/
</script>
</html>