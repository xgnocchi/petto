<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.UserDAO" %>
<%@page import="user.UserDTO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>loginPro</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	UserDTO dto = new UserDTO();
	UserDAO dao = UserDAO.getInstance();

	
	String userId = request.getParameter("id");
	String userPw = request.getParameter("pw");
	dto.setUserId(userId);
	dto.setUserPw(userPw);
	
	boolean result = dao.loginCheck(dto);
	if(result == true){
		session.setAttribute("sid",dto.getUserId());
		response.sendRedirect("main.jsp");
	}else{
%>
	<script>
		alert("아아디와 비밀번호를 확인하세요.");
		history.go(-1); // 로그인하기 전 페이지로 이동
	</script> 

<% }%>
</body>
</html>