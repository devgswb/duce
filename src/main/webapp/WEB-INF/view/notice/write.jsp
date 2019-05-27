<!-- jsmb.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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

<script type="text/javascript">
  
        function checkWrite()
        {
            if(!document.noticeWrite.noticeTitle.value){
                alert("제목을 입력하세요.");
                return false;
            }
            
            if(!document.noticeWrite.noticeContent.value){
                alert("내용을 입력하세요.");
                return false;
            }
                    
        }
</script>
</head>

<body>
	<jsp:include page="../header-nav.jsp" />
	<!-- Navigation Bar -->
	<article>
		<div class="con">
			<div class="notice-write-wrapper">
				<form action="/notice/write.do" accept-charset="utf-8" method="post" name="noticeWrite" enctype="multipart/form-data" onsubmit="return checkWrite()">
					<div class="notice-write-wrapper-header">공지사항 작성</div>
					<div class="form-group">
						<input type="text" class="form-control" id="subject"
							name="noticeTitle" placeholder="제목">
						<textarea class="form-control" rows="16" id="contents"
							name="noticeContent" placeholder="내용"></textarea>
					</div>
					<div class="notice-write-attach-addr">
						첨부파일 <input multiple="multiple" type="file" id="inFileName" name="inFileName" value=""/>
					</div>
					<input type="text" class="form-control" id="referlink"
						placeholder="참조 주소">
					<button type="submit"
						class="mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined ">글쓰기</button>
				<a href="/notice/list"><input type="button"
						class="mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined " value="취소"></a>
				</form>
			</div>
		</div>
		<!--  contents box -->
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
	<form action="/noticeWrite.do" accept-charset="utf-8" method="post">
		<div class="form-group">
			제목<input type="text" name="noticeTitle">
		</div>
		<div class="form-group">
			본문<textarea class="form-control" name="noticeContent" rows="8"></textarea>
		</div>
		<button type="submit" class="btn btn-primary">글쓰기</button>
	</form>
	
	<button type="button"><a href="noticeList">목록으로</a></button>
</body>

</html>
 -->