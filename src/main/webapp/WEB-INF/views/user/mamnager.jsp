<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    </style>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body class="bg-secondary">
    <div class="container justify-content-center align-items-center mx-auto">
        <div>
            <ul class="row list-group list-group-horizontal justify-content-start">
                <li class="col-3 list-group-item list-group-item-action mr-1 p-1 text-center rounded-top border-bottom-0 active">회원 목록</li>
                <li class="col-3 list-group-item list-group-item-action p-1 text-center rounded-top border-bottom-0">신고 목록</li>
                <li class="col-3 list-group-item list-group-item-action mx-1 p-1 text-center rounded-top  border-bottom-0">블랙리스트 목록</li>
            </ul>
            <div class="container row bg-light">
                <div class="container bg-light">
                    <table class="table table-bordered m-3">
                        <thead>
                          <tr class="border-top-0">
                            <th class="text-center">아이디</th>
                            <th class="text-center">닉네임</th>
                            <th class="text-center">이름</th>
                            <th class="text-center">이메일</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr class="text-center">
                            <td>damo123</td>
                            <td>다모</td>
                            <td>김체중</td>
                            <td>john@example.com</td>
                          </tr>
                          <tr class="text-center">
                            <td>damo123</td>
                            <td>다모</td>
                            <td>김체중</td>
                            <td>john@example.com</td>
                          </tr>
                          <tr class="text-center">
                            <td>damo123</td>
                            <td>다모</td>
                            <td>김체중</td>
                            <td>john@example.com</td>
                          </tr>
                          <tr class="text-center">
                            <td>damo123</td>
                            <td>다모</td>
                            <td>김체중</td>
                            <td>john@example.com</td>
                          </tr>
                          <tr class="text-center">
                            <td>damo123</td>
                            <td>다모</td>
                            <td>김체중</td>
                            <td>john@example.com</td>
                          </tr>
                          <tr class="text-center">
                            <td>damo123</td>
                            <td>다모</td>
                            <td>김체중</td>
                            <td>john@example.com</td>
                          </tr>
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