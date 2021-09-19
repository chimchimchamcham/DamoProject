<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	<form name="fitUpdate" action="fitUpdate" method="post" enctype="multipart/form-data">
    <div id="fitTitle" class="container mt-3 mb-3 pt-4 pb-4 pl-5 pr-4">
        <div class="row">
            <div id="title"class="col-md-8">
                <div class="d-flex">
                    <span id="q">Q.</span>
                    <input type="text" name="k_title" class="form-control" id="k_title" value="${dto.k_title }"> <!-- 제목 --> 
                </div>
            </div>
            <div id="titleBtn" class="col-md-4">
                <button id="submit" type="submit" class="btn btn-primary float-right ml-3 mt-1">수정하기</button>
                <button id="cancel" type="button" class="btn btn-outline-primary float-right ml-3 mt-1">수정취소</button>
            </div>
        </div>
    </div>

    <div id="fitContent" class="container pt-4 pl-5">
        <div class="d-inline-flex">  
            <div id="c" class="mr-3 pt-2 text-secondary font-weight-bold">카테고리</div>
            <div id="k_code" class="form-group" >
                <select name="k_code" class="form-control"> <!-- 카테고리 -->
                  <option value="">--선택--</option>
                  <option value="K001" <c:if test="${dto.k_code eq 'K001' }">selected</c:if>>자세교정</option>
                  <option value="K002" <c:if test="${dto.k_code eq 'K002' }">selected</c:if>>식단</option>
                  <option value="K003" <c:if test="${dto.k_code eq 'K003' }">selected</c:if>>운동</option>
                  <option value="K004" <c:if test="${dto.k_code eq 'K004' }">selected</c:if>>고민</option>
                  <option value="K005" <c:if test="${dto.k_code eq 'K005' }">selected</c:if>>기타</option>
                </select>
            </div>
        </div>
        <div class="d-inline-flex float-right">
            <label for="photo" class="mr-3"><img src="resources/img/image.png" alt="사진등록" width="30px" height="30px" id="photoRegister"></label>
            <!-- 글쓰기 폼과 다르게 multiple을 적용하지 않았다 -->
            <input type="file" name="photo" id="photo" accept="image/gif,image/jpeg,image/png,image/jpg" > <!-- 사진 -->
            <a class="mr-3" data-toggle="modal" data-target="#myModal"><img src="resources/img/link.png" alt="링크등록" width="30px" height="30px" id="linkRegister"></a> 

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
                    
                        <img src="resources/img/search.png" alt="링크" width="20px" height="20px" id="linkSearch">
                    </div>    
                </div>
            </div>

        </div>

        <hr/>

		<div id="contentWrap">
	        <!-- 글이 들어간다 -->
	        <textarea id="k_content" name="k_content" placeholder="궁금한 사항을 입력해 보세요.">${dto.k_content }</textarea> <!-- 내용 -->
			<!-- 글자수 카운트 -->
			<div id="textCountWrap"><span id="textCount"></span><span>/1000</span></div>
		</div>
        <hr/>
        <!-- 이미지가 들어간다 -->
        <div id="imageWrap">      
            <c:forEach items="${photoList}" var="photo">
				<div class="imgWrap">
	                <img src="/photo/${photo }" width="400px" height="300px"> <!-- 이미지 4장까지 -->
	                <a href="#" class="closeImgWrap"><img src="resources/img/close.png" width="20px" height="20px"></a>
	                <input type="hidden" name="imgNo" value="${photo }">
            	</div>
			</c:forEach>		
            
        </div>
        <!-- 동영상이 들어간다 -->
        <div id="movieWrap">
            <c:if test="${url ne null }">
            	<div class="iframeWrap"> <!-- 동영상 1개만 -->
	                <iframe width="400" height="300" src="https://www.youtube.com/embed/${url }" title="YouTube video player" 
	                    frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
	                </iframe>
	                <a href="#" class="closeIframeWrap"><img src="resources/img/close.png" width="20px" height="20px"></a>
            	</div>
            </c:if>
        </div>
        
        <!-- 에러처리를 위해 0을 기본으로 집어넣음 -->
        <input type="hidden" name="imgNo" value="0">
        
        <!-- id를 부여하기 위해 임시로 input type file을 저장해 놓는 곳 -->
        <div id="fileTemp"></div>
        
        <!-- 업로드할 input type file을 저장하는 곳 -->
        <div id="uploadFile"></div>
        
        <!-- 동영상 url추출 저장 -->
        <input type="hidden" name="url" id="iframeUrl" value="${url }">
        
        <!-- 글번호 저장 -->
        <input type="hidden" name="k_no" value="${param.k_no }">
        
        <!-- 빈칸-->
        <div id="emptyWrap"></div>
    </div>
    </form>
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
    #k_title{
        border : none;
        border-bottom : 2px solid #0275d8;
        border-radius : 0px;
        font-size : 1.5rem;
    }
    #titleBtn button{
        border-radius : 0px;
    }
    #k_code{
        width : 120px;
    }
    #photo{
        display : none;
    }
    #linkSearch{
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
    .closeImgWrap{
        position : absolute;
        top : 10px;
        left : 410px;
    }
    .closeIframeWrap{
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
    #k_content{
    	resize : none;
    	padding : 20px;
    	width : 98%;
    	height : 300px;
    }
    #k_content:focus{
    	outline : none;
    }
    #textCountWrap{
    	position : absolute;
    	top : 280px;
    	left : 30px;
    	color : gray;
    }
	#uploadFile{
		display : none;
	}
</style>
<script>
	//사진 추가 등록시 번호를 부여하는 변수
	var uploadNo = 1;

	//이미지가 있냐 없냐에 따라 아이콘의 색을 변경 (1장 이상이면 초록, 없으면 검정)
	changeImgIcon();
	//동영상이 있냐 없냐에 따라 아이콘의 색을 변경 (1장 이상이면 초록, 없으면 검정)
	changeIframeIcon();
	
	//내용 글자수를 카운트
	var textCount = $("#k_content").val().length;
	$("#textCount").html($("#k_content").val().length);

	//x를 클릭 했을 때 이미지 삭제하기
    $(document).on("click",".closeImgWrap",function(){
        $(this).parent().remove();
        changeImgIcon();
        
        var imgNo = $(this).parent().find("input[type='hidden']").val();
        deleteInputTyleFile(imgNo);
    });
	
    //x를 클릭 했을 때 동영상 삭제하기
    $(document).on("click",".closeIframeWrap",function(){
        $(this).parent().remove();
        $("#iframeUrl").val("");
        $("#linkRegister").attr("src","resources/img/link.png");
    });
    
    //키보드 입력시 문자수를 카운트
    $("#k_content").on("keyup keypress keydown",function(){
    	textCount = $("#k_content").val().length;
        $("#textCount").html(textCount);
        if(textCount>1000){
        	$("#textCountWrap").css({"color":"red"});
        }else{
        	$("#textCountWrap").css({"color":"gray"});
        }
    });
    
    //등록취소를 눌렀을 때 지식핏 목록으로 이동
    $("#cancel").on("click",function(){
    	location.href = "fitMain";
    });
    
    //모달 닫기 버튼 클릭시 링크에 있는 주소 일부를 추출해서 iframe으로 만들어 주기
    $("#checkBtn").on("click",function(){
    	var url = $("#link").val();
    	console.log(url);
    	
    	if(url == ''){
    		$("#movieWrap").empty();
    		$("#iframeUrl").val('');
    	}else{
    		url = url.split('=')[1].split('&')[0]
    		
    		var content = "";
        	content += '<div class="iframeWrap">';
        	content += '<iframe width="400" height="300" src="https://www.youtube.com/embed/'+url+'" title="YouTube video player" ';
        	content += 'frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>';
        	content += '</iframe>';
        	content += '<a href="#" class="closeIframeWrap"><img src="resources/img/close.png" width="20px" height="20px"></a>';
        	content += '</div>';
        	
        	$("#iframeUrl").val(url);
        	$("#movieWrap").empty().html(content);
        	$("#linkRegister").attr("src","resources/img/link_green.png");
        	$("#link").val('');
    	}
    	
    });
    
	//파일 등록시 이벤트 (최대 4장)
    $("#photo").on("change",function(e){
    	console.log('썸네일 등록');
    	
    	//imageWrap에 자식요소가 4개 이상 있을 경우 업로드 막기
    	if($("#imageWrap").children().length>=4){
    		alert("최대 4장까지만 업로드 가능합니다.");
    		$("#photo").val("");
    	}else{
            	var reader = new FileReader();

            	reader.onload = function(e){
            		
            		var content = '';
            		content += '<div class="imgWrap">';
            		content += '<img src="'+e.target.result+'" width="400px" height="300px">';
            		content += '<a href="#" class="closeImgWrap"><img src="resources/img/close.png" width="20px" height="20px"></a>';
            		content += '<input type="hidden" name="imgNo" value="'+uploadNo+'">';
            		content += '</div>';
            		
            		$("#imageWrap").append(content);
            		
            		//file 객체 복사 함수
                	copyInputTypeFile(uploadNo);
            		
            	};

            	reader.readAsDataURL(e.target.files[0]);
    		
            	//changeImgIcon()를 사용해면 length가 0이 되는 버그가 있어 강제로 초록색을 변경
            	$("#photoRegister").attr("src","resources/img/image_green.png");
    		
    	}//end else
    	
    });

    //글수정 전 처리
    $("#submit").click(function(){
    	if($("#k_title").val()==""){
    		alert("제목을 입력하세요");
    		return false;
    	}else if($("#k_code select").val()==""){
    		alert("카테고리를 선택하세요");
    		return false;
    	}else if($("#k_content").val()==""){
    		alert("내용을 입력하세요");
    		return false;
    	}else if($("#k_content").val().length>1000){
    		alert("글자수를 1000자 이하로 작성해주세요");
    		return false;
    	}
    	
    	//빈 칸이 없으면 글수정
	});
    
    //이미지가 있냐 없냐에 따라 아이콘의 색을 변경 (1장 이상이면 초록, 없으면 검정)
    function changeImgIcon(){
    	var length = $("#imageWrap").children().length;
    	console.log("length : ",length);
    	if(length>0){
    		$("#photoRegister").attr("src","resources/img/image_green.png");
    	}else{
    		$("#photoRegister").attr("src","resources/img/image.png");
    	}
    }
    
    //동영상이 있냐 없냐에 따라 아이콘의 색을 변경 (1장 이상이면 초록, 없으면 검정)
    function changeIframeIcon(){
    	var length = $("#movieWrap").children().length;
    	if(length>0){
    		$("#linkRegister").attr("src","resources/img/link_green.png");
    	}else{
    		$("#linkRegister").attr("src","resources/img/link.png");
    	}
    }
    
    //등록한 input type file을 임시 div #fileTemp에 저장하고 id를 부여한 뒤, #uploadFile에 복사본 저장 -> #photo value 비우기
    function copyInputTypeFile(idNo){
    	console.log("copyImputTypeFile 실행");
    	
    	//#photo를 #fileTemp에 복사
    	$("#fileTemp").append($("#photo").clone());
    	//uploadNo로 id를 부여 (나중에 삭제할 때 이 번호를사용)
    	$("#fileTemp #photo").attr("id",idNo);
    	//uploadNo로 name을 file로 부여
    	$("#fileTemp #"+idNo).attr("name","file");
    	//#fileTemp -> #uploadFile로 이동
    	$("#uploadFile").append($("#fileTemp #"+idNo));
    	console.log("#uploadFile length",$("#uploadFile").children().length);
    	//#fileTemp 비우기
    	$("#fileTemp").empty();
    	//#photo val 비우기
    	$("#photo").val("");
  		//uploadNo +1하기
  		uploadNo++;
  		console.log('uploadNo',uploadNo);
    }
    
    //x버튼을 클릭 했을 때 #uploadFile에 있는 file삭제
    function deleteInputTyleFile(imgNo){
    	console.log("deleteImputTypeFile 실행");
    	console.log("imgNo : ",imgNo);
    	
    	$("uploadFile #"+imgNo).remove();
    }
</script>
</html>