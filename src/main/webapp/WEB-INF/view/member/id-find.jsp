<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<form action="idsearch" method="post">
	<fieldset>
		<legend>아이디 찾기</legend>
		<p>이름과 휴대폰 번호를 입력해주세요</p>
		<div>
			<label>이름 : </label> <input type="text" id="name" name="name"
				autofocus required />
		</div>
		<div>
			<label>휴대폰 번호 : </label> <input type="text" id="hp" name="hp"
				required />
		</div>
		<br>
		<div>
			<a href="/passwordfind">비밀번호 찾기</a>
		</div>

		<Button type="submit" id="btnFind">찾기</Button>
		<Button type="button" onclick="self.close()">닫기</Button>
	</fieldset>
</form>
<script>
//second == true 이면 alert
$(document).ready(function(){
		if(${second}==true){
			if(${isMatch}==true){
				alert("메일을 확인해주세요");
				window.close();
			}else{
				alert("입력 정보가 틀렸거나 가입되지 않은 사용자입니다");
			}
		
});


</script>