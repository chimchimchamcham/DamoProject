<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>

    <div id="fitTitle" class="container mt-3 mb-3 pt-4 pb-4 pl-5 pr-4">
        <div class="row">
            <div id="title"class="col-md-8">
                <div class="d-flex">
                    <span id="q">Q.</span>
                    <input type="text" class="form-control" id="inputTitle"> 
                </div>
            </div>
            <div id="titleBtn" class="col-md-4">
                <button type="button" class="btn btn-primary float-right ml-3 mt-1">질문등록</button>
                <button type="button" class="btn btn-outline-primary float-right ml-3 mt-1">등록취소</button>
            </div>
        </div>
    </div>

    <div id="fitContent" class="container pt-4 pl-5">
        <div class="d-inline-flex">  
            <div id="c" class="mr-3 pt-2 text-secondary font-weight-bold">카테고리</div>
            <div id="category" class="form-group">
                <select class="form-control">
                  <option>--선택--</option>
                  <option>자세교정</option>
                  <option>식단</option>
                  <option>운동</option>
                  <option>고민</option>
                  <option>기타</option>
                </select>
            </div>
        </div>
        <div class="d-inline-flex float-right">
            <label for="photo" class="mr-3"><img src="image.png" alt="사진등록" width="30px" height="30px"></label>
            <input type="file" name="photo" id="photo">
            <a class="mr-3" data-toggle="modal" data-target="#myModal"><img src="link_green.png" alt="사진등록" width="30px" height="30px"></a> 

            <!-- 링크를 입력하는 모달 -->
            <!-- The Modal -->
            <div class="modal fade" id="myModal">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content" id="modalContent">
                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title" id="modalTitle">링크</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                            
                        <!-- Modal body -->
                        <div class="modal-body p" id="modalBody">
                            <input type="text" class="form-control" id="link" placeholder="링크를 입력하세요.">
                            <button type="button" class="btn btn-outline-secondary mt-4" data-dismiss="modal" id="checkBtn">확인</button>
                        </div>
                    
                        <img src="search.png" alt="링크" width="20px" height="20px" id="search">
                    </div>    
                </div>
            </div>

        </div>

        <hr/>

        <!-- 글이 들어간다 -->
        <div id="contentWrap">궁금한 사항을 입력해 보세요.</div>
        <!-- 이미지가 들어간다 -->
        <div id="imageWrap"></div>
        <!-- 동영상이 들어간다 -->
        <div id="movieWrap"></div>
    </div>
    
  </div>
</body>
<style>
    #fitTitle{
        border : 1px solid #D8D8D8;
        
    }
    #fitContent{
        border : 1px solid #D8D8D8;
        height : 500px;
    }
    #fitTitle .row{
        vertical-align: middle;
    }
    #q{
        font-size: 2.3rem;
        font-weight : 700;
        color : #0275d8;
        margin-right : 20px;
    }
    #inputTitle{
        border : none;
        border-bottom : 2px solid #0275d8;
        border-radius : 0px;
        font-size : 1.5rem;
    }
    #titleBtn button{
        border-radius : 0px;
    }
    #category{
        width : 120px;
    }
    #photo{
        display : none;
    }
    #search{
        position:absolute;
        top:88px;
        left:455px
    }
    #checkBtn{
        width:100px;
    }
    #link{
        padding-right:30px;
    }
    #modalTitle{
        padding-left:210px;
        font-weight:500;
    }
    #modalBody{
        text-align: center;
    }
    #modalContent{
        position:relative;
    }
</style>
<script>

</script>
</html>