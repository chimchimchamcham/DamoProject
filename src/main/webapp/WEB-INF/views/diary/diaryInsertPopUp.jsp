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
		/* background-color:gray; */
		overflow:hidden;
	}
	.container-fluid{
		margin:0;
		padding:0;
		width:600px;
		height:800px;
		/* background-color:#E5E5E5; */
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
			<!-- 검색창 -->
			<div class="col-6" id="search_insert"><div class="input-group"><input type="text" class="form-control" name="search_insert" > <span class="input-group-append bg-white">
            <button class="btn border border-left-0" type="button" id="deleteSearch"><i class="bi bi-x-circle"></i></button>
        </span></div></div>
        	<!-- 검색 버튼 -->
			<div class="col-2" id="search_btn"><button type="button" class="btn btn-primary" style="width:80px; height:38px;'" id="goSearch">검색</button></div>
			<div class="col-1"></div>
		</div>
		<!-- 검색 결과 리스트 -->
		<div class="container-fluid" style="z-index:1000; position:fixed; left:150px; width:240px; height:150px; background-color:#E5E5E5;" id="search_list">
			<ul class="list-group" style="overflow-y:scroll; overflow-x: hidden; height:150px; font-size:11px" id="search_ul">
			 
			</ul> 
		</div>
		<!-- -------------------------------------------------------------------- -->
		
	</div>
	<div class="container" id="content_all">
		<!-- 선택한 이름  -->
		<div class="row">
			<div class="col-10" id="search_food" style="font-size:25px;font-weight:bold;"><span id="default_msg">선택해주세요!</span><input type="hidden" class="form-control" name="search_food" placeholder="음식을 입력하세요" style="margin:0 15px"></div>
		</div>
		<!-- ------------------------------------------------------------------ -->
		<!-- 섭취 선택했을 때 -->
		<div id="content_eat">
			<div class="row" id="eating_gram">
				<div class="col-3" style="text-align:center; padding:3px; font-size:17px">분량(g)</div>
				<div class="col-6" style="text-align:center;"><span id="default_gram"></span><input type="text" class="form-control" name="eating_gram" style="text-align:center;" onkeypress="inNumber();"></div>
			</div>
			<div class="row" id="eating_Kcal">
				<div class="col-3" style="text-align:center; padding:3px; font-size:17px">칼로리(kcal)</div>
				<div class="col-6"  id="Kcal_span" style="text-align:center;"><span id="default_Kcal"></span><input type="hidden" class="form-control" name="eating_Kcal" style="text-align:center;" onkeypress="inNumber();"></div>
			</div>
			<div class="row" id="eating_Carbo">
				<div class="col-3" style="text-align:center; padding:3px; font-size:17px">탄수화물(g)</div>
				<div class="col-6"  id="Carbo_span" style="text-align:center;"><span id="default_Carbo"></span><input type="hidden" class="form-control" name="eating_Carbo" style="text-align:center;" onkeypress="inNumber();"></div>
			</div>
			<div class="row" id="eating_Pro">
				<div class="col-3" style="text-align:center; padding:3px; font-size:17px">단백질(g)</div>
				<div class="col-6" id="Pro_span" style="text-align:center;"><span id="default_Pro"></span><input type="hidden" class="form-control" name="eating_Pro"  style="text-align:center;" onkeypress="inNumber();"></div>
			</div>
			<div class="row" id="eating_Fat">
				<div class="col-3" style="text-align:center; padding:3px; font-size:17px">지방(g)</div>
				<div class="col-6"  id="Fat_span" style="text-align:center;"><span id="default_Fat"></span><input type="hidden" class="form-control" name="eating_Fat"  style="text-align:center;" onkeypress="inNumber();"></div>
			</div>
		</div>
		<!-- ------------------------------ -->
		<!-- 운동 선택했을 때 -->
		<div id="content_exe">
			<div class="row" id="exe_time">
				<div class="col-3" style="text-align:center; padding:3px; font-size:17px">시간(분)</div>
				<div class="col-6" style="text-align:center;"><input type="text" class="form-control" name="exe_time" style="text-align:center;" onkeypress="inNumber();"></div>
			</div>
			<div class="row" id="exe_Kcal">
				<div class="col-3" style="text-align:center; padding:3px; font-size:17px">칼로리(kcal)</div>
				<div class="col-6" style="text-align:center;"><span id="exeKcal_span"></span><input type="hidden" class="form-control" name="exe_Kcal" style="text-align:center;" onkeypress="inNumber();"></div>
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
				<div class="col-6">
					<input type="text" class="form-control " name="water_ml" onkeypress="inNumber();"><!-- form-control is-valid -->
					<div class="invalid-feedback" style="display:none">
	       				 0이상을 입력해주세요!
	      			</div>
      			</div> 
				
      			
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

var u_weight='${u_weight}';
var d_no = '${d_no}';
/* console.log("몸무게: ",u_weight);
console.log("다이어리 번호: ",d_no);
 */
//초기 상태
$("#content_eat,#content_exe,#search,#search_food,#content_water,#search_list").hide();
$("#search_insert,#search_btn").show();
$("input[name=search_insert]").attr("disabled",true); 

//추가항목 선택시
$('select[name=selectAdd]').change(function(){
	$("#default_msg").text('선택해주세요!'); 
	console.log( $(this).val());
	selectType = $(this).val();
	
	//검색까지 한 후 다시 선택시 
	$("input[name=search_insert]").attr('readonly',false);
	$("input[name=search_insert]").val('');
	$("#search_list").hide(); //검색 결과 숨기기
	
	//음식 칸 초기화
	$("input[name=eating_gram]").val('');
	$("#default_Kcal").text('');
	$("#default_Carbo").text('');
	$("#default_Pro").text('');
	$("#default_Fat").text('');
	//직접입력칸 초기화
	$("input[name=search_food]").prop('type','hidden');
	 $("input[name=eating_Kcal]").prop('type','hidden');
	 $("input[name=eating_Carbo]").prop('type','hidden');
	 $("input[name=eating_Pro]").prop('type','hidden');
	 $("input[name=eating_Fat]").prop('type','hidden');
	 
	 $("input[name=search_food]").val('');
	 $("input[name=eating_Kcal]").val('');
	 $("input[name=eating_Carbo]").val('');
	 $("input[name=eating_Pro]").val('');
	 $("input[name=eating_Fat]").val('');
	 
	 //운동 칸 초기화
	 $("input[name=exe_time]").val('');
	 $("#exeKcal_span").text('');
	 //직접입력칸 초기화
	 $("input[name=exe_Kcal]").prop('type','hidden');
	 $("input[name=exe_Kcal]").val('');
	
	//섭취목록 선택시
	if( $(this).val()=='breakfast' || $(this).val()=='morning_snack' || $(this).val()=='lunch' || $(this).val()=='afternoon_snack' || $(this).val()=='dinner' || $(this).val()=='late_night_meal'){selectMenu = $(this).val();
		selectMenu = 'foodlist';
		$("#content_exe").hide();
		$("#content_water").hide();
		$("#search_insert").show();
		$("#search_btn").show();
		$("#content_eat").show();
		$("#search_food").show();
		$("#search").hide();
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
		$("#search").hide();
		$("input[name=search_insert]").attr("disabled",false); 
	//물 선택시
	}else if($(this).val() == 'water'){
		selectMenu = 'water';
		$("#content_eat,#content_exe,#search_inser,#search_btnt,#search").hide();
		$("#content_water,#search_food").show();
		$("input[name=search_insert]").attr("disabled",true); 
	//아무것도 선택 안했을 때
	}else if($(this).val() == 'select'){
		$("#content_eat,#content_exe,#search,#search_food,#content_water,#search").hide();
		$("#search_insert,#search_btn").show();
		$("#search_insert").attr("disabled",true); 
	}
	
});	


var reqUrl = 'searchList/';
var searchInsert = '';
var content = '';

//검색 버튼 클릭시 
$("#goSearch").click(function(){
	content ='';
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
	    			content +='</li>'; 
	    		}
    		}
    		content +='<li class="list-group-item" style="height: 30px; vertical-align: middle; padding:0; color:blue"><span class="empty">직접 입력</span></li>';
    		 
    		//초기화
    		
    		$("#search_ul li").remove();
    		$("#search_ul").append(content);
           /*  $("#search_ul").append(content); */
            reqUrl ='searchList/';
    	},
    	error:function(error){
    		console.log(error);
    	}
    });  
});

//선택한 음식 값 받아오기
var food_name;
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
var exe_name;
var met;
var u_weight;
var exeTime;
var exeKcal;

//물 마신량 불러오기
var waterml;

var emptyYN=false;

//검색 리스트에서 항목 선택시 
$("#search_ul").on("click","li",function(){
	console.log($(this)[0].firstChild.className);
	$("#search").show();//등록 버튼 보이기
	$("#search_list").hide(); //검색 결과 숨기기
	$("#search_ul li").remove();
	$("input[name=search_insert]").attr('readonly',true);
	 
	//직접 선택시 
	if($(this)[0].firstChild.className=="empty"){
		 console.log("직접선택 요청");
		 $("#search").hide();//등록 버튼 보이기
		 $("#default_msg").text(''); 
		 emptyYN=true;
		 //음식
		 $("input[name=search_food]").prop('type','text');
		 $("input[name=eating_Kcal]").prop('type','text');
		 $("input[name=eating_Carbo]").prop('type','text');
		 $("input[name=eating_Pro]").prop('type','text');
		 $("input[name=eating_Fat]").prop('type','text');
		 
		 
		 //운동
		 $("input[name=exe_Kcal]").prop('type','text');
		 
		 if(selectMenu == 'foodlist'){
			 $("input[name=search_food]").val('');
			 $("input[name=eating_Kcal]").val('');
			 $("input[name=eating_Carbo]").val('');
			 $("input[name=eating_Pro]").val('');
			 $("input[name=eating_Fat]").val('');
		 }
		 
	//검색항목에서 선택시 	 
	 }else{
		 
		 $("input[name=search_food]").prop('type','hidden');
		 $("input[name=eating_Kcal]").prop('type','hidden');
		 $("input[name=eating_Carbo]").prop('type','hidden');
		 $("input[name=eating_Pro]").prop('type','hidden');
		 $("input[name=eating_Fat]").prop('type','hidden');
		 $("input[name=exe_Kcal]").prop('type','hidden');
		 
		// 선택한 음식 받아온 값 집어넣기
		food_name = $(this).find(".foodName").text();
		weight = $(this).find(".food_weight").text();
		kcal = $(this).find(".food_calorie").text();
		carbo = $(this).find(".food_carbo").text();
		protein = $(this).find(".food_protein").text();
		fat = $(this).find(".food_fat").text();
		
		if(selectMenu == 'foodlist'){
			$("#default_msg").text($(this).find(".foodName").text()); 
			$("input[name=eating_gram]").val($(this).find(".food_weight").text());
			$("#default_Kcal").text($(this).find(".food_calorie").text());
			$("#default_Carbo").text($(this).find(".food_carbo").text());
			$("#default_Pro").text($(this).find(".food_protein").text());
			$("#default_Fat").text($(this).find(".food_fat").text());
		
		}else if(selectMenu == 'met'){
			//운동일 경우 - met 데이터 받아오기
			exe_name = $(this).find(".met_name").text();
			met = $(this).find(".met").text();
			
			$("#default_msg").text($(this).find(".met_name").text()); //선택한 운동으로 이름 바꾸기
		}
	 }
	
});

//검색한걸 지울 때
$("#deleteSearch").click(function(){
	console.log("검색삭제");
	//검색칸 초기화
	$("input[name=search_insert]").attr('readonly',false);
	$("input[name=search_insert]").val('');
	$("#search_list").hide();
	//이름 초기화
	$("#default_msg").text('선택해주세요!'); 
	
	//등록버튼 지우기
	$("#search").hide();
	
	//음식 칸 초기화
	$("input[name=eating_gram]").val('');
	$("#default_Kcal").text('');
	$("#default_Carbo").text('');
	$("#default_Pro").text('');
	$("#default_Fat").text('');
	
	//직접입력칸 초기화
	$("input[name=search_food]").prop('type','hidden');
	 $("input[name=eating_Kcal]").prop('type','hidden');
	 $("input[name=eating_Carbo]").prop('type','hidden');
	 $("input[name=eating_Pro]").prop('type','hidden');
	 $("input[name=eating_Fat]").prop('type','hidden');
	 
	 //운동 칸 초기화
	 $("input[name=exe_time]").val('');
	 $("#exeKcal_span").text('');
	 //직접입력칸 초기화
	 $("input[name=exe_Kcal]").prop('type','hidden');
	 $("input[name=exe_Kcal]").val('');
});

//섭취 분량 조절시 
var changCnt=0;
//분량을 접근할 때
$("input[name=eating_gram]").focusin(function(){
	   console.log("섭취 칼로리 접근");
	   $(this).css("background-color","white");
});

//분량 벗어났을 때
$("input[name=eating_gram]").focusout(function(){
	   console.log("섭취 칼로리 벗어남");
	   console.log($(this));
	
	   if(!emptyYN){
	    //원래 입력했던 데이터와 다를 때 변경
	    if($(this).val() != $(this).prop('defaultValue')){
	    	console.log('분량 변경');
	    	changCnt = changCnt+1;
	    	console.log("변경 횟수 : ",changCnt);
	    	gram=$(this).val();
	    	
	    	//변경되는 계산식
	    	changeKcal = Math.ceil(kcal/weight * gram);
	    	changeCarbo = Math.ceil(carbo/weight * gram);
	    	changeProtein = Math.ceil(protein/weight * gram);
	    	changeFat = Math.ceil(fat/weight * gram);
	    	
	    	console.log(gram+"/"+weight+"/"+kcal+"/"+changeKcal+"/"+carbo+"/"+protein+"/"+fat);
	    	
	    	$("#default_Kcal").text(changeKcal);
	    	$("#default_Carbo").text(changeCarbo);
	    	$("#default_Pro").text(changeProtein);
	    	$("#default_Fat").text(changeFat);
	    }
	   }else{
			weight=$(this).val();
	   }
});
//-------------------------------------------------------------------------//

//운동시간 입력시
//운동시간 입력칸 접근
$("input[name = exe_time]").focusin(function(){
	console.log("운동시간 입력칸 접근");
	$(this).css("background-color","white");
});

//운동시간 입력칸 벗어났을 때
$("input[name = exe_time]").focusout(function(){
	console.log("운동시간 입력칸 벗어남");
	
	
	
	if($(this).val() != $(this).prop('defaultValue')){
		
		console.log('운동 시간 변경');
		exeTime = $(this).val();
		console.log("운동 시간 : ",exeTime);
		console.log("met : ",met);
		//운동 칼로리 계산 공식
		exeKcal = Math.ceil(met *3.5*u_weight/200*exeTime);
		
		console.log("운동 칼로리 : ",exeKcal);
		$("#exeKcal_span").text(exeKcal);
		
	}
});
/*-------------------------------------------------------*/

//물 입력시
$("input[name = water_ml]").focusin(function(){
	console.log("물 입력칸 접근");
	$(this).css("background-color","white");
});

//운동시간 입력칸 벗어났을 때
$("input[name = water_ml]").focusout(function(){
	console.log("물 입력칸 벗어남");
	
	if($(this).val() != $(this).prop('defaultValue')){
		
		console.log('물 입력칸 벗어남');
		water_ml = $(this).val();
		
	}
	
	if(water_ml>0){
		console.log("물 섭취량 : ",water_ml);
		$(this).removeClass("is-invalid");
		$("#water_ml").find(".invalid-feedback").css("display","none");
		$("#search").show();//등록 버튼 보이기
		
	}else{
		console.log("물 0보다 적게 섭취 했을 때");
		$(this).addClass("is-invalid");
		$("#water_ml").find(".invalid-feedback").css("display","inline");
		$("#search").hide();
	}
});






/*-----------------------------------------------*/
var d_code; //분류코드
var submitUrl = 'submitList';
var submitArr={}; // 값을 넘겨 줄 배열 선언

//전송 버튼 클릭시
$("#submitBtn").click(function(){
	console.log("selectMenu: ",selectMenu);
	
	//분류 코드 구분 
	if(selectType == 'breakfast'){d_code = 'HD001'}
	else if(selectType == 'morning_snack'){d_code='HD002'}
	else if(selectType == 'lunch'){d_code='HD003'}
	else if(selectType == 'afternoon_snack'){d_code='HD004'}
	else if(selectType == 'dinner'){d_code='HD005'}
	else if(selectType == 'late_night_meal'){d_code='HD006'}
	else if(selectType == 'water'){d_code='HD007'}
	
	
	submitArr.selectMenu=selectMenu;
	//음식의 경우
	//검색 리스트에서 선택했을 경우
	if(selectMenu =='foodlist'){
		submitArr.hd_no = d_no; 
		submitArr.hd_code = d_code;
		submitArr.hd_eat = gram;
		submitArr.hd_foodname = food_name;
		
			if(changCnt >0 && !emptyYN){ //분량을 변경한 경우
			 submitArr.hd_eat = gram;
			 submitArr.hd_carbo = changeCarbo;
			 submitArr.hd_protein = changeProtein;
			 submitArr.hd_fat = changeFat;
			 submitArr.hd_kcal = changeKcal;
			}else{//변경하지 않은 경우
			 submitArr.hd_eat = weight;
			 submitArr.hd_carbo = carbo;
			 submitArr.hd_protein = protein;
			 submitArr.hd_fat = fat;
			 submitArr.hd_kcal = kcal;
			}
		
		
		
	//운동의 경우
	}else if(selectMenu =='met'){
		submitArr.he_no=d_no;
		submitArr.he_time = exeTime;
		submitArr.he_kcal = exeKcal;
		submitArr.met_name = exe_name;
	}else if(selectMenu =='water'){
		submitArr.hd_no =d_no;
		submitArr.hd_code=d_code;
		submitArr.hd_foodname = '물';
		
		submitArr.hd_eat = water_ml;
		submitArr.hd_carbo = 0;
		submitArr.hd_protein = 0;
		submitArr.hd_fat = 0;
		submitArr.hd_kcal = 0;
	}
	
	console.log(submitArr);
	
	//최종적 전송
	$.ajax({
		url:submitUrl,
		type:'post',
		data :  submitArr,
		dataType:'json',
		success:function(data){
			console.log(data);
			console.log(data.success);
			if(data.success=="success"){
				console.log("등록성공");
				opener.parent.location.reload();
				window.location.reload();
			}else{
				console.log("등록실패");
			}
		},
		error:function(error){
			console.log(error);
		}
	})
	
	
});

//입력한 내용이 숫자가 아니면 막아버리는 함수
function inNumber(){
    if(event.keyCode<48 || event.keyCode>57){
       event.returnValue=false;
    }
}
//-----------------//
</script>
</html>