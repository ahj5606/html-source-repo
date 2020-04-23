<%@page import="java.util.HashMap"%>
<%@page import="orm.dao.SqlMapBookDao"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
	tr{
		border:1px solid black;
	}
	td{
		border:1px solid black;
	}
}
	
</style>
<%
 	String book_title = request.getParameter("book_title");
 	String choMode = request.getParameter("choMode");
 	out.print(choMode);
	SqlMapBookDao smbd = new SqlMapBookDao();
	Map<String,Object> pMap = new HashMap<>();
	pMap.put("book_title", book_title);
	pMap.put("choMode", choMode);
	List<Map<String,Object>> bList = smbd.bookList(pMap);
%>
<table border ='1' borderColor="red">	
<% 
//조화결과가 없을때
	if(bList==null||book_title.trim().length()<=0){
%>
<%
	}else{ 
//조회결과가 있을때  
	for(int i=0;i<bList.size();i++){
		Map<String,Object> rmap = bList.get(i);
%>
	<tr>
		<td rowspan="2"><img src="./<%out.print(bList.get(i).get("BOOK_IMG"));%>" width="90px" height="100px"/></td>
		<td>제목:<%out.print(bList.get(i).get("BOOK_TITLE")); %></td>
		<td colspan="2">저자:<%out.print(bList.get(i).get("BOOK_AUTHOR")); %></td>
	</tr>
	<tr>
		<td>출판일:<%out.print(bList.get(i).get("BOOK_DATE")); %></td>
		<td>가격:<%out.print(bList.get(i).get("BOOK_PRICE")); %></td>
		<td>출판사:<br><%out.print(bList.get(i).get("BOOK_PUBLISH")); %></td>
	</tr>
<%
		}//end of for
	}//// end of else
%>	
</talbe>