<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="common.Person"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ApplicationResult</title>
</head>
<body>
<h2>application 영역의 속성 읽기</h2>
<%
Map<String, Person> maps 
	= (Map<String, Person>) application.getAttribute("maps");
// 따옴표 안 maps는 Main에서 넘어온 application 객체이므로 강제타입 변환이 필요
Set<String> keys = maps.keySet();	// 컬렉션의 key를 알아낸다.
for(String key:keys) {	// keys에 있는 값을 반복적으로 출력하기 위한 구문
	Person person = maps.get(key);	// key값에 해당하는 Person 객체 추출
	out.print(String.format("이름 : %s, 나이 : %d<br>", 
			person.getName(), person.getAge()));	
	// 포맷에 따라 출력
}
%>
</body>
</html>