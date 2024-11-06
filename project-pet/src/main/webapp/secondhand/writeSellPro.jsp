<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.File" %>
<%@ page import="secondhand.ItemInfoDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dto" class="secondhand.ItemInfoDTO" />
<jsp:setProperty name="dto" property="*" />
<%
	//파일 경로
	String filePath = request.getRealPath("images");
	// 파일 크기
	int max = 1024 * 1024 * 5;
	// 인코딩
	String enc = "UTF-8";
	// 파일 이름 덮어쓰기 방지 = 같은 이름 파일들 예 - img1, img2, img3, ...
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();
	// 파일 업로드 처리
	MultipartRequest mr = new MultipartRequest(request, filePath, max, enc, dp);
	
	int idx = Integer.parseInt(mr.getParameter("idx"));
	String nick = mr.getParameter("nick");
	String name = mr.getParameter("name");
	int itemId = Integer.parseInt(mr.getParameter("itemId"));
	int animId = Integer.parseInt(mr.getParameter("animId"));
	int condition = Integer.parseInt(mr.getParameter("condition"));
	String content = mr.getParameter("content");
	String img = mr.getFilesystemName("img");
	File f = mr.getFile("img");
<<<<<<< HEAD
=======
	System.out.println(f.toString());
>>>>>>> 756f78808ed1fc76ab8b8bdd56b74ceaba4dbd2a
	ItemInfoDAO dao = ItemInfoDAO.getInstance();

	dto.setIdx(idx);
	dto.setNick(nick);
	dto.setName(name);
	dto.setItemId(itemId);
	dto.setAnimId(animId);
	dto.setCondition(condition);
	dto.setContent(content);
	dto.setImg(img);
	
	boolean result = dao.writeSell(dto);
%>
<title>판매글 작성 처리 중</title>
</head>
<body>
<%	if (result) { %>
	<script type="text/javascript">
		alert("판매글이 작성되었습니다.");
		window.location="secondhandMain.jsp";
	</script>
<%	} else {%>
	<script>
		alert("오류 발생! 판매글 작성으로 돌아갑니다.");
		history.go(-1);
	</script>
<%	} %>
</body>
</html>