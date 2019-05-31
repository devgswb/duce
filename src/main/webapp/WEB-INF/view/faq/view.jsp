<!-- jsmb.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
                                        "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FAQ 글 보기</title>
<script type="text/javascript">
function checkFDelete()
{
	 var faqDelete = confirm("삭제하시겠습니까?")
    if(faqDelete == true){
       Delete.action = "/faq/delete.do";
    }    
    else
    {
        return false; 
    }

}
</script>
</head>
<body> 
	<table class="table table-boardred" style="height: 70%">
			<tr>
				<th>유형</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			<tr>
				<td>${faq.userID}</td>
				<td><fmt:formatDate value="${faq.faqDate}" pattern="yyyy년 MM월 dd일"/></td>

			</tr>
			<tr>
				<th>제목</th>
				<td colspan="2" style="text-align: center; font-size: 16px;">${faq.faqTitle}</td>
			</tr>
			<tr>
				<td colspan="4">${faq.faqContent}</td>
			</tr>
		</table>
		
		<form action="/faq/update" method="post">
                <button class="btn btn-warning" name="faqNum" value="${faq.faqNum}">수정하기</button>
        </form> 
        <form name="Delete" method="post" onsubmit="return checkFDelete()">
                <input type="hidden" name="faqNum" value="${faq.faqNum}">
                <button class="btn btn-warning" name="faqDelete" id="faqDelete" >삭제하기</button>
        </form> 
        <!--<c:if test="${sessionScope.userId != null}">-->
        <!--</c:if>--> 
        
        <button type="button"><a href="/faq/list">목록으로</a></button>
           
</body>

</html>
