<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script
            src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
    <h3>AJAX 기반 슬라이더 수정</h3><br>
        이미지<input type="file"><br>
        내용<textarea id="content" rows="12"></textarea><br>
        버튼 이름<input type="text" id="btnname"/><br>
        버튼 링크<input type="text" id="btnlink"/><br>
    <button id="btn-change-form-1">1</button>
    <button id="btn-change-form-2">2</button>
    <button id="btn-change-form-3">3</button>
    <button id="btn-change-form-4">4</button>
    <button id="btn-change-form-5">5</button>
    <br>
    <button>현재 데이터 가져오기</button>
    <form action="/admin/slider/mod.do" method="post">
        <button>저장</button>
    </form>
</body>
<script>
    let sliderData;

    function renderInput(number) {
        alert(number);
        <%--const content = Json.content;--%>
        <%--const img = Json.img;--%>
        <%--let renderHtml = "";--%>
        <%--renderHtml += `<div class="intro-img"><img src=${"${img}"}></div>`;--%>
        <%--renderHtml += `<div class="intro-content">${"${content}"}</div>`;--%>
        <%--$('#intro-contents').html(renderHtml);--%>
    }

    $(document).ready(function () {
        $.ajax({
            url: '/json/intro.json',
            async: false,
            dataType: 'json',
            success: function (data) {
                sliderData = data;
                renderInput(1);
            },
            error: function () {
                alert('데이터 불러오기에 실패했습니다.');
            }
        });
        $('#btn-change-form-1').on('click', () => renderInput(1));
        $('#btn-change-form-2').on('click', () => renderInput(2));
        $('#btn-change-form-3').on('click', () => renderInput(3));
        $('#btn-change-form-4').on('click', () => renderInput(4));
        $('#btn-change-form-5').on('click', () => renderInput(5));
    });
</script>
</html>