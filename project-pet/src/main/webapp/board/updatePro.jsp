<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.io.File" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardDTO" %>
<jsp:useBean id="dto" class="board.BoardDTO">
    <jsp:setProperty name="dto" property="*" />
</jsp:useBean>

<h1>게시글 수정</h1>

<%
String filePath = request.getRealPath("board/imagessave/"); // 파일업로드 처리
int max = 1024 * 1024 * 5; // 파일 크기
String enc = "UTF-8"; // 인코딩
DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy(); // 덮어쓰기 방지

try {
    // MultipartRequest 객체 생성
    MultipartRequest mr = new MultipartRequest(request, filePath, max, enc, dp);

    // 입력된 데이터 가져오기
    int post_id = Integer.parseInt(mr.getParameter("post_id")); // 게시글 ID
    String title_head = mr.getParameter("title_head"); // 글머리
    String bo_title = mr.getParameter("bo_title"); // 글 제목
    String bo_content = mr.getParameter("bo_content"); // 글 내용
    String bo_img = mr.getFilesystemName("bo_img"); // 변경 img 이름
    String orgBo_img = mr.getParameter("orgBo_img"); // 기존 img 이름
    String bo_password = mr.getParameter("bo_password"); // 비밀번호
    String pageNum = mr.getParameter("pageNum"); // 페이지 번호
    if (pageNum == null || pageNum.isEmpty()) {
        pageNum = "1"; // 기본값 설정
    }
    // DAO 인스턴스 가져오기
    BoardDAO dao = BoardDAO.getInstance();

    // DTO에 데이터 설정
    dto.setPost_id(post_id);
    dto.setTitle_head(title_head);
    dto.setBo_title(bo_title);
    dto.setBo_password(mr.getParameter("bo_password")); // 비밀번호 설정
    dto.setBo_content(bo_content);
    dto.setBo_password(bo_password); // 비밀번호 설정

    // 이미지 처리
    if (bo_img != null) { // 새 이미지가 있는 경우
        // 기존 이미지 파일 삭제
        File f = new File(filePath, orgBo_img);
        if (f.exists() && !f.isDirectory()) {
            f.delete(); // 기존 파일 삭제
        }
        dto.setBo_img(bo_img); // 새 이미지 설정
    } else { // 이미지 수정 없음
        dto.setBo_img(orgBo_img); // 기존 이미지 유지
    }

    // 데이터베이스 업데이트
    int result = dao.boardUpPro(dto);

    // 결과에 따라 메시지 출력
    if (result > 0) {
%>
        <script>
            alert("글이 수정되었습니다.");
            window.location = "contentList.jsp?pageNum=<%= pageNum %>";
        </script>
<%
    } else {
%>
        <script>
            alert("비밀번호가 맞지 않습니다.");
            history.go(-1);
        </script>
<%
    }
} catch (IllegalArgumentException e) {
%>
    <script>
        alert("업로드된 파일이 너무 큽니다.");
        history.go(-1);
    </script>
<%
} catch (Exception e) {
%>
    <script>
        alert("파일 업로드 중 오류가 발생했습니다: <%= e.getMessage() %>");
        history.go(-1);
    </script>
<%
}
%>
