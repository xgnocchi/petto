<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고 물품 거래</title>
</head>
<body>
	secondhandMain	<br />
	<button onclick="window.location='listSell.jsp'">중고 물품 보기</button>
<%	if(session.getAttribute("sid") != null) { %>
		<button onclick="window.location='writeSellForm1.jsp'">중고 물건 팔기</button>
		<button onclick="window.location='favList.jsp'">찜한 상품 보기</button>
<%	} else { %>
		<button onclick="window.location='loginForm.jsp'">로그인</button>
<%	} %>
</body>
</html>