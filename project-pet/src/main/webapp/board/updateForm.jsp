<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardDTO" %>
<%-- 글수정 updateForm --%>
<h1>updateForm.jsp</h1>
<script type="text/javascript" src="../js/script.js"></script>
<%
	int post_id = Integer.parseInt( request.getParameter("post_id") );
	String pageNum = request.getParameter("pageNum");
	BoardDAO dao = BoardDAO.getInstance();
	BoardDTO dto = dao.boardUpForm(post_id);
%>
<form action="updatePro.jsp?pageNum=<%= pageNum %>" method="post" name="writeForm" onsubmit="return writeCheck()">
<table width="400" border="1" cellpadding="0" cellspacing="0" align="center">
	<tr>
		<td width="100" align="center">글머리</td>
		<td width="300">
			<%= dto.getTitle_head() %>
			<input type="hidden" name="title_head" maxlength="10" size="40" value="<%= dto.getTitle_head() %>" />
			<input type="hidden" name="post_id" value="<%= dto.getPost_id() %>" />
		</td>
	</tr>
	<tr>
		<td width="100" align="center">글제목</td>
		<td width="300">
			<input type="text" name="bo_title" maxlength="100" size="40" value="<%= dto.getBo_title() %>" required />
		</td>
	</tr>
	<tr>
		<td width="100" align="center">글내용</td>
		<td width="300">
			<textarea name="bo_content" rows="15" cols="40" required><%= dto.getBo_content() %></textarea>
		</td>
	</tr>
	<tr>
		<td width="100" align="center">이미지</td>
		<td width="300">
			<input type="text" name="bo_img" size="40" maxlength="255" value="
<%			if( dto.getBo_img() == null ) {    // 이미지가 없을 경우 %>
				img : <input type="file" name="img" /> <br />
<%			} else {    // 이미지가 있을 경우  %>
				변경img :	<input type="file" name="img" /> <br />
						<input type="hidden" name="orgBo_img" value="<%=dto.getBo_img()%>" />
						<img src="/web/views/upload/<%=dto.getBo_img()%>" /> <br />
<%			} %>" />
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="글수정" />
			<input type="reset" value="다시작성" />
			<input type="button" value="글목록" onclick="window.location='list.jsp?pageNum=<%= pageNum %>'" />
		</td>
	</tr>
</table>
</form>
