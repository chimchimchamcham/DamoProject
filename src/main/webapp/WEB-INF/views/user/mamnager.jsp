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
    <style>
        li.list-group-item{
            border-bottom-left-radius:0  !important;
            border-bottom-right-radius:0 !important;
            
        }
	.display-none{
		display:none;
	}
	tbody{
		text-align: center;
	}
	
    </style>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="resources/js/jquery.twbsPagination.js"></script> 
	

	
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
                        <tbody class="userbody">
                        
                        <c:forEach items="${userlist}" var="dtouser">
                          <tr class="text-center">
                            <td>${dtouser.u_id}</td>
                            <td>${dtouser.u_nick}</td>
                            <td>${dtouser.u_name}</td>
                            <td>${dtouser.u_email}</td>
                          </tr>
						</c:forEach>
						
                        </tbody>
                      </table>
                </div>
            </div>
            <div class="container row bg-light">
                <ul class="pagination mx-auto userpage" id="pagination">

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
                      <tbody class="notifybody">
                      


                      </tbody>
                    </table>
              </div>
          </div>
          <div class="container row bg-light">
              <ul class="pagination mx-auto notifypage" id="pagination">
                 
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
                      <tbody class="blackbody">
   
   					
                        
                      </tbody>
                    </table>
              </div>
          </div>
          <div class="container row bg-light">
              <ul class="pagination mx-auto blackpage" id="pagination">
              
              </ul>
          </div>
        </div>
    </div>
    
      <!-- 신고 팝업 Modal -->
  <div class="modal fade " id="notifymyModal" role="dialog">
    <div class="modal-dialog modal-lg modal-dialog-centered">
      <!-- Modal content-->
      <div class="modal-content row">
        <div class="modal-header bg-danger px-5">
          <h6 class="modal-title">신고 상세보기</h6>
          <button type="button" class="close text-light" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body justify-content-center row d-flex m-5" style="font-size: 10px; font-weight: 900;">

        </div>
      </div>
    </div>
  </div>
    
    
          <!-- 블랙리스트 팝업 Modal -->
  <div class="modal fade " id="blackmyModal" role="dialog">
    <div class="modal-dialog modal-lg modal-dialog-centered">
      <!-- Modal content-->
      <div class="modal-content row">
        <div class="modal-header bg-dark px-5 text-light">
          <h6 class="blacktitle modal-title">블랙리스트 상세보기</h6>
          <button type="button" class="close text-light" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body justify-content-center row d-flex m-5" style="font-weight: 900;">

        </div>
      </div>
    </div>
  </div>
    
    
    
</body>


<script>


$(document).ready(function(){
	
	//블랙리스트 등록하면
	var msg="${msg}";
	if(msg!=""){
		alert(msg);
	}
	
	
	
	
//notify-팝업에 뿌려줘야 하는 것들
   $(document).ready(function(){
		
 
	var currPage = 1;

	userlistCall(currPage);
	
	$("ul.userpage").change(function(){
		   //유저 페이징 초기화
		   $(".userpage").twbsPagination('destory');
		   userlistCall(currPage);
		});
	
	$("ul.notifypage").change(function(){
		   //유저 페이징 초기화
		   $(".notifypage").twbsPagination('destory');
		   notifylistCall(currPage);
		});
	
	$("ul.blackpage").change(function(){
		   //유저 페이징 초기화
		   $(".blackpage").twbsPagination('destory');
		   blacklistCall(currPage);
		});
	
	
});


});

//신고 팝업
$(document).on('click',".notifybody tr",function(){
	 
	var notifyno =  $(this).children('td.n_no').text();
	console.log(notifyno);
	
	var urler = './check/notifyinfo';
	 $.ajax({
	 	      url : urler,
	 	      type : 'post',
	 	      data : {no:notifyno},
	 	      dataType : 'json',
	 	      success : function(data){
	 	       console.log(data.notifyinfo);
	 	       notifypoplist(data.notifyinfo);

	 	      },error : function(error){
	 	         console.log(error);
	 	      }
	 	   });
	//모달
	$('#notifymyModal').modal('show');
	
	
	
	

	
	});
	
	//신고 팝업 그리기
 function notifypoplist(list){
		console.log(list);
   	var content = "";
	   for(var i = 0; i<list.length; i++){
	     	content +=  "<div class='col-12 row text-left'>";
  	    	content +=   "<div class='col-2 m-1 mb-3 text-left'>신고번호 </div><div class='col-1 mb-3 m-1'>"+list[0].n_no+"</div>";
  	    	content +=   "<div class='col-2 m-1 mb-3 text-center'>신고 글 번호</div><a href="+list[0].n_notifiedno+" class='col-1 mb-3 m-1 text-center'>"+list[0].n_notifiedno+"</a>";
  	    	content +=   "<div class='col-2 m-1 mb-3 text-right'>신고날짜</div><div class='col-3 mb-3 m-1 text-right'>"+list[0].n_dt+"</div>";
  	    	content +=   "<div class='col-2 my-3 m-1 text-left'>대분류 코드 </div> <div class='col-4 my-3 m-1'>"+list[0].n1_name+"</div>";
  	    	content +=   "<div class='col-2 my-3 m-1 text-left'>중분류 코드</div> <div class='col-2 my-3 m-1'>"+list[0].n2_name+"</div>";
  	    	content +=   "<div class='col-2 mt-3 m-1 text-left'>신고받은 아이디</div> <div id="+list[0].n_receiveid+" class='receid col-4 mt-3 m-1'>"+list[0].n_receiveid+"</div>";
  	    	content +=   "<div class='col-2 mt-3 m-1 text-left'>신고한 아이디</div> <a href="+list[0].n_sendid+" class='col-2 mt-3 m-1'>"+list[0].n_sendid+"</a>";
  	    	content +=	 "<div class='col-12 row'>";
  	    	content +=       "<textarea class='col-12 .form-control py-4' style='resize: none; height:100px'>"+list[0].n_content+"</textarea>";
  	    	content +=   "</div>";
  	    	content +=   "<div class='col-12 row d-flex justify-content-end mt-3'>";
  	    	content +=   	`<button type="button" class="notifytoblackbtn btn text-light btn-danger" data-dismiss="modal">블랙리스트 등록</button>`;
  	    	content +=	"</div>";
	        content +=  "</div>";	      
	   }
	   $(".modal-body").empty();
	   $("#notifymyModal .modal-body").append(content);
     }


	
	
	
	 //블랙리스트 등록
	 $(document).on('click',".notifytoblackbtn",function(){
		$('h6.blacktitle').text('블랙리스트 등록');
		var black_id = $('.receid').attr('id');//신고 받은 아이디
		var loginId = "${sessionScope.loginId}"; //로그인한 관리자 아이디 가져오기
		var loginManager="${sessionScope.loginManager}";//로그인한 아이디가 ('Y')메니저일경우

		console.log("loginManager:"+loginManager);
		
		if (loginManager=='Y') {
			console.log('당신은 관리자 입니다');
			goblacklistpop(black_id,loginId)
			$('#blackmyModal').modal('show');
		}else{
			console.log('오류 당신은 관리자가 아닙니다');
		}
		
		
	});
	
	//블랙리스트 등록 그리기
	 function goblacklistpop(black_id,loginId){
		
			console.log("black_id:"+black_id);
			console.log("loginId:"+loginId);
			
	    	var content = "";
				
	 	     	content +=  "<div  class='col-12 row text-left'>";
	   	    	content +=   "<div class='my-3 mr-1 text-right'>ID</div><div class='reid my-3  text-left'>"+black_id+"</div>";
	   	    	content +=   "<div class='col-3 my-3 text-right'>종류</div><div class='my-3  text-right'>";
		   	    	content +=   "<select name='scope' id='blackscope'>";
		   	    	content +=     	"<option value=''>선택</option>";
		   	    	content +=     	"<option value='B001'>전체 활동 중지</option>";
		   	    	content +=     	"<option value='B002'>지식핏 활동 중지</option>";
		   	    	content +=   	"<option value='B003'>다모여톡 활동 중지</option>";
		   	    	content += 	 "</select>";
	   	    	content +=   "</div>";
	   	    	content +=   "<div class='col-2 my-3 text-right'>관리자ID</div><div class='my-3  text-right'>"+loginId+"</div>";
	   	    	
	   	    	var now = new Date();//등록날짜
	   	 	
			      let startyear = now.getFullYear();
			      let startmonth = now.getMonth();
			      let startday = now.getDate();
			      
			      let startedday = startyear+"/"+(startmonth+1)+"/"+startday;
	   	    	
	   	    	
	   	    	content +=   "<div class='col-2 my-3 m-1 text-right'>등록날짜 </div> <div class=' my-3 m-1'>"+startedday+"</div>";
	   	    	content +=   "<div class='col-4 my-3 m-1 text-right'>종료날짜 </div> <div class=' my-3 m-1'>";
	   	    	
	   	    	content +=	"<input type='date' id='endday' name='blackendtime'>";
	   	    	
	   	    	content +=	 "</div>";
	   	    	content +=	 "<div class='col-12 row'>";
	   	    	content +=       "<textarea class='blackcause col-12 .form-control py-4' style='resize: none'; height:100px placehorder='여기에다 이유를 써주세요'></textarea>";
	   	    	content +=   "</div>";
		   	    content +=   "<div class='col-12 row d-flex justify-content-end mt-3'>";
				content +=   	"<button type='button' class='register btn text-light btn-danger'>블랙리스트 등록</button>";
				content +=	"</div>";	
	 	        content +=  "</div>";
	 	 	   $(".modal-body").empty();
	 	 	   $("#blackmyModal .modal-body").append(content);
	 	 	   
	 	 	   
	 			//블랙리스트 등록 버튼 눌렀을때
	 		 	 $(document).on('click',"button.register",function(){
	 				
	 		 		if (blacklistscopeoption_val!=undefined&&blacklistendday_val!=undefined&&blacklistcause_val!=undefined) {
	 		 			var url = "./registerblacklist/"+black_id+"/"+loginId+"/"+blacklistscopeoption_val+'/'+blacklistendday_val+'/'+blacklistcause_val;
	 		 			$(location).attr('href',url);						
					}else{
						alert('모든 값을 입력햐주세요');
					}
	 		 	});
	 	 	   

	      }
	//동적으로 추가한 select value값
	 var blacklistscopeoption_val;
	 $(document).on('change','#blackscope',function(){
		 	console.log($(this).val());
		 	blacklistscopeoption_val = $(this).val();
		 });
	//동적으로 추가한 달력 value값
	 var blacklistendday_val;
	 $(document).on('change','#endday',function(){
		 	console.log($(this).val());
		 	blacklistendday_val = $(this).val();
		 });
	//동적으로 추가한 textarea value값
	 var blacklistcause_val;
	 $(document).on('change','.blackcause',function(){
		 	console.log($(this).val());
		 	blacklistcause_val = $(this).val();
		 });
	 
	 
	
	
//블랙리스트 팝업
 $(document).on('click',".blackbody tr",function(){
 	 
 	var blackno =  $(this).children('td.b_no').text();
 	console.log(blackno);
 	
 	var urler = './check/blackinfo';
 	 $.ajax({
 	 	      url : urler,
 	 	      type : 'post',
 	 	      data : {no:blackno},
 	 	      dataType : 'json',
 	 	      success : function(data){
 	 	       console.log(data.blackinfo);
 	 	       blackpoplist(data.blackinfo);

 	 	      },error : function(error){
 	 	         console.log(error);
 	 	      }
 	 	   });
 	//모달
 	$('#blackmyModal').modal('show');
 	});
 	
 	
 	
 	
 //블랙리스트 상세 팝업 그리기
  function blackpoplist(list){
 		console.log(list);
    	var content = "";
 	   for(var i = 0; i<list.length; i++){
 	     	content +=  "<div class='col-12 row text-left'>";
   	    	content +=   "<div class='my-3 mr-1 text-right'>ID</div><div class='my-3  text-left'>"+list[0].u_id+"</div>";
   	    	content +=   "<div class='col-3 my-3 text-right'>종류</div><div class='my-3  text-right'>"+list[0].c_name+"</div>";
   	    	content +=   "<div class='col-4 my-3 text-right'>관리자ID</div><div class='my-3  text-right'>"+list[0].b_adminid+"</div>";
	   	     
   	    	var date = new Date(list[0].b_startdt);//등록날짜
	
		      let startyear = date.getFullYear();
		      let startmonth = date.getMonth();
		      let startday = date.getDate();
		      
		      let startedday = startyear+"/"+(startmonth+1)+"/"+startday;
   	    	content +=   "<div class='col-2 my-3 m-1 text-right'>등록날짜 </div> <div class='my-3 m-1'>"+startedday+"</div>";
   	    	
   	    	date = new Date(list[0].b_enddt);//끝나는 날짜
  	      
	   	      let endyear = date.getFullYear();
	  	      let endmonth = date.getMonth();
	  	      let endday = date.getDate();
	  	      
	  	     let endedday = endyear+"/"+(endmonth+1)+"/"+endday;
   	    	content +=   "<div class='col-4 my-3 m-1 text-right'>종료날짜 </div> <div class=' my-3 m-1'>"+endedday+"</div>";
   	    	
   	    	
   	    	content +=	 "<div class='col-12 row'>";
   	    	content +=       "<textarea class='col-12 .form-control py-4' style='resize: none; height:100px' readonly>"+list[0].b_content+"</textarea>";
   	    	content +=   "</div>";
	   	    	
/* 			content +=   "<div class='col-12 row d-flex justify-content-end mt-3'>";
			content +=   	"<button type='button' class='btn text-light btn-danger' data-dismiss='modal'>블랙리스트 등록</button>";
			content +=	"</div>"; */
	   	    	
 	        content +=  "</div>";	      
 	   }
 	   $(".modal-body").empty();
 	   $("#blackmyModal .modal-body").append(content);
      }

	


    $(document).on('click','.list-group-item',function(){
        $('.list-group-item').removeClass('active');
        $(this).addClass('active');
        
          if($(this).hasClass('userlist')){//유저리스트
            console.log('userlist');

            $('.usertable').removeClass('display-none');
            $('.notifytable').addClass('display-none');
            $('.blacktable').addClass('display-none');
          
            $.ajax({
     		      url : './check/usertable/1',
     		      type : 'post',
     		      data : {},
     		      dataType : 'json',
     		      success : function(data){
     		    	 console.log(data);
     		    	 userlistCall(data.pages);
     		      },
     		      error : function(error){
     		         console.log(error);
     		      }
     		   });
            
          }else if($(this).hasClass('notifylist')){//신고리스트
            console.log('notifylist');
            
            $('.notifytable').removeClass('display-none');
            $('.usertable').addClass('display-none');
            $('.blacktable').addClass('display-none');
            $.ajax({
   		      url : './check/notifytable/1',
   		      type : 'post',
   		      data : {},
   		      dataType : 'json',
   		      success : function(data){
   		    	 console.log(data);
   		    	 notifylistCall(data.pages);
   		      },
   		      error : function(error){
   		         console.log(error);
   		      }
   		   });

          }else if($(this).hasClass('blacklist')){//블랙리스트
            console.log('blacklist');
            $('.blacktable').removeClass('display-none');
            $('.usertable').addClass('display-none');
            $('.notifytable').addClass('display-none');  
            $.ajax({
     		      url : './check/blacktable/1',
     		      type : 'post',
     		      data : {},
     		      dataType : 'json',
     		      success : function(data){
     		    	 console.log(data);
     		    	 blacklistCall(data.pages);
     		      },
     		      error : function(error){
     		         console.log(error);
     		      }
     		   });
          }
    });

    
    //유저리스트 페이징 처리
function userlistCall(page){
       
     	   //페이징 초기화
     	   $(".userbody").empty();
     	   var reqUrl = "./check/usertable"+"/"+page;
     	   console.log('reqeust url :'+ reqUrl);

     	   $.ajax({
     	      url : reqUrl,
     	      type : 'post',
     	      data : {},
     	      dataType : 'json',
     	      success : function(data){
     	         console.log(data);
     	         userlistPrint(data.userlist);
     	         
     	         currPage = data.currPage;
     	         //페이징 처리
     	         $(".userpage").twbsPagination({
     	            startPage : data.currPage, //시작페이지
     	            totalPages : data.pages, //총 페이지 갯수
     	            visivlePages : $(".userpage").val(), //보여줄 페이지 갯수
     	            onPageClick : function(e,page){
     	               console.log(e,page);
     	               userlistCall(page);
     	            }
     	         });
     	      },
     	      error : function(error){
     	         console.log(error);
     	      }
     	   });
    	}
     
    
    //리스트 뿌려주는 ajax에는 c태그 안먹힘  유저
    function userlistPrint(list){
    	   var content = "";
    	   for(var i = 0; i<list.length; i++){
    	      content += "<tr>";
    	      content += "<td>"+list[i].u_id+"</td>";
    	      content += "<td>"+list[i].u_nick+"</td>";
    	      content += "<td>"+list[i].u_name+"</td>";
    	      content += "<td>"+list[i].u_email+"</td>";
    	      content += "</tr>";
    	   }
    	   $(".userbody").empty();
    	   $(".notifybody").empty();
    	   $(".blackbody").empty();
    	   $(".userbody").append(content);
    	} 
  
  
    function notifylistCall(page){
        
  	   //페이징 초기화
  	   $(".notifybody").empty();
  	   var reqUrl = "./check/notifytable"+"/"+page;
  	   console.log('reqeust url :'+ reqUrl);

  	   $.ajax({
  	      url : reqUrl,
  	      type : 'post',
  	      data : {},
  	      dataType : 'json',
  	      success : function(data){
  	         console.log(data);
  	         notifylistPrint(data.notifylist);
  	         
  	         currPage = data.currPage;
  	         //페이징 처리
  	         $(".notifypage").twbsPagination({
  	            startPage : data.currPage, //시작페이지
  	            totalPages : data.pages, //총 페이지 갯수
  	            visivlePages : $(".notifypage").val(), //보여줄 페이지 갯수
  	            onPageClick : function(e,page){
  	               console.log(e,page);
  	              notifylistCall(page);
  	            }
  	         });
  	      },
  	      error : function(error){
  	         console.log(error);
  	      }
  	   });
 	}
  
    
   //리스트 뿌려주는 ajax에는 c태그 안먹힘= 신고
   function notifylistPrint(list){
   	   var content = "";
   	   for(var i = 0; i<list.length; i++){
   	      content += "<tr>";
   	      content += "<td class='n_no'>"+list[i].n_no+"</td>";
   	      content += "<td>"+list[i].n_receiveid+"</td>";
   	      content += "<td>"+list[i].n_sendid+"</td>";
   	      content += "<td>"+list[i].n1_name+"</td>";
   	      content += "<td>"+list[i].n2_name+"</td>";
   	      content += "<td>"+list[i].c_name+"</td>";
   	      content += "</tr>";
   	   }
   	   $(".userbody").empty();
   	   $(".notifybody").empty();
   	   $(".blackbody").empty();
   	   $(".notifybody").append(content);
   	}

   
   function blacklistCall(page){
  	   //페이징 초기화
  	   $(".blackbody").empty();
  	   var reqUrl = "./check/blacktable"+"/"+page;
  	   console.log('reqeust url :'+ reqUrl);
  	   $.ajax({
  	      url : reqUrl,
  	      type : 'post',
  	      data : {},
  	      dataType : 'json',
  	      success : function(data){
  	         console.log(data);
  	         blacklistPrint(data.blacklist);
  	         
  	         currPage = data.currPage;
  	         //페이징 처리
  	         $(".blackpage").twbsPagination({
  	            startPage : data.currPage, //시작페이지
  	            totalPages : data.pages, //총 페이지 갯수
  	            visivlePages : $(".blackpage").val(), //보여줄 페이지 갯수
  	            onPageClick : function(e,page){
  	               console.log(e,page);
  	               blacklistCall(page);
  	            }
  	         });
  	      },
  	      error : function(error){
  	         console.log(error);
  	      }
  	   });
 	}
   
    //리스트 뿌려주는 ajax에는 c태그 안먹힘= 블랙리스트
    function blacklistPrint(list){
    	   var content = "";
    	   for(var i = 0; i<list.length; i++){
    	      content += "<tr>";
    	      content += "<td class='b_no'>"+list[i].b_no+"</td>";
    	      content += "<td>"+list[i].u_id+"</td>";
    	      content += "<td>"+list[i].b_code+"</td>";
    	      
    	      var date = new Date(list[i].b_startdt);//등록날짜

    	      let startyear = date.getFullYear();
    	      let startmonth = date.getMonth();
    	      let startday = date.getDate();
    	      
    	      let startedday = startyear+"/"+(startmonth+1)+"/"+startday;

    	      content += "<td>"+startedday+"</td>";
    	      
    	      date = new Date(list[i].b_enddt);//끝나는 날짜
    	      
     	      let endyear = date.getFullYear();
    	      let endmonth = date.getMonth();
    	      let endday = date.getDate();
    	      
    	      let endedday = endyear+"/"+(endmonth+1)+"/"+endday;
    	      
    	      content += "<td>"+endedday+"</td>";
    	      content += "<td>"+list[i].b_adminid+"</td>";
    	      content += "</tr>";
    	   }
    	   $(".userbody").empty();
    	   $(".notifybody").empty();
    	   $(".blackbody").empty();
    	   $(".blackbody").append(content);
    	}
    
    
    
    

    
</script>


</html>