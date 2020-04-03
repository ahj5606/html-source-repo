<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	out.print("[{\"DEPTNO\":10,\"DNAME\":\"영업부\",\"LOC\":\"대전\"},{\"DEPTNO\":20,\"DNAME\":\"총무부\",\"LOC\":\"서울\"} ,{\"DEPTNO\":30,\"DNAME\":\"인사부\",\"LOC\":\"인천\"} ]");
%>