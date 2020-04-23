<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script></head>
<body>
<!-- 
가 - 44032
 -->
<div id="d_msg"></div>
<script type="text/javascript">
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
	var a = choSeongAccount("뉁뤥뭷");
	alert(a)
</script>
</body>
</html>