<<<<<<< HEAD
<%@page import="javax.swing.event.ListDataEvent"%>
=======
>>>>>>> 0af717598ebae7b0795f31dad50097cb35657b7a
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="secondhand.FavListDAO" %>
<%@ page import="secondhand.FavListDTO" %>
<<<<<<< HEAD
<%@ page import="secondhand.ItemInfoDAO" %>
=======
>>>>>>> 0af717598ebae7b0795f31dad50097cb35657b7a
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="styleSheet" href="../resources/css/defaultSet.css" />
<%	request.setCharacterEncoding("UTF-8"); %>
<%
	FavListDAO dao = FavListDAO.getInstance();
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
<%
	if(session.getAttribute("sid") == null) {
%>
	<script>
		alert("로그인 후 이용가능 합니다.");
		window.location="../user/loginForm.jsp";
	</script>
<%	} %>
<%
	String userId = (String)session.getAttribute("sid");
	UserDAO userDao = UserDAO.getInstance();
	UserDTO userDto = userDao.getUserInfo(userId);
<<<<<<< HEAD
	ItemInfoDAO infoDao = ItemInfoDAO.getInstance();
=======
>>>>>>> 0af717598ebae7b0795f31dad50097cb35657b7a
	int idx = userDto.getIdx();
	int count = dao.count(idx);
%>
<title>찜 목록</title>
</head>
<body>
<div class="divListPart">
<%	if(count > 0) { %>
	<table width="800">
		<tbody align="center">
			<tr align="center">
				<th width="100">찜 번호</th>
				<th width="100">상품 번호</th>
<<<<<<< HEAD
				<th width="100">판매 상태</th>
				<th width="200">상품명</th>
=======
				<th width="300">상품명</th>
>>>>>>> 0af717598ebae7b0795f31dad50097cb35657b7a
				<th width="100">가격</th>
				<th width="150">찜한 날짜</th>
				<th width="50">삭제</th>
			</tr>
<%
<<<<<<< HEAD
			ArrayList<Integer> listDeleteNum = new ArrayList<Integer>();
=======
>>>>>>> 0af717598ebae7b0795f31dad50097cb35657b7a
			ArrayList<FavListDTO> list = dao.list(startRow, endRow, idx);
			int favListNum = list.size() + 1;
			for( FavListDTO dto : list ){
				favListNum -= 1;
%>		
			<tr>
				<td><%=favListNum %></td>
				<td><%=dto.getItemNum() %></td>
<<<<<<< HEAD
				<td><%=infoDao.getSellingStatus(dto.getItemNum()) == 1 ? "판매중" : "판매 종료" %></td>
				<td>
					<a href="contentSell.jsp?itemNum=<%=dto.getItemNum() %>"><%=dto.getName() %></a>
				</td>	
=======
				<td>
					<a href="contentSell.jsp?itemNum=<%=dto.getItemNum() %>"><%=dto.getName() %></a>
				</td>
>>>>>>> 0af717598ebae7b0795f31dad50097cb35657b7a
<%				if (dto.getPrice() != 0) { %>
					<td><%=dto.getPrice() %></td>
<%				} else { %>
					<td>협의</td>
<%				} %>
				<td><%=dto.getFavDate() %></td>
				<td>
				<button onclick="window.location='deleteFav.jsp?favNum=<%=dto.getFavNum() %>'">삭제</button>
				</td>
			</tr>
<%			} %>
		</tbody>
	</table>
<%	} %>
	<p align="center">
<%
	// 글 개수
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
	</p>
<%		}
	} else {
%>
	<h2 align="center">찜 목록에 상품이 없습니다.</h2>
<%	} %>
<p align="right">
	<button onclick="window.location='writeSellForm1.jsp'">판매 글쓰기</button>
	<button onclick="window.location='secondhandMain.jsp'">메인 페이지로 이동</button>
<p>
</div>
</body>
</html>
