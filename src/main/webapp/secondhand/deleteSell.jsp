<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="secondhand.ItemInfoDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:useBean id="dto" class="secondhand.ItemInfoDTO" />
<jsp:setProperty name="dto" property="*" />
<title>판매글 삭제</title>
</head>
<body>
<script>
	var check = confirm("정말 판매글을 삭제하시겠습니까?");
	if (check) {
<%
		int itemNum = Integer.parseInt(request.getParameter("itemNum"));
		ItemInfoDAO dao = ItemInfoDAO.getInstance();
		boolean result = dao.deleteSell(itemNum);
%>
<%		if(result) {%>
			alert("판매글 삭제가 완료되었습니다.");
			window.location="secondhandMain.jsp";
<%		} else { %>
			alert("오류 발생! 판매글로 돌아갑니다.");
			history.go(-1);
<%		} %>
	} else {
		alert("판매글로 돌아갑니다.");
		history.go(-1);
	}
</script>
</body>
</html>