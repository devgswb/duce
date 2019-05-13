<!-- list.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
                                        "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>게시판</title> 
</head>

<body>
<form name="search" method="get">
	<select name="searchType">
		<option value="n"<c:out value="${cri.searchType == null ? 'selected' : ''}"/>>---</option>
		<option value="t"<c:out value="${cri.searchType == 't' ? 'selected' : ''}"/>>제목</option>
		<option value="c"<c:out value="${cri.searchType == 'c' ? 'selected' : ''}"/>>내용</option>
	</select>
	
	<input type="text" name='keyword' id="keywordInput" value="${cri.keyword}"/>
 <button id="searchBtn">검색</button>
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

    <table border="1">
        <tr>
            <th>글번호</th>
            <th>제목</th>
            <th>작성일</th>
            <th>조회수</th>
        </tr>
        <c:forEach var="notice" items="${noticeList}">
			<tr>
				<td>${notice.noticeNum}</td>
				<td><a href="noticeList${pageMaker.makeSearch(pageMaker.cri.page)}&number=${notice.noticeNum}">${notice.noticeTitle}</a></td>
				<td><fmt:formatDate value="${notice.noticeDate}" pattern="yyyy년 MM월 dd일"/></td>
				<td>${notice.noticeHits}</td>
			</tr>
		</c:forEach>

    </table>
    <c:if test="${pageMaker.prevPageNum}">
    <li>
    <a href='<c:url value="noticeList${pageMaker.makeSearch(pageMaker.startPageNum - 1) }"/>'>이전페이지</a>
    </li>
    </c:if>
    <c:forEach begin="${pageMaker.startPageNum}" end="${pageMaker.endPageNum}" var ="number">
    <li>
    <c:out value="${pageMaker.cri.page == number?'':''}" />
    <a href='<c:url value="noticeList${pageMaker.makeSearch(number)}"/>'>${number}</a>
    </li>
    </c:forEach>
    <c:if test="${pageMaker.nextPageNum && pageMaker.endPageNum > 0}" >
    <li>
    <a href='<c:url value="noticeList${pageMaker.makeSearch(pageMaker.endPageNum +1) }"/>'>다음페이지</a>
    </li>
    </c:if>
    <a class="btn btn-primary" href="/noticeWrite">글쓰기</a>
    

</body>

</html>
