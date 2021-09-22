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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
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
	#eating_gram, #eating_Fat, #eating_Kcal, #eating_Carbo, #eating_Pro,#exe_time,#exe_Kcal,#eating_gram_myself{
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
			<div class="col-6" id="search_insert"><div class="input-group"><input type="text" class="form-control" name="search_insert" > <span class="input-group-append bg-white">
            <button class="btn border border-left-0" type="button" id="deleteSearch"><i class="bi bi-x-circle"></i></button>
        </span></div></div>
			<div class="col-2" id="search_btn"><button type="button" class="btn btn-primary" style="width:80px; height:38px;'" id="goSearch">검색</button></div>
			<div class="col-1"></div>
		</div>
		<!-- 검색 결과 리스트 -->
		<div class="container-fluid" style="z-index:1000; position:fixed; left:150px; width:240px; height:150px; color" id="search_list">
			<ul class="list-group" style="overflow-y:scroll; overflow-x: hidden; height:150px; font-size:11px" id="search_ul">
			 
			</ul> 
		</div>
		<!-- -------------------------------------------------------------------- -->
		
	</div>
	<div class="container" id="content_all">
		<div class="row">
			<div class="col-10" id="search_food" style="font-size:25px;font-weight:bold;"><span id="default_msg">선택해주세요!</span><input type="hidden" class="form-control" name="search_food" placeholder="음식을 입력하세요" style="margin:0 15px"></div>
		</div>
		<!-- 섭취 선택했을 때 -->
		<div id="content_eat">
			<div class="row" id="eating_gram">
				<div class="col-3" style="text-align:center; padding:3px; font-size:17px">분량(g)</div>
				<div class="col-6" style="text-align:center;"><span id="default_gram"></span><input type="text" class="form-control" name="eating_gram" style="text-align:center;"></div>
			</div>
			<div class="row" id="eating_Kcal">
				<div class="col-3" style="text-align:center; padding:3px; font-size:17px">칼로리(kcal)</div>
				<div class="col-6"  id="Kcal_span" style="text-align:center;"><span id="default_Kcal"></span><input type="hidden" class="form-control" name="eating_Kcal"></div>
			</div>
			<div class="row" id="eating_Carbo">
				<div class="col-3" style="text-align:center; padding:3px; font-size:17px">탄수화물(g)</div>
				<div class="col-6"  id="Carbo_span" style="text-align:center;"><span id="default_Carbo"></span><input type="hidden" class="form-control" name="eating_Carbo"></div>
			</div>
			<div class="row" id="eating_Pro">
				<div class="col-3" style="text-align:center; padding:3px; font-size:17px">단백질(g)</div>
				<div class="col-6" id="Pro_span" style="text-align:center;"><span id="default_Pro"></span><input type="hidden" class="form-control" name="eating_Pro"></div>
			</div>
			<div class="row" id="eating_Fat">
				<div class="col-3" style="text-align:center; padding:3px; font-size:17px">지방(g)</div>
				<div class="col-6"  id="Fat_span" style="text-align:center;"><span id="default_Fat"></span><input type="hidden" class="form-control" name="eating_Fat"></div>
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
				<div class="col-3"><button type="button" class="btn btn-primary" style="width:80px; height:38px;'" id="submitBtn">등록</button></div>
			</div>
		</div>
	</div>
</div>

</body>
<script>

var selectMenu = ''; 
var selectType='';

//초기 상태
$("#content_eat,#content_exe,#search,#search_food,#content_water,#search_list").hide();
$("#search_insert,#search_btn").show();
$("input[name=search_insert]").attr("disabled",true); 

$('select[name=selectAdd]').change(function(){
	$("#default_msg").text('선택해주세요!'); 
	console.log( $(this).val());
	selectType = $(this).val();
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
var content = '';

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
    		/* console.log(data);
    		console.log(data.resultList);
    		console.log(data.resultList.length);
    		console.log(data.resultList[0].food_name); */
    		if(selectMenu =='foodlist'){
	    		for(var i = 0; i<data.resultList.length; i++){
	    			content += '<li class="list-group-item" style="height: 30px; vertical-align: middle; padding:0">';
	    			content +='<span class="foodName">'+data.resultList[i].food_name+'</span>';
	    			content +=' ('+'<span class="food_weight">'+data.resultList[i].food_weight+'</span>'+'g)';
	    			content +='<span class="food_calorie" style="display:none">'+data.resultList[i].food_calorie+'</span>';
	    			content +='<span class="food_carbo" style="display:none">'+data.resultList[i].food_carbo+'</span>';
	    			content +='<span class="food_protein" style="display:none">'+data.resultList[i].food_protein+'</span>';
	    			content +='<span class="food_fat" style="display:none">'+data.resultList[i].food_fat+'</span>';
	    			content +='</li>'; 
	    		}
    		}else if(selectMenu == 'met'){
    			for(var i = 0; i<data.resultList.length; i++){
	    			content += '<li class="list-group-item" style="height: 30px; vertical-align: middle; padding:0">';
	    			content +='<span class="met_name">'+data.resultList[i].met_name+'</span>';
	    			content +='<span class="met" style="display:none">'+data.resultList[i].met+'</span>';
	    			content +='<span class="u_weight" style="display:none">'+data.resultList[i].u_weight+'</span>';
	    			content +='</li>'; 
	    		}
    		}
    		content +='<li class="list-group-item" style="height: 30px; vertical-align: middle; padding:0; color:blue"><span class="empty">직접 입력</span></li>';
    		 $("#search_ul").empty();
             $("#search_ul").append(content);
             reqUrl ='searchList/';
    	},
    	error:function(error){
    		console.log(error);
    	}
    });  
});

//선택한 음식 값 받아오기
var gram;
var weight;
var kcal;
var changeKcal;
var carbo;
var changeCarbo;
var protein;
var changeProtein;
var fat;
var changeFat;

//선택한 운동 값 받아오기
var met;
var u_weight;
var exeTime;
var exeKcal;

//음식 선택시(값 뿌려주기)
$("#search_ul").on("click","li",function(){
	console.log($(this)[0].firstChild.className);
	$("#search_list").hide(); //검색 결과 숨기기
	$("input[name=search_insert]").attr('readonly',true);
	 if($(this)[0].firstChild.className=="empty"){
		 console.log("직접선택 요청");
		 $("#default_msg").text(''); 
		 //음식
		 $("input[name=search_food]").prop('type','text');
		 $("input[name=eating_Kcal]").prop('type','text');
		 $("input[name=eating_Carbo]").prop('type','text');
		 $("input[name=eating_Pro]").prop('type','text');
		 $("input[name=eating_Fat]").prop('type','text');
	 }else{
		 $("input[name=search_food]").prop('type','hidden');
		 $("input[name=eating_Kcal]").prop('type','hidden');
		 $("input[name=eating_Carbo]").prop('type','hidden');
		 $("input[name=eating_Pro]").prop('type','hidden');
		 $("input[name=eating_Fat]").prop('type','hidden');
		 
		// 선택한 음식 받아온 값 집어넣기
		weight = $(this).find(".food_weight").text();
		kcal = $(this).find(".food_calorie").text();
		carbo = $(this).find(".food_carbo").text();
		protein = $(this).find(".food_protein").text();
		fat = $(this).find(".food_fat").text();
		
		$("#default_msg").text($(this).find(".foodName").text()); 
		$("input[name=eating_gram]").val($(this).find(".food_weight").text());
		$("#default_Kcal").text($(this).find(".food_calorie").text());
		$("#default_Carbo").text($(this).find(".food_carbo").text());
		$("#default_Pro").text($(this).find(".food_protein").text());
		$("#default_Fat").text($(this).find(".food_fat").text());
		
		//운동일 경우
		met = $(this).find(".met").text();
		
		console.log(met);
		$("#default_msg").text($(this).find(".met_name").text()); 
		
	 }
	
});

//검색한걸 지울 때
$("#deleteSearch").click(function(){
	console.log("검색삭제");
	$("input[name=search_insert]").attr('readonly',false);
	$("input[name=search_insert]").val('');
	
	$("#default_msg").text('선택해주세요!'); 
	$("input[name=eating_gram]").val('');
	$("#default_Kcal").text('');
	$("#default_Carbo").text('');
	$("#default_Pro").text('');
	$("#default_Fat").text('');
	
	$("input[name=search_food]").prop('type','hidden');
	 $("input[name=eating_Kcal]").prop('type','hidden');
	 $("input[name=eating_Carbo]").prop('type','hidden');
	 $("input[name=eating_Pro]").prop('type','hidden');
	 $("input[name=eating_Fat]").prop('type','hidden');
});

//섭취 분량 조절시 
//분량을 접근할 때
$("input[name=eating_gram]").focusin(function(){
	   console.log("섭취 칼로리 접근");
	   $(this).css("background-color","white");
});

//분량 벗어났을 때
$("input[name=eating_gram]").focusout(function(){
	   console.log("섭취 칼로리 벗어남");
	   $(this).css("background-color","#F4F4E9");
	
	    //원래 입력했던 데이터와 다를 때 변경
	    if($(this).val() != $(this).prop('defaultValue')){
	    	console.log('분량 변경');
	    	gram=$(this).val();
	    	
	    	//변경되는 계산식
	    	changeKcal = kcal/weight * gram;
	    	changeCarbo = carbo/weight * gram;
	    	changeProtein = protein/weight * gram;
	    	changeFat = fat/weight * gram;
	    	
	    	console.log(gram+"/"+weight+"/"+kcal+"/"+changeKcal+"/"+carbo+"/"+protein+"/"+fat);
	    	
	    	$("#default_Kcal").text(changeKcal);
	    	$("#default_Carbo").text(changeCarbo);
	    	$("#default_Pro").text(changeProtein);
	    	$("#default_Fat").text(changeFat);
	    } 
});
//-------------------------------------------------------------------------//

//운동시간 입력시


//전송 버튼 클릭시
$("#submitBtn").click(function(){
	
})

</script>
</html>