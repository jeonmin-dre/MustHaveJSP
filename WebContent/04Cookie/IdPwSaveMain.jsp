<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="utils.CookieManager"%>
<%
String loginId = CookieManager.readCookie(request, "loginId");
// CookieManager 클래스에 readCookie 메서드를 활용하여 이름이 loginId인 쿠키를 읽어와
// loginId 변수에 저장 -> 아이디가 있다면 아이디 입력폼에 기본값으로 쓰임
String cookieIdCheck = ""; // cookieCheck 변수 생성
if (!loginId.equals("")) { // loginId에 빈 문자열 외의 문자열을 저장했다면
	cookieIdCheck = "checked"; // cookieCheck에 checked가 대입된다.
	// [아이디 저장하기] 체크박스에 checked 속성을 부여한다.
}
String loginPw = CookieManager.readCookie(request, "loginPw");
String cookiePwCheck = ""; 
if (!loginPw.equals("")) { 
	cookiePwCheck = "checked"; 
}
String loginIdPw = CookieManager.readCookie(request, "loginIdPw");
String cookieIdPwCheck = ""; 
if (!loginPw.equals("") && !loginId.equals("")) { 
	cookieIdPwCheck = "checked"; 
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie - 아이디 저장하기</title>
</head>
<body>
	<h2>로그인 페이지</h2>
	<form action="IdPwSaveProcess.jsp" method="post">	
	<%-- IdSaveProcess.jsp로 POST 방식으로 전송 --%>
		아이디 : <input type="text" name="user_id" value="<%=loginId%>" /> 
		<input type="checkbox" name="saveid_check" value="Y" <%=cookieIdCheck%> />
		아이디 저장하기<br>		
		패스워드 : <input type="text" name="user_pw" value="<%=loginPw%>"/>
		<input type="checkbox" name="savepw_check" value="Y" <%=cookiePwCheck%> />
		패스워드 저장하기<br>   
		<input type="checkbox" name="saveidpw_check" value="Y" <%=cookieIdPwCheck%> />
		아이디 & 패스워드 저장하기<br>   
		<input type="submit" value="로그인하기" />
	</form>
</body>
</html>