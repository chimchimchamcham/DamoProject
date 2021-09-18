<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='resources/fullcalendar-5.9.0/lib/main.css' rel='stylesheet' />
<script src='resources/fullcalendar-5.9.0/lib/main.js'></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script>  
  document.addEventListener('DOMContentLoaded', function() {
	
    var calendarEl = document.getElementById('calendar');
	
    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prevYear,prev,next,nextYear today',
        center: 'title', 
        right: 'dayGridMonth' //일기가 뜨도록
      },
      //initialDate: '2020-09-15', //초기에 어떤 날짜를 보여줄지 설정 설정안하면 현재 날짜로
      navLinks: false, //can click day/week names to navigate views
      editable: true, //드래그했을 때 이벤트 변경 시킬 것인지 설정 
     dayMaxEvents: true, // 이벤트가 많을 경우 more 링크 박스 형태 이벤트 출력
      events: [
    	  <c:if test="${list ne ''}">
    	  <c:forEach items="${list}" var="dto">
    		{
    			title:'${dto.d_resultEat}kcal',
    			start:'${dto.d_date}',
    			backgroundColor:'green',
    	        borderColor:'green'
    		},
    		{
        		title:'${dto.d_resultExe}kcal',
        		start:'${dto.d_date}',
        		backgroundColor:'#E7C6B4',
        	    borderColor:'#E7C6B4'
        	},
    		{
    			title:'${dto.d_weight}kg',
    			start:'${dto.d_date}',
    			color:<c:choose><c:when test='${dto.d_success eq "true"}'>'skyblue'</c:when><c:when test='${dto.d_success eq "false"}'>'pink'</c:when></c:choose>,
    			display:'background'
    		},
    		
    	</c:forEach> 
    	</c:if>
    	  
    	  	]
      ,dateClick:function(date){
    	  console.log('Date:',date.dateStr);
    	  console.log('Resource ID:',date.dateStr);
    	  location.href='goDiary?Date='+date.dateStr;
      }

 	 });
    calendar.render();
  });	
</script>
<style>
body {
	/* margin: 40px 10px; */
	margin: 0px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 1100px;
	margin: 0 auto;
}

</style>
</head>
<body>


<jsp:include page="../header.jsp"></jsp:include>

<div class='p-3 mb-5 bg-white rounded'>

	<div class='container '>
	<h2>목표</h2>
	<a href="./goupdate">회원정보 수정</a>
	<div id='calendar' class=''>
	</div>
</div>
</div>
</body>
<script>
	$(".fc-daygrid-day-number").click(function(){
		console.log("click");
	});
		
	
</script>
</html>