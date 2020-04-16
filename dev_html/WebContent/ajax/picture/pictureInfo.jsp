<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//화면이 없어도 단위테스트가 가능해야 함.
//디자이너가 내 페이지를 아직 못 만들었다고 해도 나는 코딩할 수 있다.
//192.168.0.244:8000/dev_html/ajax/pictureInfo.jsp?id=picture2.jpg
	String imgs[] = {"picture1.jpg","picture2.jpg","picture3.jpg","picture4.jpg"};
	String titles[] ={"추상화1","추상화2","추상화3","추상화4"};
	String explains[] ={"추상화1에대한 설명","추상화2에대한 설명","추상화3에대한 설명","추상화4에대한 설명"};
	String img = request.getParameter("id");
	String cimg = null;
	String title =null;
	String explain = null;
	for(int i=0;i<imgs.length;i++){
		if(imgs[i].equals(img)){		
			cimg =imgs[i];
			title = titles[i];
			explain = explains[i];
		}
		
	}
%>
<img src="./<%out.print(cimg);%>" width="400px" height="270px" border="1px">
<br>
<hr>
제목 : <%out.print(title);%>
<br>
<hr>
설명 : <%out.print(explain);%>
<hr>
