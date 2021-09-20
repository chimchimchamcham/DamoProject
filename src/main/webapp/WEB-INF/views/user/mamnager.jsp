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
                <ul class="pagination mx-auto userpage">

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
              <ul class="pagination mx-auto notifypage">
                 
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
              <ul class="pagination mx-auto blackpage">
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

var firstpage ="${pages}";
console.log(firstpage);
userlistcnt(firstpage);

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
     		    	userlistPrint(data.userlist);
     		    	userlistcnt(data.pages);
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
   		    	 notifylistPrint(data.notifylist);
   		    	 notifylistcnt(data.pages);
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
     		    	 blacklistPrint(data.blacklist);
     		    	 blacklistcnt(data.pages);
     		      },
     		      error : function(error){
     		         console.log(error);
     		      }
     		   });
          }
    });

    
     //유저리스트 페이징 처리
    $(document).on('click','.userpage .page-item',function(){
        if($(this).hasClass('previous')||$(this).hasClass('next')){
            $('.page-item').removeClass('active');
            userlistcnt(data.pages);
        }else{
            $('.page-item').removeClass('active');
            var page = $(this).text();
            console.log(page);
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
            		         console.log(data.userlist);
            		         var list = data.userlist;
            		         console.log(data.cnt);
            		         console.log(data.currPage);
            		         console.log(data.pages);
            		         
            		         userlistPrint(list);
            		         
            		      },
            		      error : function(error){
            		         console.log(error);
            		      }
            		   });
                   $(this).addClass('active');
        }
    });
    
  //유저 페이지 수 페이징바
    function userlistcnt(pages){
	   var pagebutton = "";
	   
	pagebutton += "<li class='page-item previous'><a class='page-link' href='#'>Previous</a></li>";
	   for(var i = 1; i<=pages; i++){
		   pagebutton += "<li class='page-item'><a class='page-link' href='#'>"+i+"</a></li>";
	   }
	pagebutton += "<li class='page-item next'><a class='page-link' href='#'>Next</a></li>";
	   $(".userpage").empty();
	   $(".notifypage").empty();
	   $(".blackbody").empty();
	   $(".userpage").append(pagebutton);
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
  
  
  
    //신고리스트 페이징 처리
   $(document).on('click','.notifypage .page-item',function(){
       if($(this).hasClass('previous')||$(this).hasClass('next')){
           $('.page-item').removeClass('active');
           notifypage(data.pages);
       }else{
           $('.page-item').removeClass('active');
           $(this).addClass('active');
           var Page = $(this).text();
           		console.log(page);
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
     		         console.log(data.notifylist);
     		         var list = data.userlist;
     		         console.log(data.cnt);
     		         console.log(data.currPage);
     		         console.log(data.pages);
     		         
     		        notifylistPrint(list);
     		         

     		      },
     		      error : function(error){
     		         console.log(error);
     		      }
     		   });
            $(this).addClass('active');
           	   
           
       }
   });
     
   //신고 페이지 수 페이징바
   function notifylistcnt(pages){
	   var pagebutton = "";
	   
	pagebutton += "<li class='page-item previous'><a class='page-link' href='#'>Previous</a></li>";
	   for(var i = 1; i<=pages; i++){
		   pagebutton += "<li class='page-item'><a class='page-link' href='#'>"+i+"</a></li>";
	   }
	pagebutton += "<li class='page-item next'><a class='page-link' href='#'>Next</a></li>";
	   $(".notifypage").empty();
	   $(".userpage").empty();
	   $(".blackpage").empty();
	   $(".notifypage").append(pagebutton);
	} 
    
   //리스트 뿌려주는 ajax에는 c태그 안먹힘= 신고
   function notifylistPrint(list){
   	   var content = "";
   	   for(var i = 0; i<list.length; i++){
   	      content += "<tr>";
   	      content += "<td>"+list[i].n_no+"</td>";
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
    
   
   
   
    
    
    
   //블랙리스트 페이징 처리
   $(document).on('click','.blackpage .page-item',function(){
       if($(this).hasClass('previous')||$(this).hasClass('next')){
           $('.page-item').removeClass('active');
           blackpage(data.pages);
       }else{
           $('.page-item').removeClass('active');
           $(this).addClass('active');
           var Page = $(this).text();
           		console.log(page);
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
      		         console.log(data.blacklist);
      		         var list = data.userlist;
      		         console.log(data.cnt);
      		         console.log(data.currPage);
      		         console.log(data.pages);
      		         
      		        blacklistPrint(list);
      		         

      		      },
      		      error : function(error){
      		         console.log(error);
      		      }
      		   });
             $(this).addClass('active');
           	   
           
       }
   });
    
    
   //블랙리스트 페이지 수 페이징바
   function blacklistcnt(pages){
	   var pagebutton = "";
	   
	pagebutton += "<li class='page-item previous'><a class='page-link' href='#'>Previous</a></li>";
	   for(var i = 1; i<=pages; i++){
		   pagebutton += "<li class='page-item'><a class='page-link' href='#'>"+i+"</a></li>";
	   }
	pagebutton += "<li class='page-item next'><a class='page-link' href='#'>Next</a></li>";
	   $(".blackpage").empty();
	   $(".notifypage").empty();
	   $(".userpage").empty();
	   $(".blackpage").append(pagebutton);
	} 
   

    //리스트 뿌려주는 ajax에는 c태그 안먹힘= 블랙리스트
    function blacklistPrint(list){
    	   var content = "";
    	   for(var i = 0; i<list.length; i++){
    	      content += "<tr>";
    	      content += "<td>"+list[i].b_no+"</td>";
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