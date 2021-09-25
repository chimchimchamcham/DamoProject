<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='resources/fullcalendar-5.9.0/lib/main.css' rel='stylesheet' />
<script src='resources/fullcalendar-5.9.0/lib/main.js'></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.css' rel='stylesheet' />
<link href='https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.1/css/all.css' rel='stylesheet'>
<title>Insert title here</title>
<style>
/* 날짜 폰트 */
/* @import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
.ns{font-family: 'Noto Sans KR', sans-serif;} */
/*---------*/

#calendar a{
	color:#666767;
}
#calendar a:hover{
	color:#black;
}
.fc .fc-bg-event .fc-event-title {
    font-style: normal;
    color:black;  
}
#weightTitle{
   color:#FC4A4A;
   }
   
#remainWeight{
	font-size:15px;
	font-weight:bold;   
}
#goal{
	font-size:15px;
	 font-weight:bold; 
	color:#353E7E;
}

</style>

<script>  
//------------------달력---------------------//
  document.addEventListener('DOMContentLoaded', function() {
	var loginId = "${sessionScope.loginId}"; //로그인한 아이디 가져오기
	
    var calendarEl = document.getElementById('calendar');
	
    var calendar = new FullCalendar.Calendar(calendarEl, {
     headerToolbar:false,
     contentHeight:600,
     /* eventDisplay:'inverse-background', */ //list-item : 동그라미 형태로 이벤트 표시,
     //aspectRatio:2, 세로 비율을 바꾸는거같음
      //initialDate: '2020-09-15', //초기에 어떤 날짜를 보여줄지 설정 설정안하면 현재 날짜로
     navLinks: false, //can click day/week names to navigate views
     editable: true, //드래그했을 때 이벤트 변경 시킬 것인지 설정 
     dayMaxEvents: false, // 이벤트가 많을 경우 more 링크 박스 형태 이벤트 출력
     showNonCurrentDates:false,
     fixedWeekCount:false,
     progressiveEventRendering:true,
	 events:[
    	 <c:if test="${list ne ''}">
	  		<c:forEach items="${list}" var="dto">
	  
		{
			title:'${dto.d_resultEat}kcal',
			start:'${dto.d_date}',
			backgroundColor:'green',
	        borderColor:'green',
	        display:'list-item'
		},
		{
   		title:'${dto.d_resultExe}kcal',
   		start:'${dto.d_date}',
   		backgroundColor:'#FF0E75',
   	    borderColor:'#FF0E75',
   	    display:'list-item'
   	},
		{
			title:'${dto.d_weight}kg',
			start:'${dto.d_date}',
			color:<c:choose><c:when test='${dto.d_success eq "true"}'>'#54DEFD'</c:when><c:when test='${dto.d_success eq "false"}'>'#FFEDED'</c:when></c:choose>,
			display:'background'
		},
	
	</c:forEach> 
	</c:if> 
	]
      ,dateClick:function(date){
    	 //console.log('Date:',date.dateStr);
    	  //console.log('Resource ID:',date.dateStr);
    	 if(loginId == null || loginId == ''){
    		alert("로그인을 하셔야 이용하실 수 있는 서비스 입니다."); 
    	 }else{
	    	  if( $("#goal").val() == ''|| $("#goal").val() == null){
	    		  alert("목표를 입력해주세요!");
	    	  }else if($("#tarKcal").val() == '' || $("#tarKcal").val() == null){
	    		  alert("목표 섭취 칼로리를 입력해주세요!");
	    	  }else if($("#tarExe").val() == '' || $("#tarExe").val() == null){
	    		  alert("목표 운동 칼로리를 입력해주세요!");
	    	  }else{
	    	 	location.href='goDiary?Date='+date.dateStr;
	    	  }
      	}
      },eventRender: function(event, element) {
    	     if(event.icon){          
    	         element.find(".fc-title").prepend("<i class='fa fa-"+event.icon+"'></i>");
    	      }
    	   }        
 
      
 	 });
    
    
    calendar.render(); //캘린더 만들어지는 함수
    
 //------------------------------------------------------//   
    
    var date = calendar.getDate(); //현재 날짜 가져오기
    
    if(loginId == null || loginId == ''){
    	$("#tarKcal").attr("disabled",true); 
		$("#tarExe").attr("disabled",true); 
		$("#goal").attr("disabled",true); 
		
		$("#calendar_top").css("visibility","hidden");
		$("#drawGoal").css("visibility","hidden");
    }
	
    //현재 날짜기준 월 이동시 이동한 달 데이터 가져오기
    var a = 0;
    var b = 0;
    var clickCnt = 0;
    var formattedDate = ''; //이동한 월(2021-08)
    var reformattedDate = '';//이동한 월(2021년 08월)
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
		
		reformattedDate = formattedDate.toString().replace('-','년 ')+"월";
		console.log(reformattedDate);
		$("#dateCal").text(reformattedDate);
		
	});
	
	$("#next").on('click',function(){
		console.log("click next");
		clickCnt = clickCnt+1;
		//console.log("clickCnt:",clickCnt);
		console.log("next :",date.yyyymm());
		formattedDate = date.yyyymm(); //YYYY-MM 형태로 이동한 달 가져오기
		
		calendar.next(); //다음달 이동
		
		//이동한 달의 목표 섭취, 운동 칼로리 가져오기
		getMonthData(formattedDate);
		
		reformattedDate = formattedDate.toString().replace('-','년 ')+"월";
		console.log(reformattedDate);
		$("#dateCal").text(reformattedDate);
		
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
	        
	        var monthArr=['January','February','March','April','May','June','July','August','September','October','November','December'];
	        var month;
	        monthArr.forEach(function(month,index){
	        	if(index == b){
	        		console.log(month);
	        	}
	        })
	        
	      	
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
					
					$("#tarKcal").val(tarKcal);
					$("#tarExe").val(tarExe);
					$("#goal").val(content); 	
				     
				},
				error:function(e){
					console.log(e);
				}
			});
	    }
	   
	    
	    //----------------------------------------------------------------//
	    //달 가져오기
	    var dateCal = date.yyyymm().toString();
	    console.log(dateCal);
	    
	    $("#dateCal").text(dateCal.replace('-','년 ')+"월");
	    formattedDate = date.yyyymm();
	    
	    //목표 섭취, 운동, 목표 내용 변경시 반영
	    var monthId = '';
	    var changeDT = '';

	    //목표 섭취 칼로리 접근
	    $("#tarKcal").focusin(function(){
	    	console.log("섭취 칼로리 접근");
	    	$(this).css("background-color","white");
	    });

	    //목표 섭취 칼로리 벗어났을 때
	    $("#tarKcal").focusout(function(){
	    	console.log("섭취 칼로리 벗어남");
	    	
	    	console.log($(this));
	    	//원래 입력했던 데이터와 다를 때 변경
	    	if($(this).val() == '' || $(this).val()==null){
	    		alert("내용을 입력해주세요");
	    	}else {
	    		console.log('update 요청');	
	    		reqUpdate($(this));
	    	}
	    });
	    //목표 운동 칼로리 접근
	    $("#tarExe").focusin(function(){
	    	console.log("운동 칼로리 접근");
	    	$(this).css("background-color","white");
	    });
	    //목표 운동 칼로리 벗어났을 때
	    $("#tarExe").focusout(function(){
	    	console.log("운동 칼로리 벗어남");
	    	
	    	
	    	//console.log($(this).val())
	    	
	    	//원래 입력했던 데이터와 다를 때 변경
	    	if($(this).val() == '' || $(this).val()==null){
	    		alert("내용을 입력해주세요");
	    	}else{
	    		console.log('update 요청');	
	    		reqUpdate($(this));
	    	}
	    }); 

	    //목표 접근
	    $("#goal").focusin(function(){
	    	console.log("목표 접근");
	    	$(this).css("background-color","white");
	    });
	    
	    //목표 운동 칼로리 벗어났을 때
	    $("#goal").focusout(function(){
	    	console.log("목표 벗어남");
	    	console.log($(this));
	    
	    	
	    	//console.log($(this).val())
	    	
	    	//원래 입력했던 데이터와 다를 때 변경
	    	if($(this).val() == '' || $(this).val()==null){
	    		alert("내용을 입력해주세요");
	    	}else{
	    		console.log('update 요청');	
	    		reqUpdate($(this));
	    	}
	    });

	    //입력한 내용으로 변경
	    function reqUpdate(obj){
	    	console.log("reqUpate 값 : "+obj.val());
	    	console.log("reqUpdate 아이디 : "+obj.attr("id"));
	    	var reqUrl = "updateMD/"+obj.attr("id")+"/"+obj.val()+"/"+formattedDate;
	    	
	    	console.log(reqUrl);
	    	
	    	$.ajax({
	    	    	url:reqUrl,
	    	    	type:'get', 
	    	    	dataType:'json',
	    	    	success:function(data){
	    	    		console.log(data);
	    	    	},
	    	    	error:function(error){
	    	    		console.log(error);
	    	    	}
	    	    });    
	    }
	  //----------------------------------------------//  	
	 
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

#goal{
	border:none;
	border-radius:0;
	border-bottom:2px solid #7C7F7F;
	
}
#dateCal{
	font-size:25px;
	font-weight:bold;
} 

#prev{
    width:30px;
    height:30px;
  }
  #next{
    width:30px;
    height:30px;
  }

</style>
</head>
<body>


	<jsp:include page="../header.jsp"></jsp:include>

	<div class='p-3 mb-5 bg-white rounded'>

		<div class='container'>
		
			<div class="row mb-3">

				<div class="col-12 d-flex align-items-center justify-content-center flex-column" style="text-align:center">
					<div class="d-flex my-2">
						<!-- --------------prev,년월,next 버튼----------- -->
						 <a href="#"><img id="prev" src="resources/img/prev.png" class="mx-5 my-2"></a>
							<span class="mx-4 text-center d-flex align-self-center ns" id="dateCal" ></span>
						 <a href="#"><img id="next" src="resources/img/next.png" class="mx-5 my-2"></a>
					</div>
			</div>
			</div>
			<div class="row pb-3" id="calendar_top">
			<div class="col-sm-4"></div>
			<div class="col-sm-4" style="text-align: center; position:relative">
					<!-- 목표 입력 부분 -->
					<input type="text" class="form-control mx-auto" placeholder="목표를 입력하세요!"
						aria-describedby="basic-addon3" id="goal"
						value="${monthContent}"
						style="text-align: center; ">
						<i class="bi bi-pencil" style="position:absolute; top:10px;right:20px"></i>
					<!-- ---- -->
				</div>

				<div class="col-sm-4 pt-3 pr-4" style="text-align: center">
					<!-- 남은 몸무게 -->
					<span id="remainWeight" class="float-right" >
					
					</span>
					<!-- ---------- -->
				</div>
				</div>
			</div>



			<div class="container"></div>
			<!---------------------- 달력-------------------- -->
			<div id='calendar' class=''></div>
			<!--------------------------------------------------  -->

			<!-- 달력 하단 부분 -->
			<div class="container mt-3" id="drawGoal">
				<div class="row">
					<!-- 목표 섭취 칼로리 부분 -->
					<div class="col-sm-4 d-flex">
						<div class="d-flex mr-3">
							<span class="align-self-center "
								style="font-size: 15px; font-weight: bold;">목표 섭취 칼로리 : </span>
						</div>
						<div id="tarKcalInput">
							<input type="text" class="form-control" placeholder="섭취 칼로리"
								id="tarKcal" value="${monthTarKcal}"
								style="text-align: center;">
						</div>
					</div>
					<!-- --------------------- -->
					<!-- 목표 운동 칼로리 부분 -->
					<div class="col-sm-4 d-flex" >
						<div class="d-flex pd-0 mr-3">
							<span class="align-self-center"
								style="font-size: 15px; font-weight: bold;">목표 운동 칼로리 :</span>
						</div>
						<div class="">
							<input type="text" class="form-control" placeholder="운동 칼로리"
								id="tarExe" value="${monthTarExe}"
								style="text-align: center;">
						</div>
					</div>
					<!-- --------------------- -->
					<div class="col-sm-4 d-flex justify-content-end pt-2" style="font-size:11px; font-weight:bold">
						<span id="imgEatKcal" style="color:#FF0E75; " class="float-right mr-1">●</span><span class="mr-3">섭취 칼로리</span>
						<span id="imgExeKcal" style="color:green; " class="float-right mr-1">●</span><span class="mr-3">운동 칼로리</span>
						<span id="imgSuccess" style="color:#54DEFD; " class="float-right mr-1 ">■</span><span class="mr-3">목표성공</span>
						<span id="imgFail" style="color:#FFEDED;" class="float-right mr-1 ">■</span><span class="mr-3">목표실패</span>
					</div>
				</div>
			</div>
			<!-- --------------------------------- -->
		</div>

</body>
<script>
//현재 몸무게 - 목표 몸무게 비교
var minus = ${tarWeight}-${weight};

if(minus>0){
	resultWeight="목표 달성 성공!!!";
}else{
	resultWeight="남은 몸무게 : <span id='weightTitle'> "+minus+"kg</span>";
}
	$("#remainWeight").html(resultWeight);




</script>
</html>