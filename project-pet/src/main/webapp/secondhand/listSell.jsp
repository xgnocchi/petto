<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="secondhand.ItemInfoDAO" %>
<%@ page import="secondhand.ItemInfoDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="styleSheet" href="../resources/css/defaultSet.css" />
<%	request.setCharacterEncoding("UTF-8"); %>
<%
	int onlySell = 0;
	if (request.getParameter("onlySell") != null){	
		onlySell = Integer.parseInt(request.getParameter("onlySell"));
	}
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
<div class="divListPart">
<p align="right">
<%	if (onlySell == 1) { %>
		<button onclick="window.location='listSell.jsp?onlySell=0'">전체 판매글 보기</button>
<%	} else { %>
		<button onclick="window.location='listSell.jsp?onlySell=1'">판매중 상품만 보기</button>
<%	} %>
</p>
<table width="800">
	<tbody align="center">
		<tr align="center">
			<th width="100">상품 번호</th>
			<th width="100">거래 상태</th>
			<th width="200">상품명</th>
			<th width="100">가격</th>
			<th width="100">작성자</th>
			<th width="50">조회수</th>
			<th width="150">작성날짜</th>
		</tr>
<%
		ArrayList<ItemInfoDTO> list = dao.list(startRow, endRow, onlySell);
		for( ItemInfoDTO dto : list ){
%>
		<tr>
			<td><%=dto.getItemNum() %></td>
			<td><%=(dto.getIsSelling() == 1 ) ? "판매중" : "판매 종료"%></td>
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
<p align="center">
<%
	// 글 개수
	int count = dao.count(onlySell);
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
%>			<a href="listSell.jsp?pageNum=<%=startPage - 10%>&onlySell=<%=onlySell%>">[이전]</a>
<%		}
		// [][][]...
		for(int i = startPage; i <= endPage; i++){
%>			<a href="listSell.jsp?pageNum=<%=i%>&onlySell=<%=onlySell%>">[<%=i%>]</a>
<%		}
		// [다음] 페이지
		if(endPage < pageCount){
%>			<a href="listSell.jsp?pageNum=<%=startPage + 10%>&onlySell=<%=onlySell%>">[다음]</a>
<%		}
	}
%>
</p>
<p align="right">
<%	if(session.getAttribute("sid") != null) { %>
		<button onclick="window.location='writeSellForm1.jsp'">판매 글쓰기</button>
<%	} %>
<button onclick="window.location='secondhandMain.jsp'">메인 페이지로 이동</button>
</p>
</div>
</body>
</html>
