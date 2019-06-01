<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
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
    <!-- cdn -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <!-- css -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR|Titillium+Web" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
    <!-- web font -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <!-- material -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
    <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    <!-- local css -->
    <link rel="stylesheet" href="/res/css/inwork.css">
</head>
<body>
<jsp:include page="../header-nav.jsp"/>
<!-- Navigation Bar -->
<article>
    <!-- Cards -->
    <div class="nav-project-view-category">
        <div class="project-view-category dropdown">
            <button class="dropbtn">학과</button>
            <div class="dropdown-content">
                <a href="/filter?major=all&branch=${paramList[1]}&mYear=${paramList[2]}">모두</a>
                <c:forEach var="major" items="${majorList}">
                    <a href="/filter?major=${major.majorNo}&branch=${paramList[1]}&mYear=${paramList[2]}">${major.major}</a>
                </c:forEach>
            </div>
        </div>
        <div class="project-view-category dropdown">
            <button class="dropbtn">분야</button>
            <div class="dropdown-content">
                <a href="/filter?major=${paramList[0]}&branch=all&mYear=${paramList[2]}">모두</a>
                <c:forEach var="branch" items="${branchList}">
                    <a href="/filter?major=${paramList[0]}&branch=${branch.branchNo}&mYear=${paramList[2]}">${branch.branch}</a>
                </c:forEach>
            </div>
        </div>
        <div class="project-view-category dropdown">
            <button class="dropbtn">년도</button>
            <div class="dropdown-content">
                <a href="/filter?major=${paramList[0]}&branch=${paramList[1]}&mYear=all">모두</a>
                <c:forEach var="year" items="${yearList}">
                    <a href="/filter?major=${paramList[0]}&branch=${paramList[1]}&mYear=${year}"><c:out value="${year}"/>년</a>
                </c:forEach>
            </div>
        </div>
    </div>

    </div>
    <div class="con">
        <c:forEach var="card" items="${boardList}">
            <a href="project?page=${page}&content=${card.pNo}">
                <div class="demo-card-square mdl-card mdl-shadow--2dp duce-card">
                    <div class="mdl-card__title mdl-card--expand duce-card-img"
                         style="background-image: url(/res/img/ex0.jpg); background-size: 100%;">
                        <h2 class="mdl-card__title-text"></h2>
                    </div>
                    <div class="mdl-card__supporting-text duce-card-con">
                        <div class="category">
                            <div class="major">${card.major}과</div>
                            <div class="branch">${card.branch}</div>
                            <div class="year">${card.year}년</div>
                        </div>
                        <div class="title"><c:out value="${card.title}" /></div>
                        <div class="contents"><c:out value="${card.viewContent}" />
                        </div>
                        <div class="participant">
                            <div class="title">참여학생</div>
                            <div class="name"><c:out value="${card.viewPartStudents}" /></div>
                            <div class="title">지도교수</div>
                            <div class="name"><c:out value="${card.guide} 교수" /></div>
                        </div>
                    </div>
                </div>
            </a>
            <!-- 카드 단위 -->
        </c:forEach>
        <!-- cards end -->
        <!-- 페이징 -->
<%--        <div class="pagination">--%>
<%--            <a href="#">&laquo;</a>--%>
<%--            <a href="#">1</a>--%>
<%--            <a href="#" class="active">2</a>--%>
<%--            <a href="#">3</a>--%>
<%--            <a href="#">4</a>--%>
<%--            <a href="#">5</a>--%>
<%--            <a href="#">6</a>--%>
<%--            <a href="#">&raquo;</a>--%>
<%--        </div>--%>
        <div align="right" style="height: 30%;">
            <a class="mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined " href="project/write" role="button">글쓰기</a>
        </div>
    </div>
    <!-- contents box -->
</article>
<jsp:include page="../footer.jsp"/>
<!-- footer -->
</body>
</html>
