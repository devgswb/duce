<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Duce</title>
<!-- 
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="main.css">
    <script src="main.js"></script>
        -->
<!-- cdn -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<!-- css -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Serif+KR|Titillium+Web"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">
<!-- web font -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<!-- material -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<!-- script -->
<!-- local css -->
<link rel="stylesheet" href="/res/css/inwork.css">
<!--  page logic -->

 
</head>

<body>
	<jsp:include page="../header-nav.jsp" />
	<!-- Navigation Bar -->
	<article>
		<div class="con">
        <div class="notice-contents-wrapper">
            <div class="notice-contents-header">
                <ul>
                    <li>${notice.noticeTitle}</li>
                    <li><fmt:formatDate value="${notice.noticeDate}" pattern="yyyy-MM-dd"/></li>
                </ul>
            </div> <!-- 공지사항 제목, 날짜 -->
            <div class="notice-contents-body">
                <p>${notice.noticeContent}</p>
            </div> <!-- 공지사항 내용 -->
            <div class="notice-contents-footer">
                <ul class="notice-contents-attach">
                    <li>첨부파일</li>
                    <li>
                    <c:forEach var="notice" items="${noticeFile}">
			         <c:if test="${!empty notice.outFileName}">
                    <a download="" href="/notice/download.do/${notice.noticeNum}">${notice.inFileName}</a>(${notice.fileSize/1024}Byte)
                   </c:if>
			        </c:forEach>
                    </li>               
                </ul>
                <ul class="notice-contents-former">
                    <li>이전글</li>
                    <li>
                     <c:choose>
		             <c:when test="${notice.noticeNum > 1}">
		             <a href="/notice/list?number=${prev.noticeNum}">${prev.noticeTitle}</a>
		             </c:when>
		             <c:otherwise>
				            이전 게시글이 없습니다.
		             </c:otherwise>
		             </c:choose>
                    </li>
                </ul>
                <ul class="notice-contents-latter">
                    <li>다음글</li>
                    <li>
                    <c:choose>
		            <c:when test="${maxPage > notice.noticeNum}">
		            <a href="/notice/list?number=${next.noticeNum}">${next.noticeTitle}</a>
		            </c:when>
		            <c:otherwise>
			        	다음 게시글이 없습니다.
		            </c:otherwise>
		            </c:choose>
                    </li>
                </ul>
                <a href="/notice/list"><button class="mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined">목록</button></a>
                <form action="/notice/update" method="post">
                     <button name="noticeNum" value="${notice.noticeNum}">수정하기</button>
                </form> 
                <form action="/notice/delete.do" method="post">
                     <button name="noticeNum" value="${notice.noticeNum}">삭제하기</button>
                </form> 
            
            </div> <!-- 첨부파일 / 이전글 / 다음글 / 목록 -->
        </div>
    </div>
    <!-- contents box -->
	</article>
	<jsp:include page="../footer.jsp" />
	<!-- footer -->
</body>

</html>
<!-- 
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
 -->