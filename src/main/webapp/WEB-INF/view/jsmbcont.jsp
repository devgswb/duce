<!-- jsmb.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
                                        "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>게시판</title>
</head>
<body>
	<div style="margin-left: 20%; margin-right: 20%">
		<table class="table table-boardred" style="height: 70%">
			<tr>
				<th>글번호</th>
				<th>작성자</th>
				<th style="text-align: right;">작성일</th>
			</tr>
			<tr>
				<td>${board.no}</td>
				<td>${board.subject}</td>
				<td style="text-align: right;">${board.writedate}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="2" style="text-align: center; font-size: 16px;">${board.writer}</td>
			</tr>
			<tr>
				<td colspan="4">${board.content}</td>
			</tr>
		</table>
		<div align="right" style="height: 30%;">
		    <a class="btn btn-primary" href="jsmb/write" role="button">글쓰기</a>
		    <form action="jsmb/modify" method="post">
                <button class="btn btn-warning" name="bno" value="${board.no}">수정하기</button>
            </form> 
		    <form action="jsmb/delete.do" method="post">
                <button class="btn btn-danger" name="no" value="${board.no}">삭제</button>
            </form> 
		</div>
	</div>
</body>

</html>
