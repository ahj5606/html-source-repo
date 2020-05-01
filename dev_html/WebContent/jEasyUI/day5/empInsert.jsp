<%@page import="java.net.URLEncoder"%>
<%@page import="orm.dao.SqlMapEmpDao"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String empno =   "";
	String ename =   "";
	String job =     "";
	String hiredate= "";
	String sal =     "";
	String comm =    "";
	String deptno  =  "";
	if(request.getParameter("empno")!=null){
		empno = request.getParameter("empno");
	}
	if(request.getParameter("ename")!=null){
		ename = request.getParameter("ename");
	}
	if(request.getParameter("job")!=null){
		job = request.getParameter("job");
	}
	if(request.getParameter("hiredate")!=null){
		hiredate = request.getParameter("hiredate");
	}
	if(request.getParameter("sal")!=null){
		sal = request.getParameter("sal");
	}
	if(request.getParameter("comm")!=null){
		comm = request.getParameter("comm");
	}
	if(request.getParameter("deptno")!=null){
		deptno = request.getParameter("deptno");
	}
	Map<String,Object> pMap = new HashMap<String,Object>();
	pMap.put("empno", empno);
	pMap.put("ename", ename);
	pMap.put("job", job);
	pMap.put("hiredate", hiredate);
	pMap.put("sal", sal);
	pMap.put("comm", comm);
	pMap.put("deptno", deptno);
	SqlMapEmpDao sDao = new SqlMapEmpDao();
	int result = sDao.empINS(pMap);
	if(result==1){
		
		response.sendRedirect("EmpManagerVer8.jsp");
		
	}
	//등록에 실패 했을 때
	else{
		response.sendRedirect("empInsertFail.jsp");
		
	}
	/* if(result ==1 ){
		out.print("성공");
	}else{
		out.print("실패");
	} */

%>
