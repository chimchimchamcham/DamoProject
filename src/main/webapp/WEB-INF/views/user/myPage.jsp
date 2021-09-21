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
#body_myPage{
	background-color:#EAEAED;

}

#all_myPage{
	background-color:#EAEAED;	
	
	/*margin:0px;*/
}
#userInfo{
	margin-top:30px;
	width:445px;
	height:800px;
}
#fitSection{
	margin-top:30px
}
</style>

</head>
<body id="body_myPage">
<jsp:include page="../header.jsp"></jsp:include>
<div class="container" id="all_myPage" style="width:1440px">
	  <div class="row" style="width:1140px">
	    <div class="col-5"  id="userInfo" >
	      <div class="container" style="width:445px; background-color:white">
	      	<div class="row">
	      		<div class="col-12" id="profile_img" style="width:200px; display:flex; height:300px; padding:50px 125px; ">
	      			 <img src="resources/img/default-profile.png" id="img_form_url" class=" rounded-circle">
	      		</div>
	      	</div>
	      	<div class="row">
	      		<div class="col-3"></div>
	      		<div class="col-6" style="text-align:center"><span id="nickName" style="font-weight:bold; font-size:35px; ">다모</span></div>
	      		<div class="col-3" style="text-align:center; display:flex;padding-top:10px"><button type="btn" class="btn btn-secondary" style="height:35px; ">수정</button></div>
	      	</div>
	      	<div class="row">
	      		<div class="col-4"><img src="resources/img/level3.png"></div>
	      	</div>
	      </div>
	      
	    </div>
	    <div class="col-7" id="fitSection" style="height:800px">
	    	<div class="cotainer" style="height:150px; width:635px; background-color:white; padding:45px 25px" id="fitStatistics">
	    	<div class="row">
	    		<div class="col-3" style="text-align:center; padding:0; font-size:20px; color:gray">질문 수</div>
	    		<div class="col-3" style="text-align:center; padding:0; font-size:20px; color:gray">답변 수</div>
	    		<div class="col-3" style="text-align:center; padding:0; font-size:20px; color:blue">채택 수</div>
	    		<div class="col-3" style="text-align:center; padding:0; font-size:20px; color:red">채택률</div>
	    		</div>
	    		<div class="row">
	    		<div class="col-3" style="text-align:center; padding:0; font-size:20px; font-weight:bold"><span id="questionCnt"> 209</span>개</div>
	    		<div class="col-3" style="text-align:center; padding:0; font-size:20px; font-weight:bold"><span id="replyCnt"> 152</span>개</div>
	    		<div class="col-3" style="text-align:center; padding:0; font-size:20px; font-weight:bold"><span id="choosCnt"> 108</span>개</div>
	    		<div class="col-3" style="text-align:center; padding:0; font-size:20px; font-weight:bold"><span id="choosPercent"> 71</span>%</div>
	    		</div>
	    	</div>
	      
	    </div>
	  </div>
</div>
</body>

</html>