<%@page import="json.dept.deptVO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="json.dept.deptjson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	deptjson ej = new deptjson();
	Gson g = new Gson();
	List<deptVO> dvos = ej.deptVOList();
	String votemp = g.toJson(dvos);
	out.print(votemp);
%>
