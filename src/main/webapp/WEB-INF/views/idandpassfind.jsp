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
              <h5 class="card-title text-center mb-5 fw-light fs-5">아이디 찾기</h5>
              <div class="btn-group row d-flex justify-content-center align-items-center my-3">
                <button class="col-5 btn btn-outline-primary active rounded-pill m-1 p-1">아이디</button>
                <button class="col-5 btn btn-outline-primary rounded-pill m-1 p-1">비밀번호 찾기</button>
              </div>
              <form>
                <div class="form-floating mb-3">
                  <input type="id" class="form-control" id="name" placeholder="이름">
                </div>
                <div class="form-floating mb-3">
                  <input type="password" class="form-control" id="email" placeholder="이메일">
                </div>
                <div class="d-grid">
                  <button class="btn btn-primary btn-block btn-login text-uppercase fw-bold" type="submit">아이디 찾기</button>
                </div>
                <div class="row d-flex justify-content-end align-items-center mt-2">
                    <a href="" class="mr-3">로그인 가기</a>
                </div>
              	</form>
               </div>
            </div>
          </div>
        </div>
      </div>
  </body>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</html>