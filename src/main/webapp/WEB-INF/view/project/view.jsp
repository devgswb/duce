<!-- ProjectBoardcont.jsp -->
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
				<td>${board.pNo}</td> 
				<td>${board.id}</td>
				<td style="text-align: right;">${board.pDate}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="2" style="text-align: center; font-size: 16px;">${board.title}</td>
			</tr>
			<tr>
				<td colspan="4">${board.content}</td>
			</tr>	
		</table>

			<img src="${board.photo}" onerror="this.style.display='none'" alt="불러오기 실패" style="width: 100%; height:auto;" /><br><br>

		<div class="video-container" style="TEXT-ALIGN: center">
			<object type="text/html" width="100%" height="500" data="//www.youtube.com/embed/${board.video}" allowfullscreen=""></object>
		</div><br><br>
		
		<table class="table table-boardred" style="height: 70%">
			<tr>
				<th>학과</th>
				<th>분야</th>
				<th>지도교수</th>
				<th style="text-align: right;">참여학생</th>
			</tr>
			<tr>
				<th>${board.majorNo}</th>
				<th>${board.branchNo}</th>
				<th>${board.guide}</th>
				<th style="text-align: right;">${board.part}</th>
			</tr>
		</table>
		
		<div align="right" style="height: 30%;">	    
		    <form action="project/update" method="post">
                <button class="btn btn-warning" name="pNo" value="${board.pNo}">수정하기</button>
            </form> 
		    <form action="project/delete.do" method="post">
                <button class="btn btn-danger" name="pNo" value="${board.pNo}">삭제</button>
            </form> 
		</div>
	</div>

</body>

</html>
