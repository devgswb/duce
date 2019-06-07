<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>대림대학교 캡스톤 전시관 - 공지사항: ${notice.noticeTitle}</title>
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
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
          rel="stylesheet">
    <!-- web font -->
    <script
            src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script
            src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <!-- material -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet"
          href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
    <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    <!-- script -->
    <!-- local css -->
    <link rel="stylesheet" href="/res/css/inwork.css">
    <!--  page logic -->

    <script type="text/javascript">
        function checkNDelete() {
            var noticeDelete = confirm("삭제하시겠습니까?")
            if (noticeDelete == true) {
                Delete.action = "/notice/delete.do";
            } else {
                return false; // 삭제취소
            }

        }
    </script>


</head>

<body>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<jsp:include page="../header-nav.jsp"/>
<!-- Navigation Bar -->
<article>
    <div class="con">
        <div class="notice-contents-wrapper">
            <div class="notice-contents-header">
                <ul>
                    <li>${notice.noticeTitle}</li>
                    <li><fmt:formatDate value="${notice.noticeDate}" pattern="yyyy-MM-dd"/></li>
                </ul>
            </div> <!-- 공지사항 제목, 날짜 -->
            <div class="notice-contents-body">
                <p>${fn:replace(notice.noticeContent,newLineChar, "<br/>")}</p>
            </div> <!-- 공지사항 내용 -->
            <div class="notice-contents-footer">
                <c:if test="${!empty notice.refer}">
                <ul class="notice-contents-attach">
                    <li>참조링크</li>
                    <li><a href="${notice.refer}" target="_sub">${notice.refer}</a></li>
                </c:if>
                <c:if test="${!empty noticeFile}">
                <ul class="notice-contents-attach">
                    <li>첨부파일</li>
                    <li>
                        <c:forEach var="notice" items="${noticeFile}">
                                <input type="hidden" name="outFileName" value="${notice.outFileName}">
                                <a download=""
                                   href="/file/notice/${notice.outFileName}"><b>${notice.inFileName}</b></a>(${Math.round(notice.fileSize/(1024*1024)*100)/100.00}MB)
                        </c:forEach>
                    </li>
                </ul>
                </c:if>
                <ul class="notice-contents-former">
                    <li>이전글</li>
                    <li>
                        <c:choose>
                            <c:when test="${notice.noticeNum > 1}">
                                <a href="/notice/list?number=${prev.noticeNum}">${prev.noticeTitle}</a>
                            </c:when>
                            <c:otherwise>
                                이전 게시글이 없습니다.
                            </c:otherwise>
                        </c:choose>
                    </li>
                </ul>
                <ul class="notice-contents-latter">
                    <li>다음글</li>
                    <li>
                        <c:choose>
                            <c:when test="${maxPage > notice.noticeNum}">
                                <a href="/notice/list?number=${next.noticeNum}">${next.noticeTitle}</a>
                            </c:when>
                            <c:otherwise>
                                다음 게시글이 없습니다.
                            </c:otherwise>
                        </c:choose>
                    </li>
                </ul>
                <div class="btn-wrapper">
                    <a href="/notice/list">
                        <button class="mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined">
                            목록
                        </button>
                    </a>
                    <sec:authorize access="hasAuthority('admin')">
                    <form name="Delete" method="post" onsubmit="return checkNDelete()">
                        <input type="hidden" name="noticeNum" value="${notice.noticeNum}">
                        <button class="mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined" name="noticeDelete" id="noticeDelete">삭제</button>
                    </form>
                    <form action="/notice/update" method="post">
                        <button class="mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined" name="noticeNum" value="${notice.noticeNum}">수정</button>
                    </form>
                    </sec:authorize>
                </div>
            </div> <!-- 첨부파일 / 이전글 / 다음글 / 목록 -->
        </div>
    </div>
    <!-- contents box -->
</article>
<jsp:include page="../footer.jsp"/>
<!-- footer -->
</body>
</html>