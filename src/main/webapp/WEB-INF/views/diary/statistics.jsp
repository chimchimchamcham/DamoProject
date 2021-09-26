<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap 4 Website Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <!-- chart.js cdn -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
    <div id="dateWrap" class="container mt-4">
      <a href="#"><img id="prev" src="resources/img/prev.png" class="mb-2"></a>
      <span id="year"></span><span id="yearstr">년</span> <span id="month"></span><span id="monthstr">월</span>
      <a href="#"><img id="next" src="resources/img/next.png" class="mb-2"></a>
    </div>
    <div id="btnWrap" class="container mt-5 mb-5 pt-2">
      <button id="weight" class="btn btn-primary rounded-pill ml-3 mr-3">몸무게</button>
      <button id="eat" class="btn btn-outline-primary rounded-pill ml-3 mr-3">섭취</button>
      <button id="exe" class="btn btn-outline-primary rounded-pill ml-3 mr-3">운동</button>  
    </div>
    <div id="chartWrap" class="container">
        <canvas id="myChart"></canvas>
    </div>
</body>
<style>
  #dateWrap{
    text-align:center;
  }
  #dateWrap span{
    font-size:1.7rem;
    font-weight:600;
  }
  #prev{
    width:30px;
    height:30px;
    margin-right:60px;
  }
  #next{
    width:30px;
    height:30px;
    margin-left:60px;
  }
  #btnWrap{
    text-align:center;
  }
  #weight{
    width:100px;
  }
  #eat{
    width:100px;
  }
  #exe{
    width:100px;
  }
  #myChart{
    width:100%;
  }

</style>
<script>
//chart를 담을 변수
var myChart;

//클릭한 버튼의 id를 저장
var btnId = "weight";

//chart에 넣을 ArrayList 배열
var label1 = "측정 몸무게";
var label2 = "목표 몸무게";
var weight = []; //측정체중
var tarWeight = []; //목표체중
var resultEat = []; //섭취칼로리합계
var tarKcal = []; //목표섭취칼로리
var resultExe = []; //운동칼로리합계
var tarExe = []; //목표운동칼로리

//현재시간  
var date = new Date();
console.log(date);

var year = date.getFullYear();
var month = 1+date.getMonth();
console.log(year+" "+month);

//처음 페이지 접근시 현재 날짜를 표시한다.
showCalendar("now");

//DB에서 해당 월에 해당하는 데이터를 가져온다.
dataCall(year,month);

//처음 차트를 표시한다.
drawChart(label1,label2,weight,tarWeight);


//버튼을 클릭하면 색을 변경하고 label1, label2의 문자열을 변경하고 drawChart 실행
$("#btnWrap .btn").on("click",function(){
  //클릭한 버튼의 색을 파란색으로 채우기
  $("#btnWrap .btn").removeClass("btn-primary").addClass("btn-outline-primary");
  $(this).removeClass("btn-outline-primary").addClass("btn-primary");

  //클릭한 버튼의 id값 가져오기
  btnId = $(this).attr("id");
  console.log("btnId : ",btnId);

  //클릭한 버튼에 따라 label1, label2에 문자열 변경
  if(btnId == "weight"){
    label1 = "측정 몸무게";
    label2 = "목표 몸무게";
    myChart.destroy();
    drawChart(label1,label2,weight,tarWeight);
  }else if(btnId == "eat"){
    label1 = "섭취칼로리합계";
    label2 = "목표섭취칼로리";
    myChart.destroy();
    drawChart(label1,label2,resultEat,tarKcal);
  }else if(btnId == "exe"){
    label1 = "운동칼로리합계";
    label2 = "목표운동칼로리";
    myChart.destroy();
    drawChart(label1,label2,resultExe,tarExe);
  }

  console.log("label1 label2",label1,label2);
});

//prev 클릭시 다음달로 넘기는 기능
$("#prev").on("click",function(){
  console.log("prev 클릭");
  showCalendar("prev");
});

//next 클릭시 다음달로 넘기는 기능
$("#next").on("click",function(){
  console.log("next 클릭");
  showCalendar("next");
});

//달력을 넘기는 함수
function showCalendar(param){
  if(param == "prev"){
    if(--month==0){
      month = 12;
      --year;
    }    
  }else if(param == "next"){
    if(++month==13){
      month = 1;
      ++year;
    }
  }else if(param == "now"){
    console.log("현재날짜표시");
  }

  console.log("showCalendar year month : ", year+" "+month);
  $("#year").html(year);
  $("#month").html(month>=10?month:"0"+month);
  
  //월이 변경되었을 때 chart 그리기 실행
  if(param != "now"){
    dataCall(year,month);
    myChart.destroy();
    
    //btnId에 따라 chart에 넣는 데이터를 변경해줌
    /*if(btnId == "weight"){
      drawChart(label1,label2,weight,tarWeight);
    }else if(btnId == "eat"){
      drawChart(label1,label2,resultEat,tarKcal);
    }else if(btnId == "exe"){
      drawChart(label1,label2,resultExe,tarExe);
    }*/
  }
}

//해당 월에 해당하는 데이터를 ajax로 가져오는 함수
function dataCall(year,month){
  console.log("dateCall 실행");
  
  var dateData = year + '' + (month<10?('0'+month):month);
  console.log("dateData : ",dateData);
  
  var reqUrl = 'myChart/'+dateData;
  $.ajax({
		url:reqUrl,
	    type:'GET',
	    data:{},
	    dataType:'json',
	    success:function(data){
	    	console.log(data);
	        saveData(data.list);
	        
	    },
	    error:function(e){
			console.log(e);
		}
	});
}

// Ajax를 통해 가져온 chart에 사용할 ArrayList에 값을 넣어주는 함수
function saveData(list){
  //배열을 모두 비우기
  weight = []; //측정체중
  tarWeight = []; //목표체중
  resultEat = []; //섭취칼로리합계
  tarKcal = []; //목표섭취칼로리
  resultExe = []; //운동칼로리합계
  tarExe = []; //목표운동칼로리

  list.forEach(function(item,index){
 
    //배열 채우기
    weight.push({x:item.d_dateDay,y:item.d_weight});
    tarWeight.push({x:item.d_dateDay,y:item.u_tarWeight});
    resultEat.push({x:item.d_dateDay,y:item.d_resultEat});
    tarKcal.push({x:item.d_dateDay,y:item.d_tarKcal});
    resultExe.push({x:item.d_dateDay,y:item.d_resultExe});
    tarExe.push({x:item.d_dateDay,y:item.d_tarExe});
    
  });
  
  myChart.destroy();
  
  //btnId에 따라 chart에 넣는 데이터를 변경해줌
  if(btnId == "weight"){
    drawChart(label1,label2,weight,tarWeight);
  }else if(btnId == "eat"){
    drawChart(label1,label2,resultEat,tarKcal);
  }else if(btnId == "exe"){
    drawChart(label1,label2,resultExe,tarExe);
  }
}
// chart.js 함수
function drawChart(label1,label2,data1,data2){
  //chart그리기
  myChart = new Chart(
    document.getElementById('myChart'), //차트를 그려줄 위치
    {
      type : 'line', //차트의 형태
      data : { //차트에 들어갈 데이터
        labels: [ //x축
          1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,
          16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
        ],
        datasets: [{ //제 1 그래프
          label: label1, //차트제목
          fill: true, //line 형태일 때, 선 안쪽을 채우는지 안채우는지
          backgroundColor: 'rgba(255, 99, 132, 0.1)', //선 안쪽 배경색
          borderColor: 'rgb(255, 99, 132)', //선 색깔
          /*data: [ //실제 들어갈 값
            60.4,60.5,60.8,60.0,59.5,59.4,59.3,59.6,59.3,59.1,
            59.0,58.7,58.6,58.7,58.9,59.0,59.1,58.8,58.6,58.4,
            58.6,58.3,58.2,58.1,58.3,58.2,58.0,57.9,57.8,57.3
          ],*/
          data: data1,
          borderWidth: 1, //선 굵기
          tension: 0.2 //끝부분을 둥그스름하게 하는 정도
        },{ //제 2 그래프
          label: label2, //차트제목
          fill: true, //line 형태일 때, 선 안쪽을 채우는지 안채우는지
          backgroundColor: 'rgba(99, 255, 132, 0.1)', //선 안쪽 배경색
          borderColor: 'rgb(99, 255, 132)', //선 색깔
          data: data2,
          borderWidth: 1 //선 굵기

        }]
      }, 
      options: { //기타옵션
        responsive: true,
        scales: {
          yAxes: {
            display: true,
            beginAtZero : true, //y축에서 0부터 시작
            //max:100,
            ticks: {
            }
          }
        }
		  }
    }
  );
}

</script>

</html>