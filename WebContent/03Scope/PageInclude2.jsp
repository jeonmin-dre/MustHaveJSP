<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="common.Person"%>
<h4>Include 페이지</h4>
<%
int pInteger2 = (Integer) (pageContext.getAttribute("pageInteger"));
Person pPerson2 = (Person) (pageContext.getAttribute("pagePerson"));
%>
<ul>
	<li>Integer 객체 : <%=(Integer) (pageContext.getAttribute("pageInteger"))%></li>
	<li>String 객체 : <%=pageContext.getAttribute("pageString")%></li>
	<li>Person 객체 : <%=((Person) (pageContext.getAttribute("pagePerson"))).getName()%>, 
	<%=((Person) (pageContext.getAttribute("pagePerson"))).getAge()%></li>
</ul>

