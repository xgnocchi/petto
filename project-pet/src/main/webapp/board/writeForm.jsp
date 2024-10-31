<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 글쓰기 writeForm --%>
<% request.setCharacterEncoding("UTF-8"); %>
<link rel="stylesheet" type="text/css" href="../style.css">
<script type="text/javascript">
	function check(){
		if (f.bo_writer.value == ""){
			alert("작성자를 입력해 주세요!")
			f.bo_writer.focus()
			return false
		}
		if (f.bo_title.value == ""){
			alert("제목을 입력해 주세요!")
			f.bo_title.focus()
			return false
		}
		if (f.bo_content.value == ""){
			alert("내용을 입력해 주세요!")
			f.bo_content.focus()
			return false
		}
		return true
	}
</script>

<html>
<head>
	<title>글 쓰기</title>
</head>
<body>
<form name="f" action="writePro.jsp" method="post" enctype="multipart/form-data" onsubmit="return check()">

	<div align="center">
		<table border="1" width="1000">
			<tr>
				<td colspan="2" align="center">글작성</td>
			</tr>			
			<tr>	
				<td width="200" align="center">작성자</td>
				<td><input type="text" name="bo_writer"/></td>
			</tr>
			<tr>	
				<td width="200" align="center">제목</td>
				<td><input type="text" name="bo_title" style="width: 100%;"/></td>
			</tr>
			<tr>	
				<td width="200" align="center">이미지</td>
				<td><input type="file" name="bo_img"/></td>
			</tr>
			<tr>	
				<td width="200" align="center">내용</td>
				<td><textarea name="bo_content" style="width: 100%;" rows="15"></textarea></td>
			</tr>
			<tr>	
				<td colspan="2" align="center">
				 	<input type="submit" value="작성"/>
				</td>
			</tr>
		</table>
	</div>
</form>
</body>
</html>
