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
<title>Insert title here</title>
<style>
.blackText{
	color:black;

}
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
</style>

<script>  
  document.addEventListener('DOMContentLoaded', function() {
	var loginId = "${sessionScope.loginId}"; //로그인한 아이디 가져오기
	
    var calendarEl = document.getElementById('calendar');
	
    var calendar = new FullCalendar.Calendar(calendarEl, {
     headerToolbar:false,
     contentHeight:600,
     eventDisplay:'inverse-background', //list-item : 동그라미 형태로 이벤트 표시,
     //aspectRatio:2, 세로 비율을 바꾸는거같음
      //initialDate: '2020-09-15', //초기에 어떤 날짜를 보여줄지 설정 설정안하면 현재 날짜로
     navLinks: false, //can click day/week names to navigate views
     editable: true, //드래그했을 때 이벤트 변경 시킬 것인지 설정 
     dayMaxEvents: false, // 이벤트가 많을 경우 more 링크 박스 형태 이벤트 출력
     showNonCurrentDates:false,
     eventTextColor:'#000000',
	 events:function(info,successCallback,failureCallback){
	    	 $.ajax({
		    	url:'getMonthEvent',
		    	type:'POST',
		    	dataType:'JSON',
		    	success : function(data){
		    		var arr=[];
		    		var color;
		    		console.log(data);
		    		console.log("목표 : ",data.monthContent);
		    		console.log("목표 섭취 칼로리 : ",data.monthTarKcal);
		    		console.log("목표 몸무게 : ",data.tarWeight);
		    		console.log("현재 몸무게 : ",data.weight);
		    		
		    		//현재 몸무게 - 목표 몸무게 비교
		    		var minus = data.weight-data.tarWeight;
		    		console.log(data.weight-data.tarWeight);
		    		if(minus<0){
		    			resultWeight="목표 달성 성공!!!";
		    		}else{
		    			resultWeight="남은 몸무게 : "+minus;
		    		}
		    			$("#remainWeight").text(resultWeight);
		    		
		    		//목표 섭취 칼로리, 목표 운동 칼로리, 목표 집어넣기
		    		$("#tarKcal").val(data.monthTarKcal);
					$("#tarExe").val(data.monthTarExe);
					$("#goal").val(data.monthContent); 	
		    		
		    		data.list.forEach(function(elem){
		    			var d_date=elem.d_date;
		    		/* 	
		    			console.log("-------날짜 : "+elem.d_date+"--------");
		    			console.log("몸무게 : ",elem.d_weight);
		    			console.log("섭취 칼로리 : ",elem.d_resultEat);
		    			console.log("운동 칼로리 : ",elem.d_resultExe);
		    			console.log("성공 여부 : ",elem.d_success); */
		    			
		    			
		    			if(elem.d_success){
		    				color='skyblue';
		    			}else{
		    				color='pink';
		    			}
		    			arr.push({
		    				title:elem.d_resultEat+'kcal',
		        			start:elem.d_date,
		        			backgroundColor:'green',
		        	        borderColor:'green',
		        	        display:'list-item',
		        	        textColor:'black'
		    			});
		    			
		    			arr.push({
		    				title:elem.d_resultExe+'kcal',
		        			start:elem.d_date,
		        			backgroundColor:'pink',
		        	        borderColor:'pink',
		        	        display:'list-item'
		    			});
		    			arr.push({
		    				title:elem.d_weight+"kg", 
		    				start:elem.d_date,
		    				backgroundColor:color,
		    				display:'background'
		    			});
		    		/* 	arr.push({
		    				title:elem.d_weight+"kg",
		    				start:elem.d_date,
		    				display:'background'
		    			}) */
		    			
		    			
		    	console.log("-----------------------");
		    		})
		    		
		    		console.log("event : ",arr);
		    		console.log("successCallback:",successCallback(arr));
		    	},
		    	error: function(error){
		    		console.log(error);	
		    	}
	    	
	    	});
		}
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
      },eventClassNames:'black'
      
 	 });
    calendar.render();
    
    
    var date = calendar.getDate(); //현재 날짜 가져오기
  
    
    console.log(loginId);
    if(loginId == null || loginId == ''){
    	$("#tarKcal").attr("disabled",true); 
		$("#tarExe").attr("disabled",true); 
		$("#goal").attr("disabled",true); 
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
		//이동한 달의 이벤트 가져오기
		getMonthEvent(loginId,formattedDate);
		
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
		//이동한 달의 이벤트 가져오기
		getMonthEvent(loginId,formattedDate);
		
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
	    	$(this).css("background-color","#F4F4E9");
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
	    	$(this).css("background-color","#F4F4E9");
	    	
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
	    	$(this).css("background-color","#F4F4E9");
	    	
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
	  
	  /*
	  var requestUrl = 'getMonthEvent/'+loginId+'/'+'2021-08';
	  console.log(requestUrl);
	  //해당 월 이벤트 가져오기
	  function getMonthEvent(){
		  var arr=[];
		  $.ajax({
			 url:requestUrl,
			 type:'get',
			 dataType:'json',
			 success:function(data){
				console.log(data.list);
				arr = data.list;
			 },
			 error:function(error){
				 console.log(error);
			 }
			 
		  });
		  return arr;
	  }
	 */
	 
	 
	 
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

		<div class='container pb-3'>
			<a href="./goupdate">회원정보 수정</a> <a href="./diaryInsert">다이어리 추가</a>
			<a href="./myPage">마이페이지 이동</a>



			<div class="row mb-3">

				<div class="col-3 float-right">
					<!-- col채우는 용도 -->
				</div>

				<div
					class="col-6 d-flex align-items-center justify-content-center flex-column">
					<div class="d-flex ">
						<!-- --------------prev,년월,next 버튼----------- -->
						<button type="button" class="btn m-1 btn-secondary" id="prev"><</button>
						<h3 class="m-1 text-center d-flex align-self-center" id="dateCal"></h3>
						<button type="button" class="m-1 btn btn-secondary" id="next">></button>
					</div>
					<!-- 목표 입력 부분 -->
					<input type="text" class="form-control" placeholder="목표를 입력하세요!"
						aria-describedby="basic-addon3" id="goal"
						value="<%-- ${monthContent} --%>"
						style="text-align: center; background-color: #F4F4E9">
					<!-- ---- -->
				</div>

				<div class="col-sm-2 m-1 float-right">
					<!-- 남은 몸무게 -->
					<span id="remainWeight" style="text-align: center">
					
					</span>
					<!-- ---------- -->
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
					<div class="col-sm-4 d-flex m-1">
						<div class="d-flex mr-1">
							<span class="align-self-center"
								style="font-size: 15px; font-weight: bold;">목표 섭취 칼로리 : </span>
						</div>
						<div id="tarKcalInput">
							<input type="text" class="form-control" placeholder="섭취 칼로리"
								id="tarKcal" value="<%-- ${monthTarKcal} --%>"
								style="text-align: center; background-color: #F4F4E9">
						</div>
					</div>
					<!-- --------------------- -->
					<!-- 목표 운동 칼로리 부분 -->
					<div class="col-sm-4 d-flex m-1">
						<div class="d-flex pd-0 mr-1">
							<span class="align-self-center"
								style="font-size: 15px; font-weight: bold;">목표 운동 칼로리 :</span>
						</div>
						<div class="">
							<input type="text" class="form-control" placeholder="운동 칼로리"
								id="tarExe" value="<%-- ${monthTarExe} --%>"
								style="text-align: center; background-color: #F4F4E9">
						</div>
					</div>
					<!-- --------------------- -->
				</div>
			</div>
			<!-- --------------------------------- -->
		</div>
	</div>

</body>
<script>

//몸무게 가져오기

/* var weight = "${weight}";
var tarWeight = "${tarWeight}"; */
/*
var minusWeight = weight-tarWeight;
var resultWeight = '';

if(minusWeight<0){
	resultWeight="목표 달성 성공!!!";
}else{
	resultWeight="남은 몸무게 : "+minusWeight;
}
	$("#remainWeight").val(resultWeight);
*/	
//-------------------------------------------//




</script>
</html>