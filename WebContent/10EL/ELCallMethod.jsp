<%@page import="el.MyELClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="mytag" uri="/WEB-INF/MyTagLib.tld" %>
<%
MyELClass myclass = new MyELClass(); // 객체 생성
pageContext.setAttribute("myClass", myclass); // page 영역에 저장
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ELCallMethod</title>
</head>
<body>
<h3>TLD 파일 등록 후 정적 메서드 호출하기</h3>
<ul>
<li>mytag:isNumber("100") -> ${ mytag:isNumber("100") }</li>
<li>mytag:isNumber("삼백") -> ${ mytag:isNumber("삼백") }</li>
</ul>
<h3>영역에 저장 후 메서드 호출하기</h3>
123456-3456789 -> ${ myClass.getGender("123456-3456789") }<br/>
123456-4321987 -> ${ myClass.getGender("123456-4321987") }<br/>
<h3>클래스명을 통해 정적 메서드 호출하기</h3>
${ MyELClass.showGugudan(7) }


</body>
</html>