<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>대림대학교 캡스톤 전시관 - 자주 묻는 질문</title>
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
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <!-- material -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
    <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    <!-- Latest compiled and minified CSS -->
    <!-- bootstrap4 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <!-- script -->
    <!-- local css -->
    <link rel="stylesheet" href="/res/css/inwork.css">
</head>
<body>
<jsp:include page="../header-nav.jsp"/>
<!-- Navigation Bar -->
<article>
    <div class="con">
        <div class="faq-con">
            자주 묻는 질문
            <hr/>
        </div>
        <div class="faq-wrapper">
            <c:forEach var="faq" items="${faqList}">
                <div align="left" class="faq-question" onclick="$(this).next().toggle()">
                    <label>Q</label>
                    <div>
                        <p><c:out value="${faq.faqTitle}"/></p>
                    </div>
                </div>
                <div align="left" class="faq-answer">
                    <label>A</label>
                    <div>
                        <p><c:out value="${faq.faqContent}"/></p>
                    </div>
                    <sec:authorize access="hasAuthority('admin')">
                    <div class="faq-admin-mod">
                        <form action="/faq/update" method="post">
                            <button class="mdl-button mdl-js-button mdl-button--icon" name="faqNum" value="${faq.faqNum}">
                                <i class="material-icons">build</i>
                            </button>
                        </form>
                        <form name="Delete" method="post" onsubmit="return checkFDelete()">
                            <input type="hidden" name="faqNum" value="${faq.faqNum}">
                            <button class="mdl-button mdl-js-button mdl-button--icon">
                                <i class="material-icons">delete</i>
                            </button>
                        </form>
                    </div>
                    </sec:authorize>
                </div>
            </c:forEach>
        </div>
        <%-- 글 쓰기 --%>
        <div class="btn-wrapper">
            <sec:authorize access="hasAuthority('admin')">
            <a href="/faq/write" class="mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined ">글쓰기</a>
            </sec:authorize>
        </div>
        <div class="pagination">
            <c:if test="${pageMaker.prevPageNum}">
                <a
                        href='<c:url value="/faq/list${pageMaker.makeSearch(pageMaker.startPageNum - 1) }"/>'>&laquo;</a>
            </c:if>
            <c:forEach begin="${pageMaker.startPageNum}"
                       end="${pageMaker.endPageNum}" var="number">
                <c:out value="${pageMaker.cri.page == number?'':''}"/>
                <c:set var="currentPage" value="${param.page}"/>
                <c:choose>
                    <c:when test="${empty currentPage && number == 1}">
                        <a href='#' class="active">${number}</a>
                    </c:when>
                    <c:when test="${number == currentPage}">
                        <a href='#' class="active">${number}</a>
                    </c:when>
                    <c:otherwise>
                        <a
                                href='<c:url value="/faq/list${pageMaker.makeSearch(number)}"/>'>${number}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:if test="${pageMaker.nextPageNum && pageMaker.endPageNum > 0}">
                <a
                        href='<c:url value="/faq/list${pageMaker.makeSearch(pageMaker.endPageNum +1) }"/>'>&raquo;</a>
            </c:if>
        </div>
    </div>
    <!-- contents box -->
</article>
<jsp:include page="../footer.jsp"/>
<!-- footer -->
</body>
<script type="text/javascript">
    function checkFDelete() {
        var faqDelete = confirm("삭제하시겠습니까?")
        if (faqDelete == true) {
            Delete.action = "/faq/delete.do";
        } else {
            return false;
        }

    }
</script>
</html>