<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="kr.ac.duce.controller.ProjectBoardController" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>대림대학교 캡스톤 전시관 - 관리자 페이지</title>
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
        <jsp:include page="./admin-tab.jsp"/>
        <div class="mypage-tab-content">
            <div class="admin-title">
                슬라이더 수정
                <hr/>
            </div>
            <c:if test="${!empty success}">
            <div class="alert-box-wrapper">
                <div class="alert alert-success" role="alert">
                    <i class="material-icons">done</i>
                    ${success}
                </div>
            </div>
            </c:if>
            <!--     파일 추가 -->
            <div class="form-group">
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--file">
                <button class="mdl-button mdl-button--primary mdl-button--icon mdl-button--file" id="btn-file-upload">
                    <i class="material-icons">attach_file</i>
                </button>
                <input multiple class="mdl-textfield__input" placeholder="이미지 업로드" type="text" id="file-text"
                       readonly/>
                <input type="hidden" id="file-refer-path">
            </div>
            <label for="btnname">제목</label>
            <input type="text" class="form-control" id="title" placeholder="제목">
            <label for="content">내용</label>
            <textarea class="form-control" rows="8" id="content" placeholder="내용"></textarea>
            <div class="slider-btn-info-wrapper">
                <label for="btnname">버튼 이름</label>
                <input type="text" class="form-control" id="btnname" placeholder="버튼 이름">
                <label for="btnlink">버튼 링크</label>
                <input type="text" class="form-control" id="btnlink" placeholder="버튼 링크">
            </div>
            <div class="slide-btn-wrapper">
                <div class="form-group">
                    <label for="useSlide">슬라이드 사용</label>
                    <select class="form-control" id="useSlide" title="슬라이드 사용">
                        <option value="true">사용</option>
                        <option value="false">사용 안 함</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="useBtn">버튼 사용</label>
                    <select class="form-control" id="useBtn" title="버튼 사용">
                        <option value="true">사용</option>
                        <option value="false">사용 안 함</option>
                    </select>
                </div>
            </div>
            <div class="slider-change-btn-wrapper">
                <button class="mdl-button mdl-js-button mdl-button--icon mdl-button--colored mdl-ti " id="btn-reload">
                    <i class="material-icons">cached</i>
                </button>
                <button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored mdl-color--blue-A200" id="btn-change-form-1">1</button>
                <button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored mdl-color--blue-A200" id="btn-change-form-2">2</button>
                <button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored mdl-color--blue-A200" id="btn-change-form-3">3</button>
                <button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored mdl-color--blue-A200" id="btn-change-form-4">4</button>
                <button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored mdl-color--blue-A200" id="btn-change-form-5">5</button>
            </div>
            <div class="slider-submit-wrapper">
                <form:form action="/admin/slider/mod.do" method="post" enctype="multipart/form-data">
                    <input type="file" id="file01" name="files" value="" class="none" accept="image/jpeg, image/jpg, image/png, image/webp">
                    <input type="file" id="file02" name="files" value="" class="none" accept="image/jpeg, image/jpg, image/png, image/webp">
                    <input type="file" id="file03" name="files" value="" class="none" accept="image/jpeg, image/jpg, image/png, image/webp">
                    <input type="file" id="file04" name="files" value="" class="none" accept="image/jpeg, image/jpg, image/png, image/webp">
                    <input type="file" id="file05" name="files" value="" class="none" accept="image/jpeg, image/jpg, image/png, image/webp">
                    <input type="hidden" id="sliderjson" name="sliderjson">
                    <div class="btn-wrapper">
                    <button id="submit"
                            class="mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined ">저장
                    </button>
                    </div>
                </form:form>
            </div>
            </div>
        </div>
    </div>
    <!-- contents box -->
</article>
<jsp:include page="../footer.jsp"/>
<!-- footer -->
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
        title = data['title'];
        content = data['content'];
        btnContent = data.btnContent;
        btnUrl = data.btnUrl;
        imgUrl = data.imgUrl;
        isUse = data.isUse;
        isBtnUse = data.isBtnUse;
        $('#title').val(title);
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
            title: $('#title').val(),
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