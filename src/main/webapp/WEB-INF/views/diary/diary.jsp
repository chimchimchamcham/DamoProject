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

.CheckDelBtn:hover{
	opacity: 0.5;
	cursor: pointer;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="container mt-5">

		<!-- 날짜 나타남 -->
		<div class="col-md-3" style="float: none; margin: 0 auto;">
			<button type="button" class="btn btn-light rounded-circle mr-3"
				onclick="preMonth()">
				<i class="fas fa-chevron-left "></i>
			</button>
			<span id="date" style="font-size: 20px;"></span>
			<button type="button" class="btn btn-light rounded-circle ml-3"
				onclick="nextMonth()">
				<i class="fas fa-chevron-right"></i>
			</button>
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
				<p>섭취 그래프</p>
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
				<p>운동 그래프</p>
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
					<span>탄단지 섭취 그래프</span>
					<select class="form-control form-control-sm"
						style="width: 90px; margin-left:120px;">
						<option>밸런스</option>
						<option>저탄고지</option>
					</select>
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
						style="width: 33px; height: 33px;" id="addDiaryList">
						<i class="fas fa-plus"></i>
					</button> <span style="font-size: 18px; font-weight: bold" class="pl-1">
						추가하기</span>
			</div>

			<h3>섭취</h3>
			<div id="accordion" class="my-3">
				<div class="card">
					<div class="card-header">
						<a class="card-link" data-toggle="collapse" href="#collapseOne">
							<b>아침 - </b> <span>바나나</span> <span>사과</span> <span>계란</span> <span>우유</span>
							<b class="float-right">1000kcal</b>
						</a>
					</div>
					<div id="collapseOne" class="collapse hide"
						data-parent="#accordion">
						<div class="card-body">

							<table class="table">
								<thead>
									<tr>
										<th>음식명</th>
										<th>섭취량(g)</th>
										<th>탄수화물 (g)</th>
										<th>단백질 (g)</th>
										<th>지방(g)</th>
										<th>칼로리(kcal)</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>John</td>
										<td>Doe</td>
										<td>john@example.com</td>
										<td>John</td>
										<td>Doe</td>
										<td>john@example.com</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<hr />


			<h3>운동</h3>
			<div id="accordion" class="my-3">
				<div class="card">
					<div class="card-header">
						<a class="card-link" data-toggle="collapse" href="#collapseOne">
							<b>아침 - </b> <span>바나나</span> <span>사과</span> <span>계란</span> <span>우유</span>
							<b class="float-right">1000kcal</b>
						</a>
					</div>
					<div id="collapseOne" class="collapse hide"
						data-parent="#accordion">
						<div class="card-body">

							<table class="table">
								<thead>
									<tr>
										<th>음식명</th>
										<th>섭취량(g)</th>
										<th>탄수화물 (g)</th>
										<th>단백질 (g)</th>
										<th>지방(g)</th>
										<th>칼로리(kcal)</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>John</td>
										<td>Doe</td>
										<td>john@example.com</td>
										<td>John</td>
										<td>Doe</td>
										<td>john@example.com</td>
									</tr>
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
				<button type="button" class="btn btn-primary btn-sm "
					style="width: 33px; height: 33px;" id="fileBtn">
					<i class="fas fa-plus"></i>
				</button>

				<label for="photo"><span
					style="font-size: 18px; font-weight: bold; cursor: pointer;"
					class="ml-1 text-primary"> 사진추가</span></label> <input type="file"
					name="photo" id="photo"
					accept="image/gif,image/jpeg,image/png,image/jpg">
				<!-- 사진 -->
			</div>

			<!-- 이미지가 들어간다 -->
			<div id="imageWrap"></div>
		</div>

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
		 		alert("체크리스트 추가");
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
						ch_no = data.dto.ch_no;
						$("#checkListBox").innerHtml(
								"<div class='checkbox pl-5 pt-4 pr-5'><label style='font-size: 18px;'><input type='checkbox' value='"+dto.ch_no+"' style='transform: scale(1.3);' name='checkbox'>"
								+data.dto.cd_content+
								"</label><a href='checkDel?ch_no="+dto.ch_no+"' class='CheckDelBtn'><i class='fas fa-trash-alt float-right' ></i></a></div>"
							)
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
			/* $.ajax({
				url : url,
				type : 'get',
				dataType : 'json',
				data : {
					'ch_no' : $(this).prev().children().first().val()
				},
				success : function(data) {
					console.log("업데이트 성공 여부 : " + data);
				},
				error : function(error) {
					console.log(error);
				}
			}); */
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
			},
			error : function(error) {
				console.log(error);
			}
		});
	}

	var uploadNo = 1;
	//파일 등록시 이벤트 (최대 4장)
	$("input[name='photo']")
			.on(
					"change",
					function(e) {
						console.log('썸네일 등록');

						//imageWrap에 자식요소가 4개 이상 있을 경우 업로드 막기
						if ($("#imageWrap").children().length >= 4) {
							alert("최대 4장까지만 업로드 가능합니다.");
							$("#photo").val("");
						} else {
							var reader = new FileReader();

							reader.onload = function(e) {

								var content = '';
								content += '<div class="imgWrap" style="display:inline; margin-right:10px;">';
								content += '<img src="'+e.target.result+'" width="220px" ">';
								content += '<a href="#" class="closeImgWrap"><img src="resources/img/close.png" width="20px" height="20px"></a>';
								content += '<input type="hidden" name="imgNo" value="'+uploadNo+'">';
								content += '</div>';

								$("#imageWrap").append(content);

								//file 객체 복사 함수
								copyInputTypeFile(uploadNo);

							};

							reader.readAsDataURL(e.target.files[0]);

						}//end else

					});

	//x를 클릭 했을 때 이미지 삭제하기
	$(document).on("click", ".closeImgWrap", function() {
		$(this).parent().remove();
		changeImgIcon();

		var imgNo = $(this).parent().find("input[type='hidden']").val();
		deleteInputTyleFile(imgNo);
	});

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
	
	/* 일기 목록 추가시 필요한 데이터 : 몸무게*/
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
			console.log(data.ch_noList[1].ch_no);
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
			
			u_weight = data.dto.d_weight;
			
			//목표 섭취,운동 달성률 계산
			d_tarKcalPercent = Math.floor((data.dto.d_resultEat/data.dto.d_tarKcal)*100);
			d_tarExePercent = Math.floor((data.dto.d_resultExe/data.dto.d_tarExe)*100);
			console.log("섭취 칼로리 달성률: ",d_tarKcalPercent,"운동 칼로리 달성률 : ",d_tarExePercent);
			
			tarKcalPercent = (data.dto.d_resultEat/data.dto.d_tarKcal);
			tarExePercent = (data.dto.d_resultExe/data.dto.d_tarExe);
			console.log("섭취 칼로리 달성률: ",tarKcalPercent,"률 : ",tarExePercent);
			
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
			carboPercent = JSON.parse(Math.floor((data.dto.d_resultCarbo/data.dto.d_carbo)*100));
			document.getElementById("carboPercent").innerText = carboPercent+'%';
			document.getElementById("carboPercent").style.width = carboPercent+'%';
			//단백질
			proteinPercent = JSON.parse(Math.floor((data.dto.d_resultProtein/data.dto.d_protein)*100));
			document.getElementById("proteinPercent").innerText = proteinPercent+'%';
			document.getElementById("proteinPercent").style.width = proteinPercent+'%';
			//지방
			fatPercent = JSON.parse(Math.floor((data.dto.d_resultFat/data.dto.d_fat)*100));
			document.getElementById("fatPercent").innerText = fatPercent+'%';
			document.getElementById("fatPercent").style.width = fatPercent+'%';

			d_no = data.dto.d_no;
			
<<<<<<< HEAD
			//체크리스트 뿌리기
			var ch_noList = data.ch_noList;
			var checkContent = '';
			ch_noList.forEach(function(element){
				console.log(element);
				checkContent += "<div class='checkbox pl-5 pt-4 pr-5'><label style='font-size: 18px;'>";
				checkContent += "<input type='checkbox' value='"+element.ch_no+"' style='transform: scale(1.3); margin-right:5px' name='checkbox'>"+element.cd_content+"</label>";
				checkContent += "<button type='button' class='CheckDelBtn'><i class='fas fa-trash-alt float-right' ></i></button></div>";
			});
			$("#checkListBox").html(checkContent);
			
			
=======
>>>>>>> abccce1b552c9de0df42ca3face3daebb0b2400f
		},
		error : function(e) {
			console.log(e);
		}
	});

	
	/*==목표 섭취 그래프==*/
	//초기 값(성공)
	$('.circle1').circleProgress({ //들어갈 div class명을 넣어주세요
		value : tarKcalPercent,  //진행된 수를 넣어주세요. 1이 100기준입니다.
		size : 230, //도넛의 크기를 결정해줍니다.
		startAngle : 1.5 * 3.14,
		fill : {
			gradient : [ "#0275d8", "#5bc0de" ]
		//도넛의 색을 결정해줍니다.
		}
	}).on('circle-animation-progress', function(event, progress) {
		$(this).find('strong').html(d_tarKcalPercent + '%' + '<br/>성공');
	});
	
	//목표 섭취 달성 실패
	$('.circle1_2').circleProgress({ //들어갈 div class명을 넣어주세요
		value : tarKcalPercent, //진행된 수를 넣어주세요. 1이 100기준입니다.
		size : 230, //도넛의 크기를 결정해줍니다.
		startAngle : 1.5 * 3.14,
		fill : {
			gradient : [ "#ff4b1f", "#ff9068" ]
		//도넛의 색을 결정해줍니다.
		}
	}).on('circle-animation-progress', function(event, progress) { //라벨을 넣어줍니다.
		$(this).find('strong').html(d_tarKcalPercent + '%' + '<br/>실패');
	});
		
	//섭취 목표 실패 시
	if(d_tarKcalPercent>100){
		document.getElementById('KcalCircle').className = 'circle1_2';
	}else{//섭취 목표 성공 시
		document.getElementById('KcalCircle').className = 'circle1';
	}

	
	/*==목표 운동 그래프==*/
	//초기 값(실패)
	$('.circle2').circleProgress({ //들어갈 div class명을 넣어주세요
		value : tarExePercent, //진행된 수를 넣어주세요. 1이 100기준입니다.
		size : 230, //도넛의 크기를 결정해줍니다.
		startAngle : 1.5 * 3.14,
		fill : {
			gradient : [ "#ff4b1f", "#ff9068" ]
		//도넛의 색을 결정해줍니다.
		}
	}).on('circle-animation-progress', function(event, progress) { //라벨을 넣어줍니다.
		$(this).find('strong').html(d_tarExePercent + '%' + '<br/>실패');
	});
	
	//초기 값(성공)
	$('.circle2_2').circleProgress({ //들어갈 div class명을 넣어주세요
		value : tarExePercent,  //진행된 수를 넣어주세요. 1이 100기준입니다.
		size : 230, //도넛의 크기를 결정해줍니다.
		startAngle : 1.5 * 3.14,
		fill : {
			gradient : [ "#0275d8", "#5bc0de" ]
		//도넛의 색을 결정해줍니다.
		}
	}).on('circle-animation-progress', function(event, progress) {
		$(this).find('strong').html(d_tarExePercent + '%' + '<br/>성공');
	});

	//운동 목표 실패 시
	if(d_tarExePercent<100){
		document.getElementById('ExeCircle').className = 'circle2';
	}else{//운동 목표 성공 시
		document.getElementById('ExeCircle').className = 'circle2_2';
	}
	
	
	/*==탄단지 그래프==*/
	$("#carboPercent").animate({
		width : carboPercent
	}, 1000);
	
	$("#proteinPercent").animate({
		width : proteinPercent
	}, 1000);
	
	$("#fatPercent").animate({
		width : fatPercent
	}, 1000);
	

	/*클릭한 날짜 뿌려주기*/
	document.getElementById("date").innerHTML = getType;

	var dt = new Date(document.getElementById("date").innerText);
	/*  var arrDayStr = ['일','월','화','수','목','금','토']; */

	/*전 날로 이동*/
	function preMonth() {
		console.log(dt);
		/* var preDt = dt.getFullYear()+'-'+dt.getMonth()+'-'+(dt.getDate()-1)+'('+arrDayStr[dt.getDay()-1]+')'; */
		//var preDt = dt.getFullYear()+'-'+dt.getMonth()+'-'+(dt.getDate()-1);
		preDt = dt.setDate(dt.getDate() - 30);

		console.log(preDt);
	}

<<<<<<< HEAD
	/* threeDaysAgo.setDate(threeDaysAgo.getDate() - 3); */ // 2014-02-26 => 3일전으로~
=======

>>>>>>> abccce1b552c9de0df42ca3face3daebb0b2400f

	/*다음날로 이동*/
	function nextMonth() {
		console.log(dt);
		/* var nextDt = dt.getFullYear()+'-'+dt.getMonth()+'-'+(dt.getDate()+1)+'('+arrDayStr[dt.getDay()+1]+')'; */
		var nextDt = dt.getFullYear() + '-' + dt.getMonth() + '-'
				+ (dt.getDate() + 30);
		console.log(nextDt);
	}

	/*체크박스 추가 시*/

	/*체크박스 체크 시*/
	/*  $('input:checkbox[name="checkbox"]').is(":checked") ==  true{
	 	type : 'get',
		url : 'checkListUpdate',
		data : {
			'checkContent' : getType,

		},
		dataType : 'JSON',
		success : function(data) {
			console.log("체크여부 업데이트 성공");
		},
		error : function(e) {
			console.log(e);
		}
	 } */
	 
	 /* 일기 추가 시 */
	 $("#addDiaryList").click(function(){
		 console.log("일기 항목 추가 팝업 열림");
		 console.log("전달할 일기 번호 : ",d_no);
		 console.log("전달할 내 몸무게 : ",u_weight);
		 window.open("diaryInsert?d_no="+d_no+"&u_weight="+u_weight, "일기 항목 추가하기", "width=570, height=380, left=700, top=400, resizable=no, scrollbars=no");  
	 });
	 
	 
	 
</script>

</html>