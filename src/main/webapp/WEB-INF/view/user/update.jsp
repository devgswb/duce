<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<%--<sec:authentication var="user" property="principal"/>--%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>대림대학교 캡스톤 전시관 - 회원 정보</title>
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
                회원정보 수정
                <hr/>
            </div>
            <c:if test="${!empty success}">
                <div class="alert-box-wrapper">
                    <div class="alert alert-success" role="alert">
                        <i class="material-icons">done</i>
                            ${success}
                    </div>
                </div>
            </c:if>
            <div class="form-wrapper">
                <div class="form-group">
                    <label for="userid">학번</label>
                    <input type="text" class="form-control" id="userid" value="${user.id}" readonly>
                </div>
                <div class="form-group">
                    <label for="name">이름</label>
                    <input type="text" class="form-control" id="name" value="${user.name}" readonly>
                </div>
                <form method="post" name="Update" onsubmit="return userUpdate()">
                    <div class="form-group">
                        <label for="mail">e-mail</label>
                        <input type="text" id="mail"
                               name="mail" class="form-control" value="${user.mail}"
                               pattern="^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$"
                               oninput="setCustomValidity('');
                                     checkValidity();
                                  setCustomValidity(validity.valid ? '' :'올바른 이메일 양식대로 입력해주세요.');"
                               placeholder="이메일" required>
                    </div>
                    <div class="form-group">
                        <label for="mail">연락처</label>
                        <input type="text" id="hp"
                               pattern="^\d{3}-\d{3,4}-\d{4}$"
                               oninput="setCustomValidity('');
                                     checkValidity();
                                  setCustomValidity(validity.valid ? '' :'올바른 연락처 번호를 입력해주세요.');"
                               name="hp" class="form-control" value="${user.hp}" placeholder="전화번호" required>
                    </div>
                    <div class="btn-wrapper">
                        <button class="mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined "
                                name="id" value="${user.id}">수정
                        </button>
                    </div>
                </form>
            </div>

            <c:choose>
                <c:when test="${!empty project}">
                    <div>
                        <table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp full-width">
                            <thead>
                            <tr>
                                <th>번호</th>
                                <th class="mdl-data-table__cell--non-numeric full-width" style="text-align: center">제목
                                </th>
                                <th>게시일자</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="user" items="${project}" varStatus="status">
                                <tr>
                                    <td>
                                            ${status.index+1}
                                    </td>
                                    <td>
                                        <a href="/project?page=1&content=${user.pNo}&major=&branch=&mYear=">${user.title}</a>
                                    </td>
                                    <td><fmt:formatDate value="${user.pDate}" pattern="yyyy년 MM월 dd일"/></td>
                                    <td>
                                        <form action="/project/update" method="post">
                                            <button name="pNo"
                                                    class="mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined "
                                                    value="${user.pNo}">수정
                                            </button>
                                        </form>
                                    </td>
                                    <td>
                                        <form name="Delete" method="post" onsubmit="return projectDelete()">
                                            <button name="pNo"
                                                    class="mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined "
                                                    value="${user.pNo}">삭제
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="alert-box-wrapper">
                        <div class="alert alert-warning" role="alert">
                            <i class="material-icons">info</i>
                            게시물이 없습니다.
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <!-- contents box -->
</article>
<jsp:include page="../footer.jsp"/>
<!-- footer -->
</body>
<script type="text/javascript">
    function projectDelete() {
        let userDelete = confirm("삭제하시겠습니까?");
        if (userDelete == true) {
            Delete.action = "/project/delete.do";
        } else {
            return false; // 삭제취소
        }
    }

    function userUpdate() {
        let user = confirm("수정하시겠습니까?");
        if (user == true) {
            Update.action = "/user/update.do";
        } else {
            return false; // 삭제취소
        }
    }
</script>
</html>