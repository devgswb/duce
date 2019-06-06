<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
정보 수정 
<div>
학번 :  ${user.id}
</div>
<div>
이름 : ${user.name}
</div> 

<form method="post" name="Update" onsubmit="return userUpdate()">
<div>
E-Mail : <input type="text" class="form-control" id="mail"
                           name="mail" value="${user.mail}" placeholder="이메일" required>
</div>
<div>
HP : <input type="text" class="form-control" id="hp"
                           name="hp" value="${user.hp}" placeholder="전화번호" required>
</div>

<button class="mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined" name="id" value="${user.id}">수정</button>
</form>
 
<div>
내가 만든 캡스톤 디자인 
</div>
<c:choose> 
<c:when test="${!empty project}">
<div>
<table class="notice-fullwidth mdl-data-table mdl-js-data-table">
<thead>
   <tr>
      <th>번호</th>
	  <th>제목</th>
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
            <a href="/project?page=1&content=${user.pNo}">${user.title}</a>
         </td>
         <td><fmt:formatDate value="${user.pDate}" pattern="yyyy년 MM월 dd일" /></td>
         <td>
         <form name="Delete" method="post" onsubmit="return projectDelete()">
            <button name="pNo" value="${user.pNo}">삭제</button>
         </form>
         
         </td>
         <td>
         <form action="/project/update" method="post">
            <button name="pNo" value="${user.pNo}">수정</button>
         </form>
         </td>
      </tr>
   </c:forEach>
</tbody>
</table>
</div>
</c:when>
<c:otherwise>
게시물이 없습니다.
</c:otherwise>
</c:choose>

<form action="/user/check" method="post">
            <button name="id" value="${user.id}">비밀번호 변경</button>
</form>

<div>
<form action="/user/delete" method="post">
            <button name="id" value="${user.id}">회원 탈퇴</button>
</form>
</div>
<script type="text/javascript">
        function projectDelete() {
            var userDelete = confirm("삭제하시겠습니까?")
            if (userDelete == true) {
                Delete.action = "/project/delete.do";
            } else {
                return false; // 삭제취소
            }

        }
        
        function userUpdate() {
            var user = confirm("수정하시겠습니까?")
            if (user == true) {
                Update.action = "/user/update.do";
            } else {
                return false; // 삭제취소
            }

        }
</script>
</body>
</html>