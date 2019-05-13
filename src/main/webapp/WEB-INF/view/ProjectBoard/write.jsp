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
	<form action="/ProjectBoard/write.do" accept-charset="utf-8" name="write" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label for="exampleInputEmail1">작성자 이름</label> <input type="text"
				class="form-control" name="id" aria-describedby="">
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">제목</label> <input type="text"
				class="form-control" name="title" aria-describedby=""">
		</div>
		<div class="form-group">
			<label for="exampleFormControlTextarea1">본문</label>
			<textarea class="form-control" name="content" rows="8"></textarea>
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">영상</label> <input type="text"
				class="form-control" name="video" aria-describedby=""
				placeholder="등록하려는 영상의 주소창에서 https://www.youtube.com/watch?v=<<이 부분>> 만 복사해서 넣어주세요!">
		</div>
		<div class="form-group">
			
			<label for="exampleInputEmail1">사진</label> <input type="text"
				class="form-control" name="photo" aria-describedby="">
				
				<input type="file" name="uploadFile" id="uploadFile" />
		</div>
		<div class="form-group">
		<label for="exampleInputEmail1">전공</label>
			<select name="major">
			    <option value="M01">컴퓨터</option>
			    <option value="M02">토목</option>
			    <option value="M03">미술</option>
			    <option value="M04">음악</option>
			</select>
			
		<label for="exampleInputEmail1">분야</label>
			<select name="branch">
			    <option value="B01">Ai</option>
			    <option value="B02">Big Data</option>
			    <option value="B03">C</option>
			    <option value="B04">D</option>
			</select>
			
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">지도교수</label> <input type="text"
				class="form-control" name="guide" aria-describedby="">

			<label for="exampleInputEmail1">참여학생</label> <input type="text"
				class="form-control" name="part" aria-describedby=""
				placeholder="Ex) ○○○, ○○○, ○○○, ○○○">
		</div>
		<button type="submit" class="btn btn-primary">글쓰기</button>
	</form>
</body>

</html>
