<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
 
		<c:if test="${isMatch eq false}">
				<h3>
					입력 정보가 틀렸거나 <br>가입되지 않은 사용자입니다.
				</h3>		
		</c:if>
		<c:if test="${isMatch eq true and second eq true}">
			<h3>가입시 입력한 메일을 확인해 주세요</h3>
		</c:if>

		<div>
			<a href="/passwordfind">비밀번호 찾기</a>
		</div>

		<Button type="submit" id="btnFind">찾기</Button>
		<Button type="button" onclick="self.close()">닫기</Button>
	</fieldset>
</form>
<script>
//second == true 이면 alert

$(document).ready(
		if(${second}==true){
			if(${isMatch}==true){
				alert("메일을 확인해주세요");
				window.close();
			}else{
				alert("가입되지 않은 사용자입니다");
			}
			
		}
);

	//값이 비었으면 값을 입력해주세요 출력
	/*
	function btnTransfer_click() {
		if(!${isMatch} ){
			alert("가입되지 않은 사용자입니다");
		}else{
			alert("메일을 확인해주세요");
			window.close();
		}
	}
	*/
	// onclick="btnTransfer_click()"
</script>