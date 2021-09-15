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
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-9 col-md-7 col-lg-5 mx-auto my-5">
          <div class="card border-0 shadow rounded-3 my-5">
            <div class="card-body p-4 p-sm-5">
              <h5 class="card-title text-center fw-light fs-5">비밀번호 찾기</h5>
              <form method="get" action="gojoin" class="row d-flex justify-content-center align-items-center my-3">
                <div class="row">
                  <img src="resources/img/logo3.png" class="col-10 mx-auto mb-2">
                </div>

                <div class="form-check-inline d-flex flex-column w-100">
                  <label class="form-check-label">
                    <input type="checkbox" class="form-check-input" name="checkone">개인정보 수집 및 이용 동의(필수)
                  </label>
                <textarea name="checking1" id=""  rows="10" readonly class="form-control w-100 m-2">
개인정보보호법에 따라 네이버에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적,개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
                </textarea>
                </div>

                <div class="form-check-inline d-flex flex-column w-100">
                  <label class="form-check-label">
                    <input type="checkbox" class="form-check-input" name="checktwo">개인정보 수집 및 이용 동의(필수)
                  </label>
                <textarea name="checking2" id=""  rows="10" readonly class="form-control w-100 m-2">
개인정보보호법에 따라 네이버에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적,개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
개인정보보호법에 따라 네이버에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적,개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시
불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
                </textarea>
              </div>
            <div class="row col-12 d-flex justify-content-around align-items-center">
              <div class="col-5 text-nowrap text-left text-danger">
               	${msg}
              </div>
              <div class="col-5 btn-group ml-4"><button type="button" class=" btn btn-secondary mr-1 rounded-lg">취소</button><button type="submit" class="btn btn-primary ml-1 rounded-lg">확인</button></div>
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
    <script type="text/javascript">
	var msg = "${msg}" == "" ? "${param.msg}":"${msg}";
	if(msg != ""){
		alert(msg);
	}
    </script>
</html>