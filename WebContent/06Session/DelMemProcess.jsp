<%@page import="membership.MemberDAO"%>
<%@page import="membership.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../08Board/IsLoggedIn.jsp" %>
<%
String id = request.getParameter("id");
MemberDTO dto = new MemberDTO();
MemberDAO dao = new MemberDAO(application);
dto=dao.selectView(id);
// 로그인된 사용자 ID 얻기
String sessionId = session.getAttribute("UserId").toString();
int delResult = 0;
if(sessionId.equals("kkw")) {
	dto.setId(id);
	delResult=dao.deleteMember(dto);	// 삭제 진행
	dao.close();
	// 성공/실패 처리
	if(delResult==1) {
		JSFunction.alertLocation("삭제되었습니다.", "Admin.jsp", out);
	} else {
		JSFunction.alertBack("삭제에 실패하였습니다.", out);
	}
} else {	
	JSFunction.alertBack("관리자만 삭제할 수 있습니다.", out);
	return;
}
%>