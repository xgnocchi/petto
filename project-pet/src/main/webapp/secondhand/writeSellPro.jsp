<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	ItemInfoDAO dao = ItemInfoDAO.getInstance();
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