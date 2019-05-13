<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
                                        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8"/>
	<title>회원가입</title>
</head>
<body>
<div>
	<h2>회원가입</h2>
	<form action={"/register"} value="register" method="post">
		
		<div><label>아이디 : <input type="text" name="id" placeholder="학번" required="required"/></label></div>
		<div><label>비밀번호 : <input type="password" name="pw" placeholder="암호" required="required"/></label></div>
		<div><label>이름 : <input type="text" name="name" placeholder="이름" required="required"/></label></div>
		<div><label>메일 <input type="text" name="mail" placeholder="암호" required="required"/></label></div>
		<div><label>연락처 <input type="text" name="hp" placeholder="암호" required="required"/></label></div>
		<input type="submit" value="회원가입"/>
	</form>
	
</div>
</body>
</html>