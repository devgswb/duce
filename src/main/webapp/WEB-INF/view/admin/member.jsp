<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<%
    String[] auth = {"none_auth", "user"};
    String[] authOut = {"권한 없는 사용자", "사용자"};
    pageContext.setAttribute("auth", auth);
    pageContext.setAttribute("authOut", authOut);
%>
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
        <jsp:include page="./admin-tab.jsp"/>
        <div class="admin-tab-content">
            <div class="admin-title">
                회원 관리
                <hr/>
            <div class="admin-member-wraper">
                <table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp full-width">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>이름</th>
                        <th class="mdl-data-table__cell--non-numeric full-width" style="text-align: center">e-mail
                        </th>
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
                                                <option value="${item}"
                                                        <c:if test="${member.authority == item}">selected</c:if>>${authOut[status.index]}</option>
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
                                                    <c:if test="${member.isEnabled() == '1'}">selected</c:if>>활성화
                                            </option>
                                            <option value="disable"
                                                    <c:if test="${member.isEnabled() == '0'}">selected</c:if>>비활성화
                                            </option>
                                        </select>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
                <div class="member-page-mod-wrapper">
            <c:if test="${!empty beginPage}">
                <div class="pagination">
                    <c:forEach begin="${beginPage}" end="${endPage}" var="i">
                        <a href="/admin/member?page=${i}" <c:if test="${i==currentPage}">class="active"</c:if>>${i}</a>
                    </c:forEach>
                </div>
            </c:if>

                <form action="/admin/member/mod.do" method="post">
                    <input type="hidden" name="_method" value="patch"/>
                    <input type="hidden" name="memberList" value="" id="update-memberList">
                    <button class="mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined "
                            id="btnModMember">정보 수정
                    </button>
                </form>
                </div>
            <div class="member-search-bar">
                <form action="/admin/member" method="post">
                    <div class="form-group">
                    <select class="form-control" name="param">
                        <option value="id">ID</option>
                        <option value="name">이름</option>
                        <option value="mail">e메일</option>
                        <option value="hp">연락처</option>
                    </select>
                    </div>
                    <div class="form-group">
                        <input class="form-control" type="text" name="searchWord" required/>
                    </div>
                    <button class="mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined "
                            type="submit">검색
                    </button>
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
        inputMember = {list: [...inputMember]};
        $('#update-memberList').val(JSON.stringify(inputMember));
        return true;
    })
</script>
</html>