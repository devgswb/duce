<!-- ContentsBoard.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
                                        "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>전시관</title>
</head>

<body>
	<table class="table table-boardred">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		<c:forEach var="board" items="${boardList}">
			<tr>
				<td><a href="projectboard?page=${page}&content=${board.pNo}">${board.pNo}</a></td>
				<td><a href="projectboard?page=${page}&content=${board.pNo}">${board.title}</a></td>
				<td>${board.id}</td>
				<td>${board.pDate}</td>
			</tr>
		</c:forEach>
	</table>
	<div align="right" style="height: 30%;">	    
		<a class="btn btn-primary" href="projectboard/write" role="button">글쓰기</a>
	</div>
</body>

</html>
