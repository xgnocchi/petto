<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardDAO" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.File" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%-- 글쓰기 writePro --%>
<h1>writePro.jsp</h1>
<jsp:useBean id="dto" class="board.BoardDTO">
	<jsp:setProperty name="dto" property="*" />
</jsp:useBean>

<%
	String filePath = application.getRealPath("board/imagessave");    // 파일 경로
	int max = 1024*1024*5;    // 파일 크기
	String enc="UTF-8";    // 인코딩
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();    // 파일 이름 덮어쓰기 방지
	MultipartRequest mr = new MultipartRequest(request, filePath, max, enc, dp);    // 파일업로드 처리
	
	String title = mr.getParameter("title");
	String img = mr.getFilesystemName("img");
	
	dto.setBo_title(bo_title);
	dto.setImg(img);
	BoardDAO dao = BoardDAO.getInstance();
	int result = dao.boardWrite(dto);
	if( result == 1 ) {
%>
<script>
	alert("글이 등록되었습니다.");
	window.location="contentList.jsp";
</script>
<%	} %>
 