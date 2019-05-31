<!-- ContentsBoard_write.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
                                        "http://www.w3.org/TR/html4/loose.dtd">
<html>

<script type="text/javascript">
        function checkWrite()
        {
        	var obm = document.getElementById("major");
            var obb = document.getElementById("branch");

            var textm = obm.options[obm.selectedIndex].value;
            var textb = obb.options[obb.selectedIndex].value;
            
            if(!document.write.title.value){
                alert("제목을 입력하세요.");
                return false;
            }

            if(!document.write.content.value){
                alert("본문을 입력하세요.");
                return false;
            }
            
            if(textm == "all"){
                alert("전공을 선택하세요.");
                return false;
            }
            
            if(textb == "all"){
                alert("분야을 선택하세요.");
                return false;
            }
            
            if(!document.write.guide.value){
                alert("지도교수명을 입력하세요.");
                return false;
            }
            
            if(!document.write.part.value){
                alert("참여학생을 입력하세요.");
                return false;
            }
        }
</script>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>전시관 글 쓰기</title>
</head>
<body> 
	<form action="/project/write.do" accept-charset="utf-8" name="write" method="post" enctype="multipart/form-data" onsubmit="return checkWrite()">
		<div class="form-group">
			<label for="exampleInputEmail1">작성자 이름</label> <input type="text"
				class="form-control" name="id" aria-describedby="">
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">제목</label> <input type="text"
				class="form-control" name="title" aria-describedby=""">
		</div>
		<div class="form-group">
			<label for="exampleFormControlTextarea1">본문</label>
			<textarea class="form-control" name="content" rows="8"></textarea>
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">영상</label> <input type="text"
				class="form-control" name="video" aria-describedby=""
				placeholder="등록하려는 영상 주소창의 주소를 복사해서 넣어주세요!">
		</div>
		<div class="form-group">
		
			<label for="exampleInputEmail1">사진</label>
			<input multiple="multiple" type="file" name="uploadFile" id="uploadFile" />
					
		</div>
		<div class="form-group">
		
			<label for="exampleInputEmail1">첨부파일</label>
			<input multiple="multiple" type="file" name="uploadAddFile" id="uploadAddFile" />
					
		</div>
		
		<div class="form-group">
		<label for="exampleInputEmail1">전공</label>
			<select name="major" id="major">
				<option value="all" selected="selected">전공선택</option>
				<c:forEach var="major" items="${majorList}">
					<option value="${major.majorNo}">${major.major}</option>
				</c:forEach>
			</select>
			
		<label for="exampleInputEmail1">분야</label>
			<select name="branch" id="branch">
				<option value="all" selected="selected">분야선택</option>
				<c:forEach var="branch" items="${branchList}">
					<option value="${branch.branchNo}">${branch.branch}</option>
				</c:forEach>
			</select>
			
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">지도교수</label> <input type="text"
				class="form-control" name="guide" aria-describedby="">

			<label for="exampleInputEmail1">참여학생</label> <input type="text"
				class="form-control" name="part" aria-describedby=""
				placeholder="Ex) ○○○, ○○○, ○○○, ○○○">
			<label for="exampleInputEmail1">참고주소</label> <input type="text"
				class="form-control" name="reference" aria-describedby=""
				placeholder="Ex) 주소, 주소 / 복수의 주소의경우 ,로 구분해주세요.">	
		</div>
		<button type="submit" class="btn btn-primary">글쓰기</button>
	</form>
</body>

</html>
