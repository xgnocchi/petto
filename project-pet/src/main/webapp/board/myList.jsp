<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardDTO" %>
<%@ page import="java.util.ArrayList" %>
<%-- 내글보기 myList --%>
<h1>내 게시글 목록</h1>
<%
    int pageSize = 20;                                   // 한 페이지에 보여질 글의 수
    String pageNum = request.getParameter("pageNum");   // 페이지 번호
    if (pageNum == null) { pageNum = "1"; }
    int currentPage = Integer.parseInt(pageNum);        // 현재 페이지
    int startRow = (currentPage - 1) * pageSize + 1;    // 한 페이지에서 보여지는 첫번째 글번호
    int endRow = currentPage * pageSize;                // 한 페이지에서 보여지는 마지막 글번호

    BoardDAO dao = BoardDAO.getInstance();
    String loggedInUser = "kong"; // 로그인한 사용자 ID (예시로 "kong" 사용, 실제 로그인 정보로 교체 필요)
    int count = dao.countUserPosts(loggedInUser);       // 로그인한 유저의 게시글 수
    ArrayList<BoardDTO> list = (count > 0) ? dao.myList(startRow, endRow, loggedInUser) : new ArrayList<>();
%>
<center>
    <b>내글 목록 (전체 글: <%= count %>)</b>
    <table width="1000" border="1" cellpadding="0" cellspacing="0" align="center">
        <tr height="30">
            <td align="center" width="100">글번호</td>
            <td align="center" width="500">글제목</td>
            <td align="center" width="100">작성자</td>
            <td align="center" width="200">작성일</td>
            <td align="center" width="100">조회수</td>
        </tr>
<%
        for (int i = 0; i < list.size(); i++) {
            BoardDTO dto = list.get(i);
%>      
        <tr height="30">
            <td align="center" width="100">
                <%= dto.getPost_id() %>
            </td>
            <td width="400">
                <a href="content.jsp?post_id=<%= dto.getPost_id() %>&pageNum=<%= currentPage %>">
                    <%= dto.getBo_title() %>
                </a>
<%               if (dto.getBo_img() != null) { %> 
                    <img src="../board/imagessave/<%= dto.getBo_img() %>" width="20" height="20" alt="이미지 있음" />
<%               } %>
            </td>
            <td align="center" width="150">
                <%= dto.getBo_writer() %>
            </td>
            <td align="center" width="200">
                <%= dto.getBo_reg() %>
            </td>
            <td align="center" width="150">
                <%= dto.getBo_view() %>
            </td>
        </tr>  
<%       } %>
    </table>
</center>
