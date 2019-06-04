<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form action="findpass" method="post">
	<fieldset>
		<legend>비밀번호 찾기</legend>
		<p>가입 시 입력한 이메일로 임시 비밀번호가 전송됩니다</p>
		<div>
			<label for="id">아이디(학번)</label> <input type="text" id="id" name="id"
				autofocus required />
		</div>
		<div>
			<label for="mail">이메일</label> <input type="text" id="mail"
				name="mail" required />
		</div>

		<div>
			<a href="findid">아이디 찾기</a>
		</div>
		<button type="submit" onclick="btnTransfer_click()">전송</button>
		<Button type="button" onclick="self.close()">닫기</Button>
	</fieldset>
</form>
<script>
	function btnTransfer_click() {
		alert("메일을 확인해 주세요");
	}
</script>