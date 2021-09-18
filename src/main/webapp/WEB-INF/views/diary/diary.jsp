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
.circle_strong{
	position: absolute;
	top:110px;
	left: 103px;
	text-align: center;
	line-height: 40px;
	font-size: 24px;
}

.circle1, .circle2{

}

</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="container mt-5">
	<!-- 날짜 나타남 -->
	<div class="col-md-3" style="float: none; margin:0 auto;">
		<button type="button" class="btn btn-light rounded-circle mr-3" onclick="preMonth()"><i class="fas fa-chevron-left "></i></button>
			<span id="date" style="font-size:20px;"></span>
		<button type="button" class="btn btn-light rounded-circle ml-3" onclick="nextMonth()"><i class="fas fa-chevron-right"></i></button>
	</div>
	
		<!-- 몸무게 입력 -->
		<form class="form-inline mt-5" action="#">
			<label for="weight">몸무게:</label> <input type="text"
				class="form-control ml-3" id="weight" placeholder="몸무게 입력"
				name="weight" style="width:80px;"> <label class="ml-1">Kg</label>
		</form>


		<div class="row">
			<!-- 섭취 그래프 -->
			<div class="col mt-4 col-sm-3.5">
				<p>섭취 그래프</p>
				<div class="circle1">
					<strong class="circle_strong"></strong>
				</div>
				
				<form class="form-inline" action="#" class="circle_strong form-inline">
							<label for="weight">목표 섭취 칼로리:</label> <input type="text"
								class="form-control ml-3" id="weight" placeholder=""
								name="weight" style="width:110px;"><label class="ml-1">Kcal</label>
						</form>
			</div>

			<!-- 운동 그래프 -->
			<div class="col mt-4 col-sm-3.5">
				<p>운동 그래프</p>
				<div class="circle2" >
				<strong class="circle_strong">
						</strong>
				</div>
				<form class="form-inline" action="#" class="circle_strong form-inline">
							<label for="weight">목표 섭취 칼로리 :</label> <input type="text"
								class="form-control ml-3" id="weight" placeholder=""
								name="weight" style="width:110px;"> <label class="ml-1">Kcal</label>
						</form>
			</div>

			<!-- 탄단지 -->
			<div class="col col-sm-5 mt-4">
				<!-- 저탄고지, 밸런스 셀렉트 -->
				<label for="weight">탄단지 그래프</label>
				<select class="form-control form-control-sm float-right" style="width:100px;">
					<option>밸런스</option>
					<option>저탄고지</option>
				</select>
				<div style="width:100%;">
<canvas id="myChart" height="180" style="margin-top:25px;"></canvas>
</div>
</div>
		</div>

	</div>
	<!-- --container end-- -->
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js" integrity="sha512-Wt1bJGtlnMtGP0dqNFH1xlkLBNpEodaiQ8ZN5JLA5wpc1sUlk/O5uuOMNgvzddzkpvZ9GLyYNa8w2s7rqiTk5Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="chartjs-plugin-doughnutlabel.js"></script>
<script src="chartjs-plugin-doughnutlabel.min.js"></script>
<script>
var search = location.search    
var params = new URLSearchParams(search); 
var getType= params.get('Date');    
console.log(getType);


/*처음 디폴트 값 뿌려주고 DB에 저장*/
$.ajax({
				type : 'get',
				url : 'diaryDetail',
				data : {
					'date' : getType,
				},
				dataType : 'JSON',
				success : function(data) {
					console.log(data);
				},
				error : function(e) {
					console.log(e);
				}

			});


/*섭취 칼로리 그래프*/
	$('.circle1').circleProgress({ //들어갈 div class명을 넣어주세요
		value : 0.8, //진행된 수를 넣어주세요. 1이 100기준입니다.
		size : 230, //도넛의 크기를 결정해줍니다.
		startAngle : 1.5 * 3.14,
		fill : {
			gradient : [ "#0275d8", "#5bc0de" ]
		//도넛의 색을 결정해줍니다.
		}
	}).on('circle-animation-progress', function(event, progress) { //라벨을 넣어줍니다.
		$(this).find('strong').html(parseInt(100 * 0.8) + '%'+'<br/>성공');
	});
	
	
	/*운동 칼로리 그래프*/
	$('.circle2').circleProgress({ //들어갈 div class명을 넣어주세요
		value : 0.8, //진행된 수를 넣어주세요. 1이 100기준입니다.
		size : 230, //도넛의 크기를 결정해줍니다.
		startAngle : 1.5 * 3.14,
		fill : {
			gradient : [ "#ff4b1f", "#ff9068" ]
		//도넛의 색을 결정해줍니다.
		}
	}).on('circle-animation-progress', function(event, progress) { //라벨을 넣어줍니다.
		$(this).find('strong').html(parseInt(100 * 0.8) + '%'+'<br/>실패');
	});

	
	
	/*탄단지 그래프*/
	  var ctx = document.getElementById('myChart').getContext('2d');
      var chart = new Chart(ctx, {
          // type : 'bar' = 막대차트를 의미합니다.
          type: 'bar', // 
          data: {
              labels: ['탄수화물량(g)','단백질량(g)','지방량(g)'],
              datasets: [{
                  axis: 'y', // 가료형 막대로 바꾸는 옵션
                  label: '색상',
                  backgroundColor: [
                	  'rgba(255, 99, 132, 0.2)',
                      'rgba(255, 159, 64, 0.2)',
                      'rgba(255, 205, 86, 0.2)',
                      'rgba(75, 192, 192, 0.2)',
                  ],
                  borderColor: [
                      'rgb(255, 99, 132)',
                      'rgb(255, 159, 64)',
                      'rgb(255, 205, 86)',
                      'rgb(75, 192, 192)',
                      'rgb(54, 162, 235)',
                      'rgb(153, 102, 255)',
                      'rgb(201, 203, 207)'
                    ],
                    borderWidth: 1,
                  data: [2 ,10, 5,]
              }]
          },
        options: {
         indexAxis: 'y', //가로형 막대로 바꾸는 옵션
         plugins: {
		      legend: {
		        display:false,
		        position: 'top',
		      }
		    }
         }
      });

      
      /*클릭한 날짜 뿌려주기*/
      document.getElementById("date").innerHTML=getType;
      
      var dt = new Date(document.getElementById("date").innerText);
     /*  var arrDayStr = ['일','월','화','수','목','금','토']; */
       
      /*전 날로 이동*/
      function preMonth(){
    	  console.log(dt);
    	  /* var preDt = dt.getFullYear()+'-'+dt.getMonth()+'-'+(dt.getDate()-1)+'('+arrDayStr[dt.getDay()-1]+')'; */
    	  //var preDt = dt.getFullYear()+'-'+dt.getMonth()+'-'+(dt.getDate()-1);
    	  preDt=dt.setDate(dt.getDate()-30);
    	  
    	  
    	 console.log(preDt);
      }
     
      threeDaysAgo.setDate(threeDaysAgo.getDate() - 3); // 2014-02-26 => 3일전으로~
      
      /*다음날로 이동*/
      function nextMonth(){
    	  console.log(dt);
    	  /* var nextDt = dt.getFullYear()+'-'+dt.getMonth()+'-'+(dt.getDate()+1)+'('+arrDayStr[dt.getDay()+1]+')'; */
    	  var nextDt = dt.getFullYear()+'-'+dt.getMonth()+'-'+(dt.getDate()+30);
    	 console.log(nextDt);
      }
</script>

</html>