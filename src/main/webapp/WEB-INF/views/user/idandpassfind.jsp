<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>helowBS</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<style>
	a:link {text-decoration: none; color: black;}
	a:visited {text-decoration: none; color: black;}
	a:active {text-decoration: none; color: black;}
	a:hover {text-decoration: underline; color: black;}
	    body {
	  background: #007bff;
	  background: linear-gradient(to right, #0062E6, #33AEFF);
	}
	.btn-login {
	  font-size: 0.9rem;
	  letter-spacing: 0.05rem;
	  padding: 0.75rem 1rem;
	}
	.btn-google {
	  color: white !important;
	  background-color: #ea4335;
	}
	.btn-facebook {
	  color: white !important;
	  background-color: #3b5998;
	}
	.pass{
		display: none;
	}
</style>
<body>
    <div class="container">
      <div class="row">
        <div class="col-sm-9 col-md-7 col-lg-5 mx-auto my-5">
          <div class="card border-0 shadow rounded-3 my-5">
            <div class="card-body p-4 p-sm-5">
              <h5 class="card-title text-center mb-5 fw-light fs-5">아이디 비밀번호 찾기</h5>
              <div class="btn-group row d-flex justify-content-center align-items-center my-3">
                <button id="id_find_button" class="col-5 btn btn-outline-primary active rounded-pill m-1 p-1">아이디</button>
                <button id="pass_find_button" class="col-5 btn btn-outline-primary rounded-pill m-1 p-1">비밀번호 찾기</button>
              </div>
              
              <!-- 아이디 찾기 찾기 -->	
              <div class="id">
		              	<form action="findid" method="post">
		                <div class="form-floating mb-3">
		                  <input type="text" class="form-control" name="name" id="name" placeholder="이름">
		                </div>
		                <div class="form-floating mb-3">
		                  <input type="email" class="form-control" name="email" id="email" placeholder="이메일">
		                </div>
		                <div class="d-grid">
		                  <button class="btn btn-primary btn-block btn-login text-uppercase fw-bold" type="submit">아이디 찾기</button>
		                </div>
		                <div class="row d-flex justify-content-end align-items-center mt-2">
		                    <a href="Gologin" class="mr-3">로그인 가기</a>
		                </div>
		              	</form>
              </div>
              
              <!-- 비밀번호 찾기 -->	
              <div class="pass">
	              <form action="findpw" method="post">
	                <div class="form-floating mb-3">
	                  <input type="text" class="form-control"  name="id" id="id" placeholder="아이디">
	                </div>
	                <div class="form-floating mb-3">
	                  <input type="text" class="form-control" name="name" id="name" placeholder="이름">
	                </div>
	                <div class="form-floating mb-3">
	                  <input type="email" class="form-control" name="email" id="email" placeholder="이메일">
	                </div>
	                <div class="form-floating mb-3">
	                  <input type="password" class="form-control" name="pw" id="pw" placeholder="새 비밀번호">
	                </div>
	                <div class="form-floating mb-1">
	                  <input type="password" class="form-control" name="checkpass" id="checkpass" placeholder="비밀번호 확인">
	                </div>
	                <div class="matchornotpw col-12 display-5 text-center p-1 m-1"></div>
	                <div class="d-grid">
	                  <button class="btn btn-primary btn-block btn-login text-uppercase fw-bold" type="submit">비밀번호 찾기</button>
	                </div>
	              </form>
              </div>
              
             </div>
            </div>
          </div>
        </div>
      </div>
  </body>
  <script type="text/javascript">
  
  $(document).on("click",function(){
      
      $('#id_find_button').click(function(){
        $('#pass_find_button').removeClass('active');
        $('#id_find_button').addClass('active');
        $('.pass').hide();
		$('.id').show();
      });
      $('#pass_find_button').click(function(){
        $('#id_find_button').removeClass('active');
        $('#pass_find_button').addClass('active');
        $('.id').hide();
		$('.pass').show();
      });
    });
  
  var msg="${msg}";
  if(msg!=""){
  	alert(msg);
  }
  
  
  
  $(document).on("focusout focuson keyup","#pw", function() {

 	 var pw1 = $("#pw").val();
 	 var pw2 = $("#checkpass").val();
 	 
			if (pw1==pw2) {
				$(".matchornotpw").text('');
		        $(".matchornotpw").text('비밀번호가 일치합니다');
		        $(".matchornotpw").css('color','green');
		        $("#pw").css("border-color","#ced4da");
		        $("#checkpass").css("border-color","#ced4da");
		        
		        if (pw1==''&&pw2=='') {
					$(".matchornotpw").text('');			
			        $("#pw").css("border-color","#ced4da");
			        $("#checkpass").css("border-color","#ced4da");
				}
		        

			}else{
				$(".matchornotpw").text('');
		        $(".matchornotpw").text('비밀번호가 일치하지 않습니다');
		        $(".matchornotpw").css('color','red');
		        $("#pw").css("border-color","red");
		        $("#checkpass").css("border-color","red");
		        
	        	if ((pw1==''||pw2=='')||pw1==''&&pw2=='') {
					$(".matchornotpw").text('');		
			        $("#pw").css("border-color","#ced4da");
			        $("#checkpass").css("border-color","#ced4da");
				}
			}
    
     });
     
     $(document).on("focusout focuson keyup","#checkpass", function() {

    	 var pw1 = $("#pw").val();
    	 var pw2 = $("#checkpass").val();
    	 
			if (pw1==pw2) {
				$(".matchornotpw").text('');
		        $(".matchornotpw").text('비밀번호가 일치합니다');
		        $(".matchornotpw").css('color','green');
		        $("#pw").css("border-color","#ced4da");
		        $("#checkpass").css("border-color","#ced4da");

		        if (pw1==''&&pw2=='') {
					$(".matchornotpw").text('');			
			        $("#pw").css("border-color","#ced4da");
			        $("#checkpass").css("border-color","#ced4da");
				}
		        	
			}else{
				$(".matchornotpw").text('');
		        $(".matchornotpw").text('비밀번호가 일치하지 않습니다');
		        $(".matchornotpw").css('color','red');
		        $("#pw").css("border-color","red");
		        $("#checkpass").css("border-color","red");
		        
		        if ((pw1==''||pw2=='')||pw1==''&&pw2=='') {
					$(".matchornotpw").text('');			
			        $("#pw").css("border-color","#ced4da");
			        $("#checkpass").css("border-color","#ced4da");
				}
			}
        });
  
  
  
  </script>
  
  
</html>