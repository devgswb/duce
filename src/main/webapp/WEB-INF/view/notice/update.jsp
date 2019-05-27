<!-- jsmb.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
                                        "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 글 쓰기</title>
</head>
<body> 
	<form action="/notice/update.do" accept-charset="utf-8" method="post">
	 <input type="hidden" value="${noticeNum}" name="noticeNum" />
		<div class="form-group">
			제목<input type="text" name="noticeTitle">
		</div>
		<div class="form-group">
			본문<textarea class="form-control" name="noticeContent" rows="8"></textarea>
		</div>
		<button type="submit" class="btn btn-primary">글수정</button>
	</form>
</body>

</html>
