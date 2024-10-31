<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="styleSheet" href="../resources/css/defaultSet.css" />
<title>중고 물품 거래</title>
</head>
<body>
<div class="divListPart">
	<p align="center">secondhandMain</p>
	<p align="right">
	<button onclick="window.location='listSell.jsp'">중고 물품 보기</button>
<%	if(session.getAttribute("sid") != null) { %>
		<button onclick="window.location='writeSellForm1.jsp'">중고 물건 팔기</button>
		<button onclick="window.location='favList.jsp'">찜한 상품 보기</button>
<%	} else { %>
		<button onclick="window.location='../user/loginForm.jsp'">로그인</button>
<%	} %>
	</p>
</div>
</body>
</html>
