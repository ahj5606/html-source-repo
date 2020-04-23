<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="orm.dao.SqlMapEmpDao"%>
<%
	SqlMapEmpDao edao = new SqlMapEmpDao();
	List<Map<String,Object>> eList = edao.empList(null);
%> 
<table border ='1' borderColor="red">	
<% 
//조화결과가 없을때
	if(eList==null){
%>
	<tr>
		<td>조회결과가 없습니다.</td>
	</tr>
<%
	}else{ 
//조회결과가 있을때  
	for(int i=0;i<eList.size();i++){
		Map<String,Object> rmap = eList.get(i);
%>
	<tr>
		<td><%out.print(rmap.get("EMPNO")); %></td>
		<td><%out.print(rmap.get("ENAME")); %></td>
		<td><%out.print(rmap.get("SAL")); %></td>
		<td><%out.print(rmap.get("JOB")); %></td>
		<td><%out.print(rmap.get("DEPTNO")); %></td>
	</tr>
<%
		}//end of for
	}//// end of else
%>	
</talbe>