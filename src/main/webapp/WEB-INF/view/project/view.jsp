<!-- ProjectBoardcont.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
                                        "http://www.w3.org/TR/html4/loose.dtd">
<html>

<script>
	var time = new Date().getTime();
</script>

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
				<td style="text-align: right;"><fmt:formatDate value="${board.pDate}" pattern="yyyy년 MM월 dd일" /></td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="2" style="text-align: center; font-size: 16px;">${board.title}</td>
			</tr>
			<tr>
				<td colspan="4">${board.content}</td>
			</tr>	
		</table>
			<c:choose>
				<c:when test="${!empty board.photo}">
					<c:forTokens var="photo" items="${board.photo}" delims="," varStatus="i">
						<img src="${photo}?time=<%=request.getParameter("time") %>" alt="불러오기 실패" style="width: 100%; height:auto;" /><br><br>
					</c:forTokens>
				</c:when>
				<c:otherwise>
					<label>사진 정보가 존재하지 않습니다.</label><br><br>
				</c:otherwise>
			</c:choose>
			
		
			<c:choose>
				<c:when test="${!empty board.video}">
					<div class="video-container" style="TEXT-ALIGN: center">
						<object type="text/html" width="100%" height="500" data="//www.youtube.com/embed/${board.video}" allowfullscreen=""></object>
					</div><br><br>
				</c:when>
				<c:otherwise>
					<label>영상 정보가 존재하지 않습니다.</label><br><br>
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${!empty board.addFile}">
					<c:forTokens var="file" items="${board.addFile}" delims="," varStatus="i" end="${i.end}">
						<c:forTokens var="fileNameList" items="${fileName}" delims="," varStatus="j">
							<a download=""	href="${file}"><img src="/res/project/img/download.gif" />${fileNameList}</a><br>
						</c:forTokens>
					</c:forTokens>				
				</c:when>
			</c:choose>
			<br>
		
			<c:choose>
				<c:when test="${!empty board.reference}">	
					<p>참고</p>
					<c:forTokens var="reference" items="${board.reference}" delims="," varStatus="i">
						<p>- <a href="${reference}">${reference}</a></p>
					</c:forTokens>
					<br>
				</c:when>
			</c:choose>
			
		
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
