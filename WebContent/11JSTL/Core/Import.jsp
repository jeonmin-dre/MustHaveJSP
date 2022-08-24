<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Import</title>
</head>
<body>
<h4>다른 문서 삽입하기</h4>
<c:set var="requestVar" value="MustHave" scope="request"/>
<c:import url="../Inc/OtherPage.jsp" var="contents">
<c:param name="user_param1" value="JSP"/>
<c:param name="user_param2" value="JSTL"/>
</c:import>
${contents }
<h4>외부 자원 삽입하기</h4>
<%-- <iframe src="../Inc/NaverPage.jsp" style="width: 100%;height: 600px;"></iframe> --%>
<c:import url="https://www.naver.com" />
</body>
</html>