<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="secondhand.ItemInfoDAO" %>
<%@ page import="secondhand.FavListDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:useBean id="dto" class="secondhand.ItemInfoDTO" />
<jsp:setProperty name="dto" property="*" />
<title>판매글 삭제중</title>
<%
		int itemNum = Integer.parseInt(request.getParameter("itemNum"));
		ItemInfoDAO dao = ItemInfoDAO.getInstance();
		FavListDAO favDao = FavListDAO.getInstance();
		boolean result1 = dao.deleteSell(itemNum);
		boolean result2 = favDao.deleteItem(itemNum);
%>
</head>
<body>
<script>
<%	if(result1 && result2) {%>
		alert("판매글 삭제가 완료되었습니다.");
		window.location="secondhandMain.jsp";
<%	} else { %>
		alert("오류 발생! 판매글로 돌아갑니다.");
		history.go(-2);
<%	}%>
</script>
</body>
</html>