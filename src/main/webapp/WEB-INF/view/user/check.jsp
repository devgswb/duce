<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
        <jsp:include page="./user-tab.jsp"/>
        <div class="mypage-tab-content">
            <div class="admin-title">
                비밀번호 변경
                <hr/>
            </div>
            <div class="form-wrapper">
                <form method="post" name="Checking" onsubmit="return userChange()">
                    <c:if test = "${!empty error}">
                        <div class="alert alert-danger" role="alert" id="isPwdSame">
                            <i class="material-icons">error</i>
                                ${error}
                        </div>
                    </c:if>
<%--                    <div class="alert alert-warning none" role="alert">--%>
<%--                        <button type="button" class="close-alert">×</button>--%>
<%--                        <i class="material-icons">info</i>--%>
<%--                        비밀번호가 일치하지 않습니다.--%>
<%--                    </div>--%>
                    <div class="form-group">
                        <label for="pw">현재 비밀번호</label>
                        <input type="password" class="form-control" id="pw"
                               name="pw" placeholder="비밀번호" required>
                    </div>
                    <div class="form-group">
                        <label for="pw">변경 비밀번호</label>
                        <input type="password" class="form-control" id="pwd"
                               name="pwd" placeholder="비밀번호" required>
                    </div>
                    <div class="form-group">
                        <label for="pw">변경 비밀번호 확인</label>
                        <input type="password" class="form-control" id="pwdCo"
                               name="pwdCo" placeholder="비밀번호" required>
                    </div>
                    <div class="btn-wrapper">
                        <button class="mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined "
                                name="id" value="${user.id}">변경
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
<script type="text/javascript">
    function userChange() {
        let pw = document.getElementById("pwd").value;
        let pwOk = document.getElementById("pwdCo").value;
        let change = confirm("변경하시겠습니까?");
        if (change == false) {
            return false;
        }
        if (pw == pwOk) {
            Checking.action = "/user/check.do";
        } else {
            alert("비밀번호가 서로 다릅니다.");
            return false; // 삭제취소
        }
    }
</script>
</html>