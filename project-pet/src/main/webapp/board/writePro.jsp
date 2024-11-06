<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 글쓰기 writePro --%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dto" class="board.BoardDTO"/>
<%@ page import="board.BoardDAO" %>
<jsp:setProperty property="*" name="dto"/>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>


<%@ page import="java.io.IOException" %>



<%
	BoardDAO dao = BoardDAO.getInstance();

    // ServletContext를 통해 절대 경로를 가져오고
    String filePath = request.getRealPath("board/imagessave");
	int max = 1024*1024*5;	// 파일 크기
	String enc="UTF-8";	// 인코딩
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();	// 파일 이름 덮어쓰기 방지 = 같은 이름 파일들 예-img1,img2,img3...	
    MultipartRequest mr = new MultipartRequest(request, filePath, max, enc, dp); // 파일업로드 처리
	
    String bo_writer = mr.getParameter("bo_writer");
    String bo_title = mr.getParameter("bo_title");
    String bo_content = mr.getParameter("bo_content");
    String bo_img = mr.getFilesystemName("bo_img");
	
    dto.setBo_writer(bo_writer);
    dto.setBo_title(bo_title);
    dto.setBo_content(bo_content);
    dto.setBo_img(bo_img);

	
    int res = dao.boardWrite(dto);
	if (res > 0){%>
		<script type="text/javascript">
			alert("작성 성공 :게시판으로 이동합니다");
			location.href="contentList.jsp";
		</script>
<% 	}else { %>
		<script type="text/javascript">
			alert("작성 실패 : 다시 입력해 주세요");
			location.href="writeForm.jsp";
		</script>
<%	} %>
