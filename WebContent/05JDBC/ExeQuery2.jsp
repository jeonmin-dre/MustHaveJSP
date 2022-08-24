<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.DBConnPool"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>board 테이블 조회</h2>
<%
DBConnPool pool = new DBConnPool();

String sql = "SELECT num, title, content, id, postdate, visitcount FROM BOARD";
Statement stmt = pool.con.createStatement(); // 쿼리문 생성

ResultSet rs = stmt.executeQuery(sql); // 쿼리문 수행
while (rs.next()) { // ResultSet은 결과의 집합이기 때문에 next()로 가져옴
	int num = rs.getInt(1);
	String title = rs.getString(2);
	String content = rs.getString(3);
	String id = rs.getString("id");
	java.sql.Date postdate = rs.getDate("postdate");
	int vcount = rs.getInt(6);

	out.println(String.format("%d %s %s %s %s %d+<br>", num, title, content, id, postdate, vcount));
	// ResultSet에 있는 데이터를 한줄씩 가져와서 출력하고 줄 바꿈
}

pool.close();
%>
</body>
</html>