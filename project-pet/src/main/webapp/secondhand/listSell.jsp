<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="secondhand.ItemInfoDAO" %>
<%@ page import="secondhand.ItemInfoDTO" %>

<%--
	가격, 조회수

	끌올
 --%>

<!DOCTYPE html>
<center>
<html>
<head>
<meta charset="UTF-8">
<%	request.setCharacterEncoding("UTF-8"); %>
<%
	ItemInfoDAO dao = ItemInfoDAO.getInstance();
	// 페이지 처리
	int pageSize = 10;	// 페이지에 보여질 글 개수
	String pageNum = request.getParameter("pageNum");	// 페이지 번호
	if(pageNum == null){	// 페이지 번호가 없을 경우
		pageNum = "1";	// 기본값 1 넣어줌
	}
	// 현재 페이지 계산해야하기 때문에 정수로 변환
	int currentPage = Integer.parseInt(pageNum);
	// 한 페이지에서 보여주는 첫번째 글 번호
	int startRow = (currentPage - 1) * pageSize + 1;
	// 한 페이지에서 보여지는 마지박 글 번호
	int endRow = (currentPage * pageSize);
%>
<title>판매글 목록</title>
</head>
<body>
<table width="1000">
	<tbody align="center">
		<tr align="center">
			<th>상품 번호</th>
			<th>상품명</th>
			<th>가격</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>작성날짜</th>
		</tr>
<%
		ArrayList<ItemInfoDTO> list = dao.list(startRow, endRow);
		for( ItemInfoDTO dto : list ){
%>
		<tr>
			<td><%=dto.getItemNum() %></td>
			<td>
				<a href="contentSell.jsp?itemNum=<%=dto.getItemNum() %>"><%=dto.getName() %></a>
			</td>
<%			if (dto.getPrice() != 0) { %>
				<td><%=dto.getPrice() %></td>
<%			} else { %>
				<td>협의</td>
<%			} %>
			<td><%=dto.getNick() %></td>
			<td><%=dto.getViewCount() %></td>
			<td><%=dto.getReg() %></td>
		</tr>
<%	} %>
	</tbody>
</table>
<%
	// 글 개수
	int count = dao.count();
	if(count > 0){	// 글이 있는 경우 <-> 글 없음
		int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);
		// 시작 페이지 
		int startPage = (int)((currentPage - 1) / 10) * 10 + 1;
		// [1] [2] [3] ... [endPage]
		int pageBlock = 10;
		// 마지막 페이지
		int endPage = startPage + pageBlock - 1;
		if(endPage > pageCount){	// 남아있는 페이지만 표현하는 식
			endPage = pageCount;
		}
		// [이전] 페이지
		if(startPage > 10){
%>			<a href="list.jsp?pageNum=<%=startPage - 10%>">[이전]</a>
<%		}
		// [][][]...
		for(int i = startPage; i <= endPage; i++){
%>			<a href="list.jsp?pageNum=<%=i%>">[<%=i%>]</a>
<%		}
		// [다음] 페이지
		if(endPage < pageCount){
%>			<a href="list.jsp?pageNum=<%=startPage + 10%>">[다음]</a>
<%		}
	}
%>
<button onclick="window.location='writeForm1.jsp'">글쓰기</button>
</body>
</html>
</center>
