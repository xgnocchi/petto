<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserDTO" %>
<%@ page import="secondhand.FavListDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	int favNum = Integer.parseInt(request.getParameter("favNum"));
	String userId = (String)session.getAttribute("sid");
	
	UserDAO userDao = UserDAO.getInstance();
	UserDTO userDto = userDao.getUserInfo(userId);
	int idx = userDto.getIdx();
	
	FavListDAO dao = FavListDAO.getInstance();
	boolean result = dao.deleteFav(favNum, idx);
%>
<title>찜 목록에서 삭제 중</title>
</head>
<body>
<%	if(result) {%>
		<script>
			alert("찜 목록에서 삭제되었습니다.");
			window.location="favList.jsp";
		</script>
<%	} else { %>
		<script>
			alert("오류 발생! 찜 목록으로 돌아갑니다.");
			history.go(-1);
		</script>
<%	} %>
</body>
</html>