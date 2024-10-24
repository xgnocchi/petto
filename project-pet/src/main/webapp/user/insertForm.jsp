<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--회원가입 폼--%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 폼</title>
</head>
<body>
<%--memcheck 관리할 script 폴더 만들기 --%>
    	<form action="insertPro.jsp" method="post" name="userInput" onsubmit="return memCheck()">
		id : 	<input type="text" name="id" id="id"/> <br/>
				<input type="button" value="중복확인" onclick="idCheck();"/> <br/>
				<div id="idResult"></div>
		pw : 	<input type="password" name="pw"/> <br/>
		pw 확인 : <input type="password" name="pw2"/> <br/>
		이름 : 	<input type="text" name="name"/> <br/>
		생일 :	<input type="date" name="birth"/> <br/>
		통신사 : 	<select name="phone1">
					<option value="none">선택</option>
					<option value="KT">KT</option>
					<option value="SKT">SKT</option>
					<option value="Uplus">U+</option>
					<option value="알뜰폰">알뜰폰</option>					
				</select> <br/>
		전화번호:	<input type="text" name="phone2" placeholder="01012345678 형식"/> <br/>
		성별 : 	<input type="radio" name="gender" value="m"/>남
				<input type="radio" name="gender" value="w"/>여 <br/>
				<input type="submit" value="확인"/>
</body>
</html>