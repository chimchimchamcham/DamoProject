<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      events: [//이벤트 설정 
    	  /*
         {
          title: '2000kcal',
          start: '2021-09-15',
          backgroundColor:'green',
          borderColor:'green'
          //display:'background' //일자 전체 색상 변경
         // icon : 'fas fa-dumbbell fa-xs'
        },
        {
        	//background 설정시 해당 일자 전체 색상 변경 가능
        	//https://fullcalendar.io/docs/background-events
        	title:'50kg',
        	textColor:'black',
        	start:'2021-09-15',
		    color:'pink',
        	display:'background'
        	
        },
        {
           title: '1500kcal',
           start: '2021-09-15',
           backgroundColor:'#E7C6B4',
           borderColor:'#E7C6B4'
           //icon : 'fas fa-utensils fa-xs'
         },
        {
          title: 'Long Event',
          start: '2021-09-07'
        }
       */
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
<div class='p-3 mb-5 bg-white rounded'>
	<div class='container '>
	<h2>목표</h2>
	<div id='calendar' class=''>
	</div>
</div>
</div>
</body>
</html>