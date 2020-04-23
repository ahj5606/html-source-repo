<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="orm.dao.SqlMapBookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String book_title = request.getParameter("book_title");
	String choMode = request.getParameter("choMode");
	SqlMapBookDao bDao = new SqlMapBookDao();
	Map<String,Object> pmap = new HashMap<>();
	pmap.put("book_title", book_title);
	pmap.put("choMode", choMode);
	List<Map<String,Object>> bList = bDao.bookList(pmap);
	out.print(choMode);
%>
<table border ='1' borderColor="red">	
<% 
//조화결과가 없을때
	if(bList==null){
%>
<%
	}else{ 
//조회결과가 있을때  
	for(int i=0;i<bList.size();i++){
		Map<String,Object> rmap = bList.get(i);
%>
	<tr>
		<td rowspan="2" id="<%=rmap.get("BOOK_NO")%>"><img src="./<%out.print(bList.get(i).get("BOOK_IMG"));%>" width="90px" height="100px"/></td>
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