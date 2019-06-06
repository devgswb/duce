<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div class="mypage-tab">
    <div class="mypage-tab-main" id="main-page-man">메인 페이지 관리</div>
    <div class="mypage-tab-sub">
        <a href="/admin/slider"><div>메인 슬라이드 수정</div></a>
        <a href="/admin/intro"><div>소개글 수정</div></a>
    </div>
    <a href="/admin/mb"><div class="mypage-tab-main" id="major-page-man">학과/분야 관리</div></a>
    <a href="/admin/member"><div class="mypage-tab-main" id="member-page-man">회원 관리</div></a>
    <a href="/admin/pwdchange"><div class="mypage-tab-main" id="admin-page-man">관리자 비밀번호 변경</div></a>
</div>
<script>
        $('#main-page-man').on("click", function () {
            $(this).next('div').toggle();
        });
</script>