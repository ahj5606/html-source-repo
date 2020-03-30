<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="json.dept.deptjson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	deptjson ej = new deptjson();
	List<Map<String,Object>> dList = ej.deptList(); 
	Gson g = new Gson();
	String temp = g.toJson(dList);
	out.println(temp);
%>
</body>
</html>