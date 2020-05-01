<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mode = request.getParameter("mode");
	out.print(mode);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../JEasyUICommon.jsp" %>
<script type="text/javascript" src="../../../js/commons.js"></script>
<script type="text/javascript">
	function move(){
		location.href="b2.jsp"
		
	}  
	function callFunc(){
		$("#d_text").text("바뀜");
	}
</script>
</head>
<body>
<div id="d_text">이곳이 바뀜?</div>
<button id="btn_ok" onClick="move()">전송</button>
</body>
</html>