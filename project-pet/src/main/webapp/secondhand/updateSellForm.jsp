<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="secondhand.ItemInfoDAO" %>
<%@ page import="secondhand.ItemCategoryDAO" %>
<%@ page import="secondhand.AnimCategoryDAO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:useBean id="infoDto" class="secondhand.ItemInfoDTO" />
<jsp:setProperty name="infoDto" property="*" />
<%	if(session.getAttribute("sid") == null) {%>
	<script>
		alert("로그인 후 이용가능 합니다.");
		window.location="../user/loginForm.jsp";
	</script>
<%	} %>
<%
	String userId = (String)session.getAttribute("sid");
	UserDAO userDao = UserDAO.getInstance();
	UserDTO userDto = userDao.getUserInfo(userId);
	ItemInfoDAO infoDao = ItemInfoDAO.getInstance();
	int itemNum = Integer.parseInt(request.getParameter("itemNum"));
	infoDto = infoDao.updateLoad(itemNum);
	ItemCategoryDAO itemCateDao = ItemCategoryDAO.getInstance();
	AnimCategoryDAO animCateDao = AnimCategoryDAO.getInstance();
%>
<script src="../resources/js/writeSellForm.js"></script>
<link rel="styleSheet" href="../resources/css/defaultSet.css">
<link rel="stylesheet" href="../resources/css/writeSellForm.css" />
<title>판매글 수정</title>
</head>
<body>
<div class="divListPart">
<form action="updateSellPro.jsp" method="post" name="userInput" onsubmit="return writeCheck()">
<input type="hidden" name="idx" value="<%=userDto.getIdx() %>" />
<input type="hidden" name="nick" value="<%=userDto.getUserNick() %>" />
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
		<select name="itemId">
<%			if(infoDto.getItemId() == 1) {%>
				<option value="1" selected>사료, 간식(용품)</option>
<%			} else { %>
				<option value="1">사료, 간식(용품)</option>
<%			} %>
<%			if(infoDto.getItemId() == 2) {%>
				<option value="2" selected>장난감</option>
<%			} else { %>
				<option value="2">장난감</option>
<%			} %>
<%			if(infoDto.getItemId() == 3) {%>
				<option value="3" selected>배변 용품</option>
<%			} else { %>
				<option value="3">배변 용품</option>
<%			} %>
<%			if(infoDto.getItemId() == 4) {%>
				<option value="4" selected>가구</option>
<%			} else { %>
				<option value="4">가구</option>
<%			} %>
<%			if(infoDto.getItemId() == 5) {%>
				<option value="5" selected>미용, 악세서리</option>
<%			} else { %>
				<option value="5">미용, 악세서리</option>
<%			} %>
<%			if(infoDto.getItemId() == 0) {%>
				<option value="0" selected>기타</option>
<%			} else { %>
				<option value="0">기타</option>
<%			} %>
		</select>
		</td>
	</tr>
	<tr height="30">
		<td>동물 분류</td>
		<td height="16">
		<select name="animId">
<%		if (infoDto.getAnimId() == 1) { %>
			<option value="1" selected>강아지</option>
<%		} else { %>
			<option value="1">강아지</option>
<%		} %>
<%		if (infoDto.getAnimId() == 2) { %>
			<option value="2" selected>고양이</option>
<%		} else { %>
			<option value="2">고양이</option>
<%		} %>
<%		if (infoDto.getAnimId() == 3) { %>
			<option value="3" selected>소동물</option>
<%		} else { %>
			<option value="3">소동물</option>
<%		} %>
<%		if (infoDto.getAnimId() == 0) { %>
			<option value="0" selected>기타</option>
<%		} else { %>
			<option value="0">기타</option>
<%		} %>
		</select>
		</td>
	</tr>
	<tr height="30">
		<td>상품 상태</td>
		<td>
<%			if(infoDto.getCondition() == 0) { %>
				<input type="radio" name="condition" value="0" checked/>
<%			} else { %>
				<input type="radio" name="condition" value="0"/>
<%			} %>
			<label>미개봉</label>		<br />
<%			if(infoDto.getCondition() == 1) { %>
				<input type="radio" name="condition" value="1" checked/>
<%			} else { %>
				<input type="radio" name="condition" value="1"/>
<%			} %>
			<label>거의 새 것</label>	<br />
<%			if(infoDto.getCondition() == 2) { %>
				<input type="radio" name="condition" value="2" checked/>
<%			} else { %>
				<input type="radio" name="condition" value="2"/>
<%			} %>
			<label>사용감 있음</label>	<br />
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
		<td>판매 상태</td>
		<td>
		<input type="radio" name="isSelling" value="1" />
		<label>판매중</label>
		<input type="radio" name="isSelling" value="0" />
		<label>판매 종료</label>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="right">
		<input type="checkbox" name="isUpdateReg" value="1" />
		<label>최신글로 등록</label>
		<input type="submit" value="판매글 수정" />
		</td>
	</tr>
</tbody>
</table>
</form>
</div>
</body>
</html>