<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style type="text/css">
	
</style>
</head>
<body>
<table border ='1' borderColor="red" width="1200px">
	<tr>
		<td>시도</td>
		<td>
			<select id="s_zdo" style="width:200px;">
				<option value="선택">선택</option>
			</select>
		</td>
		<td>구</td>
		<td>
			<select id="s_sigu" style="width:200px;">
				<option value="선택">선택</option>
			</select>
		</td>
		<td>동</td>
		<td>
			<select id="s_dong" style="width:200px;">
				<option value="선택">선택</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>시도</td>
		<td>
			<input type="text" id="i_zdo" readonly >
		</td>
		<td>구</td>
		<td>
			<input type="text" id="i_sigu" readonly >
		</td>
		<td>동</td>
		<td>
			<input type="text" id="i_dong" readonly >
		</td>
	</tr>
</table>
<div id="zipcode"></div>
<script type="text/javascript">
	$(document).ready(function(){
		$.ajax({
			url:'jsonZdoList.jsp'
			,method:'post'
			,dataType:'json'
			,success:function(result){
				var str = JSON.stringify(result);
				var jsonData = JSON.parse(str);
				var ahtml = '';
				for(var i =0;i<jsonData.length;i++){
					ahtml+='<option value="'+jsonData[i].ZDO+'">'+jsonData[i].ZDO+'</option>';
				}
				$("#s_zdo").html(ahtml);
			}
		});
		$("#s_zdo").change(function(){
			$("#s_zdo option:selected").each(function(){
				var zdo = this.value;
				$("#i_zdo").val(zdo);
				$.ajax({
					url:'jsonSiguList.jsp'
					,dataType:'json'
					,data:'zdo='+zdo
					,success:function(result){
						var str = JSON.stringify(result);
						var jsonData = JSON.parse(str);
						var ahtml = '';
						for(var i =0;i<jsonData.length;i++){
							ahtml+=' <option value="'+jsonData[i].SIGU+'">'+jsonData[i].SIGU+'</option>'
						}
						$("#s_sigu").html(ahtml);
						
					}
				})
				
			})
		});
		$("#s_sigu").change(function(){
			var sigu = this.value;
			var zdo = $("#i_zdo").val();
			$("#i_sigu").val(sigu);
			$.ajax({
				url:'jsonDongList.jsp'
				,method:'post'
				,dataType:'json'
				,data:"zdo="+zdo+"&sigu="+sigu
				,success:function(result){
					var str = JSON.stringify(result);
					var jsonData = JSON.parse(str);
					var ahtml = '';
					for(var i =0;i<jsonData.length;i++){
						ahtml+='<option value="'+jsonData[i].DONG+'">'+jsonData[i].DONG+'</option>'
					}
					$("#s_dong").html(ahtml);
				}
			})
		});
		$("#s_dong").change(function(){
			var dong = this.value;
			var sigu = $("#i_sigu").val();
			var zdo = $("#i_zdo").val();
			$("#i_dong").val(dong);
			$.ajax({
				url:'jsonZipcodeList.jsp'
				,dataType:'json'
				,data:"zdo="+zdo+"&sigu="+sigu+"&dong="+dong
				,method:'post'
				,success:function(result){
					
					var str = JSON.stringify(result);
					var jsonData = JSON.parse(str);
					var ahtml = ' <table border="1" borderColor="green" width="1200px"><tr><td>시도</td><td>시구</td><td>동</td><td>리</td><td>번지</td><td>우편번호</td><td>주소</td><td>건물</td>';
					for(var i =0;i<jsonData.length;i++){
						ahtml+='<tr>';
						ahtml+='<td>'+jsonData[i].ZDO+'</td>';
						ahtml+='<td>'+jsonData[i].SIGU+'</td>';
						ahtml+='<td>'+jsonData[i].DONG+'</td>';
						if(jsonData[i].RI!=null){
							ahtml+='<td>'+jsonData[i].RI+'</td>';
						}else{
							ahtml+='<td> </td>';
						}
						if(jsonData[i].BUNGI!=null){
							ahtml+='<td>'+jsonData[i].BUNGI+'</td>';
						}else{
							ahtml+='<td> </td>';
						}
						ahtml+='<td>'+jsonData[i].ZIPCODE+'</td>';
						ahtml+='<td>'+jsonData[i].ADDRESS+'</td>';
						ahtml+='<td>'+jsonData[i].APTNAME+'</td>';
						ahtml+='</tr>';
					}
					ahtml+='</table>';
					$("#zipcode").html(ahtml);
				}
			})
		});
	});
</script>
</body>
</html>