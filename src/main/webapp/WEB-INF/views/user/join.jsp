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
	    .redtextid{
	    	font-size: 5px;
	    }
</style>
<body class="bg-primary">
<div class="container mx-auto bg-white py-3 w-50 h-50" style="border-radius:3vh;margin-top: 5%;">
   
   <div class="justify-content-center align-items-center my-2 p-2">
    <div class="row">
     	<a href="gojointerms" class="text-primary display-4">←</a>
        <img src="resources/img/logo3.png" class="col-5 mx-auto">
    </div>

    <form action="join" method="post" class="row flex-column align-items-center justify-content-center my-5">
    
    <div class="form-group row col-12">
        <label for="id" class="text-left col-2 m-1">아이디:</label>
        <input type="text" class="col-5 form-control m-1 " id="id" name="id">
        <div class="redtextid col-3 display-5 text-danger text-center pt-3"></div>
        <div class="redtextid col-3 display-5 text-danger text-center pt-3">${idcheck}</div>
    </div>
    <div class="form-group row col-12">
        <label for="name" class="text-left col-2 m-1">이름:</label>
        <input type="text" class="col-5 form-control m-1" name="name">
    </div>
    <div class="form-group row col-12">   
        <label for="nick" class="text-left col-2 m-1">닉네임:</label>
        <input type="text" class="col-7 form-control m-1" name="nick">
    </div>
    <div class="form-group row col-12">  
        <label for="pass" class="text-left col-2 m-1">비밀번호:</label>
        <input type="password" class="col-4 form-control m-1 " name="pw">
        
        <input type="password" class="col-4 form-control m-1 " name="pwcheck">
    </div>
    <div class="form-group row col-12"> 
        <label for="email" class="text-left col-2 m-1">이메일:</label>
        <input type="text" class="col-4 form-control m-1" name="email">
        <div class="input-group-append">
            <span>@</span>
        </div>
        <select class="col-4 form-control m-1" name="emailand">
                <option>집접입력</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
        </select>
    </div>
    <div class="row col-12 justify-content-start align-items-center">
        <div class="text-left text-nowrap col-1 m-1">성별:</div>
        <div class="col-1"></div>
        <input type="radio" value="M" class="col-1 form-control b-inline" name="gender">
        <label for="man" class="b-inline text-left" >남</label>

        <input type="radio" value="F" class="col-1 form-control b-inline" name="gender">
        <label for="girl" class="b-inline text-left">녀</label>
    </div>

    <div class="form-group row col-12">
        <label for="id" class="text-left col-2 m-1">나이:</label>
        <input type="text" class="col-4 form-control m-1 " id="age" name="age">
    </div>
    <div class="form-group row col-12">
        <label for="id" class="text-left col-2 m-1">몸무게:</label>
        <input type="text" class="col-4 form-control m-1 " id="weight" name="weight">
    </div>
    <div class="form-group row col-12">
        <label for="id" class="text-left col-2 m-1">목표몸무게:</label>
        <input type="text" class="col-4 form-control m-1 " id="tarweight" name="tarweight">
    </div>
    <div class="form-group row col-12">
        <label for="id" class="text-left col-2 m-1">키:</label>
        <input type="text" class="col-4 form-control m-1 " id="height" name="height">
    </div>
    
    <button type="submit" class=" btn btn-primary align-self-end">회원가입</button>
    </form>
</div>
</div>
</body>
<script type="text/javascript">
    // 입력을 제한 할 특수문자의 정규식
    var checktext  = /[^A-Za-z]/ig;
    
    $(document).on(function(){
        
        $("#id").on("focusout focuson keyup keydown", function() {
            var x = $(this).val();
            if (x.length > 0) {
                if (x.match(checktext)) {
                   $(".redtextid").text('영어만 입력할수 있습니다');
                   $("#id").css("border-color","red");
                }else{
                	$(".redtextid").text('');
                	$("#id").css("border-color","#ced4da");
                }
            }
        })
     
    });
    
    
    
 </script>




</html>