<%@page import="membership.MemberDAO2"%>
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
	request.setCharacterEncoding("UTF-8");
	String userId = request.getParameter("id");
	String userPwd = request.getParameter("pw");
	String userName = request.getParameter("name");
	String userYear = request.getParameter("year");
	String userMonth = request.getParameter("month");
	String userDay = request.getParameter("day");
	String userBirth = userYear+"-"+userMonth+"-"+userDay;
	String userEmail = request.getParameter("email");
	String userPhone = request.getParameter("phone");
	
	String oracleDriver = application.getInitParameter("OracleDriver");
	String oracleURL = application.getInitParameter("OracleURL");
	String oracleId = application.getInitParameter("OracleId");
	String oraclePwd = application.getInitParameter("OraclePwd");

	MemberDAO2 dao = new MemberDAO2(oracleDriver, oracleURL, oracleId, oraclePwd);
	
	String sql = "INSERT INTO member2 VALUES (?, ?, ?, ?, ?, ?)";
	PreparedStatement psmt = dao.con.prepareStatement(sql);
	psmt.setString(1, userId);
	psmt.setString(2, userPwd);
	psmt.setString(3, userName);	
	psmt.setString(4, userBirth);	
	psmt.setString(5, userEmail);	
	psmt.setString(6, userPhone);	
	
	// 쿼리 수행
	int inResult = psmt.executeUpdate();
	out.println(inResult +"행이 입력되었습니다.");
	
	// 연결 닫기
	dao.close();
	request.setAttribute("LoginErrMsg", "가입하신 아이디와 비밀번호로 로그인해주세요.");
	
	request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
	%>
</body>
</html>