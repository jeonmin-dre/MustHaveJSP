<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberForm</title>
</head>
<body>
<form action="MemberProcess.jsp" method="post">
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
				<td class="label" colspan="3"><label for="year">생년월일</label></td>
			</tr>
			<tr>
				<td><input id="year" name="year" type="text"
					required="required" placeholder="년(4자)" pattern="[0-9]{4}">
				</td>
				<td><select id="month" name="month" required="required">
						<option value="">월</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
				</select></td>
				<td><input id="day" name="day" type="text" required="required"
					placeholder="일(1~2자)" pattern="[0-9]{1,2}"></td>
			</tr>
			<tr>
				<td class="label" colspan="3"><label for="gender">성별</label></td>
			</tr>		
			<tr>
				<td class="label" colspan="3"><label for="email">본인 확인
						이메일(선택입력)</label></td>
			</tr>
			<tr>
				<td colspan="3"><input id="email" name="email" type="email"
					placeholder="선택입력"></td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td class="label" colspan="3"><label for="phone">휴대전화</label></td>
			</tr>
			<tr>
				<td><input id="phone" name="phone" type="text"
					pattern="[0-1]{3}[0-9]{4}[0-9]{4}" placeholder="전화번호 입력(숫자만)"></td>
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