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
	
	<form name="fitWrite" action="fitWrite" method="post" enctype="multipart/form-data">
    <div id="fitTitle" class="container mt-3 mb-3 pt-4 pb-4 pl-5 pr-4">
        <div class="row">
            <div id="title"class="col-md-8">
                <div class="d-flex">
                    <span id="q">Q.</span>
                    <input type="text" name="k_title" class="form-control" id="k_title"> <!-- 제목 --> 
                </div>
            </div>
            <div id="titleBtn" class="col-md-4">
                <button id="submit" type="submit" class="btn btn-primary float-right ml-3 mt-1">질문등록</button>
                <button id="cancel" type="button" class="btn btn-outline-primary float-right ml-3 mt-1">등록취소</button>
            </div>
        </div>
    </div>

    <div id="fitContent" class="container pt-4 pl-5">
        <div class="d-inline-flex">  
            <div id="c" class="mr-3 pt-2 text-secondary font-weight-bold">카테고리</div>
            <div id="k_code" class="form-group" >
                <select name="k_code" class="form-control"> <!-- 카테고리 -->
                  <option value="">--선택--</option>
                  <option value="K001">자세교정</option>
                  <option value="K002">식단</option>
                  <option value="K003">운동</option>
                  <option value="K004">고민</option>
                  <option value="K005">기타</option>
                </select>
            </div>
        </div>
        <div class="d-inline-flex float-right">
            <label for="photo" class="mr-3"><img src="resources/img/image.png" alt="사진등록" width="30px" height="30px" id="photoRegister"></label>
            <input type="file" name="photo" multiple id="photo" accept="image/gif,image/jpeg,image/png,image/jpg" > <!-- 사진 -->
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
	        <textarea id="k_content" name="k_content" placeholder="궁금한 사항을 입력해 보세요."></textarea> <!-- 내용 -->
			<!-- 글자수 카운트 -->
			<div id="textCountWrap"><span id="textCount">0</span><span>/1000</span></div>
		</div>
        <hr/>
        <!-- 이미지가 들어간다 -->
        <div id="imageWrap">
            <!-- <div class="imgWrap">
                <img src="resources/img/fitimg.jpg" width="400px" height="300px"> 이미지 4장까지
                <a href="#" class="closeWrap"><img src="resources/img/close.png" width="20px" height="20px"></a>
            </div> -->
        </div>
        <!-- 동영상이 들어간다 -->
        <div id="movieWrap">
            <!-- <div class="iframeWrap"> 동영상 1개만
                <iframe width="400" height="300" src="https://www.youtube.com/embed/myNjmnvI6x0" title="YouTube video player" 
                    frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
                </iframe>
                <a href="#" class="closeIframeWrap"><img src="resources/img/close.png" width="20px" height="20px"></a>
            </div> -->
        </div>
        
        <!-- 이미지 순서 저장 ??? 추후 논의 -->
        <!-- 에러처리를 위해 0을 기본으로 집어넣음 -->
        <input type="hidden" name="imgNo" value="0">
        
        <!-- 동영상 url추출 저장 -->
        <input type="text" name="url" id="iframeUrl">

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

</style>
<script>
	//내용 글자수 카운트
	var textCount = 0;
	
	//x를 클릭 했을 때 동영상 삭제하기
    $(document).on("click",".closeImgWrap",function(){
        $(this).parent().remove();
    });
	
    //x를 클릭 했을 때 동영상 삭제하기
    $(document).on("click",".closeIframeWrap",function(){
        $(this).parent().remove();
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
    
    
    //파일 등록시 이벤트

/*     $("#photo").on("change",function(e){
    	console.log('썸네일 등록');
    	//썸네일 등록
        	var reader = new FileReader();
        	reader.onload = function(e){
        		var content = "";
        		content += '<div class="imgWrap">';
        		content += '<img src="'+e.target.result+'" width="400px" height="300px">';
        		content += '<a href="#" class="closeImgWrap"><img src="resources/img/close.png" width="20px" height="20px"></a>';
        		content += '</div>';
        		
        		$("#imageWrap").empty().html(content);
        		console.log('value',$("#photo").val());
        		console.log('e.target.files',e.target.files);
        		console.log('e.target.result',e.target.result);
        		
        	}; 
        	console.log('e.target.files[0]',e.target.files[0]);
    		
        	reader.readAsDataURL(e.target.files[0]); 
        
    }); */
    
	//파일 등록시 이벤트 (최대 4장)
    $("#photo").on("change",function(e){
    	console.log('썸네일 등록');
    	
    	//기존의 썸네일을 삭제
    	$("#imageWrap").empty();
    	
    	//썸네일 등록
    	var files = e.target.files;
    	console.log(e.target.files);
    	console.log(e.target.files.length);
    	
    	if(e.target.files.length>=5){
    		alert("최대 4장까지만 업로드 가능합니다.");
    	}else{
    		//유사배열을 배열로 변환
        	var filesArr = Array.prototype.slice.call(files);
        	
        	filesArr.forEach(function(file, index){
        		
            	var reader = new FileReader();
            	
            	//파일이름
            	console.log('file.name',file.name);
            	
    			var result = '';
            	reader.onload = function(e){
            		
            		console.log('e.target.result',e.target.result);
            		
            		var content = '';
            		content += '<div class="imgWrap">';
            		content += '<img src="'+e.target.result+'" width="400px" height="300px">';
            		content += '<a href="#" class="closeImgWrap"><img src="resources/img/close.png" width="20px" height="20px"></a>';
            		content += '<input type="hidden" name="imgNo" value="'+(index+1)+'">';
            		content += '</div>';
            	
            		$("#imageWrap").append(content);
            	};
            	        	
            	console.log('file',file);
            	reader.readAsDataURL(file);
        		
        	});
        	
        	//아이콘을 초록색으로 변경
        	$("#photoRegister").attr("src","resources/img/image_green.png");
    	}//end else
    	
       
    });

    //글등록 전 처리
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
    	}
    	
    	//빈 칸이 없으면 글쓰기 등록
	});
    
</script>
</html>