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
	top: 20px;
	left: 50px;
	text-align: center;
	line-height: 40px;
	font-size: 24px;
}


</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="container mt-5">
		<!-- 몸무게 입력 -->
		<form class="form-inline" action="#">
			<label for="weight">몸무게:</label> <input type="text"
				class="form-control ml-3" id="weight" placeholder="몸무게 입력"
				name="weight" style="width:80px;"> <label class="ml-1">Kg</label>
		</form>


		<div class="row">
			<!-- 섭취 그래프 -->
			<div class="col mt-4 ">
				<p>섭취 그래프</p>
				<div class="circle1 m-auto" >
					<strong class="circle_strong">성공</strong>
				</div>
				<form class="form-inline" action="#" class="circle_strong form-inline">
							<label for="weight">목표 섭취 칼로리:</label> <input type="text"
								class="form-control ml-3" id="weight" placeholder=""
								name="weight" style="width:110px;"><label class="ml-1">Kcal</label>
						</form>
			</div>

			<!-- 운동 그래프 -->
			<div class="col mt-4">
				<p>운동 그래프</p>
				<div class="circle2">
				<strong class="circle_strong">
						실패
						</strong>
				</div>
				<form class="form-inline" action="#" class="circle_strong form-inline">
							<label for="weight">목표 섭취 칼로리 :</label> <input type="text"
								class="form-control ml-3" id="weight" placeholder=""
								name="weight" style="width:110px;"> <label class="ml-1">Kcal</label>
						</form>
			</div>

			<!-- 탄단지 -->
			<div class="col">
				<!-- 저탄고지, 밸런스 셀렉트 -->
				<select class="form-control form-control-sm mt-4"
					style="width: 150px;">
					<option>밸런스</option>
					<option>저탄고지</option>
				</select>
			<canvas id="myChart" width="300" height="300"></canvas>

</div>
		</div>

	</div>
	<!-- --container end-- -->
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js" integrity="sha512-Wt1bJGtlnMtGP0dqNFH1xlkLBNpEodaiQ8ZN5JLA5wpc1sUlk/O5uuOMNgvzddzkpvZ9GLyYNa8w2s7rqiTk5Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
/*섭취 칼로리 그래프*/
	$('.circle1').circleProgress({ //들어갈 div class명을 넣어주세요
		value : 0.8, //진행된 수를 넣어주세요. 1이 100기준입니다.
		size : 200, //도넛의 크기를 결정해줍니다.
		startAngle : 1.5 * 3.14,
		fill : {
			gradient : [ "#0275d8", "#5bc0de" ]
		//도넛의 색을 결정해줍니다.
		}
	}).on('circle-animation-progress', function(event, progress) { //라벨을 넣어줍니다.
		$(this).find('strong').html(parseInt(100 * 0.8) + '<i>%</i>');
	});
	
	/*운동 칼로리 그래프*/
	$('.circle2').circleProgress({ //들어갈 div class명을 넣어주세요
		value : 0.8, //진행된 수를 넣어주세요. 1이 100기준입니다.
		size : 200, //도넛의 크기를 결정해줍니다.
		startAngle : 1.5 * 3.14,
		fill : {
			gradient : [ "#ff4b1f", "#ff9068" ]
		//도넛의 색을 결정해줍니다.
		}
	}).on('circle-animation-progress', function(event, progress) { //라벨을 넣어줍니다.
		$(this).find('strong').html(parseInt(100 * 0.8) + '<i>%</i>');
	});

	
	var ctx = document.getElementById('myChart');
	var ctx = document.getElementById('myChart').getContext('2d');
	var ctx = $('#myChart');
	var ctx = 'myChart';
	
	var ctx = document.getElementById('myChart');
	var myChart = new Chart(ctx, {
	    type: 'bar',
	    data: {
	        labels: ['Red', 'Blue', 'Yellow'],
	        datasets: [{
	            label: '# of Votes',
	            data: [12, 19, 3],
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)',
	                'rgba(255, 159, 64, 0.2)'
	            ],
	            borderColor: [
	                'rgba(255, 99, 132, 1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ],
	            borderWidth: 1
	        }]
	    },
	    options: {
	        scales: {
	            y: {
	                beginAtZero: true
	            }
	        }
	    }
	});
	
</script>

</html>