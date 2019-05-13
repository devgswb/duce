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
<title>게시판 글 쓰기</title>
</head>
<body> 
	<table class="table table-boardred" style="height: 70%">
			<tr>
				<th>글번호</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			<tr>
				<td>${notice.noticeNum}</td>
				<td>${notice.userID}</td>
				<td><fmt:formatDate value="${notice.noticeDate}" pattern="yyyy년 MM월 dd일"/></td>

			</tr>
			<tr>
				<th>제목</th>
				<td colspan="2" style="text-align: center; font-size: 16px;">${notice.noticeTitle}</td>
			</tr>
			<tr>
				<td colspan="4">${notice.noticeContent}</td>
			</tr>
		</table>
		
		<form action="noticeUpdate" method="post">
                <button class="btn btn-warning" name="noticeNum" value="${notice.noticeNum}">수정하기</button>
        </form> 
        <form action="noticeDelete.do" method="post">
                <button class="btn btn-warning" name="noticeNum" value="${notice.noticeNum}">삭제하기</button>
        </form> 
        <button type="button"><a href="noticeList">목록으로</a></button>
        
        <a href="noticeList?number=${next.noticeNum}">${next.noticeTitle}</a>
        <a href="noticeList?number=${prev.noticeNum}">${prev.noticeTitle}</a>
     
   
       
</body>

</html>
