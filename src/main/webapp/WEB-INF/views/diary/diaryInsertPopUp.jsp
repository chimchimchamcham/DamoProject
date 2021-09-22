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
	ul{
        list-style: none;
		}
	li{
		border:1px solid lightgray;
		cursor:pointer;
	   }
	li:hover{
		background-color: lightgray;
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
			<div class="col-2" id="search_btn"><button type="button" class="btn btn-primary" style="width:80px; height:38px;'" id="goSearch">검색</button></div>
			<div class="col-1"></div>
		</div>
		<!-- 검색 결과 리스트 -->
		<div class="container-fluid" style="z-index:1000; position:fixed; left:150px; width:240px; height:150px; color" id="search_list">
			<ul class="list-group" style="overflow-y:scroll; overflow-x: hidden;" id="search_ul">
			 <!--  <li class="list-group-item" style="height: 30px; vertical-align: middle; padding:0"><span class="first">첫번째</span><span class="carbo" style="display:none">첫번째 탄수화물</span></li>
			  <li class="list-group-item" style="height: 30px; vertical-align: middle; padding:0"><span class="first">두번째</span><span class="carbo" style="display:none">두번째 탄수화물</span></li>
			  <li class="list-group-item" style="height: 30px; vertical-align: middle; padding:0"><span class="first">세번째</span><span class="carbo" style="display:none">세번째 탄수화물</span></li>
			  <li class="list-group-item" style="height: 30px; vertical-align: middle; padding:0"><span class="first">네번째</span><span class="carbo"style="display:none">네번째 탄수화물</span></li>
			  <li class="list-group-item" style="height: 30px; vertical-align: middle; padding:0"><span class="first">다섯번째</span><span class="carbo" style="display:none">다섯번째 탄수화물</span></li>
			  <li class="list-group-item" style="height: 30px; vertical-align: middle; padding:0"><span class="first">여섯번째</span><span class="carbo"style="display:none">여섯번째 탄수화물</span></li>  -->
			</ul> 
		</div>
		<!-- -------------------------------------------------------------------- -->
		
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

</body>
<script>

var selectMenu = ''; 

//초기 상태
$("#content_eat,#content_exe,#search,#search_food,#content_water,#search_list").hide();
$("#search_insert,#search_btn").show();
$("input[name=search_insert]").attr("disabled",true); 

$('select[name=selectAdd]').change(function(){
	console.log( $(this).val());
	selectMenu = $(this).val();
	//섭취목록 선택시
	if( $(this).val()=='breakfast' || $(this).val()=='morning_snack' || $(this).val()=='lunch' || $(this).val()=='afternoon_snack' || $(this).val()=='dinner' || $(this).val()=='late_night_meal'){selectMenu = $(this).val();
		selectMenu = 'foodlist';
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
		selectMenu = 'met';
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
	
});	


var reqUrl = 'searchList/';
var searchInsert = '';

$("#goSearch").click(function(){
	$("#search_list").show();
	
	console.log("선택된 메뉴:",selectMenu);
	console.log($("input[name=search_insert]").val()); //검색내용
	
	reqUrl +=selectMenu+"/";
	searchInsert = $("input[name=search_insert]").val(); //검색 분류
	reqUrl += searchInsert;
	console.log("요청url: ",reqUrl);
	
	$.ajax({
    	url:reqUrl,
    	type:'post', 
    	dataType:'json',
    	success:function(data){
    		console.log(data);
    	},
    	error:function(error){
    		console.log(error);
    	}
    });  
});

$("#search_ul").on("click","li",function(){
	console.log($(this).find(".first").text());
	console.log($(this).find(".carbo").text());
});

</script>
</html>