<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style></style>
</head>
<body>
	<form action="upload" method="post" enctype="multipart/form-data">
		<input type="file" name="file" onchange="fileUpload()">
	</form>
</body>
<script>

var path = "${path}";
console.log("path:"+path);

if (path!="") {
	var elem = opener.document.getElementById("editable");
	var content = "";
	content = "<a href='#' id='${path}' onclick='del(this)'>";
	content += "<img src='${path}' width='250'/>";
	content += "<b>X</b></a>";
	elem.innerHTML += content;
	self.close();
}

function fileUpload(){
	$('form').submit();
}


</script>
</html>