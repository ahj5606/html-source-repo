<%@page import="capture.CaptureSample"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
	var timer;
 	
 	function testover(){
 		timer = setInterval(function(){
 			$.ajax({
 				url:"capture.jsp?"
 				,cache : false
 				,success:function(result){
 					$("#log").append("성공");
 				}
 				,error:function(date){
 				}
 			});	 
 		}, 6000);
 	}
 	function stoptest(){
 		clearInterval(timer);
 		
 	}
 	
</script>
</head>
<body>
	<button onclick ="testover()">
	캡처
	</button>
	<button onclick ="stoptest()">
	스탑
	</button>
	<div id="log">로그</div>
</body>
</html>