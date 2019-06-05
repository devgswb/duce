<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script
            src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<h3>전공/분야 설정</h3><br>
<%-- 전공 --%>
<form action="/admin/m/mod.do" method="post">
    <input type="hidden" name="_method" value="patch"/>
    <table>
        <thead>
        <tr>
            <th>선택</th>
            <th>전공코드</th>
            <th>전공명</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${majorList}" var="major">
            <tr class="majorRow">
                <td><input type="checkbox"/></td>
                <input type="hidden" value="${major.majorNo}" class="formermajorno" required>
                <td><input type="text" value="${major.majorNo}" class="txtmajorno" required></td>
                <td><input type="text" value="${major.major}" class="txtmajor" required></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <input type="hidden" name="majorlist" value="" id="update-majorlist">
    <button id="btnModMajor">수정</button>
</form>
<form action="/admin/m/mod.do" method="post">
    <input type="hidden" name="_method" value="delete"/>
    <input type="hidden" name="majorlist" value="" id="delete-major-list">
    <button id="btnDeleteMajor" class="btnDelete">삭제</button>
</form>

<form action="/admin/m/mod.do" method="post">
    <div id="addMajorBox">
        <h3>전공 추가</h3>
        전공코드<input type="text" name="majorNo" required> <br>
        전공명<input type="text" name="major" required>
    </div>
    <button id="btnAddMajor">추가</button>
</form>
<%-- 분야 --%>
<form action="/admin/b/mod.do" method="post">
    <input type="hidden" name="_method" value="patch"/>
    <table id="branchwrapper">
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
                <td><input type="checkbox"/></td>
                <input type="hidden" value="${branch.branchNo}" class="formerbranchno" required>
                <td><input type="text" value="${branch.branchNo}" class="txtbranchno" required></td>
                <td><input type="text" value="${branch.branch}" class="txtbranch" required></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <input type="hidden" name="branchlist" value="" id="update-branchlist">
    <button id="btnModBranch">수정</button>
</form>
<form action="/admin/b/mod.do" method="post">
    <input type="hidden" name="_method" value="delete"/>
    <input type="hidden" name="branchlist" value="" id="delete-branch-list">
    <button id="btnDeleteBranch" class="btnDelete">삭제</button>
</form>
<form action="/admin/b/mod.do" method="post">
    <div id="addBranchBox">
        <h3>분야 추가</h3>
        분야코드<input type="text" name="branchNo" required> <br>
        분야명<input type="text" name="branch" required>
    </div>
    <button id="btnAddBranch">추가</button>
</form>
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
            majorCodes = {list : [...majorCodes]};
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
                    "majorNo" : $majorRow.find('.txtmajorno').val(),
                    "major" : $majorRow.find('.txtmajor').val(),
                    "former" : $majorRow.find('.formermajorno').val()
                };
                return major
            }
            return null;
        });
        if (majorCodes.length) {
            majorCodes = {list : [...majorCodes]};
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
            branchCodes = {list : [...branchCodes]};
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
                    "branchNo" : $branchRow.find('.txtbranchno').val(),
                    "branch" : $branchRow.find('.txtbranch').val(),
                    "former" : $branchRow.find('.formerbranchno').val()
                };
                return branch
            }
            return null;
        });
        if (branchCodes.length) {
            branchCodes = {list : [...branchCodes]};
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