<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--로그인--%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>login</title>
</head>
<body>
	<h2>로그인</h2>
	<form action="loginPro.jsp" method="post">
		id: <input type="text" name="id"/> <br/>
		pw: <input type="password" name="pw"/> <br/>
			<input type="submit" value="로그인"/>
	</form>
</body>
</html>