<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="restaurant.RestaurantDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--스크립틀릿 -자바코드를 쓸수 있는 땅 jsp주석--%>
<%
	RestaurantDao rDao = new RestaurantDao();
	List<Map<String,Object>> rList = rDao.proc_restList();
	Gson g = new Gson();
	String temp = g.toJson(rList);
	out.print(temp);
%> 