<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록화면</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	function add(){
		var u_pw = $("#mem_pw2").val();
		alert("사용자가 입력한 비번:"+u_pw);
	}
</script>
</head>
<body>
<label>비밀번호 확인</label><input id="mem_pw2" class="easyui-passwordbox" prompt="Password" iconWidth="28" style="width:100%;height:34px;padding:10px">
<br>
<button onClick="add()">등록</button>
</body>
</html>