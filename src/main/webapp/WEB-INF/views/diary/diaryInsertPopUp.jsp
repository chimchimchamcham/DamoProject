<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
	body{
		background-color:gray;
	}
	.container-fluid{
		margin:0;
		padding:0;
		width:600px;
		height:800px;
		background-color:#E5E5E5;
	}
	#header{
		padding-top:10px;
		padding-bottom:10px;
		padding-left:0;
	}
	#content_head, #content_all{
		margin:0;
		background-color:white;
		width:580px;
		height:48px;
		padding-top:10px;
	}
	 #content_all{
	 	height:310px;
	 }
	#search{
		padding:0px;
	}
	#eating_gram, #eating_Fat, #eating_Kcal, #eating_Carbo, #eating_Pro,#exe_time,#exe_Kcal{
		padding-top:5px;
	}
	
</style>
</head>
<body>

<div class="container-fluid">
	<div class="container" id="content_head">
		<div class="row">	
			<div class="col-3">
			<select class="form-control form-control-sm float-right" style="width:100px; height:38px;'" name="selectAdd" >
					<option value="select">--선택--</option>
					<option value="breakfast">아침</option>
					<option value="morning_snack">오전 간식</option>
					<option value="lunch">점심</option>
					<option value="afternoon_snack">오후간식</option>
					<option value="dinner">저녁</option>
					<option value="late_night_meal">야식</option>
					<option value="water">물섭취</option>
					<option value="excercise">운동</option>
				</select>
			</div>
			<div class="col-6" id="search_insert"><input type="text" class="form-control" name="search_insert" ></div>
			<div class="col-2" id="search_btn"><button type="button" class="btn btn-primary" style="width:80px; height:38px;'" >검색</button></div>
			<div class="col-1"></div>
		</div>
	</div>
	<div class="container" id="content_all">
		<div class="row">
			<div class="col-3" id="search_food" style="font-size:25px;font-weight:bold; text-align:center">보리밥</div>
		</div>
		<!-- 섭취 선택했을 때 -->
		<div id="content_eat">
			<div class="row" id="eating_gram">
				<div class="col-3" style="text-align:center; padding:3px; font-size:17px">분량(g)</div>
				<div class="col-6"><input type="text" class="form-control" name="eating_gram"></div>
			</div>
			<div class="row" id="eating_Kcal">
				<div class="col-3" style="text-align:center; padding:3px; font-size:17px">칼로리(kcal)</div>
				<div class="col-6"><input type="text" class="form-control" name="eating_Kcal"></div>
			</div>
			<div class="row" id="eating_Carbo">
				<div class="col-3" style="text-align:center; padding:3px; font-size:17px">탄수화물(g)</div>
				<div class="col-6"><input type="text" class="form-control" name="eating_Carbo"></div>
			</div>
			<div class="row" id="eating_Pro">
				<div class="col-3" style="text-align:center; padding:3px; font-size:17px">단백질(g)</div>
				<div class="col-6"><input type="text" class="form-control" name="eating_Pro"></div>
			</div>
			<div class="row" id="eating_Fat">
				<div class="col-3" style="text-align:center; padding:3px; font-size:17px">지방(g)</div>
				<div class="col-6"><input type="text" class="form-control" name="eating_Fat"></div>
			</div>
		</div>
		<!-- ------------------------------ -->
		<!-- 운동 선택했을 때 -->
		<div id="content_exe">
			<div class="row" id="exe_time">
				<div class="col-3" style="text-align:center; padding:3px; font-size:17px">시간(분)</div>
				<div class="col-6"><input type="text" class="form-control" name="exe_time"></div>
			</div>
			<div class="row" id="exe_Kcal">
				<div class="col-3" style="text-align:center; padding:3px; font-size:17px">칼로리(kcal)</div>
				<div class="col-6"><input type="text" class="form-control" name="exe_Kcal"></div>
			</div>
			<div class="row"><div class="col-3" style="width:540px; height:43px"></div></div>
			<div class="row"><div class="col-3" style="width:540px; height:43px"></div></div>
			<div class="row"><div class="col-3" style="width:540px; height:43px"></div></div>
		</div>
		<!-- --------------------------------- -->
		<!-- 물 선택했을 때 -->
		<div id="content_water">
			<div class="row" id="water_ml">
				<div class="col-3" style="text-align:center; padding:3px; font-size:17px">분량(ml)</div>
				<div class="col-6"><input type="text" class="form-control" name="water_ml"></div>
			</div>
			<div class="row"><div class="col-3" style="width:540px; height:43px"></div></div>
			<div class="row"><div class="col-3" style="width:540px; height:43px"></div></div>
			<div class="row"><div class="col-3" style="width:540px; height:43px"></div></div>
			<div class="row"><div class="col-3" style="width:540px; height:45px"></div></div>
		</div>
		<!-- --------------------------------- -->
		<div class="container" id="search">
			<div class="row">
				<div class="col-3" ></div>
				<div class="col-6"></div>
				<div class="col-3"><button type="button" class="btn btn-primary" style="width:80px; height:38px;'" >등록</button></div>
			</div>
		</div>
	</div>
</div>
<div class="container-fluid">
	<!-- <ul class="list-group">
	  <li class="list-group-item">First item</li>
	  <li class="list-group-item">Second item</li>
	  <li class="list-group-item">Third item</li>
	</ul> -->
</div>

</body>
<script>

//초기 상태
$("#content_eat,#content_exe,#search,#search_food,#content_water").hide();
$("#search_insert,#search_btn").show();
$("input[name=search_insert]").attr("disabled",true); 

$('select[name=selectAdd]').change(function(){
	console.log( $(this).val());
	//섭취목록 선택시
	if( $(this).val()=='breakfast' || $(this).val()=='morning_snack' || $(this).val()=='lunch' || $(this).val()=='afternoon_snack' || $(this).val()=='dinner' || $(this).val()=='late_night_meal'){
		$("#content_exe").hide();
		$("#content_water").hide();
		$("#search_insert").show();
		$("#search_btn").show();
		$("#content_eat").show();
		$("#search_food").show();
		$("#search").show();
		$("input[name=search_insert]").attr("disabled",false); 
	//운동 선택시
	}else if($(this).val() == 'excercise'){
		$("#content_eat").hide();
		$("#content_water").hide();
		$("#search_insert").show();
		$("#search_btn").show();
		$("#content_exe").show();
		$("#search_food").show();
		$("#search").show();
		$("input[name=search_insert]").attr("disabled",false); 
	//물 선택시
	}else if($(this).val() == 'water'){
		$("#content_eat,#content_exe,#search_inser,#search_btnt").hide();
		$("#content_water,#search_food,#search").show();
		$("input[name=search_insert]").attr("disabled",true); 
	//아무것도 선택 안했을 때
	}else if($(this).val() == 'select'){
		$("#content_eat,#content_exe,#search,#search_food,#content_water").hide();
		$("#search_insert,#search_btn").show();
		$("#search_insert").attr("disabled",true); 
	}
	
})	

	//api 가져오기 

 	var desc_kor ='바나나';
    var serviceKey = 'qZfScsNtL3zrPn+voVpHx4MCjASDnhUpcB04etB1b5ieeKveZTErEkqOuooRGJ9K9O6cy7LKcfyozanZi4sPag==';
    var numOfRows = 10;
    var pageNo = 1;
    var content = '';
	$.ajax({
            url:'http://apis.data.go.kr/1470000/FoodNtrIrdntInfoService/getFoodNtrItdntList',
            type:'GET',
            data:{
                'serviceKey':serviceKey,
                'desc_kor':desc_kor,
                'numOfRows':numOfRows,
                'pageNo':pageNo,
                'type':'json'
            },
            dataType:'JSON',
            success:function(data){
            	console.log(data.body);
            	console.log(data.body.totalCount);
                console.log(data.items);
                console.log(data.body.items);
                
            },
            error:function(error){
                console.log(error);
            }
        })

</script>
</html>