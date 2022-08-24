<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CookieResult</title>
</head>
<body>
	<%
	Cookie[] cookies = request.getCookies(); // 요청 헤더의 모든 쿠키 얻기
	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) { // 쿠키 각각의 반복문
			String cookieName = cookies[i].getName(); // 쿠키 이름 얻기
			String cookieValue = cookies[i].getValue(); // 쿠키 값 얻기
			out.println(String.format("쿠키명 : %s - 쿠키값 : %s<br>", cookieName, cookieValue));
			// 쿠키의 이름과 값을 반복 출력
		}
	}
	%>
</body>
</html>