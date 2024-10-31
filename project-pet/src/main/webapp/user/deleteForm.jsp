<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>    
<jsp:useBean class="user.UserDTO" id="dto"/>
<jsp:setProperty property="*" name="dto"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<script src="../resources/js/user.js" defer></script>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	//세션에서 Id 받아옴
	String sid = (String)session.getAttribute("sid");
	
	//로그인 상태 확인
	if(sid==null){
		response.sendRedirect("loginForm.jsp"); //로그인페이지로 리다이렉트
		return;
	}
%>
	<h2>회원 탈퇴</h2>
	<form action="/project-pet/user/deletePro.jsp" method="post" id="delForm" onsubmit="return isCheck()">
		<p>탈퇴한 아이디는 재사용 및 복구가 불가능합니다.</p>
		<input type="checkbox" id="delCheck"/>
		<label for="delCheck">탈퇴 시 유의사항을 모두 확인하였습니다.</label> <br/>
			아이디 : <span><%=sid %></span> <br/>
			<label for="userPw">비밀번호:</label>
			<input type="password" name="userPw" id="userPw"/> <br/>		
		<a href="main.jsp">메인으로</a> <br/>
		<button onclick="history.go(-1)">취소</button>
		<button type="submit">확인</button>
		
	</form>
</body>
</html>