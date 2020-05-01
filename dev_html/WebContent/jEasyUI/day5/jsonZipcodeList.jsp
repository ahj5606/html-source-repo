<%@page import="java.util.HashMap"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="orm.dao.SqlMapZipcodeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String zdo = request.getParameter("zdo");
	String sigu = request.getParameter("sigu");
	String dong = request.getParameter("dong");
	if(zdo!=null || sigu!=null || dong!=null){
		SqlMapZipcodeDao zDao = new SqlMapZipcodeDao();
		Map<String,Object> pMap = new HashMap<String,Object>();
		pMap.put("zdo", zdo);
		pMap.put("sigu", sigu);
		pMap.put("dong", dong);
		List<Map<String,Object>> sList = zDao.zipcodeList(pMap);
		Gson g = new Gson();
		String temp = g.toJson(sList);
		out.print(temp);
	}
%>