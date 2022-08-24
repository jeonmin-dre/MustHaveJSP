<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 - request</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String sex = request.getParameter("sex");
	String[] fav = request.getParameterValues("fav");
	String favStr = "";
	if (fav != null) {
		for (int i = 0; i < fav.length; i++) {
			favStr += fav[i] + " ";
		}
	}
	String intro = request.getParameter("intro").replace("\r\n", "<br>");
	%>
	<ul>
		<li>아이디 : <%= id %></li>
		<li>성별 : <%= sex %></li>
		<li>관심사항 : <%= favStr %></li>
		<li>자기소개 : <%= intro %></li>	
	</ul>
</body>
</html>