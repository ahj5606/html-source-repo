<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="json.dept.deptjson"%>
<%@ page language="java" contentType="text/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	deptjson dDao = new deptjson();
	List<Map<String,Object>> dList = dDao.deptList();
	Gson g = new Gson();
	String temp = g.toJson(dList);
	out.print(temp);
%>