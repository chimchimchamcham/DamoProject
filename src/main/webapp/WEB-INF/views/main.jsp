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
  
  
  
  <!-- Vendor CSS Files -->
<!--   <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="resources/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="resources/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="resources/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="resources/vendor/venobox/venobox.css" rel="stylesheet">
  <link href="resources/vendor/owl.carousel/resources/owl.carousel.min.css" rel="stylesheet">
  <link href="resources/vendor/aos/aos.css" rel="stylesheet"> -->

  <!-- Template Main CSS File -->
  <link href="resources/css/style.css" rel="stylesheet">
<title>Insert title here</title>
<style>
</style>

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	 <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center">
    <div class="container position-relative" data-aos="fade-up" data-aos-delay="100">
      <div class="row justify-content-center">
        <div class="col-xl-7 col-lg-9 text-center">
          <h1 >당신의 다이어트 일기를 시작해보세요</h1>
          <h2 style="padding-top:30px; font-style: italic;">"다이어트 혼자 하니? 다이어트도 모여서 하자!"</h2>
        </div>
      </div>

      <div class="row icon-boxes">
        <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0" data-aos="zoom-in" data-aos-delay="200">
          <div class="icon-box">
            <h4 class="title"><a style="cursor: default;">다모 캘린더</a></h4>
            <p class="description">자신의 다이어트 목표를 세워보세요</p>
          </div>
        </div>

        <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0" data-aos="zoom-in" data-aos-delay="300">
          <div class="icon-box">
            <h4 class="title"><a style="cursor: default;">다이어트 다이어리</a></h4>
            <p class="description">식단과 운동 관리를 한번에!</p>
          </div>
        </div>

        <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0" data-aos="zoom-in" data-aos-delay="400">
          <div class="icon-box">
            <h4 class="title"><a style="cursor: default;">통계 그래프</a></h4>
            <p class="description">몸무게, 섭취, 운동 그래프를 한눈에!</p>
          </div>
        </div>

        <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0" data-aos="zoom-in" data-aos-delay="500">
          <div class="icon-box">
            <h4 class="title"><a style="cursor: default;">지식Fit</a></h4>
            <p class="description">다이어트 고민을 올리고 정보를 공유해보세요</p>
          </div>
        </div>

      </div>
      <div class="text-center pt-4">
        <a href="Gologin" class="btn-get-started scrollto">다모 시작하기</a>
      </div>
    </div>
  </section><!-- End Hero -->
	

</body>

<!-- Vendor JS Files -->

  <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="resources/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="resources/vendor/php-email-form/validate.js"></script>
  <script src="resources/vendor/waypoints/jquery.waypoints.min.js"></script>
  <script src="resources/vendor/counterup/counterup.min.js"></script>
  <script src="resources/vendor/venobox/venobox.min.js"></script>
  <script src="resources/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="resources/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="resources/vendor/aos/aos.js"></script>

  <!-- Template Main JS File -->
  <script src="resources/js/main.js"></script>
<script>
var msg="${msg}";
if(msg!=""){
	alert(msg);
}
</script>
</html>