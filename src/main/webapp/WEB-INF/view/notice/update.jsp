<!-- jsmb.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
                                        "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 글 쓰기</title>

<script type="text/javascript">
  
        function checkUpdate()
        {
            if(!document.noticeUpdate.noticeTitle.value){
                alert("제목을 입력하세요.");
                return false;
            }
            
            if(!document.noticeUpdate.noticeContent.value){
                alert("내용을 입력하세요.");
                return false;
            }
        }
        
        function checkFDelete()
        {
       	 var fileDelete = confirm("삭제하시겠습니까?")
    	    if(fileDelete == true){
    	        fDelete.action = "/notice/update";
    	    }    
            else
            {
                return false; // 삭제취소
            }

        }
</script>
</head>
<body> 
	<form action="/notice/update.do" accept-charset="utf-8" name="noticeUpdate" method="post" enctype="multipart/form-data" onsubmit="return checkUpdate()">
	 <input type="hidden" value="${noticeNum}" name="noticeNum" />
		<div class="form-group">
			제목<input type="text" name="noticeTitle">
		</div>
		<div class="form-group">
			본문<textarea class="form-control" name="noticeContent" rows="8"></textarea>
		</div>
		<div class="form-group">
		  첨부파일 <input multiple="multiple" type="file" id="inFileName" name="inFileName" value=""/>
		</div>
		<button type="submit" class="btn btn-primary">글수정</button>
	</form>
	<c:forEach var="file" items="${noticeFile}" varStatus="status">
	<form name = "fDelete" method="post" onsubmit="return checkFDelete()">
		<div>	
         ${file.outFileName}(${file.fileSize/1024}Byte)
         <input type="hidden" name="noticeNum" value="${notice.noticeNum}">
         <button name="outFileName" id="outFileName" value="${file.outFileName}">파일삭제</button>
         </div>
    </form>
    </c:forEach>
</body>

</html>
