<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" import="common.Person"%>
<%-- common.Person 임포트로 외부파일 연결 --%>
<%
// pageContext 객체를 통해 page 영역에 속성값을 저장
pageContext.setAttribute("pageInteger", 1000);
// 객체가 아닌 기본타입 int는 wrapper 클래스로 자동 박싱 된다.
pageContext.setAttribute("pageString", "페이지 영역의 문자열");
pageContext.setAttribute("pagePerson", new Person("한석봉", 99));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PageContextMain</title>
</head>
<body>
	<%
	// 모든 속성에 Object 타입으로 저장되어 있으므로 강제 타입 변환 필요
	int pInteger = (Integer) (pageContext.getAttribute("pageInteger"));
	String pString = pageContext.getAttribute("pageString").toString();
	// String 타입의 경우 toString() 메서드를 통해 문자열로 변환하여 출력
	Person pPerson = (Person) (pageContext.getAttribute("pagePerson"));
	%>
	<ul>
		<li>Integer 객체 : <%=pInteger%></li>
		<li>String 객체 : <%=pString%></li>
		<li>Person 객체 : <%=pPerson.getName()%>, <%=pPerson.getAge()%></li>
	</ul>
	<h2>include 된 파일에서 page 영역 읽어오기</h2>
	<%@ include file ="PageInclude.jsp" %>
	<%-- include 지시어로 다른 jsp 파일을 포함 --%>
	<h2>페이지 이동 후 page 영역 읽어오기</h2>
	<a href="PageLocation.jsp">PageLocation.jsp 바로가기</a>
	<%-- a 태그로 감싼 링크를 클릭하면 다른 페이지로 이동
	이전 페이지에서 만든 page 영역이 소멸되는지 확인 --%>
</body>
</html>