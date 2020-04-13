<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="jeasyui.member.MemberDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--html땅 ==>jsp주석으로 처리할것 --%>
<%
	MemberDao mdao = new MemberDao();
	List<Map<String,Object>> mList = mdao.memberList();
	if(mList!=null){
		Gson g = new Gson();
		String temp = g.toJson(mList);
		out.print(temp);
	}
%>