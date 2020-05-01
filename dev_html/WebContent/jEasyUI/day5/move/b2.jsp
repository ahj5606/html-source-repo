<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../JEasyUICommon.jsp" %>
<script type="text/javascript" src="../../../js/commons.js"></script>
<script type="text/javascript">
	function move(){
		location.href="a2.jsp?mode=update"
		
	}  
</script>
</head>
<body>
<button id="btn_ok" onClick="move()">전송</button>
</body>
</html>