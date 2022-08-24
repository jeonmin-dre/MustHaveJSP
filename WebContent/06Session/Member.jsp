<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../08Board/IsLoggedIn.jsp" %>
    <%
String id = request.getParameter("id");
MemberDAO dao = new MemberDAO(application);
MemberDTO dto = dao.selectView(id);
String sessionId = session.getAttribute("UserId").toString();
if (!sessionId.equals("kkw")) {
	JSFunction.alertBack("관리자만 접근할 수 있는 페이지입니다.", out);
	return;
}
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
<script>
	function deleteMember() {
		var confirmed = confirm("정말로 삭제하시겠습니까?");
		if (confirmed) {
			var form = document.memberFrm;
			form.method = "post";
			form.action = "DelMemProcess.jsp";
			form.submit();
		}
	}
</script>
</head>
<body>
	<jsp:include page="../Common/Link.jsp" />
		<h2>회원 상세 보기</h2>
		<form name="memberFrm">				
			<table border="1" width="90%">
				<tr>
					<td align="center">아이디</td>
					<td align="center">패스워드</td>
					<td align="center">이름</td>
					<td align="center">가입일</td>
				</tr>
				<tr>
					<td align="center"><%= dto.getId() %></td>
					<td align="center">********<input type="hidden" name="pass" value="<%= dto.getPass() %>" /></td>
					<td align="center"><%= dto.getName() %></td>
					<td align="right"><%= dto.getRegidate() %></td>
				</tr>
				<tr>
					<td colspan="4" align="center">
						<button type="button" onclick="location.href='EditMem.jsp?id=<%=dto.getId()%>';">회원정보 수정하기</button>
						<button type="button" onclick="location.href='DelMemProcess.jsp?id=<%=dto.getId()%>';">회원정보 삭제하기</button>
						<button type="button" onclick="location.href='Admin.jsp';">목록 보기</button>
					</td>
				</tr>
			</table>
		</form>
</body>
</html>