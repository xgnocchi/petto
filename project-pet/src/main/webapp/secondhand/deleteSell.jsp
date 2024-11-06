<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%	int itemNum = Integer.parseInt(request.getParameter("itemNum")); %>
<title>판매글 삭제</title>
</head>
<body>
<script>
	var check = confirm("정말 판매글을 삭제하시겠습니까?");
	if (!check) {
		alert("판매글로 돌아갑니다.");
		history.go(-1);
	} else {
		window.location="deleteSellPro.jsp?itemNum=<%=itemNum %>";
	}
</script>
</body>
</html>