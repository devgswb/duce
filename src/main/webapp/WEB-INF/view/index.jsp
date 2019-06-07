<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- list.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>대림대학교 캡스톤 전시관</title>
<!-- 
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="main.css">
    <script src="main.js"></script>
        -->
<!-- cdn -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet" />
	<!-- css -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Serif+KR|Titillium+Web"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">
<!-- web font -->
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
		<div id="carou">

		</div>
		<!-- carousel boxslider -->
		<!-- Cards -->
		<div class="con">
			<c:forEach var="card" items="${boardList}">
				<a href="project?page=1&content=${card.pNo}&major=&branch=&mYear=">
					<div class="demo-card-square mdl-card mdl-shadow--2dp duce-card">
						<div class="mdl-card__title mdl-card--expand duce-card-img"
							 style="background-image: url(${(empty card.viewThumbnail) ? "/res/img/daelim_logo.gif" : card.viewThumbnail}); background-size: 100%;">
							<h2 class="mdl-card__title-text"></h2>
						</div>
						<div class="mdl-card__supporting-text duce-card-con">
							<div class="category">
								<div class="major">${card.major}과</div>
								<div class="branch">${card.branch}</div>
								<div class="year">${card.year}년</div>
							</div>
							<div class="title"><c:out value="${card.title}"/></div>
							<div class="contents">${fn:replace(card.viewContent, "<br/>", " ")}
							</div>
							<div class="participant">
								<div class="title">참여학생</div>
								<div class="name"><c:out value="${card.viewPartStudents}"/></div>
								<div class="title">지도교수</div>
								<div class="name"><c:out value="${card.viewPartGuides}"/></div>
							</div>
						</div>
					</div>
				</a>
				<!-- 카드 단위 -->
			</c:forEach>
			<!-- 카드 단위 -->
			<!-- cards end -->
		</div>
		<!-- contents box -->
	</article>
	<jsp:include page="footer.jsp" />
	<!-- footer -->

	<!-- scripts -->
	<script>
		function renderSlide(Json) {
			const slides = Json.slides;
			let renderHtml = "";
			for (let slide of slides) {
				if (!slide.isUse) continue;
				renderHtml += '<div class="carou-slide "';
				renderHtml += `style="background-image: url(${"${slide.imgUrl}"}); background-size: 100%; height: 100%"> `;
				renderHtml += `<p class="carou-title">${"${slide.title}"}</p>`;
				renderHtml += `<p class="carou-content">${"${slide.content}"}</p>`;
				renderHtml +=  `<a href="${"${slide.btnUrl}"}" class="carou-btn">${"${slide.btnContent}"}</a> </div>`;
			}
			$('#carou').html(renderHtml);
		}

		$(document).ready(function () {
			$.ajax({
				url: '/json/slide.json',
				async: false,
				dataType: 'json',
				success: function (data) {
					renderSlide(data);
				},
				error: function () {
					renderSlide();
				}
			})
		});
		$(function() {
			$('#carou').bxSlider({
				speed : 500,
				auto : true,
				autoHover : true,
				controls : true,
				touchEnabled : (navigator.maxTouchPoints > 0)
			});
		});
	</script>
<%--	<div class="carou-slide" style="background-image: url(carousel01.jpg); background-size: 100%; height: 100%">--%>
<%--		<p class="carou-title">우리 미래의 가능성 - 대림대학교 캡스톤 전시관</p>--%>
<%--		<p class="carou-content">본문 내용들</p>--%>
<%--		<a href="" class="btn-outline-info">링크 버튼</a>--%>
<%--	</div>--%>
</body>

</html>
