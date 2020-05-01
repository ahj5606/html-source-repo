<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>js코드만 사용</title>
<link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/color.css">
<link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/demo/demo.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
</head>
<body>
<!-- 
valueField-실제 서버로 전송되는 필드 
textField - 화면에 출력되는 필드
  --> 
<input id="cb_title"/>
<script type="text/javascript">
	$(document).ready(function(){
		$("#cb_title").combobox({
				url:'jsonDeptList.jsp'
				,datatype:'json'
				,valueField: 'DEPTNO'//실제 서버에 넘어가는 필드
				,textField: 'DNAME'//화면에 출력되는 필드
			
		});
	});
</script>
</body>
</html>