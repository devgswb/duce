<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
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
 $(document).ready(
   function() {
     $('#searchBtn').on(
       "click".
         function(event) {
           str = "noticeList"
           + '${pageMaker.makeQuery(1)}'
           + "&searchType="
           + $("select option:selected").val()
           + "&keyword="
           + $('#keywordInput').val());
           console.log(str);          
           location.href = str;
         });
       });
 </script>
<!-- -->
</head>

<body>
	<jsp:include page="../header-nav.jsp" />
	<!-- Navigation Bar -->
	<article>
		<div class="con">
			<div class="notice-wrapper">
				<table class="notice-fullwidth mdl-data-table mdl-js-data-table">
					<thead>
						<tr>
							<th class="notice-menu-number">번호</th>
							<th
								class="notice-menu-contents mdl-data-table__cell--non-numeric">제목</th>
							<th class="mdl-data-table__cell--non-numeric">게시일자</th>
						</tr>
					</thead>
					<tbody>					
						<c:forEach var="notice" items="${noticeList}" varStatus="status">			
							<tr>
								<td>
								${(noticeNumber-status.index)-((param.page-1)*param.perPageNum)}							
								</td>
								<td class="mdl-data-table__cell--non-numeric"
									style="cursor: pointer;"
									onClick="location.href='/notice/list${pageMaker.makeSearch(pageMaker.cri.page)}&number=${notice.noticeNum}' "
									onMouseOver=" window.status = '/notice/list${pageMaker.makeSearch(pageMaker.cri.page)}&number=${notice.noticeNum}' "
									onMouseOut=" window.status = '' ">${notice.noticeTitle}</td>
								<td class="mdl-data-table__cell--non-numeric"><fmt:formatDate
										value="${notice.noticeDate}" pattern="yyyy-MM-dd" /></td>
							</tr>
							
						</c:forEach>
					</tbody>
				</table>
				
				<sec:authorize access="hasAuthority('ROLE_admin')">
				<div class="notice-btn-wrapper">
					<a
						class="mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined"
						href="/notice/write">글쓰기</a>
				</div>
				</sec:authorize>
				
				<!--<c:if test="${sessionScope.userId != null}">-->
                <!--</c:if>--> 
				<!-- 페이징 -->
				<div class="pagination">
					<c:if test="${pageMaker.prevPageNum}">
						<a
							href='<c:url value="/notice/list${pageMaker.makeSearch(pageMaker.startPageNum - 1) }"/>'>&laquo;</a>
					</c:if>
					<c:forEach begin="${pageMaker.startPageNum}"
						end="${pageMaker.endPageNum}" var="number">
						<c:out value="${pageMaker.cri.page == number?'':''}" />
						<c:set var="currentPage" value="${param.page}" />
						<c:choose>
							<c:when test="${empty currentPage && number == 1}">
								<a href='#' class="active">${number}</a>
							</c:when>
							<c:when test="${number == currentPage}">
								<a href='#' class="active">${number}</a>
							</c:when>
							<c:otherwise>
								<a
									href='<c:url value="/notice/list${pageMaker.makeSearch(number)}"/>'>${number}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${pageMaker.nextPageNum && pageMaker.endPageNum > 0}">
						<a
							href='<c:url value="/notice/list${pageMaker.makeSearch(pageMaker.endPageNum +1) }"/>'>&raquo;</a>
					</c:if>
				</div>
				<div
					class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label notice-search">
					<form class="mdl-textfield__input" name="search" method="get">
						<select name="searchType">
							<option value="n"
								<c:out value="${cri.searchType == null ? 'selected' : ''}"/>>---</option>
							<option value="t"
								<c:out value="${cri.searchType == 't' ? 'selected' : ''}"/>>제목</option>
							<option value="c"
								<c:out value="${cri.searchType == 'c' ? 'selected' : ''}"/>>내용</option>
						</select> <input class="form-control" type="text" name='keyword'
							id="keywordInput" value="${cri.keyword}" />
						<button type="submit"
							class="mdl-button mdl-js-button mdl-button--icon">
							<i class="material-icons md-dark" id="searchBtn">search</i>
						</button>
						<script type="text/javascript">
                            $(document).ready(
                                function() {
                                    $('#searchBtn').on(
                                        "click".
                                        function(event) {
                                        str = "noticeList"
                                            + '${pageMaker.makeQuery(1)}'
                                            + "&searchType="
                                            + $("select option:selected").val()
                                            + "&keyword="
                                            + $('#keywordInput').val());
                                    console.log(str);
                                    location.href = str;
                                });
                            });
                        </script>
					</form>
				</div>
			</div>
		</div>
		<!-- contents box -->
	</article>
	<jsp:include page="../footer.jsp" />
	<!-- footer -->
</body>
</html>