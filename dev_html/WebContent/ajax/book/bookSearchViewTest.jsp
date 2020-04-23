<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서검색[자동완성 + 초성검사]</title>
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/color.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/demo/demo.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
	<style type="text/css">
		#d_search {
			position: absolute;
			border: 1px dotted black;
			background: #AACCFF;
		}
		.listIn{
			background:#CCFFFF;
		}
		.listOut{
			background:#FFFFFF;
		}
	</style>
	<script type="text/javascript">
		//함수선언 전역변수 위치
		function choSeongAccount(str){
		var cho =[
					"ㄱ","ㄲ","ㄴ","ㄷ","ㄸ",
					"ㄹ","ㅁ","ㅂ","ㅃ","ㅅ",
					"ㅆ","ㅇ","ㅈ","ㅉ","ㅊ",
					"ㅋ","ㅌ","ㅍ","ㅎ"
				];
		//alert(str.charCodeAt());
		var code;
		var result='';//ㅈㅂ 을 반환하는 변수
		for(var i=0;i<str.length;i++){
			code = str.charCodeAt(i)-44032;
			if(code>-1 && code <11172) result += cho[Math.floor(code/588)];
			//$("#d_msg").append(cho[code]);
		}
		return result;
	}
	function clearMethod(){
		$("#d_search").css("backgroundColor","#FFFFFF");
		$("#d_search").css("border","none");
		$("#d_search").html("");
		
	}
	</script>
</head>
<body>
	<script type="text/javascript">
		//DOM구성이 되었을 때
		$(document).ready(function (){
			var t = $('.textbox-f');
			t.textbox('textbox').bind('keyup', function(e){
				var v_word = $("#_easyui_textbox_input1").val().toUpperCase();
				var choKeyWord = choSeongAccount(v_word);
				var choMode='';
				if(v_word !="" && choKeyWord==""){
					choMode = "Y";
				}else{
					choMode="N";
				}
				//alert("choMode : "+choMode);
				var p_word = $('#_easyui_textbox_input1').val();
				var param ="book_title="+p_word+"&choMode="+choMode;
				$.ajax({
					 method:"post"
					,url:"htmlBookListTest.jsp"
					,data:param
					,success:function(result){
						//alert("result: "+result);
						$("#d_search").css("border","1px solid #000000");
						$("#d_search").css("background","#FFFFFF");
						$("#d_search").css("top",$("#_easyui_textbox_input1").offset().top+$("#_easyui_textbox_input1").offset().bottom+"px");
						$("#d_search").css("left",$("#_easyui_textbox_input1").offset().left+"px");
						$('#d_search').html(result);//htmlBookList.jsp페이지 내용
						var tds = document.getElementsByTagName("td");
						for(var i =0;i<tds.length;i++){
							tds[i].onmouseover =function(){
								this.className="listIn";
								var b_no =$(this).attr("id");
								var targetURL ='';
								if("2"==$(this).attr("id")){
									targetURL ='bookSearchDetail2.jsp'
								}else if("3"==$(this).attr("id")){
									targetURL ='bookSearchDetail3.jsp'
								}
								
								 $.ajax({
									method:"post"
									,url:targetURL
									,success:function(result){
										if("2"==$(this).attr("id")){
											$("#d_detail2").html(result);
										}else if("3"==$(this).attr("id")){
											$("#d_detail3").html(result);
										}
									}
								 
								});
									
								
							};/////// end of  onmouseover
							
							tds[i].onmouseout=function(){
								//clearMethod();
								this.className ="listOut";
							};
							tds[i].onclick=function(){
								$("#_easyui_textbox_input1").val($(this).text());
								clearMethod();
								
							}
							
						}
					}
					,error:function(xhrobject){
						alert(xhrobject.responseText);
					}
				});
				if(p_word==""){
					$("#d_search").hide();
				}else{
					$("#d_search").show();
				} 
				/* if($("#_easyui_textbox_input1").val()==""){
					//alert("아무것도 없음");
					clearMethod();//$("#d_serch").hide();
				} */
			});
			
		});
	</script>
	<input id="book_title" class="easyui-textbox" style="width:400px"/> 
	<div id="d_search">조회결과처리화면</div>
	<div id="d_detail2">mouseover처리화면-2</div>
	<div id="d_detail3">mouseover조회결과처리화면-3</div>
</body>
</html>





