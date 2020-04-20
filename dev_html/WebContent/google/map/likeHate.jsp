<%@page import="restaurant.likeHate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String like = request.getParameter("like");
	String hate = request.getParameter("hate");
	int result = 0;
	likeHate lh = new likeHate();
	if(like!=null){
		result = lh.likeup(like);
	}else if(hate!=null){
		result = lh.hateup(hate);	
	}
	out.print(result);
%>