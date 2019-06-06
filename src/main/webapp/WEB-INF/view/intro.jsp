<!-- list.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<!-- css -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Serif+KR|Titillium+Web"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">
<!-- web font -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- material -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<!-- script -->
<!-- local css -->
<link rel="stylesheet" href="/res/css/inwork.css">

</head>

<body>
	<jsp:include page="header-nav.jsp" />
	<!-- Navigation Bar -->
	<article>
		<div class="con">
			<div id="intro-contents">
			</div>
		</div>
	</article>
	<jsp:include page="footer.jsp" />
</body>
<script>
	function renderPage(Json) {
		const content = Json.content;
		const img = Json.img;
		let renderHtml = "";
		renderHtml += `<div class="intro-img"><img src=${"${img}"}></div>`;
		renderHtml += `<div class="intro-content">${"${content}"}</div>`;
		$('#intro-contents').html(renderHtml);
	}

	$(document).ready(function () {
		$.ajax({
			url: '/json/intro.json',
			async: false,
			dataType: 'json',
			success: function (data) {
				renderPage(data);
			},
			error: function () {
				renderPage();
			}
		})
	});
</script>
</html>
