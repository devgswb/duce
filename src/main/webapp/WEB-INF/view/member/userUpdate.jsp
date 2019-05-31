<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page import="kr.ac.duce.*" %>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta charset="utf-8"/>
	<title>회원정보 수정</title>
	
	<script type="text/javascript">
		

	</script>
</head>
<body>
<div>
	<h2>개인정보 수정</h2>
	<form action="/userUpdate.do" method="post">
		<div><label>아이디 : ${id}</label></div>
		<div><label>비밀번호 : <input type="password" name="password" placeholder="암호" required="required"/></label></div>
		<div><label>이름 : <input type="text" name="name" placeholder="이름" required="required"/>${name}</label></div>
		<div><label>메일 <input type="text" name="mail" placeholder="암호" required="required"/>${mail}</label></div>
		<div><label>연락처 <input type="text" name="hp" placeholder="암호" required="required"/>${hp}</label></div>
		<input type="submit" value="수정" onclick="alert('다시 로그인 해주세요')"/>
	</form>
	
</div>
</body>
</html>