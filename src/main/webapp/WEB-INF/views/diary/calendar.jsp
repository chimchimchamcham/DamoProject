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
     headerToolbar:false,
      //initialDate: '2020-09-15', //초기에 어떤 날짜를 보여줄지 설정 설정안하면 현재 날짜로
      navLinks: false, //can click day/week names to navigate views
      editable: true, //드래그했을 때 이벤트 변경 시킬 것인지 설정 
     dayMaxEvents: false, // 이벤트가 많을 경우 more 링크 박스 형태 이벤트 출력
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
    
    
    var date = calendar.getDate(); //현재 날짜 가져오기
    
    //현재 날짜기준 월 이동시 이동한 달 데이터 가져오기
    var a = 0;
    var b = 0;
    var clickCnt = 0;
    var formattedDate = '';
    //-------------------------------------------//
    
    //이동한 달의 목표 섭취 칼로리, 운동 칼로리 가져오기
    var tarExe = '';
    var tarKcal = '';
    var content = '';
    //-------------------------------------------//
    
    //이전 달 이동 버튼 클릭시 
    $("#prev").on('click',function(){
		console.log("click prev");
		clickCnt = clickCnt-1;
		//console.log("clickCnt:",clickCnt);
		console.log("prev :",date.yyyymm());
		formattedDate = date.yyyymm(); //YYYY-MM 형태로 이동한 달 가져오기
		calendar.prev(); //이전달 이동
		
		//이동한 달의 목표 섭취, 운동 칼로리 가져오기
		getMonthData(formattedDate);
		
	});
	
	$("#next").on('click',function(){
		console.log("click next");
		clickCnt = clickCnt+1;
		//console.log("clickCnt:",clickCnt);
		console.log("next :",date.yyyymm());
		formattedDate = date.yyyymm(); //YYYY-MM 형태로 이동한 달 가져오기
		//convertDate(date);
		calendar.next(); //다음달 이동
		
		//이동한 달의 목표 섭취, 운동 칼로리 가져오기
		getMonthData(formattedDate);
		
	}); 	
	  
	    // 받은 날짜값을 YYYY-MM 형태로 출력하기위한 함수.
	    Date.prototype.yyyymm = function() {
	        var yyyy = this.getFullYear().toString();
	        var mm = (this.getMonth()+1+clickCnt).toString();
	      
	        if(mm>12){ //12월을 넘어 갈경우
	      		a = parseInt(mm /12);
	      		b = mm % 12;
	      		if(b ==0){ //나머지가 0인경우(=12월의 경우)
	      			a=a-1;
	      			b=12;
	      		}
	      		yyyy=(parseInt(yyyy)+a).toString();
	      		mm=(b).toString();
	      	}else if(mm<1){ //1월 이전일 경우
	      		
	      		a=(parseInt(Math.abs(mm)/12));
	      		b=(Math.abs(mm)%12);
	      		
	      		yyyy=(parseInt(yyyy)-(1+a)).toString();
	      		mm=(12-b).toString();
	      		console.log(mm);
	      		
	      	} 
	      	
	      	//1월 ,12월 사이에는 그냥 아래 경우로 구해주면 됨 
	      	return yyyy + "-" + (mm[1] ? mm : "0" + mm[0]);
	    }	
	    //---------------------------------------------------------//
	   
	    //이동한 달의 목표 섭취, 운동 칼로리 가져오기
	    function getMonthData(formattedDate){	
			$.ajax({
				type:'GET',
				url:'getMonthData/'+formattedDate,
				dataType:'JSON',
				success:function(data){
					console.log(data.monthTarExe);
					console.log(data.monthTarKcal);
					console.log(data.monthContent);
					
					tarExe = data.monthTarExe;
					tarKcal = data.monthTarKcal;
					content = data.monthContent;
					
					if(tarExe)
					
					$("#tarKcal").val(tarKcal);
					$("#tarExe").val(tarExe);
					$("#goal").val(content); 	
				     
				},
				error:function(e){
					console.log(e);
				}
			});
	    }
	    
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

	<div class='container pb-3' >
	<div class="row mb-3">
		<div class="col-3"><a href="./goupdate">회원정보 수정</a></div>
		<div class="col-6">
			<input type="text" class="form-control-plainText" placeholder="목표를 입력하세요!" aria-describedby="basic-addon3" id="goal" style="text-align:center">
			<input type="text" class="form-control-plainText" placeholder="섭취 칼로리" id="tarKcal" style="text-align:center">
			<input type="text" class="form-control-plainText" placeholder="운동 칼로리"  id="tarExe" style="text-align:center">
			<input type="text" class="form-control-plainText" placeholder="남은 몸무게"  id="remainWeight" style="text-align:center">
		</div>
		<div class="col-3"><button type="button" class="btn btn-secondary" id="prev">prev</button><button type="button" class="btn btn-secondary" id="next">next</button></div>
	</div>
	<div class="container"></div>
	<div id='calendar' class=''>
	</div>
</div>
</div>
</body>
<script>

	
</script>
</html>