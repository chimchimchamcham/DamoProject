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
            <label for="photo" class="mr-3"><img src="resources/img/image.png" alt="사진등록" width="30px" height="30px"></label>
            <input type="file" name="photo" id="photo">
            <a class="mr-3" data-toggle="modal" data-target="#myModal"><img src="resources/img/link_green.png" alt="사진등록" width="30px" height="30px"></a> 

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
                    
                        <img src="resources/img/search.png" alt="링크" width="20px" height="20px" id="search">
                    </div>    
                </div>
            </div>

        </div>

        <hr/>

		<div id="contentWrap">
	        <!-- 글이 들어간다 -->
	        <textarea id="content" name="content" cols="141" rows="13" placeholder="궁금한 사항을 입력해 보세요."></textarea>
			<!-- 글자수 카운트 -->
			<span id="textCount">0</span>
		</div>
        <hr/>
        <!-- 이미지가 들어간다 -->
        <div id="imageWrap">
            <div class="imgWrap">
                <img src="resources/img/fitimg.jpg" width="400px" height="300px">
                <a href="#" class="closeWrap"><img src="resources/img/close.png" width="20px" height="20px"></a>
            </div>
        </div>
        <!-- 동영상이 들어간다 -->
        <div id="movieWrap">
            <div class="iframeWrap">
                <iframe width="400" height="300" src="https://www.youtube.com/embed/gMaB-fG4u4g" title="YouTube video player" 
                    frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
                </iframe>
                <a href="#" class="closeWrap"><img src="resources/img/close.png" width="20px" height="20px"></a>
            </div>
        </div>

        <!-- 빈칸-->
        <div id="emptyWrap"></div>
    </div>
</body>
<style>
    #fitTitle{
        border : 1px solid #D8D8D8;
        
    }
    #fitContent{
        border : 1px solid #D8D8D8;
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
    .imgWrap{
        width : 440px;
        height : 300px;
        margin : 5px;
        position : relative;
    }
    .closeWrap{
        position : absolute;
        top : 10px;
        left : 410px;
    }
    .iframeWrap{
        width : 440px;
        height : 300px;
        margin : 5px;
        position : relative;
    }
    #emptyWrap{
        height : 200px;
    }
    #contentWrap{
    	position : relative;
    }
    #content{
    	resize : none;
    	padding : 20px;
    }
    #content:focus{
    	outline : none;
    }
    #textCount{
    	position : absolute;
    	top : 200px;
    	left : 200px;
    }

</style>
<script>
    //x를 클릭 했을 때 이미지 삭제하기
    $(document).on("click",".closeWrap",function(){
        $(this).parent().remove();
    });
    
    //키보드 입력시 문자수를 카운트
    $("#content").on("keyup keypress keydown",function(){
    	var textCount = $("#content").val().length;
        $("#textCount").html(textCount);
    });
    
</script>
</html>