<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="orm.dao.SqlMapZipcodeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SqlMapZipcodeDao zDao = new SqlMapZipcodeDao();
	List<Map<String,Object>> zList = zDao.zdoList();
	Gson g = new Gson();
	String temp = g.toJson(zList);
	out.print(temp);
%>