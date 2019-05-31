<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div id="nav-lower">
	<div id="nav-logo">
		<a href="https://www.daelim.ac.kr"><img class="logo" src="/res/img/daelim_logo.gif" alt="로고" /></a> 
		<a href="/"><img class="text-logo" src="/res/img/text_logo.png" alt="텍스트 로고" /></a>
	</div>

	<div id="nav-menu">
		<ul id="nav-list">
			<li><a href="/intro">소개</a></li>
			<li><a href="/project">프로젝트 보기</a></li>
		
			<li><a href="/notice/list">공지사항</a></li>
		
			<li><a href="/faq">FAQ</a></li>
			
			<sec:authorize access="hasAuthority('ROLE_admin')">
				<li><a href="/user/management">사용자 관리</a></li>
			</sec:authorize>
		</ul>
	</div>

</div>