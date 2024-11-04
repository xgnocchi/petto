<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.io.File" %>
<%@ page import="board.BoardDAO" %>
<jsp:useBean id="dto" class="board.BoardDTO">
	<jsp:setProperty name="dto" property="*" />
</jsp:useBean>
<%-- 글 수정 처리 updatePro --%>
<h1>updatePro.jsp</h1>
<%
	String filePath=request.getRealPath("board/imagessave/");    // 파일업로드 처리    // 업로드 경로
	int max=1024*1024*5;    // 파일 크기
	String enc="UTF-8";    // 인코딩
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();    // 덮어쓰기 방지
	MultipartRequest mr = new MultipartRequest(request, filePath, max, enc, dp);
	String bo_title = mr.getParameter("bo_title");
	String bo_img = mr.getFilesystemName("bo_img");    // 변경 img 이름
	String orgBo_img = mr.getParameter("orgBo_img");    // 기존 img 이름
	int post_id = Integer.parseInt(mr.getParameter("post_id"));    // 글번호
	String pageNum=mr.getParameter("pageNum");    // 페이지 번호

	dto.setPost_id(post_id);
	dto.setBo_title(bo_title);
	dto.setBo_img(bo_img);
	if( bo_img == null ) { // 수정 X = 기존 img 이름
		dto.setBo_img(orgBo_img);
	} else { // 수정 O = 기존 파일 삭제
		File f = new File(filePath+"/"+orgBo_img); // views/upload/기존 img 이름
		f.delete(); // 기존 파일 삭제
	}
	BoardDAO dao = BoardDAO.getInstance();    // DB 작업
	int result = dao.boardUpPro(dto);
	if( result == 1 ) { // 정상적으로 글 수정
%>
<<script>
	alert("글이 수정되었습니다");
	window.location="list.jsp?pageNum=<%=pageNum%>";
</script>
<%	} else { %>
<script>
	alert("비밀번호가 맞지 않습니다.");
	history.go(-1);
</script>
<%	} %>



















<%--
    // 입력된 데이터 가져오기
    int post_id = Integer.parseInt(request.getParameter("post_id")); // 게시글 ID
    String title_head = request.getParameter("title_head"); // 글머리
    String bo_title = request.getParameter("bo_title"); // 글 제목
    String bo_content = request.getParameter("bo_content"); // 글 내용
    String bo_img = request.getParameter("bo_img"); // 이미지
    String bo_password = request.getParameter("bo_password"); // 비밀번호

    // DAO 인스턴스 가져오기
    BoardDAO dao = BoardDAO.getInstance();
    BoardDTO dto = new BoardDTO();
    
    // DTO에 데이터 설정
    dto.setPost_id(post_id);
    dto.setTitle_head(title_head);
    dto.setBo_title(bo_title);
    dto.setBo_content(bo_content);
    dto.setBo_img(bo_img);
    dto.setBo_password(bo_password); // 비밀번호 설정

    // 데이터베이스 업데이트
    int result = dao.boardUpPro(dto);
    
    // 결과에 따라 메시지 출력
    if(result > 0) {
%>
        <p>게시글 수정이 완료되었습니다.</p>
        <p><a href="list.jsp?pageNum=<%= request.getParameter("pageNum") %>">글 목록으로 돌아가기</a></p>
<%
    } else {
%>
        <p>게시글 수정에 실패했습니다. 비밀번호를 확인해 주세요.</p>
        <p><a href="updateForm.jsp?post_id=<%= post_id %>&pageNum=<%= request.getParameter("pageNum") %>">수정 페이지로 돌아가기</a></p>
<%
    }
--%>
