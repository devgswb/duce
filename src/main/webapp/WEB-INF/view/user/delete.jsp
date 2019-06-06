<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<sec:authentication var="user" property="principal"/>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
회원탈퇴 

<form method="post" name="Delete" onsubmit="return userFDelete()">
<div>
현재 비밀번호 : <input type="password" class="form-control" id="pw"
                           name="pw" placeholder="비밀번호" required>
</div>

<c:if test = "${!empty error}">
<div>
${error}
</div>
</c:if>
<button name="id" value="${user.id}">회원탈퇴</button>
</form>
<script type="text/javascript">
        function userFDelete() {
            var userDelete = confirm("정말 탈퇴하겠습니까?")
            if (userDelete == true) {
                Delete.action = "/user/delete.do";
            } else {
                return false; // 삭제취소
            }

        }
</script>
</body>
</html>