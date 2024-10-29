<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 게시판 글목록 contentList --%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardDTO" %>
<%
	int pageSize = 10;    // 한 페이지에 보여질 글의 개수
	String pageNum = request.getParameter("pageNum");    // 페이지 번호
	if(pageNum == null) {    // 페이지 번호가 없을 경우
		pageNum = "1";    // 기본값 1 넣어줌
	}
	int currentPage = Integer.parseInt(pageNum);    // 현재 페이지 - 계산 해야하기 떄문에 정수로
	int startRow = (currentPage -1) * pageSize +1;    // 한 페이지에서 보여지는 첫번째 글번호
	int endRow = currentPage * pageSize;    // 한 페이지에서 보여지는 마지막 글번호
	int count = 0;    // 글 개수
	
	ArrayList<BoardDTO> list = null;
	BoardDAO dao = BoardDAO.getInstance();
	count = dao.count();
	if(count > 0) {    // 글 개수 > 0
		list = dao.boardList(startRow, endRow);
	}
%>
<center><b>글목록 ( 전체 글 : <%= count %> ) </b>
<table width = "1000">
	<tr>
		<td align = "right">
<%		if(session.getAttribute("sid") == null) { %>    <%-- 로그인 되어있지 않을 때 --%>
			<a href = "../user/loginForm.jsp">로그인</a>
			<a href = "writeForm.jsp">글쓰기</a>
			<a href = "-----.jsp">메인으로</a>
<%		} else { %>    <%-- 로그인이 되어있을 때 --%>
			<a href = "../user/logout.jsp">로그아웃</a>
			<a href = "-----.jsp">내 글 목록</a>
			<a href = "writeForm.jsp">글쓰기</a>
			<a href = "-----.jsp">메인으로</a>
<%		} %>
		</td>
	</tr>
</table>
<%	if(count == 0) { %>    <%-- 글이 없는 경우 --%>
<table width = "1000" border = "1" cellpadding = "0" cellspacing = "0" align = "center">
	<tr>
		<td align = "center">
			<h2>게시판에 저장된 글이 없습니다.</h2>
		</td>
	</tr>
</table>
<%	} else { %>    <%-- 글이 있는 경우 --%>
<table width = "1000" border = "1" cellpadding = "0" cellspacing = "0" align = "center">
	<tr height = "30">
		<td align = "center" width = "100">글번호</td>
		<td align = "center" width = "400">글제목</td>
		<td align = "center" width = "150">작성자</td>
		<td align = "center" width = "200">작성일</td>
		<td align = "center" width = "150">조회수</td>
	</tr>
<%
		for(int i=0; i<list.size(); i++) {
			BoardDTO dto = list.get(i);
%>	<tr height = "30">
		<td align = "center" width = "100">
			<%= dto.getPost_id() %>
		</td>
		<td width = "400">
			<a href = "content.jsp?post_id=<%=dto.getPost_id()%>&pageNum=<%=currentPage%>">
			<%= dto.getBo_title() %>
			</a>
<%			if(dto.getBo_img() != null) { %> <%-- 이미지 있음 --%>
				<bo_img src = "../board/imagessave/CLIPS.png" width="20" height="20" />
<%			} %>
		</td>
		<td align = "center" width = "150">
			<%= dto.getBo_writer() %>
		</td>
		<td align = "center" width = "200">
			<%= dto.getBo_reg() %>
		</td>
		<td align = "center" width = "150">
			<%= dto.getBo_view() %>
		</td>
	</tr>	
<%		} %>
</table>
<%	} %>
<%
	if(count > 0) {    // 글이 있는 경우
		int pageCount = count/pageSize + (count%pageSize == 0? 0 : 1);    // 총 페이지 수
		int startPage = (int)((currentPage-1)/10) * 10 + 1;    // 시작 페이지
		int pageBlock = 10;    // [] [] [] [] ..... 10개
		int endPage = startPage + pageBlock - 1;    // 마지막 페이지
		if( endPage > pageCount ) {
			endPage = pageCount;
		}
		if(startPage > 10) {    // [이전]
%>			<a href = "contentList.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>
<%		}
		for(int i=startPage; i<=endPage; i++ ) {    // [] : 페이지번호 링크 버튼
%>			<a href = "contentList.jsp?pageNum=<%= i %>">[<%= i %>]</a>
<%		}
		if( endPage < pageCount -1 ) {
%>			<a href = "contentList.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
<%		}
	}
%>
</center>
