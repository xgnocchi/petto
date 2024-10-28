<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="secondhand.ItemInfoDAO" %>
<%@ page import="secondhand.ItemCategoryDAO" %>
<%@ page import="secondhand.AnimCategoryDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:useBean id="infoDto" class="secondhand.ItemInfoDTO" />
<jsp:setProperty name="infoDto" property="*" />
<%
	ItemInfoDAO infoDao = ItemInfoDAO.getInstance();
	int itemNum = Integer.parseInt(request.getParameter("itemNum"));
	infoDto = infoDao.updateLoad(itemNum);
	ItemCategoryDAO itemCateDao = ItemCategoryDAO.getInstance();
	AnimCategoryDAO animCateDao = AnimCategoryDAO.getInstance();
%>
<script src="../resources/js/writeSellForm.js"></script>
<link rel="stylesheet" href="../resources/css/writeSellForm.css" />
<title>판매글 수정</title>
</head>
<body>
<form action="updateSellPro.jsp" method="post" name="userInput" onsubmit="return writeCheck()">
<%-- 로그인 처리후 수정 	--%>
<input type="hidden" name="idx" value="1" />
<input type="hidden" name="nick" value="q" />
<%-- 				--%>

<input type="hidden" name="itemNum" value="<%=itemNum %>" />
<table border="1">
<tbody id="writeTable">
	<tr id="writeName" height="30px">
		<td width="100">상품명</td>
		<td><input type="text" name="name" maxlength="50" class="input_name" value="<%=infoDto.getName()%>"/></td>
	</tr>
	<tr height="30">
		<td class="td_set">품목</td>
		<td>
		<%=itemCateDao.getItem(infoDto.getItemId()) %>
		</td>
	</tr>
	<tr height="30">
		<td>동물 분류</td>
		<td height="16">
		<%=animCateDao.getItem(infoDto.getAnimId()) %>
		</td>
	</tr>
	<tr height="60px">
		<td>가격</td>
		<td>
<%		if (infoDto.getPrice() == 0) { %>
			<input type="radio" name="priceActive" value="0" onclick="this.form.price.disabled=true" onclick="this.form.price.value = 0" checked/>
			<label>협의</label>		<br />
			<input type="radio" name="priceActive" value="1" onclick="this.form.price.disabled=false" />
			<label>직접 입력 <br /> : </label>	
			<input type="text" name="price" disabled="disabled"/>
<%		} else { %>
			<input type="radio" name="priceActive" value="0" onclick="this.form.price.disabled=true" onclick="this.form.price.value = 0" />
			<label>협의</label>		<br />
			<input type="radio" name="priceActive" value="1" onclick="this.form.price.disabled=false" checked/>
			<label>직접 입력 <br /> : </label>	
			<input type="text" name="price" value="<%=infoDto.getPrice() %>" />
<%		} %>
		</td>
	</tr>
	<tr height="300">
		<td>상세 내용</td>
		<td>
		<textarea id="writeContent" name="content"><%=infoDto.getContent() %></textarea>
		</td>
	</tr>
	<tr height="30">
		<td>첨부 사진</td>
		<td align="right">
		<input type="file" name="img" value="<%=infoDto.getImg() %>"/>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="right">
		<input type="checkbox" name="isUpdateReg" value="1" />최신글로 등록
		<input type="submit" value="판매글 수정" />
		</td>
	</tr>
</tbody>
</table>
</form>
</body>
</html>