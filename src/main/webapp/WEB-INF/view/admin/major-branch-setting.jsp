<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <jsp:include page="./admin-tab.jsp"/>
        <div class="admin-tab-content">
            <div class="admin-title">
                학과/분야 관리
                <hr/>
            </div>
            <%-- 전공 --%>
            <div class="admin-mb-majortable-wrapper">
                <p>학과 관리</p>
                <table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
                    <thead>
                    <tr>
                        <th>선택</th>
                        <th>학과코드</th>
                        <th>학과명</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${majorList}" var="major">
                        <tr class="majorRow">
                            <td>
                                <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect"
                                       for="chkb${major.majorNo}">
                                    <input type="checkbox" id="chkb${major.majorNo}" class="mdl-checkbox__input">
                                </label>
                            </td>
                            <input type="hidden" value="${major.majorNo}" class="formermajorno" required>
                            <td><input type="text" value="${major.majorNo}" class="txtmajorno mdl-textfield__input"
                                       required></td>
                            <td><input type="text" value="${major.major}" class="txtmajor mdl-textfield__input"
                                       required>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="btn-wrapper">
                    <form action="/admin/m/mod.do" method="post">
                        <input type="hidden" name="_method" value="delete"/>
                        <input type="hidden" name="majorlist" value="" id="delete-major-list">
                        <button class="mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined "
                                id="btnDeleteMajor" class="btnDelete">삭제
                        </button>
                    </form>
                    <form action="/admin/m/mod.do" method="post">
                        <input type="hidden" name="_method" value="patch"/>
                        <input type="hidden" name="majorlist" value="" id="update-majorlist">
                        <button class="mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined "
                                id="btnModMajor">수정
                        </button>
                    </form>
                </div>
            </div>
            <div class="major-add-wrapper">
                <form action="/admin/m/mod.do" method="post">
                    <div id="addMajorBox">
                        <p>학과 추가</p>
                        <div class="form-group">
                        <label for="majorNo">학과 코드</label>
                        <input type="text" class="form-control" name="majorNo" id="majorNo" required>
                    </div>
                        <div class="form-group">
                            <label for="major">학과명</label>
                            <input type="text" class="form-control" name="major" id="major" required>
                        </div>
                    </div>
                    <button class="mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined " id="btnAddMajor">추가</button>
                </form>
            </div>
            <%-- 분야 --%>
            <div class="admin-mb-branchtable-wrapper">
                <p>분야 관리</p>
                <table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp" id="branchwrapper">
                    <thead>
                    <tr>
                        <th>선택</th>
                        <th>분야코드</th>
                        <th>분야명</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${branchList}" var="branch">
                        <tr class="branchRow">
                            <td><label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect"
                                       for="chkb${branch.branchNo}">
                                <input type="checkbox" id="chkb${branch.branchNo}" class="mdl-checkbox__input">
                            </label></td>
                            <input type="hidden" value="${branch.branchNo}" class="formerbranchno" required>
                            <td><input type="text" value="${branch.branchNo}" class="txtbranchno mdl-textfield__input" required></td>
                            <td><input type="text" value="${branch.branch}" class="txtbranch mdl-textfield__input" required></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="btn-wrapper">
                    <form action="/admin/b/mod.do" method="post">
                        <input type="hidden" name="_method" value="delete"/>
                        <input type="hidden" name="branchlist" value="" id="delete-branch-list">
                        <button class="mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined "
                                id="btnDeleteBranch" class="btnDelete">삭제
                        </button>
                    </form>
                    <form action="/admin/b/mod.do" method="post">
                        <input type="hidden" name="_method" value="patch"/>
                        <input type="hidden" name="branchlist" value="" id="update-branchlist">
                        <button class="mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined "
                                id="btnModBranch">수정
                        </button>
                    </form>
                </div>
            </div>
            <div class="branch-add-wrapper">
                <form action="/admin/b/mod.do" method="post">
                    <div id="addBranchBox">
                        <p>분야 추가</p>
                        <div class="form-group">
                            <label for="addBranchNo">분야 코드</label>
                            <input type="text" class="form-control" name="branchNo" id="addBranchNo" required>
                        </div>
                        <div class="form-group">
                            <label for="addBranch">분야명</label>
                            <input type="text" class="form-control" name="branch" id="addBranch" required>
                        </div>
                    </div>
                    <button class="mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined "
                            id="btnAddBranch">추가
                    </button>
                </form>
            </div>
        </div>
    </div>
    <!-- contents box -->
</article>
<jsp:include page="../footer.jsp"/>
<!-- footer -->
</body>
<script>
    $('#btnDeleteMajor').on('click', function () {
        let majorCodes = $('input:checkbox:checked').map(function () {
            let $majorRow = $(this).closest('.majorRow');
            if ($majorRow.length) {
                return $majorRow.find('.txtmajorno').val();
            }
            return null;
        });
        if (majorCodes.length) {
            majorCodes = {list: [...majorCodes]};
            $('#delete-major-list').val(JSON.stringify(majorCodes));
            return deleteCheck();
        } else {
            alert('선택된 데이터가 없습니다!');
            return false;
        }

    });

    $('#btnModMajor').on('click', function () {
        let majorCodes = $('input:checkbox:checked').map(function () {
            let $majorRow = $(this).closest('.majorRow');
            if ($majorRow.length) {
                let major = {
                    "majorNo": $majorRow.find('.txtmajorno').val(),
                    "major": $majorRow.find('.txtmajor').val(),
                    "former": $majorRow.find('.formermajorno').val()
                };
                return major
            }
            return null;
        });
        if (majorCodes.length) {
            majorCodes = {list: [...majorCodes]};
            $('#update-majorlist').val(JSON.stringify(majorCodes));
            return true;
        } else {
            alert('선택된 데이터가 없습니다!');
            return false;
        }
    });

    $('#btnDeleteBranch').on('click', function () {
        let branchCodes = $('input:checkbox:checked').map(function () {
            let $branchRow = $(this).closest('.branchRow');
            if ($branchRow.length) {
                return $branchRow.find('.txtbranchno').val();
            }
            return null;
        });
        if (branchCodes.length) {
            branchCodes = {list: [...branchCodes]};
            $('#delete-branch-list').val(JSON.stringify(branchCodes));
            return deleteCheck();
        } else {
            alert('선택된 데이터가 없습니다!');
            return false;
        }

    });

    $('#btnModBranch').on('click', function () {
        let branchCodes = $('input:checkbox:checked').map(function () {
            let $branchRow = $(this).closest('.branchRow');
            if ($branchRow.length) {
                let branch = {
                    "branchNo": $branchRow.find('.txtbranchno').val(),
                    "branch": $branchRow.find('.txtbranch').val(),
                    "former": $branchRow.find('.formerbranchno').val()
                };
                return branch
            }
            return null;
        });
        if (branchCodes.length) {
            branchCodes = {list: [...branchCodes]};
            $('#update-branchlist').val(JSON.stringify(branchCodes));
            return true;
        } else {
            alert('선택된 데이터가 없습니다!');
            return false;
        }
    });

    function deleteCheck() {
        let isOk = confirm("정말로 삭제하시겠습니까?");
        if (isOk) {
            return true;
        } else {
            return false;
        }
    }
</script>
</html>