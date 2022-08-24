<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ExeUpdate</title>
</head>
<body>	
	<%	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	
	// 폼값을 DTO객체에 저장
	MemberDTO dto = new MemberDTO();
	dto.setId(id);
	dto.setPass(pw);
	dto.setName(name);
	
	MemberDAO dao = new MemberDAO(application);
	int mResult = dao.addMember(dto);		
	
	// 연결 닫기
	dao.close();
	request.setAttribute("LoginErrMsg", "가입하신 아이디와 비밀번호로 로그인해주세요.");
	
	request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
	%>
</body>
</html>