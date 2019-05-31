<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Duce</title>
<!-- 
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="main.css">
    <script src="main.js"></script>
        -->
<!-- cdn -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<!-- css -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Serif+KR|Titillium+Web"
	rel="stylesheet">
<!-- web font -->
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<!-- material -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<!-- bootstrap4 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!-- script -->
<!-- local css -->
<link rel="stylesheet" href="/res/css/inwork.css">
<!--  page logic -->


</head>
<body>

	<jsp:include page="../header-nav.jsp" />
	<!-- Navigation Bar -->
	<article>
	<c:url var="login" value="/login" />
	
		<div class="con">
			<div class="login-wrapper">
				<div class="login-con">
					로그인
					<hr />
				</div>
				<form action="login.do" method="post">
				<div class="login-area">
					<p class="form-group">
						<label for="usr" class="login-text">계정 ID</label><input
							type="text" class="form-control login-textbox" name ="id" id="usr">
					</p>
					<p class="form-group">
						<label for="pwd" class="login-text">비밀번호</label><input
							type="password" class="form-control login-textbox" name="password" id="pwd">
					</p>
					<p class="login-btn-area">
						<button
							class="mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined ">로그인</button>
						<a href="/register"
							class="mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined ">회원가입</a>
					</p>
					<p class="login-search-area">
						<button class="mdl-button mdl-js-button mdl-js-ripple-effect">계정
							찾기</button>
						<button class="mdl-button mdl-js-button mdl-js-ripple-effect">비밀번호
							찾기</button>
					</p>
					<p>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					</p>
				</div>
				</form>
			</div>
		</div>
		
		<!-- contents box -->
	</article>
	<jsp:include page="../footer.jsp" />
	<!-- footer -->
</body>
</html>
<!-- 기존 코드는 주석 -->
<!--<html>-->
<!--<head>-->
<!--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">-->
<!--<title>Login</title>-->

<!--</head>-->
<!--<body>-->
<!--&lt;!&ndash;	&lt;!&ndash;인증 오류 표시영역&ndash;&gt;&ndash;&gt;-->
<!--&lt;!&ndash;<c:if test="${param.containsKey('error')}">&ndash;&gt;-->
<!--&lt;!&ndash;		<span> <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />&ndash;&gt;-->
<!--&lt;!&ndash;		</span>&ndash;&gt;-->
<!--&lt;!&ndash;</c:if>&ndash;&gt;-->

<!--<c:url var="loginUrl" value="/login" />-->
<!--<form action="${loginUrl}" method="POST">-->
<!--    <div>-->
<!--        <label> ID : <input type="text" name="id" placeholder="학번" /></label>-->
<!--    </div>-->
<!--    <div>-->
<!--        <label> Password : <input type="text" name="password" /></label>-->
<!--    </div>-->
<!--    <input type="hidden" name="${_csrf.parameterName}"-->
<!--           value="${_csrf.token}" />-->
<!--    <button type="submit" class="btn">Login</button>-->
<!--</form>-->
<!--</body>-->
<!--</html>-->