<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<jsp:include page="../header-nav.jsp"/>
<!-- Navigation Bar -->
<article>
    <div class="con">
        <div class="member-wrapper">
            <div class="member-con">
                회원가입
                <hr/>
            </div>
            <div class="member-area">
                <form action="/register" method="post">
                    <p class="form-group">
                        <label for="usr" class="login-text">계정 ID</label><input
                            type="text" class="form-control signin-textbox" placeholder="학번(201230232)"
                            id="usr" name="id" required>
                    </p>
                    <p class="form-group">
                        <label for="pwd" class="login-text">비밀번호</label><input
                            type="password" class="form-control signin-textbox" id="pwd" name="password" required>
                    </p>
                    <p class="form-group">
                        <label for="pwdcheck" class="login-text">비밀번호 확인</label><input
                            type="password" class="form-control signin-textbox" id="pwdcheck" required>
                    </p>
                    <p class="form-group">
                        <label for="name" class="login-text">이름</label><input type="text"
                            class="form-control signin-textbox" id="name" name="name" required>
                    </p>
                    <p class="form-group">
                        <label for="email" class="login-text">e-mail</label><input
                            type="email" class="form-control signin-textbox" id="email" name="mail"
                            placeholder="example@bar.com" required>
                    </p>
                    <p class="form-group">
                        <label for="tel" class="login-text">연락처</label><input type="tel"
                          placeholder="010-1111-1111" class="form-control signin-textbox" id="tel" name="hp" required>
                    </p>
                    <p class="member-btn-area">
                        <button
                                class="mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined">
                            가입
                        </button>
                        <a href="${header.referer}"
                           class="mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined">취소</a>
                    </p>
                </form>
            </div>
        </div>
    </div>
    <!-- contents box -->
</article>
<jsp:include page="../footer.jsp"/>
<!-- footer -->
</body>
</html>
<!--
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
-->