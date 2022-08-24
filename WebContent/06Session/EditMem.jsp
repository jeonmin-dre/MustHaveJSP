<%@page import="membership.MemberDAO"%>
<%@page import="membership.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="utils.JSFunction"%>
<%@ include file="../08Board/IsLoggedIn.jsp"%>
<%
String id = request.getParameter("id");
MemberDAO dao = new MemberDAO(application);
MemberDTO dto = dao.selectView(id);
String sessionId = session.getAttribute("UserId").toString();
if (!sessionId.equals("kkw")) {
	JSFunction.alertBack("관리자만 수정할 수 있습니다.", out);
	return;
}
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세 보기</title>
</head>
<body>
	<jsp:include page="../Common/Link.jsp" />
	<h2>회원 정보 수정(Edit)</h2>
	<form name="memberFrm" method="post" action="EditMemProcess.jsp" >	
	<input type="hidden" name="id" value="<%= dto.getId() %>" /> 	
		<table border="1" width="90%">
			<tr>
				<td align="center">아이디</td>
				<td align="center">패스워드</td>
				<td align="center">이름</td>
				<td align="center">가입일</td>
			</tr>
			<tr>
				<td align="center"><%=dto.getId()%></td>
				<td align="center">
					<input type="text" name="pass" value="<%=dto.getPass()%>" type="password"
					required="required" pattern="(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}"
					title="8-16자의 영문,숫자,특수기호 조합"/>
				</td>
				<td align="center">
					<input type="text" name="name" value="<%=dto.getName()%>" 
					required="required" pattern="[가-힣a-zA-Z]{2,}" />
				</td>
				<td align="right"><%=dto.getRegidate()%></td>
			</tr>
			<tr>
            <td colspan="4" align="center">
                <button type="submit">수정 완료</button>
                <button type="reset">다시 입력</button>
                <button type="button" onclick="location.href='Admin.jsp';">
                    목록 보기</button>
            </td>
        </tr>
		</table>
	</form>
</body>
</html>