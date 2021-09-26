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

    <div class="container mt-3">
        <div class="d-flex justify-content-between mb-3">
            <div class="p-2">많이본 Q&A</div>
            <button id="fitWriteForm" type="button" class="btn btn-primary rounded-pill pl-3 pr-3 mr-5" style="width:100px">질문하기</button>
        </div>

        <hr/>

        <div id="bestFitList" class="d-flex flex-wrap">
            <!-- <div class="endFit card m-2" style="width:250px;height:250px">
                <div class="card-body">
                    <h4 class="card-title mt-3"><span class="text-success">Q. </span>다이어트를 시작하려면 어떻게 해야 할까요?</h4>
                    <div class="d-flex mt-3">
                        <div class="p-2 flex-fill">운동</div>
                        <div class="p-2 flex-fill">닉네임</div>
                    </div>
                    <div class="d-flex">
                        <div class="p-2 flex-fill">조회수10</div>
                        <div class="p-2 flex-fill">답변수2</div>
                    </div>             
                    <a href="#" class="btn btn-white stretched-link"></a>
                </div>
            </div> -->
        </div>
            
    </div>

    <div class="container mt-3">
        <div class="p-2">최신 지식fit</div>
        
        <hr/>

        <div id="category" class="d-flex justify-content-center mb-3">
            <button type="button" class="btn btn-primary rounded-pill pl-3 pr-3 m-3" style="width:100px">전체</button>
            <button type="button" class="btn btn-outline-primary rounded-pill pl-3 pr-3 m-3" style="width:100px">자세교정</button>
            <button type="button" class="btn btn-outline-primary rounded-pill pl-3 pr-3 m-3" style="width:100px">식단</button>
            <button type="button" class="btn btn-outline-primary rounded-pill pl-3 pr-3 m-3" style="width:100px">운동</button>
            <button type="button" class="btn btn-outline-primary rounded-pill pl-3 pr-3 m-3" style="width:100px">고민</button>
            <button type="button" class="btn btn-outline-primary rounded-pill pl-3 pr-3 m-3" style="width:100px">기타</button>
        </div>

        <div id="newFitList" class="d-flex flex-wrap">
            <!-- <div class="card m-2 " style="width:250px;height:250px">
                <div class="card-body">
                    <h4 class="card-title mt-3"><span class="text-primary">Q. </span>다이어트를 시작하려면 어떻게 해야 할까요?</h4>
                    <div class="d-flex mt-3">
                        <div class="p-2 flex-fill">운동</div>
                        <div class="p-2 flex-fill">닉네임</div>
                    </div>
                    <div class="d-flex">
                        <div class="p-2 flex-fill">조회수10</div>
                        <div class="p-2 flex-fill">답변수2</div>
                    </div>             
                    <a href="#" class="btn btn-white stretched-link"></a>
                </div>
            </div> -->
         </div>   
    </div>
</body>
<style>
    /*카드의 테두리 설정*/
      .card{
        border-radius: 20px;
        border-top : 5px solid #0275d8;
        transition: 0.5s;
      }
      .card:hover{
        border-left : 1px solid #0275d8;
        border-right : 1px solid #0275d8;
        border-bottom : 1px solid #0275d8;
        transition: 0.5s;
      }
      /*답변완료시 테두리와 배경색을 초록색으로 변경*/
      .endFit{
        border-top : 5px solid #5cb85c;
        background-color: rgba(92, 184, 92,0.1);
        transition: 0.5s;
      }
      .endFit:hover{
        border-left : 1px solid #5cb85c;
        border-right : 1px solid #5cb85c;
        border-bottom : 1px solid #5cb85c;
        transition: 0.5s;
      }
</style>
<script>
//무한 스크롤
$(window).scroll(function(){
    //스크롤한 px
    var scrollTop = $(this).scrollTop();
    //console.log('scrollTop',scrollTop);
    //보여지는 세로 높이
    var innerHeight = $(this).innerHeight();
    //console.log('innerHeight',innerHeight);    
    //페이지 자체의 높이
    var height = $(document).height();
    //console.log('height',height);

    //console.log('scrollTop+innerHeight',scrollTop+innerHeight);

    if(scrollTop+innerHeight>=height){
        /* var content = "";
        content += '<div id="spinner" style="text-align: center;">';
        content += '<div class="spinner-border text-primary m-5"></div>';
        content += '</div>';    
        $("#newFitList").append(content); */
        newFitListCall(cnt, category);
    }
    
});

//최신 지식핏 목록 불러오기

//무한 스크롤을 실행 시킨 횟수, 목록을 불러올 때 마다 +1씩 증가한다
var cnt = 1;
//목록을 불러올 카테고리
var category = '전체';
console.log('category',category);
//선택되어 있는 카테고리 버튼
var selCategory = $("#category button").eq(0);
bestFitListCall();
newFitListCall(cnt, category);

//카테고리를 클릭시 실행
$("#category button").on("click",function(){
	//무한 스크롤 실행 횟수를 1로 변경
	cnt = 1;
	//카테고리 변수에 클릭된 버튼의 값을 대입
	category = $(this).html();
	console.log('category',category);
	//기존에 선택되어 있는 버튼을 연하게 하기
	selCategory.removeClass("btn-primary");
	selCategory.addClass("btn-outline-primary");
	//선택된 버튼을 진하게 하기
	$(this).removeClass("btn-outline-primary");
	$(this).addClass("btn-primary");
	//선택된 버튼을 selCategory에 저장
	selCategory = $(this);
	console.log('selCategory',selCategory);
	
	$("#newFitList").empty();
	newFitListCall(cnt, category);
});
//많이 본 지식핏 목록을 4개 불러오는 함수
function bestFitListCall(cnt, category){
	$.ajax({
		url:'bestFitList',
	    type:'post',
	    data:{},
	    dataType:'json',
	    success:function(data){
	        console.log(data.success);
	        console.log(data.list);
	        bestFitListDraw(data.list);
	    },
	    error:function(e){
			console.log(e);
		}
	});
}

//최신 지식핏 목록을 불러오는 함수 (페이징처리를 위한 cnt, 카테고리)
function newFitListCall(cnts, category){
	$.ajax({
		url:'newFitList',
	    type:'post',
	    data:{'cnt':cnts,
	        'category':category
	    },
	    dataType:'json',
	    success:function(data){
	        console.log(data.success);
	        newFitListDraw(data.list);
	        if(data.success && data.listSize>0){
	        	cnt++;
	        	console.log('cnt',cnt);
	        	$("#spinner").remove();
	        }
	    },
	    error:function(e){
			console.log(e);
		}
	});
}

//많이본 지식핏 목록을 그려주는 함수
function bestFitListDraw(list){
	var content = "";
	list.forEach(function(item, index){
		
        content += '<div class="card m-2 '+(item.k_solutionYN == 'Y'?'endFit ':'')+'" style="width:250px;height:250px">';
        content += 		'<div class="card-body">';
        content += 			'<h4 class="card-title mt-3"><span class="'+(item.k_solutionYN == 'Y'?'text-success ':'text-primary')+'">Q. </span>'+item.k_title+'</h4>';
        content += 			'<div class="d-flex mt-3">';
        content += 				'<div class="p-2 flex-fill">'+item.k_name+'</div>';
        content += 				'<div class="p-2 flex-fill">'+item.u_nick+'</div>';   
        content += 			'</div>';
        content += 			'<div class="d-flex">';
        content += 				'<div class="p-2 flex-fill">조회수'+item.k_view+'</div>';
        content += 				'<div class="p-2 flex-fill">답변수'+item.k_replyCnt+'</div>';
        content += 			'</div>';
        content += 			'<a href="fitDetail?k_no='+item.k_no+'" class="btn btn-white stretched-link"></a>';
        content += 		'</div>';
        content += '</div>';
	});
	
	$("#bestFitList").append(content);
}

//최신 지식핏 목록을 그려주는 함수
function newFitListDraw(list){
	var content = "";
	list.forEach(function(item, index){
        content += '<div class="card m-2 '+(item.k_solutionYN == 'Y'?'endFit ':'')+'" style="width:250px;height:250px">';
        content += 		'<div class="card-body">';
        content += 			'<h4 class="card-title mt-3"><span class="'+(item.k_solutionYN == 'Y'?'text-success ':'text-primary')+'">Q. </span>'+item.k_title+'</h4>';
        content += 			'<div class="d-flex mt-3">';
        content += 				'<div class="p-2 flex-fill">'+item.k_name+'</div>';
        content += 				'<div class="p-2 flex-fill">'+item.u_nick+'</div>';   
        content += 			'</div>';
        content += 			'<div class="d-flex">';
        content += 				'<div class="p-2 flex-fill">조회수'+item.k_view+'</div>';
        content += 				'<div class="p-2 flex-fill">답변수'+item.k_replyCnt+'</div>';
        content += 			'</div>';
        content += 			'<a href="fitDetail?k_no='+item.k_no+'" class="btn btn-white stretched-link"></a>';
        content += 		'</div>';
        content += '</div>';
	});
	
	$("#newFitList").append(content);
}

//질문하기 버튼을 클릭하면 글쓰기 폼으로 이동
$("#fitWriteForm").on("click",function(){
	location.href="fitWriteForm";
});

//msg가 있으면 보여주기
var msg = "${msg}";
if(msg != ""){
	alert(msg);
}
</script>
</html>