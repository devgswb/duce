<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="kr.ac.duce.controller.ProjectBoardController" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
    <!-- css -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR|Titillium+Web" rel="stylesheet">
    <!-- web font -->
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <!-- material -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
    <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    <!-- bootstrap4 -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <!-- script -->
    <!-- local css -->
    <link rel="stylesheet" href="/res/css/inwork.css">
</head>
<body>
<jsp:include page="../header-nav.jsp"/>
<!-- Navigation Bar -->
<article>
    <div class="admin-con">
        <jsp:include page="./mypage-tab.jsp"/>
        <div class="mypage-tab-content">
            <div class="admin-title">
                소개글 수정
                <hr/>
            </div>
            <!--     파일 추가 -->
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--file">
                <button class="mdl-button mdl-button--primary mdl-button--icon mdl-button--file" id="btn-file-upload">
                    <i class="material-icons">attach_file</i>
                </button>
                <input class="mdl-textfield__input" placeholder="이미지 업로드" type="text" id="txtimg"
                       readonly/>
            </div>
            <form:form action="/admin/intro/mod.do" method="post" enctype="multipart/form-data">
                <label for="content">내용</label>
                <textarea class="form-control" rows="8" name="content" id="content"></textarea>
                <input type="file" class="none" name="file" id="file"
                       accept="image/jpg, image/jpeg, image/webp, image/png">
                <input type="hidden" id="img">
                <div class="btn-wrapper">
                    <button id="submit"
                            class="mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined ">
                        저장
                    </button>
                    <button class="mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined" id="reload">
                        되돌리기<i class="material-icons">cached</i>
                    </button>
                </div>
            </form:form>

        </div>
    </div>
    <!-- contents box -->
</article>
<jsp:include page="../footer.jsp"/>
<!-- footer -->
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
        $('#btn-file-upload').on('click', function () {
            $('#file').click();
        });
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