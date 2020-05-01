<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="orm.dao.SqlMapEmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String empno = request.getParameter("empno");
	SqlMapEmpDao sDao = new SqlMapEmpDao();
	Map<String,Object> pMap = new HashMap<>();
	pMap.put("empno",empno);
	int result = sDao.empDEL(pMap);
	if(result==1){
		out.print("성공");
	}else{
		out.print("실패");
	}

%>