<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberAuth</title>
</head>
<body>
<h2>MVC패턴으로 회원인증하기</h2>
<p><strong>${authMessage }</strong></p><br/>
<a href="./MemberAuth.mvc?id=mit&pass=1234">회원인증(관리자)</a><br/>
<a href="./MemberAuth.mvc?id=kkw2&pass=12345">회원인증(일반회원)</a><br/>
<a href="./MemberAuth.mvc?id=cloud&pass=1234">회원인증(비회원)</a><br/>
</body>
</html>