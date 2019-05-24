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
<form name="searchBtn" method="get">
    <a href ="/faq/list?searchBtn=${cri.searchBtn = '결제'}">결제</a>
    <a href ="/faq/list?searchBtn=${cri.searchBtn = '로그인'}">로그인</a>
    <a href ="/faq/list?searchBtn=${cri.searchBtn = '기타질문'}">기타질문</a> 
</form>
    
    <table border="1">
        <tr>
            <th>유형</th>
            <th>제목</th>
            <th>작성일</th>
            <th>조회수</th>
        </tr>
        <c:forEach var="faq" items="${faqList}">
			<tr>
				<td>${faq.faqCategory}</td>
				<td><a href="/faq/list${pageMaker.makeSearch(pageMaker.cri.page)}&number=${faq.faqNum}">${faq.faqTitle}</a></td>
				<td><fmt:formatDate value="${faq.faqDate}" pattern="yyyy년 MM월 dd일"/></td>
				<td>${faq.faqHits}</td>
			</tr>
		</c:forEach>

    </table>
    
    <a class="btn btn-primary" href="/faq/write">글쓰기</a>
  
</body>
</html>
