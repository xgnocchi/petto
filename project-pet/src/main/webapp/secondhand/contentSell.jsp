<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="secondhand.ItemInfoDAO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="secondhand.ItemCategoryDAO" %>
<%@ page import="secondhand.AnimCategoryDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="styleSheet" href="../resources/css/defaultSet.css" />
<link rel="styleSheet" href="../resources/css/writeSellForm.css" />
<jsp:useBean id="dto" class="secondhand.ItemInfoDTO" />
<jsp:setProperty name="dto" property="*" />
<jsp:useBean id="userDto" class="user.UserDTO" />
<jsp:setProperty name="userDto" property="*" />
<% 
	ItemInfoDAO infoDao = ItemInfoDAO.getInstance();
	request.setCharacterEncoding("UTF-8");
	int itemNum = Integer.parseInt(request.getParameter("itemNum"));
	dto = infoDao.itemContent(itemNum);
	String userId = (String)session.getAttribute("sid");
	UserDAO userDao = UserDAO.getInstance();
	userDto = userDao.getUserInfo(userId);
	ItemCategoryDAO cateDao = ItemCategoryDAO.getInstance();
	AnimCategoryDAO animDao = AnimCategoryDAO.getInstance();
%>
<script>
	function addFav() {
		window.open('addFav.jsp?itemNum=<%=dto.getItemNum() %>&name=<%=dto.getName() %>&price=<%=dto.getPrice()%>','confirm', 'width=400,height=200');
	}
</script>		
<title>중고 물품 판매글</title>
</head>
<body>
<div class="divListPart">
<table border="1">
<tbody>
	<tr height="30px">
		<td width="100" align="center">상품명</td>
		<td width="700" colspan="5"><%=dto.getName() %></td>
	</tr>
	<tr height="30px">
		<td width="100" align="center">품목</td>
		<td width="700" colspan="5"><%=cateDao.getItem(dto.getItemId()) %></td>
	</tr>
	<tr height="30px">
		<td width="100" align="center">동물 분류</td>
		<td width="700" colspan="5"><%=animDao.getAnim(dto.getAnimId()) %></td>
	</tr>
	<tr height="30px">
		<td width="100" align="center">작성자</td>
		<td width="200" align="center"><%=dto.getNick() %></td>
		<td width="150" align="center">작성 날짜</td>
		<td width="200" align="center"><%=dto.getReg() %></td>
		<td width="100" align="center">조회수</td>
		<td width="50" align="center"><%=dto.getViewCount() %></td>
	</tr>
	<tr height="30px">
		<td width="100" align="center">거래 상태</td>
		<td width="100" align="center"><%=(dto.getIsSelling() == 1 ) ? "판매중" : "판매 종료"%></td>
		<td width="100" align="center">상품 상태</td>
		<td width="100" align="center"><%=(dto.getCondition() == 0 ) ? "미개봉" : ((dto.getCondition() ==  1) ? "거의 새 것" : "사용감 있음" )%></td>
		<td colspan="2"></td>
	</tr>
	<tr height="300px">
		<td width="100" align="center">상세 내용</td>
		<td width="700" colspan="5"><%=dto.getContent() %></td>
	</tr>
<%	if(dto.getImg() != null){%>
	<tr height="200px">
		<td width="100" align="center">첨부 사진</td>
		<td width="700" colspan="5">
		<img src="<%= request.getContextPath() %>/images/<%=dto.getImg() %>" style="width: 100%; height: auto; max-width: 150px;"/>
		</td>
	</tr>
<%	} %>
<%	if(session.getAttribute("sid") != null && userDto.getIdx() == dto.getIdx()) { %>
	<tr height="30px">
		<td align="right" colspan="6">
			<button onclick="window.location='updateSellForm.jsp?itemNum=<%=dto.getItemNum() %>'">판매글 수정</button>
			<button onclick="window.location='deleteSell.jsp?itemNum=<%=dto.getItemNum() %>'">판매글 삭제</button>
		</td>
	</tr>
<%	} %>
<%	if(session.getAttribute("sid") != null && userDto.getIdx() != dto.getIdx()) { %>
	<tr height="30px">
		<td align="right" colspan="6">
			<button onclick="addFav();">찜목록에 추가</button>
		</td>
	</tr>
<%	} %>
	<tr height="30px">
		<td align="right" colspan="6">
			<button onclick="window.location='secondhandMain.jsp'">메인 페이지로 이동</button>
		</td>
	</tr>
</tbody>
</table>
</div>
</body>
</html>