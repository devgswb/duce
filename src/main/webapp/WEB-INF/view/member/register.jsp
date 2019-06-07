<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>대림대학교 캡스톤 전시관 - 회원가입</title>
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
            <c:if test="${!empty error}">
                <div class="alert-box-wrapper">
                    <div class="alert alert-danger" role="alert" id="isPwdSame">
                        <i class="material-icons">error</i>
                            ${error}
                    </div>
                </div>
            </c:if>
            <div class="member-area">
                <form action="/register" id="register" method="post">
                    <p class="form-group">
                        <label for="usr" class="login-text">ID(학번)</label><input
                            type="text" class="form-control signin-textbox" placeholder="학번(201230232)"
                            pattern="[0-9]{4,14}$"
                            oninput="setCustomValidity('');
                                checkValidity();
                                setCustomValidity(validity.valid ? '' :'올바른 학번을 입력해주세요.');"
                            id="usr" name="id" required>
                    </p>
                    <p class="form-group">
                        <label for="pwd" class="login-text">비밀번호</label><input
                            type="password" class="form-control signin-textbox"
                            pattern="^.*(?=^.{6,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$"
                            oninput="setCustomValidity('');
                                     checkValidity();
                                  setCustomValidity(validity.valid ? '' :'숫자, 영문자, 특수문자가 포함된 6자 이상 15자 미만의 비밀번호로 입력해주세요.');"
                            id="pwd" name="password" required>
                    </p>
                    <p class="form-group">
                        <label for="pwdcheck" class="login-text">비밀번호 확인</label><input
                            type="password" class="form-control signin-textbox"
                            oninput="check(this)"
                            id="pwdcheck" required>
                    </p>
                    <p class="form-group">
                        <label for="name" class="login-text">이름</label><input type="text"
                                                                              class="form-control signin-textbox"
                                                                              pattern="^[가-힣]{2,}$"
                                                                              oninput="setCustomValidity('');
                                     checkValidity();
                                  setCustomValidity(validity.valid ? '' :'2자 이상의 한글 이름을 입력해주세요.');"
                                                                              id="name" name="name" required>
                    </p>
                    <p class="form-group">
                        <label for="email" class="login-text">e-mail</label><input
                            type="email" class="form-control signin-textbox"
                            pattern="^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$"
                            oninput="setCustomValidity('');
                                     checkValidity();
                                  setCustomValidity(validity.valid ? '' :'올바른 이메일 양식대로 입력해주세요.');"
                            id="email" name="mail"
                            placeholder="example@bar.com" required>
                    </p>
                    <p class="form-group">
                        <label for="tel" class="login-text">연락처</label><input type="tel"
                                                                              placeholder="010-1111-1111" class="form-control signin-textbox"
                                                                              pattern="^\d{3}-\d{3,4}-\d{4}$"
                                                                              oninput="setCustomValidity('');
                                     checkValidity();
                                  setCustomValidity(validity.valid ? '' :'올바른 연락처 번호를 입력해주세요.');"
                                                                              id="tel" name="hp" required>
                    </p>
                    <p class="member-btn-area">
                        <button type="submit"
                                class="mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined"
                        id="submit">
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
<script>
    function validatePassword() {
        let pass1 = document.getElementById("pwd").value;
        let pass2 = document.getElementById("pwdcheck").value;
        pass1 != pass2 ? document.getElementById("pwdcheck").setCustomValidity("비밀번호가 일치하지 않습니다.") : document.getElementById("pwdcheck").setCustomValidity('');
    }
    document.getElementById("submit").onclick = validatePassword;
</script>
</html>