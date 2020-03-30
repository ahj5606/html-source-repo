<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% // 스크립틀릿 
	String u_id = request.getParameter("mem_name");
	String u_pw = request.getParameter("mem_pw");
	out.print("u_id : "+u_id+"\r\n");
	
	out.print("u_pw : "+u_pw);
%>
