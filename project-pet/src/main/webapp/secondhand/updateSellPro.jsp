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
	int isUpdateReg = 0;
	if (request.getParameter("isUpdateReg") != null) {
		isUpdateReg = Integer.parseInt(request.getParameter("isUpdateReg"));
	}
	ItemInfoDAO dao = ItemInfoDAO.getInstance();
	boolean result = dao.updateSell(dto, isUpdateReg);
%>
<title>판매글 수정 처리중</title>
</head>
<body>
<%	if (result) { %>
		<script>
			alert("판매글 수정이 완료되었습니다.");
			window.location="secondhandMain.jsp";
		</script>
<%	} else { %>
		<script>
			alert("오류 발생! 판매글 수정 화면으로 돌아갑니다.")
			history.go(-1);
		</script>
<%	} %>
</body>
</html>