<!-- ContentsBoard.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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

	<form action="/filter" accept-charset="utf-8" name="filter">
		<select name="major">
			<option value="all" selected="selected">전공선택</option>
			<c:forEach var="major" items="${majorList}">
				<option value="${major.majorNo}" ${param.major eq major.majorNo ? "selected" :""}>${major.major}</option>
			</c:forEach>
		</select>
	
		<select name="branch">
			<option value="all" selected="selected">분야선택</option>
			<c:forEach var="branch" items="${branchList}">
				<option value="${branch.branchNo}" ${param.branch eq branch.branchNo ? "selected" :""}>${branch.branch}</option>
			</c:forEach>
		</select>
		<select name="mYear">
			<option value="all" selected="selected">작성년도</option>
				<option value="2019" ${param.mYear eq "2019" ? "selected" :""}>2019년도</option>
				<option value="2018" ${param.mYear eq "2018" ? "selected" :""}>2018년도</option>
				<option value="2017" ${param.mYear eq "2017" ? "selected" :""}>2017년도</option>
				<option value="2016" ${param.mYear eq "2016" ? "selected" :""}>2016년도</option>
				<option value="2015" ${param.mYear eq "2015" ? "selected" :""}>2015년도</option>
		</select>
	
		<button type="submit" class="btn btn-primary">조회</button>
	</form>
		
	<table class="table table-boardred">	
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		<c:forEach var="board" items="${boardList}">
			<tr>
				<td><a href="project?page=${page}&content=${board.pNo}">${board.pNo}</a></td>
				<td><a href="project?page=${page}&content=${board.pNo}">${board.title}</a></td>
				<td>${board.id}</td>
				<td><fmt:formatDate value="${board.pDate}" pattern="yyyy년 MM월 dd일" /></td>
			</tr>
		</c:forEach>
	</table>
	<div align="right" style="height: 30%;">	    
		<a class="btn btn-primary" href="project/write" role="button">글쓰기</a>
	</div>
</body>

</html>

