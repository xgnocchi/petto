<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="secondhand.ItemInfoDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:useBean id="dto" class="secondhand.ItemInfoDTO" />
<jsp:setProperty name="dto" property="*" />
<% 
	ItemInfoDAO dao = ItemInfoDAO.getInstance();
	request.setCharacterEncoding("UTF-8");
	int itemNum = Integer.parseInt(request.getParameter("itemNum")); 
	dto = dao.itemContent(itemNum);
%>
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
<%	if(session.getAttribute("sid") != null) { %>
	<tr>
		<td align="right" colspan="2">
			<button onclick="window.location='updateSellForm.jsp?itemNum=<%=dto.getItemNum() %>'">판매글 수정</button>
			<button onclick="window.location='deleteSell.jsp?itemNum=<%=dto.getItemNum() %>'">판매글 삭제</button>
		</td>
	</tr>
<%	} %>
<%	if(session.getAttribute("sid") != null) { %>
	<tr>
		<td colspan="2">
			<button onclick="window.location='addFav.jsp?itemNum=<%=dto.getItemNum() %>'">찜목록에 추가</button>
		</td>
	</tr>
<%	} %>
</tbody>
</table>
</body>
</html>