<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<sec:authorize access="isAuthenticated()">
	<script>
		alert('이미 로그인 되어있습니다!');
		window.history.back();
	</script>
</sec:authorize>
<script>
function showFindId(){
		window.open("/findid", "findid", "width=500, height=230, left=600, top = 300");
	}
function showFindPass(){
	window.open("/passwordfind", "findid", "width=500, height=230, left=600, top = 300");
}
</script>
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
		<div class="con">
			<div class="login-wrapper">
				<div class="login-con">
					로그인
					<hr />
				</div>
				<div class="login-area">
					<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
						<span>
							<p>로그인에 실패하였습니다.</p>
							<p>[에러]</p>
							<p>${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</p>
						</span>
					</c:if>
					<form action="/login" method="post">
						<p class="form-group">
							<label for="usr" class="login-text">계정 ID</label><input
								type="text" name="id" class="form-control login-textbox"
								id="usr" required>
						</p>
						<p class="form-group">
							<label for="pwd" class="login-text">비밀번호</label><input
								type="password" name="password"
								class="form-control login-textbox" id="pwd" required>
						</p>
						<p class="login-btn-area">
							<button
								class="mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined ">
								로그인</button>
							<a href="/register"
								class="mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined ">회원가입</a>
						</p>
					</form>
					<p class="login-search-area">
						<button class="mdl-button mdl-js-button mdl-js-ripple-effect"
							onclick="showFindId()">계정 찾기</button>
						<button class="mdl-button mdl-js-button mdl-js-ripple-effect"
							onclick="showFindPass()">비밀번호
							찾기</button>
					</p>
				</div>
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
<!--&lt;!&ndash; &lt;!&ndash;인증 오류 표시영역&ndash;&gt;&ndash;&gt;-->
<!--&lt;!&ndash;<c:if test="${param.containsKey('error')}">&ndash;&gt;-->
<!--&lt;!&ndash; <span> <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/>&ndash;&gt;-->
<!--&lt;!&ndash; </span>&ndash;&gt;-->
<!--&lt;!&ndash;</c:if>&ndash;&gt;-->

<!--<c:url var="loginUrl" value="/login"/>-->
<!--<form action="${loginUrl}" method="POST">-->
<!-- <div>-->
<!-- <label> ID : <input type="text" name="id" placeholder="학번" /></label>-->
<!-- </div>-->
<!-- <div>-->
<!-- <label> Password : <input type="text" name="pw" /></label>-->
<!-- </div>-->
<!-- <input type="hidden" name="${_csrf.parameterName}"-->
							<!-- value="${_csrf.token}" />-->
							<!-- <button type="submit" class="btn">Login</button>-->
							<!--</form>-->
							<!--</body>-->
							<!--</html>-->