<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.CategoryDTO" %>
<%@ page import="board.CategoryDAO" %> 
<%-- 글내용 content --%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardDTO" %>
<h1> content.jsp</h1>
<%
	int post_id = Integer.parseInt(request.getParameter("post_id"));	// 글번호
	String pageNum = request.getParameter("pageNum");					// 페이지 번호
	String sid = (String)session.getAttribute("sid");					// 세션

	BoardDAO dao = BoardDAO.getInstance();
	BoardDTO dto = dao.content(post_id);
%>
<table width = "1000" border = "1" cellpadding = "0" cellspacing = "0" align = "center">
	<tr height = "30">
		<td align = "center" width = "100">글번호</td>
		<td align = "center" width = "100"><%= dto.getPost_id() %></td>
		<td align = "center" width = "100">
			<select name="글머리" >
				<option value="강아지" >강아지</option>
				<option value="고양이" >고양이</option>
				<option value="소동물" >소동물</option>
				<option value="기타" >기타</option>
			</select>
		</td>
		<td align = "center" width = "100">글제목</td>
		<td align = "center" width = "600"><%= dto.getBo_title() %></td>
	</tr>
</table>
<table width = "1000" border = "1" cellpadding = "0" cell spacing = "0" align = "center">
	<tr height = "30">
		<td align = "center" width = "100">작성자</td>
		<td align = "center" width = "315"><%= dto.getBo_writer() %></td>
		<td align = "center" width = "100">조회수</td>
		<td align = "center" width = "100"><%= dto.getBo_view() %></td>
		<td align = "center" width = "100">추천수</td>
		<td align = "center" width = "100"><%= dto.getBo_like() %></td>
		<td align = "center" width = "200">|추천버튼|</td>
	</tr>
</table>
<table width = "1000" border = "1" cellpadding = "0" cell spacing = "0" align = "center">
	<tr height = "30">
		<td align = "center" width = "100">작성일</td>
		<td align = "center" width = "315"><%= dto.getBo_reg() %></td>
		<td align = "center" width = "100">수정일</td>
		<td align = "center" width = "200"><%= dto.getBo_update() %></td>
		<td align = "center" width = "100">삭제일</td>
		<td align = "center" width = "200"><%= dto.getBo_deldate() %></td>
	</tr>
</table>    <br />
<table width = "1000" border = "1" cellpadding = "0" cell spacing = "0" align = "center">
	<tr height = "500">
		<td align = "left" width = "1000">
<%				if(dto.getBo_img() == null) { %>    <%-- 이미지가 없을 경우 --%>
					<img src = "../board/imagessave/no-img.png" width = "100" height = "100" />
<%				} else { %>    <%-- 이미지가 있는 경우 --%>
					<img src = "../board/uploadImagessave/<%=dto.getBo_img() %>" />
<%				} %> <br />
			<%=dto.getBo_content() %>
		</td>
	</tr>
</table>
<br /><br /><br />
<table width = "1000" border = "1" cellpadding = "0" cell spacing = "0" align = "center">
	<tr height = "30">
		<td align = "center" width = "1000">댓글</td>
	</tr>
</table>
