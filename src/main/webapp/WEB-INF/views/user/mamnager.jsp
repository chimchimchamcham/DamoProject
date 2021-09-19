<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>helowBS</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <style>
        li.list-group-item{
            border-bottom-left-radius:0  !important;
            border-bottom-right-radius:0 !important;
            
        }
	.display-none{
		display:none;
	}
    </style>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body class="bg-secondary">
	<jsp:include page="../header.jsp"></jsp:include>
    <div class="container justify-content-center align-items-center mx-auto mt-5">
      <ul class="row list-group list-group-horizontal justify-content-start">
          <li class="userlist col-3 list-group-item list-group-item-action mr-1 p-1 text-center rounded-top border-bottom-0 active">회원 목록</li>
          <li class="notifylist col-3 list-group-item list-group-item-action p-1 text-center rounded-top border-bottom-0">신고 목록</li>
          <li class="blacklist col-3 list-group-item list-group-item-action mx-1 p-1 text-center rounded-top  border-bottom-0">블랙리스트 목록</li>
      </ul>
      <!--유저리스트-->
        <div class="usertable">
            <div class="container row bg-light">
                <div class="container bg-light">
                    <table class="table table-bordered m-3 userlist">
                        <thead>
                          <tr class="border-top-0">
                            <th class="text-center">아이디</th>
                            <th class="text-center">닉네임</th>
                            <th class="text-center">이름</th>
                            <th class="text-center">이메일</th>
                          </tr>
                        </thead>
                        <tbody>
                        
                        <c:forEach items="${userlist}" var="dto">
                          <tr class="text-center">
                            <td>${dto.u_id}</td>
                            <td>${dto.u_nick}</td>
                            <td>${dto.u_name}</td>
                            <td>${dto.u_email}</td>
                          </tr>
						</c:forEach>
						
                        </tbody>
                      </table>
                </div>
            </div>
            <div class="container row bg-light">
                <ul class="pagination mx-auto">
                    <li class="page-item previous"><a class="page-link" href="#">Previous</a></li>
                    <li class="page-item one active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item"><a class="page-link" href="#">6</a></li>
                    <li class="page-item next"><a class="page-link" href="#">Next</a></li>
                </ul>
            </div>
        </div>
        

        <!--신고목록-->
        <div class="notifytable display-none">
          <div class="container row bg-light">
              <div class="container bg-light">
                  <table class="table table-bordered m-3 userlist">
                      <thead>
                        <tr class="border-top-0">
                          <th class="text-center">신고번호</th>
                          <th class="text-center">신고받은 아이디</th>
                          <th class="text-center">신고한 아이디</th>
                          <th class="text-center">신고 대분류</th>
                          <th class="text-center">신고 중분류</th>
                          <th class="text-center">신고 상태</th>
                        </tr>
                      </thead>
                      <tbody>
                      
                    <c:forEach items="${list}" var="dto">
                        <tr class="text-center">
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                        </tr>
					</c:forEach>

                      </tbody>
                    </table>
              </div>
          </div>
          <div class="container row bg-light">
              <ul class="pagination mx-auto">
                  <li class="page-item previous"><a class="page-link" href="#">Previous</a></li>
                  <li class="page-item one active"><a class="page-link" href="#">1</a></li>
                  <li class="page-item"><a class="page-link" href="#">2</a></li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item"><a class="page-link" href="#">4</a></li>
                  <li class="page-item"><a class="page-link" href="#">5</a></li>
                  <li class="page-item"><a class="page-link" href="#">6</a></li>
                  <li class="page-item next"><a class="page-link" href="#">Next</a></li>
              </ul>
          </div>
        </div>

        <!--blacklist-->
        <div class="blacktable display-none">
          <div class="container row bg-light">
              <div class="container bg-light">
                  <table class="table table-bordered m-3 userlist">
                      <thead>
                        <tr class="border-top-0">
                          <th class="text-center">번호</th>
                          <th class="text-center">아이디</th>
                          <th class="text-center">분류코드</th>
                          <th class="text-center">등록날짜</th>
                          <th class="text-center">종료날짜</th>
                          <th class="text-center">관리자 아이디</th>
                        </tr>
                      </thead>
                      <tbody>
   
   					<c:forEach items="${list }" var="dto">
                        <tr class="text-center">
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                        </tr>
                     </c:forEach>
                        
                      </tbody>
                    </table>
              </div>
          </div>
          <div class="container row bg-light">
              <ul class="pagination mx-auto">
                  <li class="page-item previous"><a class="page-link" href="#">Previous</a></li>
                  <li class="page-item one active"><a class="page-link" href="#">1</a></li>
                  <li class="page-item"><a class="page-link" href="#">2</a></li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item"><a class="page-link" href="#">4</a></li>
                  <li class="page-item"><a class="page-link" href="#">5</a></li>
                  <li class="page-item"><a class="page-link" href="#">6</a></li>
                  <li class="page-item next"><a class="page-link" href="#">Next</a></li>
              </ul>
          </div>
        </div>



    </div>
</body>


<script>
    $(document).on('click','.list-group-item',function(){
        $('.list-group-item').removeClass('active');
        $(this).addClass('active');
          //유저리스트
          if($(this).hasClass('userlist')){
            console.log('userlist');
            $('.usertable').removeClass('display-none');
            $('.notifytable').addClass('display-none');
            $('.blacktable').addClass('display-none');
            
            
          //신고리스트
          }else if($(this).hasClass('notifylist')){
            console.log('notifylist');
            $('.notifytable').removeClass('display-none');
            $('.usertable').addClass('display-none');
            $('.blacktable').addClass('display-none');
            
            
          //블랙리스트
          }else if($(this).hasClass('blacklist')){
            console.log('blacklist');
            $('.blacktable').removeClass('display-none');
            $('.usertable').addClass('display-none');
            $('.notifytable').addClass('display-none');
            
            
          }



    });

    $(document).on('click','.page-item',function(){
        if($(this).hasClass('previous')||$(this).hasClass('next')){
            $('.page-item').removeClass('active');
            $('.page-item.one').addClass('active');
        }else{
            $('.page-item').removeClass('active');
            $(this).addClass('active');
        }
    });

</script>


</html>