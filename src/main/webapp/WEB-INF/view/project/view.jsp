<!-- ProjectBoardcont.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>대림대학교 캡스톤 전시관 - 캡스톤 프로젝트: ${board.title}</title>
    <!--
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="main.css">
    <script src="main.js"></script>
        -->
    <!-- cdn -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <!-- css -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR|Titillium+Web" rel="stylesheet">
    <!-- web font -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <!-- material -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
    <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    <!-- script -->
    <!-- local css -->
    <link rel="stylesheet" href="/res/css/inwork.css">
</head>
<body>
<jsp:include page="../header-nav.jsp"/>
<!-- Navigation Bar -->
<article>
    <div class="con">
        <div class="project-contents-wrapper">
            <div class="project-contents-header">
                <ul>
                    <li><c:out value="${board.title}"/></li>
                </ul>
            </div> <!-- 공지사항 제목, 날짜 -->
            <div class="project-contents-body">
                <div class="project-contents-body-info">
                    <div class="video">
                        <c:choose>
                            <c:when test="${!empty board.video}">
                                <object type="text/html" width="100%" height="320px"
                                        data="//www.youtube.com/embed/<c:out value="${board.video}" />"
                                        allowfullscreen=""></object>
                            </c:when>
                            <c:otherwise>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="wrapper">
                        <div class="info-workingDate">
                            <div>작업기간</div>
                            <div><fmt:formatDate value="${board.startDate}" pattern="yyyy년 MM월"/>~
                                <fmt:formatDate value="${board.finishDate}" pattern="yyyy년 MM월"/>
                            </div>
                        </div>
                        <div class="info-major">
                            <div>전공</div>
                            <div><c:out value="${board.major}"/></div>
                        </div>
                        <div class="info-branch">
                            <div>분야</div>
                            <div><c:out value="${board.branch}"/></div>
                        </div>
                        <div class="info-students">
                            <div>참여학생</div>
                            <div><c:out value="${board.part}"/></div>
                        </div>
                        <div class="info-professor">
                            <div>지도교수</div>
                            <div><c:out value="${board.guide}"/></div>
                        </div>
                        <c:choose>
                            <c:when test="${!empty board.addFile}">
                                <div class="info-file">
                                    <div>참조자료</div>
                                    <div>
                                        <c:forTokens var="file" items="${board.addFile}" delims="," varStatus="i"
                                                     end="${i.end}">
                                            <c:forTokens var="fileNameList" items="${fileName}" delims=","
                                                         varStatus="j">
                                                <a download="" href="${file}"><img
                                                        src="/img/project/download.gif"/><c:out
                                                        value="${fileNameList}"/></a><br>
                                            </c:forTokens>
                                        </c:forTokens>
                                    </div>
                                </div>
                            </c:when>
                        </c:choose>
                        <c:choose>
                            <c:when test="${!empty board.reference}">
                                <div class="info-referpage">
                                    <div>참조페이지</div>
                                    <div>
                                        <c:forTokens var="reference" items="${board.reference}" delims=","
                                                     varStatus="i">
                                            <a href="${reference}" class="mdl-button mdl-js-button mdl-button--icon"
                                               target="_sub"><i class="material-icons">link</i></a><br/>
                                        </c:forTokens>
                                    </div>
                                </div>
                            </c:when>
                        </c:choose>
                    </div>
                </div>
                <c:choose>
                    <c:when test="${!empty board.photo}">
                        <c:forTokens var="photo" items="${board.photo}" delims="," varStatus="i">
                            <div class="project-contents-image-wrapper">
                                <img src="${photo}?time=<%=request.getParameter("time") %>" alt="이미지 로딩 실패"
                                     style="width: 60%; height:auto;"/><br><br>
                            </div>
                        </c:forTokens>
                    </c:when>
                    <c:otherwise>
                    </c:otherwise>
                </c:choose>
            </div>
            <p><c:out value="${board.content}"/>
            </p>
            <div class="btn-wrapper">
                <a href="/filter?page=${page}&major=${major}&branch=${branch}&mYear=${mYear} ">
                    <button class="mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined">목록
                    </button>
                </a>
                <sec:authorize access="hasAnyAuthority('admin', 'user')">
                    <sec:authorize access="hasAuthority('admin')" var="isAdmin"/>
                    <sec:authentication var="user" property="principal"/>
                    <c:if test="${user.id eq board.id || isAdmin}">
                        <form action="project/delete.do" method="post">
                            <button class="mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined "
                                    name="pNo" value="${board.pNo}">삭제
                            </button>
                        </form>
                        <form action="project/update" method="post">
                            <button class="mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined "
                                    name="pNo" value="${board.pNo}">수정
                            </button>
                        </form>
                    </c:if>
                </sec:authorize>
            </div>
        </div>

    </div>
    </div>
    </div>
    <!-- contents box -->
</article>
<jsp:include page="../footer.jsp"/>
<!-- footer -->
</body>
<script>
    var time = new Date().getTime();
</script>
</html>
<%----%>