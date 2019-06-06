<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script
            src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<h3>전공/분야 설정</h3><br>
<%
    String[] auth = { "none_auth", "user" };
    String[] authOut = { "권한 없는 사용자" , "사용자" };
    pageContext.setAttribute("auth", auth);
    pageContext.setAttribute("authOut", authOut);
%>
<%-- 전공 --%>
<form action="/admin/member/mod.do" method="post">
    <input type="hidden" name="_method" value="patch"/>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>이름</th>
            <th>e-mail</th>
            <th>연락처</th>
            <th>권한</th>
            <th>활성 상태</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${memberList}" var="member">
            <tr class="memberRow">
                <input type="hidden" class="member-id" value="${member.id}">
                <input type="hidden" class="member-auth" value="${member.authority}">
                <td>${member.id}</td>
                <td>${member.name}</td>
                <td>${member.mail}</td>
                <td>${member.hp}</td>
                <td>
                    <c:choose>
                        <c:when test="${member.authority eq 'admin'}">
                            <p>관리자</p>
                        </c:when>
                        <c:otherwise>
                            <select class="authority">
                                <c:forEach items="${auth}" var="item" varStatus="status">
                                    <option value="${item}" <c:if test="${member.authority == item}">selected</c:if>>${authOut[status.index]}</option>
                                </c:forEach>
                            </select>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <c:choose>
                        <c:when test="${member.authority eq 'admin'}">
                            <p>활성</p>
                        </c:when>
                        <c:otherwise>
                            <select class="enabled">
                                <option value="enable"
                                        <c:if test="${member.isEnabled() == '1'}">selected</c:if>>활성화</option>
                                <option value="disable"
                                        <c:if test="${member.isEnabled() == '0'}">selected</c:if>>비활성화</option>
                            </select>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <c:if test="${!empty beginPage}">
        <c:forEach begin="${beginPage}" end="${endPage}" var="i">
            <span><a href="/admin/member?page=${i}">${i}</a></span>
        </c:forEach>
    </c:if>
    <input type="hidden" name="memberList" value="" id="update-memberList">
    <button id="btnModMember">정보 수정</button>
</form>
<form action="/admin/member" method="post">
    <select name="param">
        <option value="id">ID</option>
        <option value="name">이름</option>
        <option value="mail">e메일</option>
        <option value="hp">연락처</option>
    </select>
    <input type="text" name="searchWord" required/>
    <button type="submit">검색</button>
</form>
</body>
<script>
$('#btnModMember').on('click', function () {
    let inputMember = $('.memberRow').map(function () {
        if ($(this).find('.member-auth').val() !== 'admin') {
            let member = {
                "id": $(this).find('.member-id').val(),
                "authority": $(this).find('.authority').val(),
                "isEnabled": ($(this).find('.enabled').val() === 'enable')
            };
            return member;
        }
        return null
    });
    inputMember = { list : [...inputMember]};
    $('#update-memberList').val(JSON.stringify(inputMember));
    return true;
})
</script>
</html>