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
	function on(){
		timer = setInterval(function(){
			$("#screen").html("<img src='test.png'>")
 		}, 1000);
		
	}
</script>
</head>
<body>
<div id=log>로그</div>
<button id="on" onclick="on()">송신</button>
<div id="screen"></div>

</body>
</html>