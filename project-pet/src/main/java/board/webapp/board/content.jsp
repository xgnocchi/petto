<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardDTO" %>
<%-- 글내용 content --%>
<h1> content.jsp</h1>
<%
	String sid = (String)session.getAttribute("sid");    // 세션
	int post_id = Integer.parseInt(request.getParameter("post_id"));    // 글번호
	String pageNum = request.getParameter("pageNum");    // 페이지 번호
	
	BoardDAO dao = BoardDAO.getInstance();
	BoardDTO dto = dao.content(post_id);
	

%>
<center><b>글내용</b>
<br />

<table width="1000" border="1" cellpadding="0" cellspaciong="0" align="center" >
	<tr height="30">
		<td align="center" width="125">글번호</td>
		<td align="center" width="125">
			<%= dto.getPost_id() %>
		</td>
		<td align="center" width="125">조회수</td>
		<td align="center" width="125">
			<%= dto.getBo_view() %>
		</td>
		<td align="center" width="125">추천여부</td>
		<td align="center" width="125">
			<%= dto.getBo_like() %>
		</td>
	</tr>
	<tr height="30">
		<td align="center" width="125">글머리</td>
		<td align="center" width="375" colspan="3">
			<%= dto.getTitle_head() %>
		</td>
		<td align="center" width="125">글제목</td>
		<td align="center" width="375" colspan="3">
			<%= dto.getBo_title() %>
		</td>
		<td align="center" width="125">작성자</td>
		<td align="center" width="125">
			<%= dto.getBo_writer() %>
		</td>
	<tr height="30">
		<td align="center" width="125">글내용</td>
		<td align="center" width="125" colspan="3">
			<pre><%= dto.getBo_content() %></pre>
		</td>
	</tr>
	<tr height="30">
		<td align="center" width="125">작성일</td>
		<td align="center" width="125">
			<%= dto.getBo_reg() %>
		</td>
		<td align="center" width="125">수정일</td>
		<td align="center" width="125">
			<%= dto.getBo_update() %>
		</td>
		<td align="center" width="125">삭제일</td>
		<td align="center" width="125">
			<%= dto.getBo_deldate() %>
		</td>
	</tr>
</table>
</center>
