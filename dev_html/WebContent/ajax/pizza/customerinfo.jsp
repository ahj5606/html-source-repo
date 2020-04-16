<%@ page language="java" contentType="text/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List, java.util.ArrayList" %>
    <%@ page import="java.util.Map, java.util.HashMap" %>
    <%@ page import="com.google.gson.Gson" %>
    <%--
    	이름:mem_name
    	주소:mem_addr
    	전화번호:mem_tel
     --%>
<%
	List<Map<String,Object>> mList = new ArrayList<Map<String,Object>>();
	Map<String,Object> mMap = new HashMap<String,Object>();
	mMap.put("mem_name", "이순신");
	mMap.put("mem_addr", "서울시 구로구 고척동");
	mMap.put("mem_tel", "010-5555-5555");
	mList.add(mMap);
	mMap = null;
	mMap = new HashMap<String,Object>();
	mMap.put("mem_name", "이성계");
	mMap.put("mem_addr", "서울시 영등포구 당산동");
	mMap.put("mem_tel", "010-4444-4444");
	mList.add(mMap);
	mMap = null;
	mMap = new HashMap<String,Object>();
	mMap.put("mem_name", "김유신");
	mMap.put("mem_addr", "서울시 금천구 가산동");
	mMap.put("mem_tel", "010-3333-3333");
	mList.add(mMap);
	Gson g = new Gson();
	String temp = g.toJson(mList);
	out.print(temp);
	
%>