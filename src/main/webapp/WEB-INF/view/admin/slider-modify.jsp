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
    <h3>AJAX 기반 슬라이더 수정</h3><br>
        <input type="button" id="btn-file-upload" value="이미지 업로드"><br>
        <input type="text" id="file-text" disabled>
        <input type="hidden" id="file-refer-path">
        내용<textarea id="content" rows="12"></textarea><br>
        버튼 이름<input type="text" id="btnname"/><br>
        버튼 링크<input type="text" id="btnlink"/><br>
        슬라이드 사용
        <select id="useSlide" title="슬라이드 사용">
            <option value="true">사용</option>
            <option value="false">사용 안 함</option>
        </select><br>
    버튼 사용
    <select id="useBtn" title="버튼 사용">
        <option value="true">사용</option>
        <option value="false">사용 안 함</option>
    </select><br>
    <button id="btn-change-form-1">1</button>
    <button id="btn-change-form-2">2</button>
    <button id="btn-change-form-3">3</button>
    <button id="btn-change-form-4">4</button>
    <button id="btn-change-form-5">5</button>
    <br>
    <button id="btn-reload">현재 데이터 가져오기</button>
    <form:form action="/admin/slider/mod.do" method="post" enctype="multipart/form-data">
        <input type="file" id="file01" name="files" value="" accept="image/jpeg, image/jpg, image/png, image/webp">
        <input type="file" id="file02" name="files" value="" accept="image/jpeg, image/jpg, image/png, image/webp">
        <input type="file" id="file03" name="files" value="" accept="image/jpeg, image/jpg, image/png, image/webp">
        <input type="file" id="file04" name="files" value="" accept="image/jpeg, image/jpg, image/png, image/webp">
        <input type="file" id="file05" name="files" value="" accept="image/jpeg, image/jpg, image/png, image/webp">
        <input type="hidden" id="sliderjson" name="sliderjson">
        <button id="submit">저장</button>
    </form:form>
</body>
<script>
    let sliderData;
    let currentInput = -1;

    function renderInput(number) {
        if (!(currentInput === -1)) {
            saveData(currentInput);
        }
        let data = sliderData[number];
        currentInput = number;
        content = data['content'];
        btnContent = data.btnContent;
        btnUrl = data.btnUrl;
        imgUrl = data.imgUrl;
        isUse = data.isUse;
        isBtnUse = data.isBtnUse;
        $('#content').val(content);
        $('#btnname').val(btnContent);
        $('#btnlink').val(btnUrl);
        $('#file-text').val(parseImgPath(imgUrl));
        $('#file-refer-path').val(imgUrl);
        $('#useSlide').val(isUse.toString());
        $('#useBtn').val(isBtnUse.toString());
    }

    function saveData(number) {
        let data = {
            content: $('#content').val(),
            btnContent: $('#btnname').val(),
            btnUrl: $('#btnlink').val(),
            imgUrl: $('#file-refer-path').val(),
            isUse: ($('#useSlide').val()==='true'),
            isBtnUse: ($('#useBtn').val()==='true')
        };
        sliderData[number] = data;
    }

    function parseImgPath(imgPath) {
        parse = imgPath.split('/');
        return parse[(parse.length)-1];
    }

    function fileUploadHandler() {
        const id = currentInput+1;
        $(`#file${"0${id}"}`).click();
    }

    function dataLoad() {
        currentInput = -1;
        $.ajax({
            url: '/json/slide.json',
            async: false,
            dataType: 'json',
            success: function (data) {
                sliderData = data.slides;
                renderInput(0);
            },
            error: function () {
                alert('데이터 불러오기에 실패했습니다.');
            }
        });
        $('input[type=file]').val('');
    }

    $(document).ready(function () {
        dataLoad();
        $('#btn-change-form-1').on('click', () => renderInput(1-1));
        $('#btn-change-form-2').on('click', () => renderInput(2-1));
        $('#btn-change-form-3').on('click', () => renderInput(3-1));
        $('#btn-change-form-4').on('click', () => renderInput(4-1));
        $('#btn-change-form-5').on('click', () => renderInput(5-1));
        $('#btn-reload').on('click', () => dataLoad());
        $('#btn-file-upload').on('click', () => fileUploadHandler());
        let $file = $('input[type=file]');
        // $file.hide();
        $file.on('change', function () {
            const filename = $(this).val().replace(/^.*?([^\\\/]*)$/, '$1');
            const imgPath = "/img/slide/" + filename;
            $('#file-refer-path').val(imgPath);
            $('#file-text').val(parseImgPath(imgPath));
            saveData(currentInput);
        });
        $('#submit').on('click', function () {
            saveData(currentInput);
            let inputData = { slides: sliderData };
            if (!!inputData) {
                $('#sliderjson').val(JSON.stringify(inputData));
                return true;
            } else {
                alert('데이터가 비어있습니다.');
                return false;
            }
        })
    });
</script>
</html>