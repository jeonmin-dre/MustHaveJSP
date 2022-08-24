<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="utils.CookieManager"%>
<%@ page import="utils.JSFunction"%>
<%
//폼에 전달된 값을 저장
String user_id = request.getParameter("user_id");
String user_pw = request.getParameter("user_pw");
String saveid_check = request.getParameter("saveid_check");
String savepw_check = request.getParameter("savepw_check");
String saveidpw_check = request.getParameter("saveidpw_check");

if ("dre".equals(user_id) && "1234".equals(user_pw)) {
	// 폼에 있는 값을 비교하여 로그인 성공
	// 로그인 성공 시에만 쿠키 생성과 삭제를 수행한다.
	if (saveid_check != null && saveid_check.equals("Y")) {
		CookieManager.makeCookie(response, "loginId", user_id, 86400);
		// 쿠키를 생성하여 값을 대입한다.
	} else {
		CookieManager.deleteCookie(response, "loginId");
		// 체크가 해제된 상태면 쿠키를 삭제
	}
	if (savepw_check != null && savepw_check.equals("Y")) {
		CookieManager.makeCookie(response, "loginPw", user_pw, 86400);
		// 쿠키를 생성하여 값을 대입한다.
	} else {
		CookieManager.deleteCookie(response, "loginPw");
		// 체크가 해제된 상태면 쿠키를 삭제
	}
	if (saveidpw_check != null && saveidpw_check.equals("Y")) {
		CookieManager.makeCookie(response, "loginId", user_id, 86400);
		CookieManager.makeCookie(response, "loginPw", user_pw, 86400);
		// 쿠키를 생성하여 값을 대입한다.
	} else {
		CookieManager.deleteCookie(response, "loginId");
		CookieManager.deleteCookie(response, "loginPw");
		// 체크가 해제된 상태면 쿠키를 삭제
	}
	JSFunction.alertLocation("로그인에 성공했습니다.", "IdPwSaveMain.jsp", out);
} else { // 로그인 실패 시
	JSFunction.alertBack("로그인에 실패했습니다.", out);
}
%>