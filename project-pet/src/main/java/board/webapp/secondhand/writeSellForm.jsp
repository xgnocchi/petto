<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	.input_name,.input_pw {
	    height: 22px;
	    font-size: 24px;
	    font-weight: 400;
	    color: #000000;
	    border:none;
	    outline: 0;
	}
	#writeTable{
		align-content:center;
		border: 1;
		width: 400px;
		height: 600px;
		border-color: "#000000";
	}
	#wtiteName{
		height: 25px;
	}
</style>
<title>판매글 등록</title>
</head>
<body>
<form action="writeSellPro.jsp" method="post">
<table border="1">
<tbody id="writeTable">
	<tr id="writeName" height="30px">
		<td>상품명</td>
		<td><input type="text" name="item_name" maxlength="50" class="input_name"/></td>
	</tr>
	<tr>
		<td>품목</td>
		<td></td>
	</tr>
		<tr>
		<td>동물 분류</td>
		<td></td>
	</tr>
		<tr>
		<td>가격</td>
		<td></td>
	</tr>
		<tr>
		<td>상세 내용</td>
		<td></td>
	</tr>
		<tr>
		<td>첨부 사진</td>
		<td></td>
	</tr>
</tbody>
</table>
</form>
</body>
</html>