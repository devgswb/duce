<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="nav-upper">
	<div id="nav-search">
		<i class="material-icons md-light">search</i>
	</div>
	
	<% System.out.println(request.getSession()); %>
	<div id="nav-member">
	<c:choose>
	
		<c:when test="${empty session}">
					<ul>
						<li><a href="/login">로그인</a></li>
						<li><a href="/register">회원가입</a></li>
					</ul>
		</c:when>
			
		<c:otherwise>
					<ul>
						<li><p>${name}님</p></li>
						<li><a href="/logout">로그아웃</a></li>
					
					</ul>
		</c:otherwise>
	</c:choose>	
	</div>
</div>