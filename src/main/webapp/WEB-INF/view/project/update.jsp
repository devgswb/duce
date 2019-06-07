<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<%-- 해당 글을 작성한 유저가 맞는지 체크 --%>
<sec:authentication var="user" property="principal"/>
<sec:authorize access="hasAuthority('admin')" var="isAdmin"/>
<c:if test="${!(user.id == board.id || isAdmin)}">
    <script>
        alert("올바르지 못한 접근입니다.");
        window.history.foward();
    </script>
</c:if>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>대림대학교 캡스톤 전시관 - 캡스톤 프로젝트 수정</title>
    <!--
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="main.css">
    <script src="main.js"></script>
        -->
    <!-- cdn -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <!-- css -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR|Titillium+Web" rel="stylesheet">
    <!-- web font -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <!-- bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <!-- material -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
    <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    <!-- script -->
    <!-- local css -->
    <link rel="stylesheet" href="/res/css/inwork.css">
</head>
<body>
<jsp:include page="../header-nav.jsp"/>
<!-- Navigation Bar -->
<article>
    <div class="con">
        <div class="notice-write-wrapper">
            <form action="/project/update.do"
                  accept-charset="utf-8"
                  name="write"
                  method="post"
                  enctype="multipart/form-data">
                <div class="notice-write-wrapper-header">프로젝트 소개글 수정</div>
                <div class="form-group">
                    <div class="project-title-wrapper">
                        <input name="id" type="hidden" value="${user.id}" required/> <%-- 나중에 시큐리티를 통해 작성자 id를 받을 히든 필드 --%>
                        <input type="hidden" name="pNo" value="${board.pNo}" required/>
                        <input type="text" class="form-control" name="title" id="subject" placeholder="제목"
                               value="${board.title}" required>
                        <div class="form-group">
                            <select class="form-control" name="major" id="major" required>
                                <option value="">---전공---</option>
                                <c:forEach var="major" items="${majorList}">
                                    <option value="${major.majorNo}" ${major.majorNo == board.majorNo ? "selected" : "" }>${major.major}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <select class="form-control" name="branch" id="branch" required>
                                <option value="">---분류---</option>
                                <c:forEach var="branch" items="${branchList}">
                                    <option value="${branch.branchNo}" ${branch.branchNo == board.branchNo ? "selected" : "" }>${branch.branch}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <textarea class="form-control" rows="16" name="content" id="contents"
                              placeholder="내용" required>${board.content}</textarea>
                </div>
                <div class="project-date-wrapper">
                    <input type="text" class="form-control" name="startDate" id="startDate"
                           value="${startDate}" placeholder="시작시기 (2019-01)"
                           pattern="[1-2][9|0]\d\d-(0[1-9]|1[0-2])"
                           oninput="setCustomValidity('');
                                checkValidity();
                                setCustomValidity(validity.valid ? '' :'올바른 년-월 양식대로 입력해주세요.');"
                           required>
                    <input type="text" class="form-control" name="finishDate" id="finishDate"
                           value="${finishDate}" placeholder="완료시기 (2019-11)"
                           pattern="[1-2][9|0]\d\d-(0[1-9]|1[0-2])"
                           oninput="setCustomValidity('');
                                checkValidity();
                                setCustomValidity(validity.valid ? '' :'올바른 년-월 양식대로 입력해주세요.');"
                           required>
                </div>
                <div class="project-coop-wrapper">
                    <input type="text" value="${board.guide}" class="form-control" name="guide" id="professor"
                           placeholder="지도 교수"
                           pattern="([가-힣]){2,12}$"
                           oninput="setCustomValidity('');
                                checkValidity();
                                setCustomValidity(validity.valid ? '' :'2자 이상의 한국어 이름으로 입력해주세요.');"
                           required>
                    <input type="text" value="${board.part}" class="form-control" name="part" id="students"
                           placeholder="참여 학생. 참여 학생은 ',' 단위로 구분해주세요."
                           pattern="(([가-힣]+),?(?!.*\2))+[가-힣]$"
                           oninput="setCustomValidity('');
                                checkValidity();
                                setCustomValidity(validity.valid ? '' :'올바른 양식이 아닙니다. (입력 예: 홍길동,김철수,김영희)');"
                           required>
                </div>
                <div class="notice-write-attach-addr">
                    <p>처음 올린 이미지는 대표 이미지가 됩니다. </p><br>
                    <!--     파일 추가 -->
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--file">
                        <div class="mdl-button mdl-button--primary mdl-button--icon mdl-button--file">
                            <i class="material-icons">attach_file</i><input type="file" name="uploadFile" id="img-upload-btn"
                                                                            accept="image/jpeg, image/jpg, image/png, image/webp" multiple>
                        </div>
                        <input multiple class="mdl-textfield__input" placeholder="이미지 파일 추가"
                               type="text" id="img-upload-text" readonly/> 					
                    </div>

                    <label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="switch-1">
                        <input type="checkbox" value="true" name="imgsDelete" id="switch-1" class="mdl-switch__input" checked>
                        <span class="mdl-switch__label">기존 이미지 삭제</span>
                    </label>
                    <!--     파일 추가 -->
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--file">
                        <div class="mdl-button mdl-button--primary mdl-button--icon mdl-button--file">
                            <i class="material-icons">attach_file</i><input type="file" name="uploadAddFile" id="file-upload-btn" multiple>
                        </div>
                        <input multiple class="mdl-textfield__input" placeholder="참조 파일 추가"
                               type="text" id="file-upload-text" readonly/>             
                    </div>
                    <label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="switch-2">
                        <input type="checkbox" value="true" name="filesDelete" id="switch-2" class="mdl-switch__input" checked>
                        <span class="mdl-switch__label">기존 파일 삭제</span>
                    </label>
                </div>
                <input type="text" class="form-control" name="video" id="movielink"
                       value="${board.video}"
                       pattern="(^(https?):\/\/([a-z0-9-]+\.)+[a-z0-9]{2,4}.*$)|([a-z]{1,16}$)"
                       oninput="setCustomValidity('');
                                checkValidity();
                                setCustomValidity(validity.valid ? '' :'유튜브 영상 코드나 영상 주소(http://~)를 입력해주세요.');"
                       placeholder="업로드한 Youtube 영상 주소를 적어주세요.">
                <input type="text" value="${board.reference}" class="form-control" name="reference" id="referlink"
                       pattern="^(https?):\/\/([a-z0-9-]+\.)+[a-z0-9]{2,4}.*$"
                       oninput="setCustomValidity('');
                                checkValidity();
                                setCustomValidity(validity.valid ? '' :'올바른 주소를 입력해주세요.');"
                       placeholder="참조 주소">
                <button type="submit"
                        class="mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined "
                id="submit">
                    수정하기
                </button>
                <a href="/project"
                   class="mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined ">취소</a>
                <input type="hidden" name="saveImgs" value="${board.photo}">
                <input type="hidden" name="saveFiles" value="${board.addFile}">
            </form>
        </div>

    </div>
</article>
<jsp:include page="../footer.jsp"/>
<!-- footer -->
</body>
<script type="text/javascript">
    $('#img-upload-btn').change(function () {
        if (this.files.length === 1) {
            $('#img-upload-text').val(this.files[0].name);
        } else {
            $('#img-upload-text').val(this.files[0].name + " 외 " + (this.files.length - 1) + "개");
        }
    });

    $('#file-upload-btn').change(function () {
        if (this.files.length === 1) {
            $('#file-upload-text').val(this.files[0].name);
        } else {
            $('#file-upload-text').val(this.files[0].name + " 외 " + (this.files.length - 1) + "개");
        }
    });
    function validateDate() {
        let startDate = document.getElementById("startDate").value;
        let endDate = document.getElementById("finishDate").value;
        let dtStartDate = new Date(startDate);
        let dtEndDate = new Date(endDate);
        if (dtStartDate.getTime() > dtEndDate.getTime()) {
            alert('시작시기는 종료시기보다 빨라야만 합니다.');
            return false;
        } else {
            return true;
        }
    }
    document.getElementById("submit").onclick = validateDate;
</script>
</html>
<%----%>