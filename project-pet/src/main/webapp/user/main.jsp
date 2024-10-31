<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
</head>
<body>
<p>메인입니다.</p>
	<%
		String sid = (String)session.getAttribute("sid");
		if(sid==null){ //로그인 상태 아님
	%>
	<input type="button" value="회원가입" onclick="window.location='insertForm.jsp'"/> <br/>
	<input type="button" value="로그인" onclick="window.location='loginForm.jsp'"/> <br/>
	<% }else{ //로그인 상태 %>
	<h3>[<%=sid %>]님 환영합니다.</h3>
	<input type="button" value="회원탈퇴" onclick="window.location='deleteForm.jsp'"/>
	<input type="button" value="로그아웃" onclick="window.location='logout.jsp'"/>
	<input type="button" value="마이페이지" onclick="window.location='myPage.jsp'"/>

	<%} %> 
</body>
</html>