<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.UserDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<script src="../resources/js/user.js"></script>
</head>
<body>
<%
	UserDTO dto = new UserDTO();
	UserDAO dao = UserDAO.getInstance();
	String sid = (String)session.getAttribute("sid");
	dto = dao.userInfo(sid);
	
	if(sid==null){
		response.sendRedirect("loginForm.jsp");
		return;
	}
%>
<h3>회원정보 수정</h3>
<form onsubmit="return submitUpdateForm()" name="userInput" action="updateInfoPro.jsp" method="post" enctype="multipart/form-data">
	<div>
<%
		if(dto.getProfileImg()==null){
%>
			<p><img alt="기본 프로필 사진" src="../resources/image/profile-image.png"  width="100" height="100"></p>
<%
		}else{
%>
			<p><img id="preview" alt="프로필 미리보기 이미지" src="../resources/image/<%=dto.getProfileImg()%>" width="100" height="100"> </p>
<%		
}
%>		이미지 변경:
		<input type="file" name="img" accept="image/*" onchange="previewImage(event)" value="<%=dto.getProfileImg() %>"/> <br/>
		<input type="hidden" name="orgImg" value="<%=dto.getProfileImg() %>"/> <br/>
	<%--<img alt="" src="/project-pet/resources/image/<%=dto.getProfileImg() %>"/><br/>--%> 

		<label for="userId">아이디</label>
		<input id="userId" name="userId" value="<%=sid%>" readonly/>
		<br/>
		<a>비밀번호</a>
		<%--토글형태로 보이게 js작업 --%>
		<div style="display:none;">
			<div>
				<label for="currentPw">현재 비밀번호</label>
				<input id="currentPw" type="password" name="userPw"/>
			</div>
			<div>
				<label for="newPw">새 비밀번호</label>
				<input id="newPw" type="password" name="newPw"/>
			</div>
			<div>
				<label for="newPw2">새 비밀번호 확인</label>
				<input id="newPw2" type="password" name="newPw2"/>
			</div>
		</div>
		<br>
		<label for="email">이메일</label>
		<input id="email" type="text" name="email" id="email" value="<%=dto.getEmail() %>"/>
		<div id="emailMessage"></div>
		<br>
		<label for="nick">닉네임</label>
		<input id="nick" type="text" name="userNick" value="<%=dto.getUserNick()%>"/>
		<div id="nickMessage"></div>
	</div>
	<input type="submit" value="확인"/>
	<button type="button" onclick="history.go(-1)">취소</button>
</form>

</body>
</html>