<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="orm.dao.SqlMapDeptDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SqlMapDeptDao dDao = new SqlMapDeptDao();
	List<Map<String, Object>> dList = null;
	dList = dDao.deptList();
	Gson g = new Gson();
	String temp = g.toJson(dList);
	out.print(temp);
%>