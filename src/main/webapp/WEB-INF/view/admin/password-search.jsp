<%-- 관리자 비밀번호 변경 페이지 --%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="kr.ac.duce.controller.ProjectBoardController" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>대림대학교 캡스톤 전시관 - 관리자 페이지</title>
    <!--
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="main.css">
    <script src="main.js"></script>
        -->
    <!-- css -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR|Titillium+Web" rel="stylesheet">
    <!-- web font -->
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <!-- material -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
    <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    <!-- bootstrap4 -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <!-- script -->
    <!-- local css -->
    <link rel="stylesheet" href="/res/css/inwork.css">
</head>
<body>
<jsp:include page="../header-nav.jsp"/>
<!-- Navigation Bar -->
<article>
    <div class="admin-con">
        <jsp:include page="./admin-tab.jsp"/>
        <div class="mypage-tab-content">
            <div class="admin-title">
                비밀번호 변경
                <hr/>
            </div>
            <div class="alert-box-wrapper">
                <div class="alert alert-danger" role="alert" id="isPwdSame">
                    <i class="material-icons">error</i>
                    비밀번호를 확인해주세요.
                </div>
            </div>
            <div class="form-wrapper">
                <form action="/admin/pwdchange.do" method="post">
                    <div class="form-group">
                        <label for="pwd">현재 비밀번호</label>
                        <input type="password" class="form-control" name="pwd" id="pwd">
                    </div>
                    <div class="form-group">
                        <label for="changedpwd">변경 비밀번호</label>
                        <input type="password" class="form-control"
                               pattern="^.*(?=^.{6,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$"
                               oninput="setCustomValidity('');
                                     checkValidity();
                                  setCustomValidity(validity.valid ? '' :'숫자, 영문자, 특수문자가 포함된 6자 이상 15자 미만의 비밀번호로 입력해주세요.');"
                               name="changedpwd" id="changedpwd">
                    </div>
                    <div class="form-group">
                        <label for="changedpwdchk">비밀번호 확인</label>
                        <input type="password" class="form-control" id="changedpwdchk">
                    </div>
                    <div class="btn-wrapper">
                        <button class="mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined "
                                id="submit">수정
                        </button>
                    </div>
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
    $(document).ready(function () {
        $('.alert-box-wrapper').hide();
    });

    function validatePassword() {
        let pass1 = document.getElementById("changedpwd").value;
        let pass2 = document.getElementById("changedpwdchk").value;
        if (pass1 !== pass2) {
            $('.alert-box-wrapper').show();
            return false;
        } else {
            return true;
        }
    }

    document.getElementById("submit").onclick = validatePassword;
</script>
</html>