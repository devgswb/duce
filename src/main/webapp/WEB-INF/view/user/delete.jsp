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
                회원 탈퇴
                <hr/>
            </div>
            <div class="form-wrapper">
                <form method="post" name="Delete" onsubmit="return userFDelete()">
                    <c:if test = "${!empty error}">
                        <div class="alert alert-danger" role="alert" id="isPwdSame">
                            <i class="material-icons">error</i>
                                ${error}
                        </div>
                    </c:if>
                    <div class="form-group">
                        <label for="pw">현재 비밀번호</label>
                        <input type="password" class="form-control" id="pw"
                               name="pw" placeholder="비밀번호" required>
                    </div>
                    <div class="btn-wrapper">
                        <button class="mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined "
                                name="id" value="${user.id}">탈퇴
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
    function userFDelete() {
        let userDelete = confirm("정말 탈퇴하겠습니까?");
        if (userDelete == true) {
            Delete.action = "/user/delete.do";
        } else {
            return false; // 삭제취소
        }

    }
</script>
</html>