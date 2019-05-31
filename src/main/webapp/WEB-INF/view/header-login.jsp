<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="nav-upper">
	<div id="nav-search">
		<a class="mdl-button mdl-js-button mdl-button--icon" id="search-dialog">
			<i class="material-icons md-light">search</i>
		</a>
		<dialog class="mdl-dialog search-dialog">
			<form action="#">
				<h4 class="mdl-dialog__title">검색할 프로젝트 제목을 입력해주세요</h4>
				<div class="mdl-dialog__content">
					<div class="mdl-textfield mdl-js-textfield">
						<input class="mdl-textfield__input" type="text" id="search-textbox">
						<label class="mdl-textfield__label" for="search-textbox"></label>
					</div>

				</div>
				<div class="mdl-dialog__actions">
					<button type="button" class="close mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined">취소</button>
					<button type="button" class="mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined">검색</button>
				</div>
			</form>
		</dialog>
	</div>
	<div id="nav-member">
		<ul>
			<li><a href="/login">로그인</a></li>
			<li><a href="/register">회원가입</a></li>
		</ul>
	</div>
</div>
<script>
	var dialog = document.querySelector('dialog');
	var showDialogButton = document.querySelector('#search-dialog');
	if (! dialog.showModal) {
		dialogPolyfill.registerDialog(dialog);
	}
	showDialogButton.addEventListener('click', function() {
		dialog.showModal();
	});
	dialog.querySelector('.close').addEventListener('click', function() {
		dialog.close();
	});
</script>