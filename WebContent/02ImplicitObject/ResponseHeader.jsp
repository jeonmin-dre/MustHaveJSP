<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
// 응답 헤더에 추가할 값 준비
SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm");
// 날짜 포맷 형식을 정한다.  
long add_date = s.parse(request.getParameter("add_date")).getTime();
// 문자열(날짜)을 날짜 포맷으로 변환

java.sql.Date date2 = new java.sql.Date(add_date);
// add_date로 넘어온 값을 날짜로만 추출
System.out.println(date2);

int add_int = Integer.parseInt(request.getParameter("add_int"));
// ResponseMain.jsp에서 넘어온 문자열(숫자)을 int로 변경하여 add_int에 넣는다.
String add_str = request.getParameter("add_str");
// ResponseMain.jsp에서 넘어온 문자열을 add_str에 넣는다.

// 응답 헤더에 값 추가
response.addDateHeader("myBirthday", add_date);
// 포맷 형식으로 넘어온 날짜를 myBirthday 헤더 값으로 추가
response.addIntHeader("myNumber", add_int);
// myNumber로 8282 값을 추가한다.
response.addIntHeader("myNumber", 1004); // 추가
// myNumber로 1004 값을 추가한다.
response.addHeader("myName", add_str);
// myName으로 홍길동 값을 추가한다.
response.setHeader("myName", "안중근"); // 수정
// myName 값이 안중근으로 변경된다.
%>

<html>
<head>
<title>내장 객체 - response</title>
</head>
<body>
	<h2>응답 헤더 정보 출력하기</h2>
	<%
	Collection<String> headerNames = response.getHeaderNames();
	for (String hName : headerNames) {
		String hValue = response.getHeader(hName);
	%>
	<li><%=hName%> : <%=hValue%></li>
	<%
	}
	%>

	<h2>myNumber만 출력하기</h2>
	<%
	Collection<String> myNumber = response.getHeaders("myNumber");
	for (String myNum : myNumber) {
	%>
	<li>myNumber:<%=myNum%></li>
	<%
	}
	%>
</body>
</html>