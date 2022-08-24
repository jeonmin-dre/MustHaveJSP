<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.DBConnPool"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>board 테이블 행 추가</h2>
	<%
	DBConnPool pool = new DBConnPool();
	String title = "게시물 제목";
	String content = "본문 내용";
	String id = "test1";
	int visitcount = 0;
	String sql = "INSERT INTO board VALUES (SEQ_BOARD_NUM.NEXTVAL, ?, ?, ?, SYSDATE, ?)";
	PreparedStatement psmt = pool.con.prepareStatement(sql);
	psmt.setString(1, title);
	psmt.setString(2, content);
	psmt.setString(3, id);
	psmt.setInt(4, visitcount);

	int inResult = psmt.executeUpdate();
	out.println(inResult + "행이 입력되었습니다.");

	pool.close();
	%>
</body>
</html>