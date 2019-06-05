<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

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
		<button type="submit" id="btnClick">전송</button>
		<Button type="button" onclick="self.close()">닫기</Button>
	</fieldset>
</form>
<script>
$(document).ready(function(){
			if(${second}==true){
				if(${isMatch}==true){
					alert("메일을 확인해주세요");
					window.close();
				}else{
					alert("입력 정보가 틀렸거나 가입되지 않은 사용자입니다");
				}
			}else{
				alert('쉣');
			}
});
</script>