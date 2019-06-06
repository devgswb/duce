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
비밀번호 확인 창

<form method="post" name="Checking" onsubmit="return userChange()">
<div>
현재 비밀번호 : <input type="password" class="form-control" id="pw"
                           name="pw" placeholder="비밀번호" required>
</div>
<c:if test = "${!empty error}">
<div>
${error}
</div>
</c:if>

<div>
변경 비밀번호 : <input type="password" class="form-control" id="pwd"
                           name="pwd" placeholder="비밀번호" required>
</div>
<div>
비밀번호 확인: <input type="password" class="form-control" id="pwdCo"
                           name="pwdCo" placeholder="비밀번호 확인" required>
</div>

<button class="mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined" name="id" value="${user.id}">비밀번호 수정</button>
</form>

<script type="text/javascript">
        function userChange() {

            var pw = document.getElementById("pwd").value;
            var pwOk = document.getElementById("pwdCo").value;
            
            var change = confirm("변경하시겠습니까?")
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

</body>
</html>