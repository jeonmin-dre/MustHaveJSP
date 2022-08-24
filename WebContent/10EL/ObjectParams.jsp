<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ObjectParams</title>
</head>
<body>
<% 
request.setAttribute("personObj", new Person("홍길동",33));
request.setAttribute("stringObj", "나는 문자열");
request.setAttribute("integerObj", new Integer(99));
// Person 객체, 문자열 객체, 정수형 포장객체를 생성 후 request 영역에 저장
%>
<jsp:forward page="ObjectResult.jsp" >
	<jsp:param value="10" name="firstNum" />
	<jsp:param value="20" name="secondNum" />
</jsp:forward>
</body>
</html>