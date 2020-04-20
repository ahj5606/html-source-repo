<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!//디클러레이션
//싱글톤으로 관리(서블릿-newsData_jsp.java->HttpServlet - 이 객체는 계속 유지됨 - 새로고침을 당해도 )
	int x =1; //전역변수 이다.
	public String newsList(String news[]){
		StringBuilder sb = new StringBuilder();
		sb.append("<table width='500px' border='1'");
		sb.append("<tr><td><a href='"+news[2]+"'>"+news[0]+">"+news[1]+"</a></td></tr>");
		sb.append("</table>");
		return sb.toString();
	}
%>
<%
//스크립틀릿 스크립틀릿에 선언한 변수는 지역변수 이다.
	String news1[] ={"연합뉴스","카카오, 2020년 상반기 채용연계 인턴 모집","https://news.naver.com/main/read.nhn?mode=LSD&mid=shm&sid1=105&oid=293&aid=0000027754"};
	String news2[] ={"연합뉴스","넷마블 북미 자회사 카밤, 시작 ‘디즈니 미러 가디언즈’ 개발","https://news.naver.com/main/read.nhn?mode=LSD&mid=shm&sid1=105&oid=009&aid=0004559903"};
	String news3[] ={"연합뉴스","KT, 조선대 손잡고 'AI 치매 조기 진단' 플랫폼 만든다","https://news.naver.com/main/read.nhn?mode=LSD&mid=shm&sid1=105&oid=025&aid=0002994218"};
	String news4[] ={"연합뉴스","“코로나19 바이러스, 60℃ 열을 1시간 가해도 안 죽는다”","https://news.naver.com/main/ranking/read.nhn?mid=etc&sid1=111&rankingType=popular_day&oid=081&aid=0003083802&date=20200420&type=1&rankingSeq=5&rankingSectionId=105"};
	String news5[] ={"연합뉴스","코로나19 확진자 13명 늘어 1만674명…서울 47일만에 0명(종합)","https://news.naver.com/main/read.nhn?mode=LSD&mid=shm&sid1=100&oid=001&aid=0011559000"};
	//화면에 내보내 질 코드 담기
	String datas = "";
	switch(x){
	case 1:
		datas=newsList(news1);
		x++;
		break;
	case 2:
		datas=newsList(news2);
		x++;
		break;
	case 3:
		datas=newsList(news3);
		x++;
		break;
	case 4:
		datas=newsList(news4);
		x++;
		break;
	case 5:
		datas=newsList(news5);
		x=1;
		break;
	}
	out.clear();
	out.print(datas);
%>