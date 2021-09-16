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
</style>
<body>
    <div class="container">
      <div class="row">
        <div class="col-sm-9 col-md-7 col-lg-5 mx-auto my-5">
          <div class="card border-0 shadow rounded-3 my-5">
            <div class="card-body p-4 p-sm-5">
              <div class="row">
                    <img src="resources/img/logo3.png" class="col-11 mx-auto my-5">
              </div>
              <form method="post" action="login"> 
                <div class="form-floating mb-3">
                  <input type="text" class="form-control" name="id" placeholder="id">
                </div>
                
                <div class="form-floating mb-3">
                  <input type="password" class="form-control" name="pw" placeholder="Password">
                </div>
                
                <div class="d-grid">
                  <button class="btn btn-primary btn-block btn-login text-uppercase fw-bold" type="submit">로그인</button>
                </div>
                
                <div class="row d-flex justify-content-around align-items-center text-center text-nowrap mt-2">
                    <a href="gojointerms" class="">회원가입</a>
                    <a href="Goidandpassfind" class="">아이디/비밀번호 찾기</a>
                </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
  </body>
  <script type="text/javascript">
  var msg="${msg}";
  if(msg!=""){
  	alert(msg);
  }
  </script>
</html>