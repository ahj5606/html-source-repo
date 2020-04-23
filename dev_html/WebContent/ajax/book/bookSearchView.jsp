<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색</title>
<link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/color.css">
<link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/demo/demo.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
<style type="text/css">
	div#d_main{
		width: 100%;
		height:100%;
	}
	#text_filed{
		width: 600px;
		height: 650px;
		margin: 0 auto;
		margin-top: 100px;
		align-items: center;	
	}
	#d_search{
		position: absolute;
	}
</style>
<script type="text/javascript">
	function chooseong(str){
		
	}
</script>
</head>
<body>
<% 

%>
<div id="d_main">
<div id="text_filed">
	<input id="book_text"></input>
	<a id="btn_serch"></a>
	<div id="d_search">여기</div>
</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$("#d_search").hide();
		
		$("#book_text").textbox({
			width:'380'
			,height:'40'
		});
		$("#book_text").textbox('textbox').bind('keyup',function(e){
			var data=$(this).val();
			var chooseong = data.substr(0, 1);
			var choMode = 'N';
			if(chooseong>='ㄱ' && chooseong<='ㅎ'){
				choMode = 'Y'
			}
			$.ajax({
				method:"post"
				,url:"htmlBookList.jsp"
				,data:"book_title="+data+"&choMode="+choMode
				,success:function(result){
					$("#d_search").show();
					$("#d_search").html(result);
				}
				,error:function(result){
					location.replace(result);
				}
			});
		});
		$("#btn_serch").linkbutton({
			width:"50"
			,height:'40'
			,iconCls: "icon-search"
		});
	});
</script>
</body>
</html>
