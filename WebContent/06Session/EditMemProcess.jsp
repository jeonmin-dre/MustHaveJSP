<%@page import="utils.JSFunction"%>
<%@page import="membership.MemberDAO"%>
<%@page import="membership.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../08Board/IsLoggedIn.jsp" %>
    <%
    String id = request.getParameter("id");
    String pass = request.getParameter("pass");    
    String name = request.getParameter("name");    
    
    MemberDTO dto = new MemberDTO();
    dto.setId(id);
    dto.setPass(pass);
    dto.setName(name);
    
    MemberDAO dao = new MemberDAO(application);
    int affected = dao.updateMember(dto);
    dao.close();
    
    if (affected == 1) {
    	response.sendRedirect("Member.jsp?id=" + dto.getId());
    } else {
    	JSFunction.alertBack("수정하기에 실패하였습니다.", out);
    }
    %>