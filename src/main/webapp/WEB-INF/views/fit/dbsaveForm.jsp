<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>

</style>
</head>
<body>

</body>
<script>
var url = 'http://apis.data.go.kr/1470000/FoodNtrIrdntInfoService/getFoodNtrItdntList';
var serviceKey = 'ua%2BQjRkNB8g7lDPm3OC0ZBwqL8L2QkrUgWhcbYc0X5fPRRUdqapPYEZ5ht6NAbsLS9c%2BN7HNbfcg8y6G6MXNKw%3D%3D'; //encoding
var desc_kor = '';
var type = 'json'
var numOfRows = 10;
var pageNo = 1;
var serviceKeyDecoding = 'ua+QjRkNB8g7lDPm3OC0ZBwqL8L2QkrUgWhcbYc0X5fPRRUdqapPYEZ5ht6NAbsLS9c+N7HNbfcg8y6G6MXNKw==';
var requestUrl = url+'?serviceKey='+serviceKey+'&desc_kor='+desc_kor+'&type='+type+'&numOfRows='+numOfRows+'&pageNo='+pageNo;

var param = {};
param.serviceKey = 'ua+QjRkNB8g7lDPm3OC0ZBwqL8L2QkrUgWhcbYc0X5fPRRUdqapPYEZ5ht6NAbsLS9c+N7HNbfcg8y6G6MXNKw==';
param.desc_kor = '';
param.type = 'json';
param.numOfRows = 10;
param.pageNo = 1;

$.ajax({
    url:url,
    type:'GET',
    data:param,
    dataType:'JSON',
    success:function(data){
        console.log(data);
        console.log('dbsave 실행');
        //dbsave(data);
    },
    error:function(e){
        console.log(e);
    }
});

function dbsave(jsondata){
    $.ajax({
    url:'dbsave',
    type:'POST',
    data:{
        'jsondata':jsondata
    },
    dataType:'JSON',
    success:function(data){
        console.log(data.success);

    },
    error:function(e){
        console.log(e);
    }
});
}
</script>
</html>