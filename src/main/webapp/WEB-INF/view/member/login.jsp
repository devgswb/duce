<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
                                        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Login</title>

</head>
<body>
	<!--
	<!--인증 오류 표시영역-->
	<c:if test="${param.containsKey('error')}">
		<span>
			<c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/>
		</span>
	</c:if>
	-->
	
	<c:url var="loginUrl" value="/login" />
	<form action="${loginUrl}" method="POST">
		<div><label> ID : <input type="text" name="id" placeholder="학번"/></label></div>
		<div><label> Password : <input type="text" name="pw"/></label></div>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<button type="submit" class="btn">Login</button>
	</form>
</body>
</html>