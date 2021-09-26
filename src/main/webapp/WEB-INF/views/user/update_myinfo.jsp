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
    .fixed, .fluid {
      background: white;

    }
    .toggle.ios, .toggle-on.ios, .toggle-off.ios { border-radius: 15rem; }
  .toggle.ios .toggle-handle { border-radius: 15rem; }
.alarm{
    line-height: 2.5;
    white-space: nowrap;
}
img#img_form_url{
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
textarea{
    height: 150px;
	resize: none;
}
.conbox{
	font-family: arial;
}
</style>
</head>
<body class="bg-light">
 <jsp:include page="../header.jsp"></jsp:include>
  <div class="conbox container-fluid justify-content-center align-items-center">

  	<h3 class="mx-5 px-5 text-secondary">회원 정보 수정</h3>
    <div class="bg-white container d-flex flex-row justify-content-center px-5 pt-5 mb-5">
        <!--회원 수정(이미지,알림) 정보-->
        <div class="m-3 mr-5">
            <div class="row col-4 d-flex flex-column justify-content-center align-items-center">
             <img src="" id="img_form_url" class="rounded-circle d-block mb-3 img-responsive center-block">
             <!-- 경로 문제있음 -->
             <form class="help" action="upload" method="post" enctype="multipart/form-data">
             
                <label for="input-file" class="btn btn-light btn-outline-dark mb-5 mx-5">
                      	사진수정
                </label>
				<input type="file" name="file" id="input-file" onchange="fileUpload()"/>
             </form>
                <div class="mb-3 d-flex">
                    <div class="alarm text-center mr-4">알림설정</div>
                    <input id="toggle-demo" type="checkbox" checked data-toggle="toggle" data-style="ios" data-width="100" data-height="25">
                </div>
             </div>
        </div>
        <!--회원 수정 정보-->
        <div class="userinfo d-flex m-3 ml-5">
            <div class="row col-12 d-flex justify-content-center align-items-center ">
                <form action="update" method="post" class="row flex-column align-items-center justify-content-center mb-5">
    
                    <div class="form-group row col-12 my-1">
                        <label for="id_name" class="text-center col-3  pl-0 my-1">아이디</label>
                        <div id="id">${info.u_id}</div>
                    </div>

                    <div class="form-group row col-12 my-1">
                        <label for="name" class="text-center col-3  pl-0 my-1">이름</label>
                        <div id="name">${info.u_name}</div>
                    </div>                    
                    <div class="form-group row col-12 my-1">
                        <label for="email" class="text-center col-3 pl-0 my-1">이메일</label>
                        <div id="email">${info.u_email}</div>
                    </div>

                    <div class="form-group row col-12 my-1">
                        <label for="nick" class="text-left col-3 pl-0 my-1 d-flex justify-content-center align-self-center">닉네임</label>
                        <input type="text" class="col-4 form-control my-1" name="nick" id="nick" value="${info.u_nick}">
                        <div class="text-left col-2 m-1 matchornotnink"></div>
                    </div>



                    <div class="form-group row col-12 my-1">  
                        <label for="pass" class="text-left col-3 pl-0 my-1 d-flex justify-content-center align-self-center">비밀번호</label>
                        <input type="password" class="col-4 form-control my-1 mr-2" id="pw" name="pw" value="${info.u_pw}">
                        <input type="password" class="col-3 form-control my-1 " id="pwch" name="pwcheck">
                        <div class="row col-12  justify-content-end pr-5">
                        	<div style="visibility: hidden;font-size: 3px;">비밀번호 확읜ㄴㄴㄴㄴㄴㄴㅁㅁㅁ</div>
                        	<div class="matchornotpw text-right pr-5 d-flex align-self-end"></div>
                        </div>
                    </div>

                    <div class="form-group row col-12 my-1">
                        <div class="text-left col-3 pl-0 my-1 d-flex justify-content-center align-self-center"> 성별 </div>
                        <input type="radio" value="M" style="height: calc(0.5em + .75rem + 2px)"; class="col-1 form-control align-self-center" name="gender" id="M">
                        <label for="man" class="b-inline pl-0 my-1 d-flex align-self-center" >남</label>
                		<div  class="b-inline col-2"></div>
                        <input type="radio" value="F" style="height: calc(0.5em + .75rem + 2px)"; class="col-1 form-control b-inline align-self-center;" name="gender" id="F">
                        <label for="girl" class="b-inline pl-0 my-1 d-flex align-self-center">여</label>
                    </div>

                    <div class="form-group row col-12 my-1">
                        <label for="id" class="text-left col-3 pl-0 my-1 d-flex justify-content-center align-self-center">나이</label>
                        <input type="text" class="text-center col-3 form-control my-1 " id="age" name="age" value="${info.u_age}" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
                        <div class="textage my-1 ml-1 d-flex align-self-center">세</div>

						<div style="visibility: hidden">----</div>

                        <label for="id" class="text-right my-1 mr-1 d-flex align-self-center">키</label>
                        <input type="text" class="text-center col-3 form-control my-1 " id="height" name="height" value="${info.u_height}" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
						<div class="textage ml-1 d-flex align-self-center">cm</div>

                    </div>


                    <div class="form-group row col-12">
                        <label for="id" class="text-left col-3 pl-0 my-1 d-flex justify-content-center align-self-center">몸무게</label>
                        <div class="textage col-3 pl-0 my-1 d-flex justify-content-center align-self-center">${info.u_weight}</div> 
                        <div class="textage col-3 pl-0 my-1 d-flex align-self-center">kg</div>
                    </div>
                    
                    <div class="form-group row col-12">
                        <label for="id" class="text-left col-3 pl-0 my-1 d-flex justify-content-center align-self-center">목표 몸무게</label>
                        <input type="text" class="form-control text-center col-3" name="tarweight" value="${info.u_tarWeight}" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
                        <div class="textage d-flex align-self-center">kg</div>
                    </div>
                    
                    <div class="form-group row col-12">
                        <label for="id" style="height: 150px"; class="text-center col-3 pl-0 my-1 d-flex justify-content-center align-self-center">자기소개</label>
                        <textarea name="u_intro"  class="form-control col-7" >${info.u_intro}</textarea>
                    
	                    <div class="col-2 d-flex buttons">
	                    	<a id="cancle" class="btn bg-secondary mr-1">취소</a>
	                   		<button type="submit" id="jointocheck" class="btn btn-primary">수정</button>
	                   	</div>
                   	</div>
                    </form>
             </div>
        </div>


    </div>
  </div>

</body>
<script>

var imgname = "${info.u_fileName}"
var alarmboolean = "${info.u_alarmYN}";
var updatealarm = '';
var loginid = '${loginId}'

var orinick = "${info.u_nick}";
console.log(orinick)
console.log("info:","${info.u_gender}");
gender = "${info.u_gender}"
console.log("gender:",gender);

if (gender=='M') {
	$('#M').prop('checked',true);
}else if(gender=='F'){
	$('#F').prop('checked',true);
}else{
	
}


console.log("info:","${info.u_alarmYN}");



function fileUpload(){
	$('.help').submit();
}


$(document).ready(function(){
	
	var msg="${msg}";
	if(msg!=""){
		alert(msg);
	}
	
   	//알람여부
	if (alarmboolean=='true') {
		$('#toggle-demo').bootstrapToggle('on');
		alarmyn = 'on';
		
	}else if(alarmboolean=='false'){
		$('#toggle-demo').bootstrapToggle('off');
		alarmyn = 'off';
	}
		
   	//클릭시 알람여부 바꿈
	$(document).on("click",".toggle-group label", function() {

 	   $.ajax({
		      url : './check/alarms',
		      type : 'get',
		      data : {alarm:alarmyn},
		      dataType : "text",
		      success : function(data){
		    	  console.log(data);
		    	  if (data=='N') {
		    		  $('#toggle-demo').bootstrapToggle('off');
		    		  alarmyn = 'off';
				}else if(data=='Y'){
					$('#toggle-demo').bootstrapToggle('on');
					alarmyn='on'
				}
		      },
		      error : function(error){
		         console.log(error);
		      }
		   });
    })
   
   
 //사진 수정 경로
   if (imgname!="default-profile.png") {
		$("#img_form_url").attr("src","/photo/"+imgname);	
	}else{
		$("#img_form_url").attr("src","resources/img/"+imgname);	
	}
	
    $(document).on("focusout focuson keyup","#nick", function() {
    	var x = $("#nick").val();
    	var nick = x;
    	var newnick = $('#nick').val();
    	console.log(nick);
    	
 	   $.ajax({
		      url : './check/matchnick',
		      type : 'post',
		      data : {matchnick:nick},
		      dataType : 'json',
		      success : function(data){
		    if (data == 0) {
		        	$(".matchornotnink").text('');
		        	$(".matchornotnink").text('사용가능한 닉네임 입니다');
		        	$(".matchornotnink").css('color','green');
		        	$("#nick").css("border-color","#ced4da");
			
		        	if (nick=='') {
		       		console.log('nick');
					$(".matchornotnink").text('');
		        	}
		        	
			}else if(orinick==newnick){
					$(".matchornotnink").text('');
					$(".matchornotnink").text('이미 당신의 닉네임 입니다');
		        	$(".matchornotnink").css('color','green');
			}else{
				$(".matchornotnink").text('');
		        	$(".matchornotnink").text('다른 유저와 중복된 닉네임 입니다');
		        	$(".matchornotnink").css('color','red');
		        	$("#nick").css("border-color","red");
				}
		     },error : function(error){
		         console.log(error);
		      }
		   });
 	   
    })
    
 $(document).on("focusout focuson keyup","#pw", function() {

	 var pw1 = $("#pw").val();
	 var pw2 = $("#pwch").val();
	 
		if (pw1==pw2) {
			$(".matchornotpw").text('');
	        $(".matchornotpw").text('비밀번호가 일치합니다');
	        $(".matchornotpw").css('color','green');
	        $("#pw").css("border-color","#ced4da");
	        $("#pwch").css("border-color","#ced4da");
	        
	        
	        if (pw1==''||pw2==''||(pw1==''&&pw2=='')) {
				$(".matchornotpw").text('');			
		        $("#pw").css("border-color","#ced4da");
		        $("#pwch").css("border-color","#ced4da");
			}
	        
		}else{
			$(".matchornotpw").text('');
	        $(".matchornotpw").text('비밀번호가 일치하지 않습니다');
	        $(".matchornotpw").css('color','red');
	        $("#pw").css("border-color","red");
	        $("#pwch").css("border-color","red");
	        
	        if (pw1==''||pw2==''||(pw1==''&&pw2=='')) {
				$(".matchornotpw").text('');			
		        $("#pw").css("border-color","#ced4da");
		        $("#pwch").css("border-color","#ced4da");
			}
		}
   
    });
    
    $(document).on("focusout focuson keyup","#pwch", function() {

   	 var pw1 = $("#pw").val();
   	 var pw2 = $("#pwch").val();
   	 
			if (pw1==pw2) {
				$(".matchornotpw").text('');
		        $(".matchornotpw").text('비밀번호가 일치합니다');
		        $(".matchornotpw").css('color','green');
		        $("#pw").css("border-color","#ced4da");
		        $("#pwch").css("border-color","#ced4da");
		        
		        
		        if (pw1==''||pw2==''||(pw1==''&&pw2=='')) {
					$(".matchornotpw").text('');			
			        $("#pw").css("border-color","#ced4da");
			        $("#pwch").css("border-color","#ced4da");
				}
		        
			}else{
				$(".matchornotpw").text('');
		        $(".matchornotpw").text('비밀번호가 일치하지 않습니다');
		        $(".matchornotpw").css('color','red');
		        $("#pw").css("border-color","red");
		        $("#pwch").css("border-color","red");
		        
		        if (pw1==''||pw2==''||(pw1==''&&pw2=='')) {
					$(".matchornotpw").text('');			
			        $("#pw").css("border-color","#ced4da");
			        $("#pwch").css("border-color","#ced4da");
				}
			}
      
       });
    
    
});


$(document).on("click","#cancle", function() {
	location.href="myPage?u_id="+loginid;
});

</script>
</html>