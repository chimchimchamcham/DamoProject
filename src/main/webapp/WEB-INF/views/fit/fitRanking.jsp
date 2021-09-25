<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>

</head>
<body>
	 <%-- <c:forEach items="${list}" var="dto">
		<div>
			<span>프로필 사진</span>
			<img 
				<c:if test="${dto.u_fileName eq 'default-profile.png'}">src="resources/img/${dto.u_fileName }"</c:if> 
				<c:if test="${dto.u_fileName ne 'default-profile.png'}">src="/photo/${dto.u_fileName }"</c:if> 
			width="30px" height="30px">
			<span>닉네임 ${dto.u_nick }</span>
			<span>채택수 ${dto.u_chooseCnt }</span>			
		</div>
	 </c:forEach> --%>
	<jsp:include page="../header.jsp"></jsp:include> 
	
	<div class="container">
  		<h1>명예의 전당</h1>
  		
  		<div class="row">
  			<div class="col-sm-8 mx-auto">
  				<div class="mb-2">
  					<span>현재시각기준</span>
  					<c:if test="${myRanking ne null}">
  						<span style="float:right">${sessionScope.loginNick } 님의 순위  : ${myRanking }위</span>
  					</c:if>
  				</div>
  				
  				<table class="table table-hover">
				    <thead>
				      <tr>
				        <th>순위</th>
				        <th>닉네임</th>
				        <th>총 채택수</th>
				      </tr>
				    </thead>
				    <tbody>
				    	<c:forEach items="${list}" var="dto" varStatus="i">
					      <tr>
					        <td>
					        	<c:if test="${i.count eq 1 }"><img src="resources/img/gold_medal.png" width="30px" height="30px"></c:if>
					        	<c:if test="${i.count eq 2 }"><img src="resources/img/silver_medal.png" width="30px" height="30px"></c:if>
					        	<c:if test="${i.count eq 3 }"><img src="resources/img/bronze_medal.png" width="30px" height="30px"></c:if>
					        	<c:if test="${i.count > 3 }"><span <c:if test="${dto.u_id eq sessionScope.loginId }">style="font-weight:700"</c:if>>&nbsp;&nbsp;&nbsp;${i.count }</span></c:if>			        	
					        </td>
					        <td>
					        	<img src="resources/img/${dto.g_fileName }.png" width="30px" height="30px">
								<span <c:if test="${dto.u_id eq sessionScope.loginId }">style="font-weight:700"</c:if>>&nbsp;&nbsp;${dto.u_nick }</span>
					        </td>
					        <td>
					        	<span <c:if test="${dto.u_id eq sessionScope.loginId }">style="font-weight:700"</c:if>>${dto.u_chooseCnt }</span>
					        </td>
					      </tr>
				    	</c:forEach>
				    </tbody>
  				</table>
  			</div>
  		</div>            
	</div>
</body>
<style>
	h1{
		text-align : center;
		position : realtive;
		margin-top : 20px;
	}
	th,td{
		
	}
</style>
<script>

</script>
</html>