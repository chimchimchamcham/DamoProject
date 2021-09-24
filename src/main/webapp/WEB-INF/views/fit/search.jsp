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
<title>검색결과</title>
<style>
</style>
</head>
<body>
<div class="d-flex p-5">
	<div class="container mx-auto my-5">
		<div class="row d-flex justify-content-center align-content-center">
			<div class="col-12 text-center">"content"검색 결과 총 cnt건</div>
			<button class="col-1 btn btn-outline-primary active rounded-pill mr-2 px-1">전체</button>
			<button class="col-1 btn btn-outline-primary rounded-pill px-1">제목</button>
			<button class="col-1 btn btn-outline-primary rounded-pill ml-2 px-1">내용</button>
		</div>
		
		<div class="row d-flex flex-column">
			<h6 class="col-12 mt-3">제목 cnt건</h6>
			<div class="card-group row">
				<div class="card col-12">
				
					<div class="card-body">					
						<div class="card-title d-flex flex-row"><h3 class="">Q</h3><div class="align-self-center">.제 자세 좀 봐주세요</div></div>
						<div class="card-text">스쿼트 하는데 너무 무릎이 아파서요.. 자세 교정 좀 부탁드립니다!</div>
						<hr>
					</div>
	
				</div>
			</div>
		</div>
		
		<div class="row d-flex flex-column">
			<h6 class="col-12 mt-5">내용 cnt건</h6>
			<div class="card-group row">
				<div class="card col-12">
					<div class="card-body">					
						<div class="card-title d-flex flex-row"><h3 class="">Q</h3><div class="align-self-center">.제 자세 좀 봐주세요</div></div>
						<div class="card-text">스쿼트 하는데 너무 무릎이 아파서요.. 자세 교정 좀 부탁드립니다!</div>
						<hr>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script>


$(document).on('click','button',function(){
	$('button').removeClass('active');
	$(this).addClass('active');
});





</script>
</html>