<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="orm.dao.SqlMapEmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String empnoArr = request.getParameter("empno");
	String empnos[] = null;
	if(empnoArr!=null){
		empnos = empnoArr.split(",");
	}
	SqlMapEmpDao sDao = new SqlMapEmpDao();
	int result = sDao.empDEL(empnos);
	if(result>=1){
		response.sendRedirect("EmpManagerVer8.jsp?upd=update");
	}else{
		response.sendRedirect("EmpManagerVer8.jsp");
	}

%>