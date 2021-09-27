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
	    a:hover {text-decoration: none; color: black;}
	    .dont_use_englishandnum,.matchornotid,.matchornotnink,.matchornotemail,.matchornotpw{
	    	font-size: 3px;
	    	white-space: nowrap;
	    }
	   img:hover{
		cursor: pointer;
	}
</style>
<body class="bg-primary">
<div class="container mx-auto bg-white px-5 py-3 w-50 h-50" style="border-radius:3vh;margin-top: 5%;">
   
   <div class="justify-content-center align-items-center my-2 p-2">
    <div class="row">
     	<a href="gojointerms" class="text-primary display-4">←</a>
        <img src="resources/img/logo3.png" class="col-5 mx-auto" onclick="location.href='./'">
    </div>

    <form action="join" method="post" class="row flex-column align-items-center justify-content-center  my-5">
    
    <div class="form-group row col-12">
        <label for="id" class="text-left col-2 m-1">아이디:</label>
        <input type="text" class="col-5 form-control m-1 " id="id" name="id"/>
        <div class="dont_use_englishandnum col-3 display-5 text-danger text-center pt-3"></div>
        <div class="matchornotid col-1 display-5 text-right pt-3"></div>
    </div>
    <div class="form-group row col-12">
        <label for="name" class="text-left col-2 m-1">이름:</label>
        <input type="text" class="col-5 form-control m-1" name="name">
    </div>
    <div class="form-group row col-12">   
        <label for="nick" class="text-left col-2 m-1">닉네임:</label>
        <input type="text" class="col-7 form-control m-1" id="nick" name="nick">
        <div class="matchornotnink col-1 display-5 text-right pt-3"></div>
    </div>
    <div class="form-group row col-12">  
        <label for="pass" class="text-left col-2 m-1">비밀번호:</label>
        <input type="password" class="col-4 form-control m-1 " id="pw" name="pw">
        <input type="password" class="col-3 form-control m-1 " id="pwch" name="pwcheck">
        <div class="matchornotpw col-1 display-5 text-right pt-3"></div>
    </div>
    <div class="form-group row col-12"> 
        <label for="email" class="text-left col-2 m-1">이메일:</label>
        <input type="text" class="col-4 form-control m-1" id="email" name="email">
        <div class="input-group-append">
            <span>@</span>
        </div>
        <select class="col-3 form-control m-1" id="emailand" name="emailand">
        		<option value=''>---선택---</option>
                <option value="google.com">google.com</option>
                <option value="daum.com">daum.com</option>
                <option value="naver.com">naver.com</option>
        </select>
        <div class="matchornotemail col-1 display-5 text-right pt-3"></div>
    </div>
    <div class="row col-12 justify-content-start align-items-center">
        <div class="text-left text-nowrap col-1 m-1">성별:</div>
        <div class="col-1"></div>
        <input type="radio" value="M" class="col-1 form-control b-inline" name="gender">
        <label for="man" class="b-inline text-left" >남</label>

        <input type="radio" value="F" class="col-1 form-control b-inline" name="gender">
        <label for="girl" class="b-inline text-left">여</label>
    </div>

    <div class="form-group row col-12">
        <label for="id" class="text-left col-2 m-1">나이:</label>
        <input type="text" class="col-4 form-control m-1 " id="age" name="age" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
    </div>
    <div class="form-group row col-12">
        <label for="id" class="text-left col-2 m-1">몸무게:</label>
        <input type="text" class="col-4 form-control m-1 " id="weight" name="weight" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
    </div>
    <div class="form-group row col-12">
        <label for="id" class="text-left col-2 m-1">목표몸무게:</label>
        <input type="text" class="col-4 form-control m-1 " id="tarweight" name="tarweight" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
    </div>
    <div class="form-group row col-12">
        <label for="id" class="text-left col-2 m-1">키:</label>
        <input type="text" class="col-4 form-control m-1 " id="height" name="height" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
    </div>
    
    <button type="submit" id="jointocheck" class=" btn btn-primary align-self-end">회원가입</button>
    </form>
</div>
</div>
</body>
<script type="text/javascript">
    // 입력을 제한 할 특수문자의 정규식
    var checktext  = /^[a-zA-Z0-9]*$/ig;
    
    
    
    
    $(document).ready(function(){
        $(document).on("focusout focuson keyup",'#id', function() {
        	var x = $("#id").val();
        	var id = x;
        	
        	console.log(id);
        	
     	   $.ajax({
 		      url : './check/matchid',
 		      type : 'post',
 		      data : {matchid:id},
 		      dataType : 'json',
 		      success : function(data){
 		         if (data == 0) {
 		        	 
 		        	$(".matchornotid").text('');
 		        	$(".matchornotid").text('사용가능한 아이디 입니다');
 		        	$(".matchornotid").css('color','green');
				
 		        	if(id==''){
 						console.log('hewllow');
 						$(".matchornotid").text('');
 		        	}
 		        	
				}else{
					
					$(".matchornotid").text('');
 		        	$(".matchornotid").text('중복된 아이디 입니다');
 		        	$(".matchornotid").css('color','red');
 		        	
				}
 		         
 		      },
 		      error : function(error){
 		         console.log(error);
 		      }
 		   });
        	
        	console.log(x.length);
            var x = $(this).val();
            if (x.length > 0) {
            	
                if (x.match(checktext)) {
                	$(".dont_use_englishandnum").text('');
                	$("#id").css("border-color","#ced4da");
                   
		        	if(id == ''){
 						$(".dont_use_englishandnum").text('');
 						$("#id").css("border-color","#ced4da");
 		        	}
                }else{
                    $(".dont_use_englishandnum").text('영어,숫자만 입력할수 있습니다');
                    $("#id").css("border-color","red");
                    
		        	if(id == ''){
 						$(".dont_use_englishandnum").text('');
 						$("#id").css("border-color","#ced4da");
 		        	}
                }
            }else{
            	$(".dont_use_englishandnum").text('');
            	$("#id").css("border-color","#ced4da");
            }
            
        })
     	
        
        
        
        $(document).on("focusout focuson keyup","#nick", function() {
        	var x = $("#nick").val();
        	var nick = x;
        	
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
 		        	
				}else{
					$(".matchornotnink").text('');
 		        	$(".matchornotnink").text('중복된 닉네임 입니다');
 		        	$(".matchornotnink").css('color','red');
 		        	$("#nick").css("border-color","red");
				}
 		         
 		      },
 		      error : function(error){
 		         console.log(error);
 		      }
 		   });
     	   
        })
        
        //이메일 입력칸에 입력했을때
       $(document).on("focusout focuson keyup","#email", function() {
        	var x = $("#email").val();
        	var email = x;
        	
       if ($("#emailand").val()!=null&&$("#emailand").val()!=''&&x!=null&&x!='') {
    	   
    	   var emailback = $("#emailand").val();
    	   
     	   $.ajax({
 		      url : './check/matchemail',
 		      type : 'post',
 		      data : {matchemail:email,matcheback:emailback},
 		      dataType : 'json',
 		      success : function(data){
 		    	 console.log(data);
 		         if (data === 0) {
 		        	$(".matchornotemail").text('');
 		        	$(".matchornotemail").text('사용가능한 이메일 입니다');
 		        	$(".matchornotemail").css('color','green');
 		        	$("#emailand").css("border-color","#ced4da");
					
 		        	if (email=='') {
 						console.log('email');
 						$(".matchornotemail").text('');
					}
 		        	
				}else if(data>0){
					$(".matchornotemail").text('');
 		        	$(".matchornotemail").text('중복된 이메일 입니다');
 		        	$(".matchornotemail").css('color','red');
 		        	$("#emailand").css("border-color","red");
				}
 		         
 		      },
 		      error : function(error){
 		         console.log(error);
 		      }
 		   });				
			}
        })
        
    //이메일 뒤칸에 클릭했을때    
    $(document).on("focusout focuson click","#emailand", function() {
        	var x = $("#email").val();
        	var email = x;
        	
       if ($("#emailand").val()!=null&&$("#emailand").val()!=''&&x!=null&&x!='') {
    	   
    	   var emailback = $("#emailand").val();
    	   
     	   $.ajax({
 		      url : './check/matchemail',
 		      type : 'post',
 		      data : {matchemail:email,matcheback:emailback},
 		      dataType : 'json',
 		      success : function(data){
 		    	 console.log(data);
 		         if (data === 0) {
 		        	$(".matchornotemail").text('');
 		        	$(".matchornotemail").text('사용가능한 이메일 입니다');
 		        	$(".matchornotemail").css('color','green');
 		        	$("#emailand").css("border-color","#ced4da");
					
 		        	if (email=='') {
 						console.log('email');
 						$(".matchornotemail").text('');
					}
 		        	
				}else if(data>0){
					$(".matchornotemail").text('');
 		        	$(".matchornotemail").text('중복된 이메일 입니다');
 		        	$(".matchornotemail").css('color','red');
 		        	$("#emailand").css("border-color","red");
				}
 		         
 		      },
 		      error : function(error){
 		         console.log(error);
 		      }
 		   });				
			}
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
		        
		        
		        if((pw1 ==''&&pw2 =='')||(pw1 ==''||pw2 =='')){
		        	$(".matchornotpw").text('');
				}
		        
			}else{
				$(".matchornotpw").text('');
		        $(".matchornotpw").text('비밀번호가 일치하지 않습니다');
		        $(".matchornotpw").css('color','red');
		        $("#pw").css("border-color","red");
		        $("#pwch").css("border-color","red");
		        
		        if((pw1 ==''&&pw2 =='')||(pw1 ==''||pw2 =='')){
		        	$(".matchornotpw").text('');
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

		        if((pw1 ==''&&pw2 =='')||(pw1 ==''||pw2 =='')){
		        	$(".matchornotpw").text('');
				}
   			}else{
   				$(".matchornotpw").text('');
   		        $(".matchornotpw").text('비밀번호가 일치하지 않습니다');
   		        $(".matchornotpw").css('color','red');
   		        $("#pw").css("border-color","red");
   		        $("#pwch").css("border-color","red");
   		        
		        if((pw1 ==''&&pw2 =='')||(pw1 ==''||pw2 =='')){
		        	$(".matchornotpw").text('');
				}
   			}
          
           });
        
        
    });
   
	//아이디 체크
	var id = $(".matchornotid").text();
	var id_endnumcheck = $(".dont_use_englishandnum").text();
	//닉네임 체크
	var nink =$(".matchornotnink").text();
	//이메일 체크
	var email = $(".matchornotemail").text();
	//비밀번호 체크
	var pass = $(".matchornotpw").text();
	
    
    
    $(document).on("click","#jointocheck", function() {
    	
    	//아이디 체크
    	 id = $(".matchornotid").text();
    	 id_endnumcheck = $(".dont_use_englishandnum").text();
    	//닉네임 체크
    	 nink =$(".matchornotnink").text();
    	//이메일 체크
    	 email = $(".matchornotemail").text();
    	//비밀번호 체크
    	 pass = $(".matchornotpw").text();
    	
    	//아이디 중복 체크
    	if (id=='사용가능한 아이디 입니다'&&id_endnumcheck!='영어,숫자만 입력할수 있습니다') {
			
			
			//닉네임 중복 체크
	    	if (nink=='사용가능한 닉네임 입니다') {
				
				
		    	//이메일 중복 체크
		    	if (email=='사용가능한 이메일 입니다') {
					
					//비밀번호 체크
					if (pass=='비밀번호가 일치합니다') {
			    		
					}else{
						alert('비밀번호를 체크 해주세요');
						return false;
					}
					
				}else{
					alert('이메일를 체크 해주세요');
					return false;
				}
				
			}else{
				alert('닉네임를 체크 해주세요');
				return false;
			}
			
		}else{
			alert('아이디를 체크 해주세요');
			return false;
		}
    })
    
    
    
    var msg="${msg}";
    if(msg!=""){
    	alert(msg);
    }
    
 </script>




</html>