<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="secondhand.ItemInfoDAO" %>
<%@ page import="user.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
%>
<script>
	function addFav() {
		window.open('addFav.jsp?itemNum=<%=dto.getItemNum() %>&name=<%=dto.getName() %>&price=<%=dto.getPrice()%>','confirm', 'width=400,height=200');
	}
</script>		
<title>중고 물품 판매글</title>
</head>
<body>
<table>
<tbody>
	<tr>
		<td>상품명</td>
		<td><%=dto.getName() %></td>
	</tr>
	<tr>
		<td>작성자</td>
		<td><%=dto.getNick() %></td>
	</tr>
	<tr>
		<td>작성 날짜</td>
		<td><%=dto.getReg() %></td>
	</tr>
	<tr>
		<td>조회수</td>
		<td><%=dto.getViewCount() %></td>
	</tr>
	<tr>
		<td>상세 내용</td>
		<td><%=dto.getContent() %></td>
	</tr>
	<tr>
		<td>첨부 사진</td>
		<td><%=dto.getImg() %></td>
	</tr>
<%	if(session.getAttribute("sid") != null && userDto.getIdx() == dto.getIdx()) { %>
	<tr>
		<td align="right" colspan="2">
			<button onclick="window.location='updateSellForm.jsp?itemNum=<%=dto.getItemNum() %>'">판매글 수정</button>
			<button onclick="window.location='deleteSell.jsp?itemNum=<%=dto.getItemNum() %>'">판매글 삭제</button>
		</td>
	</tr>
<%	} %>
<%	if(session.getAttribute("sid") != null && userDto.getIdx() != dto.getIdx()) { %>
	<tr>
		<td align="right" colspan="2">
			<button onclick="addFav();">찜목록에 추가</button>
		</td>
	</tr>
<%	} %>
	<tr>
		<td colspan="2">
			<button onclick="window.location='secondhandMain.jsp'">메인 페이지로 이동</button>
		</td>
	</tr>
</tbody>
</table>
</body>
</html>