<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!--  -->
<script src="resources/js/circle-progress.js"></script>

<title>diary</title>
<style>
.circle_strong {
	position: absolute;
	top: 110px;
	left: 103px;
	text-align: center;
	line-height: 40px;
	font-size: 24px;
}

a:hover {
	text-decoration: none;
}

#photo {
	display: none;
}

.progress.active .progress-bar {
	-webkit-transition: none !important;
	transition: none !important;
}

.progress {
	height: 20px;
}

.progress-bar {
	background: -webkit-linear-gradient(left, #0275d8 " 0%, #5bc0de 100%);
}

.checked{
	text-decoration: line-through;
	color:gray;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="container mt-5">

		<!-- 날짜 나타남 -->
		<div class="row m-auto pb-3" >
		<div class="col-sm-5 float-left p-0">
			<a  href="calendar"><i class="fas fa-chevron-left mr-3 mt-2" style="color:#0275d8;"></i><b>캘린더 가기</b></a>
		</div>
		<div class="col-sm-7 m-auto">
			<span id="date" style="font-size: 24px; font-weight: bold;"></span>
		</div>
		</div>

		<!-- 몸무게 입력 -->
		<form class="form-inline mt-5" action="#">
			<label for="weight">몸무게:</label> <input type="text"
				class="form-control ml-3 " id="d_weight" placeholder="몸무게 입력"
				name="weight" style="width: 80px;" value="" /> <label class="ml-1">Kg</label>
		</form>

		<div class="row my-3">

			<!-- 섭취 그래프 -->
			<div class="col mt-4 col-sm-3.2">
				<p><b>섭취 그래프</b></p>
				<div class="circle1" id="KcalCircle">
					<strong class="circle_strong"></strong>
				</div>

				<form class="form-inline" action="#"
					class="circle_strong form-inline">
					<label for="weight">목표 섭취 칼로리:</label> <input type="text"
						class="form-control ml-3 mb-1" id="d_tarKcal" placeholder=""
						name="eatTarKcal" style="width: 110px;" value="" /><label
						class="ml-1">Kcal</label>
						<p id="eatKcal"></p>
				</form>
			</div>

			<!-- 운동 그래프 -->
			<div class="col mt-4 col-sm-3.2">
				<p><b>운동 그래프</b></p>
				<div class="circle2" id="ExeCircle">
					<strong class="circle_strong"></strong>
				</div>
				<form class="form-inline" action="#"
					class="circle_strong form-inline">
					<label for="weight">목표 운동 칼로리 :</label> <input type="text"
						class="form-control ml-3" id="d_tarExe" placeholder=""
						name="exeTarKcal" style="width: 110px;" value="" /> <label
						class="ml-1">Kcal</label>
					<p id="exeKcal"></p>
				</form>
			</div>

			<!-- 탄단지 -->
			<div class="col col-sm-5.6 mt-4">

				<!-- 저탄고지, 밸런스 셀렉트 -->
				<div class="row my-3 mr-1 ">
					<span><b>탄단지 섭취 그래프</b></span>
					<!-- <select class="form-control form-control-sm"
						style="width: 90px; margin-left:120px;">
						<option>밸런스</option>
						<option>저탄고지</option>
					</select> -->
				</div>

				<div class="row my-3 mr-1 pt-3">탄수화물 (g)</div>
				<div class="row my-3 mr-1">
					<div class="col-sm-9 progress-container">
						<div class="progress active">
							<div class="progress-bar progress-bar-success" id="carboPercent"></div>
						</div>
					</div>
					<div class="col-sm-3" id="carbo"></div>
				</div>
				<div class="row my-3 mr-1 pt-1">단백질 (g)</div>
				<div class="row my-3 mr-1">
					<div class="col-sm-9 progress-container">
						<div class="progress active">
							<div class="progress-bar progress-bar-success"id="proteinPercent"></div>
						</div>
					</div>
					<div class="col-sm-3" id="protein"></div>
				</div>
				<div class="row my-3 mr-1 pt-1">지방 (g)</div>
				<div class="row my-3 mr-1">
					<div class="col-sm-9 progress-container">
						<div class="progress active">
							<div class="progress-bar progress-bar-success" id="fatPercent"></div>
						</div>
					</div>
					<div class="col-sm-3" id="fat"></div>
				</div>
				
			</div>
		</div>

		<hr />

		<!-- 음식,운동 리스트 -->
		<div class="container my-5">

			<div class="row mb-5">
					<button type="button" class="btn btn-primary btn-sm "
						style="width: 33px; height: 33px;" id="submitListBtn">
						<i class="fas fa-plus"></i>
					</button> <span style="font-size: 18px; font-weight: bold" class="pl-1">
						추가하기</span>
			</div>

			<h3>섭취</h3>
			<div id="accordion" class="my-3" style="display:none">
				<div class="card" id="hisDailyDiv">
					<div class="card-header">
						<a class="card-link" data-toggle="collapse" href="#collapse1">
							<b>아침</b> <!-- <span>바나나</span> <span>사과</span> <span>계란</span> <span>우유</span>
							<b class="float-right">1000kcal</b> -->
						</a>
					</div>
					<div id="collapse1" class="collapse hide"
						data-parent="#accordion">
						<div class="card-body" id="breakfast">
							<table class="table">
								<thead>
									<tr>
										<th>음식명</th>
										<th>섭취량(g)</th>
										<th>탄수화물 (g)</th>
										<th>단백질 (g)</th>
										<th>지방(g)</th>
										<th colspan="2">칼로리(kcal)</th>
									</tr>
								</thead>
								<tbody id="HD001">
									
								</tbody>
							</table>
						</div>					
					</div>
				</div>
			</div>
			
			<div id="accordion" class="my-3"  style="display:none">
				<div class="card" id="hisDailyDiv">
					<div class="card-header">
						<a class="card-link" data-toggle="collapse" href="#collapse2">
							<b>오전간식</b> <!-- <span>바나나</span> <span>사과</span> <span>계란</span> <span>우유</span>
							<b class="float-right">1000kcal</b> -->
						</a>
					</div>
					<div id="collapse2" class="collapse hide"
						data-parent="#accordion">
						<div class="card-body" id="morningSnack">
							<table class="table">
								<thead>
									<tr>
										<th>음식명</th>
										<th>섭취량(g)</th>
										<th>탄수화물 (g)</th>
										<th>단백질 (g)</th>
										<th>지방(g)</th>
										<th colspan="2">칼로리(kcal)</th>
									</tr>
								</thead>
								<tbody id="HD002">
								<!-- 목록 뿌리기 -->
								</tbody>
							</table>
						</div>					
					</div>
				</div>
			</div>
			
			<div id="accordion" class="my-3"  style="display:none">
				<div class="card" id="hisDailyDiv">
					<div class="card-header">
						<a class="card-link" data-toggle="collapse" href="#collapse3">
							<b>점심</b> <!-- <span>바나나</span> <span>사과</span> <span>계란</span> <span>우유</span>
							<b class="float-right">1000kcal</b> -->
						</a>
					</div>
					<div id="collapse3" class="collapse hide"
						data-parent="#accordion">
						<div class="card-body" id="launchContent">
							<table class="table">
								<thead>
									<tr>
										<th>음식명</th>
										<th>섭취량(g)</th>
										<th>탄수화물 (g)</th>
										<th>단백질 (g)</th>
										<th>지방(g)</th>
										<th colspan="2">칼로리(kcal)</th>
									</tr>
								</thead>
								<tbody id="HD003">
								<!-- 목록 뿌리기 -->
								</tbody>
							</table>
						</div>					
					</div>
				</div>
			</div>

			<div id="accordion" class="my-3"  style="display:none">
				<div class="card" id="hisDailyDiv">
					<div class="card-header">
						<a class="card-link" data-toggle="collapse" href="#collapse4">
							<b>오후간식</b> <!-- <span>바나나</span> <span>사과</span> <span>계란</span> <span>우유</span>
							<b class="float-right">1000kcal</b> -->
						</a>
					</div>
					<div id="collapse4" class="collapse hide"
						data-parent="#accordion">
						<div class="card-body" id="afterSnack">
							<table class="table">
								<thead>
									<tr>
										<th>음식명</th>
										<th>섭취량(g)</th>
										<th>탄수화물 (g)</th>
										<th>단백질 (g)</th>
										<th>지방(g)</th>
										<th colspan="2">칼로리(kcal)</th>
									</tr>
								</thead>
								<tbody id="HD004">
								<!-- 목록 뿌리기 -->
								</tbody>
							</table>
						</div>					
					</div>
				</div>
			</div>
			
			<div id="accordion" class="my-3"  style="display:none">
				<div class="card" id="hisDailyDiv">
					<div class="card-header">
						<a class="card-link" data-toggle="collapse" href="#collapse5">
							<b>저녁</b> <!-- <span>바나나</span> <span>사과</span> <span>계란</span> <span>우유</span>
							<b class="float-right">1000kcal</b> -->
						</a>
					</div>
					<div id="collapse5" class="collapse hide"
						data-parent="#accordion">
						<div class="card-body" id="dinner">
							<table class="table">
								<thead>
									<tr>
										<th>음식명</th>
										<th>섭취량(g)</th>
										<th>탄수화물 (g)</th>
										<th>단백질 (g)</th>
										<th>지방(g)</th>
										<th colspan="2">칼로리(kcal)</th>
									</tr>
								</thead>
								<tbody id="HD005">
								<!-- 목록 뿌리기 -->
								</tbody>
							</table>
						</div>					
					</div>
				</div>
			</div>
			
			<div id="accordion" class="my-3"  style="display:none">
				<div class="card" id="hisDailyDiv">
					<div class="card-header">
						<a class="card-link" data-toggle="collapse" href="#collapse6">
							<b>야식</b> <!-- <span>바나나</span> <span>사과</span> <span>계란</span> <span>우유</span>
							<b class="float-right">1000kcal</b> -->
						</a>
					</div>
					<div id="collapse6" class="collapse hide"
						data-parent="#accordion">
						<div class="card-body" id="midSnack">
							<table class="table">
								<thead>
									<tr>
										<th>음식명</th>
										<th>섭취량(g)</th>
										<th>탄수화물 (g)</th>
										<th>단백질 (g)</th>
										<th>지방(g)</th>
										<th colspan="2">칼로리(kcal)</th>
									</tr>
								</thead>
								<tbody id="HD006">
								<!-- 목록 뿌리기 -->
								</tbody>
							</table>
						</div>					
					</div>
				</div>
			</div>
			
			<div id="accordion" class="my-3"  style="display:none">
				<div class="card" id="hisDailyDiv">
					<div class="card-header">
						<a class="card-link" data-toggle="collapse" href="#collapse7">
							<b>물</b>
							<b class="float-right">1000ml</b>
						</a>
					</div>
					<div id="collapse7" class="collapse hide"
						data-parent="#accordion">
						<div class="card-body" id="water">
							<table class="table">
								<thead>
									<tr>
										<th>음식명</th>
										<th>섭취량(g)</th>
										<th>탄수화물 (g)</th>
										<th>단백질 (g)</th>
										<th>지방(g)</th>
										<th colspan="2">칼로리(kcal)</th>
									</tr>
								</thead>
								<tbody id="HD007">
								<!-- 목록 뿌리기 -->
								</tbody>
							</table>
						</div>					
					</div>
				</div>
			</div>
			
			<hr />


			<h3>운동</h3>
			<div id="accordion" class="my-3"  style="display:none">
				<div class="card">
					<div class="card-header">
						<a class="card-link" data-toggle="collapse" href="#collapse8">
							<b>운동</b> <!-- <span>줄넘기</span> <span>달리기</span> <span>뛰기</span> <span>훌라후프</span>
							<b class="float-right">1000kcal</b> -->
						</a>
					</div>
					<div id="collapse8" class="collapse hide"
						data-parent="#accordion">
						<div class="card-body">
							<table class="table">
								<thead>
									<tr>
										<th>운동명</th>
										<th>운동시간</th>
										<th colspan="2">소모 칼로리</th>
									</tr>
								</thead>
								<tbody id="exerciseBox">
								<!-- 목록 뿌리기 -->
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>

		<hr />

		<!-- 일기 메모 -->
		<div class="container my-4">
			<div class="form-group">
				<h3>일기 메모</h3>
				<textarea class="form-control m-auto pt-4" rows="10" id="memoContent"
					style="overflow-y: scroll; resize: none;"
					placeholder="오늘의 일기를 적어보세요."></textarea>
			</div>

			<div class="row">
				

<!-- -------------------- 사진 --------------------- -->
				
				<form id="photoForm" method="post">
					<!-- <label for="photo">
						<button type="button" class="btn btn-primary btn-sm "
							style="width: 33px; height: 33px;" id="fileBtn">
							<i class="fas fa-plus"></i>
						</button>
						<span style="font-size: 18px; font-weight: bold; cursor: pointer;" class="ml-1 text-primary"> 사진추가</span>
					</label> -->
					<label for="photo" class="btn btn-primary btn-sm" style="width: 33px; height: 33px;" id="fileBtn">
							<i class="fas fa-plus"></i>
					</label>
					<span style="font-size:18px; font-weight:bold;" class="ml-1"> 사진추가</span>
					<input type="file" name="photo" id="photo" accept="image/gif,image/jpeg,image/png,image/jpg">
					<input type="hidden" name="d_no" id="d_no" value=""> <!-- Ajax를 실행시켜 d_no를 여기에 넣는다 -->
					
				</form>
			</div>

			<!-- 이미지가 들어간다 -->
			<div id="imageWrap"></div>
		</div>


<!-- -------------------- 사진 --------------------- -->

		<hr />

		<!-- 체크 리스트 -->
		<div class="container my-4">
			<h3>체크 리스트</h3>
			<form id="checkListBox">
			<!-- 체크리스트 뿌려준다. -->
			</form>

			<hr />

			<div class="row m-auto">
				<form class="form-inline " action="#" class="circle_strong form-inline">
					<button type="button" class="btn btn-primary btn-sm"
						style="width: 33px; height: 33px;" id="checklistBtn">
						<i class="fas fa-plus"></i>
					</button>
					<input type="text"
						class="form-control mr-1 ml-4" id="checkList" placeholder="체크리스트를 적어보세요."
						name="checkList" value="" style="width: 1000px;" />
				</form>
				
			</div>
		</div>


	</div>
	<!-- --container end-- -->
</body>
<style>
.imgWrap{
	position:relative;
	
}
.closeImgWrap{
	position:absolute;
	left:220px;
}
.closeImgWrap:hover{
	cursor:pointer;
}
</style>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js"
	integrity="sha512-Wt1bJGtlnMtGP0dqNFH1xlkLBNpEodaiQ8ZN5JLA5wpc1sUlk/O5uuOMNgvzddzkpvZ9GLyYNa8w2s7rqiTk5Q=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<!-- <script src="chartjs-plugin-doughnutlabel.js"></script>
<script src="chartjs-plugin-doughnutlabel.min.js"></script> -->
<script>
	

	//몸무게 업데이트
	$("input[name='weight']").focusout(function() {
		console.log('몸무게 update 요청');
		update($(this));
	});

	//메모 업데이트
	$("#memoContent").focusout(function() {
		console.log('메모 update 요청');
		update($(this));
	});
	
	//목표 섭취 칼로리 업데이트
	$("input[name='eatTarKcal']").focusout(function() {
		console.log('목표 섭취 칼로리 update 요청');
		update($(this));
	});
	
	//목표 섭취 칼로리 업데이트
	$("input[name='exeTarKcal']").focusout(function() {
		console.log('목표 운동 칼로리 update 요청');
		update($(this));
	});

	var ch_no;
	//체크박스 추가 시
	$("#checklistBtn").on("click",function(){
		 var CheckContent = $("input[name='checkList']");
		 console.log("체크리스트",CheckContent);
		 if(CheckContent.val() != null || CheckContent.val() != ''){
				console.log('체크리스트 insert 요청');
				$.ajax({
					url : 'checkList',
					type : 'get',
					dataType : 'json',
					data : {
						'd_no' : d_no,
						'content' : CheckContent.val()
					},
					success : function(data) {
						console.log("체크리스트 추가 성공 여부 : " + data.dto);
						console.log("체크리스트 번호: " + data.dto.ch_no);
	
						$("#checkListBox").append(
								"<div class='checkbox pl-5 pt-4 pr-5'><label style='font-size: 18px;'>"+
								"<input type='checkbox' value='"+data.dto.ch_no+"' style='transform: scale(1.3); margin-right:5px' name='checkbox'>"+data.dto.cd_content+"</label>"+
								"<a class='CheckDelBtn'><i class='fas fa-trash-alt float-right' ></i></a></div>"
							) 

						$("input[name='checkList']").val('');
					},
					error : function(error) {
						console.log(error);
					}
				});
		 }else{
			 alert("체크리스트 내용을 적어주세요.");
		 }
	 });

		//체크리스트 삭제 시
	 	$(document).on("click",".CheckDelBtn",function(){
			console.log($(this).prev().children().first().val());
			var delElement = $(this);
			$.ajax({
				url : 'checkDel',
				type : 'get',
				dataType : 'json',
				data : {
					'ch_no' : $(this).prev().children().first().val()
				},
				success : function(data) {
					console.log("체크리스트 삭제 성공 여부 : " + data);
					if(data>0){
						delElement.parent().remove();
					}
					
				},
				error : function(error) {
					console.log(error);
				}
			});
		});
	

	 	/*체크박스 체크 시*/
	 	$(document).on("click","input:checkbox[name='checkbox']",function(){
	 		console.log($(this).parents("label"),"체크리스트 체크");
	 		
	 		if($(this).is(":checked") ==  true){ //체크 되어 있을 경우
	 			$(this).parents("label").css({"text-decoration":"line-through","color":"gray"});
	 			console.log("체크리스트 Y");
	 			$.ajax({
					url : 'checkYN',
					type : 'get',
					dataType : 'json',
					data : {
						'ch_no' : $(this).val(),
						'checkYN' : 'Y'
					},
					success : function(data) {
						console.log("체크리스트 체크 상태 변경 : " + data);
					},
					error : function(error) {
						console.log(error);
					}
				});
			 }else{  //체크 취소
				console.log("체크리스트 N",$(this).val());
				$(this).parents("label").css({"text-decoration":"none","color":"black"});
	 			$.ajax({
					url : 'checkYN',
					type : 'get',
					dataType : 'json',
					data : {
						'ch_no' : $(this).val(),
						'checkYN' : 'N'
					},
					success : function(data) {
						console.log("체크리스트 체크 상태 변경 : " + data);
					},
					error : function(error) {
						console.log(error);
					}
				});
			 }
	 		
	 		
	 	});
		 
		 
	//값 업데이트 메서드
	function update(obj) {
		console.log("update 값 : " + obj.attr('id') + "/" + obj.val());
		var url = '';

		if (obj.attr('id') == 'memoContent') { //메모 업데이트
			url = 'memoUpdate';
		} else if (obj.attr('id') == 'd_weight') { //몸무게 업데이트
			url = 'weightUpdate';
		}else if (obj.attr('id') == 'd_tarKcal') { //목표 섭취 칼로리 업데이트
			url = 'eatTarKcalUpdate';
		}else if (obj.attr('id') == 'd_tarExe') { //목표 운동 칼로리 업데이트
			url = 'exeTarKcalUpdate';
		}

		$.ajax({
			url : url,
			type : 'get',
			dataType : 'json',
			data : {
				'd_no' : d_no,
				'content' : obj.val()
			},
			success : function(data) {
				console.log("업데이트 성공 여부 : " + data);
				if(obj.attr('id') == 'd_tarExe' || obj.attr('id') == 'd_tarKcal') {
					window.location.reload();
					window.scrollTo(0,0);
				}
			},
			error : function(error) {
				console.log(error);
			}
		});
	}



	var search = location.search
	var params = new URLSearchParams(search);
	var getType = params.get('Date');
	console.log(getType);

	var d_tarKcal;//목표 섭취 칼로리
	var d_resultEat;//섭취 칼로리 합계
	var d_tarKcalPercent; //섭취 칼로리 달성률
	
	var d_tarExe;//목표 운동 칼로리
	var  d_resultExe; //운동칼로리 합계
	var d_tarExePercent; //운동 칼로리 달성률
	
	var d_carbo; //권장 탄수화물
	var carboPercent; //탄수화물 섭취 비율
	
	var d_protein;//권장 단백질
	var proteinPercent;//단백질 섭취 비율
	
	var d_fat;//권장 지방
	var fatPercent;//지방 섭취 비율
	
	var d_no;

	var tarKcalPercent;
	var tarExePercent;
	
	/*일기 목록 추가시 필요한 데이터 : 몸무게 */
	var u_weight;
	/*--------------------------------------*/
	
	/*처음 디폴트 값 뿌려주고 DB에 저장*/
	$.ajax({
		type : 'get',
		url : 'diaryDetail',
		data : {
			'date' : getType,
			'id' : '${sessionScope.loginId}'
		},
		dataType : 'JSON',
		success : function(data) {
			console.log("성공");
			console.log(data.dto);

			d_tarKcal = parseInt(data.dto.d_tarKcal); //목표 섭취 칼로리
			d_tarExe = parseInt(data.dto.d_tarExe); //목표 운동 칼로리
			d_resultEat = parseInt(data.dto.d_resultEat); //섭취 칼로리
			document.getElementById("eatKcal").innerText = '총 섭취 칼로리 : '+d_resultEat+'   Kcal';
			
			d_resultExe = parseInt(data.dto.d_resultExe); //운동 칼로리
			document.getElementById("exeKcal").innerText = '총 운동 칼로리 : '+d_resultExe+'   Kcal';
			
			//몸무게 , 목표 섭취,운동 칼로리 뿌려주기
			document.getElementById("d_weight").value = data.dto.d_weight;
			document.getElementById("d_tarKcal").value = d_tarKcal;
			document.getElementById("d_tarExe").value = d_tarExe;
			
			
			u_weight=data.dto.d_weight;
			
			//목표 섭취,운동 달성률 계산
			d_tarKcalPercent = Math.floor((data.dto.d_resultEat/data.dto.d_tarKcal)*100);
			d_tarExePercent = Math.floor((data.dto.d_resultExe/data.dto.d_tarExe)*100);
			console.log("섭취 칼로리 달성률: ",d_tarKcalPercent,"운동 칼로리 달성률 : ",d_tarExePercent);
			
			tarKcalCircle(d_tarKcalPercent); //섭취 그래프 그리기
			tarExeCircle(d_tarExePercent); //운동 그래프 그리기
			
			//메모 뿌려주기
			document.getElementById("memoContent").value = data.dto.d_memo;

			//권장 탄단지 뿌려주기
			d_carbo = JSON.parse(data.dto.d_carbo);
			d_protein = JSON.parse(data.dto.d_protein);
			d_fat = JSON.parse(data.dto.d_fat);
			
			//섭취 탄단지/권장 탄단지 뿌려주기
			document.getElementById("carbo").innerText = '('+data.dto.d_resultCarbo+'/'+data.dto.d_carbo+')';
			document.getElementById("protein").innerText = '('+data.dto.d_resultProtein+'/'+data.dto.d_protein+')';
			document.getElementById("fat").innerText = '('+data.dto.d_resultFat+'/'+data.dto.d_fat+')';
			
			//탄단지 섭취 비율 계산 (밸런스)
			//탄수화물
			
			carboPercent = Number(Math.floor((data.dto.d_resultCarbo/data.dto.d_carbo)*100));
			document.getElementById("carboPercent").innerText = carboPercent+'%';
			document.getElementById("carboPercent").style.width ="0%";
			//단백질
			proteinPercent = Number(Math.floor((data.dto.d_resultProtein/data.dto.d_protein)*100));
			document.getElementById("proteinPercent").innerText = proteinPercent+'%';
			document.getElementById("proteinPercent").style.width ="0%";
			//지방
			fatPercent = Number(Math.floor((data.dto.d_resultFat/data.dto.d_fat)*100));
			document.getElementById("fatPercent").innerText = fatPercent+'%';
			document.getElementById("fatPercent").style.width ="0%";

			console.log(carboPercent,proteinPercent,fatPercent);
			progressBarAnimate(); //탄단지 그래프 그리기

			d_no = data.dto.d_no;
			console.log("d_no",d_no);
			

			//체크리스트 뿌리기
			var ch_noList = data.ch_noList;
			var checkContent = '';
			ch_noList.forEach(function(element){
				console.log(element);
				if(element.cd_checkYN == 'Y'){ //체크 되어 있을 경우
					checkContent += "<div class='checkbox pl-5 pt-4 pr-5'><label style='font-size: 18px; text-decoration:line-through; color:gray;'>";
					checkContent += "<input type='checkbox' value='"+element.ch_no+"' style='transform: scale(1.3); margin-right:5px' name='checkbox' checked>"+element.cd_content+"</label>";
				}else{ //체크 안되어 있을 경우
					checkContent += "<div class='checkbox pl-5 pt-4 pr-5'><label style='font-size: 18px;' >";
					checkContent += "<input type='checkbox' value='"+element.ch_no+"' style='transform: scale(1.3); margin-right:5px' name='checkbox'>"+element.cd_content+"</label>";
				}
					checkContent += "<a class='CheckDelBtn'><i class='fas fa-trash-alt float-right' ></i></a></div>";
			});
			$("#checkListBox").html(checkContent);

			
			//섭취 목록 뿌려주기
			var hisDailyList = data.hisDailyList;
			hisDailyList.forEach(function(element){
				var hisDailyListContent = '';
				console.log("음식 목록 테이블 추가 ",element);
				hisDailyListContent += "<tr>";
				hisDailyListContent +=	"<td>"+element.hd_foodName+"</td>";
				hisDailyListContent +=	"<td>"+element.hd_eat+"</td>";
				hisDailyListContent +=	"<td>"+element.hd_carbo+"</td>";
				hisDailyListContent +=	"<td>"+element.hd_protein+"</td>";
				hisDailyListContent +=	"<td>"+element.hd_fat+"</td>";
				hisDailyListContent +=	"<td>"+element.hd_kcal+"</td>";
				hisDailyListContent +=	"<td><a class='EatDelBtn' id="+element.hd_foodName+"><i class='fas fa-trash-alt float-right' ></i></a></td>";
				hisDailyListContent +="</tr>";
				
				$("#"+element.hd_code).append(hisDailyListContent);
				$("#"+element.hd_code).parents("#accordion").css("display","");

			});

			
			//운동 목록 뿌려주기
			var hisExerciseList = data.hisExerciseList;
			hisExerciseList.forEach(function(element){
				var hisExerciseListContent = '';
				console.log("운동 목록 테이블",element);
				hisExerciseListContent += "<tr>";
				hisExerciseListContent +=	"<td>"+element.met_name+"</td>";
				hisExerciseListContent +=	"<td>"+element.he_time+"</td>";
				hisExerciseListContent +=	"<td>"+element.he_kcal+"</td>";
				hisExerciseListContent +=	"<td><a class='ExeDelBtn' id="+element.met_name+"><i class='fas fa-trash-alt float-right' ></i></a></td>";
				hisExerciseListContent +="</tr>";
				
				$("#exerciseBox").append(hisExerciseListContent);
				$("#exerciseBox").parents("#accordion").css("display","");

			});
			

		},
		error : function(e) {
			console.log(e);
		}
	}); /*-----뿌려주기 ajax end-----*/
	
	
	//섭취 목록 삭제
 	$(document).on("click",".EatDelBtn",function(){
 		var hd_code = $(this).parents("tbody").attr("id"); //삭제할 음식의 코드 분류
 		var hd_foodName = $(this).attr("id"); //삭제할 음식 명
		console.log(hd_code,hd_foodName);
		var EatDelElement = $(this);
		
		$.ajax({
			url : 'EatDel',
			type : 'get',
			dataType : 'json',
			data : {
				'hd_no' : d_no,
				'hd_code' : hd_code,
				'hd_foodName' : hd_foodName
			},
			success : function(data) {
				console.log("음식 삭제 성공 여부 : " + data);
				if(data>0){
					EatDelElement.parents("tr").remove();
					window.location.reload();
					window.scrollTo(0,0);
				}
				
			},
			error : function(error) {
				console.log(error);
			}
		});
	});
	
	
	//운동 목록 삭제
 	$(document).on("click",".ExeDelBtn",function(){
 		var met_name = $(this).attr("id"); //삭제할 운동 명
		console.log(met_name);
		var ExeDelElement = $(this);
		
		$.ajax({
			url : 'ExeDel',
			type : 'get',
			dataType : 'json',
			data : {
				'he_no' : d_no,
				'met_name' : met_name
			},
			success : function(data) {
				console.log("운동 삭제 성공 여부 : " + data);
				if(data>0){
					ExeDelElement.parents("tr").remove();
					window.location.reload();
					window.scrollTo(0,0);
				}
				
			},
			error : function(error) {
				console.log(error);
			}
		});
	});

	
	/*==목표 섭취 그래프==*/
	function tarKcalCircle(obj){
		console.log(obj);
		if(obj>100){ //실패 시 
			$('.circle1').circleProgress({ //들어갈 div class명을 넣어주세요
				value : obj*0.01, //진행된 수를 넣어주세요. 1이 100기준입니다.
				size : 230, //도넛의 크기를 결정해줍니다.
				startAngle : 1.5 * 3.14,
				fill : {
					gradient : [ "#ff4b1f", "#ff9068" ]
				//도넛의 색을 결정해줍니다.
				}
			}).on('circle-animation-progress', function(event, progress) { //라벨을 넣어줍니다.
				$(this).find('strong').html(obj + '%' + '<br/>실패');
			});
		}else{//성공 시
			$('.circle1').circleProgress({ //들어갈 div class명을 넣어주세요
				value : obj*0.01,  //진행된 수를 넣어주세요. 1이 100기준입니다.
				size : 230, //도넛의 크기를 결정해줍니다.
				startAngle : 1.5 * 3.14,
				fill : {
					gradient : [ "#0275d8", "#5bc0de" ]
				//도넛의 색을 결정해줍니다.
				}
			}).on('circle-animation-progress', function(event, progress) {
				$(this).find('strong').html(obj + '%' + '<br/>성공');
			});
		}
	}

	
	/*==목표 운동 그래프==*/
	function tarExeCircle(obj){
		console.log(obj);
		if(obj>100){ //성공 시
			$('.circle2').circleProgress({ //들어갈 div class명을 넣어주세요
				value : obj*0.01,  //진행된 수를 넣어주세요. 1이 100기준입니다.
				size : 230, //도넛의 크기를 결정해줍니다.
				startAngle : 1.5 * 3.14,
				fill : {
					gradient : [ "#0275d8", "#5bc0de" ]
				//도넛의 색을 결정해줍니다.
				}
			}).on('circle-animation-progress', function(event, progress) {
				$(this).find('strong').html(obj + '%' + '<br/>성공');
			});
		}else{  //실패 시
			$('.circle2').circleProgress({ //들어갈 div class명을 넣어주세요
				value : obj*0.01, //진행된 수를 넣어주세요. 1이 100기준입니다.
				size : 230, //도넛의 크기를 결정해줍니다.
				startAngle : 1.5 * 3.14,
				fill : {
					gradient : [ "#ff4b1f", "#ff9068" ]
				//도넛의 색을 결정해줍니다.
				}
			}).on('circle-animation-progress', function(event, progress) { //라벨을 넣어줍니다.
				$(this).find('strong').html(obj + '%' + '<br/>실패');
			});
		}
	}

	/*==탄단지 그래프==*/
	function progressBarAnimate(){
		$("#carboPercent").animate({
			width : carboPercent+"%"
		}, 1000);
		
		$("#proteinPercent").animate({
			width : proteinPercent+"%"
		}, 1000);
		
		$("#fatPercent").animate({
			width : fatPercent+"%"
		}, 1000);
	}


	/*클릭한 날짜 뿌려주기*/
	document.getElementById("date").innerHTML = getType;

	
	/*버튼 클릭시 일기 추가 팝업*/
	$("#submitListBtn").click(function(){
		console.log("일기 추가 팝업 요청");
		window.open("diaryInsert?d_no="+d_no+"&u_weight="+u_weight,"일기 항목 추가하기","width=580, height=380, left=700,top=400, resizable=no, scrollbars=no");
		
	})
	
	
	/* ---------- 사진 관련 ---------- */
	var diaryDate = "${param.Date}"; //현재 일기의 날짜 2021-09-01
	console.log("현재 일기의 날짜 : ",diaryDate);
	var loginId = "${sessionScope.loginId}"; //로그인한 사람의 Id
	console.log("로그인한 사람의 Id : ",loginId);
	var diaryD_no; //일기 고유번호
	
	//id와 날짜를 가지고 d_no를 가져오는 함수
	$.ajax({
			url : 'selectDiaryD_no',
			type : 'get',
			dataType : 'json',
			data : {
				'diaryDate' : diaryDate,
				'loginId' : loginId
			},
			success : function(data) {
				console.log("diaryD_no : ",data.diaryD_no);
				diaryD_no = data.diaryD_no; //d_no 저장
				$("#d_no").val(diaryD_no); //input hidden에 저장 (업로드 때 사용)
				console.log($("#d_no").val());
			},
			error : function(error) {
				console.log(error);
			}
		});
	
	//사진명을 DB에서 가져오는 Ajax (먼저 날짜와 id로 d_no를 알아온 후 d_no와 일치하는 사진이름을 가져온다)
	$.ajax({
			url : 'diaryPhotoList',
			type : 'get',
			dataType : 'json',
			data : {
				'diaryDate' : diaryDate,
				'loginId' : loginId
			},
			success : function(data) {
				console.log("diaryPhotoList",data);
				drawDiaryPhotoList(data.diaryPhotoList); //사진 뿌려주기
			},
			error : function(error) {
				console.log(error);
			}
		});
	
	//Ajax에서 불러온 사진을 #imageWrap에 뿌려주기
	function drawDiaryPhotoList(list){
		var content = "";
		console.log("list.length",list.length);
		list.forEach(function(item,index){
			content += '<div class="imgWrap" style="display:inline; margin-right:50px;">';
			content += '<img src="/photo/'+item+'" width="220px" height:"220px">';
			content += '<img src="resources/img/close.png" class="closeImgWrap" width="20px" height="20px">';
			content += '</div>';
		});
		$("#imageWrap").append(content);
	}

	//파일 등록시 이벤트 (최대 4장)
	$("input[name='photo']").on("change",function(e) {
		console.log('썸네일 등록');
		//imageWrap에 자식요소가 4개 이상 있을 경우 업로드 막기
		if ($("#imageWrap").children().length >= 4) {
			alert("최대 4장까지만 업로드 가능합니다.");
			$("#photo").val("");
		} else {
			/*var reader = new FileReader();
			reader.onload = function(e) {
				var content = '';
				content += '<div class="imgWrap" style="display:inline; margin-right:10px;">';
				content += '<img src="'+e.target.result+'" width="220px" ">';
				content += '<a href="#" class="closeImgWrap"><img src="resources/img/close.png" width="20px" height="20px"></a>';
				content += '</div>';
				$("#imageWrap").append(content);
			};
			reader.readAsDataURL(e.target.files[0]);
			
			console.log(e.target.files[0].name);*/ //등록된 이미지 파일명
			diaryPhotoUpload(); //이미지 파일 업로드 함수
		}//end else
	});

	//이미지 파일 업로드 함수
	function diaryPhotoUpload(){
		var form = $("#photoForm")[0];
		console.log("$('#photoForm')[0]",$("#photoForm")[0]);
		var formData = new FormData(form);
		console.log("formData : ",formData);
		
		$.ajax({
			url : 'diaryPhotoUpload',
			type : 'post',
			processData : false,
			contentType : false,
			data : formData,
			success : function(data) {
				console.log("diaryPhotoUpload data : ",data);
				console.log("사진 업로드 성공 여부 : ",data.success);
				drawDiaryPhotoList(data.diaryPhotoList);
				$("#photo").val(""); //input file 비우기
			},
			error : function(error) {
				console.log(error);
			}
		});
	}
	
	//x를 클릭 했을 때 이미지 삭제하기
	$(document).on("click", ".closeImgWrap", function() {
		diaryPhotoDelete(this); //클릭한 사진을 삭제
	});
	
	//x클릭한 사진을 삭제하는 함수
	function diaryPhotoDelete(obj){
		var src = $(obj).parent().children("img").attr("src");
		var substrsrc = src.substring(7,src.length);
		console.log("substrsrc : ",substrsrc);
		
		$.ajax({
			url : 'diaryPhotoDelete',
			type : 'get',
			dataType : 'json',
			data : {
				'diaryD_no' : diaryD_no,
				'newFileName' : substrsrc
			},
			success : function(data) {
				console.log("diaryPhotoDelete",data.success);
				$(obj).parent().remove(); //이미지 div를 삭제
			},
			error : function(error) {
				console.log(error);
			}
		});
	}
	
</script>

</html>