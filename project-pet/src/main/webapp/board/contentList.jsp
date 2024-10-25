<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 게시판 글목록 contentList --%>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardDTO" %>
<%@ page import="java.util.ArrayList"%>
<%
	int pageSize = 10;    // 한 페이지에 보여질 글의 개수
	String pageNum = request.getParameter("pageNum");    // 페이지 번호
	if(pageNum == null) {    // 페이지 번호가 없는 경우
		pageNum = "1";    // 기본값 1 대입
	}
	int currentPage = Integer.parseInt(pageNum);    // 현재 페이지
	int startRow = (currentPage-1) * pageSize + 1;    // 한 페이지에서 보여지는 첫번째 글번호    // (1-1)*10+1 = 1
	int endRow = currentPage * pageSize;    // 한 페이지에서 보여지는 마지막 글번호    // 1*10 = 10
	int count = 0;    // 글 개수
	
	ArrayList<BoardDTO> list = null;
//	BoardDAO dao = BoardDAO.getInstance();
//	count = dao.-----();
	if( count > 0 ) {    // 글 개수 > 0
//		list = dao.-----(startRow, endRow);
	}
%>
<center>
<table width = "1500">
	<tr>
		<td align = "right">
			<a href = "../user/loginForm.jsp">로그인</a>
			<a href = "writeForm.jsp">글쓰기</a>
			<a href = "deleteForm.jsp">글삭제</a>
			<a href = "-----.jsp">메인으로</a>
		</td>
	</tr>
</table>
