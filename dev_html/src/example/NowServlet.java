package example;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NowServlet extends HttpServlet{
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException{
		response.setContentType("text/html; charset=utf-8"); 
		String temp = request.getParameter("id");
		PrintWriter out = response.getWriter();
		out.print("현재시간은"+new Date()+"입니다.<br>");
		out.print(temp);
	}
	
}
