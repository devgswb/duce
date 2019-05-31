<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ LIST</title>
</head>
<body>

    <table border="1">
        <tr>
            <th>제목</th>
            <th>작성일</th>
            <th>조회수</th>
        </tr>
        <c:forEach var="faq" items="${faqList}">
			<tr>
				<td>${faq.faqTitle}</td>
				<td><fmt:formatDate value="${faq.faqDate}" pattern="yyyy년 MM월 dd일"/></td>
				<td>${faq.faqHits}</td>
			</tr>
		</c:forEach>

    </table>
    
    <div class="pagination">
					<c:if test="${pageMaker.prevPageNum}">
						<a
							href='<c:url value="/faq/list${pageMaker.makeSearch(pageMaker.startPageNum - 1) }"/>'>&laquo;</a>
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
									href='<c:url value="/faq/list${pageMaker.makeSearch(number)}"/>'>${number}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${pageMaker.nextPageNum && pageMaker.endPageNum > 0}">
						<a
							href='<c:url value="/faq/list${pageMaker.makeSearch(pageMaker.endPageNum +1) }"/>'>&raquo;</a>
					</c:if>
				</div>

    <a class="btn btn-primary" href="/faq/write">글쓰기</a>
  
</body>
</html>
