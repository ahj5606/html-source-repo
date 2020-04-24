<%@page import="java.util.HashMap"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="orm.dao.SqlMapZipcodeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String zdo = request.getParameter("zdo");
	if(zdo!=null){
		SqlMapZipcodeDao zDao = new SqlMapZipcodeDao();
		Map<String,Object> pMap = new HashMap<String,Object>();
		pMap.put("zdo", zdo);
		List<Map<String,Object>> sList = zDao.siguList(pMap);
		Gson g = new Gson();
		String temp = g.toJson(sList);
		out.print(temp);
	}
%>
