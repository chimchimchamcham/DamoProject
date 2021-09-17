<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='resources/fullcalendar-5.9.0/lib/main.css' rel='stylesheet' />
<script src='resources/fullcalendar-5.9.0/lib/main.js'></script>
<title>Insert title here</title>
<script>  
  document.addEventListener('DOMContentLoaded', function() {
	
    var calendarEl = document.getElementById('calendar');
	
    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prevYear,prev,next,nextYear today',
        center: 'title', 
        right: 'dayGridMonth,dayGridDay' //일기가 뜨도록
      },
      //initialDate: '2020-09-15', //초기에 어떤 날짜를 보여줄지 설정 설정안하면 현재 날짜로
      navLinks: true, // can click day/week names to navigate views
      editable: true, //드래그했을 때 이벤트 변경 시킬 것인지 설정 
     dayMaxEvents: true, // 이벤트가 많을 경우 more 링크 박스 형태 이벤트 출력
      events: [
    	 /*  if(${list} != null){
    		  console.log("in");
    	  } */
    	  		/* {
    	  			title:${dto.d_resultEat},
    	  			start:${dto.d_date},
    	  			backgroundColor:'green',
    	  			borderColor:'green'
    	  		}
    	  		,{
    	  			title:${dto.d_resultExe},
    	  			start:${dto.d_date},
    	  			backgroundColor:'#E7C6B4',
    	  			borderColor:'#E7C6B4'
    	  		}
    	  		,{
    	  			title:${dto.d_weight},
    	  			start:${dto.d_date},
    	  			color:'yellow',
    	  			display:'background'
    	  		} */
    	  	]
      
      
      
      
      
	 /*  ,eventContent : function(eventEl){
     
    	  console.log(calendarEl);
    	  
    	  title = eventEl.event._def.title;
    	  icon = eventEl.event._def.extendedProps.icon;
    	  
    	  console.log(eventEl.event._def.extendedProps.icon);
		  
    	  //title = "<i class="+icon+"></i>"+title;
    	  //console.log(title);		
    	  
    	  if(eventEl.event._def.extendedProps.icon){
    		  title = "<i class="+icon+"></i>"+title;
    	  }
    	  return {
    		  html:
    			  
    	  }
    	  
    	 } */

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
<a href="goDiaray">일기 쓰기</a>
<div class='p-3 mb-5 bg-white rounded'>

	<div class='container '>
	<h2>목표</h2>
	<div id='calendar' class=''>
	</div>
</div>
</div>

</body>
<script>

</script>
</html>