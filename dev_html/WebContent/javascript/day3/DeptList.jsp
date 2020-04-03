<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Map<String,Object>> deptList = new ArrayList<>();
	Map<String,Object> map = new HashMap<>();
	map.put("dname","영업부");
	deptList.add(map);
	map = new HashMap<>();
	map.put("dname","개발부");
	deptList.add(map);
	map = new HashMap<>();
	map.put("dname","인사부");
	deptList.add(map);
%>
<table border="1">
<%
	for(int i=0;i<deptList.size();i++){
		Map rmap =deptList.get(i);
%>
	<tr><td><%out.print(rmap.get("dname")); %></td></tr>
<%
	}
%>
</table>