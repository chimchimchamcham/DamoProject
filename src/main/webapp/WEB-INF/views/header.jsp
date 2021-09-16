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
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

<title>Insert title here</title>

</head>
<body >
${cursor}
<div class="sticky-top">
                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-dark bg-primary topbar mb-0 static-top mr-2" style="height: 35px;">
                <div class="container">
                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Alerts -->
                        <li class="nav-item dropdown no-arrow mx-1 active">
                            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >
                                <i class="fas fa-bell fa-fw mr-0"></i>
                                <!-- Counter - Alerts -->
                                <span class="badge badge-danger badge-counter" style="margin-left:-10px; font-size: 10px;">3</span>
                            </a>
                            <!-- Dropdown - Alerts -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="alertsDropdown">
                                
                                <h6 class="dropdown-header"><b>알람</b> 3</h6>
                                
							  
       							 <div class="card-body p-1 mt-0" >
          						<div class="custom-scrollbar-css p-1" style="border:0px;height: 300px; width:450px;">
          						<!-- 중요알람-->
                                <div class="alert alert-danger alert-dismissible fade show ml-1 mr-1">
								    <button type="button" class="close" data-dismiss="alert">&times;</button>
								    <strong>Danger!</strong> This alert box could indicate a dangerous or potentially negative action.
							  </div>
							  
                                <!-- 일반알람-->
                                <a class="dropdown-item d-flex align-items-center p-2" href="#">
                                    <div>
                                        <div class="small text-gray-500">December 12, 2019</div>
                                        <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center p-2" href="#">
                                    <div>
                                        <div class="small text-gray-500">December 12, 2019</div>
                                        <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center p-2" href="#">
                                    <div>
                                        <div class="small text-gray-500">December 12, 2019</div>
                                        <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center p-2" href="#">
                                    <div>
                                        <div class="small text-gray-500">December 12, 2019</div>
                                        <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center p-2" href="#">
                                    <div>
                                        <div class="small text-gray-500">December 12, 2019</div>
                                        <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                    </div>
                                </a>
                                
                                
                            </div>
                            </div>
                            </div>
                        </li>
                        

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow active">
                           <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">김체중 님</span>
                                <img class="img-profile rounded-circle"
                                    src="resources/img/default-profile.png" width="23px;">
                            </a>
                            
                            
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown"  style="font-size:14px;">
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    마이 페이지
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    로그아웃
                                </a>
                            </div>
                        </li>

                    </ul>
				</div>
                </nav>
                <!-- End of Topbar -->
                
                
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow" style="height:50px;">
              <div class="container">
  <a class="navbar-brand" href="javascript:void(0)"> <img src="resources/img/logo4.png" alt="Logo" style="width:80px;"></a>

  <div class="collapse navbar-collapse" id="navb" style="font-size:15px;">
    <ul class="navbar-nav ml-auto" >
      <li class="nav-item" style="margin-left: 40px;">
        <a class="nav-link" href="javascript:void(0)">캘린더</a>
      </li>
      <li class="nav-item" style="margin-left: 40px;">
        <a class="nav-link" href="javascript:void(0)">통계 그래프</a>
      </li>
      <li class="nav-item dropdown justify-content-center" >
    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" style="margin-left: 40px; margin-right: 60px;">지식Fit</a>
    <div class="dropdown-menu" style="font-size:14px;" id="dropdown">
      <a class="dropdown-item text-muted mt-1" href="fitMain">지식Fit</a>
      <a class="dropdown-item text-muted mt-1" href="#">명예의 전당</a>
      <a class="dropdown-item text-muted mt-1" href="#">질문하기</a>
       <a class="dropdown-item text-muted mt-1 mb-1" href="#">내 지식사전</a>
    </div>
  </li>
    </ul>
    
    <!--searchBar-->
 <form class="form-inline my-2 my-lg-0">
      <input class="form-control" type="text" placeholder="지식Fit 제목/내용 검색..." id="search" style="font-size:12px; width:200px;">
      <button class="btn btn-white" type="button"> <i class="fas fa-search" aria-hidden="true"></i></button>
    </form>

  </div>
  </div>
</nav>
</div>
</body>
<style>
/* @import url('https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css');
*{
	font-family:'Nanum-Square',sans-serif;
} */

#dropdown a:hover{
	color:black;
}

#search{
border:0px;
border-bottom:1px solid gray;
border-radius:0px;
}


.custom-scrollbar-js,
.custom-scrollbar-css {
  height: 200px;
}


/* Custom Scrollbar using CSS */
.custom-scrollbar-css {
  overflow-y: scroll;
}

/* scrollbar width */
.custom-scrollbar-css::-webkit-scrollbar {
  width: 5px;
}

/* scrollbar track */
.custom-scrollbar-css::-webkit-scrollbar-track {
  background: #eee;
}

/* scrollbar handle */
.custom-scrollbar-css::-webkit-scrollbar-thumb {
  border-radius: 1rem;
  background-color: #00d2ff;
  background-image: linear-gradient(to top, #00d2ff 0%, #3a7bd5 100%);
}

</style>
<script src="resources/js/jquery.min.js"></script>
  <script src="resources/js/popper.js"></script>
  <script src="resources/js/bootstrap.min.js"></script>
  <script src="resources/js/main.js"></script>
<script>

</script>
</html>