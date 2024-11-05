<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardDTO" %>
<%-- 글수정 updateForm --%>
<h1>updateForm.jsp</h1>
<script type="text/javascript" src="../js/script.js"></script>
<%
    String postIdParam = request.getParameter("post_id");
    int post_id = 0; // 기본값 설정
    if (postIdParam != null && !postIdParam.isEmpty()) {
        post_id = Integer.parseInt(postIdParam);
    } else {
        out.println("<script>alert('게시글 ID가 필요합니다.'); location.href='contentList.jsp';</script>");
        return; // 더 이상 진행하지 않도록 함
    }

    String pageNum = request.getParameter("pageNum");
    BoardDAO dao = BoardDAO.getInstance();
    BoardDTO dto = dao.boardUpForm(post_id);
%>

<form action="updatePro.jsp?pageNum=<%= pageNum %>" method="post" name="writeForm" enctype="multipart/form-data" onsubmit="return writeCheck()">
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
		<td width="100" align="center">비밀번호</td>
		<td width="300">
			<input type="password" name="bo_password" required />
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
        <%
        if (dto.getBo_img() == null) {
        %>
            <input type="file" name="bo_img" />
        <%
        } else {
        %>
            변경 이미지: <input type="file" name="bo_img" />
            <input type="hidden" name="orgBo_img" value="<%= dto.getBo_img() %>" />
            <img src="board/imagessave/<%= dto.getBo_img() %>" alt="현재 이미지" /><br />
        <%
        }
        %>
    </td>
</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="글수정" />
			<input type="reset" value="다시작성" />
			<input type="button" value="글목록" onclick="document.location.href='contentList.jsp?pageNum=<%= pageNum %>'" />
		</td>
	</tr>
</table>
</form>
