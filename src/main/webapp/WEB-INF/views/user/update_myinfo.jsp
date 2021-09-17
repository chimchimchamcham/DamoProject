<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

  <link href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/css/bootstrap4-toggle.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/js/bootstrap4-toggle.min.js"></script>

<title>Insert title here</title>
<style>
	    .dont_use_english,.matchornotid,.matchornotnink,.matchornotemail,.matchornotpw{
	    	font-size: 3px;
	    	white-space: nowrap;
	    }

    body{
      background: #eaeaed;
    }
    .fixed, .fluid {
      background: white;

    }
    .toggle.ios, .toggle-on.ios, .toggle-off.ios { border-radius: 15rem; }
  .toggle.ios .toggle-handle { border-radius: 15rem; }
.alarm{
    line-height: 2.5;
    white-space: nowrap;
}
img {
  width: 200px;
  height: 200px;
  object-fit: cover;
}
.btn{
    white-space: nowrap;
}
.userinfo{
    white-space: nowrap;
}
.textage{
    line-height: 2.5;
}
.buttons{
    align-items: center;
    place-self: flex-end;}
#input-file{
	display:none;
}
</style>
</head>
<body>

  <div class="container-fluid justify-content-center align-items-center">

  	<h3 class="mx-5 px-5 text-secondary">회원 정보 수정</h3>
    <div class="bg-white container d-flex flex-row justify-content-center px-5 pt-5 mb-5">
        <!--회원 수정(이미지,알림) 정보-->
        <div class="m-3 mr-5">
            <div class="row col-4 d-flex flex-column justify-content-center align-items-center">
            <!-- <form class="myphoto" action="upload" method="post" enctype="multipart/form-data"> -->
                <img src="resources/img/${info.u_fileName}" class="rounded-circle d-block mb-3 img-responsive center-block">
                
                <button class="btn btn-light btn-outline-dark mb-5 mx-5" onclick="fileUp()">
	  				사진수정
				</button>
                
                
                <!-- <label for="input-file" class="btn btn-light btn-outline-dark mb-5 mx-5" onclick="fileUp()">
	  				사진수정
				</label> -->
			<!--	<input type="file" id="input-file"/> -->
            <!-- </form>-->
                <form class="mb-3 d-flex">
                    <div class="alarm text-center mr-4">알림설정</div>
                    <input type="checkbox" checked data-toggle="toggle" data-style="ios" data-width="100" data-height="25">
                </form>
             </div>
        </div>
        <!--회원 수정 정보-->
        <div class="userinfo d-flex m-3 ml-5">
            <div class="row col-12 d-flex justify-content-center align-items-center ">
                <form action="update" method="post" class="row flex-column align-items-center justify-content-center my-5">
    
                    <div class="form-group row col-12">
                        <label for="id" class="text-left col-3 m-1">아이디</label>
                        <div class="id_name">${info.u_id}</div>
                    </div>

                    <div class="form-group row col-12">
                        <label for="id" class="text-left col-3 m-1">이름</label>
                        <div class="id_name">${info.u_name}</div>
                    </div>                    
                    <div class="form-group row col-12">
                        <label for="id" class="text-left col-3 m-1">이메일</label>
                        <div class="id_name">${info.u_email}</div>
                    </div>

                    <div class="form-group row col-12">
                        <label for="id" class="text-left col-3 m-1">닉네임</label>
                        <input type="text" class="col-5 m-1" name="nick" value="${info.u_nick}">
                        <div class="text-left col-4 m-1"></div>
                    </div>



                    <div class="form-group row col-12">  
                        <label for="pass" class="text-left col-3 m-1">비밀번호</label>
                        <input type="password" class="col-4 form-control m-1 " id="pw" name="pw" value="${info.u_pw}">
                        <input type="password" class="col-3 form-control m-1 " id="pwch" name="pwcheck">
                        <div class="matchornotpw col-10 text-right ml-3"></div>
                    </div>

                    <div class="form-group row col-12 mb-2 pl-4">
                        <div class="text-left col-3 my-1"> 성별 </div>
                        <input type="radio" value="M" class="col-1 form-control" name="gender" id="M">
                        <label for="man" class="b-inline text-left col-3" >남</label>
                
                        <input type="radio" value="F" class="col-1 form-control b-inline" name="gender" id="F">
                        <label for="girl" class="b-inline text-center">녀</label>
                    </div>

                    <div class="form-group row col-12 pl-4">
                        <label for="id" class="text-left col-2 my-1 mr-5">나이</label>
                        <input type="text" class="col-3 form-control my-1 " id="age" name="age" value="${info.u_age}">
                        <div class="textage">세</div>


                        <label for="id" class="text-right col-1 my-1 ml-2">키</label>
                        <input type="text" class="col-3 form-control my-1 " id="height" name="height" value="${info.u_height}">


                    </div>


                    <div class="form-group row col-12">
                        <label for="id" class="text-left col-2 m-1 mr-5">몸무게</label>
                        <div class="textage col-4">${info.u_weight}</div> 
                        <div class="textage">kg</div>
                    </div>
                    
                    <div class="form-group row col-12">
                        <label for="id" class="text-left col-2 m-1 mr-5">목표 몸무게</label>
                        <input type="text" class="col-4" name="tarweight" value="${info.u_tarWeight}">
                        <div class="textage">kg</div>
                    </div>
                    
                    <div class="form-group row col-12">
                        <label for="id" class="text-center col-2 mr-5">자기소개</label>
                        <textarea name="u_intro" class="col-8" >${info.u_intro}</textarea>
                    </div>
                    <div class="d-flex buttons ">
                    	<a id="jointocheck" class="btn bg-secondary mr-1">취소</a>
                   		<button type="submit" id="jointocheck" class="btn btn-primary">수정</button>
                   	</div>
                    </form>
             </div>
        </div>


    </div>
  </div>

</body>
<script>

console.log("info:","${info.u_gender}");
gender = "${info.u_gender}"
console.log("gender:",gender);
if (gender=='M') {
	$('#M').prop('checked',true);
}else if(gender=='F'){
	$('#F').prop('checked',true);
}else{
	
}

var msg="${msg}";
if(msg!=""){
	alert(msg);
}

function fileUp(){
	window.open('uploadForm','file upload','width=400','height=100');
}

</script>
</html>