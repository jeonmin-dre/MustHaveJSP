<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <script type="text/javascript">
    function validateForm(form) {
      var p1 = form.pw.value;
      var p2 = form.repw.value;
      if( p1 != p2 ) {
        alert("입력하신 비밀번호가 서로 일치하지 않습니다.");
        form.repw.focus();
        return false;
      } 
    }
  </script>
<meta charset="UTF-8">
<title>MemberForm</title>
</head>
<body>
<form name="memberFrm" action="MemberProcess.jsp" method="post" onsubmit="return validateForm(this);">
		<table>
			<tr>
				<td class="label" colspan="3"><label for="id">아이디</label></td>
			</tr>
			<tr>
				<td colspan="3"><input id="id" name="id" type="text"
					required="required" autofocus="autofocus" placeholder="아이디를 입력하세요"
					pattern="[a-z]{1}[a-z0-9]{4,19}"
					title="5-20자의 영문 소문자와 숫자 조합.영문자로만 시작"></td>
			</tr>
			<tr>
				<td class="label" colspan="3"><label for="pw">비밀번호</label></td>
			</tr>
			<tr>
				<td colspan="3"><input id="pw" name="pw" type="password"
					required="required" placeholder="비밀번호를 입력하세요"
					pattern="(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}"
					title="8-16자의 영문,숫자,특수기호 조합"></td>
			</tr>
			<tr>
				<td class="label" colspan="3"><label for="repw">비밀번호
						재확인</label></td>
			</tr>
			<tr>
				<td colspan="3"><input id="repw" name="repw" type="password"
					required="required" placeholder="비밀번호를 재입력하세요"
					pattern="(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}"
					title="8-16자의 영문,숫자,특수기호 조합"></td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td class="label" colspan="3"><label for="name">이름</label></td>
			</tr>
			<tr>
				<td colspan="3"><input id="name" name="name" type="text"
					required="required" pattern="[가-힣a-zA-Z]{2,}"></td>
			</tr>			
			<tr>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3"><input type="submit" value="가입하기"></td>
			</tr>
		</table>
	</form>
</body>
</html>