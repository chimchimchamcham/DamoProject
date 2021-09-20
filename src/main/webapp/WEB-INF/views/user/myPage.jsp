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
#userInfo{
	background-color:red;
}
#fitStatistics{
	background-color:yellow;
}
</style>

</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="container">
	  <div class="row">
	    <div class="col-5"  id="userInfo" style="height:800px">
	      <h2>왼쪽</h2>
	    </div>
	    <div class="col-7" id="fitStatistics" style="height:800px">
	    
	      <h2>오른쪽</h2>
	    </div>
	  </div>
</div>
</body>

</html>