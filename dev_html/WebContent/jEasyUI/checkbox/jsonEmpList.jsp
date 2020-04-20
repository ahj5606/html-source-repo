<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="json.emp.empDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	empDao eDao = new empDao();
	List<Map<String,Object>> eList = eDao.empList();
	Gson g = new Gson();
	String temp = g.toJson(eList);
	out.print(temp);
%>