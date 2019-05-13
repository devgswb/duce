<!-- ContentsBoard_write.jsp -->
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
<title>전시관 글 쓰기</title>
</head>
<body> 
	<form action="/ContentsBoard/write.do" accept-charset="utf-8" name="bwrite" method="post">
		<div class="form-group">
			<label for="exampleInputEmail1">작성자 이름</label> <input type="text"
				class="form-control" name="userName" aria-describedby=""
				placeholder="작성자 이름">
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">제목</label> <input type="text"
				class="form-control" name="bTitle" aria-describedby=""
				placeholder="제목">
		</div>
		<div class="form-group">
			<label for="exampleFormControlTextarea1">본문</label>
			<textarea class="form-control" name="bContent" rows="8"></textarea>
		</div>
		<button type="submit" class="btn btn-primary">글쓰기</button>
	</form>
</body>

</html>
