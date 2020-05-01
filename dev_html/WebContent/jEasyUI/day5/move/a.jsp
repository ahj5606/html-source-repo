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
	function popup(url,popupwidth,popupheight,popupname){
		var text = $("#_easyui_textbox_input1").val();
		cmm_window_poppu(url+"?text="+text, popupwidth, popupheight, popupname);
		
	} 
	function callFunc(){
		$("#d_text").text("바뀜");
	}
</script>
</head>
<body>
<input id="e_text" class="easyui-textbox">
<div id="d_text">이곳이 바뀜?</div>
<button id="btn_ok" onClick="popup('b.jsp',700,450,'b')">전송</button>
</body>
</html>