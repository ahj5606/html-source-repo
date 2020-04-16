<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%String temp = request.getParameter("print_name"); 
	if(temp.equals("그림1")){
%>
	<img src="picture1.jpg" width=600px; height=600px;>
	<br>
	<hr>
	<h1>그림1</h1>
	<hr>
	<br>
	설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명
<%}else if(temp.equals("그림2")){ %>
	<img src="picture2.jpg" width=600px; height=600px;>
	<br>
		<hr>
	<h1>그림2</h1>
	<br>
		<hr>
	설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명
<%}else if(temp.equals("그림3")){ %>
	<img src="picture3.jpg" width=600px; height=600px;>
	<br>
	<hr>
	<h1>그림3</h1>
	<br>
	<hr>
	설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명
<%}else if(temp.equals("그림4")){ %>
	<img src="picture4.jpg" width=600px; height=600px;>
	<br>
	<hr>
	<h1>그림4</h1>
	<br>
	<hr>
	설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명
<%} %>

