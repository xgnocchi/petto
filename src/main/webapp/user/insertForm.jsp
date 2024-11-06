<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.UserDAO"%>
<%@page import="user.UserDTO"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <script type="text/javascript" src="../resources/js/user.js"></script>
</head>
<body>
	

<%
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("userId");
		UserDTO dto = new UserDTO();
		UserDAO dao = UserDAO.getInstance();
	
	 	if(userId!=null){
			dto.setUserId(userId);
		}

%>
    	<form action="insertPro.jsp" method="post" name="userInput" onsubmit="return submitForm()">
			<label for="userId">아이디:</label>
			<input type="text" name="userId" id="userId"/>	
			<button type="button" onclick="userCheck()">중복검사</button> <br/>
			<div id="idResult"></div>
			pw : 	<input type="password" name="userPw"/> <br/>
			pw 확인 : <input type="password" name="userPw2"/> <br/>
			<div id="pwMessage"></div>
			닉네임 : <input type="text" name="userNick"/> <br/>
			이메일 : <input type="text" name="email" id="email"/> <br/>
			<div id="emailMessage"></div>
			<button type="submit">가입하기</button>		
		</form>
<%
		
%>		

</body>
</html>
