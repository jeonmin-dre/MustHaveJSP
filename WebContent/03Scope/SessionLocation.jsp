<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SessionLocation</title>
</head>
<body>
<h2>페이지 이동 후 session 영역의 속성 읽기</h2>
<%
ArrayList<String> lists 
	= (ArrayList<String>)session.getAttribute("lists");
// 세션을 통해서 ArratList 객체 lists 값이 넘어온다.
for (String str: lists) out.print(str+"<br>");	// 출력문
%>
</body>
</html>