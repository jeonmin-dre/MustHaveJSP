<%@page import="utils.BoardPage"%>
<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ include file="../08Board/IsLoggedIn.jsp" %>
    <%
MemberDAO dao = new MemberDAO(application);

Map<String, Object> param = new HashMap<>();
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");
if (searchWord != null) {
	param.put("searchField", searchField);
	param.put("searchWord", searchWord);
}
int totalCount = dao.selectCount(param);
//전체 페이지 수 계산
int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
int totalPage = (int)Math.ceil((double)totalCount/pageSize);	// 전체 페이지 수
//현재 페이지 확인
int pageNum=1;
String pageTemp=request.getParameter("pageNum");
if (pageTemp!=null && !pageTemp.equals("")) {
	pageNum=Integer.parseInt(pageTemp);	// 요청받은 페이지로 수정	
}
//목록에 출력할 게시물 범위 계산
int start = (pageNum-1)*pageSize+1;	// 첫 게시물 번호
int end = pageNum * pageSize;
param.put("start", start);
param.put("end", end);
List<MemberDTO> memberLists = dao.selectListPage(param);
String sessionId = session.getAttribute("UserId").toString();
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 페이지</title>
</head>
<body>
	<jsp:include page="../Common/Link.jsp" />
	<h2>목록 보기</h2>
	<form method="get">
		<table border="1" width="90%">
			<tr>
				<td align="center">
					<select name="searchField">
						<option value="id">id</option>
						<option value="name">이름</option>
					</select>
					<input type="text" name="searchWord" /> 
					<input type="submit" value="검색하기" />
				</td>
			</tr>
		</table>
	</form>
	<table border="1" width="90%">
	<tr>
			<th width="10%">번호</th>
			<th width="25%">ID</th>
			<th width="25%">이름</th>
			<th width="40%">가입일</th>
		</tr>
		<% if(memberLists.isEmpty()) {%>
		<tr>
			<td colspan="5" align="center">가입된 회원이 없습니다.</td>
		</tr>
		<% } else { 
		int virtualNum = 0;
		int countNum = 0;
		for (MemberDTO dto : memberLists) {
			// virtualNum = totalCount--;
			virtualNum = totalCount - (((pageNum-1)*pageSize)+countNum++);
			%>
		<tr align="center">
			<td><%= virtualNum %></td>
			<td align="center"><a href="Member.jsp?id=<%=dto.getId() %>"><%=dto.getId() %></a></td>			
			<td align="center"><%=dto.getName() %></td>
			<td align="center"><%=dto.getRegidate() %></td>
		</tr>
		<%
			}
		}
		%>
	</table>
	<table border="1" width="90%">
		<tr align="center">
			<td>
			<%=BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, request.getRequestURI()) %>
			</td>
		</tr>
	</table>
</body>
</html>