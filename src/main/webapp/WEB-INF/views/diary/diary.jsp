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

a:hover{
text-decoration: none;
}

#photo{
        display : none;
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
				class="form-control ml-3" id="d_weight" placeholder="몸무게 입력"
				name="weight" style="width:80px;" value="" /> <label class="ml-1">Kg</label>
		</form>

		<div class="row my-3">
			<!-- 섭취 그래프 -->
			<div class="col mt-4 col-sm-3.5">
				<p>섭취 그래프</p>
				<div class="circle1">
					<strong class="circle_strong"></strong>
				</div>
				
				<form class="form-inline" action="#" class="circle_strong form-inline">
							<label for="weight">목표 섭취 칼로리:</label> <input type="text"
								class="form-control ml-3" id="d_tarKcal" placeholder=""
								name="weight" style="width:110px;" value="" /><label class="ml-1">Kcal</label>
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
							<label for="weight">목표 운동 칼로리 :</label> <input type="text"
								class="form-control ml-3" id="d_tarExe" placeholder=""
								name="weight" style="width:110px;" value="" /> <label class="ml-1">Kcal</label>
						</form>
			</div>

			<!-- 탄단지 -->
			<div class="col col-sm-4 mt-4">
				<!-- 저탄고지, 밸런스 셀렉트 -->
				<label for="weight">탄단지 그래프</label>
				<select class="form-control form-control-sm float-right" style="width:100px;">
					<option>밸런스</option>
					<option>저탄고지</option>
				</select>
				<div style="width:100%;">
		<canvas id="myChart" height="180" style="margin-top:25px;">
</canvas>
<div class="col col-sm-1 mt-4">
<span id="chartNum">(100/1000)<br/>(100/1000)<br/>(100/1000)<br/></span>
<hr/>
</div>
</div>
</div>
		</div>
<hr/>

<!-- 음식,운동 리스트 -->
<div class="container my-5">

<div class="row mb-5">
<a href="" style="">
<button type="button" class="btn btn-primary btn-sm " style="width:33px; height:33px;"><i class="fas fa-plus"></i></button>
<span style="font-size:18px; font-weight: bold" class="pl-1"> 추가하기</span>
</a>
</div>

  <h3>섭취</h3>
  <div id="accordion" class="my-3">
    <div class="card">
      <div class="card-header">
        <a class="card-link" data-toggle="collapse" href="#collapseOne">
          <b>아침 - </b> <span>바나나</span> <span>사과</span> <span>계란</span> <span>우유</span> <b class="float-right">1000kcal</b>
        </a>
      </div>
      <div id="collapseOne" class="collapse hide" data-parent="#accordion">
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
  
   <hr/>
   
   
    <h3>운동</h3>
<div id="accordion" class="my-3">
    <div class="card">
      <div class="card-header">
        <a class="card-link" data-toggle="collapse" href="#collapseOne">
          <b>아침 - </b> <span>바나나</span> <span>사과</span> <span>계란</span> <span>우유</span> <b class="float-right">1000kcal</b>
        </a>
      </div>
      <div id="collapseOne" class="collapse hide" data-parent="#accordion">
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

<hr/>

<!-- 일기 메모 -->
<div class="container my-5">
<div class="form-group">
  <h3>일기 메모</h3>
  <textarea class="form-control m-auto" rows="10" id="comment" style="overflow-y:scroll; resize:none;" placeholder="오늘의 일기를 적어보세요."></textarea>
</div>

<div class="row" >
<button type="button" class="btn btn-primary btn-sm " style="width:33px; height:33px;" id="fileBtn"><i class="fas fa-plus"></i></button>

<label for="photo"><span style="font-size:18px; font-weight: bold; cursor: pointer;" class="ml-1 text-primary" > 사진추가</span></label>
            <input type="file" name="photo" id="photo" accept="image/gif,image/jpeg,image/png,image/jpg" > <!-- 사진 -->
</div>

 <!-- 이미지가 들어간다 -->
        <div id="imageWrap">
        </div>
</div>

<hr/>

<!-- 체크 리스트 -->
<div class="container my-5">
  <h3>체크 리스트</h3>
  <form>
    <div class="checkbox pl-5 pt-3 pr-5">
      <label style="font-size:18px;"><input type="checkbox" value="" style="transform : scale(1.3);" name="checkbox"> 물 2L마시기</label>
      <hr/>
    </div>
  </form>

  
  
<div class="container my-5">
<!--     <label for="weight">체크리스트 추가</label> -->
  <form class="form-inline " action="#" class="circle_strong form-inline">
							<input type="text" class="form-control ml-3 mr-1" id="" placeholder="" name="checkList"  value=""/>
							<span style="color:#eaeaea"><i class="fas fa-plus-square fa-2x"></i></span>
						</form>
    
</div>
         </div>
         
         
    </div> <!-- --container end-- -->
</body>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js" integrity="sha512-Wt1bJGtlnMtGP0dqNFH1xlkLBNpEodaiQ8ZN5JLA5wpc1sUlk/O5uuOMNgvzddzkpvZ9GLyYNa8w2s7rqiTk5Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<!-- <script src="chartjs-plugin-doughnutlabel.js"></script>
<script src="chartjs-plugin-doughnutlabel.min.js"></script> -->
<script>

var uploadNo = 1;
//파일 등록시 이벤트 (최대 4장)
  $("input[name='photo']").on("change",function(e){
  	console.log('썸네일 등록');
  	
  	//imageWrap에 자식요소가 4개 이상 있을 경우 업로드 막기
  	if($("#imageWrap").children().length>=4){
  		alert("최대 4장까지만 업로드 가능합니다.");
  		$("#photo").val("");
  	}else{
          	var reader = new FileReader();

          	reader.onload = function(e){
          		
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
  $(document).on("click",".closeImgWrap",function(){
      $(this).parent().remove();
      changeImgIcon();
      
      var imgNo = $(this).parent().find("input[type='hidden']").val();
      deleteInputTyleFile(imgNo);
  });
  
var search = location.search    
var params = new URLSearchParams(search); 
var getType= params.get('Date');    
console.log(getType);

var d_carbo;
var d_protein;
var d_fat;

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
					
					//몸무게, 목표 섭취 운동 칼로리 뿌려주기
					document.getElementById("d_weight").value = data.dto.d_weight;
					document.getElementById("d_tarKcal").value = data.dto.d_tarKcal;
					document.getElementById("d_tarExe").value = data.dto.d_tarExe;
					
					//권장 탄단지 뿌려주기
					d_carbo = JSON.parse(data.dto.d_carbo);
					d_protein = JSON.parse(data.dto.d_protein);
					d_fat = JSON.parse(data.dto.d_fat);
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
                  label: '탄단지',
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
                  data: [10 ,10, 10]
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
      
  
      
      //목표 접근
	    $("#goal").focusin(function(){
	    	console.log("목표 접근");
	    	$(this).css("background-color","white");
	    });
	    //목표 운동 칼로리 벗어났을 때
	    $("#goal").focusout(function(){
	    	console.log("목표 벗어남");
	    	$(this).css("background-color","#F4F4E9");
	    	
	    	//console.log($(this).val())
	    	
	    	//원래 입력했던 데이터와 다를 때 변경
	    	if($(this).val() == '' || $(this).val()==null){
	    		alert("내용을 입력해주세요");
	    	}else if($(this).val() != $(this).prop('defaultValue')){
	    		console.log('update 요청');	
	    		reqUpdate($(this));
	    	}
	    });

	    //입력한 내용으로 변경
	    function reqUpdate(obj){
	    	console.log("reqUpate 값 : "+obj.val());
	    	console.log("reqUpdate 아이디 : "+obj.attr("id"));
	    	var reqUrl = "updateMD/"+obj.attr("id")+"/"+obj.val()+"/"+dateCal;
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
	    
	    
	    /*체크박스 추가 시*/
	    
	    
	    /*체크박스 체크 시*/
	   /*  $('input:checkbox[name="checkbox"]').is(":checked") ==  true{
	    	type : 'get',
			url : 'checkListUpdate',
			data : {
				'checkContent' : getType,
				'id' : '${sessionScope.loginId}'
			},
			dataType : 'JSON',
			success : function(data) {
				console.log("성공");
				console.log(data.dto);
				
				//몸무게, 목표 섭취 운동 칼로리 뿌려주기
				document.getElementById("d_weight").value = data.dto.d_weight;
				document.getElementById("d_tarKcal").value = data.dto.d_tarKcal;
				document.getElementById("d_tarExe").value = data.dto.d_tarExe;
				
				//권장 탄단지 뿌려주기
				d_carbo = JSON.parse(data.dto.d_carbo);
				d_protein = JSON.parse(data.dto.d_protein);
				d_fat = JSON.parse(data.dto.d_fat);
			},
			error : function(e) {
				console.log(e);
			}
	    } */
	    
	   
</script>

</html>