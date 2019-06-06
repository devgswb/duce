<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="kr.ac.duce.controller.ProjectBoardController" %>
<%@ page import="java.net.URLDecoder" %>
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
<h3>AJAX 기반 인트로 수정</h3><br>
<form:form action="/admin/intro/mod.do" method="post" enctype="multipart/form-data">
    <textarea name="content" id="content"></textarea>
    <input type="file" name="file" id="file" accept="image/jpg, image/jpeg, image/webp, image/png">
    <input type="hidden" name="img" id="img">
    <input type="text" disabled id="txtimg">
    <button id="submit">제출</button>
</form:form>
<button id="reload">되돌리기</button>
</body>
<script>
    let introData;

    function renderInput() {
        $('#content').val(introData.content);
        $('#img').val(introData.img);
        $('#txtimg').val(parseImgPath(introData.img));
    }

    function parseImgPath(imgPath) {
        parse = imgPath.split('/');
        return parse[(parse.length) - 1];
    }

    function dataLoad() {
        $.ajax({
            url: '/json/intro.json',
            async: false,
            dataType: 'json',
            success: function (data) {
                introData = data;
                renderInput();
            },
            error: function () {
                alert('데이터 불러오기에 실패했습니다.');
            }
        });
        $('input[type=file]').val('');
    }

    function saveData() {
        introData = {
            content: $('#content').val(),
            img: $('#img').val()
        };
    }

    $(document).ready(function () {
        dataLoad();
        $('#reload').on('click', () => dataLoad());
        $('#submit').on('click', function () {
            saveData();
            return true;
        });
        $('#file').on('change', function () {
            const filename = $(this).val().replace(/^.*?([^\\\/]*)$/, '$1');
            const imgPath = "/img/notice/" + filename;
            $('#img').val(imgPath);
            $('#txtimg').val(parseImgPath(imgPath));
            saveData();
        });
    });
</script>
</html>