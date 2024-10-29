<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../resources/js/writeSellForm.js"></script>
<link rel="stylesheet" href="../resources/css/writeSellForm.css" />
<title>판매글 등록</title>
</head>
<body>
<%
	if(session.getAttribute("sid") == null) {
%>
	<script>
		alert("로그인 후 이용가능 합니다.");
		window.location="loginForm.jsp";
	</script>
<%	} %>
<%
	String userId = (String)session.getAttribute("sid");
	UserDAO dao = UserDAO.getInstance();
	UserDTO dto = dao.getUserInfo(userId);
%>
<form action="writeSellPro.jsp" method="post" name="userInput" onsubmit="return writeCheck()">
<input type="hidden" name="idx" value="<%=dto.getIdx() %>" />
<input type="hidden" name="nick" value="<%=dto.getUserNick() %>" />

<table border="1">
<tbody id="writeTable">
	<tr id="writeName" height="30px">
		<td width="100">상품명</td>
		<td><input type="text" name="name" maxlength="50" class="input_name"/></td>
	</tr>
	<tr height="30">
		<td class="td_set">품목</td>
		<td>
		<select name="itemId">
			<option value="1">사료, 간식(용품)</option>
			<option value="2">장난감</option>
			<option value="3">배변 용품</option>
			<option value="4">가구</option>
			<option value="5">미용, 악세서리</option>
			<option value="0">기타</option>
		</select>
		</td>
	</tr>
	<tr height="30">
		<td>동물 분류</td>
		<td height="16">
		<select name="animId">
			<option value="1">강아지</option>
			<option value="2">고양이</option>
			<option value="3">소동물</option>
			<option value="0">기타</option>
		</select>
		</td>
	</tr>
	<tr height="60px">
		<td>가격</td>
		<td>
			<input type="radio" name="priceActive" value="0" onclick="this.form.price.disabled=true" onclick="this.form.price.value = 0" checked/>
			<label>협의</label>		<br />
			<input type="radio" name="priceActive" value="1" onclick="this.form.price.disabled=false" />
			<label>직접 입력 <br /> : </label>	
			<input type="text" name="price" disabled="disabled"/>
		</td>
	</tr>
	<tr height="300">
		<td>상세 내용</td>
		<td>
		<textarea id="writeContent" name="content"></textarea>
		</td>
	</tr>
	<tr height="30">
		<td>첨부 사진</td>
		<td align="right">
		<input type="file" name="img" />
		</td>
	</tr>
	<tr>
		<td colspan="2" align="right">
		<input type="submit" value="판매 등록" />
		</td>
	</tr>
</tbody>
</table>
</form>
<button onclick="window.location='secondhandMain.jsp'">메인 페이지로 이동</button>
</body>
</html>