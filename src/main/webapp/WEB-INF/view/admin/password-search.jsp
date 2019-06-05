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
    <h3>비밀번호 변경</h3><br>
    <form action="/admin/pwdchange.do" method="post">
        현재 비밀번호<input type="password" name="pwd" id="pwd"/><br>
        변경할 비밀번호 <input type="password" name="changedpwd" id="changedpwd"/><br>
        비밀번호 체크 <input type="password" id="changedpwdchk"/><br>
        <span id="isPwdSame">비밀번호가 다릅니다.</span><br>
        <button id="submit">비밀번호 변경</button>
    </form>
</body>
<script>
    let isPwdSame = false;
    $('#isPwdSame').hide();
    $('input').on('keyup', function () {
        if ( $('#changedpwd').val() == "" && $('#changedpwdchk').val() == "") {
            isPwdSame = false;
            $('#isPwdSame').hide();
            return;
        }
        if( $('#changedpwd').val() == $('#changedpwdchk').val() ) {
            isPwdSame = true;
            $('#isPwdSame').hide();
        } else {
            isPwdSame = false;
            $('#isPwdSame').show();
        }
    });
    $('#submit').on('click', function () {
        if (isPwdSame) {
            return true;
        } else {
            alert('비밀번호가 올바르지 않습니다.');
            return false;
        }
    });
</script>
</html>