<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardDTO" %>
<%@ page import="java.io.File"  %>
<%-- 글삭제 deletePro --%>
<<<<<<< Updated upstream:src/main/webapp/board/deletePro.jsp
=======
<h1>deletePro.jsp</h1>

<%
    request.setCharacterEncoding("UTF-8");

    int post_id = Integer.parseInt(request.getParameter("post_id"));
    String pageNum = request.getParameter("pageNum");
    String bo_password = request.getParameter("bo_password");


    BoardDAO dao = BoardDAO.getInstance();
    int result = dao.boardDelete(post_id, bo_password);
    if( result == 1 ) {
%>
<script>
    alert("글이 삭제되었습니다.");
    window.location.href="contentList.jsp?pageNum=<%= pageNum %>";
</script>
<%    } else { %>
<script>
    alert("비밀번호가 맞지 않습니다.");
    history.go(-1);
</script>
<%    } %>
<%--//    Board3DAO dao = Board3DAO.getInstance();        // DB 작업
//    String img = dao.imgDelete(num);
//    String filePath = request.getRealPath("views/upload");        // 서버에 저장된 파일 삭제
//    File f = new File(filePath+"/"+img);    // views/upload/xx.png
//    f.delete();
 --%>
>>>>>>> Stashed changes:project-pet/src/main/webapp/board/deletePro.jsp
