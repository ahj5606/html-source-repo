<%@page import="orm.dao.SqlMapEmpDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.util.HashMapPut"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	HashMapPut mm = new HashMapPut();
	Map<String,Object> pmap = new HashMap<>();
	pmap =mm.putHashMap(pmap, "empno", request.getParameter("upd_empno"));
	pmap =mm.putHashMap(pmap, "ename", request.getParameter("upd_ename"));
	pmap =mm.putHashMap(pmap, "job", request.getParameter("upd_job"));
	pmap =mm.putHashMap(pmap, "hiredate", request.getParameter("upd_hiredate"));
	pmap =mm.putHashMap(pmap, "sal", request.getParameter("upd_sal"));
	pmap =mm.putHashMap(pmap, "comm", request.getParameter("upd_comm"));
	pmap =mm.putHashMap(pmap, "deptno", request.getParameter("upd_deptno"));
	SqlMapEmpDao eDao = new SqlMapEmpDao();
	int result = eDao.empUPD(pmap);
	if(result==1){
		response.sendRedirect("EmpManagerVer8.jsp?upd=update");
	}else{
		response.sendRedirect("EmpManagerVer8.jsp");
	}
%>