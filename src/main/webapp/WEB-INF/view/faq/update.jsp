<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
                                        "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FAQ 글 쓰기</title>
</head>
<body> 
	<form action="/faq/update.do" accept-charset="utf-8" method="post">
		<input type="hidden" value="${faqNum}" name="faqNum" />
		<div class="form-group">
		   <select name="faqCategory">
		      <option value="결제"<c:out value="${faq.faqCategory == '결제' ? 'selected' : ''}"/>>결제</option>
		      <option value="로그인"<c:out value="${faq.faqCategory == '로그인' ? 'selected' : ''}"/>>로그인</option>
		      <option value="기타"<c:out value="${faq.faqCategory == '기타' ? 'selected' : ''}"/>>기타</option>
	       </select>
	    </div>
	    
		<div class="form-group">
			제목<input type="text" name="faqTitle">
		</div>
		
		<div class="form-group">
			본문<textarea class="form-control" name="faqContent" rows="8"></textarea>
		</div>
		
		<button type="submit" class="btn btn-primary">글수정</button>
	</form>	
	<button type="button"><a href="/faq/list">목록으로</a></button>
</html>