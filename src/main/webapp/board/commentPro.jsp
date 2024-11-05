<<<<<<< Updated upstream:src/main/webapp/board/commentPro.jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 댓글 commentPro --%>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardDTO" %>
<%-- 글삭제 deleteForm --%>
<h1>deleteForm.jsp</h1>
<% int post_id = Integer.parseInt(request.getParameter("post_id")); 
   String pageNum = request.getParameter("pageNum"); 
%>
<center><b>글삭제</b>
<br />
<form action="deletePro.jsp?pageNum=<%= pageNum %>" method="post">
<table border="1" align="center" cellpadding="0" cellspacing="0" width="300">
    <tr height="30">
        <td align="center">
            <b>비밀번호를 입력해주세요.</b>
        </td>
    </tr>
    <tr height="30">
        <td align="center">
            <input type="password" name="bo_password" size="10" maxlength="15" />
            <input type="hidden" name="post_id" value="<%= post_id %>" />
        </td>
    </tr>
    <tr height="30">
        <td align="center">
            <input type="submit" value="글삭제" />
            <input type="button" value="글목록" 
            onclick="document.location.href='contentList.jsp?pageNum=<%= pageNum %>'" />
        </td>
    </tr>
</table>
</form>
</center>
>>>>>>> Stashed changes:project-pet/src/main/webapp/board/deleteForm.jsp
