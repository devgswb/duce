<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@page import="kr.ac.duce.*"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="utf-8" />
<title>사용자 관리</title>

<script>
	
</script>
</head>
<body>
	<div>
		<h2>사용자 관리</h2>
		<form action="/user/management.dos" method="post">

			<table>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>메일</th>
					<th>연락처</th>
					<th>권한</th>
					<th>권한 변경</th>

			
					<th>계정 상태</th>
					<th>계정 잠금 설정</th>
					

					<th></th>
				</tr>

				<c:forEach var="lists" items="${list}">
					<input type="hidden" name="id" value="${lists.id}">
					<input type="hidden" name="authority" value="">
					<tr>
						<td name="id">${lists.id}</td>
						<td>${lists.name}</td>
						<td>${lists.mail}</td>
						<td>${lists.hp}</td>
						<td>${lists.authority}</td>
						<td><SELECT id="authoritySelect" name="authoritySelect" onchange="">
								<!-- <c:out value="${cri.searchType == 'user' ? 'selected' : ''}  "/> -->	
								<OPTION value="user"<c:if test="${lists.authority eq 'user'}"> selected </c:if>>User</OPTION>
								<OPTION value="anonymous"
									<c:if test="${lists.authority eq 'anonymous'}"> selected </c:if>>Anonymous</OPTION>
								<OPTION value="admin"
									<c:if test="${lists.authority eq 'admin'}"> selected </c:if>>Admin</OPTION>
						</SELECT></td>
		
						<td>
							<c:if test="${lists.isEnabled eq 1}">활성화</c:if>
						    <c:if test="${lists.isEnabled eq 0}">비활성화</c:if></td>
						<td>
							<SELECT name="isEnabled">
								<OPTION value="false" <c:if test="${lists.isEnabled eq 1}"> selected </c:if>>활성화</OPTION>
								<OPTION value="true" <c:if test="${lists.isEnabled eq 0}"> selected </c:if>>비활성화</OPTION>
							</SELECT>
						</td>

						<td><a href="/user/management"  action="/user/management.do">수정</a></td>
					</tr>
				</c:forEach>
				
			</table>
			<a href="/">뒤로가기</a>
		</form>

	</div>
</body>
</html>
